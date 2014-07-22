From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 22 Jul 2014 14:17:09 +0200
Subject: [Buildroot] issues without busybox
In-Reply-To: <53CD77E8.7050208@zacarias.com.ar>
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
 <20140721221555.72df12ca@free-electrons.com>
 <53CD77E8.7050208@zacarias.com.ar>
Message-ID: <20140722121707.GA29579@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,
On Mon, Jul 21, 2014 at 05:28:24PM -0300, Gustavo Zacarias wrote:
> On 07/21/2014 05:15 PM, Thomas Petazzoni wrote:
> > I believe one direction we should potentially investigate is to have
> > one common skeleton for the base stuff, and then separate additional
> > skeletons for busybox init, sysv init and systemd init.
>
> Hi.
> I think i've already mentioned i'm planning on a proposal to revamp the
> init system/initscript options.
> The idea would be to make them consistent and document how a proper
> initscript should be made, and get them all in line with this.
> Also interesting would be to make them configurable, in many cases
> daemons have options and don't use a configuration file, so let's make
> one i say. Actually let's make two :) A default file for read-only
> filesystem, and some another that overrides the default, good for RO
> filesystems which have a separate partition for that.

Would this look like what is done in package/dropbear/S50dropbear?

  test -r /etc/default/dropbear && . /etc/default/dropbear

The file /etc/default/dropbear defines $DROPBEAR_ARGS, which is used on the
command line of the program.

Would the location of this alternative configuration file be configurable from
"menuconfig"?

> We could make the start/stop order configurable too via a file similar
> to the device table, if this file lives in the target filesystem it
> could be nicer too - but well that depends on how far we'd like to go.
> The idea would be to use as much pure shell as possible for this to keep
> necessary dependencies to a minimum.
> Haven't thought out much of the systemd option yet, i need to dig
> somewhat deeper into it, or it could be handled separately since it's
> quite different from the usual inits.

Currently, only 8 packages install systemd unit files. The pattern is always
the same:

  define <pkg>_INSTALL_INIT_SYSTEMD
  	$(INSTALL) -D -m 644 package/<pkg>/<pkg>.service $(TARGET_DIR)/etc/systemd/system/<pkg>.service
  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
  	ln -fs ../<pkg>.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/<pkg>.service
  endef

I think about simplifying this by adding a script, also in the tradition of
makedevs and mkusers, which would be executed when generating the rootfs. This
script would install all the unit files declared like this:

  define <pkg>_SYSTEMD_UNITS
  	<unit file> <target unit>
  endef

For example, if <pkg> installs a service which is to be triggered when the
system reaches multi-user.target:

  define <pkg>_SYSTEMD_UNITS
  	package/<pkg>/<pkg>.service multi-user.target.wants
  endef

Could the same be done for SysV/Busybox init scripts?

  define <pkg>_SYSV_INIT_SCRIPTS
  	<init script> <default start/stop order>
  endef

For example, to install a SysV init script for Dropbear, we would declare:

  define DROPBEAR_SYSV_INIT_SCRIPTS
  	package/dropbear/dropbear 50
  endef

A script would install all init scripts and create the associated symbolic
links. The default start/stop order could be overriden by a custom
configuration file.


Best regards,
ELB
