From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 30 Apr 2014 22:30:45 +0200
Subject: [Buildroot] Two stages compilation
In-Reply-To: <20140430210324.31be1446@skate>
References: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
 <535F8499.8070406@gmail.com>
 <CA+TH9VmbVayiELjF9FaMDBBE9tJvgBy8b2CUovg74b4qh4nBNA@mail.gmail.com>
 <CAAXf6LVtAuS4DHWH9B-HtMcL-H6JszDsA2853c6FpM2Pu50WbA@mail.gmail.com>
 <20140430210324.31be1446@skate>
Message-ID: <CA+TH9V=W5gr5r_TuFXxVyN4gJp7f9pS7MQrG45G7KAq5jKLf6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HiTtomas

>> Note that Alexander Varnin has submitted a patch to the list for the
>> mono runtime a while back:
>> http://patchwork.ozlabs.org/patch/299488/
>
> Though this particular package only provides a target version of Mono,
> which probably means that it relies on mono being installed on the
> build machine to be able to build all the Mono C# libraries (i.e step 2
> in Angelo's description).

Yes, that patch only provides the first half, I want to provide both the halves.

> So indeed, as Zoltan pointed out, most likely the solution is to have
> both a target and a host variant for Mono. The host variant builds the
> compiler, and is used on the build machine to compile all the Mono C#
> libraries into the corresponding byte code. The target variant builds
> the "virtual machine" that runs on the target. And obviously most
> likely the target variant will have a dependency on the host variant.
>
> Also, the host variant building the compiler will be useful if people
> want to package other Mono libraries/applications.

Yes, this is exactly what I aiming at. Actually I have a mono
metapackage that imports two subpackages, mono-native and
mono-managed.
The mono native part works like a charm, the mono-managed is where I'm
having troubles.

Actually I have something like this:


#############################################################
#
# mono-managed
#
#############################################################

MONO_MANAGED_VERSION         = $(MONO_VERSION)
MONO_MANAGED_SITE            = $(MONO_SITE)
MONO_MANAGED_SOURCE          = $(MONO_SOURCE)
MONO_MANAGED_INSTALL_STAGING  = $(MONO_INSTALL_STAGING)

HOST_MONO_MANAGED_CONF_ENV = \
CFLAGS="--sysroot=$(STAGING_DIR)"

HOST_MONO_MANAGED_CONF_OPT = \
$(MONO_CONF_OPT)

$(eval $(autotools-package))
$(eval $(host-autotools-package))


But looking at the configure phase I can see:

   Libraries:
        .NET 2.0/3.5:  no
        .NET 4.0:      no
        .NET 4.5:      no
        MonoDroid:     no
        MonoTouch:     no
        Xamarin.Mac:   no
        JNI support:   IKVM Native
        libgdiplus:    assumed to be installed
        zlib:

So .NET libraries will be not compiled.

If I enter manually the the build/mono-managed folder and issue a
./configure I can see this:

 Libraries:
        .NET 2.0/3.5:  yes
        .NET 4.0:      yes
        .NET 4.5:      yes
        MonoDroid:     no
        MonoTouch:     no
        Xamarin.Mac:   no
        JNI support:   IKVM Native
        libgdiplus:    assumed to be installed
        zlib:          system zlib

The main difference I can see in both config.log is --target and
--host options, they are (wrongly?)

--target=arm-buildroot-linux-uclibcgnueabi
--host=arm-buildroot-linux-uclibcgnueabi

when they should be

--host=x86_64-linux-gnu
--target=x86_64-linux-gnu

Have you any advice?

Thank you!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
