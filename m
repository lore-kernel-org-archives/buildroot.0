From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 May 2014 15:50:05 +0300
Subject: [Buildroot] [PATCH v2] protobuf: fix build for some unsupported
	architectures
In-Reply-To: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
References: <9c3886fc2455083ce084000e1741ce4be02675e6.1399552091.git.baruch@tkos.co.il>
Message-ID: <20140508125005.GK3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

On Thu, May 08, 2014 at 03:28:11PM +0300, Baruch Siach wrote:
> Add patches for making use of generic gcc atomic operations for unknown
> architectures. Patches taken from
> http://code.google.com/p/protobuf/issues/detail?id=488 .
> 
> Disable build for architectures that are not supported.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7e5/7e5791225334096206887de8a38fd947e1f8e9a2/
> http://autobuild.buildroot.net/results/cf1/cf147b9188d6787a6a1a6072bf9bc6f7ddf5e5ae/
> 
> Cc: Phil Eichinger <phil.eichinger@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
> 	List supported architectures as dependencies, as this list is much shorter
> 	than the list of unsupported archs.
> ---
>  package/protobuf/Config.in                         |   4 +
>  ...generic-GCC-support-for-atomic-operations.patch | 214 +++++++++++++++++++++
>  ...-02-Add-generic-gcc-header-to-Makefile.am.patch |  31 +++
>  package/protobuf/protobuf.mk                       |   2 +
>  4 files changed, 251 insertions(+)
>  create mode 100644 package/protobuf/protobuf-01-Add-generic-GCC-support-for-atomic-operations.patch
>  create mode 100644 package/protobuf/protobuf-02-Add-generic-gcc-header-to-Makefile.am.patch
> 
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index a4f542e0fce1..98e0d398e949 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_PROTOBUF
>  	bool "protobuf"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
> +	    BR2_mipsel || BR2_powerpc

Forgot to propagate dependencies, sorry. Will fix in v3.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
