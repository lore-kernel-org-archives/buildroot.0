From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:12:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer/gst-plugins-base: Fix
 build on x86 if emmintrin.h is available but can't be used
In-Reply-To: <1453845373-30154-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453845373-30154-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126231239.54c9a300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 26 Jan 2016 22:56:13 +0100, Bernd Kuhls wrote:
> I stumbled across this error using a musl-based allyesconfig but I
> doubt it is related to musl. The autobuilders did not catch this
> problem yet but the patch I found fits my config (BR2_i386=y,
> BR2_x86_i586=y) and it solved the problem right away.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

> diff --git a/package/gstreamer/gst-plugins-base/0002-sse.patch b/package/gstreamer/gst-plugins-base/0002-sse.patch
> new file mode 100644
> index 0000000..8d134f1
> --- /dev/null
> +++ b/package/gstreamer/gst-plugins-base/0002-sse.patch
> @@ -0,0 +1,48 @@
> +Fix build error with a musl-based allyesconfig (BR2_x86_i586=y)
> +
> +Downloaded from
> +http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-base0.10/sse.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This is not the proper way of formatting things, because it makes the
patch no longer a Git formatted patch. Instead you should put your
comments...

> +
> +
> +From daa194b71ea6f9e8ee522ab02e8c56150b7e62b3 Mon Sep 17 00:00:00 2001
> +From: Antoine Jacoutot <ajacoutot@gnome.org>
> +Date: Mon, 20 Jan 2014 15:44:09 +0100
> +Subject: audioresample: Fix build on x86 if emmintrin.h is available but can't
> + be used
> +
> +On i386, EMMINTRIN is defined but not usable without SSE so check for
> +__SSE__ and __SSE2__ as well.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=670690

... here.

> +
> +From 4e3d101aa854cfee633a9689efeb75e5001baa5e Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
> +Date: Mon, 20 Jan 2014 16:11:04 +0100
> +Subject: audioresample: It's HAVE_EMMINTRIN_H, not HAVE_XMMINTRIN_H for SSE2

Also, this means two upstream commits have been squashed into one
patch. Please use the upstream commits directly instead, either
directly using GST_PLUGINS_BASE_PATCH if the patch don't need any
backporting. Or if they do:

gst-plugins-base (master)$ git checkout -b buildroot RELEASE-0.10.36
gst-plugins-base (buildroot)$ git cherry-pick daa194b71ea6f9e8ee522ab02e8c56150b7e62b3
gst-plugins-base (buildroot)$ git cherry-pick 4e3d101aa854cfee633a9689efeb75e5001baa5e
gst-plugins-base (buildroot)$ git format-patch -N HEAD~2
0001-audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
0002-audioresample-It-s-HAVE_EMMINTRIN_H-not-HAVE_XMMINTR.patch

And there you are.

But in this case, they seem to apply flawlessly, so using
GST_PLUGINS_BASE_PATCH is probably good enough.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
