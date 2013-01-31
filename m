From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jan 2013 23:09:12 -0500
Subject: [Buildroot] RFC: add check for post-build script existence?
Message-ID: <CANxTyt5O6y45yR+ZecGGi4EomVU2mm4ar56g3iK7boGpFTQDOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am on a project where the same buildroot defconfig is being used for
multiple boards (LSI vendor's EVM, our custom board rev 1, rev 2,
...), where the few changes can be taken care of by a post-build fixup
script on just one or two scenarios.  I was thinking that I would set
BR2_ROOTFS_POST_BUILD_SCRIPT to something like
${BOARD_NAME}-fixups.sh, rather than maintain parallel nearly
identical defconfigs.  But since the port-build script list processing
doesn't check for file existence, this would force me to have a file
for each of my boards, rather than having fixup files only for the
scenarios which actually need it.

Would there be interest in adding a -e test before invoking the
script, similar to the -d test before the target skeleton copy?
Something like:

	@$(call MESSAGE,"Executing post-build script\(s\)")
	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
		if [ -e $(s) ]; then $(s) $(TARGET_DIR); fi$(sep))

If there is positive feedback, then I'll send in a patch.

Danomi -
