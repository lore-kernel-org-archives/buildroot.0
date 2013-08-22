From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Aug 2013 01:36:22 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
Message-ID: <5216A076.5030409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 22:11, Jenkins, Lee (ISS Houston) wrote:
> Hello. I am debugging a boot problem for a few hours. I?m clearly in over
> my head and I could use some insight.
>
> For debugging purposes, I am booting from a kernel and rootfs on an nfs
> share of my dev machine. The console is ttyS0.

  The nfs-share is an extracted output/images/rootfs.tar, right? You're 
not using the target directory?

  Is busybox setuid root? Is the nfs not exported with rootsquash and such?


> The kernel boots and rootfs is mounted and the scripts in /etc/init.d are
> executed. The kernel messages and startup script messages appear on the tty.
>
> The problem is that right after the init.d scripts this message appears:
> ?can?t open /dev/ttyS0: Permission denied?. This message is repeated in
> an infinite loop.
>
> If I boot with the kernel argument ?init=/bin/sh? then the init is
> bypassed and the system boots OK. So the problem is definitely in the init.
>
> I?m new to debugging init-time and I cannot even figure out who is
> printing this message.
>
> The error message sounds like a permissions problem, so I added a hack
> script /etc/init.d/S99chmod, which does chmod 777 /dev/ttyS0 and then ls
> to show the result. The chmod works but the error still occurs.
>
> Then I thought maybe getty was having trouble opening ttyS0, so I wrote a
> ?wrapper? script called getty.shell to print a debug message and then
> modified the entry in inittab like this:
>
> # Put a getty on the serial port
>
> ttyS0::respawn:/sbin/getty.shell -L ttyS0 115200 vt100 # GENERIC_SERIAL
>
> It doesn?t look like the wrapper script is ever called because the debug
> message never appears.
>
> So, any ideas? What happens between /etc/init.d and /sbin/getty?

  The ttyS0 at the beginning of the line instructs (busybox) init to send 
the stderr/stdout of the process that is started to /dev/ttyS0. But the 
process is never started, because init cannot open /dev/ttyS0.

  You can try removing that, just start the line with ::


  Regards,
  Arnout

>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
