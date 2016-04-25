From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 14:23:45 +0200
Subject: [Buildroot] [PATCH] linux: use $(LINUX_INSTALL_IMAGE_CMDS)
 instead of plain 'cp'
In-Reply-To: <571E0AEE.3010002@laposte.net>
References: <571E0683.4080306@laposte.net>
 <20160425140615.11e86412@free-electrons.com>
 <571E0AEE.3010002@laposte.net>
Message-ID: <20160425142345.454fc66a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 14:17:50 +0200, Sebastian Frias wrote:

> >>  	# Build the kernel.
> >>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
> >> $(LINUX_TARGET_NAME)
> 
> This line is also present on LINUX_BUILD_CMDS, any reason not to reuse it?
> LINUX_BUILD_CMDS does a couple of more things than what is done here,
> like like running LINUX_BUILD_DTB or 'make modules', and maybe that is
> not wanted?

We don't want to do "make modules" again, as this will change the root
filesystem (surely by reinstalling the same thing, but still), while we
are exactly in the process of adding the filesystem to the kernel image.

> > I think I would prefer to have:
> > 
> > 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
> 
> Ok, just wondering, why? I mean, IIUC, LINUX_INSTALL_IMAGES_CMDS also
> handles the DTB copy when APPENDED_DTB is not set, right?

It also copies the DTB to $(BINARIES_DIR), which is useless here. And in
general, I don't like too much seeing the _CMDS variables called from
other variables.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
