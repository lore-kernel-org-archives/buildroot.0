From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 7 Jun 2013 10:06:20 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <20130607184829.36e06bfb@skate>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
 <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
 <CAMYPSMppGbVCw451=gaDOvROj=HLpYd1z9HRg5ujA9N2cu7q0w@mail.gmail.com>
 <CALo-6+h9Hm4BdgLa=ATXmZsyyQnmYYsszBFJ9zaXcu5vt2kyxA@mail.gmail.com>
 <20130607100824.2cc5e5e0@skate>
 <CALo-6+j5W7OERo3dtuUqzmcidq2tcR=BobM_d6NWt2iMx-s0tQ@mail.gmail.com>
 <20130607172352.091a3888@skate>
 <CALo-6+jJ7CNYrQnxdvZiS-zC8n4XqeLMHf7h9CwaGnC=u4SjfA@mail.gmail.com>
 <20130607184829.36e06bfb@skate>
Message-ID: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you kindly, Thomas for your kind explanation.

I can move forward for now and test the libraries that the Qt5 does
generate, including libQtOpenGL and see if I can get the helloworld or
other example to display somethine while waiting for Spenser to do his
thing.

Charles

On 6/7/13, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Charles Krinke,
>
> On Fri, 7 Jun 2013 08:40:40 -0700, Charles Krinke wrote:
>
>> You touch on the key piece of understanding I am seeking.
>> Unfortunately some of this understanding is obfuscated by similar
>> terms used by different groups.
>>
>> In the AM3517, there is a source tree called the "Graphics_SDK". And
>> it contains, I believe, EGL and OpenGL implementations for the AM3517
>> and other SoC from TI. Wojciech patch does define several variables
>> which include headers and libraries for Qt.
>>
>> I *think* we are 99% there and the missing part is this library
>> constant from Raspberry Pi, but, ... because all the alphabet soup is
>> different between Ti, Qt, and the rest of the opensource community, we
>> get to deal with ambiguity a bit.
>
> I am not sure what is confusing you here. OpenGL, EGL, OpenVG and so on
> are APIs. Those APIs are provided by different implementations,
> depending on which SoC you're using. Those implementations are
> generally provided by libraries given by the SoC vendor. So in
> Buildroot, a package that needs OpenGL doesn't depend directly on a
> specific OpenGL implementation. Instead, it depends on 'libgles',
> which is a virtual package that guarantees that *one* OpenGLES
> implementation has been selected in the system.
>
> The rpi-userland is currently the only OpenGL implementation that we
> support in Buildroot (but more are coming!). So what the rpi-userland
> package does in its Config.in is:
>
>         select BR2_PACKAGE_HAS_OPENGL_EGL
>         select BR2_PACKAGE_HAS_OPENGL_ES
>         select BR2_PACKAGE_HAS_OPENVG
>         select BR2_PACKAGE_HAS_OPENMAX
>
> This "announces" to packages like Qt that an OpenGLES, an EGL, an
> OpenVG and an OpenMAX implementation is available. Therefore, packages
> like Qt are allowed to depend on virtual packages libgles, libegl,
> libopenvg and libopenmax.
>
> In turn, those virtual packages do the following:
>
> ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> LIBGLES_DEPENDENCIES += rpi-userland
> endif
>
> ifeq ($(LIBGLES_DEPENDENCIES),)
> define LIBGLES_CONFIGURE_CMDS
>         echo "No libGLES implementation selected. Configuration error."
>         exit 1
> endef
> endif
>
> This allows to make the virtual package 'libgles' depend on
> 'rpi-userland' is this package is selected. However, if no dependency
> exists of libgles, it means that no OpenGL implementation was selected,
> which is an error: some packages (Qt for example) uses the libgles
> dependency, but no OpenGLES implementation has been enabled in the
> Buildroot configuration.
>
> Again, just wait for Spenser to post his patches, it should make OpenGL
> work out-of-the-box for AM3xxx.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>


-- 
Charles Krinke
