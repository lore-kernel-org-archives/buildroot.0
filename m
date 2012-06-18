From: Ming-Ching Tiew <mctiew@yahoo.com>
Date: Sun, 17 Jun 2012 22:55:49 -0700 (PDT)
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <1339990515.26331.YahooMailClassic@web161404.mail.bf1.yahoo.com>
Message-ID: <1339998949.62879.YahooMailClassic@web161404.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



--- On Mon, 6/18/12, Ming-Ching Tiew <mctiew@yahoo.com> wrote:

> 
> I encountered various problems using buildroot-2012.05, all
> to do with using buildroot as a chroot build environment.
> to do with using buildroot as a chroot build environment.
> 
> 1. Seem "Copying development files to target did not copy
> libc.so.
> 
> ???Seems this was reported sometime ago, a
> fix was provided but somehow it's not propagated to
> support/scripts/copy.sh.
> 
> ???The fix is to add this line to copy.sh
> 
>  cp -af $(STAGING_DIR)/usr/lib/libc.so
> $(TARGET_DIR)/usr/lib
> 
> 2. I wrote a test program in the chroot environment, 
> 
> #include <stdio.h>
> #include <dlfcn.h>
> #include <stdlib.h>
> 
> int main(int argc, char **argv) 
> {
> ???void *lib_handle;
> ???double (*fn)(int *);
> ???int x;
> ???char *error;
> 
> ???lib_handle = dlopen("libctest.so",
> RTLD_NOW);
> ???if (!lib_handle) 
> ???{
> ? ? ? fprintf(stderr, "1: RTLD_NOW: %s\n",
> dlerror());
> ? ? ? exit(1);
> ???}
> ???return 0;
> }
> 
> ? ? # cc -rdynamic? mytest.c -ldl
> /usr/lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../libdl.a(libdl.os):
> In function `_dl_find_hash':
> libdl.c:(.text+0x9fa): undefined reference to
> `_dl_allocate_static_tls'
> libdl.c:(.text+0xa1a): undefined reference to
> `_dl_allocate_static_tls'
> /usr/lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../libdl.a(libdl.os):
> In function `_dl_load_elf_shared_library':
> libdl.c:(.text+0x1e51): undefined reference to
> `_dl_next_tls_modid'
> /usr/lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/bin/ld:
> a.out: hidden symbol `_dl_allocate_static_tls' isn't
> defined
> /usr/lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/bin/ld:
> final link failed: Bad value
> collect2: ld returned 1 exit status
> 
> Is there any other libraries which are missing also in the
> coying ?
> 

Fixed the problem by creating a symbolic link /usr/lib/libdl.so to link it to /lib/libdl.so.0.
