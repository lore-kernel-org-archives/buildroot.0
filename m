Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D382AE6FE24
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 18:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA0060D78;
	Tue, 23 Dec 2025 18:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa7Z6rNCwpzX; Tue, 23 Dec 2025 18:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A5C60D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766513427;
	bh=wQucS9fL0lg3TWUz21YpTqB18N4nd+CWNiORSG1jb9g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=co/98P2ba1Ay6QqT/V97DlWhH60AlGiVZHe4rivamo8Q+xXif0JGxqLidbzTK/EyI
	 emDwxlFoyxfwK0AxtsDKvcRhSbssiNe3+DfMLaRGIZfIqPz4HM0qAnGzloG3GHuYAy
	 59z5ccmj0lzxWRgivimKdPQpMXOeCDX0g5R62BY+SA24d7ALGsVSPXLQKM57TqFsAi
	 cvxaPqkbSm7o0FPSqrSr80LSSWYraBFjc5wmh+0CvILIVnpjlZh1g6F07x/3oDc9FN
	 dR5GtMCdMhjwIaRiQF5rEgLIJ4VV5rbsKFkJaAYZKxGLbxd7yu/7x6uch8wkLpoVNG
	 Ay7iHSmcCrSIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A5C60D4B;
	Tue, 23 Dec 2025 18:10:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2757119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4ADF8129F
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2E9vb03cM0e for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 18:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 841A8813EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841A8813EC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 841A8813EC
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 068844E41D50
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D285B60716
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 18:10:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25E8210AB0C15; Tue, 23 Dec 2025 19:10:20 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Dec 2025 19:10:07 +0100
Message-ID: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766513420; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=FkWgTgM+8lQOTq8hsx+pL97P9s/dTMbjPzieaAXtcx0=;
 b=Q+GNnZAn6Gwc9urPNZ0Y+2YENoU3aaKphrVJDRSrRmWoj4Jjuj5lFa+L6JJTQ+1aPppt4u
 RW4qqKp6+Vi3OWwI2UylimdxeF64Tkv/3qIaN7aAnsJ1QK0XmJY+lAodBA+yS9yPTG9CyH
 CRf8f6kfBgaPxaOFQPWG88vbgA8TOPgAYzrJMhRzfFwZcsMid3w9PS5UaFq8ZUK1pxcu2Q
 vu6w4J5b9PGP7ZPrTgM6Y9mSTHmKhqjCppXNHTKTNmwxAbzWrQoSXwQXKQ9/qBg51J9SZa
 JfoSGuYx4w3cYK9uZz6i9cSiWJqEjUSMDlaEjGabd2PVNLaQ82VdfYKhZl9OSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Q+GNnZAn
Subject: [Buildroot] [PATCH 0/4] Small series on vim
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here is a very small series on vim.mk. The first patch is a fix for
the reinstallation of vim, and the 3 others are just cleanups made
while I was reading through vim.mk.

Thomas

Thomas Petazzoni (4):
  package/vim: fix reinstallation
  package/vim: use more conventional $(MAKE) construct
  package/vim: refactor install target logic
  package/vim: inline the VIM_REMOVE_DOCS variable

 package/vim/vim.mk | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
