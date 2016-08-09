From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Aug 2016 12:52:29 -0700
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: broken with gcc6
In-Reply-To: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <B397AE0E-28F2-4D0D-866B-3FD929EFB1DC@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 9, 2016, at 12:44 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> Also propagate reverse dependency to kodi-audiodecoder-sidplay.
> 
> Fixes
> http://autobuild.buildroot.net/results/4f5/4f57a7a37da0ce6d14a368272d982b4874a54927/

This could also be fixed in code instead to statically typecast to int8_t.

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> package/kodi-audiodecoder-sidplay/Config.in | 1 +
> package/libsidplay2/Config.in               | 2 ++
> 2 files changed, 3 insertions(+)
> 
> diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
> index ae99afa..db47a9c 100644
> --- a/package/kodi-audiodecoder-sidplay/Config.in
> +++ b/package/kodi-audiodecoder-sidplay/Config.in
> @@ -1,5 +1,6 @@
> config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
> 	bool "kodi-audiodecoder-sidplay"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6 # libsidplay2
> 	select BR2_PACKAGE_KODI_PLATFORM
> 	select BR2_PACKAGE_LIBSIDPLAY2
> 	help
> diff --git a/package/libsidplay2/Config.in b/package/libsidplay2/Config.in
> index 5698367..34fa7f7 100644
> --- a/package/libsidplay2/Config.in
> +++ b/package/libsidplay2/Config.in
> @@ -1,6 +1,7 @@
> config BR2_PACKAGE_LIBSIDPLAY2
> 	bool "libsidplay2"
> 	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
> 	help
> 	  Sidplay 2 is the second in the Sidplay series originally developed by
> 	  Michael Schwendt. This version is written by Simon White and is cycle
> @@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBSIDPLAY2
> 	  http://sourceforge.net/projects/sidplay2
> 
> comment "libsidplay2 needs a toolchain w/ C++"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
> 	depends on !BR2_INSTALL_LIBSTDCPP
> --
> 2.8.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160809/d0ab9b67/attachment.asc>
