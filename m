From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 9 Oct 2006 11:56:26 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061009161313.4F9374859A@busybox.net>
References: <20061009161313.4F9374859A@busybox.net>
Message-ID: <20061009175626.GB24455@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Oct 09, 2006 at 09:13:13AM -0700, aldot at uclibc.org wrote:
> --- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 11:53:10 UTC (rev 16346)
> +++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 16:13:12 UTC (rev 16347)
> @@ -128,12 +128,15 @@
>  
>  ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
>  # full kernel tarball >= 2.6.18
> +
> +KERNEL_ARCH:=$(shell $(SHELL) -c 'if test "$(ARCH)" = "i486" -o "$(ARCH)" = "i586"; then echo i386; else echo $(ARCH); fi')
> +

How about something like this:

KERNEL_ARCH := $(shell $(CC) -dumpmachine | sed -e s'/-.*//' \
	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
	-e s/arm.*/arm/ -e s/sa110/arm/ \
	-e s/s390x/s390/ -e s/parisc64/parisc/ \
	-e s/ppc.*/powerpc/ -e s/mips.*/mips/)

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
