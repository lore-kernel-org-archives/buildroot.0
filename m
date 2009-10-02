From: William Wagner <will_wagner@carallon.com>
Date: Fri, 02 Oct 2009 14:03:24 +0100
Subject: [Buildroot] [PATCH] Apply kernel board patches when do
	linux26-menuconfig
Message-ID: <4AC5FA1C.1010100@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

currently if you have not yet built/upacked linux and you run 
linux26-menuconfig which unpacks linux and applies patches. However it 
does not apply board (or arch) specific patches as would happen if you 
built linux without opening the menuconfig.

Does that make sense? The patch below fixes it:

diff --git a/target/linux/Makefile.in.advanced 
b/target/linux/Makefile.in.advanced
index b4774ca..4b2c451
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -399,12 +399,12 @@ $(STAMP_DIR)/linux_modules_target_installed: 
$(LINUX26_DIR)/.depend_done
      fi
      touch $@

-linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-menuconfig: $(LINUX26_DIR)/.patched.board host-sed
      [ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) 
$(LINUX26_DIR)/.config
      $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
      -[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured

-linux26-xconfig: $(LINUX26_DIR)/.patched host-sed
+linux26-xconfig: $(LINUX26_DIR)/.patched.board host-sed
      [ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) 
$(LINUX26_DIR)/.config
      $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig
      -[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
