Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8FFCC9A6
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B15060AFD;
	Tue, 10 Mar 2026 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0vzW6KNm_Sh; Tue, 10 Mar 2026 08:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2F2760B54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773130764;
	bh=5lc1eYP0qb2SxhuZPVGqdvg2mIZwe7Ox+Cctuxt856A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BRZU1l6Zj8DFUUq4LF1COcikK22zqvD09VdVOHf4iX7DIQD6mKQ1fpsKFfr+Rv/a9
	 nh4Pet2KXh0FTLIIzTqoO8WNQTZjx7odxlXomMDuqZ930vdXJxM09Zd9rk9oljg0on
	 i2AVPY+zPhobUwOcbSgDQ+vKBBrE0bLtLmc7L0iuruIVzTrsBZIiVMja8zprVUpYgw
	 j4347F6GGVt2/qMnPCqBt0tVIyeJUyovcY84TWZpbYN3XZgUcQvwgsU2WIzkPZhigR
	 vYbE65uuEYWzpmX3XnXDwSmR2B7ngy9GSIFNYiQ9PNV4Nw6nV8TcDL0xgvmvjihltX
	 cNw9bsZWkkyiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F2760B54;
	Tue, 10 Mar 2026 08:19:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFBF201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5542040D03
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VxhohcvJzzy for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 08:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.98;
 helo=out30-98.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ADDA41AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ADDA41AFD
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ADDA41AFD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:13 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-fQmN9_1773130743 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 10 Mar 2026 16:19:07 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Tue, 10 Mar 2026 16:18:48 +0800
Message-ID: <20260310081850.33001-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1773130748; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=jv3b6fimNESryHoLUKMWpmnmZ0JjtNjF3DzZbszNHcc=;
 b=RHXOUFBauyyQsoUsSR0018N9OVEvu8VLzWBMrSnN22M5ohKmR7rAvLfc4m2JBVOsCw8NS/MFzlgtWo58Sl1ruflVKH9GZtIP/UfaH5z6LqdFQr0on9LKgRzaKFxl+FdsgKkUbUph4ae08hSFT2DMxn/FQzmiWVG/y7/98MbXJg4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=RHXOUFBa
Subject: [Buildroot] [PATCH v2 0/2] package/ndctl: new package
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

ndctl is a userspace utility for managing persistent memory (PMEM) and
NVDIMM devices on Linux, enabling configuration and monitoring of
namespaces, regions, and health status.

Adding ndctl to Buildroot allows embedded or server systems with PMEM
hardware to manage persistent memory directly on the target device in
a lightweight, self-contained manner.

I have submitted a patch to upstream regarding the issue caused by
disabling fwctl and keyutils. Currently, considering they will actually
be used, I've decided to always pass -Dfwctl=enabled -Dkeyutils=enabled
in Buildroot.

Finally, since docker services are currently unavailable in my region,
I did not use test-pkg. Please point out any issues, thank you.

Changes in v2:
 - Remove dependency BR2_LINUX_KERNEL, host-meson and host-ninja
 - Add BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16 for __struct_group
 - Add invisible comments
 - Keep libtracefs optional
 - Sort all rows with "select BR2_PACKAGE_" and "_DEPENDENCIES" in alphabetical order
 - Update _LICENSE and _LICENSE_FILES
 - Add the missing dependency "udev"
 - Use $(STAGING_DIR) instead of $(TARGET_DIR)

Chen Pei (2):
  package/ndctl: new package
  DEVELOPERS: Add Chen Pei to ndctl

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/ndctl/Config.in  | 25 ++++++++++++++++++++
 package/ndctl/ndctl.hash |  7 ++++++
 package/ndctl/ndctl.mk   | 51 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 package/ndctl/Config.in
 create mode 100644 package/ndctl/ndctl.hash
 create mode 100644 package/ndctl/ndctl.mk

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
