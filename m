From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Aug 2014 22:48:39 +0300
Subject: [Buildroot] [PATCH] gstreamer{,
 1}: fix unaligned access detection for arc
In-Reply-To: <1408464415-18240-1-git-send-email-abrodkin@synopsys.com>
References: <1408464415-18240-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140819194839.GB2405@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Tue, Aug 19, 2014 at 08:06:55PM +0400, Alexey Brodkin wrote:
> Fixes the same issue as reported for microblaze here
> http://autobuild.buildroot.net/results/f49/f4914bb3999c8a7a0c0a2afdac5de40fb9058372/
> 
> Similar to the existing handling for avr32, microblaze and xtensa.
> Also add it for gstreamer1 for good measure as it was missing there as well.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gstreamer/gstreamer/gstreamer.mk    | 3 +++
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
> index 4696876..8e0b042 100644
> --- a/package/gstreamer/gstreamer/gstreamer.mk
> +++ b/package/gstreamer/gstreamer/gstreamer.mk
> @@ -18,6 +18,9 @@ endif
>  ifeq ($(BR2_aarch64),y)
>  GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
>  endif
> +ifeq ($(BR2_arc),y)
> +GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
> +endif

Instead of adding another 'ifeq' stanza, why not add ARC to the existing list 
of architectures? Something like:

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 4696876d396e..23ad3919f6ee 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze)$(BR2_arc),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index bf2358234bb3..6546dc9dc8ef 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -14,7 +14,7 @@ GSTREAMER1_LICENSE = LGPLv2+ LGPLv2.1+
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa)$(BR2_microblaze)$(BR2_arc),y)
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
