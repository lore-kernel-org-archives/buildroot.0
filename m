From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 11 Jun 2019 23:26:35 +0200
Subject: [Buildroot] [PATCH 3/3] package/iputils: create ping6 symlink in
 post install hook
In-Reply-To: <20190611212635.24372-1-petr.vorel@gmail.com>
References: <20190611212635.24372-1-petr.vorel@gmail.com>
Message-ID: <20190611212635.24372-3-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/iputils/iputils/commit/ebad35fee3de851b809c7b72ccc654a72b6af61d

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
I'm sorry I wasn't able to verify this one.
But I see this warning:
Warning: target file "./usr/bin/arping" is touched by more than one package: [u'skeleton-init-common', u'iputils']

 package/iputils/iputils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 01d2388bab..eb592c3083 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -54,6 +54,12 @@ IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
+# upstream requires distros to create symlink
+define IPUTILS_CREATE_PING6_SYMLINK
+ln -sv $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+endef
+IPUTILS_POST_INSTALL_HOOKS = IPUTILS_CREATE_PING6_SYMLINK
+
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-- 
2.21.0
