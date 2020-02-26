From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 23:19:11 +0100
Subject: [Buildroot] [PATCH] package/docker-compose: update patch to allow
 all pyyaml 5.x versions
Message-ID: <20200226221911.9177-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent bump of python-pyyaml to version 5.3 causes a runtime failure in docker-compose:

pkg_resources.ContextualVersionConflict: (PyYAML 5.3 (/usr/lib/python3.8/site-packages), Requirement.parse('PyYAML<5.2,>=3.10'), {'docker-compose'})

https://gitlab.com/buildroot.org/buildroot/-/jobs/442151461

Fix it by adjusting 0003-support-PyYAML-up-to-5.1-version.patch to allow all
pyyaml 5.x versions, similar to what upstream has done post-1.24.1:

https://github.com/docker/compose/commit/c818bfc62c0574009175d832c1a8a2857bf1b1bf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../docker-compose/0003-support-PyYAML-up-to-5.1-version.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch b/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
index ae91b01d03..ecbd197a51 100644
--- a/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
+++ b/package/docker-compose/0003-support-PyYAML-up-to-5.1-version.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] support PyYAML up to 5.1 version
 Signed-off-by: Sergey Fursov <geyser85@gmail.com>
 [Upstream: https://github.com/docker/compose/pull/6623]
 (cherry picked from commit d2ca096f46a56cd4db494c593ed84e5c255dc15d)
+[Peter: allow all 5.x]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  requirements.txt | 2 +-
@@ -34,7 +35,7 @@ index c9e4729d..17ab678e 100644
      'cached-property >= 1.2.0, < 2',
      'docopt >= 0.6.1, < 1',
 -    'PyYAML >= 3.10, < 5',
-+    'PyYAML >= 3.10, < 5.2',
++    'PyYAML >= 3.10, < 6',
      'requests >= 2.20.0, < 3',
      'texttable >= 0.9.0, < 2',
      'websocket-client >= 0.32.0, < 1',
-- 
2.20.1
