From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 13:50:41 +0100
Subject: [Buildroot] Package link issue with Buildroot 2017.02
In-Reply-To: <884FE859A7028649AB59C40AF813419C0A78DE2900@THSONEA01CMS10P.one.grp>
References: <884FE859A7028649AB59C40AF813419C0A78DE2900@THSONEA01CMS10P.one.grp>
Message-ID: <20171122135041.0dd02c44@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 12:08:35 +0100, FOURES Philippe wrote:

> cc LinuxMain.o DriverFuncs.o Config.o ../FtdiAccess.o ../FtdiMilan.o  -lrt -lftdi -lstdc++ -L"/home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib" -o AESCDriver

You're building with the host compiler ("cc") but linking with a target
library. This cannot work.

> Ajout du processus fils 0xc28150 (AESCDriver) PID 6073 ? la cha?ne.
> Processus fils actif 0xc28150 (AESCDriver) PID 6073
> /usr/bin/ld : escamotage incompatible /home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib/libftdi.so lors de la recherche de -lftdi
> /usr/bin/ld : ne peut trouver -lftdi

Please use LANG=C when building so that error messages end up being in
english rather than french.

> Attached to the mai,l the makefile
> 
> 
> Note: this package compilation is working fine with buildroot 2016.02

What is the Buildroot .mk file for this package ? I think it forgets to
pass CC=$(TARGET_CC).

In your Makefile, the lines:

CXXFLAGS		+= -I"/home/largo/BR17LTS/buildroot-2017.02.7/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include"

and

LIBS			+= -L"/home/largo/BR17LTS/buildroot-2017.02.7/output/target/usr/lib"

are wrong. 1/ They are not needed and 2/ They make your package use an
absolute path, which is horrible, because nobody else but you will be
able to build this package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
