From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jun 2011 12:33:13 +0200
Subject: [Buildroot] Add package statserial
In-Reply-To: <BANLkTi=AamsYp47dfhXa6RtJTATze7sCOQ@mail.gmail.com> (Francis
	Mendes's message of "Mon, 6 Jun 2011 22:54:46 -0300")
References: <BANLkTi=bZM8DpVptAVzw13Xs4V0d7b2rVg@mail.gmail.com>
	<20110606212121.335044b2@skate>
	<BANLkTi=AamsYp47dfhXa6RtJTATze7sCOQ@mail.gmail.com>
Message-ID: <87zklulymu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francis" == Francis Mendes <francis.mendes@gmail.com> writes:

Hi,

Looks good, but here's a few more comments.

 Francis> The original Makefile compiles the source code to statserial.o
 Francis> and then links it. I don't know exactly why, but the linker
 Francis> fails with the message "undefined reference to
 Francis> `atexit'". Searching in the web, I found someone suggesting to
 Francis> compile and link in a single step using gcc, and it worked for
 Francis> me. The purpose of the patch is to compile and link the source
 Francis> code this way. If someone has a better way to fix the problem,
 Francis> let me know.  ?

 Francis> Thanks for the input. Below is the new patch. If there's still
 Francis> something wrong, let me know.

 Francis> Francis

 Francis> =====================================================

 Francis> Add package statserial

 Francis> +++ b/package/statserial/Config.in
 Francis> @@ -0,0 +1,11 @@
 Francis> +config BR2_PACKAGE_STATSERIAL
 Francis> +??? bool "statserial"
 Francis> +??? select BR2_PACKAGE_NCURSES
 Francis> +??? help
 Francis> +??? ??? Displays a table of the signals on a standard
 Francis> +??? ??? 9-pin or 25-pin serial port, and indicates the
 Francis> +??? ??? status of the handshaking lines. It can be
 Francis> +??? ??? useful for debugging problems with serial
 Francis> +??? ??? ports or modems.
 Francis> +
 Francis> +??? ??? https://sites.google.com/site/tranter/software

Config.in files should be indented with <tab> rather than spaces - So
the bool/select/help files should be indented with <tab>, and the help
text lines with <tab><space><space>.

 Francis> diff --git a/package/statserial/statserial-1.1-fixmakefile.patch b/package/
 Francis> statserial/statserial-1.1-fixmakefile.patch
 Francis> new file mode 100644
 Francis> index 0000000..88cdd3f
 Francis> --- /dev/null
 Francis> +++ b/package/statserial/statserial-1.1-fixmakefile.patch
 Francis> @@ -0,0 +1,26 @@
 Francis> +Compile and link the source in one step only
 Francis> +
 Francis> +
 Francis> +Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
 Francis> +
 Francis> +diff --git a/Makefile b/Makefile
 Francis> +index 2ed79f1..bf82034 100644
 Francis> +--- a/Makefile
 Francis> ++++ b/Makefile
 Francis> +@@ -9,11 +9,8 @@ LD??? = gcc
 Francis> + CFLAGS??? = -Wall -O3 -fomit-frame-pointer
 Francis> + LDFLAGS = -s -N

The problem is that the package expects LD to be gcc.

 Francis> +++ b/package/statserial/statserial.mk
 Francis> @@ -0,0 +1,20 @@
 Francis> +#############################################################
 Francis> +#
 Francis> +# statserial
 Francis> +#
 Francis> +#############################################################
 Francis> +STATSERIAL_VERSION = 1.1
 Francis> +STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
 Francis> +STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
 Francis> +STATSERIAL_DEPENDENCIES = ncurses
 Francis> +
 Francis> +define STATSERIAL_BUILD_CMDS
 Francis> +??? $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)"

So it would presumably work if you just passed LD="$(TARGET_CC) $(CFLAGS)"

-- 
Bye, Peter Korsgaard
