From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 14:07:02 +0100
Subject: [Buildroot] [PATCH v1] libdrm: fix libatomic_ops linking
In-Reply-To: <20171216195516.27144-1-ps.report@gmx.net>
References: <20171216195516.27144-1-ps.report@gmx.net>
Message-ID: <20171218140702.51454002@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 20:55:16 +0100, Peter Seiderer wrote:
> Add explicit libatomic_ops linking, fixes etnavid tests linking
> 
> Fixes [1]:
> 
>     CCLD     etnaviv_cmd_stream_test
>   ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_store_full_emulation'
>   ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
>   collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/92e074c49417261843eef95872ff935a56077c98
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libdrm/libdrm.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 3d7b67122b..ecc525ca1e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -21,6 +21,7 @@ LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
>  
>  ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>  LIBDRM_DEPENDENCIES += libatomic_ops
> +LIBDRM_CONF_ENV += LIBS="-latomic_ops"
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
>  LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
>  endif

I think this is not the correct fix, because you will link against
atomic_ops as soon as libatomic_ops is available for the target, even
when libdrm doesn't need it (like when it uses the atomic built-ins of
the compiler).

I think the right approach is to fix libdrm instead to use pkg-config
to detect libatomic_ops and link against it when needed. See the
attached libdrm patch that does this (tested successfully with the
breaking SPARC configuration).

You just need to modify libdrm.mk for autoreconf, which includes the
need to add host-xutil_util-macros to the dependencies.

Could you have a look at this, and if it also works for you, submit it
as a patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
Type: text/x-patch
Size: 5811 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171218/ff16bd45/attachment.bin>
