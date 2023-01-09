Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B57C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 08:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 480F0405A4;
	Mon,  9 Jan 2023 08:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480F0405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPjfSb90Wr03; Mon,  9 Jan 2023 08:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71AE740578;
	Mon,  9 Jan 2023 08:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71AE740578
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A16F21BF30E
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AA9E410A3
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AA9E410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDHqRAuC79aJ for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 08:52:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C40410C1
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62C40410C1
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 08:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/8xbbc10B1py8m2HZNN50JZb2jdsXbymZjlf9QT/Wp6L0OD/Zm79jHx2miTKocxOGLPLI6zhLR76lwEq+xPwuFYYiZ3lmjzyybq0bFPxeJV3Xa74yMQFmBmGdg/7NDmOThLs2Sw0h/ftYTxlYCozCvGeYQ+iSnrahnnGjNdF99ELmsnOX/M/KJQ1ZpMOnnme9PD0zypVEuWVZKJVp/6gUNigdYa40cCsYHhn/Q1W41y4kDE1v3W5ThCV4ew35NHsfDN0smGSfHV+CWYQb9UKZhIQrcpBb4xzz+2CkM1IKUvcnqc2OoTZxgdsyDK9+pJ+02fJa1rVzmXZTN3hQlGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPOU6n/qcwSgmv6cykOkJDpjHIsG6q8gHQVVT/NXrU8=;
 b=fShKmHR52ZcXkVK6TlZXVNaQF6smwtVFCkczgN7GB1XbqSKrikGjLEJ9jBHH9Cpkl+24IVuXSXGnOaIkYGwc5C5AbBFg01xv6I6UnrY0bkt5gGsL8S1xGSEcP5Geqqxs/h7CMN0DPMJ6oGLu2Ea9fUwTSHQfO69U3ZpRO4RKSYVoeHQZjqa9QRuiCFA2vakdC9dwk5mCM+6zUkjcOCRXt42HoejfJTESaYcU2BCa/cAjuuJ4mmczM2UG69Hzon1cfbhfRS5BePrLeXPDCpCJUM5bMrMPg+qjiFRx+M7zeW5z/YikiFBJ01jaXyhULpny5cWt9zurhX3KUDltWKvPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0587.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:122::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:52:43 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:52:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] DEVELOPERS: add Daniel Lang for package/libsigc
Thread-Index: AQHZJAd9Ygo96BswnUSYtpAVjQEKqw==
Date: Mon, 9 Jan 2023 08:52:42 +0000
Message-ID: <VI1P190MB04938292339BEBB7A36A24B89FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0587:EE_
x-ms-office365-filtering-correlation-id: a926d6f8-b3d6-4388-7131-08daf21edef1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QarOVNFGoWpkL1eaZKoEHwRHwImURjvyr3+URYu1SMl/2wggcVRQiomOhXU+OEdW4cPNRT8ywdV7Wq+rmZ2otphNF0PxCoGuzxzDxCMH5TkxsBdJJU2FSg4a4b0YQZL9r2C4e+TJYpPCrhpVqZISz6PxgP6HHbR+8kNwEsGGMG72ffPlfSOns76c80i1aOk7FKkf+a8cYaWnzEeV/KYHRcH55ygzHid2VS8CUWUpylyOv1EgweLQ52+kPB2VzBDRHPMPIYReLYtvPeegAq55UegvTcRMMhndDa5r23ljh7zwCFZnKk6fKJl28NlKgAeqhanw0TwCdYcOBNf0/0A1LkS1MrBGUv3NGMuREPSnFEcBILHW8e2EXKtyFttsaux0JsA1FSzuc0LCojfu6IIklwYLFxNfIS5U3TLIDS5y/Ki4e1OEPM8AhykvHxnLsnzgjh1FhpeI13UvfyvMXLYpSQaeOeJxRpj9eB5PEOtImSX/tijM71ETFD/IvQyTuY1QR0YMZlavQRIU7QpS5vlW2si8bgJ2B8peYjK+Sh4cmCSHhoWTXacfraHtBrRvVm5/DPsvL7QLRGMCIFUEZjiyQZcQBRUqARAiTegRLPmrSwKHiiv2w9aopGjebE84LE3mBVwQ8KzP9W7JHeHHFABnUwex+wMwE7nW2viOV3Mu0Mk+G2pwAauSQVtN7PEmhXdynd27ovPdvt3iOwFrAN6U3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39840400004)(366004)(396003)(136003)(346002)(451199015)(122000001)(71200400001)(5660300002)(478600001)(316002)(6506007)(66476007)(33656002)(6916009)(66446008)(8676002)(86362001)(66556008)(64756008)(38070700005)(8936002)(76116006)(66946007)(4744005)(52536014)(38100700002)(9686003)(186003)(26005)(7696005)(55016003)(41300700001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xXmuhlFi5ucTJGPxRZ2V0CEbrqn3mOO7iG61M24gZhJQBwUCWVIKHEOUhp?=
 =?iso-8859-1?Q?W2Ay7bx8+CSn1vZ8U0b9vDtOfz4WtoB60LkN3Q4LSu93j5L9fEOzH8MYEk?=
 =?iso-8859-1?Q?gA8zb3cWM9wtL0rNeiwNDQQMFSdI/gcmDhJQO5tSuTsviWZEBm1caAF3QJ?=
 =?iso-8859-1?Q?yjLpYmOyaeci7KrWVllUFYE2exkzVKx/DfbbssK9ibwrYDfr7y1gsB+nFT?=
 =?iso-8859-1?Q?8kNAuWDLqZVX7jISzk7ogx90xhUW+ECl5mdKyBNorFpNTB3LZGP6yze9gn?=
 =?iso-8859-1?Q?U7JPJFKiawvPNu018ctTfEfL8ZDsk48EPdmUxodeI85POHrHvSBLQU1F3+?=
 =?iso-8859-1?Q?7rerRF1xdFeiocT/HvtWa32PgHFISkQpgovUkqM9p0pmip1ClAfWTf56Sl?=
 =?iso-8859-1?Q?ySvqaACyudNGpo8Euca/riCXKCVob0qquwBYe+3V6ebqdO5DUyslb64ylE?=
 =?iso-8859-1?Q?cOxKIi6RfjoGTgubXl62ryqbJxpc2LwAV/6OvmI+X24AwVOeNwJA8h/BZp?=
 =?iso-8859-1?Q?KTTKQ8+SfjWOfP/aiF8B8jxIjX6+Ng0H+mXY64eiAXXthwPlpLm9Xm2UmY?=
 =?iso-8859-1?Q?WRqx0B0gkzvSCVOaI76vZMY2RUH4gzycLGENYhHqsQm9XH8yib7Ng+5Cre?=
 =?iso-8859-1?Q?+3W7L3OwqQrYCv/tg/rvh5CeU2BtODQEYfxTXQiwCjt3NxNeLz1mRP3rSk?=
 =?iso-8859-1?Q?BFOIhf3dWrgp6yl5vD/y6xyZnLV3B7YWEf+yXfDt9HP/6xHXI4x/MMd5Ft?=
 =?iso-8859-1?Q?/sdh4p83ZctX+kfJW9AcmsrTWOrfmehJfWI/uRj9z4p/ZqzRKauCrR9a+e?=
 =?iso-8859-1?Q?2ob+7LyP/fn1CM5aPDu6TDP6QNpDWmgYcJksS9Fq1hZdQ/pkmoqnyvv1Ay?=
 =?iso-8859-1?Q?5zdcueIIRaQaXcXDSq9nwAgsB318YAiJHZ8Bkt+eGrnpoYtyNWWh1zcCcB?=
 =?iso-8859-1?Q?spMGRVktMNAJdSTRso4s9co7VCBoHPlCnjnmzd4HqMhpNoiXHy844sFjZG?=
 =?iso-8859-1?Q?hHMyobioqYYlejWUeHZy4LhmDp3/zdZ5oxcavs/IXc5Y6pJOqoD9NZ7dHu?=
 =?iso-8859-1?Q?CdGf71NLdhXRux4Rw1wHSpldaapOCBaDR0lUSrLHiS32EaT5dQoLcaLt8D?=
 =?iso-8859-1?Q?biQKAr3ybtBckyhO/ZzWpxciJ8aExBawy3SFW9a3kZzxpRT1ByOyFADzk1?=
 =?iso-8859-1?Q?6LMSs8quae5KSK9SkakM0bLlnrIvhpfv1UrWWCoEx4HWHe8XHbYzeYItH5?=
 =?iso-8859-1?Q?cdo6HHW+kY7YT2G+Jc64C535DUgJfhEHuZQm8NF5fa53yQcVJ5K26Ob0Tj?=
 =?iso-8859-1?Q?OvA5MsOaZTQxOC5GuMRl8cBXGzyh19Y2RO0jeIe5TgzaTNqe+G0/N9E8cZ?=
 =?iso-8859-1?Q?ZsvFvNsgYDUyqtogSzvWoWJolaMLqc/C8btaMCJ0hDSoutSYiNe0lIwMof?=
 =?iso-8859-1?Q?rQRsiV7ivzu/cxMmD+WMliuJ3YGRta1FbsUuj5rMDToAgWtS8l4ewSPLit?=
 =?iso-8859-1?Q?uQIRI5x1MAJsY+xULbEOiLi1C5VYFO7q4uR+J/hUXuzMUiqBde+JKGt8eA?=
 =?iso-8859-1?Q?Slsvqghl50lRaZzsccTHYpUowUOKfYYSHkjiqdPBmD483gRL0Q/vCeSAfv?=
 =?iso-8859-1?Q?oJW8vtsVFvoKE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a926d6f8-b3d6-4388-7131-08daf21edef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 08:52:42.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ARnFo+ZmjviD+19PP2LutvyO8FDl/0CuWYiM2MlL1SHRH8PhFfGvyX87Wu0LGm8nWs614TC8nT8ktRgucQ0Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0587
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPOU6n/qcwSgmv6cykOkJDpjHIsG6q8gHQVVT/NXrU8=;
 b=KxruHglhb3Udb9NbMJZEvDM8RpkEQXWoRvkOwFW4FymWvFIlTMVPBVryIxw0bslK03oHclrreZsb2mVI0hiNrZWj7q1uu0xdJg8FOsRVYS4QZZPWAy65WFpIlgMR13YVi0bSMvc1KY9CiqZh03dLHltTrjGl+FA6KOdrfAJSciA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=KxruHglh
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Daniel Lang for
 package/libsigc
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
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..7ae66f3a9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -650,6 +650,7 @@ F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
+F:	package/libsigc/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
