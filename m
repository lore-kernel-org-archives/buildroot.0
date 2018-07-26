From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Jul 2018 00:42:16 +0000
Subject: [Buildroot] [Bug 11191] xattr and check-package issue
In-Reply-To: <bug-11191-163@https.bugs.busybox.net/>
References: <bug-11191-163@https.bugs.busybox.net/>
Message-ID: <bug-11191-163-nqppynrRK4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11191

Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> ---
I can reproduce both behaviors on current master:
- check-package complaining when tab is not used for |xattr
- xattr being silently ignored by host-makedevs when tab is used for |xattr

The second one occurs because the tab propagates from the package recipe to
package/pkg-generic.mk to fs/common.mk and finally to
output/build/buildroot-fs/device_table.txt and the code that processes this
file does a strict check:
line 513 @ package/makedevs/makedevs.c
if (1 == sscanf(line, "|xattr %254s", xattr)) {

We could fix this inconsistency by a number of ways:
1) change check-package;
2) try to come up with a solution in package/pkg-generic.mk to remove leading
tabs from _PERMISSION. It cannot be a simple $$(strip) because it would remove
the newlines;
3) change makedevs to ignore leading tabs/spaces for xattr (as it already does
for non-xattr lines). Hackish version to replace the code mentioned above:
> if (2 == sscanf(line, "%4095s %254s", name, xattr) && !strcmp(name, "|xattr")) {
4) change fs/common.mk to remove the leading tabs/spaces. Something like this:
>+++ b/fs/common.mk
>@@@ -89,2 -89,2 +89,3 @@@ endi
>        $(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
>++      $(SED) "s/^[ \t]*//g" $(FULL_DEVICE_TABLE)
>        echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)

I think option 4 makes sense because we also will end up with a better
formatted device_table.txt.

But let's wait for more opinions on how to proceed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
