From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  1 Feb 2017 15:51:08 -0200
Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
In-Reply-To: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
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
Changes v1->v2:
- Add explicit host package dependencies, as required after commit
  4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0 (infra: remove auto
  derivation of host dependencies).

Additional background (DATACOM-specific): so far we circumvent the lack
of host-python-lxml invoking python with an absolute path in the tests
(/usr/bin/python) but this forces us to install python-lxml on all build
hosts and developer workstations.

Change-Id: If51b034e9579e938a4e7470a58689d7eb34a6a3f
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/python-lxml/python-lxml.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 62c2980..977ec5f 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -21,11 +21,16 @@ PYTHON_LXML_LICENSE_FILES = \
 PYTHON_LXML_SETUP_TYPE = setuptools
 
 PYTHON_LXML_DEPENDENCIES = libxml2 libxslt zlib
+HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 
 # python-lxml needs these scripts in order to properly detect libxml2 and
 # libxslt compiler and linker flags
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
