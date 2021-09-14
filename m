Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F82C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:01:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707046109E
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 707046109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CC3980CC1;
	Tue, 14 Sep 2021 21:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRbyq71u8RPa; Tue, 14 Sep 2021 21:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F6780EF0;
	Tue, 14 Sep 2021 21:00:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 356711BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2584980C95
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F320oxyvaj2F for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EE7680C77
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631653238;
 bh=V8WNqYZLDaRjjuLhUOd4dzPYIixmXgTP4ZfOo69GoME=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f+22wHF+WOyVzXVMKdteViCAi+snKfYZTad31zNscid47Ze4m6W2MhwxE7p3fTlBG
 NaV/vLutd3oLvh1ceqcqwtgnxOZeRgnBBgUMFD5sOTQ9ruFNAOc5Gg6Xm1ukzEytdk
 L9PQsiFNjThR4RRCTqCAHfG56Vk5jIkTG3RmTsXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGhuU-1me3J13qlO-00DsRR; Tue, 14 Sep 2021 23:00:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:00:35 +0200
Message-Id: <20210914210036.29189-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914210036.29189-1-ps.report@gmx.net>
References: <20210914210036.29189-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bzRWYB+/D88CKjlYnjaB2ZbQAuYdrnpmOulS7485hlKM1Us/u7V
 t9BLECqTkAIBxiDu6cGROhnszSCUgM8oGXeY+8BnfY6dSsILFYt7nCcddLFNiqjXay7ov77
 4TliIWkO3hfd+pZhdOtG6GF8Oon/4Er6FqUu2Zejv8gSa0X5yPJ2bh+h/q7wjwoNvTW9orQ
 CSu2RcxiaIMJ8xTC98weQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WlhXcT4LyHg=:8PPgRIKL1ZCJvUf1EOcLiH
 hv0cB74Aclf+MhSHAAVbd8oWMNgxG05pwl9FXJB8CI/N0S+OJ5WKAiMzm9EgQ9dMXPEal3yAF
 4LnbERm6d7o4DDb7a4i5gbdNL7RqCRMflSpQXZBCJJXo1WGW2Tuo5TowF3c29vxO2HNXk4TZz
 yNmqVavCGyUVXLXlaTOmfYFQXwC9TvekgtfA26d8hSKcP/EaeM9d9Uq/E5OA8RP3MoaRaJyKt
 YoOb9gVNXQP+skkXqpC0/igr3ynaKHC1TzjArNZaCz8/eMT3zgMo1R76PLOyWZwk2Pm+JVRkm
 c8SkGWApBbpF06RioyMWqSZugGdJDIvo10Zznt7Sb4iQs3nsKmDazIk90CSnob9Talbr4yrnx
 xhDRjhP6BovHIgD5LdUM4mML0E7/xQfzzQEtotEfa1aL59FYYjYxs/DnKKUnwSM9+BlvRsx4/
 3bxv2572At4ydxIEdXqec0mbYr5yajHbyJ2Tv8x3iVhWLPc5Os3K1C6AQt3MCjTd3LBxatPfi
 nhKtsJ+MXqfbLWp1is1PsxIOrf9+GMlurfokaL6+v4EOw6RZlqxaRLozATY9+33F+bQDP1vwP
 dCURKPYlYD8kVTFq4Yiyyp3fH4bVE3BvEwHZiu3vvFvY3H5T4h+mS7nV2U1h3inQeIbzesq/t
 gjzBmLTgSz0XBdTG+tCZgXuBXtEpKJvyfaakaCoTgpijT87dglV8OWvpnRvTBkYdNjaVZI2c7
 OUKE7gzSdUvdwXIioPUp0qXUkX85+KQWkVP/+R7bYA5wAdtS24dYhEWxxPr0MxnIuYLSZE8Rk
 GHBaoDNFtdpLGss5ZAnFKrf5/OyAJsVBdN+M9FKoBgI5KM0iKknTrvDb9a3IFJhsy3MZ1ObzA
 H/95c1OWO4BPyX1uj88XIHaeTyzEEjpfwReW8BNKoDB57NnZMqsJSTre6DyhbxGt91b2UIZej
 lL+YMpDOzA0Q4t0s88ZZYh3Ai4b2U4wCsTT5vAK8pdcJwzQhYoNsdeevmi1I1yXv4bFW7RhIa
 ImE7tlNzRebZo6F4G6yJp0FihMX9STz+lATy4fn1fOZ3eoQuZweU4v2vABZhJw9vtd8NfuMdB
 ELoztx2VNUgipM=
Subject: [Buildroot] [PATCH v1 2/3] package/openresolv: bump version to
 3.12.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/openresolv/openresolv.hash | 2 +-
 package/openresolv/openresolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
index f2a101df39..7a5fb0e140 100644
--- a/package/openresolv/openresolv.hash
+++ b/package/openresolv/openresolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d74c669849183ecefdfcec30d25664b1ca24ba1ca8c2ad5de50fcaeef3b4810  openresolv-3.10.0.tar.gz
+sha256  96b573e26d145f208d3758c2cd6fbf824b01005fc4cb7cedbdae29b3a3c8cb02  openresolv-3.12.0.tar.gz
 sha256  384740bf5e19e7628d20f4dcc22925062fdc6020e9a6f074e567d4d797be57a0  LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 55ec7fd8f9..3857ab833d 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRESOLV_VERSION = 3.10.0
+OPENRESOLV_VERSION = 3.12.0
 OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
