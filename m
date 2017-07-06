From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Jul 2017 10:57:53 +0200
Subject: [Buildroot] [PATCH] python-jinja2: don't remove async files for
	Python 3
Message-ID: <20170706085753.14779-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

The needed functionality is already included into Python 3.6.x,
so these files can be now compiled without errors.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-jinja2/python-jinja2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 34342ab704..c7dd4902b0 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -17,11 +17,13 @@ HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 # not available in Python 2 and some features available in Python 3.6.
 # So in both cases *.py compilation would produce compiler errors.
 # Hence remove both files after package extraction.
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
 	rm $(@D)/jinja2/asyncsupport.py $(@D)/jinja2/asyncfilters.py
 endef
 
 PYTHON_JINJA2_POST_EXTRACT_HOOKS = PYTHON_JINJA2_REMOVE_ASYNC_SUPPORT
+endif
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.11.0
