From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 22 Jul 2015 16:13:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/qpid-proton: disable languages
	bindings
In-Reply-To: <1437574390-31175-1-git-send-email-romain.naour@openwide.fr>
References: <1437574390-31175-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437574390-31175-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (workaround):
http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---

Hi Luca,

The dependency on host-swig is missing in qpid-proton package.
Therefore languages bindings are enabled when the swig tool is found, but
for each languages bindings the target package dependency is missing.

The build failure [1] occurs only when host-swig is available *and* python
target package is build before qpid-proton.

Is it ok for you to disable all bindings ?

Best regards,
Romain

[1] http://autobuild.buildroot.net/results/eff/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/
---
 package/qpid-proton/qpid-proton.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index 12fddb4..2e8c1d0 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -15,8 +15,15 @@ QPID_PROTON_DEPENDENCIES = \
 	util-linux \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 
+# Language bindings are enabled when host-swig tool is present in HOST_DIR.
+# For now, disable all of them.
 QPID_PROTON_CONF_OPTS = \
 	-DBUILD_JAVA=OFF \
+	-DBUILD_JAVASCRIPT=OFF \
+	-DBUILD_PERL=OFF \
+	-DBUILD_PHP=OFF \
+	-DBUILD_PYTHON=OFF \
+	-DBUILD_RUBY=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2
-- 
2.4.3
