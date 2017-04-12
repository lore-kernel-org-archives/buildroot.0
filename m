From: Matt Flax <flatmax@flatmax.org>
Date: Wed, 12 Apr 2017 19:17:00 +1000
Subject: [Buildroot] aarch64 : g++ is not working
In-Reply-To: <f53a3152-a0ad-d86d-a9d1-26da5dceb526@flatmax.org>
References: <f53a3152-a0ad-d86d-a9d1-26da5dceb526@flatmax.org>
Message-ID: <bbdce605-675e-d770-3981-cf37e658d8e6@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Turns out this bug is with ulibc.

ulibc and g++ don't play well together - by switching to glibc, the 
problem is resolved.


Matt


On 11/04/17 09:50, Matt Flax wrote:
> Hi there,
>
> I have found that g++ is not working with aarch64. Not sure why it 
> isn't working. If others can verify this problem, it is a pretty big 
> show stopper.
>
> I have checked the problem with rtorrent like so :
>
> BR2_aarch64=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_RTORRENT=y
>
> When I execute rtorrent :
>
> # rtorrent
>
> /usr/bin/rtorrent: symbol '_ZSt15__once_callable': can't handle reloc 
> type 0x407
>
>
> Any one got any ideas on how to get g++ working with aarch64 and 
> buildroot ?
>
>
> I have tried to test on qemu like so :
>
> make qemu_aarch64_virt_defconfig
> make menuconfig # enable cxx and rtorrent
>
> However, when I try to run qemu (looking at the file 
> board/qemu/aarch64-virt/readme.txt) the kernel doesn't output during 
> boot  - any suggestions on how to make this work ? I use the following 
> command :
>
> qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel 
> output/images/Image -append "console=ttyAMA0" -netdev user,id=eth0 
> -device virtio-net-device,netdev=eth0
>
>
> thanks
>
> Matt
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
