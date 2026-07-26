Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59932C531CC
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 09:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D46D80D2D;
	Sun, 26 Jul 2026 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU991Ge7fhmA; Sun, 26 Jul 2026 09:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3233B80D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785058050;
	bh=6JnB1tQ88AtiXaocXmPW+dsnMKeeHhdRCyA6lBKY1Rc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Acjp2zrB3QvCkp04abfQ9fJCKfHtxCzrz8VkdoHNnSPAfDUTJoKtSdtlmqSYhsZdJ
	 4Q7RykCaNrG5lqwT5//kd+chBU8oJDxqUWQ8G4pJMVtqtFuofFgJZjyV6CMFdQeT3g
	 LQuSYqtFRM1QZh9fl0V6kNCvTneG+gRUAffxlfW4CE5Cuvi2Yg+rVaPHZx91Jkvw4M
	 XywM5t0W3/03+axdFdWpOHpu5bhZjBTFnhSFVvI+y7CiqM3ks7OQG0eq7l2vNXEGNj
	 uIh3+NIVKZxdpEA/+YzFQJomiR2BgnJUVQYfHrt65Vt67hRP618M6On/dcBqy+6z26
	 ZBOnBqvLQ8ivw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3233B80D1D;
	Sun, 26 Jul 2026 09:27:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61417490
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 477B66062C
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxlJF_VX-biT for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 09:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE8B560623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8B560623
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE8B560623
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 09:27:27 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67BB35FFB1;
 Sun, 26 Jul 2026 11:27:20 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 26 Jul 2026 11:27:10 +0200
Message-ID: <20260726092711.212660-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785058045;
 bh=tREJ2uGgyDv78LPvA2Idejb0zH6lK/a09vmoElZPs8k=;
 h=From:To:Cc:Subject:Date:From;
 b=I+THMq5F5bMw9OBLKUETRpsnY8QHBALrNm6ERuvjbZqH3jiyKoHmz6LFKlM33WOLZ
 AVOIYWonu0cS+9epXz2lj9GIeQxVxwidg66qs7RDCoD+ftsMT3u21MokZO7ye5PINC
 YuwvhG+IyQ+gQluVQUxxbeiTYiuFPpmAlkB5OHN9b9PXss/uI+gJhZjfqCVHNvP0hH
 QT4A0SyviV9geXo6/7ez43UkJUXR12AU9ozdEIg6GnsDntYnHbyTMjTII2mLz2Uoxa
 gXEnauJPXH2OFG3MGRuUQa5LuzJlrGdLVs3VdUTZoi1/kSOkFNz/e+4lOSOBj5Wiip
 K8Z5iQ8W1EYZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I+THMq5F
Subject: [Buildroot] [PATCH 1/2] package/python-pydal: needs python xml
 module at runtime
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
Cc: Julien Olivain <ju.o@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pyDAL is using xmlrpc at runtime. See:
https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydal/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index 204b47a09a..4ed2b934ac 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYDAL
 	bool "python-pydal"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
