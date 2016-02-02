From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 16:03:14 +0100
Subject: [Buildroot] [PATCH v2] package/lirc-tools: fix musl build
In-Reply-To: <1454246963-3880-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454246963-3880-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C532.4030106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 14:29, Bernd Kuhls wrote:
> Inspired by
> https://bug.tasktools.org/secure/attachment/10271/0001-Fix-build-with-musl-libc.patch
> 
> Fixes
> http://autobuild.buildroot.net/results/603/603c4426c47220808305a416f3d60fec2d8c02a3/
> http://autobuild.buildroot.net/results/c08/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: re-formatted patch and sent upstream (Thomas)
> 
>  .../0004-lirc-lsremotes.cpp-Fix-musl-build.patch   | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/lirc-tools/0004-lirc-lsremotes.cpp-Fix-musl-build.patch
> 
> diff --git a/package/lirc-tools/0004-lirc-lsremotes.cpp-Fix-musl-build.patch b/package/lirc-tools/0004-lirc-lsremotes.cpp-Fix-musl-build.patch
> new file mode 100644
> index 0000000..f3c03d7
> --- /dev/null
> +++ b/package/lirc-tools/0004-lirc-lsremotes.cpp-Fix-musl-build.patch
> @@ -0,0 +1,35 @@
> +From 027fae88f1001f7a74a791e348c05a11255aac7f Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 31 Jan 2016 14:23:02 +0100
> +Subject: [PATCH 1/1] lirc-lsremotes.cpp: Fix musl build
> +
> +Inspired by
> +https://bug.tasktools.org/secure/attachment/10271/0001-Fix-build-with-musl-libc.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> +Patch sent upstream: https://sourceforge.net/p/lirc/tickets/174/
> +Adjusted path for lirc-tools 0.9.2
> +
> + tools/lirc-lsremotes.cpp | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tools/lirc-lsremotes.cpp b/tools/lirc-lsremotes.cpp
> +index 8f2c65b..baee10e 100644
> +--- a/tools/lirc-lsremotes.c
> ++++ b/tools/lirc-lsremotes.c
> +@@ -25,6 +25,11 @@
> + 
> + static const logchannel_t logchannel = LOG_APP;
> + 
> ++/* fixes build with musl libc */
> ++#ifndef GLOB_BRACE
> ++#define GLOB_BRACE 0
> ++#endif

 This can't be right... It will completely break the globbing, because the
pattern that is used later on in fact relies on braces. So instead, the whole
thing should be rewritten to not use braces.

 Regards,
 Arnout

> ++
> + static int opt_silent = 0;
> + static int opt_dump = 0;
> + 
> +-- 
> +2.7.0
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
