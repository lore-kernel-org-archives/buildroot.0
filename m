From: Courousse, Damien <damien.courousse@logica.com>
Date: Fri, 31 Jul 2009 11:33:49 +0200
Subject: [Buildroot] linux .config : override: reassigning to symbol
	AEABI
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<87vdlbxqlk.fsf@macbook.be.48ers.dk>
Message-ID: <F81DF98CADE6064F81A746D7C8323593782D2C@fr-ex009.groupinfra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all,

This morning I did a complete compilation from a fresh install. I get something working with OABI support (did not test EABI) but using an initramfs only. Once the kernel has booted the nfs mounts are working normally.
I think I will continue like this because it's OK with my needs.

It looks like there are some kind of cache effects in the buildroot configuration files  when the config files have modified several times, even if make flush or even make clean are executed. Did someone of you had such problem? In this case, what is the better option: starting from a fresh install or something else?

Concerning my first problem I can do further tests if you want so that we  get a better idea of what is going on; I did some tests without being able to get a better idea of the problem. See below.


> -----Message d'origine-----
> De?: Peter Korsgaard [mailto:jacmet at gmail.com] De la part de Peter
> Korsgaard
> Envoy??: mercredi 29 juillet 2009 21:00
> ??: Courousse, Damien
> Cc?: buildroot at busybox.net
> Objet?: Re: [Buildroot] linux .config : override: reassigning to symbol
> AEABI
> 
> >>>>> "Damien" == Courousse, Damien <damien.courousse@logica.com> writes:
> 
>  Damien> The kernel loading gets stuck after mounting the NFS root :
>  Damien> ================================================================
>  Damien> ....
>  Damien> IP-Config: Complete:
>  Damien>      device=eth0, addr=10.84.34.8, mask=255.255.255.192,
> gw=10.84.34.1,
>  Damien>      host=debian_test, domain=, nis-domain=(none),
>  Damien>      bootserver=10.84.34.52, rootserver=10.84.34.52, rootpath=
>  Damien> Looking up port of RPC 100003/2 on 10.84.34.52
>  Damien> Looking up port of RPC 100005/1 on 10.84.34.52
>  Damien> VFS: Mounted root (nfs filesystem).
>  Damien> Freeing init memory: 116K
>  Damien> Kernel panic - not syncing: Attempted to kill init!
> 
> Do you use softfloat or fpu emulation in the kernel? (check
> BR2_SOFT_FLOAT).
> 
> --
[Damien Courouss?] 
Hello Peter, 
Thanks for helping.

My buildroot is configured with softfloat: 
$ grep SOFT .config
BR2_SOFT_FLOAT=y
grep FPU .config
# BR2_FPU_SUFFIX is not set

And the kernel config : 
.../linux$ grep FP .config
CONFIG_FPE_NWFPE=y
# CONFIG_FPE_NWFPE_XP is not set
# CONFIG_FPE_FASTFPE is not set
# CONFIG_VFP is not set


Mark : 
I have activated the DEBUG options in the buildroot and in the kernel config files. However, I do not get more debugging messages; I did append "user_debug=255 or 31" at the end of the kernel command line. Results are identical as what I described on Wednesday : 
* if I pass nfs_root options + init=/bin/sh to the kernel command line, I get a kernel panic,
* if I pass nothing more that the nfs_root options to the kernel command line, the kernel hangs after freeing the init memory.

Please find attached my buildroot, kernel and uclibc config files for a complete overview of my config

Thanks all for your kind help,
Damien


Please help Logica to respect the environment by not printing this email  / Pour contribuer comme Logica au respect de l'environnement, merci de ne pas imprimer ce mail /  Bitte drucken Sie diese Nachricht nicht aus und helfen Sie so Logica dabei, die Umwelt zu sch?tzen /  Por favor ajude a Logica a respeitar o ambiente nao imprimindo este correio electronico.



This e-mail and any attachment is for authorised use by the intended recipient(s) only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachment and all copies and inform the sender. Thank you.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc-0.9.30.1.config
Type: application/octet-stream
Size: 6039 bytes
Desc: uclibc-0.9.30.1.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090731/1e097d68/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2009.05.config
Type: application/octet-stream
Size: 22371 bytes
Desc: buildroot-2009.05.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090731/1e097d68/attachment-0005.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-1.14.1.config
Type: application/octet-stream
Size: 23058 bytes
Desc: busybox-1.14.1.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090731/1e097d68/attachment-0006.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-2.6.28.config
Type: application/octet-stream
Size: 30670 bytes
Desc: linux-2.6.28.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090731/1e097d68/attachment-0007.obj>
