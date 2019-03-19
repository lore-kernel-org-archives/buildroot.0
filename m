From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Mar 2019 23:00:12 +0100
Subject: [Buildroot] [PATCH v2 6/8] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <1552951269-16967-6-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
 <1552951269-16967-6-git-send-email-etienne.carriere@linaro.org>
Message-ID: <fd4d553e-7db9-3e2e-7e2d-e266a352fa31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Etienne,

 Just a few points I noticed, not a complete review...

On 19/03/2019 00:21, Etienne Carriere wrote:
> +  ln -s ./u-boot.bin output/images/bl33.bin
> +  ln -s ./tee-header_v2.bin output/images/bl32.bin
> +  ln -s ./tee-pager_v2.bin output/images/bl32_extra1.bin
> +  ln -s ./tee-pageable_v2.bin output/images/bl32_extra2.bin

 This should be done in a post-build script.

 Also, don't use ./, i.e.

ln -s u-boot.bin output/images/bl33.bin

[snip]
> +Note "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
> +brings virtfs support for file sharing with the hosted Linux OS.

 I thought virtfs was enabled with -virtfs. The netdev option creates a virtio
net device and IIUC you use p9 to get an fs over that.

 But I don't think we typically enable or document that kind of feature in our
qemu configs. Just enable the minimum that is needed to be able to get a console
and a network connection.

 In fact, I think this defconfig should be as close as possible to the vexpress
defconfig. But I'm not sure if the a9 supports trustzone, so perhaps it's better
to switch the vexpress config to a15.

[snip]
> +# Qemu emulator for the Arm target
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> +BR2_PACKAGE_HOST_QEMU_VIRTFS=y

 Why is this needed? AFAICS there is nothing special about the Buildroot-built
host-qemu, so the system-installed qemu should work just as well, no?



 Regards,
 Arnout
