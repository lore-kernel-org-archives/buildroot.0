From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 18:09:31 +0100
Subject: [Buildroot] [PATCH
 2/2]package/x11r7/xdriver_xf86-video-nouveau:Fix DRI dependency
References: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
 <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
 <20151220140003.47c8cb99@free-electrons.com>
Message-ID: <bv3jkcxh6u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 20 Dec 2015 14:00:03 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Sat, 19 Dec 2015 17:53:35 +0100, Bernd Kuhls wrote:
> 
>>  config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
>>  	bool "xf86-video-nouveau"
>>  	depends on BR2_PACKAGE_MESA3D
>> +	# package depends on DRI support in xserver_xorg-server +	# 
libdrm
>> locking macros use armv6+ instructions on arm +	depends on
>> !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
>>  	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU select
>>  	BR2_PACKAGE_LIBDRM select BR2_PACKAGE_LIBDRM_NOUVEAU
> 
> I don't quite understand this one. Where are these locking macros
> implemented? In the nouveau xf86 driver? In the libdrm nouveau part? In
> the mesa3d nouveau part?

the limitation comes from xserver_xorg-server:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/
xserver_xorg-server.mk#n133

xdriver_xf86-video-nouveau needs DRI support enabled in the xserver_xorg-
server package, this is only true in this case:
ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)n$(BR2_ARM_CPU_ARMV4)
$(BR2_ARM_CPU_ARMV5),yn)

I ported this limitation (no DRI support for armv4/5) to package/x11r7/
xdriver_xf86-video-nouveau/Config.in with this patch, along with the 
comment from xserver_xorg-server.mk and a reference to the xserver_xorg-
server package to fix your build error on armv5:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/135186

Regards, Bernd
