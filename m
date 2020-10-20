From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2020 23:20:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-gpu-viv: fix
 build issue with Wayland backend
In-Reply-To: <CAEyMn7ZM4Stiud_M2tnK=t-Z7Azot5LxBX9_kzxFUXgFqxikpg@mail.gmail.com>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-3-gary.bisson@boundarydevices.com>
 <20200402162543.595ed9e7@windsurf.home>
 <20200402151026.GA934730@p1g2> <20200708122048.GB331830@p1g2>
 <CAEyMn7ZM4Stiud_M2tnK=t-Z7Azot5LxBX9_kzxFUXgFqxikpg@mail.gmail.com>
Message-ID: <20201020212045.GJ3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, Heiko, Thomas,  All,

On 2020-10-13 20:30 +0200, Heiko Thiery spake thusly:
> Am Mi., 8. Juli 2020 um 14:20 Uhr schrieb Gary Bisson
> <gary.bisson@boundarydevices.com>:
> > Gentle ping on this, let me know if you see another approach that would
> > be better, I'm open to suggestions.
> >
> > I'd love to have Weston support for i.MX8M* fixed for next release and
> > my other series [1] depends on this patch.
> >
> > Then I am preparing patches to have VPU support using GStreamer-imx V2
> > for i.MX8M* as well.
> 
> Any news on that? I also would like to see weston support for imx8m in
> buildroot.

So, we've discussed and investigated this with Heiko on IRC tonight, and
we came to the conclusion that the weston build failure is a weston bug.

Indeed, weston *is* using pkg-config to find EGL:
    Run-time dependency egl found: YES 8.0

Weston is indeed using the proper CFLAGS from egl.pc to build parts of
its files; for example, bulding libweston/backend-wayland/wayland.c is
using the proper -DWL_EGL_PLATFORM.

However, the CFLAGS from egl.pc are not used when building gdbm-drm.c,
when it should. Indeed, drm-gbm.c includes gl-renderer.h which includes
egl.h which include eglpltform.h, so it seems totally expected that
drm-gbm.c does use the CFLAGS frpm egl.pc.

In my opinion, this build failre you report in your original patch is in
fact a weston bug.

Probably, patch like this could help:

    From Yann E. MORIN <yann.morin.1998@free.fr>

    libweston/backend/drm: might need EGL

    gbm-drm.c includes gl-renderer.h. When EGL is enabled, that in turns
    includes egl.h. As such, dependencies for drm should include EGL if
    it is available.

    This condition is modelled after a similar one in libweston/meson.build

    Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
    Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
    Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
    Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

    diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
    index 484c2702..67648a09 100644
    --- a/libweston/backend-drm/meson.build
    +++ b/libweston/backend-drm/meson.build
    @@ -53,6 +53,10 @@ if get_option('renderer-gl')
     		config_h.set('HAVE_GBM_FD_IMPORT', '1')
     	endif
     	deps_drm += dep_gbm
    +	deps_egl = dependency('egl', required: false)
    +	if dep_egl.found()
    +		deps_drm += dep_egl
    +	endif
     	srcs_drm += 'drm-gbm.c'
     	config_h.set('BUILD_DRM_GBM', '1')
     	endif

The build succeeded for me with that patch, at least; I'll let you check
it is valid, and maybe send it upstream

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
