From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 21:34:51 +0100
Subject: [Buildroot] [PATCH] bdwgc: fix compile for sparc
In-Reply-To: <20151203144655.GA13813@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 3 Dec 2015 15:46:55 +0100")
References: <20151203144655.GA13813@waldemar-brodkorb.de>
Message-ID: <87lh9bcluc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > We need to use a patch from master git.
 > https://github.com/ivmai/bdwgc/commit/e2bf29b7801357c1ad28c2948a3f88c655dd722a

 > Fixes following autobuilder failures:
 > http://autobuild.buildroot.net/results/220b3d49b8ad891e5dd3aae759319100a1500701/
 > http://autobuild.buildroot.net/results/b7465d175f03c9461693a92885028723772c7814/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  ...-asm-machine-dependent-files-to-src-folde.patch |  422 ++++++++++++++++++++
 >  package/bdwgc/bdwgc.mk                             |    3 +
 >  2 files changed, 425 insertions(+)
 >  create mode 100644 package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch

 > diff --git
 > a/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
 > b/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
 > new file mode 100644
 > index 0000000..ff7bd4d
 > --- /dev/null
 > +++ b/package/bdwgc/0003-Revert-Move-asm-machine-dependent-files-to-src-folde.patch
 > @@ -0,0 +1,422 @@
 > +From 5e756d4d8df2949cb3b6e51532d3016cbb276fd7 Mon Sep 17 00:00:00 2001
 > +From: Ivan Maidanski <ivmai@mail.ru>
 > +Date: Fri, 27 Feb 2015 21:32:22 +0300
 > +Subject: [PATCH 004/135] Revert "Move asm machine-dependent files to 'src'
 > + folder" (partly)
 > +
 > +Asm files moved back to base folder to avoid build issues (reported
 > +for NetBSD and Solaris on Sparc).  Alternative way is to adjust
 > +configure.ac and Makefile.am properly but it requires more efforts
 > +(including testing).
 > +
 > +* Makefile.am (EXTRA_libgc_la_SOURCES): Remove "src/" prefix.
 > +* Makefile.direct (SRCS, mach_dep.o): Likewise.
 > +* src/ia64_save_regs_in_stack.s: Move to base folder.
 > +* src/sparc_mach_dep.S: Likewise.
 > +* src/sparc_netbsd_mach_dep.s: Likewise.
 > +* src/sparc_sunos4_mach_dep.s: Likewise.

Please also sign off on the patch.

> +++ b/package/bdwgc/bdwgc.mk
 > @@ -19,6 +19,9 @@ BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
 >  BDWGC_AUTORECONF = YES
 
 >  BDWGC_CFLAGS = $(TARGET_CFLAGS)
 > +ifeq ($(BR2_sparc),y)
 > +BDWGC_CFLAGS += -DAO_NO_SPARC_V9

Should this also be done for for the v9 variant? (E.G BR2_sparc_v9)

-- 
Bye, Peter Korsgaard
