From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 17:35:21 +0200
Subject: [Buildroot] buildroot and kernel modules
In-Reply-To: <20130619152641.5DF95.59510.root@cdptpa-web08-z02>
References: <20130619152641.5DF95.59510.root@cdptpa-web08-z02>
Message-ID: <20130619173521.558f6d53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear jerryalex at tx.rr.com,

On Wed, 19 Jun 2013 11:26:41 -0400, jerryalex at tx.rr.com wrote:
> looking into how to enter sysbuild rules to automatically have my kernel modules loaded on bootup.
> 
> Standard linux uses depmod to enter modules into modules.dep so that they are automatically loaded on bootup.

No, that's not how it works. depmod is a tool that you run at kernel
*build* time to generate modules.dep (describes dependencies between
modules), modules.alias (module aliases). Those modules.* files
in /lib/modules/<version>/ are completely unrelated to whether modules
are loaded automatically at boot or not.

To get modules loaded at boot or not, you have two choices (which
sometimes need to be combined together) :

 * Run a hotplug agent, such as udev or mdev, which will get a message
   from the kernel when a device appears, and load the module that
   implements a driver capable of handling this device. To do this,
   the kernel sends a description of the hardware (such as USB VID and
   PID) to the hotplug agent, which can run 'modprobe' with those
   informations, and in turn modprobe will look at modules.alias to
   find the corresponding module to load.

   This works fine if the modules to be loaded are related to some
   piece of hardware for which there is a proper notification from the
   kernel to a userspace hotplug agent.

 * Have a text file like /etc/modules that lists the modules to be
   loaded at boot, and a script in /etc/init.d/ that goes
   through /etc/modules and modprobes each module.

> Right now our NFS file system does not have the depmod command and it appears that editing 
> modules.dep by hand and adding entries does not work.

The depmod command is not needed at run time, only when you build the
kernel and installs the modules.

Editing modules.dep will not change anything in terms of automatic
module loading at boot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
