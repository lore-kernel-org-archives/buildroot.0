Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102DAEA4E27
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 07:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CEA40735;
	Wed,  4 Mar 2026 07:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-ClNlsFNiIt; Wed,  4 Mar 2026 07:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AF740757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772609296;
	bh=fxJYAKNMow3VrjbbJ4j8mjKGmwOg/lQDJS6sR3uDS2U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TsNE+E7pFl5tsRLdG+I3dFro/hr3kxYRU0aQ/BaAXjyughSqQ2q5sVEOR0Q0wjKwR
	 /5VyY3ZFqNcAscGamBepKOAcHhcOdUeHPLI+EFP0AmuBm6trZTv0LYQsLzNnlKk2jw
	 2dRRQzYyOwzwXD/ZvXi8dGoxq97ifA4XeMPv52wBjnmb6UQws+0E88vLoh8oJU5xBz
	 1jxK1alFZZEDGhNymLY6kAb8iACS1hkVixkkRr09Y6E6On+VERY531XRwQlOWLrii6
	 g+wrf8mUgg0RtNYs1d0+AIst5yxpZMOM53a7F3OCzKdN4pxsOppX32DQ2XlYkTHgY1
	 VSLUbwAAf5dbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9AF740757;
	Wed,  4 Mar 2026 07:28:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4CF231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0142B60797
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMVSxvGMx4VX for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 07:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D94ED60792
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94ED60792
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D94ED60792
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 07:28:12 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-CXROD_1772609268 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 04 Mar 2026 15:27:53 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Wed,  4 Mar 2026 15:27:31 +0800
Message-ID: <20260304072733.1779-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772609274; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=RKSk7SaGy5NuIWrVIOW1AdRDxVkmI6NxVNn2Tm3UXws=;
 b=sBSqRt4hnS73faSjV9z4GTpHVOFKxP1gEQRNWscvG32vHK718LuLQ34AELneYWLA07HyoXFJqZIcKBXfUFyxY2N6Byk2DE4GoSRTFAmo+3MnZrkgUuScycroHeoE/eLzIzer5EeWQZhJsiyBruPlHn/0dQhPtSdZJtk0IFG1Nzk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=sBSqRt4h
Subject: [Buildroot] [PATCH v2 0/2] package/iniparser: new package
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

From: Chen Pei <cp0613@linux.alibaba.com>

The iniparser is a simple C library offering ini file parsing services.

Iniparser is added because it is a dependency of ndctl[1], which will be
added in a subsequent patch.

Changes in v2:
 - Move the "v" from the _VERSION to _SITE and update _SOURCE
 - Add new entry in the DEVELOPERS

[1] https://github.com/pmem/ndctl

Chen Pei (2):
  package/iniparser: new package
  DEVELOPERS: Add Chen Pei to iniparser

 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/iniparser/Config.in      |  7 +++++++
 package/iniparser/iniparser.hash |  3 +++
 package/iniparser/iniparser.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/iniparser/Config.in
 create mode 100644 package/iniparser/iniparser.hash
 create mode 100644 package/iniparser/iniparser.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
