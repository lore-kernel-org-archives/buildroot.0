From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 22:51:09 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
In-Reply-To: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
 (George Redivo's message of "Mon, 22 Jun 2015 14:58:59 -0300")
References: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
Message-ID: <87wpyv8o1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "George" == George Redivo <george.redivo@datacom.ind.br> writes:

 > * Adds powerpc architecture support
 > Signed-off-by: George Redivo <george.redivo@datacom.ind.br>

I was about to commit this after also updating the architecture
dependency of ola (which selects protobuf), but then I did a test build
on powerpc (603e, default external toolchain) which failed:

libtool: compile:  /home/peko/source/buildroot/output/host/usr/bin/powerpc-linux-gnu-g++ -DHAVE_CONFIG_H -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pthread -Wall -Wwrite-strings -Woverloaded-virtual -Wno-sign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c google/protobuf/stubs/atomicops_internals_x86_gcc.cc  -fPIC -DPIC -o google/protobuf/stubs/.libs/atomicops_internals_x86_gcc.o
In file included from google/protobuf/stubs/atomicops_internals_x86_msvc.cc:37:0:
./google/protobuf/stubs/atomicops.h:209:1: error: stray '#' in program
In file included from ./google/protobuf/stubs/once.h:81:0,
                 from google/protobuf/stubs/common.cc:34:
./google/protobuf/stubs/atomicops.h:209:1: error: stray '#' in program
In file included from ./google/protobuf/stubs/once.h:81:0,
                 from google/protobuf/stubs/once.cc:38:
./google/protobuf/stubs/atomicops.h:209:1: error: stray '#' in program
In file included from google/protobuf/stubs/atomicops_internals_x86_gcc.cc:36:0:
./google/protobuf/stubs/atomicops.h:209:1: error: stray '#' in program
./google/protobuf/stubs/atomicops.h:209:1: error: 'error' does not name a type
Makefile:2067: recipe for target 'google/protobuf/stubs/atomicops_internals_x86_msvc.lo' failed

[snip]

package/pkg-generic.mk:156: recipe for target '/home/peko/source/buildroot/output/build/protobuf-v2.6.1/.stamp_built' failed

So something seems wrong here. The 'x86' in the file name also looks
suspicious.

If you want to reproduce, the defconfig is simply:

BR2_powerpc=y
BR2_powerpc_603e=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OLA=y

(put in .config and run make olddefconfig; make)

Care to investigate & fix and send an updated patch? Thanks.

-- 
Bye, Peter Korsgaard
