From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 17 Sep 2016 21:44:02 +0200
Subject: [Buildroot] [PATCH 3/4] package/efl: enable libdrm support
In-Reply-To: <20160917191151.5e0f0f42@free-electrons.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
 <1473282523-12796-3-git-send-email-romain.naour@gmail.com>
 <20160917191151.5e0f0f42@free-electrons.com>
Message-ID: <51a34943-1a28-12ec-538f-d6f58ef932ec@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for improving the two previous patches!

Le 17/09/2016 ? 19:11, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed,  7 Sep 2016 23:08:42 +0200, Romain Naour wrote:
>> This support is required for Enlightenment wayland support [1] which
>> will be added in a follow up patch.
>>
>> As stated in configure.ac, libdrm support needs libdrm, elput,
>> libxkbcommon and libgbm.
>>
>> libgbm is only provided by mesa3d package when OpenGL EGL support is
>> enabled, so add a direct dependency on mesa3d.
> 
> So, on which platform have you tested that?

Initially, I worked only with Qemu only but I set up an x86_64 atom target to
test on real hardware.

> 
> I'm still a bit uneasy with this libgbm stuff provided only by mesa3d.
> Does this means that other OpenGL ES implementations are not suitable?

On the efl download page [1] they say "opengl (mesa or vendor supplied desktop
OpenGL or OpenGL-ES2)", so mesa3d seems the only suitable implementation
available in Buildroot.

[1] https://www.enlightenment.org/download

> 
>> Rework the libxkbcommon dependency since it's now required for
>> ecore-wayland and libdrm support.
> 
> And elput (see earlier patch).
> 
>> +config BR2_PACKAGE_EFL_DRM
>> +	bool "Evas DRM Engine"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
>> +	depends on BR2_PACKAGE_EFL_ELPUT
> 
> Why do you have a "depends on" for this rather than a "select" ?

Yes, "select" should be used here.

Best regards,
Romain

> 
> Thomas
> 
