From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 1 Dec 2009 19:11:09 -0600
Subject: [Buildroot] Help Booting Kernel on an ml507
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C902@EXCHANGEVS01.appsig.com>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
	<200912011837.12322.minimod@morethan.org>
	<4B2CB099CF3D4F40B1B1442281CA94FFC4C902@EXCHANGEVS01.appsig.com>
Message-ID: <200912011911.11557.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue December 1 2009, NEAL, RYAN wrote:
> Urk.  Seriously right after I sent the email I saw the /sbin/udhcpc.
> 
> Now I just have the problem of how to get it run at startup.  By editing
> the inittab?
> 

See: http://www.linuxfromscratch.org/

Mike
> ::Ryan
> 
> -----Original Message-----
> From: Michael S. Zick [mailto:minimod at morethan.org] 
> Sent: Tuesday, December 01, 2009 4:37 PM
> To: buildroot at busybox.net
> Cc: NEAL, RYAN; Peter Korsgaard
> Subject: Re: [Buildroot] Help Booting Kernel on an ml507
> 
> On Tue December 1 2009, NEAL, RYAN wrote:
> > Hey Peter!  That helped a lot!  
> > 
> > I upgraded to the br 2009.11 release.  Good work, I like it a lot --
> > much simpler :).
> > 
> > I am getting two errors and I was wondering if you could help me out
> > again?
> > 
> > One comes when I use the bootline : Linux/PowerPC load: console=ttyS0
> > ip=on root=/dev/ram
> > 
> > The boot goes as before, but  the last few lines of the boot are:
> > 	Sending DHCP requests ., OK
> > 	IP-Config: Got DHCP answer from 0.0.0.0, my address is
> > 10.49.211.5
> > 	IP-Config: Complete:
> > 	     device=eth0, addr=10.49.211.5, mask=255.255.240.0,
> > gw=10.49.223.254,
> > 	     host=10.49.211.5, domain=appsig.com, nis-domain=appsig.com,
> > 	     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
> > 	Freeing unused kernel memory: 944k init
> > 	Initializing random number generator... done.
> > 	Starting network...
> > 	ip: RTNETLINK answers: File exists
> > 
> > If I tack on a rdinit=/bin/sh I don't get that error but I get:
> > 	IP-Config: Got DHCP answer from 0.0.0.0, my address is
> > 10.49.211.5
> > 	IP-Config: Complete:
> > 	     device=eth0, addr=10.49.211.5, mask=255.255.240.0,
> > gw=10.49.223.254,
> > 	     host=10.49.211.5, domain=appsig.com, nis-domain=appsig.com,
> > 	     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
> > 	Freeing unused kernel memory: 944k init
> > 	/bin/sh: can't access tty; job control turned off
> > 	/ #
> > And I can't use the DNS names of any servers.  The good thing is that
> I
> > can now poke around the filesystem(r/w)!  Do you know what settings
> > would cause these errors? Is it even in the buildroot config or the
> > linux kernel?
> > 
> 
> If not using dhcp to set your /etc/resolv.conf file, you get to do that
> yourself:
> echo "nameserver 999.999.999.999" >/etc/resolv.conf
> Naturally, replacing the 9's with the address of your DNS server.
> 
> Mike
> > Thanks a ton! 
> > ::Ryan
> > -----Original Message-----
> > From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> > Korsgaard
> > Sent: Wednesday, November 25, 2009 10:18 PM
> > To: NEAL, RYAN
> > Cc: Peter Korsgaard; buildroot at busybox.net
> > Subject: Re: [Buildroot] Help Booting Kernel on an ml507
> > 
> > >>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:
> > 
> >  Ryan> Peter, 
> >  Ryan> That is a good point.  I was intending on using the initramfs
> > because I
> >  Ryan> hadn't thought of other options.  I'll look into the squashfs.
> 
> > 
> >  Ryan> My cpio.gz image is 543K.  
> >  Ryan> I am building for the powerpc 440 (no FPU).
> > 
> > Then this is probably wrong (unless you have FPU emulation enabled in
> > the kernel, which you shouldn't):
> > 
> >  Ryan> # BR2_SOFT_FLOAT is not set
> > 
> > You can find it under toolchain options.
> > 
> > Once you change this you need to rebuild everything (rm -rf *build_*;
> > make).
> > 
> 
> 
> 
> 
