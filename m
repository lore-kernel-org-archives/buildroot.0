From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:02:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/libegl: add option for wayland
 extensions
In-Reply-To: <6d4c564432948310ca9502dc94c2d50a7c97f460.1471968455.git.yann.morin.1998@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <6d4c564432948310ca9502dc94c2d50a7c97f460.1471968455.git.yann.morin.1998@free.fr>
Message-ID: <20160823220245.49e1b6e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 18:26:32 +0200, Yann E. MORIN wrote:
> Wayland requires that an OpenGL/EGL implementation provides a few
> extensions, so that wayland servers and clients can exchange buffers.
> 
> Currently, only one OpenGL/EGL implementation provides those extensions:
> mesa3d.
> 
> However, other implementations are catching up, especially the
> proprietary NVidia driver, which has as of late introduced those
> extensions. Other, non-public implementations may also provide those
> extensions.
> 
> A lot of wayland-related packages require those extensions, and
> currently they have to depend on mesa3d to provide OpenGL/EGL, which
> precludes using those packages when a non-mesa3d provider is enabled,
> even when that providers implements the necessary extensions.
> 
> Add an option to the libegl virtual package, that providers on
> OpenGL/EGL can select to state they provide those extensions.
> 
> Pacakges that need those extensions can additionally depend on this new
> option, instead of the existing libegl package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/opengl/libegl/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to next, thanks.

One thing that surprises me though is that weston itself doesn't use
this new option, and still has:

config BR2_PACKAGE_WESTON_DRM
        bool "DRM compositor"
        depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
        select BR2_PACKAGE_LIBDRM
        select BR2_PACKAGE_WESTON_HAS_COMPOSITOR

# Uses libgbm from mesa3d
comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
        depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL

So it's weird to have a new OpenGL implementation that is said to be
Wayland capable, but doesn't allow to build the reference Wayland
implementation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
