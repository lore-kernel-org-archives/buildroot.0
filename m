From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Dec 2012 13:47:03 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121212120341.69a89e93@skate>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
 <20121212120341.69a89e93@skate>
Message-ID: <20121212134703.7461d9c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Wed, 12 Dec 2012 12:03:41 +0100, Thomas Petazzoni wrote:

> Thing that remains not understood is what change between 4.5 and 4.6
> broke this.

Apparently, what changed is that the gcc/configure.ac has gained a
AC_SYS_LARGEFILE check:

$ grep LARGEFILE toolchain/gcc-4.6.3/gcc/configure.ac 
AC_SYS_LARGEFILE
$ grep LARGEFILE toolchain/gcc-4.5.4/gcc/configure.ac 
$

On gcc >= 4.6, this means that a #define _FILE_OFFSET_BITS 64 is added
to auto-host.h, which breaks the build of crtstuff.c for the target as
uClibc headers warn that _FILE_OFFSET_BITS is set to 64 even though
largefile support is not enabled.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
