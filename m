From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Apr 2014 23:41:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-07
In-Reply-To: <CAMo8BfLKSdQnr2+a-WDCj9zJAPgXyitcM42fMDYhvDkzPfeR2Q@mail.gmail.com>
References: <20140408063009.EA284100CF4@stock.ovh.net>
 <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
 <20140408234145.4ed87c17@skate>
 <CAMo8BfLKSdQnr2+a-WDCj9zJAPgXyitcM42fMDYhvDkzPfeR2Q@mail.gmail.com>
Message-ID: <20140410234114.6c1c72cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Wed, 9 Apr 2014 01:51:08 +0400, Max Filippov wrote:

> >> >     xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/959b77fa2c1f13b1958b234803437e09734e882e/
> >>
> >> Couldn't reproduce. But I had to disable BR2_PACKAGE_HOST_SAM_BA,
> >> otherwise it refused to build with the following message:
> >>
> >> Your Buildroot configuration uses pre-built tools for the x86 architecture,
> >> but your build machine uses the x86-64 architecture without the 32
> >> bits compatibility library.
> >
> > I think we can safely assume that the problem is not due to
> > BR2_PACKAGE_HOST_SAM_BA. I'll try to reproduce the same build failure
> > on the autobuilder, and gather the config.log file of php. I'll let you
> > know.
> 
> The tail of the failing build log:
> 
> ...
> checking for MySQL support... yes
> checking for specified location of the MySQL UNIX socket... no
> checking for mysql_close in -lmysqlclient... no
> checking for mysql_error in -lmysqlclient... no
> configure: error: mysql configure failed. Please check config.log for
> more information.
> make: *** [/home/test/test/2/output/build/php-5.5.11/.stamp_configured] Error 1

Ok, I reproduced the problem. The config.log of php contains the
following problem:

configure:58794: result: no
configure:59004: checking for mysql_error in -lmysqlclient
configure:59029: /home/test/outputs/959b77fa2c1f13b1958b234803437e09734e882e/output/host/usr/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -I/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURC
E -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals -pipe -Os  -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/home/test/outputs/959b77fa2c1f13b1
958b234803437e09734e882e/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/mysql -L/home/test/outputs/959b77fa2c1f13b1958b234803437e09734e882e/output/host/usr/xtensa-buildroot-linux-
uclibc/sysroot/usr/lib -L/lib  -L/home/test/outputs/959b77fa2c1f13b1958b234803437e09734e882e/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib -L/home/test/outputs/959b77fa2c1f13b195
8b234803437e09734e882e/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr conftest.c -lmysqlclient  -lz -lintl -lcrypto -lssl -lcrypto -lcurl -lz -lcrypto -lssl -lcrypto -lm  -lxml2 -lz -
lm -ldl -lcurl >&5
/lib/libgcc_s.so.1: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

The problem is due to the compilation command line containing -L/lib,
which is wrong when cross-compiling.

See also
https://gist.github.com/anonymous/10425853#file-gistfile1-txt-L8083 for
the full config.log file. I'm keeping the build output directory
around, in case additional informations are needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
