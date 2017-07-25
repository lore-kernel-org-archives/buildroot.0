From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 22:51:54 +0200
Subject: [Buildroot] [.config file] Generating buildroot-like .config
 file from "linux-like" .config file
In-Reply-To: <20170725195518.weotlgmo37zfwl2k@latitude>
References: <CAB_D2Uz6n6zdA2C3_Pbx6uV39_Zs=J=VfLOzs0Mtfi-agUocKQ@mail.gmail.com>
 <20170725141319.lrbqod4juauli3dd@latitude>
 <CAB_D2UzwSwa6SXs9fW1Eg-A+EziOEg58Daa=PXjtK2ZWs1q4Sw@mail.gmail.com>
 <CAB_D2UwsHdCsfcOm2BZXrzW6AB12n+tqWkVj3KubbSpSnXPZvA@mail.gmail.com>
 <20170725195518.weotlgmo37zfwl2k@latitude>
Message-ID: <849d1913-2cde-4ee0-1777-59f80edfdef8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 21:55, Jonathan Neusch?fer wrote:
> On Tue, Jul 25, 2017 at 05:03:03PM +0200, vr roriz wrote:
>> I found a possible path for this procedure. On menuconfig, under Kernel
>> config, I can define a custom config file (for the Kernel). Then I can save
>> this "mirroring" with a savedefconfig. I will test.
>>
>> Source:
>> https://stackoverflow.com/questions/1414968/how-do-i-configure-the-linux-kernel-within-buildroot
>>
>> Is that the way people usually do that?
> 
> I think it usually works in the following way:
> 
> 1) You create a Linux defconfig, and store it under
>    arch/<architecture>/configs/<board>_defconfig, if it doesn't exist
>    already.
> 2) You use a kernel branch or patch that contains this Linux defconfig.
> 3) You let BR2_LINUX_KERNEL_DEFCONFIG point to this defconfig.
> 4) Optionally, you create a *buildroot* defconfig that contains the
>    relevant BR2_LINUX_KERNEL_DEFCONFIG line.

 If you already have a custom linux .config file, the procedure is more like this:

1) Copy your linux .config to some safe place (i.e. which will be put under
version control), e.g. my_ext_dir/board/myboard/linux.config

2) In Buildroot's config, set BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y and
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/.../my_ext_dir/board/myboard/linux.config"
(or better yet, define my_ext_dir as an external and use
$(BR2_EXTERNAL_MY_EXT_PATH)/board/myboard/linux.config)

3) If you need to change something in the kernel config, run (from Buildroot)
"make linux-menuconfig", then (if it is OK) "make linux-update-defconfig".


> It's important to know which defconfig is a kernel defconfig and which
> one is a buildroot defconfig.

 Absolutely!


> For project specific modifications of the kernel config, there are also
> some other mechanisms, like BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES and
> those listed at http://nightly.buildroot.org/manual.html#outside-br-custom.

 Yes, if you can start from an existing in-kernel defconfig, that can be handy.
The problem with the fragment files, unfortunately, is that it is not easy to
update them. You have to run "make linux-update-defconfig" and split the changes
over the different fragments... AFAIK no Kconfig fragment extractor tool exists.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
