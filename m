Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE6C3A59D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 04:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DC060AA3;
	Mon, 24 Oct 2022 04:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DC060AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L41cDm0MG5ed; Mon, 24 Oct 2022 04:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60D5D60A87;
	Mon, 24 Oct 2022 04:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D5D60A87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35E871BF3C5
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 04:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C265D813AF
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 04:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C265D813AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dU_nQmvVwmak for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 04:57:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6163E81360
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01olkn2166.outbound.protection.outlook.com [40.92.63.166])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6163E81360
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 04:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGLKLtv4CQgkdS5BKPYG3Wg4uslACwuvfzx1DDyyPdA9UiCSYFLNCgFoLsIO2vL8K6HubVLESPJSA92poCXcFFiNLlCwJtiweP5nI++HfX+b3uO2AYhWCQfOV28fBUCs8+nz+rmxOPxb6JZ/JAmxLeZgubJFz3fvLHcseeGvRk26PQlQld0oaraC+K6YxfUN7mvqLPybmhXXNwHLRN39XTVqGwJdN75jfUNYNMDAZIdZPqi1U7mfZvMFZBy8581u2nxLtXZ2yXf1aIeZV4mzACkVq9Ka90ywpg1e3lFgTMv9oDtF/ag7ZHoqBmLwninlB9O9312bt6nvwZqZOwFglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UgOBmCSrlo2jlDgk8sfoAE6NQ3tfHzSbv/4C0WSgVU=;
 b=bMXg9OpbdcrnwB7Lluhyy7x0JhDethPD7xSAnrpwzaliiCQMv6YMWN+VyWyXLuNnbmOdv3OqSQZftjHMNtaBHBkw7jQAKCkqQiEZUIh3biKGfs+dY0KYCLfFLdCJP5mSE7horVsigach6wWzkunULHrnPpuHy41oMB9FCmH5HkRXIK/n1KWwsDXKxJ7EUJhahZ+aZe1Y/hNP9MRejPzmeGhSgKnuAPPjYdBh9Rbv+D4v+FHCYv2p+NFQGdyoSD4bdI0QxpNmwoDpxbGFsp4Nm4KqZp7Gb6mAylEqSFpCitCE/up5Dnw2a6NAooQtgxrwEVh1XkQnqRk0Kh/sJRN8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:161::6) by
 ME3P282MB3982.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:1b2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Mon, 24 Oct 2022 04:56:56 +0000
Received: from SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::e2f7:fbb1:e3a0:f1af]) by SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
 ([fe80::e2f7:fbb1:e3a0:f1af%9]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 04:56:56 +0000
From: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: buildroot defconfig fragments
Thread-Index: AQHY52SwcSV/fo2OLkyv/bZdIclWAA==
Date: Mon, 24 Oct 2022 04:56:56 +0000
Message-ID: <SY4P282MB30146A94B616ACB2F0B59EF3CB2E9@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [l0DKS9jVMiKV8YCADyMPdiH7ZhN0gkJR]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY4P282MB3014:EE_|ME3P282MB3982:EE_
x-ms-office365-filtering-correlation-id: d33b2940-b530-41bd-f9da-08dab57c2cf6
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zjIw0xd+KXMlwX1BkeMCiax2XJvRXIKQ6Py2b/aUcKmTHTmeYCKXXvhhoHYXMIUGyA21KYsRcHBXBOhAv3Q4I8vddsizTElYNIgJHEozm0i10nvQOodPj7XM4hkQcyn+ktbX3hoyB/3guR5kfe3NlNQekpQFISTByvP55UOYPjR2OlPh7YAjuRib2ZM6m2/W+CgcNbK0ZMwODwavVuuBnuwERARKjuZg54qTSAynYudyjgYczcfWOeZZ0MgfAV3rJrq6EUctuQxwuBb6B0SgCSobWeWRft3ofaCq/DZaKjhsKOMXIfBvDlsHyoTA5ryzIJlrfkSlZDBSD5NLSB16RHd9E/22Rch0D3NjucxQ8NV9xzp0X+ng49GmGElVXTVioPilNn2pKTN6O5Dh6LkeZuY9y/7qi0FYLxS7t0cDUBK/gHHwCPwf6/YAGr1oWQ0fk7Amx3Bu6KOU7IZzW4bzYIK8dQXuQdMQNcqbu067gkjLab0WA1UW4I+mnxxhAmDsALRFTFa0M5rI3aaE4xwta9CQm7e1j5O06+ZAEjEDbakfN+4Dmj5Sf7ayajunRQt/nG9URUkiSVjzJOt/TFvK5/Akdqdwk1Wpr5dVx8bPA+RjUQu6ifD6gyMuO2xmMUmL
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SLi7wT418uVyt2aF5eiwSCrnGEs0uIvh9btYg4ELyfegmPYBV9Hp/W4z1e?=
 =?iso-8859-1?Q?dnIQqyeil47IBdpymwrPmFpkm9ElWZmDExW7XZzQ/A3URb/NxvpQXCXIxW?=
 =?iso-8859-1?Q?2mwvEb3WrMwCw42ChhHQ9SPjVTU0jgGxlNGNa2dOQwpbvchSLdKdbhOO5t?=
 =?iso-8859-1?Q?U+DT0RChIibmB/TDIkxDb2rkf5chNxbJNz0LW3oufA20A17cjOBC11fE0Q?=
 =?iso-8859-1?Q?ekk2qjRuWQfILAM1ZgcPYM+KYS7/WUVNoTY2//VUWPvZ7iiKIL8Qn6La2Z?=
 =?iso-8859-1?Q?OeKMb6ZgFO4PJn+G8GSnSmA77Wpl2m8TlpWzdxnu1D8teFPYL5p5/hL7g5?=
 =?iso-8859-1?Q?slL+vqO4VZ6yuZX7Uipw+zsBSLx62AjvDQvotM4z63/MhuoM75IpEV8noU?=
 =?iso-8859-1?Q?Efk5ZIUPV/RGcyF2WdpHIzvSaOjLN0jhxhIr7hE59qP9HT1QcBOns8FW4d?=
 =?iso-8859-1?Q?g8JZN3AX4N/yV8pvuKv9DiFkmrqSJgg8JxSSBcBh50PtlXAAG/NkWSHMJU?=
 =?iso-8859-1?Q?rMc8A9jX+TovQTyBQvoyfIHVeWKwaFrwoS1WjQmNwFDhCu3oJiShrQSG4d?=
 =?iso-8859-1?Q?EuIShg11vwNgCmQUIsVsiGCK/XV5J6M1tFkpzBo0KRMNAFs1dWMTjq6YdV?=
 =?iso-8859-1?Q?o36TeA0UokMUT7V8xz8cADFiued5zVtxSzBJqxWhsCYiFbjkwW/e71iGlU?=
 =?iso-8859-1?Q?sB/AO436MrlG+H4MmHeEO4eDVssNIVhQNGkIcswF+EBmrwB0UagSGZBHT6?=
 =?iso-8859-1?Q?EUTfLqrKaO0ux/30oGGSA1tWhrIvpgdtSIC1qdyNO32k8NGepBODXdywe8?=
 =?iso-8859-1?Q?vivjrfRz1tTCYiP0CIs12EmX0Vxv7jHaVgt2CTIxieGXiy47q+lvMtAxTp?=
 =?iso-8859-1?Q?7Qdd8S/07+zun+jaLORg57UPBrsiVIYQyjB41vcrxGmV7pWKQ+g0nB7CQI?=
 =?iso-8859-1?Q?zQXjFabRZiPPkyGj3g1QW5paZKtwRCnYY773PpmBtyz7F7GNCcieY+4IRh?=
 =?iso-8859-1?Q?zryZ/L4u/cfY0YN+CyNXxOWyPStGoF4aawyfp2GMJ1zhq1NwwV4XwGhgOk?=
 =?iso-8859-1?Q?zQogwIueNnGSpthRR4Xk1Tj2SFu+9xKMqMsFK8R5cRGlavSymdzcU+3Ky8?=
 =?iso-8859-1?Q?BcKpQKl44LsCtCTrQbolOIyjQbsCaR7pYG13rJzbVodnZWycxCcPaHfREI?=
 =?iso-8859-1?Q?l/c5KHY7AKq9cYH95K8mbA2Gnvyzdn/xe0A/oKQrhPsuqTAO3DMsbv/1eF?=
 =?iso-8859-1?Q?0hQI9FxSdPXm9DdnfhwSZ0ym9mKkqTpc6+Q+7o+OQD9aUsDRr9v5jbJQJR?=
 =?iso-8859-1?Q?ji4qYZZx5hE3GpCtSXcJRq2yMg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d33b2940-b530-41bd-f9da-08dab57c2cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 04:56:56.0677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB3982
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UgOBmCSrlo2jlDgk8sfoAE6NQ3tfHzSbv/4C0WSgVU=;
 b=sR+LkL4PJ7rXPSWcchQU54yGHAqnICAYsAYNDORWica/sUWdr3H5oj0r4OIyrF6Rpz4Y/Ufs3NBrZnnYFoZAlad+bGCndcDvmSM9XI/zKsi2a4x9zno+Y4AwHrSbUYZneuL8MbGP6Wln5EvRVkFoc1N6XwLaLan04dVVqMN0Hl5Uc/hoKq+UvSVFPaIN8V92trp8NJkVUrGMIk3ggXlDPkPjixpJGDc1kmvGtFQueZae+uGaeJK5v0fcBuIBO2nsuyT0Iwwm3GJxPUWFCY0Tp+RPGySOJP00XNr1PdqpJwCM5qFvtBrzbHdfGTwlF65MVupgN2BPDkK4Z6RI7U2bzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=sR+LkL4P
Subject: [Buildroot] buildroot defconfig fragments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hello,

Can buildroot defconfig take .config fragments?

something like what is suggested here:
https://stackoverflow.com/questions/44078245/is-it-possible-to-use-config-fragments-with-buildroots-config

Thanks,
Bassem



Sent from Outlook



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
