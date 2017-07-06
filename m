From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:27:52 +0200
Subject: [Buildroot] [git commit] python-jinja2: don't remove async files
	for Python 3
Message-ID: <20170706192429.95209800A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=845d3576a5054c4f691fd60a4071fa62f1f7f0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The needed functionality is already included into Python 3.6.x,
so these files can be now compiled without errors.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-jinja2/python-jinja2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 34342ab..c7dd490 100644
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
