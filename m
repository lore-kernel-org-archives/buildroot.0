From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 15:09:50 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/dmalloc: needs -fPIC
In-Reply-To: <20210417104919.1856286-1-fontaine.fabrice@gmail.com>
References: <20210417104919.1856286-1-fontaine.fabrice@gmail.com>
Message-ID: <2fbb1df2-1c2c-f497-e4a4-a3fabdff3b52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/04/2021 12:49, Fabrice Fontaine wrote:
[snip]
> diff --git a/package/dmalloc/0001-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
> deleted file mode 100644
> index 230a9e15f1..0000000000
> --- a/package/dmalloc/0001-add-fpic.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Without -fPIC, dmalloc does not build with:
> -
> -/home/test/mips-4.4/bin/mips-linux-gnu-ld --sysroot=/home/test/outputs/test-35/staging -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
> -/home/test/mips-4.4/bin/mips-linux-gnu-ld: libdmalloc.a(arg_check.o): relocation R_MIPS_HI16 against `_dmalloc_flags' can not be used when making a shared object; recompile with -fPIC
> -libdmalloc.a(arg_check.o): could not read symbols: Bad value
> -
> -This patch, taken from
> -http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/dmalloc/files/dmalloc-5.2.4-fpic.patch?hideattic=0&view=markup,
> -fixes the problem by passing the -fPIC flag. It isn't passed through
> -the ./configure environment in order to not clutter the configuration
> -cache with incorrect values.

 I was going to apply, and then I read the sentence above and I wasn't so sure.
I don't know though what Thomas means with "in order not to clutter the
configuration cache with incorrect values"... Thomas, it's just 11 years ago,
I'm sure you still remember the reasoning behind it?

 Oh what the heck, this is useless anyway. I've applied after all. Thomas, in
the unlikely case that you *do* remember and that this fix is wrong, please
revert 19ec872f169a851b48ba04d22432b7c0939847d4. Otherwise, the autobuilders
will let us know.

 Regards,
 Arnout

> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - Makefile.in |   10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -318,17 +318,17 @@
> - # special _th versions of objects with the LOCK_THREADS variable defined to 1
> - chunk_th.o : $(srcdir)/chunk.c
> - 	rm -f $@
> --	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> -+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> - 		-c $(srcdir)/chunk.c -o ./$@
> - 
> - error_th.o : $(srcdir)/error.c
> - 	rm -f $@
> --	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> -+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> - 		-c $(srcdir)/error.c -o ./$@
> - 
> - malloc_th.o : $(srcdir)/malloc.c
> - 	rm -f $@
> --	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> -+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
> - 		-c $(srcdir)/malloc.c -o ./$@
> - 
> - tests : $(TEST) $(TEST_FC)
> -@@ -360,7 +360,7 @@
> - 
> - .c.o :
> - 	rm -f $@
> --	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
> -+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
> - 
> - #
> - # .cc.o auto-target doesn't work on some systems. 
> -@@ -368,7 +368,7 @@
> - #
> - dmallocc.o : $(srcdir)/dmallocc.cc
> - 	rm -f $@
> --	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
> -+	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
> - 		-o ./$@
> - 
> - #
> diff --git a/package/dmalloc/0002-mips.patch b/package/dmalloc/0001-mips.patch
> similarity index 100%
> rename from package/dmalloc/0002-mips.patch
> rename to package/dmalloc/0001-mips.patch
> diff --git a/package/dmalloc/0003-fix-parallel-build.patch b/package/dmalloc/0002-fix-parallel-build.patch
> similarity index 100%
> rename from package/dmalloc/0003-fix-parallel-build.patch
> rename to package/dmalloc/0002-fix-parallel-build.patch
> diff --git a/package/dmalloc/0004-fix-shlibs.patch b/package/dmalloc/0003-fix-shlibs.patch
> similarity index 100%
> rename from package/dmalloc/0004-fix-shlibs.patch
> rename to package/dmalloc/0003-fix-shlibs.patch
> diff --git a/package/dmalloc/0005-fix-strdup.patch b/package/dmalloc/0004-fix-strdup.patch
> similarity index 100%
> rename from package/dmalloc/0005-fix-strdup.patch
> rename to package/dmalloc/0004-fix-strdup.patch
> diff --git a/package/dmalloc/0006-fix-strndup.patch b/package/dmalloc/0005-fix-strndup.patch
> similarity index 100%
> rename from package/dmalloc/0006-fix-strndup.patch
> rename to package/dmalloc/0005-fix-strndup.patch
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 38b2c02027..638fe0fcda 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -16,6 +16,10 @@ DMALLOC_INSTALL_STAGING = YES
>  DMALLOC_CONF_OPTS = --enable-shlib
>  DMALLOC_CFLAGS = $(TARGET_CFLAGS)
>  
> +ifeq ($(BR2_STATIC_LIBS),)
> +DMALLOC_CFLAGS += -fPIC
> +endif
> +
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>  DMALLOC_CONF_OPTS += --enable-cxx
>  else
> 
