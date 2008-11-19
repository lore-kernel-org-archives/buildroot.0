From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 19 Nov 2008 15:46:43 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <20081119122740.GB4797@mx.loc>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811190421r6612519ek47ef41d9f7434890@mail.gmail.com>
	<20081119122740.GB4797@mx.loc>
Message-ID: <e4c675870811190646h1fa99a88k478fef83dc05693c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/19 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:

[cut]

>> $(FREETYPE_HOOK_POST_BUILD):
>>-      -cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
>>+      mkdir -p $(TARGET_DIR)/usr/lib
>>+      cp -af $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib
>
> This will not work properly for a number of host systems (see ML archives)
> Either use "cp -dpRf" or the preferred $(INSTALL), like:
>
>        $(INSTALL) -d $(TARGET_DIR)/usr/lib
>        $(INSTALL) -m0644 $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
>
>>       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
>>       $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
>>       $(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
>

 Ok, acknowledged and reported http://bugs.uclibc.org/view.php?id=6394

 There is another problem related to libfreetype which happens in grub
and probably Mesa package too.

 At least these three packages relay on .installed flag and sometimes
it does not do its job properly and the package would not be installed
expecially if root and .root has been removed in order to regenerate
them

roberto at rafbook:~/gles/buildroot.002$ find build_i586 -name .installed
build_i586/Mesa-7.0.3/.installed
build_i586/font-util-1.0.1/.installed
build_i586/grub-0.97/.installed

 My personal solution is adding some makefile targets called rootclean
and softclean an expressing all clean targets in that way:

-clean: $(TARGETS_CLEAN)
-       rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
$(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps

-dirclean: $(TARGETS_DIRCLEAN)
-       rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
$(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps
+install: softclean all

+softclean:
+       rm -rf $(IMAGE) $(PROJECT_BUILD_DIR)/autotools-stamps
+       rm -f $(find $(BUILD_DIR) -name .installed | grep -v _staging_)
+
+rootclean: softclean
+       rm -rf $(TARGET_DIR) $(PROJECT_BUILD_DIR)/.root
+
+clean: $(TARGETS_CLEAN) rootclean
+       rm -rf $(STAGING_DIR)
+
+dirclean: $(TARGETS_DIRCLEAN) clean
+

 I know this patch has been criticized but I hope its evolution could
be better rated than previous.

 http://bugs.uclibc.org/view.php?id=5614

 Please remember that this report is still open and users are expect
that "make clean; make" works properly


 Ciao,
-- 
/roberto
