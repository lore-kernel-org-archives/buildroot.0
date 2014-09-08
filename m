From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 8 Sep 2014 18:49:09 +0000
Subject: [Buildroot] Question about openssh.mk
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AD7B2@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Peter/all,

RE:  Header I found on git:
(Commit #c761eafb021c2beaf52b2d1a383433deac5fc2b4)
openssl: pass LDFLAGS to fix incorrect link

We already pass the LD variable to openssl in order to use gcc as the
driver for the link process, instead of directly using the ld
linker. However, we were not passing LDFLAGS so that the compiler
flags are passed, which means that with multilib toolchains, the
incorrect library variant could be used at link time, leading to
invalid binaries (partly ARMv4, partly ARMv5) or broken compilation
(when the build took place in soft-float, but the link stage takes
place against hard-float libraries).

This fixes a problem reported on IRC by amo-ej1 when compiling ssh on
PowerPC e500v2 with a CodeSourcery toolchain ("crtbegin.o uses hard
float, sshd uses soft float").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk> 

The code in question:

OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"

Taken from package/openssh/openssh.mk

Here we are setting LDFLAGS to TARGET_CFLAGS.  Is that really what
you meant to do?  I mean, it "works", but not in every case.

Also, this appears to be overriding the TARGET_CONFIGURE_OPTS in
Makefile.in.  Is this legacy crap left over from the centralization
project years ago?

Still working on it, may have an update to this later on today.

Andy
