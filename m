From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Mon, 1 Feb 2010 06:58:01 -0800 (PST)
Subject: [Buildroot] 3. Re:  Buildroot How-To for QEMU/ARM
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB670165466B@WETMEX10.loepfe.com>
References: <mailman.5.1264939201.5462.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB670165466B@WETMEX10.loepfe.com>
Message-ID: <934402.12492.qm@web44805.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noel,

Thanks, I will try your suggestions next weekend and report back..? I was just getting started with the NFS approach, so your guideline is very timely.? I have done DHCP/TFTP/NFS for embedded ARM before, but QEMU and?TUN/TAP are new to me.

Yes, I am using Ubuntu 9.10 Server JeOS running under VMware.? My objective is to do cross-development in the Ubuntu x86 VM, and test execution in the QEMU ARM VM.? I also plan to look into the gdbserver support?in QEMU, and perhaps Eclipse, although I am more of a vim command line developer.

I think VMware/Ubuntu/Buildroot/QEMU might provide an ideal portable ARM cross-development environmen that is not dependent on bench ARM hardware.? Of course actual hardware is the ultimate objective, but this environment should support very productive experimentation and learning using, for example, the new Linux Device Drivers book from Jerry Cooperstein, and the forthcoming Linux Programming API book from Michael Kerrisk.? I am currently reading the new Pro Linux Embedded Systems from Gene Sally, which is what put me on to Buildroot.

I appreciate your taking the time to offer your notes.

Jim


----- Original Message ----
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: buildroot at busybox.net
Cc: jimthomasembedded at yahoo.com
Sent: Mon, February 1, 2010 1:40:56 AM
Subject: 3. Re: Buildroot How-To for QEMU/ARM

Re: Buildroot How-To for QEMU/ARM (Jim Thomas) 
Jim >>Hi Noel,
Jim >>
Jim >>? > If you want I can send you a kernel config ... that is working
for my
Jim >>? > QEMU build (it is based on the kernel versatile_defconfig).
Jim >>
Jim >>I would be interested in looking over your .config file.

Please Find the enclosed kernel config.

Jim >>I think what I am missing may be on the QEMU side, not the
Buildroot side.

Jim >>What qemu-system-arm command do you use to bring up your virtual
machine?
Jim >>
Jim >>

As said before : Booting the kernel and rootfs in QEMU can be done by a
1000ways, it depends on your creativity and Linux-skills how you do this
(disk-image/ nfs-boot / .... etc ) 

But I often use the following command line: 

sudo qemu-system-arm -M versatilepb -net nic,vlan=0 -append
"root=/dev/nfs rw nfsroot=192.168.205.4:/nfsroot/emuroot
ip=192.168.204.147:192.168.205.4:192.168.204.1:255.255.254.0" -net
tap,ifname=tap0,script=/etc/qemu-ifup --kernel zImage-20100128

This requires some more info ... so, (very) sort.... QEMU via NFS !

NOTE: I think I have read somewhere you where running ubuntu... (hope
this is correct)

1) Install bridge-utils
sudo apt-get install bridge-utils

2) Make sure you have a working NFSserver ( in my case 192.168.205.4)
Install NFS Server Support

sudo apt-get install nfs-kernel-server nfs-common portmap

When configuring portmap do =not= bind loopback. If you do you can
either edit /etc/default/portmap by hand or run:
sudo dpkg-reconfigure portmap
sudo /etc/init.d/portmap restart

Editing /etc/exports
the /etc/exports file is used for creating a share on the NFS server

invoke your favorite text editor or
sudo vi /etc/exports
or
sudo gedit /etc/exports

Here is quick example of what you could add to your /etc/exports

/nfsroot/emuroot *(rw,async,no_subtree_check)

Make sure you have your tun/ tap installed.
To install TUN/TAP: 
sudo apt-get install uml-utilities

Activate tap0
sudo tunctl -t tap0 sudo tunctl -t tap0


Create a script call /etc/qemu-ifup that will be executed upon the start
of QEMU: 
#!/bin/sh 
echo "Executing /etc/qemu-ifup" 
echo "Bringing up $1 for bridged mode...." 
sudo /sbin/ifconfig $1 0.0.0.0 promisc up 
echo "Adding $1 to br0...." 
sudo /usr/sbin/brctl addif br0 $1 
sleep 2 


start QEMU as super user :

sudo qemu-system-arm -M versatilepb -net nic,vlan=0 -append
"root=/dev/nfs rw nfsroot=192.168.205.4:/nfsroot/emuroot
ip=192.168.204.147:192.168.205.4:192.168.204.1:255.255.254.0" -net
tap,ifname=tap0,script=/etc/qemu-ifup --kernel zImage-20100128


Regards Noel.



      
