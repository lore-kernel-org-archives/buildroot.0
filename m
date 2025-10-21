Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5596FCCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADA660AFB;
	Tue, 21 Oct 2025 16:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPXr8U2Rx83X; Tue, 21 Oct 2025 16:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43869606A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43869606A8;
	Tue, 21 Oct 2025 16:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 412B3277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D8B406D3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtPuwRy-Mk52 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:23:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13A11406CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A11406CD
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13A11406CD
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:23:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so980776166b.0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761063822; x=1761668622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyX5as4zGgo6TrxyUSQ/ZjULettJ4srsYZz672t/la0=;
 b=d70t26zExdJcNOIHIyF+tamU8WUMbK9+ATqSeSbShVMWBwn1TkoS12Yw4g09QC//4X
 Jv7C352hHEi4fGKVTdd7w9QCGpRMgQpPtZCXTyIhI1Tnc9rgCCDimFWCYQG+d00H+ip9
 Yt0iM8sjIBdJH/QcHZmjxRXqPYYfgtAf23xJQyi+7xnV1K4C9i2O7fV17xZKZYjMdgDl
 hJOYWHIhoE8J23CnxgWHETcma50pjJIn224knWfO0WIM78AOz+4X0pyEbNFKyzzyglc0
 qIWpijUaGtnLLfvH2CEcllfrIzKgc6xiF+cc3TkMVPVCQsg34WBwtuCs8VmAWAbvYGT0
 hpnA==
X-Gm-Message-State: AOJu0Yxpq8imSQra8NdGiT2eQL27UL9f4zl3xeFk5ceFUKTK+An6pemV
 mVHSY4oFqrsDyRyvxMqhd3A6cYod0MFsf6DNRARlUd4U/DcLOFPsMIMBDMd9ovuzMeM68x7Bu39
 znQWs/hg=
X-Gm-Gg: ASbGnct6DCrwxyEPsPqmG6y0IwQHhAcnIKL6yCI4upUWjXAq2svKnkWyLeAm7GI+i9o
 zdCEKzh2NQf5VJoXmYhqus/UIMy0ReCpnJTAah3lR7ezp0HTwoi6EU9yFXZ2GX8O0xrnSdMwCbt
 DAGC0kkn8A72EwGBXtlvrYxA22xj2xTZDSqjzOEKj0oRXZvBZ99kQ+jEPglKdTwgN0QWmzoHZEv
 NpPgHKchQ56WVvHNuTyv7hoY9XQcDofCPvBuZVUn3bQyG9Hh3TBIryi4eBScv2cattly0QvtxUv
 LlWoADXBCQYEULhjp++yEpVJZsu+NdFrLndAEW3Oa+UIw5nw9KoXyWeEsyb7oVnOLRv3zDpGblq
 +1TYThTEGqTS2HHYplOS8g9oRlKNOCDB8Y/H8+mHRiDL/74TcImu7IVqsMdz8QTktrIDgIzoz9p
 ojgJPYyxE/E04B4g==
X-Google-Smtp-Source: AGHT+IFx0guT55EzF9FwZegNIugXaH0mFnL//f12x9oR1vByoToWuJXSbbT20pF7YCMdUtEzhyIqWg==
X-Received: by 2002:a17:907:3ea6:b0:b49:a362:323b with SMTP id
 a640c23a62f3a-b646f15a130mr2151725066b.0.1761063821669; 
 Tue, 21 Oct 2025 09:23:41 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65ebb49a83sm1115285666b.72.2025.10.21.09.23.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 09:23:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 18:23:30 +0200
Message-ID: <20251021162330.106028-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021162330.106028-1-titouan.christophe@mind.be>
References: <20251021162330.106028-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761063822; x=1761668622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XyX5as4zGgo6TrxyUSQ/ZjULettJ4srsYZz672t/la0=;
 b=S6NrTZLSoUfQeGie6oZw0im1kYT0gO0HPfL9TibCVWG7D2uUuKE0To5/8luEWbQVS0
 30k7p6tm6XX37Tk+SA8W702Ty4Pnb1m9UeOHtcyFSSUMapZ70RgtRDwkfl9mt31dDnuv
 WQplve5T+DVVJiJNKImnxwOhDjaOHXmyjnW0ddYgONxXgm8E7OsR8uasYgMIu5rvr+9c
 RsKROdA5kjhJB5fHOgGStCChKP4A905IZED9v7NTScgmOVac0J1GQCL08gQIZe1orMBY
 /mFXjYnIwXYjc0SQqcf4QA8PXvZJwzAM3bfWjqmzXw+Ot/m4OHR0RDrq1rimBslNmKAg
 VHOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S6NrTZLS
Subject: [Buildroot] [PATCH 2/2] package/xerces: bump to v3.3.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12355023&projectId=10510

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index 52c22ee826..871089346f 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz.sha256
-sha256  545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5  xerces-c-3.2.5.tar.gz
+# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.3.0.tar.gz.sha256
+sha256  9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde  xerces-c-3.3.0.tar.gz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7734cff0d2..198f15aa3a 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.5
+XERCES_VERSION = 3.3.0
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = https://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
