From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 19:13:02 +0200
Subject: [Buildroot] [PATCH v4 3/5] autobuild-run: account for
 reproducibility failures in get_failure_reason()
In-Reply-To: <20190820145231.15507-3-itsatharva@gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-3-itsatharva@gmail.com>
Message-ID: <5003d4b7-0978-907b-7bc8-22aa2bec0c31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/08/2019 16:52, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v3:
>   - Account for changed name of diffoscope output
> ---
>  scripts/autobuild-run | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 384cf73..876feb2 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -689,15 +689,26 @@ class Builder:
>  
>          def get_failure_reason():
>              # Output is a tuple (package, version), or None.
> -            lastlines = decode_bytes(subprocess.Popen(
> -                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
> -                stdout=subprocess.PIPE).communicate()[0]).splitlines()
> -
> -            regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
> -            for line in lastlines:
> -                m = regexp.search(line)
> -                if m:
> -                    return m.group(1).rsplit('-', 1)
> +            # Output is "package-reproducible" in case of reproducibility failure.
> +
> +            reproducible_results = os.path.join(self.resultdir, "diffoscope-results.json")

 Since file is now used in several functions, it would make sense to move it to
the class itself, like we do for so many others.

> +            if os.path.exists(reproducible_results) and os.stat(reproducible_results).st_size > 0:
> +                if self.sysinfo.has("diffoscope"):

 It would make more sense to move this condition up - if diffoscope is not
installed, there will be no diffoscope-results.json. Oh, actually there will be,
but it's not a JSON file... So, actually, in case diffoscope is not installed,
we should not create diffoscope-results.json, but diffoscope-results.txt (and no
json).

 Regards,
 Arnout

> +                    reason = get_reproducibility_failure_reason(reproducible_results)
> +                    reason.append("nonreproducible")
> +                    return reason
> +                else:
> +                    return ["nonreproducible"]
> +            else:
> +                lastlines = decode_bytes(subprocess.Popen(
> +                    ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
> +                    stdout=subprocess.PIPE).communicate()[0]).splitlines()
> +
> +                regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
> +                for line in lastlines:
> +                    m = regexp.search(line)
> +                    if m:
> +                        return m.group(1).rsplit('-', 1)
>  
>              # not found
>              return None
> 
