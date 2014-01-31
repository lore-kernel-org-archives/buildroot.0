From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Fri, 31 Jan 2014 09:45:17 +0100
Subject: [Buildroot] Wrong installation path?
Message-ID: <52EB629D.2030707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm trying to get lirc works on my buildroot environment. Looking at 
package/lirc/src I see the S70lircd script has a lot of hardcoded paths, 
i.e.:

if [ -f /etc/lirc/hardware.conf ];then
         . /etc/lirc/hardware.conf
fi

if [ ! -f /etc/lirc/lircd.conf ] || grep -q "^#UNCONFIGURED" 
/etc/lirc/lircd.conf; then
         if [ "$1" = "start" ]; then


The lirc.mk instead contains the following:

define LIRC_INSTALL_TARGET_SCRIPTS
         mkdir -p $(TARGET_DIR)/etc/init.d
         $(INSTALL) -m 0755 package/lirc/src/S70lircd 
$(TARGET_DIR)/etc/init.d/
         $(INSTALL) -m 0755 package/lirc/src/hardware.conf 
$(TARGET_DIR)/etc/
         $(INSTALL) -m 0755 package/lirc/src/lircd.conf $(TARGET_DIR)/etc/
endef


In my opinion the destination directory should be $(TARGET_DIR)/etc/lirc/
Is there any reason why /lirc/ is missing? I mean: I am sure that the 
package has worked for those who have uploaded.


The second question is more generic. I can't still understand when I 
have to learn about buildroot and  when about the specific package.
For example, the lirc documentation says I should find a /dev/lirc 
device if I'm using udev.
But on my target (which has udev!) there is no such a device.

Where should I look at? How to know if I missed something in the 
buildroot/kernel configuration or just in the package (lirc) 
configuration files?

Thanks
Marco
