From: Atharva Lele <itsatharva@gmail.com>
Date: Thu, 12 Sep 2019 18:17:04 +0530
Subject: [Buildroot] [PATCH v4 2/5] autobuild-run: initial
 implementation of get_reproducibility_failure_reason()
In-Reply-To: <c73a2826-6935-169b-fe2a-836848b225e3@mind.be>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-2-itsatharva@gmail.com>
 <c73a2826-6935-169b-fe2a-836848b225e3@mind.be>
Message-ID: <CABM+sgr=8VsKDqJbfNzrRvzPx+hz2Ke-AK57LhQ0da9hyXjc8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 8, 2019 at 10:36 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Atharva,
>
>  I'm very sorry that I'm so late reviewing this...
>
> On 20/08/2019 16:52, Atharva Lele wrote:
> > Analyze the JSON formatted output from diffoscope and check if
> > the differences are due to a filesystem reproducibility issue
> > or a package reproducibility issue.
> >
> > Also, discard the deltas because they might take up too much space.
> >
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> > ---
> > Changes v2 -> v4:
> >   - Change if-else to try-except
> >   - remove blank line
> > Changes v1 -> v2:
> >   - Refactor using subfunctions and local variables (suggested by Thomas)
> >   - Added comments (suggested by Thomas)
> >   - Use more pythonic loops (suggested by Thomas)
> > ---
> >  scripts/autobuild-run | 88 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >
> > diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> > index 99b57dd..384cf73 100755
> > --- a/scripts/autobuild-run
> > +++ b/scripts/autobuild-run
> > @@ -131,6 +131,7 @@ import csv
> >  import docopt
> >  import errno
> >  import hashlib
> > +import json
> >  import mmap
> >  import multiprocessing
> >  import os
> > @@ -599,6 +600,93 @@ class Builder:
> >          if reject_results():
> >              return
> >
> > +        def get_reproducibility_failure_reason(reproducible_results):
>
>  This function really warrants a docstring. Especially because it does more than
> the title says: it not only returns the reason, but it also updates the JSON
> file with it and changes the way the diffs are stored.
>

That's true.. I'll add it in a future revision.

>  A more pythonesque way to do this would be
>
> added = [line for line in delta if line.startswith("+")]
>

Man.. 3 months coding mostly in python and its still hard to code the
python way. ;)
Thanks!

> > +
> > +            def get_package(sourcef):
> > +                # Returns which package the source file belongs to.
> > +                with open(packages_file_list, "r") as packagef:
>
>  It is strange to have packages_file_list defined at a higher scope and then
> used within this function. I think it's better to move its definition inside
> this function as well.
>

Right, thanks!

> > +                    for line in packagef:
> > +                        if sourcef in line:
> > +                            package = line.split(',')[0]
>
>  I think it is better to keep a list of packages for the JSON output, and use
> the last one for the reason output. So here you would have:
>
>  packages = [line.split(',', 1)[0] for line in packagef if sourcef in line]
>

Alright, I'll switch it.

>
> > +
> > +                try:
> > +                    # Get package version
> > +                    package_info = json.loads(subprocess.check_output(["make", "--no-print-directory",
> > +                                                                       "O=%s" % self.outputdir,
> > +                                                                       "-C", self.srcdir,
> > +                                                                       "%s-show-info" % package]))
> > +                    if "version" in package_info[package]:
> > +                        version = package_info[package]["version"]
> > +                        return [package, version]
>
>  I don't know how useful it is to extract the package version... It is currently
> part of the reason file mostly by accident, I think.
>

I kept it purely because it was being reported on the autobuilder site
since before I started work. I read the comments from you and Thomas'
and I agree that we'd just need to manually check things. So it
doesn't make sense to go the extra efforts of extracting the version
here. I'll remove it for the next version of the patch.

> > +                    else:
> > +                        return [package]
> > +                except:
> > +                    return ["not found"]
> > +
> > +            def cleanup(l):
> > +                # Takes a list and removes data which is redundant (source2) or data
> > +                # that might take up too much space (like huge diffs).
> > +                if "unified_diff" in l:
> > +                    l.pop("unified_diff")
>
>  Condition can be avoided with
>
>  l.pop("unified_diff", None)
>
> (or maybe that's only python3? I'm not used to legacy python any more :-)
>

That is valid for dictionaries, even in python2. However, we are
passing a list element to cleanup() and list.pop() only takes in 1
argument i.e. the index.

> > +                if "source2" in l:
> > +                    l.pop("source2")
> > +
> > +            packages_file_list = os.path.join(self.outputdir, "build", "packages-file-list.txt")
> > +
> > +            with open(reproducible_results, "r") as reproduciblef:
> > +                json_data = json.load(reproduciblef)
> > +
> > +            if json_data["unified_diff"] == None:
>
>  == None makes little sense - you should just use 'not' in that case. If you
> really want to check that it's None, you should use 'is None'.  However, do you
> really get a null entry in the json output? Isn't it that the "unified_diff"
> section is missing in the json output? In that case, the
> json_data["unified_diff"] would give a KeyError exception...

I do get a null entry in the json output. unified_diff is not missing
but rather set to null. I should use 'is None' then. Thanks!

>
> > +                # Remove the file list because it is not useful, i.e. it only shows
> > +                # which files vary, and nothing more.
> > +                if json_data["details"][0]["source1"] == "file list":
> > +                    json_data["details"].pop(0)
> > +
> > +                # Iterate over details in the diffoscope output.
> > +                for item in json_data["details"]:
> > +                    diff_src = item["source1"]
> > +                    item["package"] = get_package(diff_src)
> > +
> > +                    # In some cases, diffoscope uses multiple commands to get various
> > +                    # diffs. Due to this, it generates a "details" key for those files
> > +                    # instead of just storing the diff in the "unified_diff" key.
> > +                    if item["unified_diff"] == None:
> > +                        for item_details in item["details"]:
> > +                            diff = item_details["unified_diff"].split("\n")
> > +                            split_deltas = split_delta(diff)
> > +                            item_details["added"] = split_deltas[0][:100]
> > +                            item_details["deleted"] = split_deltas[1][:100]
> > +                            cleanup(item_details)
> > +                    else:
> > +                        diff = item["unified_diff"].split("\n")
> > +                        split_deltas = split_delta(diff)
> > +                        item["added"] = split_deltas[0][:100]
> > +                        item["deleted"] = split_deltas[1][:100]
> > +                    cleanup(item)
>
>  This cleanup has nothing to do with getting the failure reason. I think it
> would be better to do it in a separate function (and a separate patch). Also,
> I'm not really happy yet with this diff cleanup, because we loose all context
> information. So maybe, for now, it's better to just use the --max-report-size
> option.
>

You're right, until we find a way to save context its better to use
--max-report-size. What about the issue that it truncates diff output?

> > +                # We currently just set the reason from first non-reproducible package in the
> > +                # dictionary.
> > +                reason = json_data["details"][0]["package"]
> > +
> > +                # If there does exist a unified_diff directly for the .tar images, it is probably
> > +                # a filesystem reproducibility issue.
>
>  This comment should come after the else, or before the condition. Like this, it
> looks like it belongs to the == None condition.
>
>  Maybe it's cleaner to swap the condition and put this filesystem assumption first.
>
Ah yes, it will definitely be cleaner to swap the conditions.

>
>  Regards,
>  Arnout
>
> > +            else:
> > +                reason = ["filesystem"]
> > +
> > +            with open(reproducible_results, "w") as reproduciblef:
> > +                json.dump(json_data, reproduciblef, sort_keys=True, indent=4)
> > +
> > +            return reason
> > +
> >          def get_failure_reason():
> >              # Output is a tuple (package, version), or None.
> >              lastlines = decode_bytes(subprocess.Popen(
> >

Thanks for the review! And sorry for replying a few days late..

-- 
Regards,
Atharva Lele
