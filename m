Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF872C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 08:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE2B424FD;
	Fri,  8 Jul 2022 08:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE2B424FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi5TUhzNJwBH; Fri,  8 Jul 2022 08:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F92424E5;
	Fri,  8 Jul 2022 08:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F92424E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF54F1BF2BD
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 08:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EB64017E
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 08:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EB64017E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGsASgkE1sJK for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 08:51:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 700A940155
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 700A940155
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 08:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PChLc4giOw92jOrfrhU3jEt3MzvIC5gOYPh+nPs6Yug3eM1plCs40V35jbBQDu6HCC9771s2dsqnkq4bDSZWNuxDjbal5EG0ElKWdiCHOxqQ6Tcin+v2uL+9jGOA/4AOTGOjaxsDzuIxQT+VIkk5GESb2jKkygIf0Dpjt2yOgrdnxP6YLVc3iKLL5HkanFSfo8T7lsOwQJoRxDxcl+IYFup5GfrWWICZbxyDVNYCupEzEgXs3uqM7vTancYrtM1mXhxv71e8mzF8lWlhjeLgHMc/zxiPhImSHJYGdiKB7YAdOnZnfxiHQxatjQqYuPoyBQBvqLBBXMdaUIpLSyM7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki2VnQ3ubIvxNpRl8TCYU24GnJScVJ5w7QxsdKAwft0=;
 b=FSoyT7X8vAha6qlMHBW4e+29gEhzHbnB8+zKtyQyOA1Vy+XOMk5m6Ok+ELs4LCnxkTOXFT62jZGILJuFvF26TmoBAVwfQWODuW4rT65buCa+bkm74rS7w8BEQiLVcIquAm1eh4HDgEEw4Hz0cUD/7K/XPXTlmyer2URRV1hzT8zS5GOVfonGYeQDTQNqkkiTfYXD44QVaio2YODIqr/gKmrrMztyXBPFuptXVxjxZ+qudgodnSTUUHwN4bdrqLt+Uyt2kTmoU7A84QMuX5J1nuCkyl9OxXM5UkxMHPX/EjXFLS4WeR8+ueyv5olk+64r8kRLJbSKvvlqqaRDP/jwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1109.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 8 Jul
 2022 08:51:46 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c%5]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 08:51:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/sam-ba: bump version to 3.7
Thread-Index: AQHYkqdyUYB1Hkgax0a5csOme+9zjA==
Date: Fri, 8 Jul 2022 08:51:46 +0000
Message-ID: <VI1P190MB0493B1992DDAF7607E82B2D99F829@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f65f99ec-9a7e-44e9-4d73-08da60bf16d1
x-ms-traffictypediagnostic: AS8P190MB1109:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n23CPAlDP7mgoBrwmASAVPiy03B4/aYVjsp/2GIjmMYdKvMzKTELZEaSjL3qGWC/eYB1lblYXSZqwwnQLwn6YiWhKOb2RW6vaBihZYFjiP5OKIyiUstp7qwJx4dXayBCMUuL56vwiJtxv8TkY9zKcJEKqTzlh+0DJ9XXF2ErmdiNnZ3cIOj7y5LOZPkQG6rkovT19nYsvBfQuI8gFkqBfY5moTqBYQLe+fAXnUYEKlX9w1bLg1a1GtsqlfO6dVTRI8tIS33Dqx4ixuZNj24M+mRW8gtWyXSTPDU1MzGxDHaTnDcMHtMgz8g3UDNpBRgMUrYJ9w5qc+ceCc70EKf9jY2hVcKAoV/37HHDT7O+RR+ZI8KgZTmjx0Vw2yrzCbEeArxiVh4t/g0fGV9AudP7V21e0GWIokgLZmH8sHCMckvQ5mV90T4alSgDMMwEqXL5OU1CHnsN2ogc8gAGMmtRjTjhnmC6cxYDq5u54FjwAL6OhHw4H0ujGanssJaJrc8U9m4s1L7O9C2Tn/+azXA00wQO64E/o97EtZ7CRvkp1NQS4qfOrLVKoUH21ayLEBMzOM7wv/Ym5kTt/txoY7f9aZyPSonVXpyMAsvrWRcmOloZqXelIgUB3HYnFoMfABYa4G977E94UsjTdrc6m5fuh7IogtjB+Xbu4V31dWDRvrLAM9OK8Db/Q3jmurfT44OxHSFfVGx8VeIAAbhay+a/zXnAwJo+FZ3KGuZy9lxUEiCKEcIgD3xoaO6CcnQqUfUN/6isnuEiuVlI8d3zN9Z1J/nr457cJmCuVmATyKVQX6SxOCfOvZ6RWeFtjhA0yr92ll+qTEdWbNUmfv9554Zm8zlI49a66y/pyKfcMCnBzjU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39840400004)(346002)(122000001)(478600001)(186003)(55016003)(6506007)(38100700002)(38070700005)(7696005)(6916009)(966005)(71200400001)(33656002)(8676002)(4326008)(5660300002)(52536014)(66446008)(64756008)(66476007)(66556008)(9686003)(316002)(66946007)(86362001)(76116006)(54906003)(2906002)(41300700001)(8936002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SU+c8x/DdBomkFiQkJLYDiDBhIUQpNeslB79dzPaW7sUxHIfSyGBGkNuHL?=
 =?iso-8859-1?Q?q1Hh98QG5fGt9Nf/wdjCRR6kpsdZglkk3thS1x6hswEvJqlmnNeTCxro5v?=
 =?iso-8859-1?Q?DJTVuUw7B1DuvU2pYsvadqoq3hJOeK2KBGlp5Z/9N2l6yomcxSSPZKwMqI?=
 =?iso-8859-1?Q?XbOKSmu7G2nZKVliAlW9Rer4j6aVC0ScrhTm2qGIrSPqRMUaNGN+oyQ6Gp?=
 =?iso-8859-1?Q?BhHSUeXUwrExhM48cjvXEPeTiu5RMPun6N2YQpNgeYVOQqmalMhdELrgq6?=
 =?iso-8859-1?Q?s/zvNNkuQGzYnH/F3PYqVcXpV2hQeN871XYH9gfWWjVe+/PEfBdJe0wMhV?=
 =?iso-8859-1?Q?+DsM7SIpnujFq4ltSQ8ng+V4qxUk+euSNBkyzSGXLsf3r3cuQE6RSUsHyi?=
 =?iso-8859-1?Q?m9DKXY9nDPnfVzBRqkx55M/GZTWksN0vdV7TPRlsDGEiqQIcjfzzschYLn?=
 =?iso-8859-1?Q?Uhuk8QzKoKimRs+3izlk8nab9cqrfSO1VH4oIhERrJRXqpHGVP7I4VMIRf?=
 =?iso-8859-1?Q?WiZcE3T+WoGRQuqtfD9Tv3VnF0hv+bv107kAM411smsu6wQcWPBEuckfD7?=
 =?iso-8859-1?Q?MK+J7eakL1Lv1ezXq0yvzVjfQ8HYwDtVdciv1ItmbMMZ40g5A8ayei6oyn?=
 =?iso-8859-1?Q?iKDhPm/rusJiurQWxmombU5LhNCDocDg+V9cEnfA8AOuOvojI+xdqGVN2F?=
 =?iso-8859-1?Q?aotjvmYFat+IvAou1DOP6FteMvtgnKN30255ailzs93aigV8E8EOciaifm?=
 =?iso-8859-1?Q?p4ZMbJciM/1Cho7N3QFafLbDJ9eqFJ75w/piD8Swd8fimGYIMHr+jgd41O?=
 =?iso-8859-1?Q?149Xjpb8Nb2BXb1+Q6naEBtKNPqZftaXL3hWdwHwOZOlQ+Yutii+Qo2l7C?=
 =?iso-8859-1?Q?9KYvsfluEpsPYCogpCeLz5RAWOIM8bhSg43MfVqGR2Tx8WoWPJHNQx+/3j?=
 =?iso-8859-1?Q?bjhTZKEjE34lDiqQcn8lDRLPVGNQvgE7MVUiozy44jx7y6WpSfff0tZTqy?=
 =?iso-8859-1?Q?KIhsi8TSRAheU4dgZ1l/tgmOSdSRJXRzDRNnJLiEDVg/q2Qk+fus67bHIi?=
 =?iso-8859-1?Q?/j3w4gmUivpUakOu64oPGZHp+cPzzelCtCUMTZ6Pq+U8mAdfHBjMLeUFK7?=
 =?iso-8859-1?Q?v7J7mDODcAPa5i2NgAEN1vfiRxpJVEugoX2JsRERYEwoGDGGH7DRDWAysL?=
 =?iso-8859-1?Q?dh7VQMDcoz5XAIQGTTKMXjSQ7eOqvBexPqgdUP8Qd7flKW3Hu9M7fxDlF3?=
 =?iso-8859-1?Q?E4RKaJOpO5MDMb78Jchu92GdKHz1tMyd+Hl63GcDjrLlAzFFNAzI24ZbPn?=
 =?iso-8859-1?Q?eYAB266YnTnuO30JfFohGKd513CtCjr6f8/DsN+Q2gadX5PWYUNVMurasj?=
 =?iso-8859-1?Q?5uFxN9BEtG+2v6FoOgsGid9KcdR1nZ8kE5Uppf1cVfimR09HiJ4cYO5I5A?=
 =?iso-8859-1?Q?Y5a6t0OikWJVC/Uho6Cyl1AGY4S7I56/obpYz26vIy+Ejb5SRJaQsL54De?=
 =?iso-8859-1?Q?JvD0KCZICz7fqVPWrw2xDzk6pYxEpINg8oLBcZgURr9ughRbmjRWdgP//I?=
 =?iso-8859-1?Q?8NffFy+nEA1OUenYuVqWHHqUXNUvrghUMo60oMiszK+b5Wji99/KeZ5pDQ?=
 =?iso-8859-1?Q?Qgx1qWjbNIQJA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f65f99ec-9a7e-44e9-4d73-08da60bf16d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 08:51:46.4025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1aqozMfQwlw+9ROhYHlNJeWx9a4nsDeTIGbSybTGbV4EEpS11J8A9A2zBqk87byZ9Z0XQg7jOcMRwoZGv6G0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki2VnQ3ubIvxNpRl8TCYU24GnJScVJ5w7QxsdKAwft0=;
 b=LQsl9KQZCh2TMVOCcSs8hIPRyqk28sfkwQW3pKS/r/gg4HZ4iETZGj7toN3ZXfjabFeGTZWxn1A8fS4sdSNLZeORcd90xZY42oSZstpig0nMSkLj+cTYI0dGddOkdb3oV2PK7RBQGcRgq+Xsql+biJsDlwlJFGQ/yxt6jkKJ6so=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=LQsl9KQZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/sam-ba: bump version to 3.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/sam-ba/sam-ba.hash | 2 +-
 package/sam-ba/sam-ba.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 10b95c9c0e..252a60dbb8 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  f66e431f0401b197e80599156ea93aa3aab050bc4d16523c95fae1107ef9101c  sam-ba_3.5-linux_x86_64.tar.gz
+sha256  d295567701914e21318f4c48ff3a57374c7c91f65f0814158e84bb07dd4d07c2  sam-ba_v3.7-linux_x86_64.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 10bea8ef70..0928c8f9ca 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_VERSION = 3.5
-SAM_BA_SITE = https://www.microchip.com/content/dam/mchp/documents/MPU32/ProductDocuments/SoftwareTools
-SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
+SAM_BA_VERSION = 3.7
+SAM_BA_SITE = https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/SoftwareLibraries/Firmware
+SAM_BA_SOURCE = sam-ba_v$(SAM_BA_VERSION)-linux_x86_64.tar.gz
 SAM_BA_LICENSE = GPLv2
 SAM_BA_LICENSE_FILES = LICENSE.txt
 
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
