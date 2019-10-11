From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:11:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix opengl dependency
In-Reply-To: <CADvTj4pyp2f2YT_jECf07VCzHjdCXbYkowHGYWTvtXwtwR_x7w@mail.gmail.com>
References: <20190807215804.100437-1-james.hilliard1@gmail.com>
 <20190816000232.6c7f88b8@windsurf.home>
 <CADvTj4pTQJAJ6R=0UKBW6ZPVT3A36USdGYcyn-G0e-3L-3M=gQ@mail.gmail.com>
 <20190816143142.3653b7ea@windsurf.home>
 <CADvTj4pyp2f2YT_jECf07VCzHjdCXbYkowHGYWTvtXwtwR_x7w@mail.gmail.com>
Message-ID: <312a6778-7ae2-7f6c-ce88-5df644d501d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 01:09, James Hilliard wrote:
> On Fri, Aug 16, 2019 at 6:31 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello James,
>>
>> +Peter Seiderer
>>
>> On Thu, 15 Aug 2019 16:54:56 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> On Thu, Aug 15, 2019 at 4:02 PM Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> James, Adrian, Adam,
>>>>
>>>> On Wed,  7 Aug 2019 15:58:04 -0600
>>>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>
>>>>> Fixes:
>>>>> WPEThreadedView.h:24:10: fatal error: gst/gl/gl.h: No such file or directory
>>>>>  #include <gst/gl/gl.h>
>>
>> So, I just did a test with the following defconfig, which only has
>> OpenGL ES (provided by rpi-userland) and not the full OpenGL:
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
>> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
>> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_INIT_NONE=y
>> BR2_SYSTEM_BIN_SH_NONE=y
>> # BR2_PACKAGE_BUSYBOX is not set
>> BR2_PACKAGE_GSTREAMER1=y
>> BR2_PACKAGE_GST1_PLUGINS_BASE=y
>> # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT is not set
>> # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE is not set
>> # BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME is not set
>> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL=y
>> BR2_PACKAGE_RPI_USERLAND=y
>> # BR2_TARGET_ROOTFS_TAR is not set
>>
>> And it does provide gst/gl/gl.h:
>>
>> $ find . -name 'gl.h'
>> ./output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/GLES/gl.h
> That's different from this right?:
> https://github.com/GStreamer/gst-plugins-base/blob/1.16.0/gst-libs/gst/gl/gl.h
>>
>> So, gst/gl/gl.h is provided when OpenGL ES is used, which means your
>> patch is most likely incorrect, and we should allow enabling the wpe
>> plugin when OpenGL ES is available.
> I thought gst/gl/gl.h was provided by gst1-plugins-base not OpenGL ES right?
> That should get built based on this and not OpenGL ES AFAICT:
> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL

 I suspect that what is actually needed is that gst1-plugins-base is configured
with -Dgl=enabled. Therefore, after 4164d31e05 which I just applied, I think the
condition should actually be on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API.

 Could you test with the defconfig that Thomas provided and
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2 if the build of WPE succeeds?


 Regards,
 Arnout

>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
