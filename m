From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 15 Apr 2008 15:17:48 +0200
Subject: [Buildroot] Can't compile NSF mounts
References: <005601c89afa$bdfe24b0$ad289e86@LPSC0173W>	<02fb01c89ee7$5d21f680$ad289e86@LPSC0173W>	<48048C8E.50006@gmail.com>
	<030801c89ef4$901679a0$ad289e86@LPSC0173W>
	<4804A041.1030809@gmail.com>
Message-ID: <031501c89efb$1cbbd1b0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Have you tried mounting the NFS filesystem from another box?
> To narrow it down if it's a server or a client issue..

Yes, and it works fine.

I just managed to mount it on my target board... but it goes incredibly 
slowly (about one byte per second, so maybe there's something wrong with my 
network configuration or my design, I'm using XILINX_EMACLITE):

# cat >>/etc/fstab
192.168.1.185:/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root 
/media/loop nfs wsize=1024,rsize=1024,hard,intr,rw 0 0

# mount /media/loop

# mount
rootfs on / type rootfs (rw)
/dev/root on / type ext2 (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw)
tmpfs on /tmp type tmpfs (rw)
192.168.1.185:/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root 
on /media/loop type nfs 
(rw,vers=3,rsize=1024,wsize=1024,hard,intr,proto=udp,timeo=7,retrans=3,sec=sys,addr=192.168.1.185)

# time cat /media/loop/etc/inittab
one minute !!!

I have to see if all protocols are as slow...
-- 
Guillaume Dargaud
http://www.gdargaud.net/ 
