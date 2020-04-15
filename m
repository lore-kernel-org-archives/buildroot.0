From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:42 +0100
Subject: [Buildroot] [PATCH v2 1/5] support/docker: Update to
 debian:buster-20200327
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Message-ID: <20200415164846.122126-2-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the test container to debian:buster-20200327, because it
contains the openssh-server package v7.9, which provides an updated
ssh-keygen (since v7.6).

Specifically, the host key generation function in openssh-server v7.6
onwards now accepts a flag that allows us to specify a host tree prefix,
instead of trying to create SSH host keys in /. This allows us to create
SSH host keys and therefore run an SSH server as a non-root user. For
example, to create host keys in `prefix/host/etc/ssh`:

	ssh-keygen -A -f prefix/host

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 support/docker/Dockerfile       | 2 +-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 03acde85d2..be795a18b4 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:stretch-20171210
+FROM debian:buster-20200327
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 789fb8fc17..c13c4d03c4 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20171210T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
+# Latest just before 20200327T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20200326T221821Z/ buster main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20200326T221821Z/ buster-updates main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20200316T220151Z/ buster/updates main
-- 
2.20.1
