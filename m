From: Willy <willy@willygroup.org>
Date: Mon, 23 Jan 2012 14:43:06 +0000 (UTC)
Subject: [Buildroot] Add rt squarewave example in buildroot
Message-ID: <loom.20120123T152253-656@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I've compiled and configured the 3.0.14 kernel with rt patch? 
in buildroot 11-2011.
I'm trying to build the rt example "squarewave"? in buildroot.
When I launch "make" I obtain the following error:
buildrootfolder/output/host/usr/bin/i586-unknown-linux-uclibc-gcc -c \
    rtpatchonoff.c 
buildrootfolder/output/host/usr/bin/i586-unknown-linux-uclibc-gcc \
    rtpatchonoff.o
-o rtpatchonoff -lrt -Wall
rtpatchonoff.o: In function `main':
rtpatchonoff.c:(.text+0x176): undefined reference to `clock_nanosleep'
collect2: ld returned 1 exit status
make[1]: *** [rtpatchonoff] Errore 1
...

The makefile included in the package rtpatchonoff is:
[makefile]
all: rtpatchonoff -lrt

rtpatchonoff: rtpatchonoff.o -lrt
	$(CC) rtpatchonoff.o -o rtpatchonoff -lrt -Wall

rtpatchonoff.o: rtpatchonoff.c
	$(CC) -c rtpatchonoff.c 

clean:
	rm -f rtpatchonoff
[/makefile]

The .mk file is:
[mk]
RTPATCHONOFF_VERSION = 1.0
RTPATCHONOFF_SOURCE = rtpatchonoff-$(RTPATCHONOFF_VERSION).tar.gz
RTPATCHONOFF_SITE = http://nonesiste.com

define RTPATCHONOFF_BUILD_CMDS
    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)  all
endef

define RTPATCHONOFF_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rtpatchonoff $(TARGET_DIR)/usr/bin 
endef

$(eval $(call GENTARGETS,package,rtpatchonoff))
[/mk]

Where is the problem?

clock_nanosleep is defined in
buildrootfolder/output/toolchain/uClibc-0.9.32/librt/clock_nanosleep.c


? - http://www.kernel.org/pub/linux/kernel/projects/rt/
? - https://rt.wiki.kernel.org/articles/s/q/u/Squarewave-example.html
