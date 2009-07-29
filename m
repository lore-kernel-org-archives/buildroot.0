From: Courousse, Damien <damien.courousse@logica.com>
Date: Wed, 29 Jul 2009 18:07:33 +0200
Subject: [Buildroot] linux .config : override: reassigning tosymbolAEABI
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
	<20090729134234.GY13236@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com>
	<20090729142610.GB9464@buzzloop.caiaq.de>
Message-ID: <F81DF98CADE6064F81A746D7C8323593782CC1@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Message d'origine-----
> De?: Daniel Mack [mailto:daniel at caiaq.de]
> Envoy??: mercredi 29 juillet 2009 16:26
> ??: Courousse, Damien
> Cc?: buildroot at uclibc.org
> Objet?: Re: [Buildroot] linux .config : override: reassigning
> tosymbolAEABI
...
> 
> Ok, fine. You're digging at the wrong end then :) Try setting
> CONFIG_DEBUG_USER in your kernel config and pass user_debug=255 on
> startup. That will output more details when user space binaries crash.
> 
> Daniel
> 
[Damien Courouss?] 
The user_debug option did not change anything :(
If I use the following kernel command line:  
root=/dev/nfs rw nfsroot=10.84.34.52:/mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/root ip=10.84.34.8:10.84.34.52:10.84.34.1:255.255.255.192:debian_test:eth0:off user_debug=255

I get: 
IP-Config: Complete:
     device=eth0, addr=10.84.34.8, mask=255.255.255.192, gw=10.84.34.1,
     host=debian_test, domain=, nis-domain=(none),
     bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
Looking up port of RPC 100003/2 on 10.84.34.52
Looking up port of RPC 100005/1 on 10.84.34.52
VFS: Mounted root (nfs filesystem).
Freeing init memory: 116K
[kernel hangs here]

And if I add init=/bin/sh at the end of the kernel command line (using busybox), I get this : 
Kernel command line: root=/dev/nfs rw nfsroot=10.84.34.52:/mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/root ip=10.84.34.8:10.84.34.52:10.84.34.1:255.255.255.192:debian_test:eth0:off user_debug=255 init=/bin/sh

Looking up port of RPC 100003/2 on 10.84.34.52
Looking up port of RPC 100005/1 on 10.84.34.52
VFS: Mounted root (nfs filesystem).
Freeing init memory: 116K
Kernel panic - not syncing: Attempted to kill init!

... and then I have compiled the kernel with initramfs. There I get something working: 
IP-Config: Complete:
     device=eth0, addr=10.84.34.8, mask=255.255.255.192, gw=10.84.34.1,
     host=debian_test, domain=, nis-domain=(none),
     bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
Freeing init memory: 808K
Initializing random number generator... done.
Starting network...
ifup: interface lo already configured
Starting NFS statd: touch: /var/lock/subsys/nfslock: No such file or directory
done
Starting NFS services: done
Starting NFS daemon: done
Starting NFS mountd: Cannot register service: RPC: Unable to receive; errno = Connection refused
done
touch: /var/lock/subsys/nfs: No such file or directory

Welcome to Buildroot
login: root
# ls
# ls /
bin      dev      init     mnt      root     tmp
boot     etc      lib      opt      sbin     usr
config   home     linuxrc  proc     sys      var
# mount
rootfs on / type rootfs (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /tmp type tmpfs (rw)
sysfs on /sys type sysfs (rw)



But as you can see nfs root is not mounted (this might be because of a remount of / in inittab), whereas without initramfs, the nfs root is correctly mounted.

What puzzles me is that I though it would be possible to use a nfs root without initramfs. I will continue digging into this...

Damien


Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.
