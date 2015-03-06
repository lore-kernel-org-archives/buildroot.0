From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 16:35:15 -0300
Subject: [Buildroot] SysV init script revamp (proposal)
Message-ID: <54FA0173.60504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all.
Before going all crazy sending patches and possibly wasting a lot of
time i'll write up my thoughts on how we could enhance/fix/clean the
current scenario regarding initscript:

The target of this proposal is exclusively SysV-style (busybox, systemV)
initscripts.

Objetives
=========

1) Cleanup & consistency.
2) Make them configurable.

Motivation
==========

Right now the out-of-the-box experience is a mixed bag.
Some initscripts use debian-style configurations, others redhat, others
some undocumented tweaks, and others none.
When talking about configuration options i'm talking about options each
daemon provides that can only be set via invocation parameters that
can't be set via a config file. Example would be port, interface(s) to
listen on, debug level, protocol, log file and others.
Security is also a reason for this, right now we aren't even consistent
on which daemons should start on an uncustomized system and this can
indirectly bring up attack vectors to the unwary user via indirect
dependencies (i.e. some package needs libsmbclient -> samba does a full
install with initscript and sample config -> bam).
On the configurability side we don't know and we shouldn't really care
about the filesystem layout of the target and it should be able to deal
with many possible scenarios.

Cleanup & consistency
=====================

* All of the scripts should look the same so anyone can use any other as
template.
* The scripts should be able to run with any of the standard POSIX
shells (busybox ash, bash, dash, zsh) available.
* Scripts should have at least the basic 'start', 'stop' and 'restart'
parameters. When relevant 'reload' should be available as well.
* Optionally implement a 'status' call to know if a daemon is
effectively up or crashed (via return value).
* pidfiles mandatory when possible, always in /run

Make them configurable
======================

* Make a default initscript configuration directory on the target:
/etc/default/SERVICE which matches the {Sxx,Kxx}SERVICE initscript.
* Allow this configuration to be overriden via another directory:
/etc/config/SERVICE

By default we install /etc/default/SERVICE and leave /etc/config/SERVICE
for users to tinker with.
Many scenarios are covered by this.
Users can ship /etc/default/SERVICE as a default/safe/fallback config
for their products (for example rootfs being RO) with /etc/config being
a RW filesystem (or symlink to one) where their users can
customize/write configuration data.
The initscript sources /etc/default/SERVICE first, and then, if
available, /etc/config/SERVICE to override config options.
If the "box" (target) has a reset switch this could be checked at boot
time and trigger a simple "rm /etc/config/*" routine to get rid of the
config files via a custom script, or just move it out of the way to
avoid evaluation (or more advanced scenarios like last known good
config, backup config, and so on).

SERVICE file structure
======================

A plain simple shell-parsable ASCII file that asigns variables
Example /etc/{default/config}/samba file:

samba_enabled="yes"   # Globally enable the initscript
samba_start_nmbd="yes"   # We do want nmbd
samba_start_smbd="yes"   # We do want smbd
samba_start_winbindd="no"   # We don't want winbindd
samba_start_samba="no"   # We don't want the samba AD-DC master process
samba_config_file="/etc/samba/smb.conf"   # Allow default override
...and so on.

Example /etc/{default/config}/pppd file:
pppd_enabled="yes"
pppd_peer="o2"

Example /etc/{default/config}/tftpd file:
tftpd_enabled="no"   # normally don't start
tftpd_directory="/mnt/sdcard/tftpboot"   # share dir
tftpd_options="-4"   # only listen on IPv4
tftpd_user="nobody"   # run as 'nobody' user

The idea is to keep it as plain and simple as possible while being
versatile.

Crazy future enhancements
=========================

* Customizable start/stop order via an enhanced rcS/rcK and an
"initscript table" in the target leaving all the initscripts level-less
in their name (creating a default/recommended table for this automatically).
* Triggers: tricky, but doable. One script when successful calls another
one to start/stop. This way if say an ethernet connection bringup fails
a fallback WWAN one can be established.

I probably forgot about some details... bring in the ideas and flames!

Regards.
