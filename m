From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Apr 2016 23:18:26 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/opencv: module objdetect
 depends on imgproc
In-Reply-To: <20160418222159.166e2790@free-electrons.com>
References: <1460992275-383-1-git-send-email-bernd.kuhls@t-online.de>
 <1460992275-383-2-git-send-email-bernd.kuhls@t-online.de>
 <20160418212003.393f594c@free-electrons.com>
 <CAHXCMM+gkMR16KjCW=-2o0vw_0tXDmB931ZbVk1t=WwEOPj7+A@mail.gmail.com>
 <20160418222159.166e2790@free-electrons.com>
Message-ID: <CAHXCMM+X7SAvaiw2p9oPrC7TVZM9V=V6ttoWZ-arOEKbXz8G7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 18, 2016 at 10:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 18 Apr 2016 21:57:49 +0200, Samuel Martin wrote:
>
>> > Can you comment on this one? I thought we had no expression of the
>> > interdependencies between OpenCV modules. Are those interdependencies
>> > build-time dependencies or run-time dependencies?
>> In opencv(2) we don't, in opencv3 we do.
>>
>> I did the work on opencv3 when bumping the package, but did not take
>> the time to do it on opencv(2) after we reverted it.
>>
>> These interdependencies are build-time deps., they are already
>> expressed in the cmake code.
>> One just needs to extract the info and report it in the Config.in.
>> I'll check if I can quickly dig up something about this on the
>> opencv(2) package.
>
> If they are already expressed in the CMake code, the build will not
> fail,
Err... it may fail because:
- when an option is enabled in the .config, it will be force to ON in opencv.mk;
- when an option is disabled in the .config, it will be force to OFF
in opencv.mk;
In the end, options set to OFF will take precedence, so some modules
enabled in the .config won't be built.
The main problem with this is when another package depends on several
opencv modules, these modules can be enabled in  the .config, but not
built, so the package build will fail.
I already fixed such failures in the past (don't remember what
packages were involved, maybe gst-opencv-plugin).

> so why did you object to the previous iteration of Bernd's patch?
You mean this one [1]?
Because I think it was not the right way to fix this.


[1] http://patchwork.ozlabs.org/patch/611563/

Regards,

-- 
Samuel
