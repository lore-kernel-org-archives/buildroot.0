From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 18:02:49 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/flatcc: disable
 -Werror
Message-ID: <20210523160324.E97BB8A2FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=465c6ec847f5e281836aba2489c50c61bc1e659e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Disable -Werror to fix the following build failure with gcc 11:

/data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h: In function 'flatbuffers_char_array_copy_from_pe':
/data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h:341:3: error: this 'for' clause does not guard... [-Werror=misleading-indentation]
  341 |   for (i = 0; i < n; ++i) N ## _copy_from_pe(&p[i], &p2[i]); return p; }\
      |   ^~~

An other option would have been to retrieve the following upstream
commit:
https://github.com/dvidelabs/flatcc/commit/f8c4140dd9dde61c86db751f6002def78754fced
but disabling -Werror is more future-proof

Fixes:
 - http://autobuild.buildroot.org/results/4d5cdddbfeefdeb943234b76eb08b04376f3c36d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1beb9784927d1a5402bcb16d618278d82c039459)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flatcc/flatcc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index c27809b86a..fcace691c0 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -10,6 +10,8 @@ FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
 FLATCC_INSTALL_STAGING = YES
 FLATCC_DEPENDENCIES = host-flatcc
+FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
+HOST_FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 
 # Disable build of tests and samples
 FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
