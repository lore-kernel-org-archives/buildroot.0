From: Tal Shorer <tal.shorer@gmail.com>
Date: Mon, 12 Dec 2016 19:09:18 +0200
Subject: [Buildroot] [PATCH v2 1/2] package: linux-tools: allow tools to
	define configure hooks
In-Reply-To: <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
References: <CAFDyS3PkxwNSVxDRoK5Fe7fU+RxMrc126rUYYY9cGQXPrKSzBg@mail.gmail.com>
Message-ID: <1481562559-12526-1-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

define LINUX_TOOLS_POST_CONFIGURE_HOOKS. Similiar to other hooks in
this package, this hook loops over the configured tools and runs their
$(TOOL)_CONFIGURE_CMDS hook

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 package/linux-tools/linux-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 7fa8d19..1f752f3 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -31,6 +31,10 @@ LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
 
+LINUX_TOOLS_POST_CONFIGURE_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_CONFIGURE_CMDS))
+
 LINUX_TOOLS_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_BUILD_CMDS))
-- 
2.7.4
