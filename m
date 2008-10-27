From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 27 Oct 2008 22:11:12 +0100
Subject: [Buildroot] [PATCH] Avoid make distclean to remove packages
	fromrootfs
In-Reply-To: <20081027204927.GF14184@mx.loc>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
	<COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
	<e4c675870810271342l7cb8d57eo824d1238bcf18ab3@mail.gmail.com>
	<20081027204927.GF14184@mx.loc>
Message-ID: <e4c675870810271411j60951480x90de0d4520abcb75@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/27 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Mon, Oct 27, 2008 at 09:42:42PM +0100, Roberto A. Foglietta wrote:

[...]

>
>>--- Makefile   (revision 23784)
>>+++ Makefile   (working copy)
>>@@ -324,7 +324,7 @@
>>               touch $(STAGING_DIR)/.fakeroot.00000; \
>>       fi
>>       -find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
>>-      -find $(TARGET_DIR) -type f -name .empty | xargs rm -rf
>>+      -find $(TARGET_DIR) -type f -name .empty -delete
>>       touch $@
>>
>> $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
>>@@ -341,6 +341,7 @@
>>       find $(TARGET_DIR)/lib -name '*.a' -delete
>>       find $(TARGET_DIR)/usr/lib -name '*.la' -delete
>>       find $(TARGET_DIR)/lib -name '*.la' -delete
>>+      find $(TARGET_DIR) -type f -name '*~' -delete
>
> No. Use xargs instead.

 Why?

>> source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>>@@ -357,6 +358,19 @@
>> # Cleanup and misc junk
>> #
>> #############################################################
>>+
>>+install: softclean all
>>+      # TODO: to fix this bug in the proper way
>>+      name=$$(find $(STAGING_DIR) -name 'libfreetype.so'); \
>>+      dest=$$(dirname $$name | sed -e "s,$(STAGING_DIR),$(TARGET_DIR),"); \
>>+      cp -af $$name* $$dest; $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $$dest/libfreetype.so
>>+
>>+rootclean:
>>+      rm -rf $(TARGET_DIR) $(PROJECT_BUILD_DIR)/.root
>>+
>>+softclean:
>>+      rm -rf $(IMAGE) $(PROJECT_BUILD_DIR)/autotools-stamps
>>+
>
> No. Adding yet more targets makes absolutely no sense at all.
> Just make 'make clean' wipe the stamps and let 'make realclean' wipe the
> built stuff.

clean remove a lot of things not only the stamps

clean: $(TARGETS_CLEAN)
	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
$(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps

a) you want reinstall things in root because they have been corrupted
without loosing your customization on scripts/configurations:

make install (which for work correctly need to do: softclean all, this
is the reason because softclean exist)

b) you want remove root and remade it from scratch

make rootclean install

in both a) and b) cases you want do these things in the fastest way.


>
> And DOCUMENT that stuff in 'make help'!
> If you don't document it then the NACK and revert is implied.
>

 I will made some tests in order to show you how much time people can
save in using some targets appropriately. Then if you will agree with
me that those targets are really useful I will document them. Testing
extensively the buildroot in many configuration implies to move AS
FAST AS POSSIBLE from one build to another one without recompiling the
WORLD.

 Cheers,
-- 
/roberto
