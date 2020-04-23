From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 08:16:48 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ncurses: bump to version
 6.2
In-Reply-To: <CAAXf6LUZr9SxjoQeTrfxmOqOEKqFtBh1o+AprOSQeuoHOKEDRQ@mail.gmail.com>
References: <20200229232016.4174325-1-aduskett@gmail.com>
 <20200421232618.18245478@windsurf.home>
 <CAAXf6LUZr9SxjoQeTrfxmOqOEKqFtBh1o+AprOSQeuoHOKEDRQ@mail.gmail.com>
Message-ID: <20200423081648.4cc1b73e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Apr 2020 07:38:18 +0200
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> > But then, shouldn't we add all of the ncurses-6.2 patches available at
> > https://invisible-mirror.net/archives/ncurses/6.2/. I remember Thomas
> > DS discussed ncurses patches during the latest Buildroot meeting, and a
> > number of them (at least for ncurses 6.1) contained security fixes.
> 
> Yes, unfortunately the patches themselves do not always clearly indicate
> whether it's the case.
> 
> Are there already any CVEs for ncurses 6.2?

Here are the changes from 6.2 to the latest patch version:

==

20200418
	+ improve tracemunch logic for "RUN" compaction.
	+ fix a special case in wresize() where copying the old text did not
	  check if the last cell on a row was the beginning of a fullwidth
	  character (adapted from patch by Benno Schulenberg).
	+ use vt52+keypad in xterm-vt52, from xterm #354 -TD
	+ improve see-also section of user_caps.5

20200411
	+ fix find_pair(), overlooked when refactoring for _nc_reserve_pairs()
	  (report/testcase by Brad Town, cf: 20170812).
	+ add a trailing null for magic-string in putwin, flagged by gcc 10
	+ update check for gcc version versus gnat to work with gcc 10.x

20200404
	+ modify -fvisibility check to work with g++
	> fixes for building with Visual Studio C++ and msys2 (patches by
	  "Maarten Anonymous"):
	+ add configure option and check for gcc -fvisibility=hidden feature
	+ define NCURSES_NOMACROS in lib_gen.c to work around Visual Studio
	  C++ preprocessor limitations.
	+ modify some of the configure-macros, as well as mk-1st.awk to work
	  with Visual Studio C++ default filenaming.

20200328
	+ correct length of buffer copied in dup_field().
	+ remove "$(srcdir)/" from path of library.gpr, needed for out-of-tree
	  builds of Ada95 (patch by Adam Van Ymeren).

20200321
	+ improve configure-checks to reduce warnings about unused variables.
	+ improve description of error-returns in waddch and waddnstr manual
	  pages (prompted by patch by Benno Schulenberg).
	+ add test/move_field.c to demonstrate move_field(), and a stub for
	  a corresponding demo of dup_field().

20200314
	+ add history note to curs_scanw.3x for <stdarg.h> and <varargs.h>
	+ add history note to curs_printw.3x for <stdarg.h> and <varargs.h>
	+ add portability note to ncurses.3x regarding <stdarg.h>

20200308
	+ update copyright notices in test-packages.
	+ modify tracemunch to guard against errors in its known_p1 table.
	+ add several --with-xxx-libname options, to help with pkgsrc (prompted
	  by discussion with Thomas Klausner).

20200301
	+ modify wbkgd() and wbkgrnd() to avoid storing a null in the
	  background character, because it may be used in cases where the
	  corresponding 0x80 is not treated as a null (report by Marc Rechte,
	  cf: 20181208).

20200229
	+ modify CF_NCURSES_CONFIG to work around xcode's c99 "-W" option,
	  which conflicts with conventional use for passing linker options.
	> fixes for building with Visual Studio C++ and msys2 (patches by
	  "Maarten Anonymous"):
	+ check for pcre2posix.h instead of pcre2-posix.h
	+ add case in CF_SHARED_OPTS for msys2 + msvc
	+ add fallback definition for STDIN_FILENO in progs.priv.h
	+ modify win_driver.c to use _alloca() rather than gcc's variable
	  length array feature.
	+ add NCURSES_IMPEXP to ncurses wrapped-variable declarations
	+ remove NCURSES_IMPEXP from class variables in c++/cursslk.h
	+ remove fallback prototype for exit() from c++/etip.h.in
	+ use configured check for <sys/time.h> in a couple of places
	+ conditionally include winsock.h in ncurses/win32con/gettimeofday.c,
	  because Visual Studio needs this for the timestruct declaration.
	+ adjust syntax in a couple of files using the NCURSES_API symbol.

20200222
	+ expanded note in ncurses.3x regarding automatically-included headers
	+ improve vt50h and vt52 based on DECScope manual -TD
	+ add/use vt52+keypad and vt52-basic -TD
	+ check/workaround for line-too-long in Ada95 generate utility when
	  building out-of-tree.
	+ improve/update HEADER_DEPS in */Makefile.in
	+ add "check" rule to include/Makefile, to demonstrate that the headers
	  include all of the required headers for the types used.

20200215
	+ improve manual page for panel library, extending the portability
	  section as well as documenting error-returns.
	+ show tic's version when installing terminal database in run_tic.sh
	+ correct check for gcc vs other compilers used in ncurses 6.0, from
	  FreeBSD patch by Kyle Evans (cf: 20150725).
	+ add notes for 6.2 to INSTALL.

20200212 6.2 release for upload to ftp.gnu.org
	+ update release notes
	+ minor build-fixes, mostly to test-package scripts

==

It is worth noting that ftp://ftp.invisible-island.net/ncurses/current/
has complete tarballs for each of the "updated" 6.2 versions.
Unfortunately the name of the folder, current/ and the fact that the
6.1 tarballs are not there makes me think such tarballs might disappear
over time from this location.

However using those tarballs would allow us to use 6.2-20200418 as the
version, which would match what release-monitoring.org has:
https://release-monitoring.org/project/2057/.

Otherwise, we can also do something like this:

NCURSES_BASE_VERSION = 6.2
NCURSES_PATCH_VERSIONS = \
	20200215 \
	20200222 \
	20200229 \
	20200301 \
	20200308 \
	20200314 \
	20200321 \
	20200328 \
	20200404 \
	20200411 \
	20200418
NCURSES_SOURCE = ncurses-$(NCURSES_BASE_VERSION).tar.gz
NCURSES_PATCH = \
	$(patsubst %,https://invisible-mirror.net/archives/ncurses/$(NCURSES_BASE_VERSION)/ncurses-$(NCURSES_BASE_VERSION)-%.patch.gz,$(NCURSES_PATCH_VERSIONS))
NCURSES_VERSION = $(NCURSES_BASE_VERSION)-$(lastword $(NCURSES_PATCH_VERSIONS))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
