From: Dominik Menke <dom@digineo.de>
Date: Mon, 29 Apr 2019 11:01:11 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
 <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
 <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
Message-ID: <b3efb298-2353-ce88-552b-34fbe26df110@digineo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/27/19 11:47 PM, Arnout Vandecappelle wrote:
>   I've tried to reproduce in qemu, but it works fine there. This is the defconfig
> I used:
> 
> [...]
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20=y
> [...]

In 2019.02.x, I can only find max. 4.19, do I need master?


> and this is the qemu command to launch:
> 
> qemu-system-arm -M vexpress-a9 \
>    -drive "file=output/images/rootfs.ext2,if=sd,format=raw" \
>    -append "root=/dev/mmcblk0 rootfstype=ext4 rootwait ro console=ttyAMA0" \
>    -net nic,model=lan9118 -net user -dtb output/images/vexpress-v2p-ca9.dtb \
>    -serial stdio -kernel output/images/zImage

     EXT4-fs (mmcblk0): mounted filesystem with ordered data mode. Opts: 
(null)
     VFS: Mounted root (ext4 filesystem) readonly on device 179:0.
     devtmpfs: mounted
     Freeing unused kernel memory: 1024K
     Run /sbin/init as init process
     FATAL: kernel too old
     Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

(obvious error is obvious :-))


>>> package/systemd/Config.in does select BR2_PACKAGE_UTIL_LINUX_FSCK precisely for
>>> this reason...
>>> I'm adding Carlos (who added that) in Cc, maybe he has something to say about it.
>>>
>>>  ? If it now needs the fsck from e2fsprogs, then it is getting a little tricky to
>>> do the right thing. We'd have to revert the dependency between e2fsprogs fsck
>>> and util-linux fsck.
>>
>> I don't think systemd needs e2fsprog's fsck. *I* need e2fsprogs, but only for
>> its resize2fs (nevertheless, it also installs /sbin/fsck.ext4). However, systemd
>> finds /sbin/fsck.ext4, and proceeds to execute /sbin/fsck.
>>
>> My current working theory is that /sbin/fsck then in turn calls out to
>> /sbin/fsck.ext4. As far as I can tell, /sbin/fsck originates from util-linux,
>> while /sbin/fsck.* come from e2fsprogs.
> 
>   Yes indeed. And all that is exactly how it's supposed to work. So I don't
> really understand why it doesn't work for you.

I will investigate further.

Kind Regards,
Dominik
