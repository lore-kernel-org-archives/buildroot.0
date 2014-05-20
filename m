From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 May 2014 18:33:10 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <20140518172928.GD3631@free.fr>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
 <20140518172928.GD3631@free.fr>
Message-ID: <537B83C6.6080403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/05/14 19:29, Yann E. MORIN wrote:
> Bernd, All,
> 
> On 2014-05-18 18:58 +0200, Bernd Kuhls spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
>> news:20140518162900.GA3631 at free.fr: 
>>
>>> Something like:
>> [...]
>>> should do the trick.
>>
>> Hi,
>>
>> for further comments I posted my current patch here:
>> http://pastebin.com/zv7jueLB (expires in one week).
>>
>> Especially the last "depends on" block looks crude, but seems to work.
> 
> Yep, it looks too dense. I think we can factor it into:
> 
>     depends on BR2_arm || BR2_i386 || BR2_x86_64
>     depends on HAS_LIBEGL && HAS_LIBGLES \
>             || (BR2_i386 || BR2_x86_64) && HAS_LIBGL

 I don't agree with you Yann that the () should be left out here. Not many
people know enough about the Kconfig logic to be able to be sure about the
precedence here.

> 
> So, it first ensures that it is only visible for ARM or x86 (the only
> archs we currently support SBMC on.)
> 
> Then, it is available only for EGL+GLES or x86+GL, since EGL+GLES is
> posible on ARM and x86 alike, but full GL is only possible on x86.

 I think there's something more fundamentally inappropriate about the approach
taken here. I think the way out could be to add auxiliary symbols to identify
which provider is used. Something like:

config BR2_PACKAGE_XBMC_EGL_GLES
	bool
	default y
	depends on BR2_PACKAGE_HAS_LIBEGL
	depends on BR2_PACKAGE_HAS_LIBGLES
	depends on !BR2_PACKAGE_XBMC_GL # prefer GL if available

config BR2_PACKAGE_XBMC_GL
	bool
	depends on BR2_PACKAGE_XORG7
	depends on BR2_PACKAGE_HAS_LIBGL

comment "xbmc requires an OpenGL-capable backend"
	depends on BR2_USE_MMU
	depends on BR2_arm || BR2_i386 || BR2_x86_64
	depends on !BR2_PACKAGE_XBMC_EGL_GLES
	depends on !BR2_PACKAGE_XBMC_GL

config BR2_PACKAGE_XBMC
	...
	depends on BR2_PACKAGE_XBMC_EGL_GLES || BR2_PACKAGE_XBMC_GL


 That also allows you to use these new symbols in the .mk file instead of the
_HAS_LIBGL which IMHO is not sufficiently accurate and future-safe.


 BTW, I don't understand this comment:

# mesa3d provides libgl only with dri drivers which depend on xorg

 If that is the case, then it's up to mesa3d to add the required dependencies, no?


 Regards,
 Arnout


> 
> I think it is much cleaner to separate the architectures dependencies
> from the GL dependencies.
> 
> Of course, this would probably not scale if we were to support it on
> other archs (eg. PPC), but it will be time to revisit this if/when we
> happen to add that support.
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
