From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 23 Apr 2019 13:01:03 +0200
Subject: [Buildroot] [PATCH] package/libcamera: fix build failure due to
 lack of sys/auxv.h and getauxval()
In-Reply-To: <20190423105942.113130-1-giulio.benetti@micronovasrl.com>
References: <20190423105942.113130-1-giulio.benetti@micronovasrl.com>
Message-ID: <c1e9aa37-9bea-e627-37d4-246fe739c5f9@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 23/04/2019 12:59, Giulio Benetti ha scritto:
> On some libc sys/auxv.h and getauxval() could not be present.
> 
> Add patch to check if they are present or not.
> 
> Fixes:
> http://autobuild.buildroot.net/results/80484849540786b913e353077cc4ff7c6443a4ca/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   ...when-sys-auxv.h-and-getauxval-are-no.patch | 78 +++++++++++++++++++
>   1 file changed, 78 insertions(+)
>   create mode 100644 package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> 
> diff --git a/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch b/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> new file mode 100644
> index 0000000000..1cda49dddf
> --- /dev/null
> +++ b/package/libcamera/0001-meson-fix-build-when-sys-auxv.h-and-getauxval-are-no.patch
> @@ -0,0 +1,78 @@
> +From 0a0541a82b7f1b2dd906ad6bab18cf99c5a6f72d Mon Sep 17 00:00:00 2001
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
> + meson.build             | 14 ++++++++++++++
> + src/libcamera/utils.cpp |  4 ++++
> + 2 files changed, 18 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 6e68c3e..3165235 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -20,11 +20,25 @@ common_arguments = [
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
> + libcamera_includes = include_directories('include')
> +
> ++
> ++
> + subdir('include')
> + subdir('src')
> + subdir('utils')
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

I'm going to upstream it and patch will be slightly different because of 
utils.cpp file changed a little bit.

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
