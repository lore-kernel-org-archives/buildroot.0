Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274DAC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FBA60AE0;
	Tue, 25 Oct 2022 06:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FBA60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-6zub7ST7tV; Tue, 25 Oct 2022 06:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C942560ABB;
	Tue, 25 Oct 2022 06:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C942560ABB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C99F01BF329
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA3A040335
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA3A040335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTPkaqbpLkSM for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7B640333
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2087.outbound.protection.outlook.com [40.107.103.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E7B640333
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAaW6u+2eoQeBAXb7WJaNmF/wJf2Bqx4rjt6f/9auEXdvjPCvPLtcuKMpFKNxfOZxZx52LKmV+QXvPrMO6nj9mEHMKyLmdQi66mpao7NG+djYENFSgf3TwkiZyJzcX0+DSxs3bMSzT5OocFgZ2RRo+FmWs4wmYYoWv6OvX/pLBOqCSBYiwmjioEF5ZapFOU7V2VuoY3kOAk79zA5BVLOVJeaKoJzR1kpQg7V7NtTUhFoOTCfu0kC/BjkOhRizjaMyg18hgM09vE+wdaiG1aU7E5WABwV+UZ0Oz8IRcOub/J6u8cTi+yJZCK9oNoaKOov96BJweClj4IgsHy1SCauEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJqDkfEKB4V6keRM354uJgNDWdD1v0xu6JV3bAq9FSk=;
 b=W/zaPVAGkNVhe0gzoEWJRnAM69IOplFKuiKfW+Arz4Y/0WpM8Whi6lCC5fr00oaQX8/JfD3gcI7kJtjORunAVXwfHnWLOpYeSQ5QZToJxlYkkT8DIqbOnYi3guBJ0pFZBAd9azTv4g4Ek0B8FOnkjyAFliN1cwx0L2akBx0awJc7aqOpf45mxW78BAc25aP+imHjAvxmlDQAb5O0SieC0uev5v/dSAk0rkciSjqX3pGfSVU2/GauaBwNhwc0zBL6gKq1YHoPkS/Tp0KYbdEuuM3hLRskMW0QEbDHfi6QXD9NjNdlIOgsfwvszpBjSeRKBX2pNsGofEs4syScynbZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1793.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 06:02:52 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:02:52 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 01/11] package/llvm-project: new group for llvm
 packages
Thread-Index: AQHY6DcIOB4Te9O4DECLf+mNubyz9Q==
Date: Tue, 25 Oct 2022 06:02:52 +0000
Message-ID: <VI1P190MB0493D3E3ADB83361E32EBFD79F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1793:EE_
x-ms-office365-filtering-correlation-id: e9f0624c-e7aa-4e38-517a-08dab64e8d54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V5yozuhhskuMAqbt5VqNohj8AYHM1Yyb1xMjLa6vKOzADMm4ZvYW+lYIb+eA3bsldMTk0XwXFhrEPJ29fF80swjKqQQ5zrfvQI8A4RGcG+gthx5yzt0iN67GQjnLPR249AozEImiKR7v15Bs0k9r6qvkmmr1BSCkGRH0jYAStHn8aKaUlibGEGaThzkrEqfl61Zzlxz1DFiaPVc3MOto4JaUyjZANqZsxRGS7ABERlAFA4YPMztTbHRsc3c6oZGtcfHMWtKSJwNBBYYgopbQxaaB2jZkrnfNalE7vkPBdjky1GiqO+q3GZGWEL9XfQ0NXdPxFBC9JJFx//xq+sEY2Oq6POGlIJJHOCVVZuZQbKUmQunToXpUt7t3CKdytlA4U2ARm+rE1sy8cmsHOsEDG621uhlRTl6Z4kHoNfeZztsmBvUlzw98EGbFnvp4QuyVDiw/ARHmCMdUDhYmrfJ6kadB3nQgVVVF1xG0lBrFvOXnZTAyOSS/0Iy9f6+bVxZDYtl25nKT+ra6BgZAFQk/v+EtUCgKCjWsCrU/oXMOCaOl4MbvwI1K11DkXq6PX3fbTaiJv8TsuAlC6eLs0u5OmqK+E3Ui7c/7MNJ4HOsLgIFqCR1s39/Eh6L8WMtncKyiTR7BFmKku9WQBzEuHOS0ItHXuzLhBb3fswO+km3rIfyuYMy82XOYIK6VKZ6AYKzBvCwFTauhOgyGU584/Ii/3/8DdBhJrvKk/1Lrtig+lMrbfhfbL6zvL4Y0/0acUpco0A1j0OeiCRSjEckRyqdWuESYQTC4Ff86j9/MKqtJDDM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39840400004)(451199015)(4744005)(52536014)(55016003)(38100700002)(122000001)(83380400001)(186003)(66446008)(33656002)(8936002)(4326008)(76116006)(2906002)(66556008)(66476007)(66946007)(64756008)(8676002)(6916009)(5660300002)(54906003)(41300700001)(86362001)(316002)(6506007)(71200400001)(7696005)(26005)(9686003)(38070700005)(478600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hnk6qjWh8b40Eigif+RicHuC3L4+VqPJI3KQkU6/R6664NxYqlVEd9vt32?=
 =?iso-8859-1?Q?8eeJlH4RgKbhLzok/FcVeLd8+P88EqGJ2f32ryZRDEdczaibowmkSGJixS?=
 =?iso-8859-1?Q?m9zBopIjoM4OW2PnGc4utbm6r8miPau3x0dOD/E2XWxjfWn7LGVDorImyd?=
 =?iso-8859-1?Q?aia6934XQQZtXInjIVTBLyX9Kyj3LoGsi1lbwn9i1le4ZvlorPEccY3dBi?=
 =?iso-8859-1?Q?uFiVFCFcJMSnoiDvh6OZJMhipkaAx10HKm4z1kHLVitnIGPL671b9if6T2?=
 =?iso-8859-1?Q?+5Cp0/E1mkV/IhaxUrSGgdqoWMu+4BDG3g1gD2ScSUrhaV+3isXAc7cEjH?=
 =?iso-8859-1?Q?tN07bUE+MuP504A3GaFqpp0n+Jd2hKDMxQq9SYcj5exBpgiV6EiycHl01O?=
 =?iso-8859-1?Q?C2zFriY3k7wToEfssH+jJAD1Hjqw6JRqiBFxfQ36DrAm7RLd1eATlPqvQm?=
 =?iso-8859-1?Q?u9vcVslBcbeY62VrrGkzZW8Y0nE6DLtOt9DgsH10KkmcVQxNNvLMXXc2Iq?=
 =?iso-8859-1?Q?PndHkvIG9H3XMLBRmlhrhCNwHsI94r03IgsI/RHXiamO+xt9id5P3+Jok0?=
 =?iso-8859-1?Q?4VMufCf+ZPYzr2ggm0Ta+XPZ6WWWzRt4XElRhWkqQYtWVJ/kEAw8PQlBws?=
 =?iso-8859-1?Q?RPKo/3mSn01LVVla1pJYxohMovfimLF65DhYKUeY+iprONMA8+j+lXwV93?=
 =?iso-8859-1?Q?0RJLUbF1uPs3urqhRxLLRP4G+gzosjM+67VEsO5pW4tVI7o0m5tvgBQtyL?=
 =?iso-8859-1?Q?2S0szju2MLTJNxDZfibITIj6IM6hKf746ctRznaSkCpvQhhTaFOJ7VZnGy?=
 =?iso-8859-1?Q?JynrUiLq/67HS80xH+TQYUnELn5bmXA2dI56X3gVRpL/0V6icLioJdR+Jx?=
 =?iso-8859-1?Q?5LfJxTvTKhtAMw4nrpoQJDm2iZK3sf0Kwu/FOdKyEtuOH47PcQxrcCN6x6?=
 =?iso-8859-1?Q?J4NNjTG/3pKK8JTquU7kIuJ95zOKBxpYj7tidQ47MRRFWdoP3wXJJFsgO1?=
 =?iso-8859-1?Q?nZhhKb/mKI5MNZ8K7QeUaJ11uf/Rzp5SbciQw16JO6CXXJWVMQ50EQwXMK?=
 =?iso-8859-1?Q?5pcFhthPllgYACbbqfRYJ+BB32E8YXJEeCx4idmGgEQ7nZvIHlPLfPlpGb?=
 =?iso-8859-1?Q?BQoKiwqFV7tFnbUv6JZjFJI8xNBEDwv++kIwk7nS9+ftVPDIVaoxHYrmoh?=
 =?iso-8859-1?Q?m3HKFC6QZdiYySLS/zta8wzMtFVZipia83G1LAwpk2WvunZ0E8os9WOCHG?=
 =?iso-8859-1?Q?H3ksebp0nKfURu2Gccicm/bRfQLeSIZtTRZX8giXB6KUd60xdKjv/wWEUh?=
 =?iso-8859-1?Q?1ruA11JV/49RkZLsc5cQYWLJckjAgXzsYDtuY+U05Zl3yAxpbUUrGT6S/x?=
 =?iso-8859-1?Q?8kTPh4jjPT0XMkGctBbFdLxI8tkbrftdJylSd9Fit2QKGH6cPw7w8egvrL?=
 =?iso-8859-1?Q?+NgocKSdAwiNcQ/rZOAAQ3Ec85lNOOivprPMjoHO5kDgqf3DamlVlEd2vE?=
 =?iso-8859-1?Q?NS/nexmCRYxGFeIwDRRsrmvFji7K5UXT3/nqCxfTZpYpuwm7migEApxrK4?=
 =?iso-8859-1?Q?jcXgf4461eRQBnDiPZyqNeuphc2t7bq6mt7Onao2VJijoTtELRxyla19p2?=
 =?iso-8859-1?Q?cgRSzGF5hPXVc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f0624c-e7aa-4e38-517a-08dab64e8d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:02:52.1007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdR93EGqElcrsKNq1/AAetYeqrkw0bR3RLqvw16AMiehBDhbQG8KfounZ0OVy6FjGjFXt/r3KINhYIczRSLqoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJqDkfEKB4V6keRM354uJgNDWdD1v0xu6JV3bAq9FSk=;
 b=JsCTCZkltH4aH7pUgWoNXAx83IgiCaHz4TCqmLLliY8Q/KnLWYbxNrGxvcepfgC7/+9H9yzn4g6X2w6g6qODFOm5ONIFIwpzS3RApgxgGes/f7MgNpHJBXsheQZWtOQnZjshkDnuZowHzwr13hD5UGVUs3iAvO4mw/ydErHqiiY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=JsCTCZkl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 01/11] package/llvm-project: new group for
 llvm packages
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make updating easier in the future, group all llvm projects in
one subfolder and define some variables for all of them.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 package/llvm-project/llvm-project.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/llvm-project/llvm-project.mk

diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
new file mode 100644
index 0000000000..7ba89bb605
--- /dev/null
+++ b/package/llvm-project/llvm-project.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# llvm-project
+#
+################################################################################
+
+LLVM_PROJECT_VERSION = 11.1.0
+LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+
+include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
