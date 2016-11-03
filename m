From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 07:58:05 +0200
Subject: [Buildroot] [PATCH 1/1] berkeleydb: fix build on powerpc64le
In-Reply-To: <8e91fa81e0236517f95907ca16ac00830306854a.1478151515.git.sam.bobroff@au1.ibm.com>
References: <8e91fa81e0236517f95907ca16ac00830306854a.1478151515.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161103055805.z67aqczyccsgmnax@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Thu, Nov 03, 2016 at 04:38:41PM +1100, Sam Bobroff wrote:
> Fixes
> http://autobuild.buildroot.net/results/964326466789f8d6ff8a064327c38cf145409ab0
> 
> The issue appears as a link failure in exim, where pthread symbols are
> undefined (they are not even used by the binary that causes the first
> failure). This is caused by libdb (used by exim) producing static
> rather than shared libraries, and this is due to berkeleydb's
> configure failing to correctly detect shared library support.
> 
> Add a case for powerpc64le to allow correct detection of shared library
> support in the linker.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> 
>  .../berkeleydb/0001-configure-powerpc64le.patch    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/berkeleydb/0001-configure-powerpc64le.patch
> 
> diff --git a/package/berkeleydb/0001-configure-powerpc64le.patch b/package/berkeleydb/0001-configure-powerpc64le.patch
> new file mode 100644
> index 0000000..1f76562
> --- /dev/null
> +++ b/package/berkeleydb/0001-configure-powerpc64le.patch
> @@ -0,0 +1,29 @@
> +Currently, dist/configure on powerpc64le fails to determine the
> +availability of shared library support in the toolchain, causing
> +static libraries to be built even when shared libraries are supported.
> +This can lead to linker failures in packages that use libdb.
> +
> +Add a case for powerpc64le which corrects the problem.
> +
> +Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> +---
> + dist/configure | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/dist/configure b/dist/configure
> +index db718de..81f2fae 100755
> +--- a/dist/configure
> ++++ b/dist/configure
> +@@ -9330,6 +9330,9 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
> + 	  x86_64-*linux*)
> + 	    LD="${LD-ld} -m elf_x86_64"
> + 	    ;;
> ++	  ppc64le-*linux*|powerpc64le-*linux*)
> ++	    LD="${LD-ld} -m elf64lppc"
> ++	    ;;
> + 	  ppc*-*linux*|powerpc*-*linux*)

This is strange. This older pattern looks like a superset of your new pattern. 
Why doesn't it work?

baruch

> + 	    LD="${LD-ld} -m elf64ppc"
> + 	    ;;

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
