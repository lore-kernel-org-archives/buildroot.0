Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D887AC00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5DE40442;
	Sat,  5 Aug 2023 21:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E5DE40442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yp8hXEpwVIkj; Sat,  5 Aug 2023 21:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B14B403F5;
	Sat,  5 Aug 2023 21:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B14B403F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EDEB1BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC0C541615
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0C541615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zS2r8sMpUaQW for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:52:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F936401F4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F936401F4
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA335A4C0C85;
 Sat,  5 Aug 2023 23:52:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSPC0-0003mb-1x;
 Sat, 05 Aug 2023 23:52:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:52:10 +0200
Message-Id: <20230805215212.3637412-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805215212.3637412-1-bernd@kuhls.net>
References: <20230805215212.3637412-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691272332;
 bh=mX3Ve5lLAcBC+dIH0SDj/qvYQbYr/lb3HKv0LcsJ4qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dSIuihZkhKfSq7YXh05vXaX7H/ClhIOql16wt7Lwb9NvUPFfv1Yhu1+qrUsxx/uAD
 wFDX09X5Hp4Y1Aba6VLm3RhydveRG4iX1lSJ9EjrdwK+WCaaUeL4XebVNU0uB3xN/3
 r4yC72dtIYkiF0DgeJ3a0bO2oLZ0VTqT7TRhAnwPo8ld6ScVDJsaAic9ysvwQX6OYh
 N3wcv5OXu2U8/Lc903eveRxwFCi7aX4cWwdAUmYQwNXDZKnzz7ePvgugUyEVpmxAxK
 sd76XtPYA2UyWuO7xO1rKLRm9Sqv7T/o8RvuCwgZrFEXzbKP07iMQJK5tERQUQzM1g
 WQVgSxjKU5BYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dSIuihZk
Subject: [Buildroot] [PATCH 2/4] package/fail2ban: switch from distutils to
 setuptools
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Thijs Vermeir <thijsvermeir@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fail2ban/fail2ban.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 7ad22d02d1..828dfdd6e1 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -10,7 +10,7 @@ FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
-FAIL2BAN_SETUP_TYPE = distutils
+FAIL2BAN_SETUP_TYPE = setuptools
 
 # 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
 FAIL2BAN_IGNORE_CVES += CVE-2021-32749
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
