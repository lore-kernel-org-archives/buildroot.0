From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:24:11 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] test_docker_compose.py:
 Test the volume mount feature
Message-ID: <20210517185730.38BA57F88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4ee7144ac6be2ed398a6933c6da2fafc20963a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Extend docker_compose_test() to expose /bin on the host to the container
through a volume mount and verify that /bin/busybox can be downloaded and
contains the right data.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa31d10808df0560cc9e9b92acadad1af9a041e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/docker-compose.yml              | 4 +++-
 support/testing/tests/package/test_docker_compose.py | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
index de33251dfd..ce89d79b59 100644
--- a/support/testing/conf/docker-compose.yml
+++ b/support/testing/conf/docker-compose.yml
@@ -2,6 +2,8 @@ version: '3'
 services:
   busybox:
     image: "busybox:latest"
-    command: httpd -f -h /etc/
+    command: httpd -f -h /www/
     ports:
       - "80:80"
+    volumes:
+      - "/bin:/www"
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 364f75b5b0..737dbf393c 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -45,7 +45,8 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.assertRunOk('docker-compose up -d', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
-        self.assertRunOk('wget http://127.0.0.1/resolv.conf', 120)
+        self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
+        self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
     def test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
