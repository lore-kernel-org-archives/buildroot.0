From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 11 Apr 2018 23:03:17 +0200
Subject: [Buildroot] [PATCH v2-RESEND 3/6] zynqmp-pmufw-binaries: new
 package
In-Reply-To: <20180409231327.28e2b2e4@windsurf>
References: <1523032461-3295-1-git-send-email-luca@lucaceresoli.net>
 <1523032461-3295-4-git-send-email-luca@lucaceresoli.net>
 <20180409231327.28e2b2e4@windsurf>
Message-ID: <538f8047-1a56-0335-9d3f-912ebc9914a0@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/04/2018 23:13, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  6 Apr 2018 18:34:18 +0200, Luca Ceresoli wrote:
> 
>> diff --git a/boot/zynqmp-pmufw-binaries/Config.in b/boot/zynqmp-pmufw-binaries/Config.in
>> new file mode 100644
>> index 000000000000..e39561cbf91e
>> --- /dev/null
>> +++ b/boot/zynqmp-pmufw-binaries/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_TARGET_ZYNQMP_PMUFW_BINARIES
>> +	bool "Zynqmp PMU firmware"
>> +	depends on BR2_aarch64
>> +	help
>> +	  This package provides precompiled firmwares for the Platform
>> +	  Management Unit (PMU) of the Xilinx ZynqMP family of SoCs.
>> +
>> +	  https://github.com/lucaceresoli/zynqmp-pmufw-binaries
>> +
>> +if BR2_TARGET_ZYNQMP_PMUFW_BINARIES
>> +
>> +config BR2_TARGET_ZYNQMP_PMUFW_BINARIES_IMAGE
>> +	string "PMU firmware image file"
>> +	help
>> +	  Enter the path to the PMU firmware file for your board and
>> +	  configuration, relative to the repository top directory.
>> +	  Example: "zcu106-default/pmufw.bin".
> 
> So this hints at the fact that this firmware is board specific. Is that
> correct ? If so, shouldn't we plan on making the Git repo and its
> version configurable ?

The firmware is board-specific and configuration-specific. The plan for
that repo, however, is to have all supported board+config combinations
supported in all versions, thus the lack of a version selection knob.

But maybe we can reconsider this topic later, when the repo contains at
least 2 versions, or at least 2 boards, or at least 2 configs... :)

> I mean, what are the chances that for some random ZynqMP board, your
> Github repo will contain the appropriate firmware file ?

Good point. My repo there is ready to hold any possible board+config
combination that is interesting for known boards. I would love to host
more boards there (contributilns would be welcome). However I don't
think we'll ever see any custom board, which reduces its usefulness.

Thus a simpler, but more flexible, option might be to nuke the
zynqmp-pmufw-binaries BR package and let uboot fetch the pmufw.bin from
a plain URL (https:// or file://). For standard devboards the URL could
point to my repo, but it can be anywhere else (for custom boards).

> Generally speaking, it's a bit annoying that we can't build this from
> source. I understand it needs a Microblaze toolchain, so it's very
> difficult to integrate in Buildroot :-/

Indeed, and this is *the* big topic.

There are several variations that could be considered, but none have
been attempted AFAIK. Here they are, simplest to hardest:

1. Build the PMUFW in Buildroot (kind of)

Add a script (e.g. board/zynqmp/build-pmufw.sh) that builds a microblaze
toolchain and the PMUFW with a given config. The commands are already
there: [0].

The script would then be called manually before Buildroot runs, or it
could be wrapped in a Buildroot package that uboot depends on. Takes ~8
minutes on a modern quad core machine.

* Simple to do, not well integrated, longer build time.

2. Let SPL install the PMUFW config

This is what the Xilinx workflow does (in the Xilinx FSBL, which is more
or less equivalent to U-Boot SPL). This allows The PMUFW can be a unique
blob for all boards.

This moves the configuration object from a piece of early firmware
(PMUFW) to another piece of early firmware (SPL). Both pieces are
residing in the same BOOT.BIN file, so there's no added flexibility for
the "user": upon a config change, you still have to update the BOOT.BIN
file in the boot medium.

There are also licensing issues preventing this, since the configuration
object file license is not compatible with the U-Boot license. Xilinx
_might_ be willing to fix this, however.

* Could be doable, perhaps tricky.

3. Don't have any config object...

...and change the PMUFW source code to assign dynamically peripherals to
cores at runtime, based on requests from cores! :->

* Maybe doable, potentially dangerous, definitely hard to do.

[0]
https://github.com/lucaceresoli/zynqmp-pmufw-builder/blob/master/build.sh

Any idea or suggestion is very welcome, although I think we cannot do
much more than looking for the least evil solution...

Bye,
-- 
Luca
