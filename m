From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sun, 30 Aug 2020 16:36:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: new package
In-Reply-To: <20200829221711.3327c5ab@windsurf.home>
References: <20200829075901.19860-1-egorenar-dev@posteo.net>
 <20200829221711.3327c5ab@windsurf.home>
Message-ID: <87mu2ckxo4.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> For all new packages, we need an entry to be added to the DEVELOPERS
> file so we know who is in charge of which package, and you will receive
> e-mail notifications when this package fails to build or needs to be
> updated.

Fixed.

>
> We need all patches to have a description and Signed-off-by line, and
> be generated using "git format-patch -N" when the upstream project uses
> git.
>

Fixed.


> It's not clear to me why you need this change though. I think the
> intention of this code is that if you pass CFLAGS in the environment of
> make and not as an option, it will do the right thing. Quick demo:
>
> $ cat toto.mk 
> CFLAGS_BASE := $(CFLAGS) -foobar
> CFLAGS := $(CFLAGS_BASE) -barfoo
>
> all:
> 	@echo $(CFLAGS)
>
> $
> $ make -f toto.mk CFLAGS=-baz
> -baz
> $ CFLAGS=-baz make -f toto.mk
> -baz -foobar -barfoo
>
>

Fixed. Thanks for pointing out.

> Again, we need this to have a proper description and Signed-off-by.
> Also, could you submit it upstream ?
>

The fix is already upstream but there is no release yet.
Anyways, i took the official patch now.


> elfutils has plenty more dependencies that you need to replicate:
>
>         depends on BR2_USE_WCHAR
>         depends on !BR2_STATIC_LIBS
>         # Only glibc and uClibc implement the myriad of required GNUisms
>         depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
>

Fixed.

>
> You need to add the upstream URL of the project in the Config.in help
> text, look at other packages for example.
>
> Also, you need to add a comment about the Config.in dependencies. Look
> at other packages for direction on how to do this. For example, in
> package/elfutils/Config.in, we have:
>
> comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
>         depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>                 || !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>

Fixed.

> Your Config.in file also selects bzip2 and elfutils... so it seems odd
> they are not needed at build time. Could you confirm this ?
>
> In any case, make sure you can run this:
>
> $ make clean
> $ make makedumpfile
>

Done. It works.


> if that doesn't work, you forgot some build dependencies.
>
> Also, run:
>
> $ cat > snippet.cfg<<EOF
> BR2_PACKAGE_MAKEDUMPFILE=y
> EOF
> $ ./utils/test-pkg -c snippet.cfg -p makedumpfile
>

$ ./utils/test-pkg -c snippet.cfg -p makedumpfile
                             br-arm-full [1/6]: FAILED
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 3 skipped, 1 build failed, 0 legal-info failed


/home/egorenar/br-test-pkg/br-arm-full/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__arm     __ -U__x86_64__ -c -o ./arch/x86_64.o arch/x86_64.c
 elf_info.c: In function ?get_elf64_phnum?:
 elf_info.c:1050:23: error: ?PN_XNUM? undeclared (first use in this function)
   if (ehdr->e_phnum == PN_XNUM) {
                        ^
 elf_info.c:1050:23: note: each undeclared identifier is reported only once for each function it appears in
 /home/egorenar/br-test-pkg/br-arm-full/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__arm     __ -U__x86_64__ -c -o ./arch/ia64.o arch/ia64.c
 make[1]: *** [Makefile:90: elf_info.o] Error 1


Not sure what is going on, because PN_XNUM is defined in
elfutils/libelf/elf.h



> Could you instead pass TARGET_CONFIGURE_OPTS in the environment, like
> this:
>
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> 		TARGET=$(BR2_ARCH) USELZO=on LINKTYPE=dynamic
>
> TARGET=$(BR2_ARCH): did you check it builds with all CPU architectures
> supported by Buildroot? In the above proposed test with test-pkg, I'd
> suggest doing one run with the -a option to check with all toolchains
> supported by Buildroot.
>
> Also, USELZO=on indicates that the LZO dependency, could you make it
> optional? I.e, drop the select BR2_PACKAGE_LZO from Config.in, and in
> the .mk file, do something like:
>
> ifeq ($(BR2_PACKAGE_LZO),y)
> MAKEDUMPFILE_DEPENDENCIES += lzo
> MAKEDUMPFILE_MAKE_OPTS += USELZO=on
> endif


Fixed.

Regards
Alex
