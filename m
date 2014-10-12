From: =?ISO-8859-1?Q?Andr=E9_Erdmann?= <dywi@mailerd.de>
Date: Sun, 12 Oct 2014 19:59:08 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
Message-ID: <543AC16C.7000100@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Some of the issues pointed out below may be already known, but I couldn't
find any report on this, so I'd like to share my experience with setting up a
systemd-based system that does a little bit more than bringing up a console ;)
Use case was tvheadend with avahi and nfs (+ dropbear etc.), running on a
DreamPlug. Overall it works great, but requires some post-build actions:

* installation of additional service files
  (I'll propose patches for them sooner or later)
* changes to the default rootfs skeleton
* optional: removal of /etc/init.d etc.


Filesystem Layout
=================

There are some issues with the default rootfs skeleton.
For example, systemd-hostnamed fails to start with the error message
"file exists", likely related to symlinks pointing to /tmp (/run, /var/...).
After some trial-and-error I've figured out that both /run and /var/tmp
symlinks must be replaced with real directories, and that it needs to be done
before booting systemd (at build/image creation time or in initramfs/initrd).

So, the minimum amount of necessary changes seems to be:
* create /run as directory
  and make /var/run->../run, /var/lock->run/lock link to it;
  /run gets automatically mounted on boot
* create /var/tmp as directory;
  needs manual mount setup (fstab or .mount unit)
* /var/lib/dbus is then a dead link pointing to /tmp/dbus,
  not sure if /run/dbus would be the correct link dest


Unit Files
==========

This section is mostly about packaging guidelines,
the manual doesn't answer the questions below.

Installation
------------

systemd's libdir is /lib/system.
Most unit files (.service et al) are installed to /etc/systemd/system,
systemd's own unit files are installed to /lib/systemd/system and some
packages(*) install their files to /usr/lib/systemd/system, which is rather
confusing. Either dir works (search order is /etc > /lib > /usr/lib),
but what's the recommended location?
I'd prefer to have them installed in one dir (systemd's libdir).

(*) grepping yields nginx and connman


Auto-Enabling
-------------

Most packages enable their unit files by default(*), others don't.
Example: lighttpd gets enabled, nginx does not.
Is there any policy for when [not] to enable services?

(*) "ln -s <unit> /etc/systemd/system/<target>.target.wants/<unit>"


Maybe it'd make sense to introduce some SYSTEMD_ variables so that
packages don't have to hardcode/guess systemd file paths, for example:
* SYSTEMD_LIBDIR          (= /lib/systemd)
* SYSTEMD_UNITDIR         (= $(SYSTEMD_LIBDIR)/system)
* SYSTEMD_CONFDIR         (= /etc/systemd)
* SYSTEMD_UNITCONFDIR     (= $(SYSTEMD_CONFDIR)/system)
* relpath from <confdir> to <libdir> (= ../..$(SYSTEMD_LIBDIR))
* relpath from <confdir>/system to <libdir>/system (= ../../$(SYSTEMD_UNITDIR))

Bonus: export these variables to post-build scripts


-- 
Andr?
