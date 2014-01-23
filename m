From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
Date: Thu, 23 Jan 2014 09:23:24 +0100
Subject: [Buildroot] Post build script issue
Message-ID: <CAHKzcEOSork9JxSZWsef6m1wmPrZ2z1jEQqaig=LFkysgzqvNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Recently, I've tried to use post-script feature and found an issue,

I created foo.sh with 755 mode and configured buildroot to use this
post-script. However, make failed with the message:

>>>   Executing post-image script foo.sh
/bin/bash: foo.sh: command not found

It's because post-script is called in Makefile just by the name assuming
that the . directory is in your PATH.

 target-post-image:
 @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 $(call MESSAGE,"Executing post-image script $(s)"); \
---->>> $(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call
qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))


Therefore, I added '.' dir to my PATH and ran make again. Again I got an
error.

"You seem to have the current working directory in your PATH environment
variable. This doesn't work.
make: *** [core-dependencies] Error 1"

 How does it work for you?

Don't you think the Makefile should call the script this way:

-               $(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call
qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+               $(USER_HOOKS_EXTRA_ENV) ./$(s) $(TARGET_DIR) $(call
qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))


Let me know I will prepare a patch.

Thanks,
/Waldek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140123/9750fd68/attachment.html>
