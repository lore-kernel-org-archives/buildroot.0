From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 Feb 2016 16:19:06 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160222150539.0301105e@free-electrons.com>
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
Message-ID: <56D1BE6A.80305@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 22/02/2016 15:05, Thomas Petazzoni a ?crit :
> Hello,
> 

[snip]

>>         sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/918d72bd9684a39dc688b143b682f8b5f49f1b26/
> 
> r_fps.c:296:1: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <https://support.codesourcery.com/GNUToolchain/> for instructions.
> 
> Gaah. A bit of investigation needed, maybe we should simply disable
> prboom with this toolchain.

Prboom add unconditionally -O2 in CFLAGS and triggers a segfault with this
toolchain.

See -0s and -O2 in this command line:
/home/autobuild/instance-0/output/host/usr/bin/sh-linux-gnu-gcc -DHAVE_CONFIG_H
-I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -Wall
-Wno-unused -Wno-switch -Wextra -Wno-missing-field-initializers -Winline
-Wwrite-strings -Wundef -Wbad-function-cast -Wcast-align -Wcast-qual
-Wdeclaration-after-statement -ffast-math -O2 -fomit-frame-pointer -I../src
-I/home/autobuild/instance-0/output/host/usr/sh4a-buildroot-linux-gnu/sysroot/usr/include/SDL
-D_GNU_SOURCE=1 -D_REENTRANT -c r_filter.c

-O2 is added from CFLAGS_OPT in configure.ac, so we need to remove it and
autoreconf prboom to avoid this issue.
But if we use BR2_OPTIMIZE_2 we still have the compiler bug... So it's more a
toolchain issue...

I'm ok to disable prboom with this toolchain.

> 
>>         bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/884bd0fef2f88154da949fa3f4cc04368575183a/
>>         bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/34f8754e2ddb243aaa73af196622449f655c5213/
> 
> Weird:
> 
> /home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:330: error: expected `;' before 'i'
> /home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:331: error: expected `;' before 'e'
> /home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:333: error: 'i' was not declared in this scope
> /home/peko/autobuild/instance-1/output/build/qhull-7.2.0/src/libqhullcpp/QhullSet.h:333: error: 'e' was not declared in this scope
> 

qhull needs gcc >= 4.4:

http://patchwork.ozlabs.org/patch/589375/

Best regards,
Romain
