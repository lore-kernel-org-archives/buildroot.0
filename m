Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2223C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 03:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A65F61168
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 03:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A65F61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC049400BE;
	Thu, 11 Nov 2021 03:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mi6g7c4szzAm; Thu, 11 Nov 2021 03:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FEE740130;
	Thu, 11 Nov 2021 03:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6A1B1BF995
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 03:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22F74021C
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 03:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaWID3Py0Nr3 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 03:16:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073064.outbound.protection.outlook.com [40.92.73.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F627400BE
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 03:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOXQKH8h13IdmD7vc1JRFZ6abwh+hGnDnaVxuXEs/jIhu5L5BDGSLvXgQAC/yRGJ55TYg2N2T/Eiq2552uARUfcol3OdMrf9ZnW8DBqBkvhEPFbVAf7ZWOy45+Esium3iBr984aA/QOYQjMUuYGZ3b9cdf7YHiuh8URljSn+NlXu1k/dmjYgjd4YKQoVKQR+ny+uGFnpzlW+A8sscivdfIIPmE72eRa6YujAUKC5BtLWG93kwkaLnzlUr7tGW5Akc58KLxhRKaa63eVz4epg98MLOFNxhWjevFXd1V4u3s9YeoFFX9vVdZWn7FFq5XomXUu6/IRBkT3/No7iyTQkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdWVU5Qc0oLsFL1ILIKIWLYFP1DuKlJQxc6YwmVwsEg=;
 b=IyqofwJdM0ZOEVIiycU5XzyCwGk5Q5iGXXYZg4rx06FOgcHvtID+WSLsFAqBMcAaZZdK8PftouGXr7Eug9w0WMfUSYw3KzBtN/9is2RCaJDhKa76511ovRMDh0r6MXy4DUs9p5I5JcZwEGqt0ASH8iXTrbzadnx8zmgScjxt8wdhHKtrqYHhWI2x0FVr2QW8Djn0OBpKPh3ZK0gruLwKI8vSO6KFUqGDCS5N/L4lS8oaGEjPvBlJiYSfjUeTg66WCAvbu8PRNizK6ihyJ1c1/l0PWzyRsPsBxqUGd7Njk/Dcrt2G4Ob3UrBcByWAyqo0aa63p4F4cZ7C06iBfC54vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdWVU5Qc0oLsFL1ILIKIWLYFP1DuKlJQxc6YwmVwsEg=;
 b=N5H0sskVPbm3+nT3ugtC0WCTkrhFkocIb3aA42V7QpC7eqrtvEg13RtaP/GyqV9uXDhXEIHovQflI5lOthdVwfqhJ+HqP+zVws1Z/n6o4HEpjb7BOMyUj0IO7WZ9nZq+xdD+n630RpICGZRPJ50962ogdc/7ffGTbLy+KSKZ8aMG8eVYqau9keMyjqY9KEXa45qCLvQ4r8iojtB38nmaPD+EUMAk2jLIka3TRSZmbrkWdEAcl3pJ2/oCeNtUHJPOrsGLvqpjNxtaHJFxZkSBB9F9Z9B/SwwZmI7WuFx5qhnSrdqaYVu/u3mLvYIGAYRdbKUglnVHHEJwrUA+epAMJg==
Received: from AM6PR03MB5622.eurprd03.prod.outlook.com (2603:10a6:20b:f7::18)
 by AM6PR03MB5942.eurprd03.prod.outlook.com (2603:10a6:20b:e4::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 03:16:02 +0000
Received: from AM6PR03MB5622.eurprd03.prod.outlook.com
 ([fe80::c519:4480:da7:cb54]) by AM6PR03MB5622.eurprd03.prod.outlook.com
 ([fe80::c519:4480:da7:cb54%5]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 03:16:02 +0000
From: Tan Xiaofan <xfan1024@live.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH] fs: allow strip binaries when create rootfs
Thread-Index: AQHX1k1qSuL8FIpGvEOLGdiSlpjTa6v9Hb2AgAB8geo=
Date: Thu, 11 Nov 2021 03:16:02 +0000
Message-ID: <AM6PR03MB56222D5EBD242C87ABF79C28B5949@AM6PR03MB5622.eurprd03.prod.outlook.com>
References: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
 <20211110190005.GN2084998@scaer>
In-Reply-To: <20211110190005.GN2084998@scaer>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 23da3cca-be52-f61e-e262-8a3cba1c4baf
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Wtz27XnzoRhVkbOeOZ/YkO4S6bde2QzId/+kJLbNVjU=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e885768-9ab0-48c8-6bdd-08d9a4c19758
x-ms-traffictypediagnostic: AM6PR03MB5942:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vnj0+OPz9751ii5qxmksrt1EYUJSzi4vdZUiHN3hO9XCrY23p5OuvHUYRj2DyCOcp+3N8N10wMpPD93bJPjuquhAlBv03tjP4/2zEt+dS4TLJWlRfVxM00Ia/xSD+YzYQiJ4vZ6F6V5qZOU6b0dJ6dXKarER6Sow6iV5IGpbWJOzLJEBUCYc2C26VSa6PC7QubFeDSpWYoAC+o/o7BUVS2s8SztQOitUoxERclrjqfitjLFhPGppVMaozMdWy4h19n9orfwa0KxcRojbV3u/0AkLidB/CWroWV+9w555hs8pYKWAkoZve3iuc1dwxijMaRbjT5BkjA2TaI5pa6J2tqE4KgGHcvk1FcJwlraLtjI4GcT9gZihAJMfkCdrRQRjDVs/DwligjvjMWfD2Yza8IjPsfBgXCyPzEENt0WUKx5c7j71+rG8dhhcqridn6F7tlqvr2OWINlq+lGZxce4g7iXJNR4siFCCFY2T8GLm65whd03W3Jtbc5oM8e6a0YXSxTaMlz2g9PTAaImtzHne0+K+B9/WqKjxqllA4ezoSU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: rvH3EXql5fy9XmOmYqjawihEtCeUgT52ycrZEzQ3J801UK+Wx1AFS910jWGoVd6aNY1eKkj9As5JyO+Y3NC786+1MfhxhfJB5CKx4AIXlku6lVHhYXFkoPFJm0ekN0aub3umi/2bMGRxEynhHRP0lJpjbgSTc5U8R/4Cc7eASyfu50n0VDduP95HoqX9s8ED9aJIGE13wST+4ntXkBgUPLgX5ikxNxc90fU3/MAnB2Agtds7uPV6/wk82OR9RWk/xJOM4ideJiGri4W6pgsu5YeUTE2D9uqHlKbBfMEO6u1P1rXbclvuqCgMHaHM+NaB+rio6Xv/6wsTjoX9xG0UAkBKzJcMSoY7VkvrbTa46VhZNJfIKBo0Q3LGt2Qc0z9zypJD8Z7fQe50lgZPpQIpAs2ER34EA6utZ7fbTaKbYlCnnOYnTy5yhwVI9+X73uMITtN+NJ/DAO2kAQfOsvmvZhvcAzdns63M0ve6Y6WbPmgEudtpEuiEbqADWjiiVw5oTcLGGUhdwD3c6nRmiVM+3K45rH29cO1s7QMdFncyG3Swbxv0m2KlgN3L/R/oRvytyVUNgzLQkNAjECGat7LLALsAeqfptD/H+VwnJIHi+wMxt3+89xr0Er4xkCsO/DfoyQ/SEUyuBNOH6QfVKQX+Mq22suzfFwKQciSXrHYPe92farTU4lZ/Tv6knlShLr8bNDypeRtXdRyXB/o5m2sStQ==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-e50d8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5622.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e885768-9ab0-48c8-6bdd-08d9a4c19758
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 03:16:02.3863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5942
Subject: [Buildroot] =?gb2312?b?u9i4tDogIFtQQVRDSF0gZnM6IGFsbG93IHN0cmlw?=
 =?gb2312?b?IGJpbmFyaWVzIHdoZW4gY3JlYXRlIHJvb3Rmcw==?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>> From: xiaofan <xfan1024@live.com>
>> Date: Wed, 10 Nov 2021 23:13:25 +0800
>> Subject: [PATCH] fs: allow strip binaries when create rootfs
>>
>> Add BR2_STRIP_ROOTFS option, it is useful when using gdbserver on
>> target board. Host need unstriped binares for debug info and target
>> need only striped binares for rootfs size.
>>
>> Signed-off-by: xiaofan <xfan1024@live.com>
>
> This is a simple approach to the problem, indeed. However, I think the
> choice is not needed: just keep the boolean option, and move the whole
> stripping out of target-finalize and into the fs creation step.
>

Do you mean to change the behavior of BR2_STRIP_strip without adding other
options? In this case, we need to permanently set TARGET_STRIP to /bin/true
to prevent the binaries from being stripped on building time.

From 2b55431c3d5ccee2aa43f5996cfff65afe3f6537 Mon Sep 17 00:00:00 2001
From: xiaofan <xfan1024@live.com>
Date: Thu, 11 Nov 2021 11:01:13 +0800
Subject: [PATCH] fs: move stripping into fs creation step

It is useful when using gdbserver on target board. Host need unstriped
binares for debug info and target need only striped binares for rootfs
size.

Signed-off-by: xiaofan <xfan1024@live.com>
---
 Config.in           | 4 +---
 Makefile            | 2 --
 fs/common.mk        | 4 ++++
 package/Makefile.in | 7 +------
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in b/Config.in
index 3db2c8d..593859c 100644
--- a/Config.in
+++ b/Config.in
@@ -432,9 +432,7 @@ config BR2_STRIP_strip
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
-	  space, mainly by removing debugging symbols. Debugging symbols
-	  on the target are needed for native debugging, but not when
-	  remote debugging is used.
+	  space, mainly by removing debugging symbols.
 
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
diff --git a/Makefile b/Makefile
index 4062883..64cc8a0 100644
--- a/Makefile
+++ b/Makefile
@@ -763,8 +763,6 @@ endif
 ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
 	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
 endif
-	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
-	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
 
 	test -f $(TARGET_DIR)/etc/ld.so.conf && \
 		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
diff --git a/fs/common.mk b/fs/common.mk
index afab7b5..9675d02 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -171,6 +171,10 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 		--exclude=/$$(notdir $$(TARGET_DIR_WARNING_FILE)) \
 		$$(BASE_TARGET_DIR)/ \
 		$$(TARGET_DIR)
+ifeq ($$(BR2_STRIP_strip),y)
+	$$(STRIP_FIND_CMD) | xargs -0 $$(STRIPCMD) 2>/dev/null || true
+	$$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $$(STRIPCMD) $$(STRIP_STRIP_DEBUG) 2>/dev/null || true
+endif
 
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
diff --git a/package/Makefile.in b/package/Makefile.in
index dae7a85..a03312d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -224,14 +224,9 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
-TARGET_STRIP = $(TARGET_CROSS)strip
-STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
-else
 TARGET_STRIP = /bin/true
-STRIPCMD = $(TARGET_STRIP)
-endif
+STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 INSTALL := $(shell which install || type -p install)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
