From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:55 +0100
Subject: [Buildroot] [PATCH 0/8 RFC] core: install foo-config scripts early
	in the PATH (branch yem/foo-config-in-PATH)
Message-ID: <cover.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This RFC series is an attempt at solving once and for all the problem we
encounter with foo-config scripts.

The foo-config scripts are usually installed in staging, so are out of
the PATH. However, most packages will just simply want to run them, and
most are not configurable in where to look for that script and just
expect to find them in the PATH.

Up until now, we used to patch those packages so that they accept an
environment variable.

Arnout has suggested [0] that we move all the target-related foo-config
scripts early in the PATH, so that they are found before the host ones
and before the system ones.

This would allow us to drop our local patches, and to no longer set the
custom FOO_CONFIG or the ac_cv_foo_config variables from our package
recipes.

This series is my proposal to implement Arnout's suggestion, and is
articulated as thus:

  - first, we ensure that we install the munged foo-config scripts in
    their own location (patches 1-3),

  - then we separate again the host and target PATHs variables (patch 4)

  - finally, we use the proper host or target PATH everywhere we set
    PATH (patches 5-7).

  - a preliminary cleanup patch against libhid concludes the series
    (patch 8)

This series is RFC: it is a "technology-preview" for early comments
and to see if the solution is viable.

The series makes it so that our currently workarounds still work.
When/if the topic is accepted (and the series is fixed after the
reviews), we can then (un)fix / (un)patch packages in follow-up
patches.

[0] http://lists.busybox.net/pipermail/buildroot/2015-December/146959.html

Regards,
Yann E. MORIN.


The following changes since commit 0848e9e89c2c427ab6ca35fab25996d7a1cd8c5b:

  luvi: new package (2015-12-20 23:13:02 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/foo-config-in-PATH

for you to fetch changes up to 5927b9370935b82aedcdcade5cdd5d9c280528d5:

  package/libhid: no need for custom PATH (2015-12-21 12:34:06 +0100)

----------------------------------------------------------------
Yann E. MORIN (8):
      core: split long line of directories
      core/pkg-generic: use a $(foreach) loop to fix foo-config scripts
      core/pkg-generic: install foo-config scripts in their own dir
      core: re-instate different target and host PATHs
      fs: use HOST_PATH
      packages: use HOST_PATH
      packages: use TARGET_PATH
      package/libhid: no need for custom PATH

 Makefile                     | 15 ++++++++++++---
 fs/common.mk                 |  6 +++---
 fs/ext2/ext2.mk              |  2 +-
 package/Makefile.in          | 10 +++++-----
 package/faifa/faifa.mk       |  2 +-
 package/freetype/freetype.mk |  2 +-
 package/gpm/gpm.mk           |  2 +-
 package/kodi/kodi.mk         |  2 +-
 package/libhid/libhid.mk     |  4 +---
 package/pkg-cmake.mk         |  4 ++--
 package/pkg-generic.mk       |  5 ++++-
 package/pkg-python.mk        |  8 ++++----
 package/sdl/sdl.mk           |  2 +-
 13 files changed, 37 insertions(+), 27 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
