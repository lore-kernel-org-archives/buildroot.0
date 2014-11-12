From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 12 Nov 2014 22:53:35 +0100
Subject: [Buildroot] [PATCH] gst1-validate: needs python
Message-ID: <trinity-d442e9ba-e3d5-4308-9861-98b74f99257a-1415829215250@3capp-gmx-bs53>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

sorry, but duplicate effort, I had already submitted a patch for this
build problem ([1]) a week ago...

On Wed, Nov 12, 2014 at 02:28:04PM +0000, Vicente Olivert Riera wrote:
> gst1-validate needs Python at build time. Otherwise it will fail showing
> an error like this one:
> 
> checking for a Python interpreter with version >= 2.7.0... none
> configure: error: no suitable Python interpreter found
> 
> It also needs Python at run time because the installed file
> "gst-validate-launcher" is a Python2 script:
> 
> $ file -b output/target/usr/bin/gst-validate-launcher
> a /usr/bin/env python2 script text executable
> 

Good catch, my patch added  python2 and python3, only build checked, no runtime
check on the target...

> Fixes:
>   http://autobuild.buildroot.net/results/723/723fe3036e8f0af2a90ff9e98173387466655000/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gstreamer1/gst1-validate/Config.in        |    8 ++++++++
>  package/gstreamer1/gst1-validate/gst1-validate.mk |    2 +-
>  2 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
> index ffcdd27..8b9f56f 100644
> --- a/package/gstreamer1/gst1-validate/Config.in
> +++ b/package/gstreamer1/gst1-validate/Config.in
> @@ -1,9 +1,17 @@
>  menuconfig BR2_PACKAGE_GST1_VALIDATE
>       bool "gst1-validate"
>       select BR2_PACKAGE_GST1_PLUGINS_BASE
> +     select BR2_PACKAGE_PYTHON

Not sure if select or depends is better, buildroot manual states select for libraries,
depends for huge packages...

$ find package -name "Config.in" | xargs grep depends | grep PYTHON | wc -l
63
$ find package -name "Config.in" | xargs grep select | grep PYTHON | wc -l
36

The existing packages seem to vote for depends...

> +     depends on BR2_USE_WCHAR # python
> +     depends on BR2_USE_MMU # python
> +     depends on BR2_TOOLCHAIN_HAS_THREADS # python
>       help
>         GstValidate is a tool that allows GStreamer developers to
>         check that the GstElements they write behave the way they
>         are supposed to.
>  
>         http://gstreamer.freedesktop.org/
> +
> +comment "gst1-validate needs a toolchain w/ wchar, threads"
> +     depends on BR2_USE_MMU
> +     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> index 4972cac..1464922 100644
> --- a/package/gstreamer1/gst1-validate/gst1-validate.mk
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -12,6 +12,6 @@ GST1_VALIDATE_LICENSE_FILES = COPYING
>  
>  GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
>  
> -GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
> +GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base python
 
Not sure, but is an explicit dependency 'host-python' needed here?

Sent already an update patch ([2]), but gst-validate-launcher is still failing on the target

$ gst-validate-launcher 
Traceback (most recent call last):
  File "/usr/bin/gst-validate-launcher", line 44, in <module>
    from launcher.main import main
  File "/usr/lib/gst-validate-launcher/python/launcher/main.py", line 26, in <module>
    import reporters
  File "/usr/lib/gst-validate-launcher/python/launcher/reporters.py", line 29, in <module>
    from xml.sax import saxutils
ImportError: No module named xml.sax

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/111250.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-November/111934.html
---
Sorry for sendig twice to you Vicente, but forgot to CC buildroot...

>  
>  $(eval $(autotools-package))
> -- 
> 1.7.1
> 
> 
