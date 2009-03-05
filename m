From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 11:59:54 +0100
Subject: [Buildroot] [PATCH] mDNSresponder cross-compilation
In-Reply-To: <206b9e70903031746n64eb2b82n459ca3092b12f6a1@mail.gmail.com> (Zac
	Wheeler's message of "Tue\, 3 Mar 2009 17\:46\:18 -0800")
References: <206b9e70903031746n64eb2b82n459ca3092b12f6a1@mail.gmail.com>
Message-ID: <87tz68fd5h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zac" == Zac Wheeler <zac.wheeler@gmail.com> writes:

 Zac> This patch fixes the mdnsresponder package from Apple so that it will
 Zac> cross-compile on arm. It also fixes an incorrect usage of $(PKG)_SITE.

 Zac> It is against the 2009.02 release.

Thanks, a few comments:

 Zac> +++ b/package/mdnsresponder/mDNSResponder-107.6-mdnsposix-ld-strip.patch
 Zac> @@ -0,0 +1,20 @@
 Zac> +--- mDNSResponder-107.6/mDNSPosix/Makefile.orig	2009-03-03 16:57:28.000000000 -0800
 Zac> ++++ mDNSResponder-107.6/mDNSPosix/Makefile	2009-03-03 16:56:16.000000000 -0800
 Zac> +@@ -268,7 +268,7 @@
 Zac> + JDK = /usr/jdk
 Zac> + 
 Zac> + CC = @cc
 Zac> +-LD = ld -shared
 Zac> ++LD = @ld -shared
 Zac> + CP = cp
 Zac> + RM = rm
 Zac> + LN = ln -s -f
 Zac> +@@ -293,7 +293,7 @@
 Zac> + CFLAGS_DEBUG = -Os -DMDNS_DEBUGMSGS=0 
 Zac> + OBJDIR = objects/prod
 Zac> + BUILDDIR = build/prod
 Zac> +-STRIP = strip -S 
 Zac> ++STRIP = @strip -S 

Why those @ ? Just purely cosmetic?

Isn't the .mk overrriding those variables on the cmdline anyway?

 Zac>  $(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
 Zac> -	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
 Zac> +	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" STRIP=$(TARGET_STRIP) LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix

We normally use $(STRIPCMD) in package/ instead of $(TARGET_STRIP),
but OK.

-- 
Bye, Peter Korsgaard
