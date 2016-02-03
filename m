From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 22:54:02 +0100
Subject: [Buildroot] [PATCH v2 1/3] libffi: fix headers location for
 host-libffi
In-Reply-To: <1451978244-15878-2-git-send-email-yegorslists@googlemail.com>
References: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
 <1451978244-15878-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160203225402.4d29a0d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jan 2016 08:17:22 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> There is a special hook for target-libffi, that moves headers
> from /usr/lib/libffi-version/include to /usr/include. This patch
> adds the same procedure for host-libffi.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/libffi/libffi.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
> index 8f0f72d..47de8cd 100644
> --- a/package/libffi/libffi.mk
> +++ b/package/libffi/libffi.mk
> @@ -22,6 +22,17 @@ endef
>  
>  LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
>  
> +# Move the headers to the usual location, and adjust the .pc file
> +# accordingly.
> +define HOST_LIBFFI_MOVE_HOST_HEADERS
> +	mv $(HOST_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(HOST_DIR)/usr/include/
> +	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
> +		$(HOST_DIR)/usr/lib/pkgconfig/libffi.pc
> +	rm -rf $(HOST_DIR)/usr/lib/libffi-*
> +endef
> +
> +HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS

I've applied, but after doing some changes. First, the existing staging
fixup had a mistake, it was removing the directory from $(TARGET_DIR),
while it should have been removed from $(STAGING_DIR). I've fixed that
in a preparation commit:

  https://git.busybox.net/buildroot/commit/?id=2b73538920107b6c020ce5c4c8d9f7f672549bb1

Once this was fixed, your new code to take care of headers in
$(HOST_DIR) was exactly the same as the one taking care of the headers
in $(STAGING_DIR). So I've factorized the code in a common function,
which takes as argument the base directory. Which gives:

  https://git.busybox.net/buildroot/commit/?id=f41091176bb3e8da6cf78760b69f188e9868a259

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
