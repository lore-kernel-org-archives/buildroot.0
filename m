From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 Apr 2020 22:48:37 +0200
Subject: [Buildroot] [git commit] linux: Allow modprobe for out-of-tre
 modules
In-Reply-To: <20200324223904.06924ade@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 24 Mar 2020 22:39:04 +0100")
References: <20200321203709.A5CAD83B8E@busybox.osuosl.org>
 <20200324223904.06924ade@windsurf.home>
Message-ID: <87imijaq56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Sat, 21 Mar 2020 21:43:31 +0100
 > Yann E. MORIN <yann.morin.1998@free.fr> wrote:

 >> +# Run depmod in a target-finalize hook, to encompass modules installed by
 >> +# packages.
 >> +define LINUX_RUN_DEPMOD
 >> +	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
 >> +endef
 >> +LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

 > I believe this breaks the build of minnowboard_max_defconfig:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/483712574

 > The kernel configuration of minnowboard_max_defconfig has
 > CONFIG_MODULES disabled, so there's no /lib/modules/4.19.8 folder,
 > causing this:

 > depmod: ERROR: could not open directory
 > /builds/buildroot.org/buildroot/output/target/lib/modules/4.19.8: No
 > such file or directory
 > depmod: FATAL: could not search modules: No such file or directory
 > Makefile:745: recipe for target 'target-finalize' failed

 > Do we need to grep into $(LINUX_DIR)/.config to check if
 > CONFIG_MODULES=y before calling depmod ?

I believe so, similar to how we do it elsewhere in linux.mk.

-- 
Bye, Peter Korsgaard
