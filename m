Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971D2CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42481848FC;
	Fri, 29 May 2026 20:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HesCmQHIcmr2; Fri, 29 May 2026 20:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE75E848EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780087453;
	bh=4/r353qLogZdGGKdzGLNvXylHl7l+6zs6dprnfms60M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ys+lMIIgZK4Jn2Igs59eE0V06+DRu7kgads6Ts27BaSMyRuvQX4sFE22T/9rubME/
	 rfNr4g8dSmxKKWtpuTCyM21f85CUIzUsTIck2yGGnKXvNKdr21VjoaQLIBlr/2EYVt
	 88xkIHo5+e0UtZZWCJ/E/zhe5SR6Ybakh1bFHjEoVFUE2VKzi+Kz6wShENrQkiWHgU
	 PlFD6vVDhAcvkgyJvIU4pt+81vUdJEX0qS8FNqtJmf8fR/11yjL0C1xuhY4hUMhsQ+
	 kEF6HT4NruNMCWuoIWUPORzDgJ/8Krcx8BPcK5OP+bo/p8PcIjJxsxjdlgmo5pCzj+
	 iLofuL4x+fV7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE75E848EE;
	Fri, 29 May 2026 20:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EAA7F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D6A8422E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qn4vqCiCyNm4 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 20:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE55A404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE55A404A1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE55A404A1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 20:44:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 511710526; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 20:43:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wT43b-000000044pt-3PAz;
 Fri, 29 May 2026 22:43:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 22:43:49 +0200
Message-ID: <20260529204350.971888-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Jyl0i2FG0is3XWtl2KQqJ13AtfDJFrfQpMz2VP/aq8ai5loFJLR3yjlEgHqfXkCg9tflrNT3CE0Sqpm9k3hHMZ5H1I6AOPnk2SY0PmyWCqOhu81L/BPgdp2ps+kszExxI7Y5HNsV205HXM5LxOgVfWV2pzb6S+AnS8ychWrEJN7LOapdZpnU6UaqD8z0MBvw8uor4FmSjhi0Wv7wFeeJaNX3pzmYU8QEPZJswfpsz+aqtqoS7RdMVpj2oZoIORL/JXRPPx9D0urWlHKylLCb8iBiuQTZBUEE+qjXslrp9Gn8RJgyiTTi6nC2zSUFJTv+g6PxDnxZqBIYI5WUTD2WFg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mvV5s++39lEW3cKtAYSGpfKswSVJ/R644Z5/JCXliTU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Jyl0i2FG
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/podman: ignore CVE-2026-33414
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

As stated in the advisory:

The affected code is only used on Windows, all other operating systems are
not affected by this and can thus ignore the CVE patch.

https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59

So mark it as ignored.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/podman/podman.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 80107f3d9e..f601f7e6d7 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -33,6 +33,10 @@ PODMAN_TAGS += libsubid
 
 PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
 
+# Windows only issue:
+# https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
+PODMAN_IGNORE_CVES += CVE-2026-33414
+
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 PODMAN_DEPENDENCIES += btrfs-progs
 define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
