From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jul 2017 23:31:38 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <20170711204204.GA2991@scaer>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan> <20170710213516.GB22898@scaer>
 <87pod6rak1.fsf@dell.be.48ers.dk> <20170711204204.GA2991@scaer>
Message-ID: <2a123420-ecda-47a0-c0c3-155e3ad77f07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-17 22:42, Yann E. MORIN wrote:
[snip]
> $ qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb 
> -drive file=output/images/rootfs.squashfs,if=sd,format=raw
> -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net
nic,model=lan9118 -net user
[snip]
> mmcblk0: mmc0:4567 QEMU! 2.25 MiB

 Hm, you're emulating an SD card here. I'm not sure how qemu deals with emulated
devices where the backing file doesn't have a size that corresponds to what the
kernel driver expects... Possibly the last bit is just chopped off, which might
lead to an issue like this...

 Does it also happen when you emulate it as an IDE device? Or even better, does
it also happen on actual hardware?

 I don't feel good doing such padding just to make qemu happy when actual
hardware doesn't need it...


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
