From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 19 Sep 2012 22:38:30 -0400
Subject: [Buildroot] rootfs hooks okay to use?
In-Reply-To: <505963F8.7050705@mind.be>
References: <CANxTyt7HEBtj+WUzAcwii7n9K3drUEz=34yMAOeN8FHOG2DqfA@mail.gmail.com>
 <505963F8.7050705@mind.be>
Message-ID: <CANxTyt4VXrRRG2X7gk1TRytmFXbEo+JbpwkL_bhHY5_ysti0=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout.

On Wed, Sep 19, 2012 at 2:19 AM, Arnout Vandecappelle <arnout@mind.be>wrote:
> Any commands to be executed by make should start with a TAB character,
> so make recognizes them as commands.

I don't think so.  If I change the beginning of my both
my TEST_PRE_GEN_HOOK_FIXUP and the ROOTFS_CPIO_ADD_INIT to start with tabs,
the error changes to:

fs/cpio/cpio.mk:35: *** missing separator.  Stop.
make: *** [all] Error 2

On the other hand, the package hooks have no problem with multiple hooks
and no tabs.  For example, this works without any errors:

+define TEST_HOOK_FIXUP1
+ echo "This is a test hook1"
+endef
+
+define TEST_HOOK_FIXUP2
+ echo "This is a test hook2"
+endef
+
+ZLIB_POST_INSTALL_TARGET_HOOKS += TEST_HOOK_FIXUP1
+ZLIB_POST_INSTALL_TARGET_HOOKS += TEST_HOOK_FIXUP2

However, I think I've figured it out the difference.  The rootfs hooks are
iterated by a foreach statement in fs/common.mk in ROOTFS_TARGET_INTERNAL.
 But ROOTFS_TARGET_INTERNAL is actually a template, so the single $ are
evaluated by the $(eval $(call ROOTFS_TARGET,xxxx)).  But if the single $
are replaced by double $, then the foreach evaluation is deferred to later.
 Then, the multiple hooks seem to work.

The specific change is:

 $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
        @$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
-       $(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
+       $$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call
$$(hook))$$(sep))
        rm -f $(FAKEROOT_SCRIPT)

So if the hooks are supposed to be generally available for tacking on more
actions, then I think we need the double $'s ...

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120919/0b36ccc8/attachment-0001.html>
