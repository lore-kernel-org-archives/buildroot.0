From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  1 Nov 2018 15:02:28 +0100
Subject: [Buildroot] [PATCH 0/3] RFC on per-package development/fixes
Message-ID: <20181101140231.24380-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the ELC I was really interested how the per-package stuff is performing,
so I gave it a shot with my typical config. Things crashed in numerous places,
so I started looking into it and thought I might as well share what i found.

This is based on Thomas ppsh-v4 branch, which I have locally rebased on master.
I probably screwed up with the qt5 changes, so here I send only my stuff on
top it.

Rechecking the first patch, which is to move the per-package host-dir
preparation into a separate step, makes me now think that this could
be simplified even more: Why not create the per-package host/target dir with
the _FINAL_ALL_DEPENDENCIES, which includes all other dependencies, right at
the beginning, e.g. before the extract-step? That way we could get rid of
similar code during extract.
I dont think the slight loss in possible parallelization (during the
extract-step) would be noticeable.


Andreas Naumann (3):
  core: Move per-package host preparation into separate step
  OVERRIDE_SOURCEDIR: Fix build with per-package infrastructure
  fs: Add common rootfs dependencies to PACKAGES

 fs/common.mk           |  2 ++
 package/pkg-generic.mk | 28 ++++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.19.1
