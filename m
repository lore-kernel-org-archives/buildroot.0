From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jun 2014 21:16:55 +0200
Subject: [Buildroot] [PATCH V5 1/2] google-breakpad: new package
In-Reply-To: <1403702174-23850-2-git-send-email-pascal.huerst@gmail.com>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>
 <1403702174-23850-2-git-send-email-pascal.huerst@gmail.com>
Message-ID: <53AB2027.4090900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/06/14 15:16, Pascal Huerst wrote:
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/google-breakpad/Config.in          | 19 +++++++++++++++++++
>  package/google-breakpad/google-breakpad.mk | 17 +++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 package/google-breakpad/Config.in
>  create mode 100644 package/google-breakpad/google-breakpad.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c46c0ec..392ae40 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -54,6 +54,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/duma/Config.in"
>  	source "package/fio/Config.in"
>  	source "package/gdb/Config.in"
> +	source "package/google-breakpad/Config.in"
>  	source "package/iozone/Config.in"
>  	source "package/kexec/Config.in"
>  	source "package/ktap/Config.in"
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> new file mode 100644
> index 0000000..fa1e8d9
> --- /dev/null
> +++ b/package/google-breakpad/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_GOOGLE_BREAKPAD
> +	bool "google-breakpad"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el

 Too long, the line should be split after mips.

> +	help
> +	  Google-Breakpad is a library and tool suite that allows you to distribute 
> +	  an application to users with compiler-provided debugging information 
> +	  removed, record crashes in compact "minidump" files, send them back to 
> +	  your server, and produce C and C++ stack traces from these minidumps. 
> +	  Breakpad can also write minidumps on request for programs that have not 
> +	  crashed. 	 

 I think these lines are also too long to display on an 80-char display (it
should be wrapped at 72 chars IIRC, where the tab counts for 8 chars).

 Also, there should be no whitespace at the end of the lines.

 I would also mention in the help text that this installs the host tools in
$(HOST_DIR)/usr/bin and list the host tools.

 If I understand correctly, for the target, we just build the (static) client
library, which should be linked and enabled explicitly by applications that want
to make use of breakpad. Is that correct? If yes, perhaps it's better to clarify
that in the help text as well.


> +
> +	  You may want to set BR2_ENABLE_DEBUG, in order to get useful results.
> +
> +	  http://code.google.com/p/google-breakpad/
> +
> +comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC)

 Here you should repeat the arch dependencies.

> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
> new file mode 100644
> index 0000000..e5b69c0
> --- /dev/null
> +++ b/package/google-breakpad/google-breakpad.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# google-breakpad
> +#
> +################################################################################
> +
> +GOOGLE_BREAKPAD_VERSION = 1320

 Any particular reason to take a 2-month old commit?

> +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
> +GOOGLE_BREAKPAD_SITE_METHOD = svn
> +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
> +GOOGLE_BREAKPAD_INSTALL_STAGING = YES

 There is nothing to install on the target, right? So I'd expect

GOOGLE_BREAKPAD_INSTALL_TARGET = NO

> +GOOGLE_BREAKPAD_LICENSE = BSD-3c
> +GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-autotools-package))
> +$(eval $(autotools-package))

 We normally put the host-package after the target-package.


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
