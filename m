From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 00:28:49 +0200
Subject: [Buildroot] [PATCH 1/2] .gitlab-ci.yml: switch to a working Debian
	mirror
Message-ID: <20170701222850.2215-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the Docker Debian image uses deb.debian.net as a source of
packages. This URL points alternatively to Fastly or Amazon
Cloudfront. However, the later has proven to not be reliable, and
cause a lot of:

  503  Service Temporarily Unavailable [IP: 52.84.128.219 80]

when installing Debian packages.

By using cdn-fastly.deb.debian.org instead, we force to use Fastly,
which seems to work much more reliably.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 1 +
 .gitlab-ci.yml.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6bd9837..0980ee2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,6 +8,7 @@ image: debian:stable
 
 before_script:
     - dpkg --add-architecture i386
+    - sed -i 's%deb.debian.org%cdn-fastly.deb.debian.org%' /etc/apt/sources.list
     # The container has no package lists, so need to update first
     - apt-get update -qq
     - apt-get install -y -qq --no-install-recommends
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0855bff..aed24e1 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -8,6 +8,7 @@ image: debian:stable
 
 before_script:
     - dpkg --add-architecture i386
+    - sed -i 's%deb.debian.org%cdn-fastly.deb.debian.org%' /etc/apt/sources.list
     # The container has no package lists, so need to update first
     - apt-get update -qq
     - apt-get install -y -qq --no-install-recommends
-- 
2.9.4
