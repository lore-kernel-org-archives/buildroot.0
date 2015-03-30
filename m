From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:07:48 +0200
Subject: [Buildroot] [git commit] arch: BINFMT_FLAT_SHARED is not really
	shared for buildroot purposes
Message-ID: <20150330210809.B618D817A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b171af3b3b4e0f0537173c7b9703c729915a6ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although BINFMT_FLAT_SHARED is indeed a shared library format, it does
not support dynamic library loading with dlopen(). So for buildroot
purposes, BR2_STATIC_LIBS shouldn't be selected.

As it happens, the compiler options that are added for
BINFMT_FLAT_SHARED also make the compiler ignore the -static option, so
we can simply force BR2_STATIC_LIBS and things work out perfectly.

Therefore, remove the select of BR2_BINFMT_SUPPORTS_SHARED from
BINFMT_FLAT_SHARED, which in turn makes sure that BR2_STATIC_LIBS is
selected.

[Arnout: rewrite commit message, add explanatory comment]

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 16ad8be..59bf84a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -295,7 +295,12 @@ config BR2_BINFMT_FLAT_SEP_DATA
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
-	select BR2_BINFMT_SUPPORTS_SHARED
+	# Even though this really generates shared binaries, there is no libdl
+	# and dlopen() cannot be used. So packages that require shared
+	# libraries cannot be built. Therefore, we don't select
+	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
+	# Although this adds -static to the compilation, that's not a problem
+	# because the -mid-shared-library option overrides it.
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
 
