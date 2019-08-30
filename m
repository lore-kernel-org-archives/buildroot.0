From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:35:08 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] support/cmake: Explicitly
 set CMAKE_SYSTEM
Message-ID: <20190830203107.DAF8F88875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b5892b6d0c7c9fa7f6ea8202832cac7f22e8ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Some packages test for CMAKE_SYSTEM explicitly[1]

CMAKE_SYSTEM is comprised of CMAKE_SYSTEM_NAME and CMAKE_SYSTEM_VERSION.
It defaults to CMAKE_SYSTEM_NAME if CMAKE_SYSTEM_VERSION is not set[2]

At the point CMAKE_SYSTEM_NAME is set to "Linux" CMAKE_SYSTEM is already
constructed. Setting it explicitly ensures that it is the correct value.

This is because we do set CMAKE_SYSTEM_NAME twice, in fact:

  - first in toolchainfile.cmake, so that we tell cmake to use the
    "Buildroot" platform,

  - second, in the Buildroot.cmake platform definition itself, so that
    we eventually behave like the Linux platform.

We also set CMAKE_SYSTEM_VERSION to 1, and so the real CMAKE_SYSTEM
value should be set to Linux-1 if we were to follow the documentation to
the letter.

However, for Linux, the version does not matter, and in some situations
may even be harmful (that was reported in one of the commits that
introduce Buildroot.cmake and toolchainfile.cmake).

[1] Fluidsynth https://github.com/FluidSynth/fluidsynth/blob/0cd44d00e1ec9a905d51163efde7b70ff8ae0ba3/CMakeLists.txt#L80
[2] https://cmake.org/cmake/help/git-master/variable/CMAKE_SYSTEM.html#variable:CMAKE_SYSTEM

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Peter: update commit message with description from Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 07f31ee263d276657f86197215ae34bb58b68bbf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Buildroot.cmake | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
index 9f5f565255..761b6d7ae2 100644
--- a/support/misc/Buildroot.cmake
+++ b/support/misc/Buildroot.cmake
@@ -1,5 +1,6 @@
 # Impersonate a Linux system. Afterall, that's what we are...
 set(CMAKE_SYSTEM_NAME Linux)
+set(CMAKE_SYSTEM ${CMAKE_SYSTEM_NAME})
 include(Platform/Linux)
 
 # Override problematic settings, to avoid RPATH against host lib directories.
