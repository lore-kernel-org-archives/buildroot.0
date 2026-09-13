Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA76BC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D5A80E56;
	Sun, 13 Sep 2026 07:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUtuEWu0ap7W; Sun, 13 Sep 2026 07:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 984AD80E32
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285961;
	b=kZrfYTkIJiXTPTWONg0QfpZSWAAyvTUndnTAY7i6+VPtrER8cEr8rMrU6Yl7pG+fwaPj
	 FSVKCxGgAwbHs4rSUtCgh4tfBqttJqbc1qpQkc/qAit6q/EOXaN87zsn3BCAYhEPlbKml
	 0xAtQROeIvYSKjEfMlvQhOXNudOG9/+F1XfjrNkuylh1YS8ssmGNqK/ytf2ANIyej8/pG
	 I/95n0YWkCrk4Euv/lP0/pDnNmj+JUgaX1WikTcHlFM1Rr3Pkj8A3MU0s/vCeYlC4oLcn
	 cgloy5DUuVEU735Wmpy8zzB6ZILrNIFjj8etf7qF3Lg87AqnN2gCIt0Azw7tENqHS0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dxVRwxUHY/2QVZ/awGrLQM5F2+MKrZMQ1eK49pFWBqU=;
	b=aBkSgDS0/YNJsx/d5alsBOS725ie/E/WPd7yIENLQ7AXdAuJI2BiFD+ZlnBJRbircGLH
	 mSn7CTXD493woehxftUyWGosvQEMZDjraE26yBqWgc48UhFRH8NgcDw/lCWtosRPZkPw9
	 EiAiG7ZHkpeNzRR8vRG0JF5h5p0udvVszQjnqWFu6KgE1Z++bfNnNpGv1b7VwhM6Jwihl
	 AmS80Ikhf+nCiA/mqv656Lg9CWGycq8eFEbm48sBAoT12nL2ZSPMgMJxsydIcas0z5Q7E
	 JKjP2n1VB2Frx4arQ0fU/S6Pkx8+9uRlTfiO/UQRjJIziLzIvsaeHdHkg/PJEIvPwWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285961;
	bh=dxVRwxUHY/2QVZ/awGrLQM5F2+MKrZMQ1eK49pFWBqU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gwEATq8F5OUx5xhpbZBPFj+Ez/NgZZqVEDZX5ib/juitsF2Q6XtytUC/qD0zfQZ8A
	 MriiRC00whJSbc57t/s1Bl8ovqyv2aQVmoj6vLU9vhtuBcO7eZfGubfA6wmVhL1G3v
	 LvA4JiyY0xSnSnDeZ/8MsN6IJlkx/iQ1ltba9j1QoPdOgxu/NN6Accti2pAfZEWWKT
	 sdhDq3stLVi8/Jm5PnBm2DTdNtxwX7isdo4porg09BeiqDs1Ulfm0jG0TtPsHKkoib
	 AeLosmEsSPr6b6PrGdUzlgFhRBBqeXSl9svvVkafq+gmvcy81/50DYROQbSszBbOBA
	 HvM2WYB4EaZXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984AD80E32;
	Sun, 13 Sep 2026 07:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 089CB109
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E325B605EF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxgpSkXHS2mv for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:52:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D388960607
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285959;
 b=d/ggXqTQWB1PPevmKry/NnqfMtNOOgu2zeLhJ/IXcqxbzCsg0rc9pK+rk6KWBuGDQnL+
 J8Omy8CzMbrgeAtLwzlklwkYs0Aqai0nsGh4F7EdnRGWIC+RRLzS4RJEHfU9aqzMcSCc9
 7u+eJV0MZriaVukUK0UyQYcsP+JijAjTo4rlh9zpPt5czPxoRo5gZQH0KTjb8uZ3FrdfW
 LdKLAyYimyBxvDbj9PSK33kHWccXxwagWL+DZZRhFkalJ493C+u2rPdH2QISO+/kKE5Dp
 RQWkNCp7Y1sDGoj4xz3Fxr5QP/n33WkjZmMqwl+t0YxO6YazH1plyV6MdmFRYTNngiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285959;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=Uj48fX8MdsKk/dLGKyW2X5PnRmcaxyV+Bn8mxg3xe74=;
 b=mM2yZiILs+2fu/xDWSYGwis2QmxAcgCa1CZ47TT01u1Na8JNyCDE/KSMz78diIipW1EZ
 8N+gGf883D8M9D8SKekK7zsUJ/RqQfMDwLNfGyHJmlID/MeeKjEO1Dj1HkYZLqxmExu2W
 yKV2OoFXhKgWrRLdG7UdR8FeMg3IGjD7WCi+Tc36vFGd/vymNx+17Ti76vTMK0Uu/YriF
 /IXp5X1j/3V4SErbnjlg6ORcF4kXtVZZGGCgodix0tLyhLXuWV7PtDVA6q9RbmWxBUAzM
 9xwODSLPy5jhI39fiN6JrJFuJsLFr5t5qWrK9aqHs9fxPqWGCPL5ThK5oTnBGxBeqxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D388960607
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789285956; bh=7lATgwS9lnW7mPyVnVEh9DHuXlQIcnxA+zrASNCPutw=;
 h=Date:From:To:Subject:From;
 b=Ub9cqnoiL1VfTJAk/xvsQ1Xb/yGc2S6hkdfHcsSuIDoaDdrgGRSlLPffi0XBVMTjM
 deFTy9sXdDLW1cy6x/GiWqFKMQcQl0+Vi4ccoEW4XCKOX4R88knlz7bL43JlNeOw0E
 F53bWvxjjkrKh9Q889Z8lQjfPfPBModqR0DtEkl8iouEO4AvYgIICGkVlTYS2RHhMV
 4u8DWC/zWXn7M9oZPDhJ3AoqMifwsvoBQyZWKO17VFe2OjFS/d9TKzJqF6KLwri+JX
 SW3se1gt9YeuQ75iiio9kpTXWef+sy+QtqoetfHT5jqmkJb8KhI2tIs8mCP+gbEDLz
 rAqUNbAcJnx/A==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5FB8D31E0BBE; Sun, 13 Sep 2026 09:52:36 +0200 (CEST)
Date: Sun, 13 Sep 2026 09:52:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aqZWRD3zV37x5UzL@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/nim: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nim is a statically typed compiled systems programming language. It
combines successful concepts from mature languages like Python, Ada and
Modula. See https://nim-lang.org/ for more information.

This is a host-only package required for the new chawan package.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS           |  1 +
 package/nim/nim.hash |  3 +++
 package/nim/nim.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/nim/nim.hash
 create mode 100644 package/nim/nim.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 780577f091..f0d6753fdf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3466,6 +3466,7 @@ F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
+F:	package/nim/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
diff --git a/package/nim/nim.hash b/package/nim/nim.hash
new file mode 100644
index 0000000000..c455ab91a9
--- /dev/null
+++ b/package/nim/nim.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2639a06a5ea7a7fcf57df1e7e1ef4d1b2bee58c7ac9bd00dbd2aa5bea1e5a56a  nim-2.2.12.tar.xz
+sha256  1ef33f7376a2e4b4c090fcaa42d8a206c19bc70d8d816665ff983bc14c5fe159  copying.txt
diff --git a/package/nim/nim.mk b/package/nim/nim.mk
new file mode 100644
index 0000000000..b9a83e4939
--- /dev/null
+++ b/package/nim/nim.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nim
+#
+################################################################################
+
+NIM_VERSION = 2.2.12
+NIM_SITE = https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/
+NIM_SOURCE = nim-$(NIM_VERSION).tar.xz
+NIM_LICENSE = MIT
+NIM_LICENSE_FILES = copying.txt
+
+define HOST_NIM_BUILD_CMDS
+	($(HOST_MAKE_ENV) cd $(@D) && ./build.sh)
+endef
+
+define HOST_NIM_INSTALL_CMDS
+	cp $(@D)/bin/nim $(HOST_DIR)/bin
+	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib
+endef
+
+$(eval $(host-generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
