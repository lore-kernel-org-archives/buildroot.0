From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 10:17:57 +0200
Subject: [Buildroot] [git commit] bash: fix static build
Message-ID: <20130813082128.8AAE19B2B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e0f48c83158655ae737c89df618c5c79294f682
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The static build needs some trickery, so make it happen. Fixes:
http://autobuild.buildroot.net/results/2b12868f8297a96d7abf7fcf526ca5eace73d66d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/bash.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d51e203..efd2334 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -16,6 +16,11 @@ BASH_CONF_ENV +=                       \
    bash_cv_func_sigsetjmp=present      \
    bash_cv_printf_a_format=yes
 
+# The static build needs some trickery
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+BASH_CONF_OPT += --enable-static-link --without-bash-malloc
+endif
+
 # Make sure we build after busybox so that /bin/sh links to bash
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BASH_DEPENDENCIES += busybox
