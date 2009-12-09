From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Wed, 9 Dec 2009 08:39:20 +0100
Subject: [Buildroot] ARM OABI/EABI problem
Message-ID: <OF3B98716C.764E06F3-ONC1257686.0021143A-C1257687.002A0DD7@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Please explain me, how to build complete OABI 'style' sytem to ARM 
(RM9200) target.

I try to compile a minimal Linux 2.6.27 with Busybox 1.15 system.
I must OABI, because I need Floating Point Emulator, but it depends on 
!AEABI || OABI_COMPAT

So, every config file I change from EABI to OABI, and the first make is 
done, the target can boot and start /fs.
But, when I try to customise uClibc (or only touch uClibc config file), I 
get the following error message:
/srv/buildroot-2009.11/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.2/libgcc.a(_divdi3.o):(.ARM.exidx+0x0): 
undefined reference to `__aeabi_unwind_cpp_pr0'
(complete log below)

As you see (on Build option section) I leave BR2_GNU_TARGET_SUFFIX on the 
default "linux-uclibcgnueabi"
When I change it to "linux-uclibc", I get the following error: 

warning: working around missing syslimits.h
cp: stat 
?/srv/buildroot/output/staging/lib/gcc-lib/arm-linux-uclibc/4.4.2/include/syslimits.h? 
sikertelen: Nincs ilyen f?jl vagy k?nyvt?r  <-- No such file or directory
make: *** [/srv/buildroot/output/target/usr/bin/gcc] Error 1


Build environment:
Ubuntu 9.10 x64 (Hungarian)
bash, not dash
make as root
Buildroot 2009.11
2nd error message on BR daily snapshot (091205)



Peter


# make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.4.1':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.4.1':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
patch installed:                                Ok
Build system dependencies:                      Ok

rm -rf /srv/buildroot-2009.11/output/build/buildroot-config
mkdir -p /srv/buildroot-2009.11/output/build
cp -dpRf package/config/buildroot-config 
/srv/buildroot-2009.11/output/build/buildroot-config
/usr/bin/make -j1 -C 
/srv/buildroot-2009.11/output/toolchain/uClibc-0.9.30.1 \
                ARCH="arm" \
                PREFIX=/srv/buildroot-2009.11/output/staging \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/ \
                install_runtime install_dev
make[1]: Entering directory 
`/srv/buildroot-2009.11/output/toolchain/uClibc-0.9.30.1'
  LD libuClibc-0.9.30.1.so
/srv/buildroot-2009.11/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.2/libgcc.a(_divdi3.o):(.ARM.exidx+0x0): 
undefined reference to `__aeabi_unwind_cpp_pr0'
collect2: ld returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: Leaving directory 
`/srv/buildroot-2009.11/output/toolchain/uClibc-0.9.30.1'
make: *** [/srv/buildroot-2009.11/output/staging/usr/lib/libc.a] Error 2



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091209/3e3f9bfb/attachment-0001.htm>
