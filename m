From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:22:21 +0200
Subject: [Buildroot] [git commit] package/fetchmail: fix *.pyc compilation
	with python-3
Message-ID: <20160608212232.1798381F6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a890032596aa5e6afbfdbcccc01fcb07c9a4ef8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change removes the fetchmailconf.py python module when the python
interpreter is python-3, because this module is not yet python-3
compliant.

Fixes:
  http://autobuild.buildroot.org/results/700/7009445dd116a1c02db82a351d38db44db8dad16/
  ...

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/fetchmail.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index a198dc5..5cae0e2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -23,4 +23,14 @@ FETCHMAIL_DEPENDENCIES = \
 	openssl \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
+# fetchmailconf.py script is not (yet) python3-compliant.
+# Prevent the pyc-compilation with python-3 from failing by removing this
+# non-critical script.
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+define FETCHMAIL_REMOVE_FETCHMAILCONF_PY
+	$(RM) -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/fetchmailconf.py
+endef
+FETCHMAIL_POST_TARGET_INSTALL_HOOKS += FETCHMAIL_REMOVE_FETCHMAILCONF_PY
+endif
+
 $(eval $(autotools-package))
