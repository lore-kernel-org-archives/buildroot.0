From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jun 2015 13:54:22 +0200
Subject: [Buildroot] [PATCH 0/4] core/pkg-kconfig: fix saving back the
	configuration (branch yem/pr8156)
Message-ID: <cover.1433591404.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at fixing the pkg-kconfig infrastructure as
reported in PR8156:
    https://bugs.busybox.net/show_bug.cgi?id=8156

The basic underlying idea of PR8156 is to kick-start the configuration
of a kconfig-based package (say, Linux), using a (def)config bundled in
that package, then tweak that configuration to suit ones needs, and
eventually save it back to a custom (def)config for later re-use.

That is currently broken. It has in fact never worked, but is a
completely valid and useful use-case.

This 4-patch series is an attempt at making that possible.

Patch 1:
First, the initial (def)config file is inexistent since we want to
create it, so make believe it has to re-do all the targets that depend
on that file. Since we really do need that rule, we have to manually
check the files do exist.

Patches 2-3:
Second, because configurators remove the kconfig-fixup-done stamp file,
we'd save the .config file as directly configured by the user, which
might be missing our requirements. So, as soon as we exit the
configurators, we re-run the fixups, so the .config file is always
clean with our fixups.

Patch 4:
Third, the dependency chain for foo-update-config goes way back to that
base kconfig file, so saving the configuration will have make believe it
has to rebuild all targets in that dependency chain. We clearly do not
want that, as the file is really non-exitent and we want to create it.
So, we break the dependency chain and add a terminal rule which purpose
is to check the package is properly configured first.

Pfeww, that one was not trivial... ;-)

Regards,
Yann E. MORIN.


The following changes since commit e1cf34a39538e58ecf50d091482b2304c2f7e6d8:

  gcc/gcc-final: install libatomic via HOST_GCC_FINAL_GCC_LIB_DIR (2015-06-06 03:15:23 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pr8156

for you to fetch changes up to a195692f03dab1f3074825feab277c905379dfa2:

  core/pkg-kconfig: allow saving config to a non-existing custom config file (2015-06-06 13:45:06 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      core/pkg-kconfig: ensure kconfig file and fragments exist
      core/pkg-kconfig: move the kconfig fixups to a macro
      core/pkg-kconfig: run the kconfig fixups after exiting configurators
      core/pkg-kconfig: allow saving config to a non-existing custom config file

 package/pkg-kconfig.mk | 64 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
