From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Fri, 7 Sep 2018 09:47:48 +0200
Subject: [Buildroot] Qtwebengine application crash with eglfs platform (ARM
 IMX6Q)
Message-ID: <20180907074747.wn4piozafa7n5ude@amesys-lha-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Qtwebengine app stops during startup with the message: "EGL_EXT_device_base missing".

I want to make a QT webengine application with a FB (without using X11 and wayland)
But when running the application with "--platform eglfs",
the app stop with the message: "EGL_EXT_device_base missing".
I have the same error with the QML example.

I am currently working on a custom board IMX6Q (ARMv7 Processor rev 10 (v7l)).

Buildroot branch: 2018.02.x
Kernel repository: https://github.com/boundarydevices/linux-imx6/tree/boundary-imx_4.9.x_1.0.0_ga
Kernel branch: boundary-imx_4.9.x_1.0.0_ga
       Linux LMN6 4.9.88 #1 SMP PREEMPT Tue Sep 4 17:39:14 CEST 2018 armv7l GNU/Linux

Software :
QT: 5.6.3
kernel-module-imx-gpu-viv-3b9e057f29853fd29364aa666328a92b807007d7
imx-codec-4.2.1
imx-gpu-g2d-6.2.2.p0
imx-gpu-viv-6.2.2.p0-aarch32
imx-lib-rel_imx_4.9.x_1.0.0_ga
imx-vpu-5.4.37

Buildroot configuration:
I have enable BR2_PACKAGE_QT5WEBENGINE and BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB

# lsmod
Module                  Size  Used by
galcore               348160  0

#  ls -l /usr/lib/libEGL*
-rwxr-xr-x    1 root     root        728136 Aug  9 03:52 /usr/lib/libEGL-fb.so
lrwxrwxrwx    1 root     root            12 Sep  6  2018 /usr/lib/libEGL.so -> libEGL-fb.so
lrwxrwxrwx    1 root     root            12 Sep  6  2018 /usr/lib/libEGL.so.1 -> libEGL-fb.so
lrwxrwxrwx    1 root     root            12 Sep  6  2018 /usr/lib/libEGL.so.1.0 -> libEGL-fb.so


I tried to find the error with gdb :

--- GDB where ----
Program received signal SIGABRT, Aborted.
__libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:47
(gdb) where
#0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:47
#1  0x7396f192 in __libc_signal_restore_set (set=0x7efff8c0) at ../sysdeps/unix/sysv/linux/nptl-signals.h:79
#2  __GI_raise (sig=sig at entry=6) at ../sysdeps/unix/sysv/linux/raise.c:48
#3  0x7396fe1a in __GI_abort () at abort.c:89
#4  0x73e15380 in QMessageLogger::fatal(char const*, ...) const () from target:/lib/libQt5Core.so.5
#5  0x6ecca828 in QEglFSKmsEglDeviceIntegration::query_egl_device() () from target:/usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-kms-egldevice-integration.so
#6  0x6ecca87c in QEglFSKmsEglDeviceIntegration::platformInit() () from target:/usr/lib/qt/plugins/egldeviceintegrations/libqeglfs-kms-egldevice-integration.so
#7  0x6f03a46c in QEglFSIntegration::initialize() () from target:/lib/libQt5EglDeviceIntegration.so.5
#8  0x747f1d50 in QGuiApplicationPrivate::eventDispatcherReady() () from target:/lib/libQt5Gui.so.5
#9  0x73ffcd18 in QCoreApplicationPrivate::init() () from target:/lib/libQt5Core.so.5
#10 0x747f3318 in QGuiApplicationPrivate::init() () from target:/lib/libQt5Gui.so.5
#11 0x747f414c in QGuiApplication::QGuiApplication(int&, char**, int) () from target:/lib/libQt5Gui.so.5
#12 0x00010c90 in main ()
----------------

I think the problem comes from the result of the line:
qt5base-5.6.3/src/platformsupport/eglconvenience/qeglstreamconvenience.cpp:51:    const char *extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);


Regards,
Laurent
