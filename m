From: James Testa <plymusic@pacbell.net>
Date: Wed, 06 Sep 2006 18:18:17 -0700
Subject: [Buildroot] NFS: mount program didn't pass remote address!
Message-ID: <44FF7359.5080409@pacbell.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been trying to mount
1) from my ARM target board running busybox on
   a NFS mounted buildroot root filesystem to
2) a VMWARE SUSE Linux (192.168.0.6) and have been getting
   the error:

target % mount -t nfs -o nolock,nfsvers=2 192.168.0.6:/tftpboot /mnt/QTOPIA

NFS: mount program didn't pass remote address!

mount: Mounting 192.168.0.6:/tftpboot on /mnt/QTOPIA failed: Invalid argument

Using "rpcinfo -p" I can determined that the SUSE Linux is running
NFS version 2.  I can mount the VMWARE SUSE linux directory on
every other Linux machine that I have.  Note: that the target board
kernel can NFS mount the root filesystem from SUSE linux.

I.  I cross-compiled nfs-utils for ARM and from the nfs-utils on
    the target can run showmount on the ARM target and the
    exported filesystems from the SUSE linux can
    be seen on the target board.  This leads me
    to believe the problem is the busybox mount
    program.

II. I've searched the web and I did find the email
    in the BusyBox archives from April 1, 2005 with
    the same problem whose resolution was:


     >To compile the package portmap with my toolchain I had to enable
full RPC
     >support in uClibc. After doing this and following the instructions
below
     >everything worked and I could mount the NFS share.

     >Many thanks,
     >Remco van Strien.

III.  I looked in the toolchain_build_arm/uClibc directory
      in buildroot and ran "make menuconfig" and in the Networking
      section the following are selected:

      [*] Remote Procedure Call (RPC) support
      [*] Full RPC support
      [*] Reentrant RPC support

IV.   I have the following running on the target :

     portmap
     rpc.statd
     rpc.lockd
     rpc.mountd

IV.  I am using a snapshot of uClibc from August 22 and the
     Busybox version is revision 15756.

Do anyone have any suggestions?  I am running wireshark and can see that
the NFS Call/Replies never complete for the busybox mount command whereas
the NFS Call/Replies for the nfs-utils/showmount complete and transition
into the normal MOUNT protocol commands.

Any pointers would be appeciated.  Thanks,

Jim
