From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Thu, 29 Aug 2013 13:35:27 -0700
Subject: [Buildroot] Building pyzmq
Message-ID: <CALoHCLNrOptvEKwsErhHS8go9M-UB=H=9MPGzvXcqpFP4xeMmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am using ZeroMQ and need to build the python bindings for it.
I added a python-pyzmq package for it and am having some compilation
errors. The package is python but has a native extension, so is
compiled. Here is my python-pyzmq.mk:

#############################################################
#
# python-pyzmq
#
#############################################################

PYTHON_PYZMQ_VERSION = 13.1.0
PYTHON_PYZMQ_SOURCE  = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
PYTHON_PYZMQ_SITE    = https://pypi.python.org/packages/source/p/pyzmq

PYTHON_PYZMQ_DEPENDENCIES = python zeromq

define PYTHON_PYZMQ_BUILD_CMDS
        (cd $(@D);                                              \
         CC="$(TARGET_CC)"                                      \
         CFLAGS="$(TARGET_CFLAGS)"                              \
         LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
         CROSS_COMPILING=yes                                    \
         _python_sysroot=$(STAGING_DIR)                         \
         _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
         _python_prefix=/usr                                    \
         _python_exec_prefix=/usr                               \
         $(HOST_DIR)/usr/bin/python setup.py build              \
         --zmq="$(TARGET_DIR)/usr/lib"                          \
        )
endef

define PYTHON_PYZMQ_INSTALL_TARGET_CMDS
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
--prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))



Here is the error I am getting when building, any help would be great.
It seems like it has problems finding sys/un.h, even though I find
this file in target includes directory. I even tried overriding the CC
to include a -I to the includes path, and still get this warning.
Anyway, the Exec format error makes me think it is trying to execute
the target code or something... Or perhaps its a bug with the library
its self with cross compiling?



(cd /home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/build/python-pyzmq-13.1.0;
CC="/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc"
GCC="/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-cpp"
CPP="/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-cpp"
CFLAGS="-mabi=spe -mfloat-gprs=double -Wa,-me500x2 -pipe -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
LDSHARED="/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-shared" CROSS_COMPILING=yes
_python_sysroot=/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/powerpc-unknown-linux-gnuspe/sysroot
_python_srcdir=/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/build/python2.7.3
_python_prefix=/usr _python_exec_prefix=/usr
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/python
setup.py build --zmq="/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib"
)
running configure
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -mabi=spe
-mfloat-gprs=double -Wa,-me500x2 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
-I/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/include
-c build/temp.linux-i686-2.7/scratch/check_sys_un.c -o
build/temp.linux-i686-2.7/scratch/check_sys_un.o
build/temp.linux-i686-2.7/scratch/check_sys_un.c: In function 'main':
build/temp.linux-i686-2.7/scratch/check_sys_un.c:6: warning: format
'%lu' expects type 'long unsigned int', but argument 2 has type
'unsigned int'
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
build/temp.linux-i686-2.7/scratch/check_sys_un.o
-L/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/lib
-Wl,-R/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/lib
-o build/temp.linux-i686-2.7/scratch/check_sys_un
Warning: No sys/un.h, IPC_PATH_MAX_LEN will be undefined: [Errno 8]
Exec format error
************************************************
Configure: Autodetecting ZMQ settings...
    Custom ZMQ dir:
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib
creating build/temp.linux-i686-2.7/scratch/tmp
cc -c /tmp/timer_createqlICaJ.c -o
build/temp.linux-i686-2.7/scratch/tmp/timer_createqlICaJ.o
cc build/temp.linux-i686-2.7/scratch/tmp/timer_createqlICaJ.o -o
build/temp.linux-i686-2.7/scratch/a.out
build/temp.linux-i686-2.7/scratch/tmp/timer_createqlICaJ.o: In function `main':
timer_createqlICaJ.c:(.text+0x7): undefined reference to `timer_create'
collect2: ld returned 1 exit status
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -mabi=spe
-mfloat-gprs=double -Wa,-me500x2 -pipe -Os -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC
-I/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/include
-Izmq/utils -Izmq/core -Izmq/devices -c
build/temp.linux-i686-2.7/scratch/vers.c -o
build/temp.linux-i686-2.7/scratch/vers.o
/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/host/usr/bin/powerpc-none-linux-gnuspe-gcc
build/temp.linux-i686-2.7/scratch/vers.o
-L/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/lib
-Wl,-R/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/target/usr/lib/lib
-lzmq -lrt -o build/temp.linux-i686-2.7/scratch/vers

error: [Errno 8] Exec format error

Fatal: Falling back on bundled libzmq, but setup.cfg has explicitly
prohibited building the libzmq extension.
make[1]: *** [/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08/output/build/python-pyzmq-13.1.0/.stamp_built]
Error 1
make[1]: Leaving directory `/home/eseifert/dev/cyrfs/trunk/buildroot-2012.08'
make: *** [cyrfs] Error 2



Thanks,
Eric Seifert
