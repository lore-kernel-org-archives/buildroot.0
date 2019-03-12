From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Mar 2019 00:33:48 +0100
Subject: [Buildroot] why qt5webengine dependencies?
In-Reply-To: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
References: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
Message-ID: <20190313003348.04cdc397@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Tue, 12 Mar 2019 11:21:07 +0100, Martin Kepplinger <martin.kepplinger@ginzinger.com> wrote:

> hi Gael,
> 
> why does qt5webengine in buildroot have a dependency on
> * udev:
> I apply the following patch and create /dev/shm at runtime, which works
> out just fine. At least a build-depencency is questionable, isn't it?
> --- a/src/core/config/linux.pri
> +++ b/src/core/config/linux.pri
> @@ -8,7 +8,7 @@ gn_args += \
>      use_gnome_keyring=false \
>      use_kerberos=false \
>      linux_use_bundled_binutils=false \
> -    use_udev=true \
> +    use_udev=false \
>      use_bundled_fontconfig=false
> 

- Because it is the default?
- Why do you want to do this/change the default? Saving one small udev package
for an huge package as qt5webengine (loosing hot-plugging support for keyboad/mouse)?

> 
> * OpenGL backend:
> I'm yet to test this, but Qt webengine semms to support building with
> "no-opengl" since 5.8! And there's QT_WEBENGINE_DISABLE_GPU at runtime,
> so...

The QT_WEBENGINE_DISABLE_GPU option seems to be run time (and not compile time)
option...

And yes [1] mentions Rendering without GPU:

  In a number of scenarios, we disable using the GPU (e.g. when using ANGLE on
  Windows or if the OpenGL driver is known to have problems). In this case,
  the GPU thread will not be initialized at all and the renderer processes will
  use Skia's software rasterizer to generate bitmaps that are copied to the browser
  process using shared memory. In this case, Qt WebEngine will create copies of these
  bitmaps and use them to generate QImages, which are then used to create QSGTextures.
  This happens during the creation of scene graph nodes in DelegatedFrameNode::commit.
  The code that does the actual copying can be found in ResourceHolder::initTexture.

And there are some '#ifndef QT_NO_OPENGL' in the source code, e.g.
qt5webengine-5.12.1/src/webenginewidgets/render_widget_host_view_qt_delegate_widget.cpp

Maybe try without OpenGL and submit a patch lifting the requirements (since [1] qt quick
for qt latest does not depend on opengl in buildroot)?
 
Regards,
Peter

[1] https://wiki.qt.io/QtWebEngine/Rendering
[2] https://git.buildroot.net/buildroot/commit/?id=5eb43c83c10aa9cd5cdf2302af0682b3d9978ecc

> 
> 
> My question is: why the dependencies?
> 
> thanks,
> 
>                                 martin
