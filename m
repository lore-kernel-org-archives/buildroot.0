Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578BC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B649983A45;
	Wed,  7 Feb 2024 08:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CowLs7yfkman; Wed,  7 Feb 2024 08:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F0183A49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F0183A49;
	Wed,  7 Feb 2024 08:50:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 506CC1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA244094F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOnhn153w7zS for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1796140921
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1796140921
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A7DC874F4; Wed,  7 Feb 2024 08:50:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 09:50:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0b5beea44005a38ab563067fedbe27a0c015cd5
X-Git-Newrev: 39aaf091ae0a88a7f84c50d52aff84c36caeadaa
X-Patchwork-Hint: ignore
Message-Id: <20240207085040.0A7DC874F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: introduce linux mm
 tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39aaf091ae0a88a7f84c50d52aff84c36caeadaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolset was designed to facilitate the testing, monitoring, and
tracing of various things with virtual memory, pages, and slab objects.
It is an invaluable resource for identifying and analyzing
memory-related issues, such as leaks and bottlenecks, and can greatly
enhance one's understanding of memory utilization within a system.

The mm toolset includes:
    - page_owner_sort: userspace helper to sort the output of
      /sys/kernel/debug/page_owner, which helps to know who allocates
      the page from kernel context
    - slabinfo: the tool which gets reports about slabs, for example
      show empty slabs, modify of slab debug options at runtime, display
      all information about a slabcache
    - page-types: a handy tool for querying page flags

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
[yann.morin.1998@free.fr:
  - don't depend on linux, already a patch dependency
  - don't set CC: default is based on CROSS_COMPILE
  - no need to fully recheck at install time
  - move the option for alphabetical ordering
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/Config.in           | 19 +++++++++++++++++
 package/linux-tools/linux-tool-mm.mk.in | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index fb158f84d4..5a38f6dafe 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -38,6 +38,25 @@ config BR2_PACKAGE_LINUX_TOOLS_IIO
 
 	  These tools are available only from kernel version 4.7.
 
+config BR2_PACKAGE_LINUX_TOOLS_MM
+	bool "mm"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs
+	  objects.
+
+	  - page_owner_sort: userspace helper to sort the output of
+	  /sys/kernel/debug/page_owner, which helps to know who
+	  allocates the page from kernel context
+
+	  - slabinfo: the tool which gets reports about slabs, for
+	  example show empty slabs, modify of slab debug options at
+	  runtime, display all information about a slabcache
+
+	  - page-types: a handy tool for querying page flags
+
+	  These tools are available only from kernel version 3.4.
+
 config BR2_PACKAGE_LINUX_TOOLS_PCI
 	bool "pci"
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
new file mode 100644
index 0000000000..b2ec090fc0
--- /dev/null
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -0,0 +1,37 @@
+################################################################################
+#
+# mm
+#
+################################################################################
+
+LINUX_TOOLS += mm
+
+define MM_BUILD_CMDS
+	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+		MM_SUBDIR=vm; \
+	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
+		MM_SUBDIR=mm; \
+	else \
+		echo "Your kernel version is too old and does not have the mm tool." ; \
+		echo "At least kernel 3.4 must be used." ; \
+		exit 1 ; \
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR)/tools \
+		$(MM_MAKE_OPTS) $${MM_SUBDIR}
+endef
+
+# For install no need to recheck both cases: we know at least one
+# exists, because that was checked at build time already; we just
+# need to find which of the two: if not one, then the other.
+define MM_INSTALL_TARGET_CMDS
+	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+		MM_SUBDIR=vm; \
+	else \
+		MM_SUBDIR=mm; \
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(LINUX_MAKE_FLAGS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		$${MM_SUBDIR}_install
+endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
