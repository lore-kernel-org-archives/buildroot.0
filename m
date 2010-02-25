From: William Wagner <will_wagner@carallon.com>
Date: Thu, 25 Feb 2010 17:13:38 +0000
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
 autotools infrastructure
In-Reply-To: <20100223202924.D6947776A1@busybox.osuosl.org>
References: <20100223202924.D6947776A1@busybox.osuosl.org>
Message-ID: <4B86AFC2.1010508@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/2010 20:27, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=abc1479ea795a18a743ea513e33179058bdfe6b6
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/x11r7/xfont_font-util/xfont_font-util.mk |   74 ++--------------------
>   1 files changed, 6 insertions(+), 68 deletions(-)
>
> diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
> index 38e7e80..88dce38 100644
> --- a/package/x11r7/xfont_font-util/xfont_font-util.mk
> +++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
> @@ -5,76 +5,14 @@
>   ################################################################################
>
>   XFONT_FONT_UTIL_VERSION = 1.0.1
> -XFONT_FONT_UTIL_NAME = font-util-$(XFONT_FONT_UTIL_VERSION)
>   XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
>   XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
> -XFONT_FONT_UTIL_AUTORECONF = NO
> -XFONT_FONT_UTIL_DIR=$(BUILD_DIR)/$(XFONT_FONT_UTIL_NAME)
> -XFONT_FONT_UTIL_CAT:=$(BZCAT)
> +XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
>
> -$(DL_DIR)/$(XFONT_FONT_UTIL_SOURCE):
> -	 $(call DOWNLOAD,$(XFONT_FONT_UTIL_SITE),$(XFONT_FONT_UTIL_SOURCE))
> +define XFONT_FONT_UTIL_POST_INSTALL_FIXES
> + $(@D)/post-install.sh $(STAGING_DIR)
> +endef
>
>    
Have just pulled this change and it does not work. The problem is that 
$(@D) is output/build/xfont_font-util-1.0.1 as the rule we are currently 
evaluating is 
output/build/xfont_font-util-1.0.1/.stamp_staging_installed but the 
script is in package/x11r7/xfont_font-util

The attached patch fixes this issue


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0001-fix-call-of-post-install-sh.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100225/c89d0c7b/attachment-0001.diff>
