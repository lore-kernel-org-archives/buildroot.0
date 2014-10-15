From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 20:24:27 +0200
Subject: [Buildroot] systemd: write-up and packaging questions
In-Reply-To: <543AC16C.7000100@mailerd.de>
References: <543AC16C.7000100@mailerd.de>
Message-ID: <543EBBDB.5010500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/14 19:59, Andr? Erdmann wrote:
> Hi,
> 
> Some of the issues pointed out below may be already known, but I couldn't
> find any report on this, so I'd like to share my experience with setting up a
> systemd-based system that does a little bit more than bringing up a console ;)
> Use case was tvheadend with avahi and nfs (+ dropbear etc.), running on a
> DreamPlug. Overall it works great, but requires some post-build actions:
> 
> * installation of additional service files
>   (I'll propose patches for them sooner or later)

 Sooner would be good, because we've had several other reports of systemd not
working.

> * changes to the default rootfs skeleton

 Actually this is the one that should be done soon.

> * optional: removal of /etc/init.d etc.

 Someone is working on that.

> 
> 
> Filesystem Layout
> =================
> 
> There are some issues with the default rootfs skeleton.
> For example, systemd-hostnamed fails to start with the error message
> "file exists", likely related to symlinks pointing to /tmp (/run, /var/...).
> After some trial-and-error I've figured out that both /run and /var/tmp
> symlinks must be replaced with real directories, and that it needs to be done
> before booting systemd (at build/image creation time or in initramfs/initrd).
> 
> So, the minimum amount of necessary changes seems to be:
> * create /run as directory
>   and make /var/run->../run, /var/lock->run/lock link to it;
>   /run gets automatically mounted on boot

 This is something that we can easily do. Except, we should then also mount a
tmpfs on /run in the non-systemd case.

> * create /var/tmp as directory;
>   needs manual mount setup (fstab or .mount unit)

 This also needs to be a tmpfs by the way. Very annoying to have all these tmpfses.

> * /var/lib/dbus is then a dead link pointing to /tmp/dbus,
>   not sure if /run/dbus would be the correct link dest

 Can't we just make /var/lib/dbus/machine-id a symlink to /tmp/machine-id? Or
does that not work?

[snip] Maxime already commented on the rest.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
