Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1914C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 06:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF855416EF;
	Mon, 17 Oct 2022 06:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF855416EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dznW1wkozshO; Mon, 17 Oct 2022 06:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14FC416E9;
	Mon, 17 Oct 2022 06:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B14FC416E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 338521BF404
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 06:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5611416E9
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 06:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5611416E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYBvhWJYKoS6 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 06:21:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839F2416E8
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 839F2416E8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 06:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzOyVrqDlaLYI3I5s/wfLMEltLBEo2cC1n+qFOosELKa106zO5bxRISAUnG9v1P+i1HGIJ8IGtG26qJnn+vE1b/dvl62Xhh9v6J4Scxx9i/8417TWJZUMWOS5NUbj/eNTk4NmedgtAQscTfCrMjVKt8Hc+pHqXxeyHdDMwaiD4EQZH91RJiDFYBoO0WLmIdqnKI5Vw/wB2S5bKByKQoqy466Pe9UuvP2CXE1YWd/vOKbuzl5S6iLKI8wmvtIoVvvrYm0pLgv4fMJ/iu74aYwgxTE5WLZxgkNUp9LCAQgCcOA03tinTX6NuaTakwaBn3LObtLpTchD2fwFrWp5XqyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIAcu/1Yd89In3c4AQd5YAL5SHx97+tfVJ2CnPlwcJg=;
 b=h1xYoBzRhi7VwPv4wtvgUFX9K0FE0VE9/br1Vl4BSuxxdqH/5gvrxYWjF0hesf6WOjeSvuv302L0F63ZnGv0D1b+/iyZ9yefM26SnHgUPzvZ7hf/RtC9nJAjhpWM8/kRLwEhbNF1p4pHWEsb+pHq3eYEZbWffdTVkzQDuBAkEFY9a2zKDCqDIqDUu9Pl0BNWkKoa6lU6JGmWvx4PEHAVaQHSMy/1O4v/UoIZ88E8w8rdmYJyKgWVwSM4a8MkG1+w2XLdFkvZ9DbTIqwqlhb+QPcZNIJWdEogLJUK/N6CaXbg+jZdQj+5n29Zl+0etXin5WiuolL1YV8Vntch1/qJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1977.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 06:21:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 06:21:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/iwd: drop dbus check
Thread-Index: AQHY4fB/S1PHqwU2BEKOxAihrBSaKg==
Date: Mon, 17 Oct 2022 06:21:18 +0000
Message-ID: <VI1P190MB0493163B9AD3A02AB50F3EF99F299@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1977:EE_
x-ms-office365-filtering-correlation-id: 11d5af0d-f3e4-4493-ae11-08dab007cd7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +k5z6sbuNTF4wu+cPZYSxijo5VzSrbj8IZ9kCcJDC515WMF1rKdjfEb0RWb5f8q8TEC+p7rs19193W0dn9q0cce42HcehVxqvNCVmotiAuWRpaT0H2vKCxiwN1Qu4YWen//nvH2GmHNDZEeXrHisJgad5YRE5E0h9jJ6bCyJVRH0PKENL4fND6//lppavJ8ortCLy+oM1HQiq3p8tmjXX93mkRqD6sWJfHwgQpu4SO4Pwo/hfeITf/XQyXlrLtrTCr7kmAPR/nqfxyO5KnU4VtniuHneBT0lbhUJmEZo6FyuL/J+8evo+yotJkLalAlWetLNM+ajWSI3IuXQI38aYe357nVKZ1933Dz6E/gKqbjUIY0Vi8mCX93PVCWcxrbHylNqxDBnc14FcZzCAXD/dkChaExa/IOodjf5XkhVsqxArntV5JiuvZYS1fv7dJnbrq/iJjT7ZrDgu4oHeoDSj4NCa+J9T8aPDkP5XNEz1yVi/UQXnXrfbjOhuZgzcmUiXveOGqpTZCXrT4i9DJjjEl8QW5AB3uourx4EIfKfc/m76Ynlv5AAg7lEG7zlWo5twT0Tz+CbYyI/B9pZYXBCyxedO6OLZ1E07kNR9xPPIDtAChJ47kdN3kYIq8CocCboHDPFLDffWDKcRrIaPeOP9U0AYwSjtFgYdMaM6zpYppuiMYpcZAYDmohqBB7dKd4j5bmLclsR9t5wz2Q76plw9baLrBNZEWLLx1r2uQaijgGpmGcZczb7UKrE/u054y1qh5k9CNRiT2ukn5uBTfnrOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39830400003)(451199015)(5660300002)(4744005)(6916009)(66946007)(76116006)(66556008)(316002)(64756008)(478600001)(7696005)(6506007)(41300700001)(52536014)(8676002)(9686003)(26005)(66446008)(71200400001)(186003)(2906002)(8936002)(66476007)(83380400001)(38070700005)(38100700002)(55016003)(86362001)(33656002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4xyFFvDWBiUe0I5mr4Dz4CM34XJX3yBF1bf3xHoB9ZfTDIdmzBn32w4Tj3?=
 =?iso-8859-1?Q?t8GcTV4Q7VBEquj5sHsxWsXuvTAi+TRMDo7ngOjfYFyauQgcfyWVhQN8fZ?=
 =?iso-8859-1?Q?8dvFwMkKuyZzBTuDKJKCVnlPI/l3oSBHhWzoc/VHRMsQHzr7Eb9vqK35Gm?=
 =?iso-8859-1?Q?BdFE7MsO2kqq37nisLZHy6u8bnNDVsov0O3UMjengGrU3339Tgq2wye6+l?=
 =?iso-8859-1?Q?5Y3TkpMlsj28jI8/1tZI1HURxGjK9hcYecNHdss3s1ZwErLHF7e6bO8eDF?=
 =?iso-8859-1?Q?KEKQhSPfp7RL7YHsHzATEuZmCi+tGYr92yji7sLgBAjq17LAyU89L9QKyH?=
 =?iso-8859-1?Q?dmozdZsk90SJ7HuzSNd7E5tqond01w35f4Zl0K82GsFhaOVA0QLC7IceKS?=
 =?iso-8859-1?Q?GZGHhW+HM6p5wCMdiOx8BqqWQSsqL2uCYB0zHUVPT1ac8phhHrb2g0M4NH?=
 =?iso-8859-1?Q?FLLuvds4D40OfYrbT5yDe+C/JtLRaKX8aZqL2b7Ld+xWt7x1wNt/CGAX5x?=
 =?iso-8859-1?Q?ON2kPGynaAzy3LW/k6ioRDam3lytr9z+sFgyHV5BZ8/CWVygfdHYrOkTpO?=
 =?iso-8859-1?Q?ZUEf9d3N1Rvd37FciQs+3j3aZRh8XTfPVOPMy3TzlFTRgYvJacEqaJ+Jqe?=
 =?iso-8859-1?Q?EPC11jHZ7keOkDePJBO1NpPPZ/9btYr2rndRrzH5RBGvTVriBMbk046iyZ?=
 =?iso-8859-1?Q?M9ZGB42ryDgA27a30iYR/tFAL4wZSMXBdnw4YSQ0QrzXPtMUl6LLFaxNlx?=
 =?iso-8859-1?Q?0/ZKsRYGdIxBUxzIyWsftWfhodbVqxEWD+xOOQVXsHbtcBmUcJqzJ2UQcg?=
 =?iso-8859-1?Q?aOKiwmBgcf+b+N6/6WHN6T52xdbbf1qmFZo37IZU+u/SraY06/QwHZ81Ln?=
 =?iso-8859-1?Q?p3XiKxd7gpvJ9pn0HMmVOJcd5yPqQuAR6hDpQaIp+3XQ3s264DU5khrNmI?=
 =?iso-8859-1?Q?mn1wU1v67bIUsZlpNo5InIX9fe5DYJm1SLiYCJTL0CN5+ep6L4/i+kRTZE?=
 =?iso-8859-1?Q?DAa921DvMBoAdVBRK5p1wlRMxxNUCyjoAsnYRt4VpKK6qCeP2o8qdpCHan?=
 =?iso-8859-1?Q?VdEKW7yXBp/3EUOZ+5VfKf9yEbXhT172sHT1KN8+HS23fzdZ+UV4DNFJm+?=
 =?iso-8859-1?Q?TTov3A4Gt+ODrbaDhCp72rYlbhXtLjJ+qKKP4/rcuGqAwbrwl6ZzHUJ57K?=
 =?iso-8859-1?Q?8iBQPiJ7clgondFmvOirKtPuOxgc1+xYmYQGN0MkEgmQufaGUNSTIUraYN?=
 =?iso-8859-1?Q?9aH5FD91TOf0151fCshRdZ3KoXQNDHtts3PdjsdknXYQsTvQFkXhJCR01C?=
 =?iso-8859-1?Q?qSvvOfntXqWL3ff42VDPSDiBrmP5rBcSSrbTDOwbK6o26dFVKpsLTCeD+p?=
 =?iso-8859-1?Q?qLaFNKmjMvcwRrx7i572NE6iELZxfBzaY+i9KsukisCQl8UJ9ZkMUf7Cx7?=
 =?iso-8859-1?Q?DgBzap9wg7wSX/gVku0K0WmEOmgimCrqqtxX5n0tekbL+sVuKwjrPlTgP6?=
 =?iso-8859-1?Q?TMEBwfABQ2Rfxols/jgMNNZ/O1/M79PE+1RRoWqv88c8cEaA0oRQllD8f0?=
 =?iso-8859-1?Q?is3UTsQX5Bcg1OYz31Ue356nCwCM7EYvM1YwvCa4qg+zztPEDyCe66Gvj8?=
 =?iso-8859-1?Q?Kps6m9bhBUjyw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d5af0d-f3e4-4493-ae11-08dab007cd7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 06:21:18.4637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cqw4Patilq2+AWbHiX/YGT29XkvBuZsfsDWZdIE4CVNMH91I/Oq5TV6SX/cBN/12Sob4krzmy6ypsUlPn9PcnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1977
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIAcu/1Yd89In3c4AQd5YAL5SHx97+tfVJ2CnPlwcJg=;
 b=VH9D39GzgWJkLcVYXdF/V6KHPZaD2EmnyVGXvkzatjuJY/HGtEU2zRwz4m7L7SlaARFApaQdwmdvVBShwwoAri2mCMpHv3KGO+N06MLUmQS/6HZpHDcFAtPZdSc2Jfb9mnkgSGEiP7S0G401vFtoPYC3ekI/CrLZ1LJNAet6vmY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=VH9D39Gz
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 1/1] package/iwd: drop dbus check
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

Since 6f5f6bc dbus is selected when iwd is selected.
It is only a runtime dependency, so drop the build
dependency.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changed v1 -> v2:
  - dbus is only a runtime dependency, drop
    the build dependency (thanks Yann).

 package/iwd/iwd.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 297e1fabe9..002988cf33 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -15,16 +15,11 @@ IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-	--enable-external-ell
+	--enable-external-ell \
+	--enable-dbus-policy \
+	--with-dbus-datadir=/usr/share
 IWD_DEPENDENCIES = ell
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES += dbus
-else
-IWD_CONF_OPTS += --disable-dbus-policy
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
 IWD_LICENSE += , GPL-3.0+ (client)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
