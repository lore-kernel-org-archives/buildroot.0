From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 23:19:04 +0100
Subject: [Buildroot] [PATCH v3] package/mono: Fixing wrong
 MonoPosixHelper location
In-Reply-To: <1456264228-19851-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1456264228-19851-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <56CCDAD8.5070904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 22:50, Angelo Compagnucci wrote:
> * This patch solves installation problems with monoposixhelper

 This description should be better, e.g. taking part of the bug description.

libMonoPosixHelper.so will be searched in the HOST_DIR/usr/lib/ path. This path
and file may exist on my building machine, but not on the target.

Fixes bug #8651.

> * Fixes https://bugs.busybox.net/show_bug.cgi?id=8651
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changelog:
> 
> v2 -> v3:
> The patch was based on mono master and not on mono 4.2.2.30.
> This patch is now based on mono 4.2.2.30.
> This patch was tested on br_next.
> 
> v1 -> v2:
> * Added SoB and description to patch
> 
> 
>  ....in-fixing-wrong-MonoPosixHelper-location.patch | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
> 
> diff --git a/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch b/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
> new file mode 100644
> index 0000000..6ebb802
> --- /dev/null
> +++ b/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
> @@ -0,0 +1,28 @@
> +From 76aa4fb62a433e61dc35eefcc3077f0463182d2f Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +Date: Tue, 23 Feb 2016 22:43:39 +0100
> +Subject: [PATCH] config.in: fixing wrong MonoPosixHelper location
> +
> +This patch remove a wrong prefix for libMonoPosixHelper
> +
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +---
> + data/config.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/data/config.in b/data/config.in
> +index b760176..41495b9 100644
> +--- a/data/config.in
> ++++ b/data/config.in
> +@@ -10,7 +10,7 @@
> + 	<dllmap dll="i:odbc32.dll" target="libiodbc.dylib" os="osx"/>
> + 	<dllmap dll="oci" target="libclntsh@libsuffix@" os="!windows"/>
> + 	<dllmap dll="db2cli" target="libdb2_36@libsuffix@" os="!windows"/>
> +-	<dllmap dll="MonoPosixHelper" target="@prefix@/@reloc_libdir@/libMonoPosixHelper@libsuffix@" os="!windows" />
> ++	<dllmap dll="MonoPosixHelper" target="libMonoPosixHelper@libsuffix@" os="!windows" />

 So 6b5f6dd0434b66062110cf764688975ecfed646f doesn't fix it? That would mean
that mono_assembly_getrootdir() is wrong, which is bound to lead to other
problems...


 Regards,
 Arnout

> + 	<dllmap dll="i:msvcrt" target="@LIBC@" os="!windows"/>
> + 	<dllmap dll="i:msvcrt.dll" target="@LIBC@" os="!windows"/>
> + 	<dllmap dll="sqlite" target="@SQLITE@" os="!windows"/>
> +-- 
> +1.9.1
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
