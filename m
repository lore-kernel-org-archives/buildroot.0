From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Sep 2010 23:30:01 +0200
Subject: [Buildroot] [PATCH 18/74] usbutils: convert old-style hook to
	new-style hook
In-Reply-To: <fcab98c31bd05bfa294fd9705275832e4256dcb1.1284312638.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Sep 2010 19:42:04 +0200")
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<cover.1284312638.git.thomas.petazzoni@free-electrons.com>
	<fcab98c31bd05bfa294fd9705275832e4256dcb1.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87eicyk5uu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/usbutils/usbutils.mk |   30 +++++++++++++++++++++++-------
 Thomas>  1 files changed, 23 insertions(+), 7 deletions(-)

 Thomas>  	rm -f $(TARGET_DIR)/usr/share/pkgconfig/usbutils.pc
 Thomas> -ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 Thomas> +endef
 Thomas> +
 Thomas> +USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_TARGET_CLEANUP
 Thomas> +
 Thomas> +define USBUTILS_REMOVE_UNCOMPRESSED_IDS
 Thomas>  	rm -f $(TARGET_DIR)/usr/share/usb.ids
 Thomas> -else
 Thomas> +endef
 Thomas> +
 Thomas> +define USBUTILS_REMOVE_COMPRESSED_IDS
 Thomas>  	rm -f $(TARGET_DIR)/usr/share/usb.ids.gz
 Thomas> +endef
 Thomas> +
 Thomas> +ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 Thomas> +USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_UNCOMPRESSED_IDS
 Thomas> +else
 Thomas> +USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_COMPRESSED_IDS
 Thomas>  endif

I know this was how it was done before as well, but are you sure this is
correct? It would make more sense if the .gz was used when the ZLIB
support was enabled.

Perhaps we should just simplify it and use
rm -f $(TARGET_DIR)/usr/share/usb.ids*

-- 
Bye, Peter Korsgaard
