From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 23:27:08 +0200
Subject: [Buildroot] [PATCH v2 5/9] package/librtlsdr: fix static link
In-Reply-To: <1409514922-9509-6-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:18 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-6-git-send-email-s.martin49@gmail.com>
Message-ID: <87egvwmjtf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This patch adds 2 patches to librtlsdr fixing static linking.
 > The first one makes sure the libusb CMake module will find all the
 > dependencies, so the ldflags will be correct, even for static link.

 > The second patch disable the shared object build when it
 > BUILD_SHARED_LIBS is off.

 > Fixes:
 >   http://autobuild.buildroot.org/results/2d9/2d91d7fa10ac3bd22fb5ce72acd7a0ce177f054f/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Hmm, something goes wrong here:

>>> librtlsdr v0.5.3 Configuring
(cd /home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/ && rm -f CMakeCache.txt && PATH="/home/peko/source/buildroot/output/host/bin:/home/peko/source/buildroot/output/host/sbin:/home/peko/source/buildroot/output/host/usr/bin:/home/peko/source/buildroot/output/host/usr/sbin:/home/peko/bin:/home/peko/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /home/peko/source/buildroot/output/host/usr/bin/cmake /home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/ -DCMAKE_TOOLCHAIN_FILE="/home/peko/source/buildroot/output/host/usr/share/buildroot/toolchainfile.cmake" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DUSE_CCACHE=OFF -DDETACH_KERNEL_DRIVER=1 )
Re-run cmake no build system arguments
-- The C compiler identification is GNU 4.7.3
-- Check for working C compiler: /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc
-- Check for working C compiler: /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Extracting version information from git describe...
-- Found PkgConfig: /home/peko/source/buildroot/output/host/usr/bin/pkg-config (found version "0.27") 
-- checking for module 'libusb-1.0'
--   found libusb-1.0, version 1.0.19
-- Looking for libusb_handle_events_timeout_completed
-- Looking for libusb_handle_events_timeout_completed - not found
-- Looking for libusb_error_name
-- Looking for libusb_error_name - not found
-- Found libusb-1.0: /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libusb-1.0, /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libusb-1.0.a;/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libusb-1.0.a
-- Looking for include file pthread.h
-- Looking for include file pthread.h - found
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found
-- Check if compiler accepts -pthread
CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
   THREADS_PTHREAD_ARG (advanced)
For details see /home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/TryRunResults.cmake
-- Check if compiler accepts -pthread - no
-- Found Threads: TRUE  
-- Udev rules not being installed, install them with -DINSTALL_UDEV_RULES=ON
-- Building with kernel driver detaching enabled
-- Building for version: 0.5.3 / 0.5.3
-- Using install prefix: /usr
-- Configuring incomplete, errors occurred!
See also "/home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeOutput.log".
See also "/home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/CMakeFiles/CMakeError.log".
package/pkg-generic.mk:167: recipe for target '/home/peko/source/buildroot/output/build/librtlsdr-v0.5.3/.stamp_configured' failed

That didn't used to happen.

Any ideas?

-- 
Bye, Peter Korsgaard
