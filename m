From: Pascal K <pascalkrauth@gmail.com>
Date: Tue, 23 Aug 2016 07:12:01 +0000
Subject: [Buildroot] Using global patch dir to patch "host-*" packages from
	buildroot
Message-ID: <CADj18OXZwbD+eL1dR2_n6W_uovwgeV48GTJvHQ3rpTRCGQed1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I tried to upgrade my build system from gcc 4.9 to 6. So far only a few
patches are needed.
All of those patches have to be in packages for the host.

So my question is how to keep those patches out of my clean checkout of
buildroot?

If I set the global patch dir and put the patch e.g. for ucl-1.03 into this
dir, the mk file I was about to patch is not found. I am not sure how to
configure the path to point to the host-ucl-1.03.

*Here the build error that occurs:*

>>> host-ucl 1.03 Patching

Applying 0002-gcc6-build-fix.patch using patch:
can't find file to patch at input line 3
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|--- a/ucl.mk
|+++ b/ucl.mk
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch failed!  Please fix 0002-gcc6-build-fix.patch!


*My Patch: *
--- a/ucl.mk
+++ b/ucl.mk
@@ -9,4 +9,7 @@
 UCL_LICENSE = GPLv2+
 UCL_LICENSE_FILES = COPYING

+# Fix ACC conformance test failure for host gcc 6.xx
+HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=c90"
+
 $(eval $(host-autotools-package))

*Folder with the patch:*
../Develop/EmbeddedLinux/emblx/board/IPETRONIK/common/patches/ucl/
*Folder to apply the patch to:*
../Develop/EmbeddedLinux/emblx/buildroot/package/ucl/

Any suggestions?

Best regards,
Pascal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160823/9c0324dc/attachment.html>
