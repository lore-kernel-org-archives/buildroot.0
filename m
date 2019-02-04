From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 04 Feb 2019 13:18:28 +0100
Subject: [Buildroot] [PATCH] gst1-shark: new package
In-Reply-To: <20190125091322.27522-1-judge.packham@gmail.com>
References: <20190125091322.27522-1-judge.packham@gmail.com>
Message-ID: <1549282708.7318.38.camel@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris and all,

On Fri, 2019-01-25 at 22:13 +1300, Chris Packham wrote:
> GstShark leverages GStreamers newest instrumentation subsystem by
> installing a set of custom hooks to the trace points. A variety of
> data
> analytics are extracted and presented to the user in a graphical,
> friendly way.
> 
> https://developer.ridgerun.com/wiki/index.php?title=GstShark
> https://github.com/RidgeRun/gst-shark
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Jo?o Victor Oliveira <jv.oliveirag@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Igor Miranda <igorcmiranda3110@gmail.com>
> ---
> I saw a few emails on the list with problems building gst-shark but
> nothing
> that actually added the package. I figured I'd give it a go. This
> seems to work
> (build) for me but I have no idea about using gstreamer so I may have
> missed
> something.
> 
>  package/gstreamer1/Config.in                  |  1 +
>  package/gstreamer1/gst1-shark/Config.in       | 12 ++++++++++++
>  package/gstreamer1/gst1-shark/gst1-shark.hash |  5 +++++
>  package/gstreamer1/gst1-shark/gst1-shark.mk   | 19
> +++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-shark/Config.in
>  create mode 100644 package/gstreamer1/gst1-shark/gst1-shark.hash
>  create mode 100644 package/gstreamer1/gst1-shark/gst1-shark.mk
> 
> diff --git a/package/gstreamer1/Config.in
> b/package/gstreamer1/Config.in
> index 28b1ed25c5..922ecefcff 100644
> --- a/package/gstreamer1/Config.in
> +++ b/package/gstreamer1/Config.in
> @@ -11,6 +11,7 @@ source "package/gstreamer1/gst1-imx/Config.in"
>  source "package/gstreamer1/gst1-interpipe/Config.in"
>  source "package/gstreamer1/gst1-libav/Config.in"
>  source "package/gstreamer1/gst1-rtsp-server/Config.in"
> +source "package/gstreamer1/gst1-shark/Config.in"
>  source "package/gstreamer1/gst1-validate/Config.in"
>  source "package/gstreamer1/gst1-vaapi/Config.in"
>  source "package/gstreamer1/gst-omx/Config.in"
> diff --git a/package/gstreamer1/gst1-shark/Config.in
> b/package/gstreamer1/gst1-shark/Config.in
> new file mode 100644
> index 0000000000..0f9ddb30bc
> --- /dev/null
> +++ b/package/gstreamer1/gst1-shark/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GST1_SHARK
> +	bool "gst-shark"
> +	select BR2_PACKAGE_GSTREAMER1_CHECK
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
> +	help
> +	  GstShark leverages GStreamers newest instrumentation
> subsystem
> +	  by installing a set of custom hooks to the trace points. A
> +	  variety of data analytics are extracted and presented to
> the
> +	  user in a graphical, friendly way.
> +
> +	  https://github.com/RidgeRun/gst-shark
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash
> b/package/gstreamer1/gst1-shark/gst1-shark.hash
> new file mode 100644
> index 0000000000..fdcbc563a8
> --- /dev/null
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
> @@ -0,0 +1,5 @@
> +# locally computed hash
> +sha256
> 35c56b89c10f42c623f5831f9533e1b9dcab8946eff0e4000bf3137bad5c705a  gst
> 1-shark-v0.5.5.tar.gz
> +
> +# Hashes for license files:
> +sha256
> 6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COP
> YING
> diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk
> b/package/gstreamer1/gst1-shark/gst1-shark.mk
> new file mode 100644
> index 0000000000..75fd155b41
> --- /dev/null
> +++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
> @@ -0,0 +1,19 @@
> +####################################################################
> ############
> +#
> +# gst1-shark
> +#
> +####################################################################
> ############
> +
> +GST1_SHARK_VERSION = v0.5.5
> +GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
> +GST1_SHARK_SITE_METHOD = git
> +GST1_SHARK_GIT_SUBMODULES = 

You could use the github package site helper here (see https://buildroo
t.org/downloads/manual/manual.html#github-download-url) and get rid off this empty _GIT_SUBMODULES line (and benefit from the unified Buildroot infrastructure)

> +
> +GST1_SHARK_LICENSE = LGPL-2.1
> +GST1_SHARK_LICENSE_FILES = COPYING
> +
> +GST1_SHARK_AUTORECONF = YES
> +GST1_SHARK_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
> +GST1_SHARK_CONF_OPTS = --disable-graphviz
> +
> +$(eval $(autotools-package))

Also, you should probably add yourself to the DEVELOPERS file for this
package.

Titouan
