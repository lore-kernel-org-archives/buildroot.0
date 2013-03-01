From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 01 Mar 2013 17:39:52 +0100
Subject: [Buildroot] [PATCH] Add Qt5 packages
In-Reply-To: <20130301100844.2f7b014a@skate>
References: <1362007582-14753-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <513011C9.8030301@je-eigen-domein.nl> <20130301100844.2f7b014a@skate>
Message-ID: <5130D9D8.5000603@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 03/01/2013 10:08 AM, Thomas Petazzoni wrote:
> So I suspect you didn't had fontconfig support enabled. Is this correct?

Correct

> If so, then I can include a path that makes fonts.path be 
> $$[QT_INSTALL_PREFIX]/share/fonts/. But Qt has some fonts in 
> lib/fonts/, so maybe we should research how to install them, at least 
> optionally, because they have some fonts in the special Qt format, 
> which may be useful if you don't have a TTF font renderer available. 

Sounds good to me.

>> - When building for a Raspberry Pi (eglfs plugin), applications fails to
>> start at runtime:
>>
>> assertion
>> failure:/hdd/max/dev/qtbuildroot/buildroot/output/build/rpi-userland-5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108/interface/vmcs_host/vc_vchi_dispmanx.c:84:lock_obtain():dispmanx_client.initialised
>> Aborted
>>
>> Library does not seem to get initialised properly.
>> Looks like there is rPi specific glue code that is supposed to call
>> bcm_host_init() in
>> qt5base-5.0.0/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
>>
>> But it did not compile that file.
>>
>> buildroot/output/build/qt5base-5.0.0$ find . |grep eglfshooks |grep \\.o
>> ./src/plugins/platforms/eglfs/.obj/release-shared/qeglfshooks_stub.o
> Aah, yes, the platform glue code. That's not easy to handle because the
> way I pass the cross-compiler path and al. is by using a custom
> "-device buildroot", which works by providing our own
> mkspecs/devices/linux-buildroot-g++/qmake.conf and
> mkspecs/devices/linux-buildroot-g++/qplatformdefs.h files. But a few
> platforms have some custom code in mkspecs/devices/linux-<something>/.
> But their qmake.conf often is horrible. For example, the RasberryPi one
> hardcodes path to /opt/vc/ for the OpenGL libraries, but Buildroot
> installs them in /usr/.
>
> Not sure how to handle this problem... The Qt5 way of doing things
> seems really strange to me: it mixes "configuration" (defining where
> the libraries are, what are the compiler flags and so on), with the
> real code (in this case, the glue code for a particular platform).

Well, I never really understood the need for the glue code in the first 
place either.
Would rather have seen that they filled a bug report with the GPU 
vendor, and questioned why one needs to call some vendor specific 
function like bcm_host_init(), instead of just the standardized function 
eglInitialize() before
any EGL/OpenGL ES function works...
And used some runtime detection system for vendor specific extras like 
hardware accelerated mouse cursor.
So that ARM Linux distributions could ship universal Qt packages that 
could work on more then one device.

Anyway, just filling in the location of the glue code in the buildroot 
qmake.conf when the rpi-userland package is selected might be the most 
practical solution.
Will submit a sample patch to illustrate shortly.

-- 
Yours sincerely,

Floris Bos
