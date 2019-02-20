From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 22:56:59 +0100
Subject: [Buildroot] [PATCH] package/proftpd: require threads
In-Reply-To: <1550694551-61136-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1550694551-61136-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <ba989973-2303-ddda-ca3c-bceb90ea6bec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/02/2019 21:29, Matt Weber wrote:
> Fixes
> http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b

 proftpd hasn't been updated in a long time, yet this issue only appeared
recently. It was triggered by the update of the toolchains.

 I'm not sure what exactly differs between the previous toolchains and the
current toolchains, but it is clear that proftpd incorrectly links with
-lpthread. It doesn't actually use threads itself. It only adds -lpthread if it
is required for mysql, postgresql or openssl.

 mysql depends on threads, so that's not it.

 postgresql is not selected in the failing build, so I didn't look at that.

 openssl is selected, so that's the culprit. configure.in contains the following
fragment for it:


  pr_use_pthread_for_openssl="no"
  if test x"$openssl_cmdline" != xno; then
    if `$openssl_cmdline version 2>/dev/null 1>&2`; then
      openssl_cflags=`$openssl_cmdline version -f 2>/dev/null`
      if test ! -z "$openssl_cflags"; then
        # Look for the -pthread flag, indicating that this OpenSSL was built
        # with threads support (see Bug#3795)
        for openssl_cflag in $openssl_cflags; do
          if test x"$openssl_cflag" = x"-pthread"; then
            pr_use_pthread_for_openssl="yes"
          fi
        done
  ...
  if test x"$pr_use_pthread_for_openssl" = xyes ; then
    LIBS="$LIBS -pthread"
  fi


 Argh, this is wrong on so many levels...

 So, apparently, the openssl executable can be used as a kind of foo-config
script... But instead, we end up using the CFLAGS that were used for building
host-openssl. Worse, if we don't build host-openssl (it is not a dependency of
proftpd), we will instead use the system's openssl...


 I *think* we can get away with just passing --without-openssl-cmdline due to
the strange and intricate way that that option ends up being used by the
configure script. But it would have to be tested :-)


 Anyway, I've marked the patch as Changes Requested.

 Regards,
 Arnout

> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/proftpd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index edec37c..d094b64 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PROFTPD
>  	bool "proftpd"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  ProFTPD, a highly configurable FTP server.
>  
> @@ -89,3 +90,6 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
>  	  0 uses the default size of 1024.
>  
>  endif
> +
> +comment "proftpd needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
