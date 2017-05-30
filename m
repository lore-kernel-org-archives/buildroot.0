From: Christian Stewart <christian@paral.in>
Date: Mon, 29 May 2017 20:50:04 -0700
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix journald logging driver
Message-ID: <20170530035004.28855-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Docker engine can optionally log to systemd-journald. For this
driver to work correctly, Docker needs to build against
systemd-journald's client library.

This patch conditionally adds a build-time dependency on systemd and
enables compiling the journald driver in docker-engine if systemd is
used as the Buildroot init process.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c4c1157..0176f51 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -42,6 +42,11 @@ DOCKER_ENGINE_BUILD_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+DOCKER_ENGINE_BUILD_TAGS += journald
+DOCKER_ENGINE_DEPENDENCIES += systemd
+endif
+
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 DOCKER_ENGINE_BUILD_TAGS += daemon
 DOCKER_ENGINE_BUILD_TARGETS += dockerd
-- 
2.10.2
