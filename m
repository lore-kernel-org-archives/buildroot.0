From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 30 Dec 2009 14:07:02 +0100
Subject: [Buildroot] [PATCH] jpeg: convert to autotools infrastructure
In-Reply-To: <87637ovd01.fsf@macbook.be.48ers.dk>
References: <4d28d4b50912290214u6b15af37nbefdf6b672b87c3d@mail.gmail.com>
	<87aax1v6zy.fsf@macbook.be.48ers.dk>
	<1262123141.5867.51.camel@coalu.atr>
	<87637ovd01.fsf@macbook.be.48ers.dk>
Message-ID: <4d28d4b50912300507j42de4b9bn7068347f3827c19e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 30, 2009 at 1:54 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
>
>  Lionel> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
>
> Thanks, this time it came through ok.
>
> Committed with some changes, see below.
>
>
>  Lionel> -$(STAGING_DIR)/usr/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
>  Lionel> -      $(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install
>  Lionel> -      cp -f $(JPEG_DIR)/libjpeg.la $(STAGING_DIR)/usr/lib
>  Lionel> +define JPEG_INSTALL_STAGING_CMDS
>  Lionel> +      $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
>  Lionel>        $(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g"
> $(STAGING_DIR)/usr/lib/libjpeg.la
>  Lionel> -      touch -c $@
>  Lionel> +endef
>
> The standard staging install handling does this as well, so there's no
> need for this.
>

Are you sure it does sed on libjpeg.la ?
I tried without specifying JPEG_INSTALL_STAGING_CMDS and didn't see a
libjpeg.la containing the staging directory.


>
>  Lionel> -$(TARGET_DIR)/usr/lib/libjpeg.so:
> $(STAGING_DIR)/usr/lib/libjpeg.a
>  Lionel> +define JPEG_INSTALL_TARGET_CMDS
>  Lionel>        mkdir -p $(TARGET_DIR)/usr/lib
>  Lionel>        cp -dpf $(STAGING_DIR)/usr/lib/libjpeg.so*
> $(TARGET_DIR)/usr/lib/
>  Lionel>        -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
> $(TARGET_DIR)/usr/lib/libjpeg.so*
>
> It's better to use the existing make install, as that also installs
> headers/manpages/.. for the people having that enabled and then just use
> a post-install hook to clean up anything else (in this case the
> binaries).
>

I will remember that for next patches, thx.

--
Lionel Landwerlin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091230/4c4480f9/attachment.htm>
