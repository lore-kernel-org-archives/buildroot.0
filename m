From: Andreas Naumann <dev@andin.de>
Date: Thu, 6 Dec 2018 11:42:37 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181206112819.7861c2f7@windsurf>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181206112819.7861c2f7@windsurf>
Message-ID: <f9730d54-6360-6144-8461-afa25bf32727@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 06.12.18 um 11:28 schrieb Thomas Petazzoni:
> Hello,
> 
> On Thu, 6 Dec 2018 11:21:25 +0100, Andreas Naumann wrote:
> 
>> Just to make sure I just did the above using your ppsh-v6 branch with
>> the wandboard_defconfig. The only additional change was to use the
>> external linaro toolchain. After 'make'
> 
> Thanks!
> 
>>     $ readelf -d output/host/sbin/mkfs.ext3
>> shows
>>     0x000000000000001d (RUNPATH)            Bibliothek runpath:
>> [/local/gsrc/buildroot.upstream/output/per-package/host-e2fsprogs/host/lib]
>>
>> which is already unexpected, shouldn't it show .../output/host/lib?
> 
> Nope, this is expected. During the build output/host/lib doesn't exist,

of course

> it's only populated at the very end of the build in host-finalize. So
> indeed the RPATH of binaries point to various per-package host/lib
> folders. This is totally expected.

Hmm, at this stage the host-finalize step was already run, so now 
output/host does exist.

> 
>> After 'make prepare-sdk'
>>     $ readelf -d output/host/sbin/mkfs.ext3
>> shows
>>     0x000000000000001d (RUNPATH)            Bibliothek runpath: []
> 
> This is obviously not good :-)
> 
> Thanks for reporting that, I'll have a look. I guess it's simply the
> fixup of RPATH from absolute to relative that goes wrong.

Would moving the fix-rpath step from prepare-sdk to host-finalize hurt?


regards,
Andi

> 
> Best regards,
> 
> Thomas
> 
