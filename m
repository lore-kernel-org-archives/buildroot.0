From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 17:16:27 +0200
Subject: [Buildroot] [PATCH] ustr: Makefile fixes for link failures
In-Reply-To: <1464187973-11273-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1464187973-11273-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20160525171627.072cade5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 09:52:53 -0500, Clayton Shotwell wrote:

> +--- a/Makefile.in	2016-05-23 08:46:46.337481574 -0500
> ++++ b/Makefile.in	2016-05-23 08:45:12.327380457 -0500
> +@@ -425,11 +425,11 @@
> + 		@echo Installing files
> + 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
> + 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
> +-		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> ++		rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)

Just changing this cannot fix the failures. The "-" at the beginning of
the line is not about whether is mandatory or not, it is about ignoring
the return value or not.

Normally, make aborts as soon as one command returns a non-zero value.
When you prefix the command with "-", it will ignore the return value
and continue executing the rest.

But like you said, since the command is "rm -f", it returns 0
regardless of whether the file to be removed existed or not, or if the
removal was possible or not.

Hence, I believe your patch is a no-op and cannot fix the original
problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
