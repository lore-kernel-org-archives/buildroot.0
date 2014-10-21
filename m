From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 21:56:40 +0200
Subject: [Buildroot] [PATCH] gst1-validate: new package
In-Reply-To: <1413841040-14925-1-git-send-email-ps.report@gmx.net>
References: <1413841040-14925-1-git-send-email-ps.report@gmx.net>
Message-ID: <5446BA78.4040607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/14 23:37, Peter Seiderer wrote:
> Example usages can be found on [1].
> 
> [1] http://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/Config.in                      |  1 +
>  package/gstreamer1/gst1-validate/Config.in        |  9 +++++++++
>  package/gstreamer1/gst1-validate/gst1-validate.mk | 15 +++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-validate/Config.in
>  create mode 100644 package/gstreamer1/gst1-validate/gst1-validate.mk
> 
> diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
> index fe0ad48..5f08faf 100644
> --- a/package/gstreamer1/Config.in
> +++ b/package/gstreamer1/Config.in
> @@ -7,5 +7,6 @@ source "package/gstreamer1/gst1-plugins-good/Config.in"
>  source "package/gstreamer1/gst1-plugins-bad/Config.in"
>  source "package/gstreamer1/gst1-plugins-ugly/Config.in"
>  source "package/gstreamer1/gst1-libav/Config.in"
> +source "package/gstreamer1/gst1-validate/Config.in"
>  source "package/gstreamer1/gst-omx/Config.in"
>  endif
> diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
> new file mode 100644
> index 0000000..ffcdd27
> --- /dev/null
> +++ b/package/gstreamer1/gst1-validate/Config.in
> @@ -0,0 +1,9 @@
> +menuconfig BR2_PACKAGE_GST1_VALIDATE
> +	bool "gst1-validate"
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	help
> +	  GstValidate is a tool that allows GStreamer developers to
> +	  check that the GstElements they write behave the way they
> +	  are supposed to.
> +
> +	  http://gstreamer.freedesktop.org/
> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> new file mode 100644
> index 0000000..62061e2
> --- /dev/null
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gst1-validate
> +#
> +################################################################################
> +
> +GST1_VALIDATE_VERSION = 1.4.0
> +GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
> +GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
> +GST1_VALIDATE_LICENSE_FILES = COPYING
> +GST1_VALIDATE_LICENSE = LGPLv2.1+

 I had to add this:

GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc

because I have sphinx-build installed on my system and it fails...

 With that added, it gets my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [build test on minimal internal x86_64 toolchain]

 Regards,
 Arnout

> +
> +GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
