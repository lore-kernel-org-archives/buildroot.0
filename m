From: Christian Stewart <christian@paral.in>
Date: Tue, 8 Sep 2020 22:24:25 -0700
Subject: [Buildroot] [PATCH 1/1] package/rtl8821au: fix build against
 5.8.x kernel
In-Reply-To: <20200909033227.70098-1-christian@paral.in>
References: <20200909033227.70098-1-christian@paral.in>
Message-ID: <CA+h8R2rvRCWGAn_zCt4tYJRhfsYUGQHeWwrjiQYvRSgoWXx-0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Tue, Sep 8, 2020 at 8:32 PM Christian Stewart <christian@paral.in> wrote:
>
> sha256_state collides with symbols in the kernel, rename it to rtl_sha256_state.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...ate-to-rtl_sha256_state-to-avoid-nam.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
>
> diff --git a/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch b/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
> new file mode 100644
> index 0000000000..41cee2b247
> --- /dev/null
> +++ b/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
> @@ -0,0 +1,79 @@
> +From 19aee91e45788d594615a9be58fa5d0879ec816a Mon Sep 17 00:00:00 2001
> +From: youcai <omegacoleman@gmail.com>
> +Date: Tue, 18 Aug 2020 00:43:16 +0800
> +Subject: [PATCH] rename sha256_state to rtl_sha256_state to avoid name
> + conflict with crypto
> +
> +[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/338/commits/af6f6c1578f16145478326a939bb7593bbcdb4e7.patch]
> +Signed-off-by: Coleman <omegacoleman@gmail.com>
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + core/rtw_security.c    | 10 +++++-----
> + include/rtw_security.h |  2 +-
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/core/rtw_security.c b/core/rtw_security.c
> +index d54e6af..de2d91f 100644
> +--- a/core/rtw_security.c
> ++++ b/core/rtw_security.c
> +@@ -2200,7 +2200,7 @@ BIP_exit:
> +
> + #ifndef PLATFORM_FREEBSD
> + /* compress 512-bits */
> +-static int sha256_compress(struct sha256_state *md, unsigned char *buf)
> ++static int sha256_compress(struct rtl_sha256_state *md, unsigned char *buf)
> + {
> +       u32 S[8], W[64], t0, t1;
> +       u32 t;
> +@@ -2249,7 +2249,7 @@ static int sha256_compress(struct sha256_state *md, unsigned char *buf)
> + }

While this fixes some errors, there are some build errors still against 5.8.x:

../rtl8821au/os_dep/linux/ioctl_cfg80211.c:6024:3: error: ?struct
cfg80211_ops? has no member named ?mgmt_frame_register?
 6024 |  .mgmt_frame_register = cfg80211_rtw_mgmt_frame_register,
      |   ^~~~~~~~~~~~~~~~~~~
../rtl8821au/os_dep/linux/ioctl_cfg80211.c:6024:25: error:
initialization of ?int (*)(struct wiphy *, struct wireless_dev *,
u64)? {aka ?int (*)(struct wiphy *, struct wireless_dev *, long long
unsigned int)?} from incompatible pointer type ?void (*)(struct wiphy
*, struct wireless_dev *, u16,  bool)? {aka ?void (*)(struct wiphy *,
struct wireless_dev *, short unsigned int,  _Bool)?}
[-Werror=incompatible-pointer-types]
 6024 |  .mgmt_frame_register = cfg80211_rtw_mgmt_frame_register,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../rtl8821au/os_dep/linux/ioctl_cfg80211.c:6024:25: note: (near
initialization for ?rtw_cfg80211_ops.mgmt_tx_cancel_wait?)
cc1: all warnings being treated as errors

Marking as changes requested for now.

Best regards,
Christian Stewart
