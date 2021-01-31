From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:59:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/mpd: fix build of GenParseName
In-Reply-To: <20210130112647.1835553-2-fontaine.fabrice@gmail.com>
References: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
 <20210130112647.1835553-2-fontaine.fabrice@gmail.com>
Message-ID: <20210131215906.780921d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 12:26:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of GenParseName which has been added in version 0.22:
> https://github.com/MusicPlayerDaemon/MPD/commit/fa45a8adfa44f6bc815ae7428770112c15c76d73
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-src-tag-meson.build-link-with-lstdc.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch
> 
> diff --git a/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch b/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch
> new file mode 100644
> index 0000000000..1a8bf42be9
> --- /dev/null
> +++ b/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch
> @@ -0,0 +1,37 @@
> +From cbe479fa76809af16efff7b699952403f306e3c8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 30 Jan 2021 12:12:46 +0100
> +Subject: [PATCH] src/tag/meson.build: link with -lstdc++
> +
> +Link with -lstdc++ when building GenParseName to avoid the following
> +build failure:
> +
> +FAILED: src/tag/GenParseName
> +/usr/bin/gcc  -o src/tag/GenParseName src/tag/GenParseName.p/GenParseName.cxx.o src/tag/GenParseName.p/Names.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1

So, one of the object files was compiled with a C++ compiler, and it
uses "gcc" at link time. This is the issue, and it should instead use
g++ at link time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
