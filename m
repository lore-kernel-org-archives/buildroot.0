From: Andreas Naumann <dev@andin.de>
Date: Thu, 6 Dec 2018 11:21:25 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
Message-ID: <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 05.12.18 um 17:52 schrieb Andreas Naumann:
> Hi,
> 
> Am 05.12.18 um 17:31 schrieb Thomas Petazzoni:
>> Hello Andreas,
>>
>> On Wed, 5 Dec 2018 17:08:20 +0100, Andreas Naumann wrote:
>>
>>> In an answer to v4 of this series I mentioned the issue I had with empty
>>> RPATH in some host-lib. After digging some more I found this happens
>>> during the prepare-sdk step (which I call in my wrapper script). Before
>>> this step, your suggested readelf output reports the correct pathes,
>>> however after, RPATH is empty. I compared this to a "standard" SDK,
>>> there RPATH is set to $ORIGIN/../lib or something similar.
>>
>> So are you saying the issue still exists, and to reproduce, I simply
>> need to do:
>>
>> ? $ make
>> ? $ make prepare-sdk
>>
>> of a build with BR2_PER_PACKAGE_DIRECTORIES=y ?
> 
> in an essence that's what I did. My setup has two externals and some 
> custom defconfig, but that shouldnt matter since without the ppsh 
> patches things work fine.

Just to make sure I just did the above using your ppsh-v6 branch with 
the wandboard_defconfig. The only additional change was to use the 
external linaro toolchain. After 'make'
   $ readelf -d output/host/sbin/mkfs.ext3
shows
   0x000000000000001d (RUNPATH)            Bibliothek runpath: 
[/local/gsrc/buildroot.upstream/output/per-package/host-e2fsprogs/host/lib]

which is already unexpected, shouldn't it show .../output/host/lib?
After 'make prepare-sdk'
   $ readelf -d output/host/sbin/mkfs.ext3
shows
   0x000000000000001d (RUNPATH)            Bibliothek runpath: []


regards,
Andreas

> 
>>
>>> Actually, an unrelated question arises: Why does the SDK need to build
>>> world, which includes all filesystem images, first? Should it not be
>>> sufficient to depend on $(PACKAGES) or now host-finalize only?
>>
>> Yes, it would be sufficient to build packages + host-finalization I
>> believe.
> 
> Ok, I might submit a patch in this direction then..
> 
> 
> regards,
> Andreas
> 
>>
>> Best regards,
>>
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
