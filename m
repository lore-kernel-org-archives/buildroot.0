Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E60CECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC43540CDA;
	Fri,  9 Sep 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC43540CDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2h9zcahs_U8; Fri,  9 Sep 2022 09:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 091F340BF2;
	Fri,  9 Sep 2022 09:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 091F340BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBC21BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0808541A19
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0808541A19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_L0ppgZYE2A for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:17:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC33441A04
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC33441A04
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWCNfX+WgomSE0QIRPo0hIiM1yW8ZqvxES82G75PDhUlT1rWrq1srxL8YEbNLsXCHseumUlXmKqobBxIea5f8obEUGJsMFnsggd9Z+K7rWN+/AQQr+uzXOAaI2y5ezUnQcn+qeViDpzE0sQYSehBhXkSYYVCb9WnHLIy5N4DOqbb/QkdBCp1lBK7exnbsIUnCJYj84NFL4CbcbJS3malgzPC4EM3EY5pmQXR1jHGnjzzGg5dXrCZ9/AtjqcYQOtUC2so9VH1UeeiOF3wL7afY7nEPcmh2WQKfpbAhZI3PTyfZhufPkSlOjd50K02ikGAdwJO1HoRKQdxb5D4FT9zRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj/cEYPmct59BbcXOMc+Fr2XuoO1B6nxNk96QpvV+J4=;
 b=LWxBv0/PE6RLZouwWY50v+a4fX+BcyVNfzg2ny/560vz6nQUVBz0DsIsOKUHQ+ovYHdBpv6MaREvNCZW9W+GfcjO4Jr9ippcdb64wqOyRryFIFT8MuBb42bui8iaIwtI2j6McJTcX7nRCG+FT/NRg7Qc0TP6fR184QRrwwmrDDE6/+ovX0MTH2hx7kAkJ5Jc5+466fDASexTe1hLTcxhxZcOZufqDvN7+WxTZGoN8872hDdXRTcj05doVSj9abnKw/MZ7dn+k6z1TJ5hEsC/etKjkzQLczNdztNn6r3y055WAF/IvtJ+nyce920s15dZtMbwblDOfIh1Fdl41KWtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0924.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:16:51 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 09:16:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/4] package/polkit: fix typo in POLKIT_IGNORE_CVES
Thread-Index: AQHYxCfztIEGIAYANkqDg5oN2uBXxA==
Date: Fri, 9 Sep 2022 09:16:51 +0000
Message-ID: <VI1P190MB0493E3FB0F35DECBF7EF12089F439@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0924:EE_
x-ms-office365-filtering-correlation-id: a66d154d-fc7e-4b91-7177-08da92440817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMquWFbL68otPD/5plohuw5sKBTEkqAyVCjN85EClfeAQDvKYRi4kvAsVHFFnlUGMg0fJ6VH6GlPdZosv4ld6fcAwdggak8pDRZeQFPonfLBSQW9BuEZbJVc/yHwC2bTlWC1YWlfHBokaFfHQR+OB63hmB7VSyLdybt0GzwrHkBurtzPM5MZZumbeqgpOFJwZsV83lFgBo6uJzkvHkQxHvKQJ49Gq00wVtNciqqIwXFBExsX3p9F4Lh67l0fCnfOG5JCFMFzczPMwMuPt7Kfri3hUpl5dzO16Kvw6R4xkMaR9KmnQQ3QX6tBCdugVmHIXrD3ZG6XgQdt/t7eWx5hDntEHf1mpkz3XmwNNowTDYDLfW9g3SUYo8srqRf+OfW0G+Su9jMEM6HITrv/HsdLt9ysAVlLlQXXclJC/CTg2OBCvcCSI6ZszpqUVlxIq8CYIpj7TE64pTOAIqOwee31eqB6/V9GXe/8V15AvDPGc8KVJGisSFapS5Is67fTPKbzAaV/1R5vHKAG2hlYAI/6uz6Uwpagm6Emocjnq8bwa3lyeKXEDlxM0HJWGkcQZO+mg3JnK91f3O1z7F/R+VV0RwDiHqJkJnuKzzOaAVZ4ZF2kHVNZUxTDSn7LSNGNeG9tgeKlTH2ZJmirJ9ji8/+GrEqjQr+DoIFbNvum7o0QDlroOtMkuWOT8PP+IajCrFgoRb2BWEyfnjOoNfXPgNQqDC1vVIDw9Nx9lYAvPexUt2IK6S8hLqGQ4j3yg8Bq5LrPxy5DDCKMJzPactLlVBPU6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(6916009)(8936002)(52536014)(4326008)(8676002)(76116006)(5660300002)(4744005)(64756008)(66446008)(33656002)(316002)(2906002)(66946007)(66476007)(66556008)(478600001)(41300700001)(6506007)(186003)(55016003)(83380400001)(38100700002)(7696005)(9686003)(26005)(122000001)(71200400001)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H8r2/7GifWXBIPOO+OQ1n/tj+3Sx20V4jPlMqAQ7KtrOM2yur1vemezWM/?=
 =?iso-8859-1?Q?V05R0HMmdim0I+C4ABT5krsksE1mepp+IUjEa+3lb+UIE3xd49RplDdsfY?=
 =?iso-8859-1?Q?m/ghFqvANA6U2/+SdlSizfxl4CLQRcPkVnQeV3IknXBGKvd8roVAEoTCVY?=
 =?iso-8859-1?Q?s3J/hwwImGMbzdXGaelfRN+A02b4lyEorfRsQ7xegfjfe1dKyiuDFJMgs3?=
 =?iso-8859-1?Q?O2ipwGxUUM6kVX5zQYdTKxhbJLU59+DtA7XEMZwCkBpBeqb2TNofwHrzFq?=
 =?iso-8859-1?Q?7aNkYs0wFeiAvT9juPQ1qNEEBCrmPyzAsyh5o4ezAmr0c60lCtQOQh/5RT?=
 =?iso-8859-1?Q?qYv5H6MP00TF+hJaMv9mGfVw47lMgBvG2rTu60s9OtXjhPUvMk/Sui7Oxc?=
 =?iso-8859-1?Q?iPEykM+30dX5sofPNnMfDyW88YtJW7ihwf1aR10aoutkPAUDbyHeuTss4C?=
 =?iso-8859-1?Q?hcVJR6ExAOq06dPTFQ+t+ziyGZ2UuWabpumQiFAyE1UeJknrfARwpsJ1lQ?=
 =?iso-8859-1?Q?kS2aoVhZf/W2zLC+KzlrxXfd9lErfvVfJIl9RT4iKASlbPemaJ8176X0Tr?=
 =?iso-8859-1?Q?aLPlAIIH4GyDtOrgMxLbIjUw+jJdbmtXC1wJSChd/w4lPKp/bIraInujpa?=
 =?iso-8859-1?Q?s7GOfbW1WSyN+B/mK0hWWvkBCx5I530cIeyqTXAjFBUIJYTqP1durATm4x?=
 =?iso-8859-1?Q?MiSKWI+g6ijNhz5roXWjeHAIq7E2fZdk7lF1jhv0v8OudkPfuHSNkkA3rx?=
 =?iso-8859-1?Q?rKOQ7oBag2q2I5PxaPs60g5jDw0GRfCEItjOz69tS6UIvUo6z/fuRLvuVp?=
 =?iso-8859-1?Q?w2ec0H1EmYZ7uUFM3ZSGhb8Lc1KxSpUKPCA9DxNen5KVLy++PZgsCzNfCq?=
 =?iso-8859-1?Q?vt5s7bMR82NNQpxLz9FU6ig0omcRELGZFMScUL+GNup+lKkM6tdr/xn8M6?=
 =?iso-8859-1?Q?RI3ApRCg2OugcKXbtluI9U4aSbkhRY/H4UiNkdsgBLzEuXIK6gCUKibzWM?=
 =?iso-8859-1?Q?SMkl88G4jHX72DI15ENrD+7g92XLWOucY9K84L3uv/kHc8RQLibG1LLD1k?=
 =?iso-8859-1?Q?nGJpGREtOsbML8kLLWr2C6xAeePkb6WQ+QREDC2Nu98r/e+Wi2IfIWUQW4?=
 =?iso-8859-1?Q?tWP5D99kKCom8r1HWoYgiAOgVtK0HmQy+K9h1ejeATQQxMBtwinSy2qfN2?=
 =?iso-8859-1?Q?+eBgb+284mb7WwUkAyhvMvDO1AfSim2AWOKbsc75CMQXgUmv17J9OGVrC9?=
 =?iso-8859-1?Q?CBhaulkdsuXoYxtU+jlljCKIN4lsyihtcKS7TVZyKVchA60Hb6MaKswOtK?=
 =?iso-8859-1?Q?0Gmt3MSq/ymTrMWIIYK0EMmvIgDwNuPayErsO7vCiTSQAF06KRxzommurT?=
 =?iso-8859-1?Q?L5MwdSniiBpQLkC8vmqu+PD78lWJjb8VKtjQgJNRehCupmyvj8fIwNsg6Q?=
 =?iso-8859-1?Q?f0noYalrnwWctychm4gfzX6uhqzES4b+pkvsDGbNCaeTdz290+LNMl85H9?=
 =?iso-8859-1?Q?AhSOu6RvbMfYC/J8+DZhHY5X1IDAsT5JDM6Lrv6+RXnnRy6jL8bJx72aan?=
 =?iso-8859-1?Q?Uzq4e3O339nNpffamLIo5GYoKIaVhAzCKdwSTJLcPNu63WDz/0SnyB67Jf?=
 =?iso-8859-1?Q?C+RtOWKPFoLJc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a66d154d-fc7e-4b91-7177-08da92440817
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:16:51.6907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSL+xraEMTfMZOg38lipDqvy0T49chnfEyMoYCfDDVgfqy9GTiwKdr1InB3jkgb+F9Y2g+JpJlah7aGciCy+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/cEYPmct59BbcXOMc+Fr2XuoO1B6nxNk96QpvV+J4=;
 b=CFeBuRYcqZ4+zg7gyduailU3I0ddgCsM7nCwrzTQ1g0R02qEiRVn0XHgkTRcJhot/sjzx/cgaa0M7jePtAqetVD6eSb8RchZlSJED5d2E3R8Pg/wSkP7BIVZCRzvyznOA6xbekAxLXM7Ij1QgCXFRQJPtrvf1Ff8LdVmBf5BYwo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=CFeBuRYc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/4] package/polkit: fix typo in
 POLKIT_IGNORE_CVES
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The POLKIT_IGNORE_CVES variable was missing a "S",
therefore the CVE still showed up in the wrong column.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/polkit/polkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 61666594a2..a8b371acf8 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -12,7 +12,7 @@ POLKIT_CPE_ID_VENDOR = polkit_project
 POLKIT_INSTALL_STAGING = YES
 
 # Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
-POLKIT_IGNORE_CVE = CVE-2021-4034
+POLKIT_IGNORE_CVES += CVE-2021-4034
 
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
