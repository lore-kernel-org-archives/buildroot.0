From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 May 2018 18:26:58 +0200
Subject: [Buildroot] [PATCH v2-RESEND 3/6] zynqmp-pmufw-binaries: new
 package
In-Reply-To: <20180412110935.7366ab58@windsurf>
References: <1523032461-3295-1-git-send-email-luca@lucaceresoli.net>
 <1523032461-3295-4-git-send-email-luca@lucaceresoli.net>
 <20180409231327.28e2b2e4@windsurf>
 <538f8047-1a56-0335-9d3f-912ebc9914a0@lucaceresoli.net>
 <20180412110935.7366ab58@windsurf>
Message-ID: <61ddbb76-adda-cad7-b0df-eaa2045c1d78@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12/04/2018 11:09, Thomas Petazzoni wrote:
> Hello Luca,
> 
> On Wed, 11 Apr 2018 23:03:17 +0200, Luca Ceresoli wrote:
> 
>>> So this hints at the fact that this firmware is board specific. Is that
>>> correct ? If so, shouldn't we plan on making the Git repo and its
>>> version configurable ?  
>>
>> The firmware is board-specific and configuration-specific. The plan for
>> that repo, however, is to have all supported board+config combinations
>> supported in all versions, thus the lack of a version selection knob.
> 
> "all" ? I'm pretty sure a lot of people will be doing custom designs,
> and will not be willing to push their firmware binary to your public
> repository.
> 
>>> I mean, what are the chances that for some random ZynqMP board, your
>>> Github repo will contain the appropriate firmware file ?  
>>
>> Good point. My repo there is ready to hold any possible board+config
>> combination that is interesting for known boards. I would love to host
>> more boards there (contributilns would be welcome). However I don't
>> think we'll ever see any custom board, which reduces its usefulness.
>>
>> Thus a simpler, but more flexible, option might be to nuke the
>> zynqmp-pmufw-binaries BR package and let uboot fetch the pmufw.bin from
>> a plain URL (https:// or file://). For standard devboards the URL could
>> point to my repo, but it can be anywhere else (for custom boards).
> 
> Ah, this seems like a better option indeed, especially since the
> firmware is a single file. It could be locally available, or downloaded
> from HTTP. Sounds like a good plan.

I just sent v3 which implements this. Thanks Yann for having fixed
EXTRA_DOWNLOADS! :)

>>> Generally speaking, it's a bit annoying that we can't build this from
>>> source. I understand it needs a Microblaze toolchain, so it's very
>>> difficult to integrate in Buildroot :-/  
>>
>> Indeed, and this is *the* big topic.
>>
>> There are several variations that could be considered, but none have
>> been attempted AFAIK. Here they are, simplest to hardest:
>>
>> 1. Build the PMUFW in Buildroot (kind of)
>>
>> Add a script (e.g. board/zynqmp/build-pmufw.sh) that builds a microblaze
>> toolchain and the PMUFW with a given config. The commands are already
>> there: [0].
>>
>> The script would then be called manually before Buildroot runs, or it
>> could be wrapped in a Buildroot package that uboot depends on. Takes ~8
>> minutes on a modern quad core machine.
>>
>> * Simple to do, not well integrated, longer build time.
> 
> Yeah, the integration with Buildroot here is really not great, because
> Crosstool-NG will do its own downloading, etc.
> 
>> 2. Let SPL install the PMUFW config
>>
>> This is what the Xilinx workflow does (in the Xilinx FSBL, which is more
>> or less equivalent to U-Boot SPL). This allows The PMUFW can be a unique
>> blob for all boards.
>>
>> This moves the configuration object from a piece of early firmware
>> (PMUFW) to another piece of early firmware (SPL). Both pieces are
>> residing in the same BOOT.BIN file, so there's no added flexibility for
>> the "user": upon a config change, you still have to update the BOOT.BIN
>> file in the boot medium.
>>
>> There are also licensing issues preventing this, since the configuration
>> object file license is not compatible with the U-Boot license. Xilinx
>> _might_ be willing to fix this, however.
>>
>> * Could be doable, perhaps tricky.
>>
>> 3. Don't have any config object...
>>
>> ...and change the PMUFW source code to assign dynamically peripherals to
>> cores at runtime, based on requests from cores! :->
>>
>> * Maybe doable, potentially dangerous, definitely hard to do.
> 
> Not sure I understand enough of what the PMUFW is doing to understand
> (2) and (3). And yes, I did attend your talk at FOSDEM about
> ZynqMP ! :-)

Which perhaps means I should improve my communication skills! :-\

Bye,
-- 
Luca
