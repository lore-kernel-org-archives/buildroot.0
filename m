From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2015 23:30:34 +0200
Subject: [Buildroot] [PATCH 0/2 v2] pkg-infra: better fix libtool files wrt.
	/usr (branch yem/libtool)
Message-ID: <cover.1430687963.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series aims at better fixing libtool's .la files.

Currently, we fix .la files by per-prending the path to the sysroot to
any path that starts with /usr . However, if either or both of the base
directory (basically, $(O) ) or the staging directory are themselves
sub-directories of /usr , we avoid doing that transformation, by
carefully 'protecting' those two paths, to keep them intact.

However, if the toolchain itself is present as a sub-directory of /usr
(i.e. a pre-installed custom toolchain), it may also contain .la files
with paths starting with /usr . This means we would currently prepend
the path to the staging directory to such paths in those .la files.

Of course, that breaks. :-(

So this series adds two fixes for that:

  - first, it properly protects the path to the custom pre-installed
    toolchain, the same way we handle the base and staging directories,
    (patch by Arnout),

  - second, it moves .la munging into the generic package
    infrastructure, as even non-autotools-based packages may also
    install .la files (patch by me).


Changes v1 -> v2:
  - add the second patch


Regards,
Yann E. MORIN.


The following changes since commit 6e55cd5d604b51a5f6658d4bf2f602a360d9c887:

  libfreeimage: disable on ARC and Blackfin (2015-05-03 19:33:52 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/libtool

for you to fetch changes up to 2498f2352f5b65d77d91f6405d39e6349de640dc:

  pkg-infra: munging .la files is not limited to autotools packages (2015-05-03 23:17:44 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (1):
      autotools-package: also handle pre-installed external toolchain in .la fixup

Yann E. MORIN (1):
      pkg-infra: munging .la files is not limited to autotools packages

 package/pkg-autotools.mk | 20 --------------------
 package/pkg-generic.mk   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 20 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
