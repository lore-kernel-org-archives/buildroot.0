From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 18:42:02 +0200
Subject: [Buildroot] [PATCH 1/9] skalibs: bump version to 2.5.1.1
In-Reply-To: <20170625192621.24188-2-eric.le.bihan.dev@free.fr>
References: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
 <20170625192621.24188-2-eric.le.bihan.dev@free.fr>
Message-ID: <93a8a941-632d-6f2e-3f1d-770188d114ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Eric,

On 25-06-17 21:26, Eric Le Bihan wrote:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[snip]
> + trytypes () {
> +   echo "Checking size and signedness of standard types..."
> +-  $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o output-types src/sysdeps/output-types.c
> +-  ./output-types >> $sysdeps/sysdeps
> +-  ./output-types | grep -F sizeof | while read key value ; do
> +-    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
> +-    echo "#define ${package_macro_name}_${caps} $value" >> $sysdeps/sysdeps.h
> ++  for t in "unsigned short" "unsigned int" "unsigned long"; do
> ++    findtypesize "$t" "${t/nsigned /}"

 This fails in the autobuilders because it is a bashism, and on some machines
/bin/sh is dash. Care to fix?

 Regards,
 Arnout

> +   done
> +-  ./output-types | grep -F signed | while read key value ; do
> +-    caps=$(echo $key | sed s/:\$// | tr a-z A-Z)
> +-    if test $value = yes ; then
> +-      echo "#define ${package_macro_name}_HASSIGNED${caps}"
> +-      echo "#undef ${package_macro_name}_HASUNSIGNED${caps}"
> +-    else
> +-      echo "#undef ${package_macro_name}_HASSIGNED${caps}"
> +-      echo "#define ${package_macro_name}_HASUNSIGNED${caps}"
> +-    fi >> $sysdeps/sysdeps.h
> ++  for t in size uid gid pid time dev ino; do
> ++    findtypesize "${t}_t" "$t"
> ++    findtypesign "${t}_t" "$t"
> +   done
> +-  rm -f output-types
> +   echo "  ... done"
> + }
> + 
>  -- 
> -2.5.5
> +2.9.3
>  
> diff --git a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
> index ef0e173..55cc96a 100644
> --- a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
> +++ b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
> @@ -1,4 +1,4 @@
> -From da293110f429e1206728c1551cf0f6b462b3d8c0 Mon Sep 17 00:00:00 2001
> +From 4d9aca413b42191223d8dc2ba9b4f943ee90c94b Mon Sep 17 00:00:00 2001
>  From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>  Date: Thu, 29 Dec 2016 19:36:24 +0100
>  Subject: [PATCH] Make linker use dummy file when testing libs
> @@ -18,10 +18,10 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/configure b/configure
> -index 1579025..12980fb 100755
> +index 115fea3..7d38447 100755
>  --- a/configure
>  +++ b/configure
> -@@ -173,7 +173,7 @@ trylibs () {
> +@@ -226,7 +226,7 @@ trylibs () {
>     echo "Checking whether system has $2..." >&3
>     shift 2
>     if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
> @@ -30,7 +30,7 @@ index 1579025..12980fb 100755
>         if test -z "$*" ; then
>           rm -f try$name.o
>           echo
> -@@ -189,7 +189,7 @@ trylibs () {
> +@@ -242,7 +242,7 @@ trylibs () {
>       else
>         echo "  ... yes, with$args" >&3
>       fi
> @@ -40,5 +40,5 @@ index 1579025..12980fb 100755
>     else
>       echo
>  -- 
> -2.4.11
> +2.9.3
>  
> diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
> index 195ac47..8ab7234 100644
> --- a/package/skalibs/skalibs.hash
> +++ b/package/skalibs/skalibs.hash
> @@ -1,2 +1,2 @@
>  # Locally generated
> -sha256 0708172bc2ec9825f8a4f312d35f8dcd94da5f291425a598c33c873b3de77df8 skalibs-2.4.0.2.tar.gz
> +sha256 aa387f11a01751b37fd32603fdf9328a979f74f97f0172def1b0ad73b7e8d51d  skalibs-2.5.1.1.tar.gz
> diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
> index 55b8a29..c6f97ee 100644
> --- a/package/skalibs/skalibs.mk
> +++ b/package/skalibs/skalibs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SKALIBS_VERSION = 2.4.0.2
> +SKALIBS_VERSION = 2.5.1.1
>  SKALIBS_SITE = http://skarnet.org/software/skalibs
>  SKALIBS_LICENSE = ISC
>  SKALIBS_LICENSE_FILES = COPYING
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
