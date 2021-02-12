From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2021 14:54:43 +0100
Subject: [Buildroot] [PATCHv2 0/7] Introduce BR2_ENABLE_RUNTIME_DEBUG
Message-ID: <20210212135451.22786-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

This patch series started with as main goal to fix the performance degradation
found when testing gRPC in combination with BR2_ENABLE_DEBUG.

Its implementation strives to settle a discussion that has happened several
times, regarding the CMAKE_BUILD_TYPE that Buildroot should set, by not forcing
anything upon the user but allowing the choice.
See commit message in patch 3/7 for references to this prior discussion.

Additionally, it cleans up some related changes done in specific packages.

After this series, there are still packages that set CMAKE_BUILD_TYPE
explicitly, but the associated comments indicate that they are needed to avoid
build failures, so they are not touched.

v2: fix sysrepo after comment by Jan Kundr?t (thanks!)


Best regards,
Thomas

Thomas De Schampheleire (7):
  core: introduce BR2_ENABLE_RUNTIME_DEBUG
  core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set
  package/pkg-cmake.mk: determine CMAKE_BUILD_TYPE depending on
    BR2_ENABLE_RUNTIME_DEBUG
  package/libjson: drop explicit '-DNDEBUG'
  package/flare-engine: remove explicit setting of CMAKE_BUILD_TYPE
  package/supertux: remove explicit setting of CMAKE_BUILD_TYPE
  package/sysrepo: remove explicit setting of CMAKE_BUILD_TYPE

 Config.in                             | 13 +++++++++++++
 docs/manual/adding-packages-cmake.txt |  2 +-
 package/Makefile.in                   |  3 +++
 package/flare-engine/flare-engine.mk  |  5 -----
 package/libjson/libjson.mk            |  2 +-
 package/pkg-cmake.mk                  |  2 +-
 package/supertux/supertux.mk          |  2 --
 package/sysrepo/sysrepo.mk            |  5 ++---
 8 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.26.2
