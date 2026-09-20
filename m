Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA3BC982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02DA60661;
	Sun, 20 Sep 2026 10:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGbchu0rX3br; Sun, 20 Sep 2026 10:28:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF5F36063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789900124;
	b=nIpjoil1eu0Uh9YHjhyLfYbXVQoJBY72uWAmKF6UvkxxElJyf7dSdaQB1buB5/VKxX5/
	 KgeyNuDC4FUzDj40t5nqvHn6AisOuCuv23MzZFem0bJcBCfsiNTno2GJgVfIHkks+hIuA
	 hGNKMScvjSnkU1QLvVcwLezWNlFhFM9WZDzb/OJAEdWZaKkOZTbI3qX2O0uD6twfjzYO5
	 1mDPsNKWnDrrs28OwMt2J2YUcq0Z+aehNTHcgEZ1P8DR7hbk/qlxo+koQb7vamnYgfPpc
	 6ZZKx6NlCmrCDzEqUfCv7fzaQTIpq9BrC5otjFDRfAgv2VzI+G1SpCylr3D66eI9yUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789900124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ApI3LtNtMeWc70KAlINO2lxpwq2NpCe1qnIwNZyPTcE=;
	b=m65pWW56LEzrfzHhELbg2QhxOKenzDXVGqbf+DzGU4Y9k8ijwAk7tEeWQwoh+ojQb5XV
	 yH/pdO+VaFvF1iGnkc952m8LdPPtlVl7aN8pK5w0vUkPse7JEWFnT2Cu/5JFDMVOuru0J
	 k6A5L6f1Jr1PSsh1AHae7F6aq0Q3nJFPANkyo9YtYBYB6M8+Zp/NE8PA15F9+B41MgGQc
	 cV5oIyi7k1sunxWXBXq1mq3GTPxhBWHsl6TcV8PnoLbESNQ4ij0DLAhPjFGYhMx6eq0ee
	 16lIN2isaNLw7R9CxLCXPLfHnsVJnLjkkq2f52+n3qYXdD4GSl0/C/JKvh22RM+57TA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789900124;
	bh=ApI3LtNtMeWc70KAlINO2lxpwq2NpCe1qnIwNZyPTcE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fLG6rXpwQLBRWvzpp/8X9OLCYstsYWfzeDKiybPBR9N0rlsQMaVE+CSchMZgVUFgr
	 mjgHrIYvXxnKxfSMkPso5cngTIQfZfsVkwoj0vb3xwtwu97T4nJnexEOeODvgHuHmb
	 402jWdAefi4IuQ9GvJt9Nme1G5+J/Hs6h1zkPIDsfowsm3SyUhsZmU4l7M5eEhpBru
	 zkfPvnJOLFtS/poXhauAVKdnLM64o2gghDkENgyH0Dit5q+IsdWPQJU7AhRHpMi+Qg
	 D+BsPkFMsupuf+UUHI052TxryuG0F9L91CHjzne3ClnXyazWogd56XyYr21luKTHRC
	 SaDVUxPJL4lEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5F36063F;
	Sun, 20 Sep 2026 10:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C492C24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAA23407BA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9natg-Abfaq for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0480E4071F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789900121;
 b=OYcqVnRMSN++Q3TTtdpjb38nBj/lBWCYEL8bTAN94Frrc2x9CyjzOcWfhZRHttN8WxJG
 QmBg658AprgeVPKCKd1fzbvOzesW86Z1VBIDWYXjEGPCKO+w2XPPO8qGjwR8/Bh5G/TAR
 J8CXlkuG2LT3kGChsS/RVI1NseXPDpB2mx2LwCUnuAl2n5gnOT1vTyWt+SNFrVOAlzD/p
 sgcbWCfjMoAi6ukFnPRShX5fgLIBgsiuPxzXNtukE1mtLbQr1OFfro0AsjJzSKNRKmFhe
 Kd//SRL9zMaJJRVx2T/sS/PJgKzhjJHkMPjHjNt0VZ+3d26fYgCfZwvvfSJha2rwPMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789900121;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nYZq6qWDADsrAIZmr+wUPW0cmUKQJupHPPLJIWkcpCg=;
 b=aG8/8Y4ZSD9fVUib1Q8AUo7lGmWGbt5gvdgXaZNWElOgZklwoZY5jcOYhRa5hQTTtMHM
 M8j8PXFUWr/1nRpsO6uev7M9yoSOQVQ9vN9V66/j0iUab+0qIUDgsYFqwdy0w8/LuDEyI
 exIZxcFPCz5SmTf6mTM+RzEv3LKqLjTqohVm4BaMrSOLtOASRPoqzqqLSiBcGnghVMc6L
 ufVwYdPQE/zwcMn/R9eTnJv0NdNdg4TEoP1cbVe9gjRse0XhwmZpOc2D0AYsg33rxdNA6
 YZyyew42TzYfMA0aCQW+++gPH3fHrAIKRfAYbLOiEMwMzqKt82Xkwh7EsnczdpFUYtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0480E4071F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C008F8DAD0; Sun, 20 Sep 2026 10:27:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:26:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e073e5a5596dc0fef60aeef41e456ac52911a0a3
X-Git-Newrev: 1c78e85430023667fa0aedc5ba646df7fa6376b8
X-Patchwork-Hint: ignore
Message-Id: <20260920102732.C008F8DAD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump
 version to 23.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c78e85430023667fa0aedc5ba646df7fa6376b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v23.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index c511c79785..cc6a188eeb 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8d3d5c31c1ff355dbbf87046f1b94cd1ab5390439a817679ec71484df74cac18  spirv-llvm-translator-22.1.3.tar.gz
+sha256  9e0bf1beb0ab7edca6cd8c17fd9bbb7ce3dcd520f3e969e0485ff5b00931f929  spirv-llvm-translator-23.1.1.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 98e8f45037..21d0b2cf85 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.3
+SPIRV_LLVM_TRANSLATOR_VERSION = 23.1.1
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
