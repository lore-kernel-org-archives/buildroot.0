From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Feb 2019 00:20:06 +0100
Subject: [Buildroot] [PATCH v2] package/proftpd: prevent openssl pthread
 detection
In-Reply-To: <1550782347-31389-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1550782347-31389-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <e524cd32-35c3-ce10-5bc9-68a438d71d3e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/02/2019 21:52, Matt Weber wrote:
> Openssl cmdline executable can be used as a config test which
> results in either the host-openssl or host system's openssl
> being used to detect the linking with -pthread. This is an
> issue as a system maybe building with a toolchain without
> thread support. (To review the detection logic, see proftpd
> configure.in and search for pr_use_pthread_for_openssl)

 I noticed a potential issue: now pthread never gets linked in, even if openssl
is built with thread support and when linking statically.

 However, it turns out that that is not a problem because openssl (at least in
the version we use) doesn't pull in its thread support automatically.

 So, I completely rewrote the commit message and applied to master, thanks.

> 
> Fixes

 Could you in the future add a colon after Fixes: so patchwork picks it up and
marks it with the 'Fixes' tag?

 Regards,
 Arnout

> http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> To recreate the failure, with a clean build.
>   make host-openssl proftpd
> 
> Changes
> v1 -> v2
> [Arnout
>  - Noted the inhert dependency that was going on and suggested the
>    configure step fix to prevent the openssl flag detection leading
>    to the -pthread being added the the linker flags.
> ---
>  package/proftpd/proftpd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> index 592c069..67d8eb8 100644
> --- a/package/proftpd/proftpd.mk
> +++ b/package/proftpd/proftpd.mk
> @@ -22,7 +22,8 @@ PROFTPD_CONF_OPTS = \
>  	--disable-dso \
>  	--enable-sendfile \
>  	--enable-shadow \
> -	--with-gnu-ld
> +	--with-gnu-ld \
> +	--without-openssl-cmdline
>  
>  ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
>  PROFTPD_MODULES += mod_rewrite
> 
