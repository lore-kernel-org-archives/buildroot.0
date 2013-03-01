From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 01 Mar 2013 23:12:13 +0100
Subject: [Buildroot] [PATCH] qt5: add rPi EGL glue code
In-Reply-To: <20130301175726.1bf80e2e@skate>
References: <1362156380-27083-1-git-send-email-bos@je-eigen-domein.nl>
 <20130301175726.1bf80e2e@skate>
Message-ID: <513127BD.5070209@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 03/01/2013 05:57 PM, Thomas Petazzoni wrote:
> On Fri,  1 Mar 2013 17:46:20 +0100, Floris Bos wrote:
>> When the rpi-userland package is selected, assume we are targetting the Raspberry Pi, and add the right
>> platform glue code when building the Qt5 EGLFS plugin.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> Sounds great. Could you wrap your commit log to ~80 columns? I'd like
> to apply your patch as-is in my patch series in order to preserve your
> authorship.

Will do

>> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
>> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux
> Are you sure this is needed? I've added the installation of some .pc
> files in the rpi-userland package. At least the first header path is
> part of the .pc file for libEGL.
>
> ++Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/
>
> We can of course add the second one as well, as long as we understand
> if it's needed for OpenGL or EGL.

Oops, you are right.
The first line is indeed redundant.

Second line is for the bcm_host stuff, otherwise you get:

==
In file included from 
/hdd/max/dev/qtbuildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bcm_host.h:50:0,
                  from 
../../../../mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp:50:
/hdd/max/dev/qtbuildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/interface/vmcs_host/vcgencmd.h:33:27: 
fatal error: vchost_config.h: No such file or directory
compilation terminated.
make[5]: *** [.obj/release-shared/qeglfshooks_pi.o] Error 1
make[5]: *** Waiting for unfinished jobs....
==

Every application that wants to use the rPi GPU libraries needs it to 
call bcm_host_initialize() before anything else.
So I think it could indeed be added to the EGL pkgconfig file.

Regarding fonts:

 >If so, then I can include a path that makes fonts.path be
 >$$[QT_INSTALL_PREFIX]/share/fonts/.

Came accross another problem with that.
With font-config disabled it only searches /usr/lib/fonts itself for 
fonts, not subdirectories.
So if we were to change the default font path to /usr/share/fonts, it 
still would not pick up fonts in subdirectories like 
/usr/share/fonts/liberation
So might not be much use of that.

Also found out that if I do enable font-config it fails to compile:

==
.obj/release-shared/qeglfsintegration.o: In function 
`QEglFSIntegration::QEglFSIntegration()':
qeglfsintegration.cpp:(.text+0x8e4): undefined reference to `vtable for 
QFontconfigDatabase'
collect2: ld returned 1 exit status
==

Haven't looked further into that.


Did find out that with font-config disabled, Qt does install the bundled 
standard fonts into staging.
So think we should just copy those to target.


Another issue I'm still having -but which is likely an upstream problem- 
is that with the EGLFS plugin when you type on the keyboard all input 
will be send to both to the Qt application and the terminal.
Once the Qt application terminates, everything you typed earlier is 
visible on the console.

 From a quick look it seems the Qt code does request exclusive usage of 
the evdev device for tablets and touch input devices, but not for keyboards.

==
buildroot/output/build/qt5base-5.0.0/src/platformsupport/input$ grep -R 
EVIOCGRAB *
evdevtablet/qevdevtablet.cpp:    bool grabSuccess = !ioctl(fd, 
EVIOCGRAB, (void *) 1);
evdevtablet/qevdevtablet.cpp:        ioctl(fd, EVIOCGRAB, (void *) 0);
evdevtouch/qevdevtouch.cpp:    bool grabSuccess = !ioctl(m_fd, 
EVIOCGRAB, (void *) 1);
evdevtouch/qevdevtouch.cpp:        ioctl(m_fd, EVIOCGRAB, (void *) 0);
==

Anyone know if they have a reason for that?


Yours sincerely,

Floris Bos
