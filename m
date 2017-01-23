From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 23 Jan 2017 11:51:16 -0200
Subject: [Buildroot] [PATCH] python-lxml: allow build as host package
Message-ID: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While currently there is no in-tree Buildroot package which depends on
host-python-lxml, we (DATACOM) have some proprietary modules that use it
in their test scripts.

We tested python-lxml as host package and confirmed that it builds and
works correctly. Someone else might require it, so we are proposing its
inclusion.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

---
Additional background (DATACOM-specific): so far we circumvent the lack
of host-python-lxml invoking python with an absolute path in the tests
(/usr/bin/python) but this forces us to install python-lxml on all build
hosts and developer workstations.

Change-Id: If51b034e9579e938a4e7470a58689d7eb34a6a3f
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/python-lxml/python-lxml.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 62c2980..22287b9 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -27,5 +27,9 @@ PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
 PYTHON_LXML_BUILD_OPTS = \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+HOST_PYTHON_LXML_BUILD_OPTS = \
+	--with-xslt-config=$(HOST_DIR)/usr/bin/xslt-config \
+	--with-xml2-config=$(HOST_DIR)/usr/bin/xml2-config
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.7.4
