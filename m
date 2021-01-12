From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 18:40:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tzdata: drop
 obosolete, legacy zic option -y
Message-ID: <20210112172411.478D380469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c676c2fc35c61923c07483a7692264ee6d21c277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The following commits:
  - 7868289fd534 package/zic: bump version to 2020f
  - c99374ecbb5e package/tzdata: bump version to 2020f

bumped the tzdata from version 2020a to 2020f. However, in 2020b, the
zic option '-y' was removed, and so was the yearistype.sh script [0].

This now spews annoying warnings:

    warning: -y ignored

Fortunately, it still consumes its argument, so the missing yearistype.sh
is simply ignored.

Drop that option.

[0] https://mm.icann.org/pipermail/tz-announce/2020-October/000059.html

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
(cherry picked from commit 7f78eef767baaeab7bbc008c599027a77b6d3169)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 41c4971584..04f5d84bf0 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -51,8 +51,8 @@ endef
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
-			$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
-			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
+			$(ZIC) -d _output/posix $$zone || exit 1; \
+			$(ZIC) -d _output/right -L leapseconds $$zone || exit 1; \
 		done; \
 	)
 endef
