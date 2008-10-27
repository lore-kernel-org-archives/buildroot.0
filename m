From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 27 Oct 2008 21:49:27 +0100
Subject: [Buildroot] [PATCH] Avoid make distclean to remove
	packages	fromrootfs
In-Reply-To: <e4c675870810271342l7cb8d57eo824d1238bcf18ab3@mail.gmail.com>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
	<COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
	<e4c675870810271342l7cb8d57eo824d1238bcf18ab3@mail.gmail.com>
Message-ID: <20081027204927.GF14184@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 27, 2008 at 09:42:42PM +0100, Roberto A. Foglietta wrote:
>2008/10/22 John Schimandle <john_schimandle@hotmail.com>:
>> I perform the following steps to rebuild the rootfs. It's fast and easy.
>>
>> rm project_build_ARCH/PROJECT/.root
>> rm -rf project_build_ARCH/PROJECT/root
>>
>
>^^^^ these lines are not enough and sometime are too much (i.e.: about
>losing the customization)
>
>rm -rf project_build_ARCH/PROJECT/autotools-stamps
>
>^^^^ this line resolves the problem to reinstall everything (apart
>libfreetype which buggy installation put them in staging_dir but not
>in target_dir)
>
>> Once these steps are done then the next make will copy in a clean skeleton
>> template and all the other Makefiles will notice the install targets are
>> missing and they will install all the targets. This is the cleanest and
>> fastest method I have found because this only copies files.
>>
>> Maybe this should be added to the top level Makefile.
>
>
>Attached patch allow two more targets:
>
>make install
>
>or
>
>make rootclean install
>
>
> I hope this helps,
>-- 
>/roberto

>--- Makefile	(revision 23784)
>+++ Makefile	(working copy)
>@@ -324,7 +324,7 @@
> 		touch $(STAGING_DIR)/.fakeroot.00000; \
> 	fi
> 	-find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
>-	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf	
>+	-find $(TARGET_DIR) -type f -name .empty -delete
> 	touch $@
> 
> $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
>@@ -341,6 +341,7 @@
> 	find $(TARGET_DIR)/lib -name '*.a' -delete
> 	find $(TARGET_DIR)/usr/lib -name '*.la' -delete
> 	find $(TARGET_DIR)/lib -name '*.la' -delete
>+	find $(TARGET_DIR) -type f -name '*~' -delete

No. Use xargs instead.
> endif
> 
> source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>@@ -357,6 +358,19 @@
> # Cleanup and misc junk
> #
> #############################################################
>+
>+install: softclean all
>+	# TODO: to fix this bug in the proper way
>+	name=$$(find $(STAGING_DIR) -name 'libfreetype.so'); \
>+	dest=$$(dirname $$name | sed -e "s,$(STAGING_DIR),$(TARGET_DIR),"); \
>+	cp -af $$name* $$dest; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$dest/libfreetype.so
>+	
>+rootclean:
>+	rm -rf $(TARGET_DIR) $(PROJECT_BUILD_DIR)/.root
>+
>+softclean:
>+	rm -rf $(IMAGE) $(PROJECT_BUILD_DIR)/autotools-stamps
>+

No. Adding yet more targets makes absolutely no sense at all.
Just make 'make clean' wipe the stamps and let 'make realclean' wipe the
built stuff.

And DOCUMENT that stuff in 'make help'!
If you don't document it then the NACK and revert is implied.
