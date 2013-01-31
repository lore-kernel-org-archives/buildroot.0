From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jan 2013 10:13:46 +0100
Subject: [Buildroot] RFC: add check for post-build script existence?
In-Reply-To: <CANxTyt5O6y45yR+ZecGGi4EomVU2mm4ar56g3iK7boGpFTQDOw@mail.gmail.com>
References: <CANxTyt5O6y45yR+ZecGGi4EomVU2mm4ar56g3iK7boGpFTQDOw@mail.gmail.com>
Message-ID: <20130131101346.6572d042@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 30 Jan 2013 23:09:12 -0500, Danomi Manchego wrote:

> Would there be interest in adding a -e test before invoking the
> script, similar to the -d test before the target skeleton copy?
> Something like:
> 
> 	@$(call MESSAGE,"Executing post-build script\(s\)")
> 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> 		if [ -e $(s) ]; then $(s) $(TARGET_DIR); fi$(sep))
> 
> If there is positive feedback, then I'll send in a patch.

I am not sure I like that because it means that if an user makes a
small mistake in the post-build script name/path, it will be silently
ignored by Buildroot. I'd prefer if Buildroot would fail loudly if it
is given a post-build script that doesn't exist/isn't executable, or
any other problem that prevents the script from being executed.

I'm not sure where you're getting ${BOARD_NAME} from, but why don't you
handle the board differences in the script itself?

Like:

BR2_ROOTFS_POST_BUILD_SCRIPT=board/<company>/<project>/post-build.sh

and post-build.sh:

====
#!/bin/sh
if test -e ${BOARD_NAME}-fixups.sh; then
	sh ${BOARD_NAME}-fixups.sh
fi
====

No? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
