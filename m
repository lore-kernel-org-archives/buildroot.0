From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:47:14 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/libcap: drop host-gperf
 dependency
In-Reply-To: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
Message-ID: <20200903224714.45ad0042@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 30 Aug 2020 12:00:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-gperf dependency was added in commit
> 5d8926add5da1b0bdfb90a41f4d7f857864c5524 without any explanation in the
> commit message but gperf can be disabled through BUILD_GPERF since
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=3c22870c762f7925b5ff143d76f9affbade275ba
> 
> So use this variable and drop this unneeded dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for looking into this. I agree that BUILD_GPERF=no will avoid
the host-gperf dependency, however I'm a bit confused how this works in
libcap and whether it has any drawback.

When gperf is detected, it will be used to generate some C code that
contains a hash function:

ifeq ($(BUILD_GPERF),yes)
USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
INCLUDE_GPERF_OUTPUT = -DINCLUDE_GPERF_OUTPUT='"$(GPERF_OUTPUT)"'
endif

$(GPERF_OUTPUT): cap_names.list.h
        perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
        sed -e 's/unsigned int len/size_t len/' -i $@

cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
        $(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@

Then in cap_text.c, this gets used like this:

#ifdef INCLUDE_GPERF_OUTPUT
/* we need to include it after #define _GNU_SOURCE is set */
#include INCLUDE_GPERF_OUTPUT
#endif

So the gperf-generated source file, if it exists is included. But I
don't see any conditional code that makes use of it when available.

Am I missing something? I wanted to understand the impact of not having
gperf. Perhaps not having a hash function makes libcap significantly
slower ?

Initially, I was expected libcap to have a pre-generated version of the
file, and having gperf available would only allow to re-generate the
file, but that doesn't seem to be what's happening.

Do you understand a bit better what is going on here ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
