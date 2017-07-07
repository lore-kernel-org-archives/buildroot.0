From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 7 Jul 2017 14:37:32 -0400
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
 <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
Message-ID: <20170707183732.zeyhxtxugths5shn@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brent,

On Fri, Jul 07, 2017 at 03:45:27AM +0000, Brent Sink wrote:
> (...)
> 
> ---
>  package/qt5/Config.in                                    | 4 ++--
>  package/qt5/qt5.mk                                       | 4 ++--
>  package/qt5/qt53d/qt53d.hash                             | 4 ++--
>  package/qt5/qt5base/qt5base.hash                         | 4 ++--
>  package/qt5/qt5base/qt5base.mk                           | 8 +++++++-
>  package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
>  package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
>  package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
>  package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
>  package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
>  package/qt5/qt5location/qt5location.hash                 | 4 ++--
>  package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
>  package/qt5/qt5script/qt5script.hash                     | 4 ++--
>  package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
>  package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
>  package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
>  package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
>  package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
>  package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
>  package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--

qtwebengine is not (yet) a part of buildroot. So you can drop it for now.

> (...)
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index a2358a5..a858f73 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -35,14 +35,14 @@ choice
>  	prompt "Qt5 version"
>  
>  config BR2_PACKAGE_QT5_VERSION_LATEST
> -	bool "Latest (5.8)"
> +	bool "Latest (5.9)"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
>  	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>  	# no built-in double-conversion support
>  	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
>  	help
> -	  This option builds Qt 5.8, which is licensed under
> +	  This option builds Qt 5.9, which is licensed under
>  	  (L)GPL-3.0+.
>  
>  comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"

As Arnout as mentionned (see the original thread from Naoki), you should
consider updating qt5base/Config.in.

Probably something like below.

@@ -1,11 +1,12 @@
 config BR2_PACKAGE_QT5BASE
 	bool "qt5base"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_16
-	select BR2_PACKAGE_PCRE_UTF
+	select BR2_PACKAGE_PCRE if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_16 if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_UTF if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE2 if !BR2_PACKAGE_QT5_VERSION_5_6
 	help

Maybe, qt5base also needs BR2_PACKAGE_PCRE2_16; you should deternime if it is
necessary or not.

+	select BR2_PACKAGE_PCRE2_16 if !BR2_PACKAGE_QT5_VERSION_5_6

> (...)
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> index e20a66b..6f16e3b 100644
> --- a/package/qt5/qt5webengine/qt5webengine.hash
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -1,5 +1,5 @@
>  # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebengine-opensource-src-5.6.2.tar.xz.mirrorlist
>  sha256 2f0a1648e1a8b22bad0134f2b37d69d185074393c398c1a3c6a83b910ff39740  qtwebengine-opensource-src-5.6.2.tar.xz
>  
> -# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebengine-opensource-src-5.8.0.tar.xz
> -#sha256 223d22f1660811e60677afe0a85f2f385823e25157689561489700c5d1da79be  qtwebengine-opensource-src-5.8.0.tar.xz
> +# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebengine-opensource-src-5.9.1.tar.xz.mirrorlist
> +sha256 f6a37eeb9188474a16d29ede498fce959396ab80329a0a83eaeb925251686401 qtwebengine-opensource-src-5.9.1.tar.xz

For the same reason than above, you should discard this.

Regards,
Gael
