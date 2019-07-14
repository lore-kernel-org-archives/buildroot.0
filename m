From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 22:24:06 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
In-Reply-To: <7841a190-820b-cd3c-4f71-2a5b0c5f6a0d@mind.be>
References: <20190714124400.29431-1-arnout@mind.be>
 <20190714131502.GC8912@scaer> <20190714132329.GA25166@scaer>
 <7841a190-820b-cd3c-4f71-2a5b0c5f6a0d@mind.be>
Message-ID: <0a63745f-3e08-ffa7-6c8c-84ef9e419a78@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/07/2019 20:50, Arnout Vandecappelle wrote:
> 
> 
> On 14/07/2019 15:23, Yann E. MORIN wrote:
>> Arnout, Jerzy, All,
>>
>> (sorry, I sent the previous one too quickly)
>>
>> On 2019-07-14 15:15 +0200, Yann E. MORIN spake thusly:
>>> On 2019-07-14 14:44 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> [--SNIP--]
>>>> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/251214899
>>> No, it does not fix it totally. It only fixes the python traceback.
>>> The Kodi issues is till present.
>>> Hint: the Kodi package is the only one that indents the "source" lines
>>> with a TAB.
>>
>> If one changes Kodi to not indent the source lines, then the issue
>> disappears. Of course, this is not the correct solution, but...
> 
>  Yes, because the test only looks at source lines which are indented, which is
> wrong too. It should be a regex.

 So, I changed this into a regex...

> 
>>
>> If one changes another package to also idnent the source lines with a
>> TAB, then the error happens there too (for example, fftw):
>>
>>     package/fftw/Config.in:18: Packages in: if BR2_PACKAGE_FFTW,
>>                                are not alphabetically ordered;
>>                                correct order: '-', '_', digits, capitals, lowercase;
>>                                first incorrect package: ftw/fftw-d
>>
>> OK, so, weird. The package included is in fact fftw/fftw-double and only
>> part of the bname is reported.
>>
>> But if one also looks more closely at the Kodi issue, packages names are
>> also incorrectly reported:
>>
>>     package/kodi/Config.in:303: Packages in: menu "Audio decoder addons",
>>     [--SNIP--]
>>                                 first incorrect package: kodi-audiodecoder
>>
>> And in fact, there is one thing I don;t understand in utils/checkpackagelib/lib_config.py,
>> line 106:
>>
>>     new_package = text[17: -(len(self.filename)-5):]
>>
>> Why are we using the current filename to strip away parts of the new
>> package filename?
> 
>  That is indeed the problem. I didn't look too hard at that line (because I
> already looked to much at all the rest :-). The len(self.filename)-5 works for
> package/Config.in because that exactly strips off the /Config.in part of the
> line. But that's a horrible hack, of course...

 ... and used the same regex to get the package name.

 It now seems to work correctly. However, it turns up 10 "errors":

boot/Config.in:7: Packages in: menu "Bootloaders",
                  are not alphabetically ordered;
                  correct order: '-', '_', digits, capitals, lowercase;
                  first incorrect package: arm-trusted-firmware
package/fftw/Config.in:18: Packages in: if BR2_PACKAGE_FFTW,
                           are not alphabetically ordered;
                           correct order: '-', '_', digits, capitals, lowercase;
                           first incorrect package: fftw-double
package/gstreamer/Config.in:7: Packages in: if BR2_PACKAGE_GSTREAMER,
                               are not alphabetically ordered;
                               correct order: '-', '_', digits, capitals, lowercase;
                               first incorrect package: gst-plugins-bad
package/gstreamer1/Config.in:6: Packages in: if BR2_PACKAGE_GSTREAMER1,
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals,
lowercase;
                                first incorrect package: gst1-plugins-base
package/opengl/Config.in:2: Packages in: ,
                            are not alphabetically ordered;
                            correct order: '-', '_', digits, capitals, lowercase;
                            first incorrect package: libegl
package/qt5/Config.in:84: Packages in: comment "Latest Qt version needs
host/toolchain w/ gcc >= 4.8",
                          are not alphabetically ordered;
                          correct order: '-', '_', digits, capitals, lowercase;
                          first incorrect package: qt5webengine
package/freescale-imx/Config.in:96: Packages in: if BR2_PACKAGE_FREESCALE_IMX,
                                    are not alphabetically ordered;
                                    correct order: '-', '_', digits, capitals,
lowercase;
                                    first incorrect package: firmware-imx
toolchain/toolchain-buildroot/Config.in:109: Packages in: comment "glibc on MIPS
w/ NAN2008 needs a toolchain w/ headers >= 4.5",
                                             are not alphabetically ordered;
                                             correct order: '-', '_', digits,
capitals, lowercase;
                                             first incorrect package: glibc
toolchain/toolchain-external/Config.in:17: Packages in: comment "glibc
toolchains only available with shared lib support",
                                           are not alphabetically ordered;
                                           correct order: '-', '_', digits,
capitals, lowercase;
                                           first incorrect package:
toolchain-external-codesourcery-aarch64
toolchain/Config.in:70: Packages in: menu "Toolchain",
                        are not alphabetically ordered;
                        correct order: '-', '_', digits, capitals, lowercase;
                        first incorrect package: gdb


 I haven't looked at the details yet, but I think most of them are bogus. So,
maybe we should just do it for package/Config.in and package/Config.in.host.
However, some of them *are* relevant: external toolchains, bootloaders, maybe
qt5... Note however that for those the "comment" handling is not correct (in
package/Config.in, comments are generally used to indicate submenus, but in
other Config.in files this is not the case).

 Ideas?

 Regards,
 Arnout
