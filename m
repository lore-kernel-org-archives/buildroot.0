From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Jun 2019 21:39:22 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/import.inc.php: account
 for failures that contain an images/ path
In-Reply-To: <20190616201338.4593-1-thomas.petazzoni@bootlin.com>
References: <20190616201338.4593-1-thomas.petazzoni@bootlin.com>
Message-ID: <ae30e2fd-d790-5040-4cca-ca53b17d13d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/06/2019 22:13, Thomas Petazzoni wrote:
> With the testing of BR2_REPRODUCIBLE=y recently added and its
> generation of a tar filesystem, we are now testing the tar filesystem
> generation logic, and this reveals some interesting breakage, such as:
> 
>   http://autobuild.buildroot.net/results/fe3/fe378bca29c86a681ba9ad40386cb89248195c50/build-end.log
> 
> However, the "reason" deduced from the build log by the PHP logic is a
> bit crappy, it's
> "/home/br-user/autobuild/run/instance-0/output/images/rootfs.tar".
> 
> This commit adjusts the ugly PHP code with even more ugliness to take

 This sounds like a great idea :-)

 Note that the Python code already has similar logic to extract the reason. Why
don't we save that logic as part of the tarball in a "reason" file, and extract
it from there?

 I know someone who has been working on the autobuild_run script lately who
could certainly do that :-)

 That said, we still have to support the legacy database which doesn't have that
"reason" file. So it's still useful to apply this patch.

 Regards,
 Arnout

> into account the fact that a path may look like
> foo/thing/build/<pkg>-<version>/.stamp_something or like
> foo/thing/images/rootfs.tar.
> 
> The reasons extracted for the two previous examples would be
> "<pkg>-<version>" (like is done today) and "rootfs.tar".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  web/import.inc.php | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/web/import.inc.php b/web/import.inc.php
> index 5b5462e..956c6d8 100644
> --- a/web/import.inc.php
> +++ b/web/import.inc.php
> @@ -231,7 +231,7 @@ function import_result($buildid, $filename)
>        $reason = "none";
>      else {
>  	$tmp = Array();
> -	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
> +	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/\(images\|build\)/\([^/]*\).*,\\2,'", $tmp);
>  	if (trim($tmp[0]))
>  	  $reason = $tmp[0];
>  	else {
> 
