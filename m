Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910F10A1E77
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 11:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AFE440B36;
	Thu, 26 Mar 2026 11:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvvJ2T4g-DUc; Thu, 26 Mar 2026 11:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CF5140B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774523708;
	bh=KDWQx9Anta/U+HKH10s9fh70ihHGgryzpLqIi3YjqTY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lw9XhQhxnQYHQ3Lm9YMN1I3tp4Oi4QY5TAc8I/0bESW7tV1DKFu2whnmHZF6829HP
	 P/2LdNywbkRTuzVzKnBp1cKy8X17wrdzPnXS9aCEbKwfmVEaZG7xwrTi81FBYuksBe
	 1zV0G3CFFLQGo5RQUpl2nog7hcjZK4/xac1BRYFmN6+YF5RSLBZHkxefuirz/3zTpK
	 A8veA+zAi9Awku/LSAaUdD3OXtH4OpmGdE+4N+sCoxyhfKZ+jIyKRPnutnQFOx+h4N
	 NOWBDsWxaWhxV3ZovbH2qt6RMTdykpZ7iwLgQYdjxTsHUqbuLkV24xf+UoLkoJvJYl
	 XqbjCU9G4Mk6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF5140B15;
	Thu, 26 Mar 2026 11:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 993C5353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EF12404B8
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLhhPd7F80be for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 11:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.177;
 helo=smtpout6.mo534.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4B51404A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B51404A6
Received: from smtpout6.mo534.mail-out.ovh.net
 (smtpout6.mo534.mail-out.ovh.net [54.36.140.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B51404A6
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 11:15:04 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net [79.137.60.36])
 by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4fhLln4BShz61Xf;
 Thu, 26 Mar 2026 11:15:01 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net
 (director2.derp.mail-out.ovh.net. [127.0.0.1])
 by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Thu, 26 Mar 2026 11:15:01 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.113.125])
 by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fhLln3Cs0z1xrF; Thu, 26 Mar 2026 11:15:01 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.6])
 (Authenticated sender: mooz@blockos.org)
 by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 0E7653E149A; 
 Thu, 26 Mar 2026 11:15:00 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>
Date: Thu, 26 Mar 2026 12:12:54 +0100
Message-ID: <20260326111412.78314-2-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 1528127651294596045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTE9TzWv+3FRBPN/KjfruV2iHGJHXfpedUbTxRP298GL1y1G3VqPoDkwLa9eFn4ms3Juv78iyiCdkOymPTve1uqZazQ2U0ErEYvupX9sJyFjob4dWAoZwZ7g9CaXaGlvOV6Ucc0u2AFyRPcMiYE6A91mBwz71rfD5yxVPnyFuDhV+nX2QkyPEYULA1/zB+RcWiFqIxno2BrYeylz6SjkWU8S6iRaaII2mo0T9H84CxvPUgNa8H2t7xyABwwxShFYIuR+9BM4Z+DSyjYckVZbNbZJ8Id8vfQ8tvv/mNpMkOCBd5KR+1HB4Ka9cvSQHjA97BqngUmPjbU4UolGwsk9dlv1aziPZHHs3hKVbnIAIWN1c20KPPlj7s9uFZlXrtrqfI3cZ7T5ZnUoUZSHc9MT2SG5Gd+0MMCUws4vFNYNo6o3ImnWKIQt9kPbVbiyHRWUnEE/oq4BRR0CSzTGVEVK5sHI9kcNSo6Oh1OgQL10UquFf+OfR5zQqBrmuF10yJReA85iu/ezS+cbx8I6TL2613ajLv3ks4nowBt0wLFI9jKzoI1Ik0+BVnmjbbfdmdX5MR+C4yPzF6g7hgL8+wqYk/Rp6qAMEx5Yzh1+m67eMtNiy2gYE3IpOYPUPjejyGId/PDtV+vcwHgvUIU2QD465agil9P4jycdJ4CX8gZ9MX0hGw
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-114S0080109791c-7310-474a-bd92-cfd4aad63402,
 46696CBB4EEABC9EFA8DF8527D371D8007EF4257) smtp.auth=mooz@blockos.org
Subject: [Buildroot] package/rwmem: bump to version 2.0
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

For more details, see:
https://github.com/tomba/rwmem/compare/c89bc9ad9...2.0

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
 package/rwmem/rwmem.hash | 3 ++-
 package/rwmem/rwmem.mk   | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
index da74002cb4..8b73f662ea 100644
--- a/package/rwmem/rwmem.hash
+++ b/package/rwmem/rwmem.hash
@@ -1,2 +1,3 @@
-sha256  e6cb76b77869aef9ec4a2c31d0d80af0182a5f9c9c3ae06225c8fb2f8266379f  rwmem-c89bc9ad9a8f2359f358c510db57b7678eb156d1.tar.gz
+# Locally calculated
+sha256  d10639f563100c819202337c4d4df57db11c2fcd59a19b0c68e34b8eb9aa1d01  rwmem-2.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
index d6ef05193b..1259b5503f 100644
--- a/package/rwmem/rwmem.mk
+++ b/package/rwmem/rwmem.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
+RWMEM_VERSION = 2.0
 RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
 RWMEM_LICENSE = GPL-2.0
 RWMEM_LICENSE_FILES = LICENSE
-RWMEM_CONF_OPTS = -Dpyrwmem=disabled
 RWMEM_DEPENDENCIES = host-pkgconf fmt inih
 
 $(eval $(meson-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
