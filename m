From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 11:11:53 +0100
Subject: [Buildroot] Wrong installation path?
In-Reply-To: <52EB629D.2030707@gmail.com>
References: <52EB629D.2030707@gmail.com>
Message-ID: <20140131111153.036fcfd5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Fri, 31 Jan 2014 09:45:17 +0100, Marco Trapanese wrote:

> I'm trying to get lirc works on my buildroot environment. Looking at 
> package/lirc/src I see the S70lircd script has a lot of hardcoded paths, 
> i.e.:
> 
> if [ -f /etc/lirc/hardware.conf ];then
>          . /etc/lirc/hardware.conf
> fi
> 
> if [ ! -f /etc/lirc/lircd.conf ] || grep -q "^#UNCONFIGURED" 
> /etc/lirc/lircd.conf; then
>          if [ "$1" = "start" ]; then
> 
> 
> The lirc.mk instead contains the following:
> 
> define LIRC_INSTALL_TARGET_SCRIPTS
>          mkdir -p $(TARGET_DIR)/etc/init.d
>          $(INSTALL) -m 0755 package/lirc/src/S70lircd 
> $(TARGET_DIR)/etc/init.d/
>          $(INSTALL) -m 0755 package/lirc/src/hardware.conf 
> $(TARGET_DIR)/etc/
>          $(INSTALL) -m 0755 package/lirc/src/lircd.conf $(TARGET_DIR)/etc/
> endef
> 
> In my opinion the destination directory should be $(TARGET_DIR)/etc/lirc/
> Is there any reason why /lirc/ is missing? I mean: I am sure that the 
> package has worked for those who have uploaded.

You are not using the mainline Buildroot. There is no package for lirc
in the mainline Buildroot, so this bug does not apply to the mainline
Buildroot. That being said, it certainly looks wrong.

Can you recommend to the author of your Buildroot fork to submit his
changes to the official version? It would have a lot of benefits:

 *) Core Buildroot developers would review the changes, and through
    this review, several quality improvements would be made.

 *) The users, such as you, could benefit from the support of the
    entire Buildroot community, which you cannot at the moment since
    you're using a derivative version.

Alternatively, you could also yourself start using only the official
Buildroot version, grab the few changes you need from this derivative
version, and push them to the official Buildroot version. On the
long-run, it is the most efficient solution.

> The second question is more generic. I can't still understand when I 
> have to learn about buildroot and  when about the specific package.

You have to learn about both, depending on what problem you're trying
to fix.

> For example, the lirc documentation says I should find a /dev/lirc 
> device if I'm using udev.
> But on my target (which has udev!) there is no such a device.

Probably because your kernel configuration lacks the support for the
proper kernel subsystem or kernel drivers.

> Where should I look at? How to know if I missed something in the 
> buildroot/kernel configuration or just in the package (lirc) 
> configuration files?

The package (lirc) is independent from the presence of absence
of /dev/lirc<X>. As long as /dev/lirc<X> is not visible, then your
problem is a kernel configuration problem. Of course, make sure your
kernel has CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT enabled, these are
mandatory if you use Buildroot udev support. See
http://buildroot.org/downloads/manual/manual.html#_dev_management for
details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
