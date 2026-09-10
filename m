Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6E6C79FBF
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E095C40B5D;
	Thu, 10 Sep 2026 18:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldprKLgVhiYO; Thu, 10 Sep 2026 18:51:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 056C040B65
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789066301;
	b=DqlP2jixYhadKOAjrSF3zyme4MAWgu65btsXLF6jNBNvl4DW/VMmQDePenl1fLzRWcNC
	 uEk4neifoV5W9mOwCn+FWv4CfbaZPcga2pEiAUFH5+QSbFChEV6JBL8gOA4QP2Y2vII5s
	 m6RwbvGHzNDQuiLq3XZXETG2St5XnxdwYkiTwzyYQLF/4iduLWsEjQLF0TlNgEcwxiZmS
	 GhHXXMG8KMlfBng5cYFvd5GUivorNJ9+20084edNdm6YXv6XBFzCIWwdrOdKaoP/bxKi6
	 q96K9BzvHmZEmBAGD74vWUgOKuT+TYR9VhdQIYFAi3zapXIyL4xO3+2/H+YHstY1w3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789066301;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p33L4eBL+Ra4sRj577qMrLM0uh3YB4bxf+qSbSI+o38=;
	b=UirA6+XPEBVOoSrsW+ZqNdorI/zOv4qYpuXu3qNYslwtvVkc8tBPGCfE6TTFdB+jCD56
	 e3bfiqAVEjkfSTSymlc9Q9MR7+p216U4KKFq1t5zJbVVyqwUqEnqxV3umlJK6cgMVt3sB
	 DbjGpwvIyL3oFy5WD4VFDsLVnWEWSYxmJ+HeqwFc4rz7QTQlSUPJgDX7nfhvjPSTfAe5U
	 jhdq8/KK8DLl0bMlxYydk03IQSRsg66p4ToDyC3J3GRZlg2xhySI0ymwySGgVjcl7aUQY
	 srdVRuKJoCvsfoxKrb4emi3v/ctMXjlp/nckMyvXvopCXTnltkc5sSNETXNmzOVyNoA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789066301;
	bh=p33L4eBL+Ra4sRj577qMrLM0uh3YB4bxf+qSbSI+o38=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N5XesddY/hrUHmHd/WCUXuhF6bwzf0gOGyqvadMM8RexiXNQMQiT68k2LOs44uXti
	 eg9YV1+Si+jem5ygupursxlwkuhlzpRcPzGghk+qkYywo3EW2X2y9frqf2PUtSZTcd
	 1Z3WaG5jglx4kUrqgrV01h6S84JkmwIIbEnlpF59tSXETssN2v/bdt+vtEeCqrhKLj
	 en49VlNPs7i9exmnwVew99bUkVph5YHLoqlD+4xENFRFearaUOCaqA1obettDl5hxY
	 osyOekzNFqGH/XTqq3OtpUaT/ir1ONxL6KT//hJMs+7MDqPniyT7cFea3lourRJ15n
	 /wu7rgYhdqRFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056C040B65;
	Thu, 10 Sep 2026 18:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AC2314D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 503F860BCA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybz3P9jOu-ne for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 18:51:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8C05460BA1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789066298;
 b=mhAl+RZbJDW0dUcXqEYkS/EkXye9uXKN2zWYN0ObFpWY+8JapAp2D3N1ADw+ZAWWjnxd
 QWIB6AmKHa7Tq2PhLrWN5XI6XJn18yF4ZUQalQpSEIkKpkG6BpKhBFiygJ8DRutxsatzY
 Bo8NbkzGBXN5z34vvArLReZ3HUcovp7MIltnGy/8UxFIYAPVZP3P+X8CZLQNxijQS5LO+
 sZGVQOB69yPXuCZXILhJQxZRcRDQZCtBBjKOOLzJ2IdJdGyx9koY7MOSzoX5u3qaNBqr6
 cV+pYeZkDNSpynSZblg9dkXyyCBZgrBxXkGuEB4vHYGLYZG41YVYMsAoduOUq2jixOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789066298;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ScQWGM05Qgzz5T6BrU/SCNSesT7UcWjC8HmcNNJitIM=;
 b=NifIluJlzgE3QfRtyWzyX3QjtuvwTRqLF8Uv0lkbTjG/mOJ7EvzP906BK/p0/vCu7zB7
 5PIvVsThg8ODNEngnVL1P6I5uUtrNYw0UQWKrxaQUjs3khyDKbWUsSXOQ64QbKGjLyyqP
 naR53ICx4xuzQF3+qXvhUebEDi9e2658QNfhGC8CTS7hL/nI5WDtQ95R3eDpf1AunF0Ty
 JNWaZLsexWx2uNktQAZ8PdjDKXTFPtu4kePax0AIPzkMdKUcW/GeR/wTWt5ggegS8B1xA
 DUDpsmpWHh1naNUDELJCbmVqkI96BOAnedh2BZvfbGbbRsW+80FeZFOWpjqsmP7JwvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C05460BA1
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:51:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3048934E9; Thu, 10 Sep 2026 18:50:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 20:47:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 664db5d62c952f69f5cefe91a88ba9f107cd0b5b
X-Git-Newrev: 7458d2323aaacf504e0bf8316c8413446a41aa84
X-Patchwork-Hint: ignore
Message-Id: <20260910185034.F3048934E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: security bump to version
 3.18.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7458d2323aaacf504e0bf8316c8413446a41aa84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 0274d179fb..ff8132fd22 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  55a97cfd8661a9b42ff0123b44af52cac49feaec36987f4d968c046f93b42e1d  libfuse3-3.18.2.tar.gz
+sha256  a26f46edc8db4e2cbf1b46d36d3e18ea208871671e56434d9ceb8f7887a690d2  libfuse3-3.18.3.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 5492d997c3..fed8ce9b83 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.2
+LIBFUSE3_VERSION = 3.18.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
