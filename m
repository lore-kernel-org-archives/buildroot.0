From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jan 2017 11:31:07 +0100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <20170117221723.10235-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 17 Jan 2017 23:17:23 +0100")
References: <20170117221723.10235-1-romain.naour@gmail.com>
Message-ID: <87r340u0b8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > See gperf 3.1 ChangeLog:
 > * The 'len' parameter of the hash function and of the lookup function is now
 >   of type 'size_t' instead of 'unsigned int'. This makes it safe to call these
 >   functions with strings of length > 4 GB, on 64-bit machines.

:/

Have you submitted this patch upstream? Doesn't this then break building
against gperf <3.1?

I think I'll apply Gustavoz patch to (temporarily) revert the gperf bump
instead. Once we have sorted out this libcap issue (and apparently eudev
as well) we can bump the version again.

 > Fixes:
 > http://autobuild.buildroot.net/results/a2d/a2da03b1a586fcfb0c7f9146aaf24bfab2e885b0

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
 > ---
 > I haven't checked how many packages are affected by this breakage...
 > ---
 >  ...p-Change-the-len-parameter-type-to-size_t.patch | 43 ++++++++++++++++++++++
 >  1 file changed, 43 insertions(+)
 >  create mode 100644 package/libcap/0004-libcap-Change-the-len-parameter-type-to-size_t.patch

 > diff --git a/package/libcap/0004-libcap-Change-the-len-parameter-type-to-size_t.patch b/package/libcap/0004-libcap-Change-the-len-parameter-type-to-size_t.patch
 > new file mode 100644
 > index 0000000..e28f780
 > --- /dev/null
 > +++ b/package/libcap/0004-libcap-Change-the-len-parameter-type-to-size_t.patch
 > @@ -0,0 +1,43 @@
 > +From 532493467fa751edb12dc06b5e12c72d5d9baeef Mon Sep 17 00:00:00 2001
 > +From: Romain Naour <romain.naour@gmail.com>
 > +Date: Tue, 17 Jan 2017 22:55:53 +0100
 > +Subject: [PATCH] libcap: Change the 'len' parameter type to 'size_t'
 > +
 > +See gperf 3.1 ChangeLog:
 > +* The 'len' parameter of the hash function and of the lookup function is now
 > +  of type 'size_t' instead of 'unsigned int'. This makes it safe to call these
 > +  functions with strings of length > 4 GB, on 64-bit machines.
 > +
 > +Fixes:
 > +http://autobuild.buildroot.net/results/a2d/a2da03b1a586fcfb0c7f9146aaf24bfab2e885b0
 > +
 > +Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > +---
 > + libcap/Makefile | 4 ++--
 > + 1 file changed, 2 insertions(+), 2 deletions(-)
 > +
 > +diff --git a/libcap/Makefile b/libcap/Makefile
 > +index d189777..40cbc30 100644
 > +--- a/libcap/Makefile
 > ++++ b/libcap/Makefile
 > +@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc
 > + 
 > + ifeq ($(BUILD_GPERF),yes)
 > + USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
 > +-INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
 > ++INCLUDE_GPERF_OUTPUT = -include string.h -include $(GPERF_OUTPUT)
 > + endif
 > + 
 > + libcap.pc: libcap.pc.in
 > +@@ -41,7 +41,7 @@ cap_names.h: _makenames
 > + 	./_makenames > cap_names.h
 > + 
 > + $(GPERF_OUTPUT): cap_names.list.h
 > +-	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, unsigned int);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
 > ++	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
 > + 
 > + cap_names.list.h: Makefile $(KERNEL_HEADERS)/linux/capability.h
 > + 	@echo "=> making $@ from $(KERNEL_HEADERS)/linux/capability.h"
 > +-- 
 > +2.9.3
 > +
 > -- 
 > 2.9.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
