From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:49:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
In-Reply-To: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
References: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
Message-ID: <20191014224947.258f834d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Petr Vorel in Cc.

On Mon, 14 Oct 2019 18:53:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So essentially the problem here is that libcpu_set.a uses some FTS
functions, but -lfts appears *before* -lcpu_set in the link command
line.

> +diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
> +index db6a84305..65967c85b 100644
> +--- a/testcases/kernel/controllers/cpuset/Makefile.inc
> ++++ b/testcases/kernel/controllers/cpuset/Makefile.inc
> +@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
> + 
> + LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
> + 
> +-LDLIBS			+= -lcpu_set -lcontrollers -lltp
> ++LDLIBS			+= -lcpu_set -lcontrollers -lltp $(FTS_LIBS)
> + 
> + INSTALL_TARGETS		?= *.sh
> + 
> +diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> +index 322d03cac..2f9f93c69 100644
> +--- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> ++++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
> +@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
> + 
> + include $(top_srcdir)/include/mk/testcases.mk
> + 
> +-LDLIBS			+= -lm -lcontrollers -lltp
> ++LDLIBS			+= -lm -lcontrollers -lltp $(FTS_LIBS)
> + 
> + LIB			:= libcpu_set.a

I'd like to have Petr Vorel's opinion here. According to the INSTALL file:

LDLIBS   - libraries listed after objects during link, e.g. -lc, -lpthread,
           -lltp.

So, the libraries in LDLIBS should appear *after* the objects. Which is
kind of the case, but not for -lcpu_set.

Petr: is that expected ? What do you suggest ?

For the record: when static linking, the order of -l options is
important. If a library libA uses a symbol from libB, then -lA must
appear *before* -lB in the link command line (yes that's counter
intuitive).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
