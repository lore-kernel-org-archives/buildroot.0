Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B0FFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 14:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9C942A6D;
	Thu, 30 Apr 2026 14:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNGV5ggrveiy; Thu, 30 Apr 2026 14:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD4E42A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777561172;
	bh=63ET3eYmHKbt7y8xa+iAZSWKyDqHMjwsyCmriMESapE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p87BNeabMDHUOFUIlPpiGM+ZASduZWQplC43mjCxLq5SDwHaP20g772XkOIPjEua6
	 waVAo5vvR9K5iAyGzUNXJwGKRu/Q3HYbSyxASx+7stUppqcGbDEvklN8GcBUyaPLmP
	 8LzIDnDMurz88emm7ezpXTPA8RPChVtXWaCS5P/sivRp5t7+2bm66OonLTBeSMTCcL
	 EvwZT3uQpJyS/CRSnJi7/bmmn1Cub+WJrhxbGN2wivMOoSmWJj0lteefZA/MCqt3rm
	 MEK8qQLGwnfhnWCfPEPn70nn9HYF5ge+KRoQeJ4G3E7phpaZTeYlZQ9z33t6QP++lz
	 1CCPC5gh+C0AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD4E42A61;
	Thu, 30 Apr 2026 14:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA99192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD8EB4248A
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8LtvF58-zoY for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 14:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68194407B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68194407B8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68194407B8
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:59:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -977054828; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Apr 2026 14:59:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wISrL-00000000wfr-0IDf;
 Thu, 30 Apr 2026 16:59:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 16:59:20 +0200
Message-ID: <20260430145921.225530-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=h054eHoilckh197w9M+1p6WZJ49Ur2N7KL2+OrTW9tW2Cb6aGSIxf0WszLUsyjSHBzqk8MK/Jvn8Obtw9byybierZKCaea+AfFani8mIuUy8oGG9YHCx7VWIPbKZnqs5B5mZAb0AGKn/azYktW29PoK+4LEV+vSF203J2dbKXRyonG58kgutaszUJKbRqtNkS3zaw5kx7VycJIgBOIt0du4Tr6vj4gfIkxk4cIBqDebu7sYVCnxXE0feXfkhwghVdeS3ahd1+DJ6dWoPqkZptIvmS0ViwFOmphhHRO8nPk3VSdFuPA5p980gQccInqJ420lGEqZADGUe+uMZ9zQtzA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=SDigOB2TyVGze4y8HriRUEe2bPkNt/MCnhMRLJYOE5U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=h054eHoi
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/ugetty: make install step more robust
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

Use install -D so it also works if $(TARGET_DIR)/sbin does not exist yet.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ugetty/ugetty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index 1dc628540d..d3424bee42 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -15,7 +15,7 @@ endef
 
 # Install ugetty->getty symlink to ensure ugetty is used
 define UGETTY_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/bin/ugetty \
+	$(INSTALL) -m 0755 -D $(@D)/bin/ugetty \
 		$(TARGET_DIR)/sbin/ugetty
 	ln -snf ugetty $(TARGET_DIR)/sbin/getty
 endef
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
