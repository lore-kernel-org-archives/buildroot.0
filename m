From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 23 Jan 2014 09:30:00 +0100 (CET)
Subject: [Buildroot] Post build script issue
In-Reply-To: <CAHKzcEOSork9JxSZWsef6m1wmPrZ2z1jEQqaig=LFkysgzqvNg@mail.gmail.com>
Message-ID: <1088543382.4633672.1390465800734.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I always set my script setup in buildroot to absolute paths using
global variables.

depending on where you put your script, you probably want to set it 
to $(TOPDIR)/foo.sh (TOPDIR is the buildroot directory or
$(BR2_EXTERNAL)/foo.sh if you use BR2_EXTERNAL. There are a couple 
more variables like that, but I don't know them. Just check the 
documentation.

Having a relative path to CWD seems like a bad idea when you can
use these variables to have a dinamically expanded absolute path...

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75012 Paris - France
www.openwide.fr





----- Mail original -----
> 
> 
> Hi,
> 
> 
> Recently, I've tried to use post-script feature and found an issue,
> 
> 
> I created foo.sh with 755 mode and configured buildroot to use this
> post-script. However, make failed with the message:
> 
> 
> >>> Executing post-image script foo.sh
> 
> 
> /bin/bash: foo.sh: command not found
> 
> 
> It's because post-script is called in Makefile just by the name
> assuming that the . directory is in your PATH.
> 
> 
> 
> target-post-image:
> @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_ IMAGE _SCRIPT)), \
> $(call MESSAGE,"Executing post-image script $(s)"); \
> ---->>> $(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_ SCRIP T_ARGS))$(sep))
> 
> 
> 
> 
> Therefore, I added '.' dir to my PATH and ran make again. Again I got
> an error.
> 
> 
> "You seem to have the current working directory in your PATH
> environment variable. This doesn't work.
> 
> 
> make: *** [core-dependencies] Error 1"
> 
> 
> How does it work for you?
> 
> 
> Don't you think the Makefile should call the script this way:
> 
> 
> 
> - $(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_ SCRIP T_ARGS))$(sep))
> + $(USER_HOOKS_EXTRA_ENV) ./$(s) $(TARGET_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_ SCRIP T_ARGS))$(sep))
> 
> 
> 
> 
> Let me know I will prepare a patch.
> 
> 
> Thanks,
> /Waldek
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
