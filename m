From: hartleys <hartleys@visionengravers.com>
Date: Tue, 1 Jul 2008 14:51:10 -0400
Subject: [Buildroot] Ncurses install problem
In-Reply-To: <C48FE36B.18B7D%bkubesh@cisco.com>
References: <BD79186B4FD85F4B8E60E381CAEE19092972E4@mi8nycmail19.Mi8.com>
	<C48FE36B.18B7D%bkubesh@cisco.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909297360@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, July 01, 2008 11:41 AM, Peter Korsgaard wrote:

> What is the permissions on $TARGET_DIR/usr/lib and
> $TARGET_DIR/usr/lib/terminfo ?

Everything is built in my HOME directory so all the permissions are set
for me.

The problem might actually be what Blaine describes below:

Hartley

------------------

On Tuesday, July 01, 2008 11:37 AM, Blaine Kubesh wrote:
> I ran into the same thing. Here is my post from 6/2/08.
>
> There is a typo/bug on the commit from 3/31/08. It should be
> soft linking into the TARGET_DIR and not the host filesystem.
>
> -    ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
> +    ln -sf $(TARGET_DIR)/usr/share/terminfo 
> + $(TARGET_DIR)/usr/lib/terminfo
>
> I suppose I should post a patch file instead of just describing
> the problem.
> I will follow up with a patch file for commit.

-Blaine


On 6/2/08 8:24 PM, "Blaine Kubesh" <bkubesh@cisco.com> wrote:

> I was looking into the error:
> 
> -----
> ln -sf /usr/share/terminfo /$(TARGET_DIR)/usr/lib/terminfo
> ln: creating symbolic link `$(TARGET_DIR)/usr/lib/terminfo/terminfo' 
> to
> `/usr/share/terminfo': Permission denied
> -----
> 
> The source of the problem is related to a commit on March 31, 2008.
> 
> The first diff line should use $(TARGET_DIR)/usr/share and not the 
> host system's /usr/share:
> -    -cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
> +    ln -sf $(TARGET_DIR)/usr/share/terminfo 
> + $(TARGET_DIR)/usr/lib/terminfo
> 
> ====
> 
> --- trunk/buildroot/package/ncurses/ncurses.mk    2008/03/26 03:28:09
21494
> +++ trunk/buildroot/package/ncurses/ncurses.mk    2008/03/31 14:44:32
21596
> @@ -104,7 +104,7 @@
>  
>  $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION):
> $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
>      cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
> -    -cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
> +    ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
>      mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
>      cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm
> $(TARGET_DIR)/usr/share/terminfo/x
>      cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color
> $(TARGET_DIR)/usr/share/terminfo/x
> @@ -129,8 +129,7 @@
>      cp -dpf $(NCURSES_DIR)/include/unctrl.h
$(TARGET_DIR)/usr/include/
>      cp -dpf $(NCURSES_DIR)/include/termcap.h
$(TARGET_DIR)/usr/include/
>      cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
> -    rm -f $(TARGET_DIR)/usr/lib/terminfo
> -    (cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo; \
> +    (cd $(TARGET_DIR)/usr/lib; \
>       ln -fs libncurses.a libcurses.a; \
>       ln -fs libncurses.a libtermcap.a; \
>      )
> @@ -151,6 +150,7 @@
>      rm -f $(STAGING_DIR)/usr/lib/libncurses.so*
> $(TARGET_DIR)/usr/lib/libncurses.so*
>      rm -rf $(STAGING_DIR)/usr/share/tabset
$(TARGET_DIR)/usr/share/tabset
>      rm -rf $(STAGING_DIR)/usr/share/terminfo 
> $(TARGET_DIR)/usr/share/terminfo
> +    rm -rf $(TARGET_DIR)/usr/lib/terminfo
>      -$(MAKE) -C $(NCURSES_DIR) clean
>  
>  ncurses-dirclean:
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
