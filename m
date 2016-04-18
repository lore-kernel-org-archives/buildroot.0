From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:28:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/opencv: module objdetect
 depends on imgproc
In-Reply-To: <CAHXCMM+X7SAvaiw2p9oPrC7TVZM9V=V6ttoWZ-arOEKbXz8G7Q@mail.gmail.com>
References: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
 <1460992275-383-2-git-send-email-bernd.kuhls@t-online.de>
 <20160418212003.393f594c@free-electrons.com>
 <CAHXCMM+gkMR16KjCW=-2o0vw_0tXDmB931ZbVk1t=WwEOPj7+A@mail.gmail.com>
 <20160418222159.166e2790@free-electrons.com>
 <CAHXCMM+X7SAvaiw2p9oPrC7TVZM9V=V6ttoWZ-arOEKbXz8G7Q@mail.gmail.com>
Message-ID: <20160418232828.5c7f3e52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 23:18:26 +0200, Samuel Martin wrote:

> Err... it may fail because:
> - when an option is enabled in the .config, it will be force to ON in opencv.mk;
> - when an option is disabled in the .config, it will be force to OFF
> in opencv.mk;

And this takes precedence over what the CMake logic thinks the
dependencies should be?

If that is the case, then we should have tons of OpenCV build failures
in the autobuilders due to random configurations that end up making a
selection of BR2_PACKAGE_OPENCV_* options that don't match the build
time requirements of OpenCV, no?

> In the end, options set to OFF will take precedence, so some modules
> enabled in the .config won't be built.

Ah, okay that's how it works. If you force set something to OFF, and
that thing is needed for another thing that is set to ON, this last
thing will not be build.

I.e if featureA depends on featureB at build-time in the CMake logic,
but Buildroot does featureA=ON featureB=OFF, then featureA will in fact
not be built.

If that's the case, then indeed we need to replicate the inter-module
dependencies in Buildroot at the Config.in level.

> The main problem with this is when another package depends on several
> opencv modules, these modules can be enabled in  the .config, but not
> built, so the package build will fail.

Right, understood.

> > so why did you object to the previous iteration of Bernd's patch?
> You mean this one [1]?
> Because I think it was not the right way to fix this.

Yes, as per your explanation, I understand.

What about http://patchwork.ozlabs.org/patch/611881/ ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
