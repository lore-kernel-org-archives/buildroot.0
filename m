From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Jul 2014 09:30:36 -0300
Subject: [Buildroot] Filesystem being corrupted
In-Reply-To: <53B5331B.9030703@the-playground.dk>
References: <53B5331B.9030703@the-playground.dk>
Message-ID: <53B54CEC.5070803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2014 07:40 AM, Robert Larsen wrote:

> Hi list
> 
> I am having a problem with my root filesystem being corrupted.
> When I halt a newly built system (simply log in and execute 'halt') get
> this message:
> 
> ---------------------------------------------------------------
> # halt
> The system is going down NOW!
> Sent SIGTERM to all processes
> Sent SIGKILL to all processes
> Requesting system halt
> Flash device refused suspend due to active operation (state 20)
> Flash device refused suspend due to active operation (state 20)
> reboot: System halted
> ---------------------------------------------------------------
> 
> Then when I restart it I get:
> 
> ---------------------------------------------------------------
> ....
> Starting network...
> EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 625
> EXT2-fs (mmcblk0): error: remounting filesystem read-only
> Generating RSA Key...
> No user exists for uid 0
> EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 627
> EXT2-fs (mmcblk0): error: remounting filesystem read-only
> Generating DSA Key...
> 
> No user exists for uid 0
> EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 629
> EXT2-fs (mmcblk0): error: remounting filesystem read-only
> Generating ECDSA Key...
> 
> No user exists for uid 0
> EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 631
> EXT2-fs (mmcblk0): error: remounting filesystem read-only
> Generating ed25519 Key...
> 
> No user exists for uid 0
> Starting sshd: Privilege separation user sshd does not exist
> OK
> 
> ARM Testing System
> arm-testing login:
> ---------------------------------------------------------------
> 
> I start it with this command:
> sudo qemu-system-arm -M vexpress-a9 -m 512 -kernel zImage  -sd
> rootfs.ext2 -append "root=/dev/mmcblk0 rw physmap.enabled=0
> console=ttyAMA0" -net tap -net nic -net
> user,hostfwd=tcp:0.0.0.0:2222-:22 -nographic
> 
> Any ideas as to what has happened and how to fix it?
> You can view my buildroot config file here:
> http://www.the-playground.dk/buildroot_config.txt
> 
> Robert

Hi.
The corruption happens with the vexpress target, but for instance it
doesn't happen with versatile (it was easily reproduced with vexpress,
not a single failure with multiple boots on versatile).
I suspect it's related to some bug or missing feature in Qemu's mmc
hardware emulation for the vexpress or some kernel bug.
Any reason in particular to stick with vexpress? versatile can be made
to use a better processor than arm926 if that's it.
Regards.
