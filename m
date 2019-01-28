From: Joakim Bech <joakim.bech@linaro.org>
Date: Mon, 28 Jan 2019 17:41:40 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: update AArch32/AArch64
 toolchain to 8-2-2019.01
In-Reply-To: <20190128155951.6eb96b67@windsurf>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128140206.25948-1-joakim.bech@linaro.org>
 <20190128150834.206739d5@windsurf> <20190128143507.GA31160@guppy>
 <20190128155951.6eb96b67@windsurf>
Message-ID: <20190128164140.GA6634@guppy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jan 28, 2019 at 03:59:51PM +0100, Thomas Petazzoni wrote:
> In your case, I don't see how the version bump can work if you don't
> change:
> 
When I'm building for OP-TEE we are pre-downloading the toolchain from the
OP-TEE makefiles and refer to that when configuring Buildroot, which explains
why this was working on my side even before making the changes you're asking
for.

>   toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
>   toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
>   toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
>   toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
> 
Got it! I've made changes to those files and this time I've also tested
directly in Buildroot (without involving OP-TEE) as follows:

1) $ make qemu_aarch64_virt_defconfig
   $ make menuconfig ... select external toolchain
   $ make
   ...
   2019-01-28 17:06:00 (1.11 MB/s) - ?/home/jbech/devel/optee_projects/qemu_v8/buildroot/output/build/.gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz.7NG7Nw/output? saved [267998260/267998260]

    gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz: OK (md5: ed467a18abc7cf81d53c0cf6014b1867)
    gcc-arm-8.2-2019.01-x86_64-aarch64-linux-gnu.tar.xz: OK (sha256: 6683d51b0dd61a91ab1e8e478a0a8a50ccb34d5590c84aa36697e956b16f14a1) 

2) $ make qemu_arm_vexpress_defconfig
   $ make menuconfig ... select external toolchain
   $ make
   ...
   2019-01-28 17:26:29 (1.11 MB/s) - ?/home/jbech/devel/optee_projects/qemu_v8/buildroot/output/build/.gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz.XkMAPN/output? saved [252108596/252108596]                                                     
   gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz: OK (md5: 123887bdaa27b362f0f428dc36af5693)
   gcc-arm-8.2-2019.01-x86_64-arm-linux-gnueabihf.tar.xz: OK (sha256: 6b73016fa4773a7450bac9bd80b2ca056b5d582dd966b509a17b305fc89506a9)

Which I believe looks good and what we would expect (the builds also ended
successfully). I will send v2-patch soon, thanks for the guidance!

-- 
Regards,
Joakim
