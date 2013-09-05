From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 10:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <028035D9-F009-4D2C-B63E-6D6BFD08D5B7@layer-7.net>
References: <1378165788-7386-1-git-send-email-rommel@layer-7.net>
 <52276202.6010508@mind.be>
 <028035D9-F009-4D2C-B63E-6D6BFD08D5B7@layer-7.net>
Message-ID: <20130905101359.3be9c385@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Rommel,

On Wed, 4 Sep 2013 22:50:42 +0200, Michael Rommel wrote:

> Regarding the installation there are three versions on the table:
> 
> 1. Using the recommended default way:
> 
> +define AICCU_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> 
> This needs then the Makefile patch and I certainly can patch more buildroot related things into it,
>  like renaming and permissions.
> 
> 2. Using only the sub-level Makefile unix-console, which has a target "install", that 
> only installs the aiccu binary. That would be clean and easy but we would be missing 
> the template for the configuration (which I always find helpful)
> 
> 3. Skipping the patch for the Makefile altogether and using a better version of my first 
> attempt:
> 
> define AICCU_INSTALL_TARGET_CMDS
> 	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu $(TARGET_DIR)/usr/sbin
> 	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf $(TARGET_DIR)/etc
> endef
> 
> define AICCU_INSTALL_INIT_SYSV
> 	[ -f $(TARGET_DIR)/etc/init.d/S60aiccu ] || \
> 		$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
> 		$(TARGET_DIR)/etc/init.d/S60aiccu
> endef

Between (1) and (3) I believe it's mainly a matter of whether you think
your fixes to the Makefile can be integrated upstream into a new
release or not. If your Makefile changes can be integrated upstream and
a new release is made, we can update Buildroot to use this new release,
drop the patch, and everything is nice. On the other hand, if the
upstream is more or less dead (which the very old version number seems
to indicate), then the chances of having the patch accepted and a new
release published is rather small. In that case, doing a manual
AICCU_INSTALL_TARGET_CMDS and AICCU_INSTALL_INIT_SYSV is probably
better.

> Is there a recommendation about the Snn numbering of the init.d scripts? I have not found it in the manual.
> It should run after all internet connectivity has been established and the time has been synchronized.

Network is S40network. ntp is installed at S49ntp. So I guess something
>= 50 should be fine.

> >> +
> >> +define AICCU_PERMISSIONS
> >> +	/etc/init.d/aiccu  f  4755  0  0  -  -  -  -  -
> > 
> > Does it really have to be setuid? That is very weird for an init script.
> 
> I got the permission setting wrong, it should be only 755, the 4 was a cut&paste error from the Buildroot Documentation, I will correct that, my mistake!

You don't need to set explicit permissions if you use the
AICCU_INSTALL_INIT_SYSV method since you do an $(INSTALL) -m 0755.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
