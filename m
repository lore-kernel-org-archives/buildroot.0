From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jul 2017 12:58:31 +0200
Subject: [Buildroot] [FYI 2/2] WIP:qt5: Bump up to 5.9
In-Reply-To: <1498957590990-168959.post@n4.nabble.com>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <1cc8737a-4ecd-5aa7-2a2e-628cea1e6652@melcoinc.co.jp>
 <20170629213647.020e3fb0@gmx.net>
 <09654530-e03b-bcfd-0e52-1be644792111@melcoinc.co.jp>
 <4d0a7e96-00c8-4234-9174-f584aeda7844@mind.be>
 <1498957590990-168959.post@n4.nabble.com>
Message-ID: <4aafe02d-451d-c972-07c3-a6a47acd7d92@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi J,

 If you would like your contribution to be included in Buildroot, could you send
it as a proper patch? For starters, you should send it with "git send-email",
which will make sure that everything is preserved properly. If you just paste it
in your mailer, then it will most likely be wrapped or modified in different
ways and the patch doesn't apply.

 It should also have a commit message, something like:

qt5: bump to 5.9.1

Starting from version 5.9, Qt uses pcre2 instead of pcre.

Hashes of all modules have been updated.

Signed-off-by: ....
Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>

 Note that the Signed-off-by should contain your real name. Cfr.
https://developercertificate.org/

 Note also that I added the signed-off-by of the author of the first version of
this patch. Indeed, Naoki has a copyright claim on it so you should make it
clear that he agrees with redistributing it under GPL-2.0+.

 Note also that I added the developers assigned to this package in Cc. You can
get the list of developers with "utils/get-developers -p qt5base".

 Also, some additional remarks below:

On 02-07-17 03:06, jsmith wrote:
> I created a patch below that updates Qt and all the submodules to 5.9.1,
> since that is now the latest version.  I haven't had a chance to test this
> yet, but I'll try to build it on Monday.  Anyway, the patch is below - hope
> it helps!
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index a2358a5..5b5311c 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -34,15 +34,15 @@ if BR2_PACKAGE_QT5
>  choice
>  	prompt "Qt5 version"
>  
> -config BR2_PACKAGE_QT5_VERSION_LATEST
> -	bool "Latest (5.8)"
> +config BR2_PACKAGE_QT5_VERSION_5_9

 The name of the config symbol shouldn't be changed. The idea is that people who
select LATEST always get the latest version and don't need to change their
.config all the time.

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

 When you test, can you (also) test it with a gcc 4.8 toolchain to be sure that
that is still supported? They tend to use more and more C++11 features which may
require more recent toolchains.

> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 5c7af39..68711e9 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -4,9 +4,9 @@
>  #
> 
> ################################################################################
>  
> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> -QT5_VERSION_MAJOR = 5.8
> -QT5_VERSION = $(QT5_VERSION_MAJOR).0
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_9),y)
> +QT5_VERSION_MAJOR = 5.9
> +QT5_VERSION = $(QT5_VERSION_MAJOR).1
>  QT5_SITE =
> http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
>  QT5_SNAPSHOTS_SITE =
> http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
>  else
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 7eaf2cd..7596448 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,5 +1,5 @@
>  # Hash from:
> http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
>  sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941
> qt3d-opensource-src-5.6.2.tar.xz
>  
> -# Hash from:
> http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
> -sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5 
> qt3d-opensource-src-5.8.0.tar.xz
> +# Hash from:
> http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz

 There was something wrong with the original here and you just kept it: the hash
is in ....tar.xz.mirrorlist, not in ....tar.xz. Which makes me suspect that you
didn't actually get the hash from there, so you're lying :-)

> +sha256 4f1fe5b812d78987341b854e7f2907f0375dc188cfa6cf9db101b26e9dfd4996
> qt3d-opensource-src-5.9.1.tar.xz
[snip]
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 5fe8bb8..97db864 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -9,6 +9,13 @@ QT5BASE_SITE = $(QT5_SITE)
>  QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
>  
>  QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre

 pcre should be removed from DEPENDENCIES here.

> +#TODO:More better syntax? likely BR2_PACKAGE_QT5_VERSION < 5.9

 You can drop this comment added by Naoki, it no longer applies.

> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_9),y)

 Since we may add another choice option for 5.9 LTS later, it's more future-safe
to make the condition on BR2_PACKAGE_QT5_VERSION_5_6. So

ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
QT5BASE_DEPENDENCIES += pcre
else
QT5BASE_DEPENDENCIES += pcre2
endif


 Regards,
 Arnout

> +QT5BASE_DEPENDENCIES += pcre2
> +else
> +QT5BASE_DEPENDENCIES += pcre
> +endif
> +
>  QT5BASE_INSTALL_STAGING = YES
>  
>  # A few comments:
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
