From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 19:48:37 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/docker-containerd: security bump to 1.2.11
Message-ID: <20200110193548.404EA887A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe29bfc2f1fd60f47905871a3a8406d8ad540fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security vulnerabilities:

containerd 1.2.9/gRPC:

- CVE-2019-9512: Some HTTP/2 implementations are vulnerable to ping floods,
  potentially leading to a denial of service.  The attacker sends continual
  pings to an HTTP/2 peer, causing the peer to build an internal queue of
  responses.  Depending on how efficiently this data is queued, this can
  consume excess CPU, memory, or both

- CVE-2019-9514: Some HTTP/2 implementations are vulnerable to a reset
  flood, potentially leading to a denial of service.  The attacker opens a
  number of streams and sends an invalid request over each stream that
  should solicit a stream of RST_STREAM frames from the peer.  Depending on
  how the peer queues the RST_STREAM frames, this can consume excess memory,
  CPU, or both

- CVE-2019-9515: Some HTTP/2 implementations are vulnerable to a settings
  flood, potentially leading to a denial of service.  The attacker sends a
  stream of SETTINGS frames to the peer.  Since the RFC requires that the
  peer reply with one acknowledgement per SETTINGS frame, an empty SETTINGS
  frame is almost equivalent in behavior to a ping.  Depending on how
  efficiently this data is queued, this can consume excess CPU, memory, or
  both

containerd 1.2.10/runc:

- CVE-2019-16884: runc through 1.0.0-rc8, as used in Docker through
  19.03.2-ce and other products, allows AppArmor restriction bypass because
  libcontainer/rootfs_linux.go incorrectly checks mount targets, and thus a
  malicious Docker image can mount over a /proc director

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f40f2bae81b352dcd06902fbb3755313be67b622)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 2e275dd81e..aad74089e9 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	f2d578b743fb9faa5b3477b7cf4b33d00501087043a53b27754f14bbe741f891  docker-containerd-1.2.6.tar.gz
-sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
+sha256	6a4192fced10c390373adfa9fa9a4f12fe9f38bde580d90468a79ed6c8af75ee  docker-containerd-1.2.11.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 22480d1df8..69068e44f8 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.6
+DOCKER_CONTAINERD_VERSION = 1.2.11
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
