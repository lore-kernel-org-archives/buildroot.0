From: Blaine Kubesh <bkubesh@cisco.com>
Date: Tue, 01 Jul 2008 13:36:43 -0500
Subject: [Buildroot] Ncurses install problem
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19092972E4@mi8nycmail19.Mi8.com>
Message-ID: <C48FE36B.18B7D%bkubesh@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I ran into the same thing. Here is my post from 6/2/08.

There is a typo/bug on the commit from 3/31/08. It should be soft linking
into the TARGET_DIR and not the host filesystem.

-    ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
+    ln -sf $(TARGET_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo

I suppose I should post a patch file instead of just describing the problem.
I will follow up with a patch file for commit.

-Blaine


On 6/2/08 8:24 PM, "Blaine Kubesh" <bkubesh@cisco.com> wrote:

> I was looking into the error:
> 
> -----
> ln -sf /usr/share/terminfo /$(TARGET_DIR)/usr/lib/terminfo
> ln: creating symbolic link `$(TARGET_DIR)/usr/lib/terminfo/terminfo' to
> `/usr/share/terminfo': Permission denied
> -----
> 
> The source of the problem is related to a commit on March 31, 2008.
> 
> The first diff line should use $(TARGET_DIR)/usr/share and not the host
> system's /usr/share:
> -    -cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
> +    ln -sf $(TARGET_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
> 
> ====
> 
> --- trunk/buildroot/package/ncurses/ncurses.mk    2008/03/26 03:28:09    21494
> +++ trunk/buildroot/package/ncurses/ncurses.mk    2008/03/31 14:44:32    21596
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
>      cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
>      cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
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
>      rm -rf $(STAGING_DIR)/usr/share/tabset $(TARGET_DIR)/usr/share/tabset
>      rm -rf $(STAGING_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/share/terminfo
> +    rm -rf $(TARGET_DIR)/usr/lib/terminfo
>      -$(MAKE) -C $(NCURSES_DIR) clean
>  
>  ncurses-dirclean:
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot



On 7/1/08 12:21 PM, "hartleys" <hartleys@visionengravers.com> wrote:

> Hello all,
> 
> I just did a clean (make package_name-dirclean) on my buildroot setup
> and started a make. Everything goes along fine until it gets to the:
> 
> $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): ...
> 
> Section of ncurses.mk. A couple lines down in that section there is a:
> 
> ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
> 
> On that line I get the following during the make:
> 
> ln -sf /usr/share/terminfo
> /home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/terminf
> o
> ln: creating symbolic link
> `/home/bigguiness/buildroot/project_build_arm/ep9307/root/usr/lib/termin
> fo' to `/usr/share/terminfo': Permission deined
> Make: ***
> [/home/bigguiness/buildroot/project_build_arm/ep9307/root/lib/libncurses
> .so.5.6] Error 1
> 
> I'm not sure what changed but everything was working fine before I did
> the -dirclean.
> 
> Any ideas why the link is failing?
> 
> Thanks,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
