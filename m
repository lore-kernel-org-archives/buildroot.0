From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 22 Aug 2018 00:59:33 +0200
Subject: [Buildroot] [PATCH 1/1] linux: build default dtbs if no
 specific source files given
In-Reply-To: <38efc131-235a-e950-48be-cb97db1b6c63@mind.be>
References: <1533313674-722-1-git-send-email-bos@je-eigen-domein.nl>
 <20180816223444.41200c10@windsurf>
 <0b7c3cae-e5e2-33a7-dd73-5f5d729cbab2@je-eigen-domein.nl>
 <38efc131-235a-e950-48be-cb97db1b6c63@mind.be>
Message-ID: <2dd3662b-0da5-1d54-c318-62c619285ad2@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/2018 12:39 AM, Arnout Vandecappelle wrote:
>
> On 16/08/2018 23:11, Floris Bos wrote:
>> Hi,
>>
>> On 08/16/2018 10:34 PM, Thomas Petazzoni wrote:
>>> Hello Floris,
>>>
>>> Thanks for this contribution. It definitely makes sense to support this.
>>>
>>> On Fri,? 3 Aug 2018 18:27:54 +0200, Floris Bos wrote:
>>>> Currently if one wants to build dtbs, one has to specify which
>>>> dts source files to build exactly.
>>>> This is inconvenient, and some platforms use non-standard file
>>>> names that are currently not supported by buildroot.
>>>> (e.g. the overlay files in downstream Raspberry Pi kernel)
>>> Could you give some more specific example of those non-standard names ?
>>> Are we talking about .dtbo files ?
>> Yes.
>> Name of source file doesn't match installed file.
>>
>> overlays/dwc2-overlay.dts -> overlays/dwc2.dbto
>>
>>> I see one problem with see: no all architecture that support building
>>> dtbs have the dtbs_install target.
>> Would consider that a bug in the architecture's Makefile.
>   powerpc is the oldest architecture using dtb, and it doesn't have it...
>
>   The builddeb script has an explicit
> if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then ...

Well, the top level Makefile does clearly define the INSTALL_DTBS_PATH 
variable: https://github.com/torvalds/linux/blob/master/Makefile#L891
Would argue that if architectures do not provide a target that is able 
to use that, the architecture's Makefile is broken.

Does powerpc provide a dtbs target that builds all dtb, or is that also 
missing?


Anway, as of yesterday there seem to be some progress on consolidating 
the device-tree building for all architectures, so that should fix 
things soonish: https://lkml.org/lkml/2018/8/21/763



>
>>> Can we install all *.dtb* for example ?
>> Don't think that will deal with the "-overlay" in my example.
>   Yes it will, because the binary to install will be called .dtbo so it matches
> the *.dtb* pattern.

Keep in mind that the .dtbo will not be in arch/arm/boot/dts but in 
arch/arm/boot/dts/overlays though.
So you still would need something more sophisticated that also takes 
subdirectories into mind.


Yours sincerely,

Floris Bos
