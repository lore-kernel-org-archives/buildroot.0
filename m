From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 15:14:10 +0100
Subject: [Buildroot] [PATCHv2] qt: X11 support
In-Reply-To: <1330830401-1736-1-git-send-email-ismael.luceno@gmail.com>
References: <1330830401-1736-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203041514.10952.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 04:06:41 Ismael Luceno wrote:
> Also reworked the QT_QMAKE_SET macro, to make it work on all qmakespecs.
> 
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

 Sorry, I tried your patch and it doesn't work...

> +choice
> +	prompt "GUI Backend"
> +	help
> +	  Select the graphic system, used to arbitrate screen access.
> +
> +config BR2_PACKAGE_QT_GUI_QWS
> +	bool "QWS"
> +	default y if !BR2_PACKAGE_XORG7
> +	help
> +	  QWS is a compact and efficient windowing system. Using it, Qt-based
> +	  applications write directly to the Linux framebuffer, eliminating the
> +	  need for the X Window System.
> +
> +config BR2_PACKAGE_QT_GUI_X11
> +	depends on BR2_PACKAGE_XORG7
> +	bool "X Window System"
> +	default y if BR2_PACKAGE_XORG7
> +endchoice

 It looks like this default construct isn't allowed for choices.  So it has
to become:

choice
	prompt "GUI Backend"
	default BR2_PACKAGE_QT_GUI_QWS if !BR2_PACKAGE_XORG7
	default BR2_PACKAGE_QT_GUI_X11 if BR2_PACKAGE_XORG7
...

 Note that I didn't test this, so please check if it does work (i.e. that
you see what you expect when you enable resp. disable XORG7).

[snip]
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 776eb63..c6fd292 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -220,7 +220,14 @@ else
>  QT_EMB_PLATFORM = generic
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT_GUI_X11),y)
> +QT_SPEC = linux-g++
> +QT_CONFIGURE_OPTS += -xplatform linux-g++ -arch $(QT_EMB_PLATFORM)

 You will need to add dependencies here.  At least libX11 is required, but
I see a lot more in build/qt-4.8.0/config.tests/x11.

 You have to test this with a clean build of a minimal config, e.g.

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
# BR2_PACKAGE_QT_XML is not set
# BR2_PACKAGE_QT_SCRIPT is not set
BR2_PACKAGE_XORG7=y

(again, I haven't tested if this config actually works).

 And if you want to be sure you have the dependencies right in the .mk
file, run 'make qt' rather than plain 'make'.


[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
