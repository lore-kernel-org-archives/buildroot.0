From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:51:09 +0200
Subject: [Buildroot] [PATCH 1/1] buildroot-test: failure reason regex
 update
In-Reply-To: <1459302094-15704-1-git-send-email-matt@thewebers.ws>
References: <1459302094-15704-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160330165109.7330df45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 20:41:34 -0500, Matt Weber wrote:
> - Sub-make required one additional line tailed
> - Both regex to truncate end log and import which sets
>   the failure reason on the report are updated
> 
> Signed-off-by: Matt Weber <matt@thewebers.ws>
> ---
>  scripts/autobuild-run | 4 ++--
>  web/import.inc.php    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ca5bdfc..07bb5c5 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -648,10 +648,10 @@ def send_results(result, **kwargs):
>      def get_failure_reason():
>          # Output is a tuple (package, version), or None.
>          lastlines = decode_bytes(subprocess.Popen(
> -            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
> +            ["tail", "-n", "4", os.path.join(outputdir, "logfile")],
>              stdout=subprocess.PIPE).communicate()[0]).splitlines()
>  
> -        regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
> +        regexp = re.compile("make.* \*\*\* .*/(?:build|toolchain)/([^/]*)/")
>          for line in lastlines:
>              m = regexp.search(line)
>              if m:
> diff --git a/web/import.inc.php b/web/import.inc.php
> index 243a1f3..4a781ab 100644
> --- a/web/import.inc.php
> +++ b/web/import.inc.php
> @@ -102,7 +102,7 @@ function import_result($buildid, $filename)
>        $reason = "none";
>      else {
>  	$tmp = Array();
> -	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
> +	exec("tail -4 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.* \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);

I don't see why you are making this change. The ':' is really there:

	make[1]: ...

Do you have a case where it isn't present ?

Also why you are changing 3 lines to 4 lines ?

In the autobuilder outputs, I see two cases:

 1/ When the correct umask is used, we get:

make: *** [/home/peko/autobuild/instance-2/output/build/tvheadend-cd9f07fb865e5700156546ee326fbaf42ee99cf8/.stamp_configured] Error 1
make: Leaving directory `/home/peko/autobuild/instance-2/buildroot'

 2/ When the incorrect umask is used, we get:

make[1]: *** [/home/buildroot/autobuild/run/instance-2/output/build/ffmpeg-2.8.6/.stamp_configured] Error 1
make: *** [_all] Error 2
make: Leaving directory `/home/buildroot/autobuild/run/instance-2/buildroot'

So 3 lines should be fine. Or do you have other cases ? 

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
