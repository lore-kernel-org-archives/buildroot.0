From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 12 Aug 2010 17:48:52 +0100
Subject: [Buildroot] make source: missing dir and incorrect dependency with
 external toolchain
Message-ID: <1281631732.14333.88.camel@cabbage.rehill.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
having done "make distclean", followed by "make ..._defconfig", I did
"make source".  The toolchain is external, ARM glibc (gcc 4.4.1).  Host
gcc is 4.4.4.

The first problem is that $(DL_DIR) does not get created so there is a
failure when it is needed.

Secondly when I do "mkdir dl" and "make source" again I get an error
when an attempt is made to download gcc because GCC_VERSION is empty (it
should not be downloading this at all since the toolchain is external):

        test -e /home/qvr/obair/buildroot.org/dl/gcc-.tar.bz2 || for site in  "http://ftp.gnu.org/pub/gnu"/gcc/gcc- http://sources.buildroot.net/; do wget --passive-ftp -nd   -P /home/qvr/obair/buildroot.org/dl $site/gcc-.tar.bz2 && exit; done
        --2010-08-12 17:14:20--  http://ftp.gnu.org/pub/gnu/gcc/gcc-/gcc-.tar.bz2
        Resolving ftp.gnu.org... 140.186.70.20
        Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
        HTTP request sent, awaiting response... 404 Not Found
        2010-08-12 17:14:20 ERROR 404: Not Found.
        
        --2010-08-12 17:14:20--  http://sources.buildroot.net//gcc-.tar.bz2
        Resolving sources.buildroot.net... 88.198.64.109
        Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
        HTTP request sent, awaiting response... 404 Not Found
        2010-08-12 17:14:20 ERROR 404: Not Found.
        
        make: *** [/home/qvr/obair/buildroot.org/dl/gcc-.tar.bz2] Error 1
        
I'm not certain which target it's actually processing that pulls in gcc
but whatever it is, it succeeds in downloading gmp and mpfr archives
before attempting gcc.  The next package to be processed in the plain
"make" case is host-module-init-tools, followed by host-automake,
host-autoconf and host-m4.

The attempted gcc download does not occur when a straight "make" is
executed so I presume that something is dependent on the toolchain being
copied over in the early stages.

Any ideas?
