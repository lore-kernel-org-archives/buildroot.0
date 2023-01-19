Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175DC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51756419A7;
	Thu, 19 Jan 2023 09:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51756419A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmTHR9hMDGZd; Thu, 19 Jan 2023 09:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CB540357;
	Thu, 19 Jan 2023 09:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CB540357
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219171BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F063440357
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F063440357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4ksCvb0t5Ty for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:57:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1CC402BC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA1CC402BC
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0SBf+JVCo3nWfYpJvIkWXy/1bqV9w+rXj8i/oog0a2T6L8h7BFNLsGkgygA7HcVJV7Pxn8lhBuKWlKgMzTX+giP6jVhf3JFi+6Q5naFQxN508jAWhYuUKoDOWGrs00ErgYhRNybVBXawAzC+yojK2IeVH2A/EfCmeSkzBBeNbqjA/dHRTIF8i2t+WTbD6UW4nFZdDBJpcOJMLuL5pREYZxoQ6jmcFBRohpyArtLcezhFkOl7y2RHwuuVRnKVJnVRVZGYHmGVXB6EpCBWkaQ8X9FZkPkBE3ofzWXgTkyIIWI1GCozSPbQJvKybKYj+wFGPbHA7bldllFNPbuFiEx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/E0tVGcbXvq/6FROBTzDnshZ+JljNpPEdn4x7+2A8M=;
 b=XyVze2tisz0d/8NABnlrBnrEDwtulWeUfGpj5t+Ll7R4LVGuOI3R+wyXAYD8NTAlFHS8+3wWk1wg8Bxns2V4J3FJ3h8bFfgvPquTTffYsTUHVKhwmXDydS3zEsMScc9HUsRjM7cY/zbb0Ak2VFAXX6D9FgBdk3lbLkVmvAlF2C2gzAj4Xv/Vmaal1zb94P4Tr5bWeh0nekiqKZY9ykblDn4adSW9RER+f5AFpmb95yfwRD6ED8kucjRbfr5ueV5j5PbFCGfmI+ns+u/5e0qqOetYLPBP9e58tISiuFVjRyuNWxrr4CFOT2EMrMy+u2gnGdqdQf+SW28xsrB9Ll4MTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1698.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 09:57:45 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:57:45 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 13/45] package/gtk2-engines: switch to https download
Thread-Index: AQHZK+turW3cab+tfk2Tfh3+r4Lb8w==
Date: Thu, 19 Jan 2023 09:57:45 +0000
Message-ID: <VI1P190MB049362ED76717A7A819BA9719FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1698:EE_
x-ms-office365-filtering-correlation-id: 12d0fbca-f15b-4f9d-1004-08dafa039ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ssmlUiZYU5WEkP25Y+wZI0rU265nbM3JHB/AWjQjYxlurjs51C/ye7UFOd2dMwTnSUEux8SttqaozHczwGP7JVvWgGXgWZTfYkvxA9Qt9JYTs45U5oE5fn4pn29sLDOaHGKrCj39RqgMiI1wL/CxzZvUVp/bIUemzxJmwN1QuwQJJ2OOy1w4RDVJMsKX869chdNJLEIQFBV51BtDhEveWFGM5AlIW2qkd9odPVcR7raJAKEr3mb117CfFEnO93ilrZc4yGQh0TpCyX8O9gK2EPh9DsmitVpIO6e8+IsWj0hFsMwPbho1cTLLeoYl2lk6H6aQNUyqruZtcCs0ArwSmN+ryQmGS/vmHZmXK7eUZNwV1aaLoKiEFqR00kM7f9mdLvEUf1e8AQZKDwgjqAZSm98cxRXEreOEGumvjTnAPgDHgAdnGYCV1YnvBp1Zolc6Fd9KrClg2HaYJ36u9sOpJhXDoLXVOfQzN52B3jvmX41JUuBv2TKaC1fSg5TgOpJYgVJnbZltmnvnToEI+WBjjE6YFGEPl6nBRb3ZK0mou37j/x/BimMmI2oLV7eoPdEf2yySk5rP9SVVDlcuCwavQpoMBE0aBIF1widekRkIb9JTzgh096kx6YhQRHWAwXQgTNmv5+cIBiJ01RM9JLOcuSanYKmNHicdZzy+4En1LVgpgYlqWGZK9gIaXE1UrLBCKXHipDpurLph6EReQv/Y7cp1ST7kBVpfi7Pu0aMNA4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(966005)(33656002)(478600001)(316002)(66946007)(66476007)(64756008)(76116006)(66556008)(66446008)(8676002)(6916009)(41300700001)(8936002)(83380400001)(52536014)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J4/AU6DAFQ+nhiUlaoWMZtDdPU/SPa88+wmoMcbOoqlYPfvosjfiUOZL6Z?=
 =?iso-8859-1?Q?+qx/6Mkbe6qu7FjasLjcECxsira3h4qeZMPGi5cSOqRFI/K8log4M5kF8I?=
 =?iso-8859-1?Q?0Wf9ZmgWKf6sOO8RqttDK9XEG0x6Wst1gW20IO+qcnUfBAktGfxVvZKLhL?=
 =?iso-8859-1?Q?YPu9mIXH0dqxNlBevSI4WIaSvW1dXaJZWSOOJ/LU7sr4awrmmb9XblUnXv?=
 =?iso-8859-1?Q?ZPzr2Jh0vdDE64xKwdNv43mAhZoiq4QlvMbRpIZ9ojsy1wJzVzKZU1d8Sa?=
 =?iso-8859-1?Q?KjnwKfXKI3i807Tv5r5Evaq1MbzWySgbbGxxhLLHC5DxWxE9uyY4Rlt03p?=
 =?iso-8859-1?Q?Dyod8iWoFShm1fFtcvCbQ5oQGYoBzDmRz2KBW5PmPjU08NXvZWUG1IFlj/?=
 =?iso-8859-1?Q?cCZQW5xCbtiRmAxGS6l63X3PMj54h16BIBTbjkBShQxd9008rNsCA3I6F0?=
 =?iso-8859-1?Q?k/Dyk9Tl/eLFC/TGjlp5ektpN/sQ6rme4IUYuC5eLj2/4ZtKCwukNj5u07?=
 =?iso-8859-1?Q?zNaoSSK+xquypTs1VmeZp9pFA3JqIJHbZkxJRrfRTRy7ipGIxw7YbHISbT?=
 =?iso-8859-1?Q?3wZurHsx4hqghpVVs8QORQ+59FKU4ChozHxbi6533wOvk+o2yjaGsy1Lt9?=
 =?iso-8859-1?Q?x3zc/GeXl6udsbf7xCnE0dtFO2a1W1HtKQgi4Uy+/SxdTYQgmxBEAuFVJw?=
 =?iso-8859-1?Q?kyaBgkIKbP0QRxtKaaaa7S/PBjRjzTKkmzs6dL0Zi0A6hzLpaUsPsQ7X/M?=
 =?iso-8859-1?Q?z9DZKSDWN7b2vUOMXKB1FPlyYn+uTdbYYOtCO7sZh5qv445RyhEP7Iw0lL?=
 =?iso-8859-1?Q?BIchHQ0kxmzIekuyFCYEr09T99a0Xem9XhIvegpUPryuseHSCf7ZZkR2Zv?=
 =?iso-8859-1?Q?oxmpjdCliSBC1kYZRPRv7pAwJwo8nLrFiVBbF2HBliSM0pEf1z9Z2le1Q7?=
 =?iso-8859-1?Q?uRxUPf12tYnQf0W9kyXCmhm/a4WJX5ivDYw/sUNDMiBvdUCrOWzOiJVVTz?=
 =?iso-8859-1?Q?EhQp0XAckbjqYmCl/sJtlUZQx5WG7OT1Rmd2mRnvcMUCV+KT1FXU2CkBU6?=
 =?iso-8859-1?Q?JikB61tXAyx6Gl7LHOEIlH5NeI1Z5CMEr7HSKFeIUusHbBsh1ykOfpSLvr?=
 =?iso-8859-1?Q?yKj8htzCXtGwt+/o5fm4c9MizPLpIsTlvkWwuYEu7zO1uIBOp0LuyifoD8?=
 =?iso-8859-1?Q?7kyfgbJ5gwuulKkiV5O2X9Zl0+IeASSs95hUoZ2gLyNeV2kZn/F8xjiFyy?=
 =?iso-8859-1?Q?ngDNFen5pUcjLqNrXPzSIyq1ZpPwFAPiIxJEfM7ugTOjFYYY631LgXjTpO?=
 =?iso-8859-1?Q?gbG3RxQPV5Q09MO2enrI+cvGUNQndYkvu5deCiNb0CWCeXnM8AK00rhv5V?=
 =?iso-8859-1?Q?LsT+CGloDw8AzNNQlJnOexgXx/YWimO7evp/UrPA71OCjLon1WHcPExKmP?=
 =?iso-8859-1?Q?SgKswwnb/6xM8cMjKQaesaCkrUBiPkBXjqBC80KW3TC+0234uct9HaQfp9?=
 =?iso-8859-1?Q?KDiMV6hKtFySc4o0o8Ei6b38EvJKZKuL1f9u2LNrm96nSbvO5CNsF52m7f?=
 =?iso-8859-1?Q?7LCc048MQrQ9Rsnk0zbGyOQKVpOY+DoV61NUKnFsQScdhfYp+d6RzAKSGZ?=
 =?iso-8859-1?Q?hYpmlyFslwEDI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d0fbca-f15b-4f9d-1004-08dafa039ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:57:45.0555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOK9GodTh3EthgX4bPjhTnjCElzmXyDWPS/Vdwtj+nScudrrgnXTO1rWuKNS/d6hKNJaCbchglNnc2yas3eh9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/E0tVGcbXvq/6FROBTzDnshZ+JljNpPEdn4x7+2A8M=;
 b=pc13n36zlAWLjPgxqkL6SsOzeHmfEC4Y3s+qbPpZ6VM+1zzWo2jJKgEUaGwjH2vi6Sm5aSKtWmOUwT/06UlkibYHI93for7isRbhqMFJEhXXE/OP3pqPm6p3r+JKyLjbHKDm/nRoG5AykJ5Z3BPp+r8PDzL4e4T/NBHNUjw4Rdc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=pc13n36z
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 13/45] package/gtk2-engines: switch to https
 download
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gtk2-engines/gtk2-engines.hash | 2 +-
 package/gtk2-engines/gtk2-engines.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtk2-engines/gtk2-engines.hash b/package/gtk2-engines/gtk2-engines.hash
index 20125c706c..71a0ecd213 100644
--- a/package/gtk2-engines/gtk2-engines.hash
+++ b/package/gtk2-engines/gtk2-engines.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
+# From https://download.gnome.org/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
 sha256  15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5  gtk-engines-2.20.2.tar.bz2
 # Locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 5f145940b2..ea41bccaea 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -7,7 +7,7 @@
 GTK2_ENGINES_VERSION_MAJOR = 2.20
 GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
 GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
+GTK2_ENGINES_SITE = https://download.gnome.org/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
 GTK2_ENGINES_LICENSE = LGPL-2.1+
 GTK2_ENGINES_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
