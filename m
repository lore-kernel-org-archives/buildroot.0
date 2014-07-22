From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jul 2014 09:34:17 -0300
Subject: [Buildroot] issues without busybox
In-Reply-To: <20140722121707.GA29579@rmm-p1267483>
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
 <20140721221555.72df12ca@free-electrons.com>
 <53CD77E8.7050208@zacarias.com.ar> <20140722121707.GA29579@rmm-p1267483>
Message-ID: <53CE5A49.8040109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/22/2014 09:17 AM, Eric Le Bihan wrote:

>> Hi.
>> I think i've already mentioned i'm planning on a proposal to revamp the
>> init system/initscript options.
>> The idea would be to make them consistent and document how a proper
>> initscript should be made, and get them all in line with this.
>> Also interesting would be to make them configurable, in many cases
>> daemons have options and don't use a configuration file, so let's make
>> one i say. Actually let's make two :) A default file for read-only
>> filesystem, and some another that overrides the default, good for RO
>> filesystems which have a separate partition for that.
> 
> Would this look like what is done in package/dropbear/S50dropbear?
> 
>   test -r /etc/default/dropbear && . /etc/default/dropbear
> 
> The file /etc/default/dropbear defines $DROPBEAR_ARGS, which is used on the
> command line of the program.
> 
> Would the location of this alternative configuration file be configurable from
> "menuconfig"?

Yes, that's the spirit of it.
In it's simplest form:

NAME=dropbear
[ -f /etc/default/$NAME ] && source /etc/default/$NAME
[ -f /etc/config/$NAME ] && source /etc/config/$NAME

If default config exists parse it, then if override config exists also
parse it.
If some config is required we can either check for set minimum values or
not be so smart and just check that one was parsed:

[ -f /etc/default/$NAME ] && source /etc/default/$NAME && configured=1

And then check for the value of configured before attempting to start
anything to avoid unnecessary noise.

>> We could make the start/stop order configurable too via a file similar
>> to the device table, if this file lives in the target filesystem it
>> could be nicer too - but well that depends on how far we'd like to go.
>> The idea would be to use as much pure shell as possible for this to keep
>> necessary dependencies to a minimum.
>> Haven't thought out much of the systemd option yet, i need to dig
>> somewhat deeper into it, or it could be handled separately since it's
>> quite different from the usual inits.
> 
> Currently, only 8 packages install systemd unit files. The pattern is always
> the same:
> 
>   define <pkg>_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 644 package/<pkg>/<pkg>.service $(TARGET_DIR)/etc/systemd/system/<pkg>.service
>   	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>   	ln -fs ../<pkg>.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/<pkg>.service
>   endef
> 
> I think about simplifying this by adding a script, also in the tradition of
> makedevs and mkusers, which would be executed when generating the rootfs. This
> script would install all the unit files declared like this:
> 
>   define <pkg>_SYSTEMD_UNITS
>   	<unit file> <target unit>
>   endef
> 
> For example, if <pkg> installs a service which is to be triggered when the
> system reaches multi-user.target:
> 
>   define <pkg>_SYSTEMD_UNITS
>   	package/<pkg>/<pkg>.service multi-user.target.wants
>   endef

That's great.

> Could the same be done for SysV/Busybox init scripts?
> 
>   define <pkg>_SYSV_INIT_SCRIPTS
>   	<init script> <default start/stop order>
>   endef
> 
> For example, to install a SysV init script for Dropbear, we would declare:
> 
>   define DROPBEAR_SYSV_INIT_SCRIPTS
>   	package/dropbear/dropbear 50
>   endef
> 
> A script would install all init scripts and create the associated symbolic
> links. The default start/stop order could be overriden by a custom
> configuration file.

For SysV-style i think start and stop should be separate fields.
Most of the time you use reversed order for start vs stop, but for some
services you might not want to stop at all, for example some firewall
rules script.
Also using something similar to system/device_table.txt for initscripts
allows for some neat customization for users, they just need to point to
their own customized version to enable/disable services and change
order, a file that would live in board/ customizations easily.
I think the same could be done for systemd.
Alternatively we could just make it part of the config files and tweak
the rcK/rcS scripts to deal with this, something like:

/etc/default/dropbear:
DROPBEAR_START=YES
DROPBEAR_START_ORDER=20
DROPBEAR_STOP_ORDER=50

And then just override via /etc/config/dropbear if you don't want it:
DROPBEAR_START=NO

The user could even overstep on it from a post-build script, or from the
package file:

DROPBEAR_DEFAULT_CONFIG_FILES = dropbear

And just conditionally check if it exists in the skeleton to avoid
overwriting it, if not copy it.

Voila.
Regards.
