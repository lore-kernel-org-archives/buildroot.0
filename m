From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 23:03:52 +0200
Subject: [Buildroot] [PATCH 2/3] test_docker_compose.py: Test the port
 publish feature
In-Reply-To: <20210513210353.11335-1-peter@korsgaard.com>
References: <20210513210353.11335-1-peter@korsgaard.com>
Message-ID: <20210513210353.11335-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend docker_test() to expose a random (8888) port to verify that doesn't
fail, and extend the docker-compose test to run the busybox httpd in the
background, expose that as port 80 and verify that /etc/resolv.conf could be
fetched by wget.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/docker-compose.yml              | 3 +++
 support/testing/tests/package/test_docker_compose.py | 8 +++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
index 49ff2677da..de33251dfd 100644
--- a/support/testing/conf/docker-compose.yml
+++ b/support/testing/conf/docker-compose.yml
@@ -2,3 +2,6 @@ version: '3'
 services:
   busybox:
     image: "busybox:latest"
+    command: httpd -f -h /etc/
+    ports:
+      - "80:80"
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 67ee795f21..364f75b5b0 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -37,13 +37,15 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_test(self):
         # will download container if not available, which may take some time
-        _, exit_code = self.emulator.run('docker run --rm busybox:latest /bin/true', 120)
+        _, exit_code = self.emulator.run('docker run --rm -p 8888:8888 busybox:latest /bin/true', 120)
         self.assertEqual(exit_code, 0)
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        _, exit_code = self.emulator.run('docker-compose up', 120)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk('docker-compose up -d', 120)
+        # container may take some time to start
+        self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
+        self.assertRunOk('wget http://127.0.0.1/resolv.conf', 120)
 
     def test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
-- 
2.20.1
