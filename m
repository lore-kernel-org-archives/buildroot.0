From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 09 Dec 2014 18:20:09 -0300
Subject: [Buildroot] [PATCH v2] openocd 0.8.0
In-Reply-To: <1417379718-8575-1-git-send-email-claudio.laurita@integrazionetotale.it>
References: <1417379718-8575-1-git-send-email-claudio.laurita@integrazionetotale.it>
Message-ID: <54876789.8090404@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Claudio,

Shouldn't this patch have a proper commit log?

I have a question, see below.

On 11/30/2014 05:35 PM, Claudio Laurita wrote:
[..]
> -# Adapters
> -ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
> -OPENOCD_CONF_OPTS += --enable-ft2232_libftdi
> +ifeq ($(BR2_PACKAGE_LIBFTDI),y)
>  OPENOCD_DEPENDENCIES += libftdi
> +HOST_OPENOCD_DEPENDENCIES += host-libftdi
> +endif
> +

Are you sure it's correct to tie a host dependency
to a target option?

A target symbol such as BR2_PACKAGE_LIBFTDI may not
be even selectable on a given target, so it would
affect the host option.

Also, even if BR2_PACKAGE_LIBFTDI can be selected,
it would mean I'm adding a library that I don't
really need to my target.

On the other side, the commit fails to build here:

(cd /home/zeta/buildroot/ciaa/output/build/host-openocd-0.8.0/ && rm -rf config.cache; PATH="/home/zeta/buildroot/ciaa/output/host/bin:/home/zeta/buildroot/ciaa/output/host/sbin:/home/zeta/buildroot/ciaa/output/host/usr/bin:/home/zeta/buildroot/ciaa/output/host/usr/sbin:/home/zeta/fast/depot_tools:/home/zeta/bin:/home/zeta/fast/depot_tools:/home/zeta/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/home/zeta/buildroot/ciaa/output/host/usr/include" CFLAGS="-O2 -I/home/zeta/buildroot/ciaa/output/host/usr/include" CXXFLAGS="-O2 -I/home/zeta/buildroot/ciaa/output/host/usr/include" LDFLAGS="-L/home/zeta/buildroot/ciaa/output/host/lib -L/home/zeta/buildroot/ciaa/output/host/usr/lib -Wl,-rpath,/home/zeta/buildroot/ciaa/output/host/usr/lib" PKG
 _CONFIG_A
LLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG="/home/zeta/buildroot/ciaa/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/home/zeta/buildroot/ciaa/output/host/usr/lib/pkgconfig:/home/zeta/buildroot/ciaa/output/host/usr/share/pkgconfig" LD_LIBRARY_PATH="/home/zeta/buildroot/ciaa/output/host/usr/lib:" CFLAGS="-O2 -I/home/zeta/buildroot/ciaa/output/host/usr/include" LDFLAGS="-L/home/zeta/buildroot/ciaa/output/host/lib -L/home/zeta/buildroot/ciaa/output/host/usr/lib -Wl,-rpath,/home/zeta/buildroot/ciaa/output/host/usr/lib"  CONFIG_SITE=/dev/null ./configure --prefix="/home/zeta/buildroot/ciaa/output/host/usr" --sysconfdir="/home/zeta/buildroot/ciaa/output/host/etc" --localstatedir="/home/zeta/buildroot/ciaa/output/host/var" --enable-shared --disable-static --disable-gtk-doc --disable-doc --disable-docs --disable-documentation --disable-debug --with-xmlto=no --with-fop=no --disable-dependency-tracking  --enable-ftdi --enable-stlink --
 enable-ti
-icdi --enable-ulink --enable-usb-blaster-2 --enable-jlink --enable-osbdm --enable-opendous --enable-aice --enable-vsllink --enable-usbprog --enable-rlink --enable-armjtagew --enable-cmsis-dap --enable-parport --enable-jtag_vpi --enable-usb_blaster_libftdi --enable-amtjtagaccel --enable-zy1000-master --enable-zy1000 --enable-gw16012 --enable-presto_libftdi --enable-openjtag_ftdi --enable-buspirate --enable-sysfsgpio )
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking for gcc... /usr/bin/gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ISO C89... none needed
checking whether /usr/bin/gcc understands -c and -o together... yes
checking for style of include used by make... GNU
checking dependency style of /usr/bin/gcc... none
checking for /usr/bin/gcc option to accept ISO C99... -std=gnu99
checking for ranlib... /usr/bin/ranlib
checking pkg-config is at least version 0.23... yes
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for fgrep... /usr/bin/grep -F
checking for ld used by /usr/bin/gcc -std=gnu99... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm
checking the name lister (/usr/bin/nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert x86_64-unknown-linux-gnu file names to x86_64-unknown-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for archiver @FILE support... @
checking for strip... strip
checking for ranlib... (cached) /usr/bin/ranlib
checking command to parse /usr/bin/nm output from /usr/bin/gcc -std=gnu99 object... ok
checking for sysroot... no
checking for mt... no
checking if : is a manifest tool... no
checking how to run the C preprocessor... /usr/bin/cpp
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /usr/bin/gcc -std=gnu99 supports -fno-rtti -fno-exceptions... no
checking for /usr/bin/gcc -std=gnu99 option to produce PIC... -fPIC -DPIC
checking if /usr/bin/gcc -std=gnu99 PIC flag -fPIC -DPIC works... yes
checking if /usr/bin/gcc -std=gnu99 static flag -static works... yes
checking if /usr/bin/gcc -std=gnu99 supports -c -o file.o... yes
checking if /usr/bin/gcc -std=gnu99 supports -c -o file.o... (cached) yes
checking whether the /usr/bin/gcc -std=gnu99 linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for an ANSI C-conforming const... yes
checking for unsigned long long int... yes
checking for long long int... yes
checking for library containing ioperm... none required
checking for library containing dlopen... -ldl
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking for arpa/inet.h... yes
checking elf.h usability... yes
checking elf.h presence... yes
checking for elf.h... yes
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking for ifaddrs.h... yes
checking malloc.h usability... yes
checking malloc.h presence... yes
checking for malloc.h... yes
checking netdb.h usability... yes
checking netdb.h presence... yes
checking for netdb.h... yes
checking for netinet/in.h... yes
checking for netinet/tcp.h... yes
checking pthread.h usability... yes
checking pthread.h presence... yes
checking for pthread.h... yes
checking for strings.h... (cached) yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/poll.h usability... yes
checking sys/poll.h presence... yes
checking for sys/poll.h... yes
checking sys/select.h usability... yes
checking sys/select.h presence... yes
checking for sys/select.h... yes
checking for sys/stat.h... (cached) yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for sys/types.h... (cached) yes
checking for unistd.h... (cached) yes
checking for net/if.h... yes
checking whether to enable assertions... yes
checking for stdbool.h that conforms to C99... yes
checking for _Bool... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether byte ordering is bigendian... no
checking for strndup... yes
checking for strnlen... yes
checking for gettimeofday... yes
checking for usleep... yes
checking for vasprintf... yes
checking whether to build a release... yes
checking whether to build Doxygen as HTML... yes
checking whether to build Doxygen as PDF... no
checking whether to enable verbose JTAG I/O messages... no
checking whether to enable verbose USB I/O messages... no
checking whether to enable verbose USB communication messages... no
checking whether to enable malloc free space logging... no
checking whether to enable ZY1000 minidriver... yes
checking whether to enable dummy minidriver... no
checking whether standard drivers can be built... no
configure: WARNING: Using the minidriver disables all other drivers.
checking for LIBFTDI... no
checking for LIBFTDI... yes
checking Build & Link with libftdi...... Success
checking for libftdi highspeed device support... yes
checking for libftdi FT232H device support... no
configure: WARNING: You need a newer libftdi version (0.20 or later).
checking for LIBUSB1... yes
configure: libusb-1.0 header bug workaround: LIBUSB1_CFLAGS changed to "-isystem /home/zeta/buildroot/ciaa/output/host/usr/include/libusb-1.0"
checking for LIBUSB0... yes
checking for HIDAPI... no
checking for HIDAPI... no
checking for HIDAPI... no
configure: error: hidapi is required for the CMSIS-DAP Compliant Debugger
package/pkg-generic.mk:167: recipe for target '/home/zeta/buildroot/ciaa/output/build/host-openocd-0.8.0/.stamp_configured' failed
make: *** [/home/zeta/buildroot/ciaa/output/build/host-openocd-0.8.0/.stamp_configured] Error 1

$ cat defconfig
BR2_arm=y
BR2_arm920t=y
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_USE_MMU is not set
BR2_PACKAGE_OPENOCD=y
BR2_PACKAGE_LIBFTDI=y
BR2_PACKAGE_ZLOG=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_OPENOCD=y

Any chance we bump openocd with a less invasive patch?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
