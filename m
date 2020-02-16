From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 22:28:27 +0100
Subject: [Buildroot] [PATCH v4 4/9] configs/qemu{x86,
 x86_64}: add a serial console
In-Reply-To: <20200209180327.455426-5-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 9 Feb 2020 19:03:22 +0100")
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-5-romain.naour@smile.fr>
Message-ID: <87zhdicjd0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The current Buildroot defconfigs for qemu_x86 and qemu_x86_64
 > instantiate a console on tty1, which appears on QEMU's
 > graphical window. Add a console on the serial port (ttyS0) to
 > be used later for gitlab testing.

 > This change is need since the script used for gitlab testing
 > needs to use a serial output with pexpect.

 > This change is similar to the one made for raspberrypi [1] to
 > handle HDMI and serial console:

 > This requires three changes:
 >  1. have two 'console=' entries in the kernel command line: tty1,
 >     then ttyS0;
 >  2. change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts
 >     a getty on the last console= passed to the kernel, ttyS0;
 >  3. add a new getty on tty1 to the generated inittab.

 > Step 2 is actually obtained by removing BR2_TARGET_GENERIC_GETTY_PORT
 > entirely from the defconfigs, since "console" is the default value.

 > Step 3 requires a post-build script since the Buildroot makefiles can
 > configure only one console.

 > Note: instead of simply adding a new getty on ttyS0 (which would
 > work) this patch actually changes BR2_TARGET_GENERIC_GETTY_PORT to
 > instantiate a console on UART, then adds back tty1 via
 > post-build.sh. This is done only to avoid the "GENERIC_SERIAL" comment
 > where we instantiate a console on QEMU graphical window, then
 > instantiate a really-serial console on another line.

 > The result is these two inittab lines:

 >   console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
 >   tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window

 > [1] 20878a1017e2bf7eb8c5f870dc6d2641493cb0f9

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
