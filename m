From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 23 Apr 2019 18:23:18 +0200
Subject: [Buildroot] [PATCH v2] package/libcamera: fix build failure due
 to lack of sys/auxv.h and getauxval()
In-Reply-To: <20190423160230.116737-1-giulio.benetti@micronovasrl.com>
References: <e5183324-b11e-19f0-4254-9a4bec412308@micronovasrl.com>
 <20190423160230.116737-1-giulio.benetti@micronovasrl.com>
Message-ID: <95d5d022-6161-8870-baa2-8803e172b2a0@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 23/04/2019 18:02, Giulio Benetti ha scritto:
> On some libc sys/auxv.h and getauxval() could not be present.
> 
> Add patch to check if they are present or not.
> 
> Fixes:
> http://autobuild.buildroot.net/results/80484849540786b913e353077cc4ff7c6443a4ca/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes:
> V1 -> V2: removed useless newlines in patch
> 
>   ...when-sys-auxv.h-and-getauxval-are-no.patch | 71 +++++++++++++++++++
>   1 file changed, 71 insertions(+)
>   create mode 100644 package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> 
> diff --git a/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch b/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> new file mode 100644
> index 0000000000..332a95ad76
> --- /dev/null
> +++ b/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> @@ -0,0 +1,71 @@
> +From cf9f63e63658d4df979e02708e435b9175a6c4f6 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Tue, 23 Apr 2019 12:50:15 +0200
> +Subject: [PATCH] meson: fix build when sys/auxv.h and getauxval() are not
> + present
> +
> +On some libc sys/auxv.h could not be present and getauxval() too.
> +This way build will fail.
> +
> +Check in meson if they are present and add HAVE_SYS_AUXV_H and
> +HAVE_GETAUXVAL defines to cxx arguments.
> +Add #ifdef HAVE_ statements around #include <sys/auxv.h> and getauxval()
> +in utils.cpp.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + meson.build             | 12 ++++++++++++
> + src/libcamera/utils.cpp |  4 ++++
> + 2 files changed, 16 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 6e68c3e..72a3652 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -20,6 +20,18 @@ common_arguments = [
> + c_arguments = common_arguments
> + cpp_arguments = common_arguments
> +
> ++cxx = meson.get_compiler('cpp')
> ++
> ++# check for header sys/auxv.h
> ++if cxx.has_header('sys/auxv.h')
> ++  cpp_arguments += ['-DHAVE_SYS_AUXV_H']
> ++endif
> ++
> ++# check for function getauxval()
> ++if cxx.has_function('getauxval')
> ++  cpp_arguments += ['-DHAVE_GETAUXVAL']
> ++endif
> ++
> + add_project_arguments(c_arguments, language: 'c')
> + add_project_arguments(cpp_arguments, language: 'cpp')
> +
> +diff --git a/src/libcamera/utils.cpp b/src/libcamera/utils.cpp
> +index cd0fd76..0fa915b 100644
> +--- a/src/libcamera/utils.cpp
> ++++ b/src/libcamera/utils.cpp
> +@@ -6,7 +6,9 @@
> +  */
> +
> + #include <string.h>
> ++#ifdef HAVE_SYS_AUXV_H
> + #include <sys/auxv.h>
> ++#endif
> +
> + #include "utils.h"
> +
> +@@ -57,8 +59,10 @@ const char *basename(const char *path)
> +  */
> + char *secure_getenv(const char *name)
> + {
> ++#ifdef HAVE_GETAUXVAL
> + 	if (getauxval(AT_SECURE))
> + 		return NULL;
> ++#endif
> +
> + 	return getenv(name);
> + }
> +--
> +2.17.1
> +
> 

Just talked to Kieran here:
https://lists.libcamera.org/pipermail/libcamera-devel/2019-April/002616.html

This patch makes no sense since it exposes libcamera to set-uid attacks.
And meson.build can be treated better with creation of "config.h" file 
instead of passing -DHAVE_*

I set it as rejected on Patchwork.
Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
