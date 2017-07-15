From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Jul 2017 17:50:51 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: broken with sunxi mali
	package
References: <20170705163254.15156-1-bernd.kuhls@t-online.de>
 <20170705221924.79f20c24@windsurf>
Message-ID: <r7qp3exgqd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Wed, 05 Jul 2017 22:19:24 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Wed,  5 Jul 2017 18:32:52 +0200, Bernd Kuhls wrote:
> 
>> diff --git a/package/kodi/Config.in b/package/kodi/Config.in index
>> 658670139..00e4fbaef 100644 --- a/package/kodi/Config.in +++
>> b/package/kodi/Config.in @@ -22,16 +22,21 @@ config
>> BR2_PACKAGE_KODI_EGL_GLES
>>  	depends on BR2_PACKAGE_HAS_LIBEGL depends on 
BR2_PACKAGE_HAS_LIBGLES
>>  	depends on !BR2_PACKAGE_KODI_GL_EGL # prefer GL if available
>> +	depends on !BR2_PACKAGE_SUNXI_MALI
> 
> I'm not super happy with this solution. A quick Google search for
> "invalid use of incomplete type ?class CEGLNativeType?" shows up a bunch
> of results, and not with sunxi-mali.
> 
> According to https://github.com/ValveSoftware/steamlink-sdk/issues/93,
> it seemed to be a pkg-config issue.

this issue happened with the autoconf-based build system in combination 
with sdl2 support, it is unrelated to sunxi.

> Perhaps some more investigation would be useful here?

According to http://linux-sunxi.org/Kodi#Support_for_sunxi_in_Kodi the 
Kodi project does not support sunxi hardware.

The egl code of Kodi contains platform specific files for aml, imx and 
rbpi: https://github.com/xbmc/xbmc/tree/master/xbmc/windowing/egl
No code seems to be provided by upstream to support the sunxi platform 
which is the reason for the build error I fixed with my patch.

There are some patches floating around to add sunxi support to Kodi 
however, a quick search found this discussion about them:
http://www.orangepi.org/orangepibbsen///forum.php?
mod=viewthread&tid=2266&page=3

But at the end the fact remains that Kodi does not directly support sunxi 
so we should disable the usage of a broken defconfig. Adding sunxi 
support would be a feature patch to the Kodi package which, if possible 
at all, is afair not the policy of the buildroot project.

Regards, Bernd
