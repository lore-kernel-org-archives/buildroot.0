From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 28 Apr 2016 18:21:50 +0100
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <20160427144110.GR28464@e106497-lin.cambridge.arm.com>
References: <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
 <20160427133149.330a7ea0@free-electrons.com> <5720A627.6000109@synopsys.com>
 <20160427120454.GN28464@e106497-lin.cambridge.arm.com>
 <20160427143915.4c66a19d@free-electrons.com>
 <20160427124632.GO28464@e106497-lin.cambridge.arm.com>
 <20160427145339.36ff162b@free-electrons.com> <5720C9FE.9000507@synopsys.com>
 <20160427163122.0002b7ef@free-electrons.com>
 <20160427144110.GR28464@e106497-lin.cambridge.arm.com>
Message-ID: <572246AE.9070804@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I am planning to put the atfirmware package u-boot dependent, in order to get
the u-boot binary automatically without being needed to specify the location of
the binary.

For this:

# Automatically find the U-Boot binary
ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME), )
ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/"u-boot.bin"
else
ATFIRMWARE_PAYLOAD_PATH = $(BINARIES_DIR)/$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME)
endif

ATFIRMWARE_MAKE_OPTS += \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	BL33=$(call qstrip,$(ATFIRMWARE_PAYLOAD_PATH)) \
	$(call qstrip,$(BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES)) \
	PLAT=$(ATFIRMWARE_PLATFORM) \
	all fip

In terms of the SCP_FW, I think for now is more reliable to make the final stage
manually if using a Juno board. From my experience stuff in Linaro repositories
change frequently and so we have a good probability of breaking the binary download.
I suggest to put a note in the readme.txt saying what should be done, since
everyone using a Juno will have access to the SCP FW in the board.

What do you think?

On 4/27/2016 3:41 PM, Liviu.Dudau at arm.com wrote:
> On Wed, Apr 27, 2016 at 04:31:22PM +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 27 Apr 2016 15:17:34 +0100, Joao Pinto wrote:
>>
>>>> That is still OK, we can always have a Buildroot package that
>>>> downloads that tarball, extracts it, takes the fip.bin, uses the
>>>> fip_create tool to extract the SCP firmware, install it somewhere, and
>>>> then have the atfirmware package pick it up to create the final fip.bin.
>>>
>>> There's a detail. fip_create is built by the atfirmware package. So the package
>>> must be built once, extract the scp, copy somewhere, built it again now with the
>>> SCP_BL2. It is doable, but double build is needed and I don't know how buildroot
>>> deals with this 2xbuild operation.
> 
> It looks like the binary *is* available from a Linaro git tree, but it has the old
> name before ATF has renamed it SCP_BL2:
> 
> https://git.linaro.org/arm/vexpress-firmware.git/blob/refs/heads/juno:/SOFTWARE/bl30.bin
> 
> Best regards,
> Liviu
> 
>>
>> Gaah. This is indeed going to be insane. Another option is to have:
>>
>>  1/ Your atfirmware package as-is.
>>  2/ A package that just downloads/extracts the SCP firmware.
>>  3/ A post-image script that generates the final fip.bin.
>>
>> That's probably the easiest solution for now. We can see at making that
>> better when/if we have more platforms that require a similar firmware.
>> My ARM64 platform does not: I simply need to build U-Boot and ATF, and
>> the image produced by ATF is directly usable.
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
> 

Thanks.

Joao
