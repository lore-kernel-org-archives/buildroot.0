From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2020 23:33:38 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-iy1AF4SsNu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

--- Comment #3 from laurent at neko-labs.eu ---
Hi yann,

> make V=1:
if grep -q "CONFIG_MODULES=y"
/home/buildroot/output/build/linux-linux4sam_6.2/.config; then
/home/buildroot/output/host/sbin/depmod -a -b /home/buildroot/output/target
`/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`; fi
depmod: ERROR: Bad version passed make[1]:
make: *** [Makefile:747: target-finalize] Error 1
make : on quitte le r?pertoire ? /home/buildroot ?
make : on entre dans le r?pertoire ? /home/buildroot ?

> Adding printf 'probed linux version:"%s"\n'
>
># Run depmod in a target-finalize hook, to encompass modules installed by
># packages.
>define LINUX_RUN_DEPMOD
>        printf 'probed linux version:"%s"\n' "$(LINUX_VERSION_PROBED)"
>        if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
>                $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) >$(LINUX_VERSION_PROBED); \
>        fi
>endef
>LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

printf 'probed linux version:"%s"\n' "`/usr/bin/make 
HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`"
probed linux version:"make[1]: Entering directory '/home/buildroot'
4.19.78-linux4sam-6.2
make[1]: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'"
if grep -q "CONFIG_MODULES=y"
/home/buildroot/output/build/linux-linux4sam_6.2/.config; then
/home/buildroot/output/host/sbin/depmod -a -b /home/buildroot/output/target
`/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`; fi
depmod: ERROR: Bad version passed make[1]:
make: *** [Makefile:747: target-finalize] Error 1
make?: on quitte le r?pertoire ??/home/buildroot??
make?: on entre dans le r?pertoire ??/home/buildroot??

>Removing ccache usage
printf 'probed linux version:"%s"\n' "`/usr/bin/make  HOSTCC="/usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`"
probed linux version:"make[1]: Entering directory '/home/buildroot'
4.19.78-linux4sam-6.2
make[1]: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'"
if grep -q "CONFIG_MODULES=y"
/home/buildroot/output/build/linux-linux4sam_6.2/.config; then
/home/buildroot/output/host/sbin/depmod -a -b /home/buildroot/output/target
`/usr/bin/make  HOSTCC="/usr/bin/gcc -O2 -I/home/buildroot/output/host/include
-L/home/buildroot/output/host/lib -Wl,-rpath,/home/buildroot/output/host/lib"
ARCH=arm INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`; fi
depmod: ERROR: Bad version passed make[1]:
make: *** [Makefile:747: target-finalize] Error 1


For the empty line, I added it to empathize the result, it was not there, you
are right.

Laurent

-- 
You are receiving this mail because:
You are on the CC list for the bug.
