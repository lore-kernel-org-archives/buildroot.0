From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:34:56 +0200
Subject: [Buildroot] [git commit] fdk-aac: fix build with GCC 6
Message-ID: <20160501203500.AA32A81E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3d6a99abcce69455ce6bc147ef9bd0eb390844e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 6 defaults to -std=gnu++14 instead of -std=gnu++98. The C++11 standard does
not allow "narrowing conversions" which is why building fdk-aac with GCC 6
fails:

libAACenc/src/aacEnc_rom.cpp:661:1: error: narrowing conversion of '2180108801u' from 'unsigned int' to 'FIXP_DBL {aka long int}' inside { } [-Wnarrowing]

Use '-std=gnu++98' as suggested by "Porting to GCC 6" [1].

[1] https://gcc.gnu.org/gcc-6/porting_to.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fdk-aac/fdk-aac.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index a872c54..45a3cf5 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -11,4 +11,7 @@ FDK_AAC_LICENSE_FILES = NOTICE
 
 FDK_AAC_INSTALL_STAGING = YES
 
+# Not compatible with GCC 6 which defaults to GNU++14
+FDK_AAC_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++98"
+
 $(eval $(autotools-package))
