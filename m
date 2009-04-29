From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Wed, 29 Apr 2009 15:04:00 +0300
Subject: [Buildroot] quick way of doing make atngw100-expanded_defconfig
In-Reply-To: <87vdovmp09.fsf@macbook.be.48ers.dk>
References: <49F073C3.7050104@promwad.com> <87vdovmp09.fsf@macbook.be.48ers.dk>
Message-ID: <49F84230.9090600@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ivan" == Ivan Kuten <ivan.kuten@promwad.com> writes:
> 
>  Ivan> Hello,
>  Ivan> It there is a quick way of doing atngw100-expanded_defconfig?
>  Ivan> I'm trying this way but getting error (svn trunk):
> 
>  Ivan> make atngw100-expanded_defconfig
>  Ivan> cp ./target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig .config
>  Ivan> make[1]: Entering directory `/home/users/Ivan/buildroot'
>  Ivan> package/dbus-glib/Config.in:2:error: found recursive dependency: BR2_PACKAGE_DBUS_GLIB -> BR2_PACKAGE_EXPAT -> BR2_PACKAGE_DBUS -> BR2_PACKAGE_DBUS_PYTHON -> BR2_PACKAGE_DBUS_GLIB
> 
> Crap, this is Kconfig playing tricks with us again. Revert r26192 and
> you'll be fine.
> 

Updated to svn r26238, applying patch failed (make atngw100-expanded_defconfig):


*** Unpacking kernel source
bzcat /home/users/Ivan/buildroot/dl/linux-2.6.24.tar.bz2 | tar -C /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded   -xf -

touch /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24/.unpacked
toolchain/patch-kernel.sh /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24 toolchain/kernel-headers \
                linux-2.6.24-\*.patch{,.gz,.bz2}
toolchain/patch-kernel.sh /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24 target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2 \

                linux-2.6.24\*.patch{,.gz,.bz2}
touch /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24/.patched
if [ -d target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2 ] ; then \
        toolchain/patch-kernel.sh /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24 target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2 \
                linux-\*.patch{,.gz,.bz2} ; \
        fi
touch /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24/.patched.arch
if [ -d target/device/Atmel/atngw100-expanded/kernel-patches/ ] ; then \
        toolchain/patch-kernel.sh /home/users/Ivan/buildroot/project_build_avr32/atngw100-expanded/linux-2.6.24 target/device/Atmel/atngw100-expanded/kernel-patches/ \
                linux-2.6.24\*.patch{,.gz,.bz2} ; \
        fi

Applying linux-2.6.24.4-100-atngw100-add-ac97.patch using plaintext:
patching file arch/avr32/boards/atngw100/setup.c
Hunk #1 succeeded at 158 with fuzz 2 (offset -8 lines).

Applying linux-2.6.24.4-200-atngw100-video.patch using plaintext:
patching file arch/avr32/boards/atngw100/setup.c
Hunk #3 succeeded at 204 with fuzz 1 (offset -7 lines).
can't find file to patch at input line 96
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -Nrup linux-2.6.24/arch/avr32/mach-at32ap/at32ap700x.c linux-2.6.24-patched/arch/avr32/mach-at32ap/at32ap700x.c
|--- a/arch/avr32/mach-at32ap/at32ap700x.c      2008-01-31 10:47:55.000000000 -0500
|+++ b/arch/avr32/mach-at32ap/at32ap700x.c      2008-01-31 10:29:22.000000000 -0500
--------------------------
File to patch: Patch failed!  Please fix linux-2.6.24.4-200-atngw100-video.patch!
