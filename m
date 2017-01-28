From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jan 2017 19:25:31 +0100
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
References: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
 <871sw7asxn.fsf@dell.be.48ers.dk> <87lgu24xdi.fsf@dell.be.48ers.dk>
Message-ID: <r94vldxsb4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 22 Jan 2017 22:07:21 +0100 schrieb Peter Korsgaard:

> This seems to cause a number of build issues. Care to take a look?
> 
> http://autobuild.buildroot.net/?reason=ruby-2.4.0

Hi,

apparantly configure has problems detecting math functions of uClibc:

http://autobuild.buildroot.net/
results/2aa/2aa668247b6925ff1290182a67092156b5bcc1b2//build-end.log

checking for finite... no
[...]
checking for isinf... no
checking for isnan... no

http://autobuild.buildroot.net/
results/2aa/2aa668247b6925ff1290182a67092156b5bcc1b2//ruby-2.4.0/
config.log

configure:20069: checking for finite
configure:20069: /home/test/autobuild/run/instance-1/output/host/usr/bin/
m68k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
D_FILE_OFFSET_BITS=64  conftest.c -lgmp -ldl -lcrypt -lm  >&5
conftest.c:238:6: warning: conflicting types for built-in function 
'finite'
 char finite ();
      ^
/tmp/ccip45ij.o: In function `main':
conftest.c:(.text.startup+0x6): undefined reference to `finite'
collect2: error: ld returned 1 exit status

although uClibc supports these functions.

Hacking ruby.mk like this

RUBY_CONF_ENV += \
       ac_cv_func_finite=yes \
       ac_cv_func_isinf=yes \
       ac_cv_func_isnan=yes
endif

fixes the build:

checking for finite... (cached) yes
[...]
checking for isinf... (cached) yes
checking for isnan... (cached) yes

Shall I send a patch with this hack?

Regards, Bernd
