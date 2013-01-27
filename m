From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Jan 2013 23:42:55 +0100
Subject: [Buildroot] [PATCH] Fix PYC-only installation for Python3
In-Reply-To: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
References: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
Message-ID: <5105AD6F.4070105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/13 20:03, Daniel Nelson wrote:
> All,
> 
> This is my first buildroot/open source submission. I'd appreciate some feedback.
> 
> Python3 changes the behavior of .pyc caching, breaking the PYC-only option in buildroot. The details are inhttp://www.python.org/dev/peps/pep-3147
> 
> I've added a configure flag to Python3, and corresponding logic in buildroot.

 Hasn't this been fixed in git 6ffab129 ?

 Regards,
 Arnout

commit 6ffab129a3ebc76caf7ae40caf1f6b0185f3e114
Author: Maxime Ripard <maxime.ripard@free-electrons.com>
Date:   Fri Jan 18 04:06:14 2013 +0000

    python3: Handle properly the pyc and py files on the target
    
    Fixes #5690
    
    Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
    Acked-by: Samuel Martin <s.martin49@gmail.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0d54162..e7c0983 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -155,5 +155,27 @@ endef
 ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
+define PYTHON3_REMOVE_MODULES_FILES
+       for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+                -name __pycache__` ; do \
+               rm -rf $$i ; \
+       done
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
+define PYTHON3_REMOVE_MODULES_FILES
+       for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+                -name *.py` ; do \
+               rm -f $$i ; \
+       done
+endef
+endif
+
+PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_MODULES_FILES
+
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
