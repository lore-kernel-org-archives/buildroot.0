Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3102CCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 861FF84B1C;
	Fri, 31 Oct 2025 22:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17pl11PKgT-b; Fri, 31 Oct 2025 22:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE0084B1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE0084B1D;
	Fri, 31 Oct 2025 22:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70747CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574D641C1B
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXsibUKEV5Mq for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BF8A40CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BF8A40CE7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BF8A40CE7
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6C88A4C5AF0
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 23:23:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59608)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vExWb-000000008Bd-3raV
 for buildroot@buildroot.org; Fri, 31 Oct 2025 22:23:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 31 Oct 2025 23:23:13 +0100
Message-ID: <20251031222313.2654912-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761949393;
 bh=quFNsktu2ApYCo+qGMRPYYIvgk3RAc9hEWkXWEBubbE=;
 h=From:To:Subject:Date:From;
 b=g2FMBngURT5z68AQMlMM4j9tiicQevxV5mhNL1G6SMPrlDUhAzWOKHVxdSvwoEA4f
 PZkJ04+upr6PCiUvgk7wFuWfV/LxPk0JuBIz7nQsz9uliE1b6p0QsJrX+v1yWNVRz4
 FouzUD2LUK8eVESkTNN7jXTU5o8AThqC2NYgbdHNbIJZRvBk7k+qMcZN57iY1+R7At
 xwDwypc3SKc227/xrFbHa5nKjdNTF+AJxtpfbrXkXQXac5O+aYW/weSwDmFq928j72
 eiVwsSKLSPRnbmRU/km8Xnnup3IYJCKi82dZA05VyMLj1LMYINNSENIt+7rpMZbs2+
 s4ruvTevQj+4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=g2FMBngU
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.0
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

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/59252134/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 56aa4befda..5438dc26c9 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59248304/
-sha256  73eb6b1d421b5986866ad4a6b777c1140a39005298c63bf847de537976cbfbdb  fetchmail-6.5.7.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59252134/
+sha256  7b9c19e6683e827d556751aa5db5d44b961e87be8b3087535b4909ba1b59321c  fetchmail-6.6.0.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 7e49760cac..4aac0408c6 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).7
+FETCHMAIL_VERSION_MAJOR = 6.6
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
