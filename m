From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 15 Mar 2019 08:17:55 +0100
Subject: [Buildroot] why qt5webengine dependencies?
In-Reply-To: <20190313003348.04cdc397@gmx.net>
References: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
 <20190313003348.04cdc397@gmx.net>
Message-ID: <df4c4c02-da91-69ab-9e28-6226db717bc7@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13.03.19 00:33, Peter Seiderer wrote:
> Hello Martin,
> 
> On Tue, 12 Mar 2019 11:21:07 +0100, Martin Kepplinger <martin.kepplinger@ginzinger.com> wrote:
> 
>> hi Gael,
>>
>> why does qt5webengine in buildroot have a dependency on
>> * udev:
>> I apply the following patch and create /dev/shm at runtime, which works
>> out just fine. At least a build-depencency is questionable, isn't it?
>> --- a/src/core/config/linux.pri
>> +++ b/src/core/config/linux.pri
>> @@ -8,7 +8,7 @@ gn_args += \
>>      use_gnome_keyring=false \
>>      use_kerberos=false \
>>      linux_use_bundled_binutils=false \
>> -    use_udev=true \
>> +    use_udev=false \
>>      use_bundled_fontconfig=false
>>
> 
> - Because it is the default?
> - Why do you want to do this/change the default? Saving one small udev package
> for an huge package as qt5webengine (loosing hot-plugging support for keyboad/mouse)?
> 

nevermind, udev is fine (as long as it's not gudev :) and if people
really don't use it, they can work around it.

>>
>> * OpenGL backend:
>> I'm yet to test this, but Qt webengine semms to support building with
>> "no-opengl" since 5.8! And there's QT_WEBENGINE_DISABLE_GPU at runtime,
>> so...
> 
> The QT_WEBENGINE_DISABLE_GPU option seems to be run time (and not compile time)
> option...
> 
> And yes [1] mentions Rendering without GPU:
> 
>   In a number of scenarios, we disable using the GPU (e.g. when using ANGLE on
>   Windows or if the OpenGL driver is known to have problems). In this case,
>   the GPU thread will not be initialized at all and the renderer processes will
>   use Skia's software rasterizer to generate bitmaps that are copied to the browser
>   process using shared memory. In this case, Qt WebEngine will create copies of these
>   bitmaps and use them to generate QImages, which are then used to create QSGTextures.
>   This happens during the creation of scene graph nodes in DelegatedFrameNode::commit.
>   The code that does the actual copying can be found in ResourceHolder::initTexture.
> 
> And there are some '#ifndef QT_NO_OPENGL' in the source code, e.g.
> qt5webengine-5.12.1/src/webenginewidgets/render_widget_host_view_qt_delegate_widget.cpp
> 
> Maybe try without OpenGL and submit a patch lifting the requirements (since [1] qt quick
> for qt latest does not depend on opengl in buildroot)?
>  

just to keep you updated, I'm looking into that as part of this
bugreport: https://bugreports.qt.io/browse/QTBUG-54327 and the bottom
line is Qt 5.11 indeed seems to have the opengl dependency lifted already.

I haven't yet figured out how to build without small but nasty
config-patches though... (But with those, I'm running a webengine
browser on imx6ul without mesa3d/khr opengl libs just fine.) but I have
to say I'm not a Qt developer *at all*.

thanks so far,
                       martin


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190315/1ddf95b9/attachment-0001.bin>
