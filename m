From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 8 Dec 2019 22:38:52 -0300
Subject: [Buildroot] [PATCH] package/glibc: drop dependency of utilities
 on bash
In-Reply-To: <20191205231729.2c16445c@windsurf>
References: <20191203001405.12984-1-unixmania@gmail.com>
 <20191205231729.2c16445c@windsurf>
Message-ID: <CAJ4jsaca+BnSWrQ5Zcd9h_6o5705oe0z9fAjBr7bN6g65+RE=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 5, 2019 at 7:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon,  2 Dec 2019 21:14:05 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > The dependency was added because ldd uses bash-specific syntax to
> > localize messages. Add a post-patch hook, instead, to replace the
> > occurrences of $"foo" by "foo", simply, so the code becomes POSIX
> > sh compliant if bash is not selected.
> >
> > Also set the configuration environment accordingly to replace the
> > /bin/bash hashbang by /bin/sh.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> I've applied, however I think it would be nice to have this mechanism
> supported upstream. It can probably be easily added using a check in
> configure.ac, and the proper autoconf replacement variable when
> generating elf/ldd.bash.
>
> Could you have a look into this ?
>
> Thanks!

I'm working on a patch series to glibc but it requires ATORECONF,
which fails because GLIBC_SUBDIR is set to "build" and there
configure.ac is not there. I circumvented the problem by using

define GLIBC_AUTORECONF
        cd $(@D) && $(AUTORECONF) || true
endef

GLIBC_PRE_CONFIGURE_HOOKS = GLIBC_AUTORECONF

The "|| true" there is a kludge to ignore this error:

Use of uninitialized value $args[0] in split at
/work/qemu_x86_64_glibc_eudev/host/bin/autoreconf line 493, <GEN2>
line 4.
autoheader: warning: missing template: BIND_NOW
autoheader: Use AC_DEFINE([BIND_NOW], [], [Description])
autoheader: warning: missing template: DO_STATIC_NSS
autoheader: warning: missing template: ENABLE_STACKGUARD_RANDOMIZE
autoheader: warning: missing template: ENABLE_STATIC_PIE
autoheader: warning: missing template: EXPORT_UNWIND_FIND_FDE
autoheader: warning: missing template: HAVE_ASM_SET_DIRECTIVE
autoheader: warning: missing template: HAVE_BUILTIN_MEMSET
autoheader: warning: missing template: HAVE_BUILTIN_TRAP
autoheader: warning: missing template: HAVE_CC_INHIBIT_LOOP_TO_LIBCALL
autoheader: warning: missing template: HAVE_CC_NO_STACK_PROTECTOR
autoheader: warning: missing template: HAVE_CC_WITH_LIBUNWIND
autoheader: warning: missing template: HAVE_EHDR_START
autoheader: warning: missing template: HAVE_GCC_IFUNC
autoheader: warning: missing template: HAVE_IFUNC
autoheader: warning: missing template: HAVE_PT_CHOWN
autoheader: warning: missing template: HAVE_SDATA_SECTION
autoheader: warning: missing template: HAVE_SECTION_QUOTES
autoheader: warning: missing template: HAVE_TUNABLES
autoheader: warning: missing template: HAVE_Z_COMBRELOC
autoheader: warning: missing template: LINK_OBSOLETE_NSL
autoheader: warning: missing template: LINK_OBSOLETE_RPC
autoheader: warning: missing template: NO_CTORS_DTORS_SECTIONS
autoheader: warning: missing template: NO_HIDDEN
autoheader: warning: missing template: STACK_PROTECTOR_LEVEL
autoheader: warning: missing template: USE_LDCONFIG
autoheader: warning: missing template: USE_MULTIARCH
autoheader: warning: missing template: USE_NSCD
autoheader: warning: missing template: USE_STAP_PROBE
autoreconf: /work/qemu_x86_64_glibc_eudev/host/bin/autoheader failed
with exit status: 1

--
Carlos Santos <unixmania@gmail.com>
