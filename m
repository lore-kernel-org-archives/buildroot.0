From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 15 Oct 2016 19:05:31 -0400
Subject: [Buildroot] [PATCH 1/1] size-stats: don't count hard links
In-Reply-To: <20161015081750.75b59fb2@free-electrons.com>
References: <1476489930-10456-1-git-send-email-fhunleth@troodon-software.com>
 <20161015081750.75b59fb2@free-electrons.com>
Message-ID: <CA+-urNQ_S_GxnZrtuG1jJdrz=BaKz2d13fcdNoGkorxRPEiFRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 15, 2016 at 2:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Oct 2016 20:05:30 -0400, Frank Hunleth wrote:
>> This change adds inode tracking to the size-stats script so that hard
>> links don't cause files to be double counted. This has a significant
>> effect on the size computation for some packages. For example, git has
>> around a dozen hard links to a large file. Before this change, git would
>> weigh in at about 170 MB with the total filesystem size reported as
>> 175 MB. The actual rootfs.ext2 size was around 16 MB. With the change,
>> the git package registers at 10.5 MB with a total filesystem size of
>> 15.8 MB.
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> Thanks a lot for this change! Definitely this is something that needs
> to be handled.
>
>> -def add_file(filesdict, relpath, abspath, pkg):
>> +def add_file(filesdict, seeninodes, relpath, abspath, pkg):
>>      if not os.path.exists(abspath):
>>          return
>>      if os.path.islink(abspath):
>>          return
>> -    sz = os.stat(abspath).st_size
>> +    if relpath in filesdict:
>> +        return
>
> I'm not sure why this test is being added, or at least why it's related
> to the inode tracking.

I find that I often have duplicate files listed in
package-file-list.txt. I think that they're all due to rebuilding
packages. Without the hard link check, the duplicate files were
harmless in that they just resulted in a file being added to filesdict
more than once. With the hard link checking, an if statement was
needed to make sure that a file with a previously seen inode wouldn't
mistakenly be added as a hard link. Checking up front here seemed best
since it not only address the hard link case, but also saved a little
time handling duplicate entries.

>
>> @@ -97,10 +113,11 @@ def build_package_size(filesdict, builddir):
>>              if not frelpath in filesdict:
>>                  print("WARNING: %s is not part of any package" % frelpath)
>>                  pkg = "unknown"
>> +                sz = os.path.getsize(fpath)
>
> So for files not belonging to packages, we do not track inodes?

Good point. I hadn't considered that anyone would use hard links
outside of packages, but I suppose there's nothing preventing it.

>
> Maybe we should instead have our own filesize() helper function that
> takes care of returning the right size if we have never seen this
> inode, or 0 if we have already seen it. It could then be used in both
> places.
>
> Another concern is that some files will now be reported as having a 0
> size, while it's not entirely correct. This does not matter at all for
> the per-package graph or CSV file, but is a bit more annoying for the
> per-file CSV file. Indeed, a user inspecting this CSV file will wonder
> what those zero-size files are. So, another option is to divide the
> size of the file by the number of hard-links, and spread the size over
> the different hard-links. But it's also not very nice, as the size
> reported in the CSV will not match the visible size of the file.
>
> So, maybe we should just leave it like you propose, unless others have
> a better idea about this.

I had similar concerns about reporting 0 sized files, since it's not
that obvious and which file gets picked as the non-zero length file is
arbitrary. I hadn't thought of spreading the file size across all
links, but I'm not sure that would make things more clear. The only
idea I have is to add a comments field to the csv, add the file as 0
length, and have a comment "hard link to xyz." I pretty much only use
the package size stats, so I'll wait around for other suggestions too.

Frank

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
