From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:49:13 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] core/reproducible: do not
 override SOURCE_DATE_EPOCH
Message-ID: <20171126213854.EED3B81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ecf38cb2fa82ccbfdcb60fd4115e494feda2733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

SOURCE_DATE_EPOCH is currently forcibly set (to either the git commit
date, or the last release date).

However, the spec mandates that it should not be modified if already
set: https://reproducible-builds.org/specs/source-date-epoch/

    Build systems MUST NOT overwrite this variable for child
    processes to consume if it is already present.

Abide by the rule, and only set it if not already set.

This will allow users to pass it from an upper-layer buildsystem (e.g. a
jenkins or gitlab-ci job, for example), when they have a reson to do so.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Reported-by: Einar J??n Gunnarsson <tolvupostur@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Einar J??n Gunnarsson <tolvupostur@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0437d2f8f6ef8c10b529c154f4534453ce34607b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eb02092..39db0c1 100644
--- a/Makefile
+++ b/Makefile
@@ -254,7 +254,7 @@ export LANG = C
 export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
-export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
+export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 DEPENDENCIES_HOST_PREREQ += host-fakedate
 endif
 
