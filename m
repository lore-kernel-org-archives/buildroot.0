From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 2 Apr 2009 12:24:20 +1100
Subject: [Buildroot] [PATCH] libusb: Fix host autotools dependency
In-Reply-To: <1238533954-31225-1-git-send-email-mroth@nessie.de>
References: <1238533954-31225-1-git-send-email-mroth@nessie.de>
Message-ID: <20090402012420.GF29488@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 31, 2009 at 11:12:34PM +0200, Michael Roth wrote:
> Signed-off-by: Michael Roth <mroth@nessie.de>
> ---
>  package/libusb/libusb.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index bf831da..f7cad77 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -23,7 +23,7 @@ $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
>  libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
>  
>  libusb-unpacked: $(LIBUSB_DIR)/.unpacked
> -$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) $(LIBTOOL) $(DL_DIR)/$(LIBUSB_SOURCE)
> +$(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
>  	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  ifneq ($(LIBUSB_PATCH_FILE),)
>  	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
> @@ -58,7 +58,7 @@ $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/usr/lib/libusb.so
>  	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
>  	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
>  
> -libusb: uclibc host-pkgconfig $(TARGET_DIR)/$(LIBUSB_BINARY)
> +libusb: uclibc host-pkgconfig host-automake host-autoconf host-libtool $(TARGET_DIR)/$(LIBUSB_BINARY)

What does this fix?

I had lots of problems with libusb being rebuilt every time a while ago
with a change like the above. It might be better now with $(HOST_DIR)
etc. Please check.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
