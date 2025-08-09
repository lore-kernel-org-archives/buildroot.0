Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6101EC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD9660C0E;
	Sat,  9 Aug 2025 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XhUcV1I8xPm; Sat,  9 Aug 2025 17:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C40D60C2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C40D60C2E;
	Sat,  9 Aug 2025 17:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7199C1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 576EE81A12
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqAcFrWswBHF for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D132813F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D132813F3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:17:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E008707A; Sat,  9 Aug 2025 17:17:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 19:15:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 117ccb6cc41e3bf8f5b6ab50bcbf0d77cd845405
X-Git-Newrev: cbe67e4b115eeb7389906f73fe8345b22eacbf37
X-Patchwork-Hint: ignore
Message-Id: <20250809171731.91E008707A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: fix gcc-install-dir
 in clang
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1205114470342835726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1205114470342835726==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cbe67e4b115eeb7389906f73fe8345b22eacbf37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous method used to determine the --gcc-install-dir relied on
'ls' over the gcc installation path, which was fragile and failed in
cases where the external toolchain contained multiple gcc versions or
paths [1].

We replace it a more reliable approach using:
$(TARGET_CC) -print-search-dirs

This helps setup to register the desired GCC architecture if a
given toolchain packages includes multiple GCC architecture
installations. Which isn't possible using the actual method using 'ls'.

For example from James's report:

    └── /opt/container/my-toolchain-2025.01.01.12345/lib/gcc/
        ├── aarch64-example-linux-gnu/
        │   └── ...
        ├── i686-example-linux-gnu/
        │   └── ...
        └── x86_64-example-linux-gnu/
            └── ...

Thanks to Romain Naour for suggesting this improved method.

[1] https://lore.kernel.org/buildroot/d1c773dc-8346-4077-946a-0d3b4e30a6c8@smile.fr/T/#t

Reported by: James Knight <git@jdknight.me>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Tested-by: James Knight <jdknight@jdknight.me>
Tested-by: James Knight <git@jdknight.me>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/clang/clang.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index a5c8b990aa..2f17a04efc 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -115,8 +115,7 @@ CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 define HOST_CLANG_INSTALL_CONFIG_FILE
 	mkdir -p $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)
-	touch $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
-	echo "--gcc-install-dir=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/)/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/)/)" > $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
+	echo "--gcc-install-dir=$$($(TARGET_CC) -print-search-dirs | awk -F ': ' '$$1=="install" {print $$2}')" > $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
 	echo "--target=$(GNU_TARGET_NAME)" >> $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
 endef
 

--===============1205114470342835726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1205114470342835726==--
