From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 09:22:02 +0200
Subject: [Buildroot] Intel Edison support
In-Reply-To: <CA+-urNReEwGqR=FgyWsm9nAO=QkiTcbtfcxBaF3__eCciASM1g@mail.gmail.com>
References: <CA+-urNRPe3bv+FH9He==b2_aa_NCnDXwxUJGGZqfUsNGyZt74w@mail.gmail.com>
 <5530275D.90305@mind.be>
 <CA+-urNReEwGqR=FgyWsm9nAO=QkiTcbtfcxBaF3__eCciASM1g@mail.gmail.com>
Message-ID: <5530B49A.4000206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 00:50, Frank Hunleth wrote:
> On Thu, Apr 16, 2015 at 5:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>> On 16/04/15 14:33, Frank Hunleth wrote:
>>> Hi all,
>>>
>>> I have support for the Intel Edison working in Buildroot. It took a while to
>>> figure out everything that Intel's Yocto distribution was doing, but after you
>>> simplify it down, it doesn't seem so bad. I'd send the patch up for review, but
>>> it is dwarfed by two massive patch files on u-boot and the kernel that I had to
>>> copy from Intel's Yocto distro [1]. It seems better if BR could download the
>>> Yocto distro, extract the patch files, and use them when needed. It also doesn't
>>> seem right for BR to have to carry around a couple mega-patches. Is this
>>> possible and is there an example somewhere?
>>>
>>> If you would like to see my current patches for Edison support, they are
>>> available here: https://github.com/fhunleth/buildroot-edison.
>>
>>  There is a github upload of the official Edison yocto layer at [2]. You could
>> download the relevant patches from there with BR2_LINUX_KERNEL_PATCH. When you
>> do that, please make sure that the sha is included in the URL, so [3] and not [4].
> 
> Thanks. I'll try that for the kernel.
> 
> At the moment, u-boot only supports patch directories, so I can't
> download the mega-patch for it. I was going to copy/paste the patch
> support from the kernel, but the kernel's patch support looks more
> involved than I expected. I'm not missing a generic patch macro
> somewhere, am I?

 The complexity for linux is simply because historically it also supports
directories of patches. If you exclude that feature, it's simply:

UBOOT_PATCH += $(call qstrip,$(BR2_TARGET_UBOOT_PATCHES))

 If you do that, we should probably also deprecate the current special handling
of BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR.


 Actually, perhaps we should consider extending the BR2_GLOBAL_PATCH_DIR to
support some kind of URL-encoded patches. E.g. *.urlpatch, or dead symlinks to
URLs, or something. Sounds like something for Yann to work on :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
