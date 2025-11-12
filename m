Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87264CCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 11:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9FA40862;
	Wed, 12 Nov 2025 11:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WDvDCp8rweG; Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494B94088D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494B94088D;
	Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F22B91C3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4831408AF
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egta1sg1qmYH for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 11:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4DBB74088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DBB74088D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DBB74088D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -84034398; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 11:06:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vJ8gZ-00H0s9-29;
 Wed, 12 Nov 2025 12:06:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 12:06:42 +0100
Message-Id: <20251112110644.4054902-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251112110644.4054902-1-peter@korsgaard.com>
References: <20251112110644.4054902-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uUUaskK9WzmWajeY/AXoZ8qON/D5FAZC+mnIyYZWYH+NOvFIEYEGLhfGhwPvqAxDki0eyLlSImKqfZ1cPMKvJBoRbEWv1TlAxLpyBnZwJi2TZ/HcyDCDzP7DUC0BUw1NE0iJqeIpixFV69vK6+xFWGnwcFxdvQJHtoemMnNMvOhz1ddB3uvicMhzF4V4IUEIOpfMr5xK7RqQWybI7Q2f57g95KP+B/3QlGXtXLAxL2RcmZyRyrPkjZIa/XcbSQS0eqUz35BoLPs/OhBV+AOLuV4bH2dyTzmBqHJP6S1HG5IimdtoiTctXjrWeGDqAFam74zm3O7cWb/jNrb/ICqK2w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=xFdqiS9CJeHGblrccoJZaIJD61U3C7y8lm2bX82R94s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=uUUaskK9
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/3] package/pppd: drop 'default n' for cbcp
 option
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 53a302c6ed2a ("package/pppd: Add an option to enable/disable CBCP
support.") added a 'default n' line to Config.in, but booleans default to
'n', so we typically do not add such redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 64bf2d12f2..14d3769a1d 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_PPPD
 
 config BR2_PACKAGE_PPPD_CBCP
 	bool "CBCP (Callback Control Protocol)"
-	default n
 	help
 	  Enable Callback Control Protocol (CBCP) support in pppd.
 	  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
