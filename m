From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:56:48 +0100
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
 dependencies are mandatory
In-Reply-To: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
References: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
Message-ID: <20170322225648.5a32abeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 11:56:43 +0000, Vicente Olivert Riera wrote:
> The --disable-egl configure option doesn't exist:
> 
> configure: WARNING: unrecognized options: [snip] --disable-egl
> 
> If you don't have EGL support the configure script will fail like this:
> 
> checking for EGL... no
> configure: error: Package requirements (egl) were not met:
> 
> Also, libepoxy use dlsym to load a GLES2 library when EGL support is
> enabled, see src/dispatch_common.c:
> 
> So, OpenGL ES dependency is also mandatory.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
>   http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
>   http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Romain Naour <romain.naour@gmail.com>

I would really like to hear about this patch from Gustavo. Gustavo,
could you review/comment?


> +	# OpenGL EGL is mandatory and libepoxy uses dlsym to load a
> +	# GLES2 library when EGL support is enabled. Details in
> +	# src/dispatch/dispatch_common.c
> +	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES

New dependency -> don't forget to check the reverse dependencies of
libepoxy:

package/libgtk3/Config.in:      select BR2_PACKAGE_LIBEPOXY
package/x11r7/xdriver_xf86-video-amdgpu/Config.in:      select BR2_PACKAGE_LIBEPOXY

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
