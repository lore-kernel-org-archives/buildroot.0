From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 09:55:25 +0200
Subject: [Buildroot] [PATCH v2] aiccu: patched Makefile to enable static
	linking
In-Reply-To: <1380563862-4241-1-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Mon, 30 Sep 2013 19:57:42 +0200")
References: <1380563862-4241-1-git-send-email-rommel@layer-7.net>
Message-ID: <8761th1l3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "M" == Michael Rommel <rommel@layer-7.net> writes:

 M> Fixes autobuild errors:
 M> http://autobuild.buildroot.net/results/308087e1f85e822dec8b73a3ed892c7cd2376cbd/
 M> http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/

 M> Signed-off-by: Michael Rommel <rommel@layer-7.net>
 M> ---
 M> v1: initial patch to add required libraries for static linking to LDFLAGS
 M>     and reorder the CC commandline

 M> v2: added signed-off line and commit msg to patch, added autobuild URIs to 
 M>     commit msg

 M>  ...cu-0002-makefile-reorder-linked-libraries.patch |   24 ++++++++++++++++++++
 M>  1 file changed, 24 insertions(+)
 M>  create mode 100644 package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch

 M> diff --git a/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
 M> new file mode 100644
 M> index 0000000..cc189b2
 M> --- /dev/null
 M> +++ b/package/aiccu/aiccu-0002-makefile-reorder-linked-libraries.patch
 M> @@ -0,0 +1,24 @@
 M> +Makefile: changed LDFLAGS contents and order on the compile line for --static
 M> +
 M> +Signed-off-by: Michael Rommel <rommel@layer-7.net>
 M> +
 M> +--- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
 M> ++++ aiccu_20070115/unix-console/Makefile	2013-09-29 22:54:42.742963861 +0200
 M> +@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
 M> + # Currently defaultly builds only on Linux, but other platforms might easily also support it
 M> + ifeq ($(shell uname | grep -c "Linux"),1)
 M> + CFLAGS	+= -D AICCU_GNUTLS
 M> +-LDFLAGS += -lgnutls
 M> ++LDFLAGS += -lgnutls -lhogweed -lnettle -lgmp -lz

Thanks. The problem is that zlib (and libidn, p11-kit and libtasn1) are
all optional for gnutls (but needed in LDFLAGS when statically linking),
so this doesn't really work.

Perhaps we should handle it in aiccu.mk instead, either manually or
using pkg-config --static --libs gnutls

-- 
Bye, Peter Korsgaard
