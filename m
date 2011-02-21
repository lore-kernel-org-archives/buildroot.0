From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 21 Feb 2011 09:48:17 +0100
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc, ...
Message-ID: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

For a certain project, I have custom configuration files for buildroot
itself (defconfig), for the Linux kernel, and for uClibc. In buildroot
2010.05, these files would reside in the
target/device/<manufacturer>/<board> directory. These files would be
under version control in my repository.
When you build buildroot, each of these configuration files are being
copied to another location, as .config. These copies are not under
version control.

During development, if you make a change to the buildroot, kernel or
uclibc configuration, only the respective .config is being changed. If
you want to commit the change, you should not forget to copy over the
.config to the target/device directory.

I'd like to have a more simpler way than manually checking for changes
and copying them over, for example with a specific build target,
something like:
board-saveconfig:
        cp .config configs/board_defconfig
        cp output/build/linux/.config $(BOARD_PATH)/linux.config
        cp output/build/uclibc/.config $(BOARD_PATH)/uclibc.config

In buildroot 2010.05, you'd add this change to the board-specific Makefile.

In later buildroot versions however, there have been some changes to
the way board support is handled (see
http://lists.busybox.net/pipermail/buildroot/2010-December/039228.html
) and it is no longer possible to create board-specific targets.

However, the feature is actually generic, and could be implemented in
a common location.
Is there already an implementation? I have seen there is a
'savedefconfig' target, but this only targets the buildroot
configuration, not the kernel nor uclibc.
What do you think about such a build target?

I found a similar question here, but it seemed to have died out:
http://lists.busybox.net/pipermail/buildroot/2010-July/035817.html

Best regards,
Thomas
