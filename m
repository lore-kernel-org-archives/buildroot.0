From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 May 2017 09:13:49 +0200
Subject: [Buildroot] [git commit] docker-engine: fix journald logging driver
Message-ID: <20170530071504.01C7682290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93c757133496f54168ddcf21452bb92b54242d9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Docker engine can optionally log to systemd-journald. For this
driver to work correctly, Docker needs to build against
systemd-journald's client library.

This patch conditionally adds a build-time dependency on systemd and
enables compiling the journald driver in docker-engine if systemd is
used as the Buildroot init process.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
