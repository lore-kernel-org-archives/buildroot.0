From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 May 2014 01:16:15 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <20140520164924.GA3506@free.fr>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
 <20140518172928.GD3631@free.fr> <537B83C6.6080403@mind.be>
 <20140520164924.GA3506@free.fr>
Message-ID: <537BE23F.602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/14 18:49, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-05-20 18:33 +0200, Arnout Vandecappelle spake thusly:
>> On 18/05/14 19:29, Yann E. MORIN wrote:
>>> Bernd, All,
>>>
>>> On 2014-05-18 18:58 +0200, Bernd Kuhls spake thusly:
>>>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
>>>> news:20140518162900.GA3631 at free.fr: 
>>>>
>>>>> Something like:
>>>> [...]
>>>>> should do the trick.
>>>>
>>>> Hi,
>>>>
>>>> for further comments I posted my current patch here:
>>>> http://pastebin.com/zv7jueLB (expires in one week).
>>>>
>>>> Especially the last "depends on" block looks crude, but seems to work.
>>>
>>> Yep, it looks too dense. I think we can factor it into:
>>>
>>>     depends on BR2_arm || BR2_i386 || BR2_x86_64
>>>     depends on HAS_LIBEGL && HAS_LIBGLES \
>>>             || (BR2_i386 || BR2_x86_64) && HAS_LIBGL
>>
>>  I don't agree with you Yann that the () should be left out here. Not many
>> people know enough about the Kconfig logic to be able to be sure about the
>> precedence here.
> 
> Well, the precedence of the || and && operators is always the same in
> virtually all languages: C, shell, java, you-name-it. kconfig does just
> abide by the usual standards, here, and it's clearly stated in the
> kconfig grammar.

 In shell, || and && have equal precedence. So I disagree here.

> 
> Furthermore, leaving the () would falsely imply that || would have
> precedence over &&, which is not the case.
> 
>>> So, it first ensures that it is only visible for ARM or x86 (the only
>>> archs we currently support SBMC on.)
>>>
>>> Then, it is available only for EGL+GLES or x86+GL, since EGL+GLES is
>>> posible on ARM and x86 alike, but full GL is only possible on x86.
>>
>>  I think there's something more fundamentally inappropriate about the approach
>> taken here. I think the way out could be to add auxiliary symbols to identify
>> which provider is used. Something like:
>>
>> config BR2_PACKAGE_XBMC_EGL_GLES
>> 	bool
>> 	default y
>> 	depends on BR2_PACKAGE_HAS_LIBEGL
>> 	depends on BR2_PACKAGE_HAS_LIBGLES
>> 	depends on !BR2_PACKAGE_XBMC_GL # prefer GL if available
>>
>> config BR2_PACKAGE_XBMC_GL
>> 	bool
> 
> Missing 'default y' here too, I guess. ;-)
> 
>> 	depends on BR2_PACKAGE_XORG7
>> 	depends on BR2_PACKAGE_HAS_LIBGL
> 
> And as Bernd said, full openGL support in XBMC is not possible on ARM,
> so it is missing a dependency on !BR2_arm. But the basis are here,
> granted.

 Agreed if there is a specific ARM dependency in XBMC itself. I don't agree if
this is just because only mesa3d on x86 implements libgl.

>> comment "xbmc requires an OpenGL-capable backend"
> 
> I think we want to differentiate the full-openGL vs. openGL EGL/GLES
> cases, here, since ARM can only work with EGL/GLES, while x86 can use
> either. So we'd need a comment for ARM (or any arch that requires
> GL/GLES), and another comment for x86 (or any arch that supports both.)

 Other packages use "requires an OpenGL-capable backend" even if they need
EGL/GLES. But admittedly these others are all qt5.

> 
>> 	depends on BR2_USE_MMU
>> 	depends on BR2_arm || BR2_i386 || BR2_x86_64
>> 	depends on !BR2_PACKAGE_XBMC_EGL_GLES
>> 	depends on !BR2_PACKAGE_XBMC_GL
>>
>> config BR2_PACKAGE_XBMC
>> 	...
>> 	depends on BR2_PACKAGE_XBMC_EGL_GLES || BR2_PACKAGE_XBMC_GL
> 
> Yes, this seems more sound, indeed. I tried to come up with something
> like that, but I failed to properly abstract the situation. Your
> solution is pretty good, I like it. ;-)
> 
>>  That also allows you to use these new symbols in the .mk file instead of the
>> _HAS_LIBGL which IMHO is not sufficiently accurate and future-safe.
> 
> I disagree. _HAS_LIBGL is just that: we do have a libGL implementation
> available.

 Well, if we get another libgl provider that doesn't require X, then the
_HAS_LIBGL condition will be incorrect...


 Regards,
 Arnout


> Now, I never managed to grasp all those lib*GL* stuff. What about libGLX?
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
