Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2794CC27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3D7401BE;
	Wed, 12 Jun 2024 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXlsy0dwr7F5; Wed, 12 Jun 2024 18:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96875402A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96875402A5;
	Wed, 12 Jun 2024 18:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A88A21BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A24F980DB0
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiSr2zOKW2Pa for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.130.202.158;
 helo=mo-csw.securemx.jp; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08D7580D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D7580D7C
Received: from mo-csw.securemx.jp (mo-csw1122.securemx.jp [210.130.202.158])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D7580D7C
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:14:05 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 45CIE1xR340595;
 Thu, 13 Jun 2024 03:14:02 +0900
X-Iguazu-Qid: 2rWhYYPQFczJk2a8p6
X-Iguazu-QSIG: v=2; s=0; t=1718216041; q=2rWhYYPQFczJk2a8p6;
 m=M677dRTA0NecBXM9xER2ju5M9tEa4H9/955g0t/pijw=
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01lp2108.outbound.protection.outlook.com [104.47.23.108])
 by relay.securemx.jp (mx-mr1123) id 45CIDwBG2398117
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 13 Jun 2024 03:13:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYU7knnzb0Aog1A5egnFeDnqbSJqBOlFo/uN651JAQJk8E5lKdYHq4M42DWiGsZIzqovSLmbR6ileWoLR1rR0sk+TRbG9xY6BQaxaelsHhgSm5lHLVwDo79y6a2KjiTRKBsAmGLryOqtj+8HSBfuHu/XcXqblVMjXDloi+ynMZ3vdKGQe0I1xhJb1HIXguwiyjbUuT5LiY3Vwd0QImD1IsTvbRrReYBY7cxFtXLStzIJLLN2OhYvY8ZyEkZxwatAqdEvT1hQ1spyI9Xo6n38twy9yXMaL7q2jciKAD/pkT5+rt80QmOx0enhxln3xry2R8LK8BzGXBVQ9ra3TKCbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znIlX/NOzpEqcbKYQdRCgiVyfr9QKZY/yzsp0cBlb0E=;
 b=iLfoSxzDsyHy2xTmum3AI4bapL0czn+m5gD9+GD2QMHifJFNqf1+lQwmUTs0avSiMzxMPZS0KiH7yFUe6XNdXQB3NGxtRdP2G4KA8vOlh7pUhGLmlJwzAQUzLq10GUbCZ1W4ecoKNLZ7DlQBPI5F4YkuxQXPEALDlfQz3MszxqmzUQVe/iTWuKHeDceOW38k/p5g8ok6fpSuEzLQSCnd5V6fNlxVry4yqYYBSvTfAZQr44jQ7D48xmCOOvlj4CCoBs03/esmjlF88p0jtd0xFaOPbJAmFthhk8S0wlqucnlRDHuVVCa691Dh6rEpFEaZC7A7clKNJfrx2FPilkJ7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eizo.com; dmarc=pass action=none header.from=eizo.com;
 dkim=pass header.d=eizo.com; arc=none
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com (2603:1096:604:63::12)
 by OS3PR01MB10343.jpnprd01.prod.outlook.com (2603:1096:604:1fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.39; Wed, 12 Jun
 2024 18:13:56 +0000
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8]) by OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8%5]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 18:13:56 +0000
From: <nick.whitlock@eizo.com>
To: <vfazio@xes-inc.com>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
Thread-Index: AQHavPRKWjUkzbalQ0mcSsOrIU0loA==
Date: Wed, 12 Jun 2024 18:13:56 +0000
Message-ID: <OSAPR01MB45614AE4E1CEDF345FDC83AE84C02@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB4561:EE_|OS3PR01MB10343:EE_
x-ms-office365-filtering-correlation-id: ef7b96ff-bfff-4365-0cb4-08dc8b0b6cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230034|376008|1800799018|366010|38070700012|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DbsyrmL+AjS4WLsNUrMvGZ46wm8BD99ajRZmQZzCsBGRDw6Bm216f+xcJ7dP?=
 =?us-ascii?Q?Yj3vLnxnW3OB41CegmIGdKEXf/65KQI9vaPfVHqYm6GTbozCbyjwwRHtcOak?=
 =?us-ascii?Q?6Y5hnSl2Qjk6G8hve1Dg15bzRkMXSDY9DLyR/LqsODk9AfC+WyZORX0phfHC?=
 =?us-ascii?Q?t/BKPc2hSCn9497bHcIdM6LUyYQp9hMHagkPxc04hFpF07tU3PPL1eQS4uNX?=
 =?us-ascii?Q?xMOTOcGGYWHCnvptsySqr+gThOTH6TKEWeptxesPiDH5Q5Pi9cwyliP9cHGQ?=
 =?us-ascii?Q?adGGLYhBXQclr3loAeZrtSexGhHRpDorC9mjKVd4lZ6Oz1+8Wj+qRIyV75yQ?=
 =?us-ascii?Q?a/SnL/0ykx6NTDpdOK3oQRZMw8RBETOHb2bgvi6OT8vYYspXnQ2OYLoOR+/n?=
 =?us-ascii?Q?dXI9taiiorYuCErlxJqPg2LmacWeWBHW8cxZKMEBy0vRB7a9jfveQYEHGAOs?=
 =?us-ascii?Q?lDs029KdMa92tL6duKM8nZ71sp632drNeJrvEX61oabMZQ38TLX2/O3ayW0n?=
 =?us-ascii?Q?wbjMfo2h6Ribxup+gJXCtqGoopIuK8qYbRMEL3SbacWtn30QNLVxcTptWLBi?=
 =?us-ascii?Q?QuyAwDh90j9fUDsCLPTCamwpyfUIaKdKOWY3q21vUYh3Ncfpiz4WGtOO4/wm?=
 =?us-ascii?Q?zo2OsaGHifoOku3r/JHF8ZZI6JZF79JlxYZV/q1wh/g89/S0aizh9DuZELuX?=
 =?us-ascii?Q?wh/p9uIkDzqRlteEzSA+igIifNYZt4HbkJRgWJ85QCz8ZY2ciJDH1lmfbaOW?=
 =?us-ascii?Q?4gT+kUfIaTuq1gyB47gQuLLs0g1O0OFhIqpWJKOEV0HdA/XL2r5XY2ZfBXJS?=
 =?us-ascii?Q?3jTH0TOGwPJpga1fLCZofMtL16tr0ujvgJ3QoF1tufmIkID5avQ+i4WZQ1fh?=
 =?us-ascii?Q?Zc1bKWFBuLQZ+c9Tq+HMoXgcC/S+HqDBa3tQ2GkIUX2Pb97ElAWBL8A5Ae/+?=
 =?us-ascii?Q?hql8Vks8p543ADFIumDJ0bwWMseWHT0oEiq4Pqcq4n5Rcsq9BX1O7EMuylCw?=
 =?us-ascii?Q?bvRoG11oMQs1bO4Inov9bWR6Zfsu/3zoja4IgCv1mG/dsAZH1sQpZePEPwNT?=
 =?us-ascii?Q?1SIHHfawjyjCP7zF1e/I8wBOfxUZp7ldY1arz4slQmIOq99QAYcYkU4OK75+?=
 =?us-ascii?Q?wAHo+d9vP14En3KBVYNhEyHSLNWbasulQQMVKZswqInRFSTlfbsw2ipFxJMd?=
 =?us-ascii?Q?QbCRuGu8MmFYkeqdm4700+E71HZmb1E37gpRxQNoGLMn3kIppUvJvpMPL6Du?=
 =?us-ascii?Q?MhgVn+p75izIO8cFHWYMyzBAQz6TTQxGpCSw+b26yL9dqXjaB5PX6RM3ZV61?=
 =?us-ascii?Q?qvAaykJTCq1NigZN6WAMlYP/+C8wPrVUVnsHVJZF0ZwbQ3EDyG73KfnIVohR?=
 =?us-ascii?Q?0JnddMOq/XJ7XNvwipj8MiVw93cS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB4561.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010)(38070700012)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z/OcK2HMwf1j/DFlPGUIVevX6BkTihv//CUlBnSUcJVi8PUulQwwlcuGoaM/?=
 =?us-ascii?Q?xsioHGICc5o4M8GB1TTiIDEzWoRYutvRe1lb2AX01xCIu7TA6IE1yL1pqm7M?=
 =?us-ascii?Q?sBL6vppfd4NNDyzHQQm3jQyBpV7JbTN8BlcFJ2nfn3QIYcRlzff3c+5st59J?=
 =?us-ascii?Q?IOcPydxcsHn7325sFP6khXKxH89gDQONTO+bCeQQF0JZfFNNCTQRsWNzghiU?=
 =?us-ascii?Q?g0qKcpRupJGaZ2KLgSGaHcpVTsvJhoCMyBWu9GZdcEGSPMuzK68m1WLi65IO?=
 =?us-ascii?Q?LjwNFpI/ka+XcwwX7fFJ/89k18XHvg/0exPYqd4aC0Mx9GQlG+iRSgSiALHe?=
 =?us-ascii?Q?22nj71+EwYQbeZOE7EXEYHV6WYxM59TF+eMo9bkufGVwVdIgOO0cqU083mrj?=
 =?us-ascii?Q?Lb0zmEMJKVLPAop/lkIkGoA4ABEMiIkaqLDWIKeQUDhBw/qOLE9BFcoKiufy?=
 =?us-ascii?Q?v1z1qp/T68rAyBFzfAKoLxZwkE8S7pcv5zDw4QpwVSJf5ZcRDQjdthoSmzHg?=
 =?us-ascii?Q?Ob0RTe3SKv7I0r34UEKd0fIub7UEgP06ACN5na0wYNyYZvzMn28cFXFOju1O?=
 =?us-ascii?Q?5aH6EGgKzXiXjG5o6rCMw8PfuBenJMTMwFqIlVBdUrxYDxJuZ3dFGumdtNVv?=
 =?us-ascii?Q?XRFHhmKCP7E9D8kFgCCmEIaxellcoeWi5AK0nOEX6Zq9Tjf1Uo0YYoMNW/iL?=
 =?us-ascii?Q?J2HRZc93PVxhI2RgGwmE1h/gkdtVtspydcKHqFatwbL7+USsKlI1R2UJcaZ6?=
 =?us-ascii?Q?cD0MdzF8rKfrVPGHC1y+4t4OriUTyAbvPfU83fxc62th7NSmZ3VEujICs0ae?=
 =?us-ascii?Q?J+1/rpE5UbYKP/gFgjGcwLzghk916N1pAzPYG0wcLkkaWchdbzOXdV1zsP9Y?=
 =?us-ascii?Q?8ao7YQZ+N0QmmzsxbaHYSbkt8OO1V/4+aFcOtVp9PVfXWTQy2BaBXzNKmFzC?=
 =?us-ascii?Q?tNavCvOPOMWUF9DuIZRMIVz6c1IRwXr6Emlfh7d2J+yrSjiYCgHpWpbUaJb0?=
 =?us-ascii?Q?uB3jaRpRmw8Y4psi0Uz+jA2dzKy9pZiHsBZnb3kpraamAbBCXBqHj3vvVnO5?=
 =?us-ascii?Q?aX5ozEqGyJ1YO4FCw06bRkc/HjZSUasmJ3Dx55XTeuYZn/SKMDtAnTnr1/OS?=
 =?us-ascii?Q?vm2+XbNwFrDvEh8G8y1QdxpHMlRZisDu4X4XazMZduVk66KNS7MAJiOVD+kj?=
 =?us-ascii?Q?nB2+kJbUsJj8l+cV/IxC6lIRT1JsWmzgfvVY1vr2L+ApT8BWBqmkHN1/SeYH?=
 =?us-ascii?Q?2tkL+5xozzP2Ulq3hftUOHDjDALjLslDPqP5dSJ7BwOmK/fXnEEtDeYntFyC?=
 =?us-ascii?Q?dUelexSauB81K1GLC2Uy2WHuxAvSPczcj564oftcZ/HDWAXx08pSe/qKiRBw?=
 =?us-ascii?Q?TXzSjMXIcH+QCwDC8nie7OurD0dvKf6blG/V+ZmuO8Fsp3q9BubueoNipMip?=
 =?us-ascii?Q?gPVM3AfWhTqLuUak/weXEOZD+tAfHGk8UpIz+sh2yGyKqiSdpojpFPrFNcis?=
 =?us-ascii?Q?YwOTkMGLvTWPHLuBESOQnZrj/ZJXVQvMQH56ohS5fpqnJqc2SW9s6jA6lqBc?=
 =?us-ascii?Q?//XV3jH1N8mvorsAzLefjbmerbZBxxVyo+2ADhn4OVMia+uHrYRpw9HiTvnh?=
 =?us-ascii?Q?xg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eUu6jXaSD2IgcHiih0hQ1P1qFLxclD5lO+mAXkVVN7vBIFzSfKKIUlHoT4kYD2Ww7ooxBWgn7qPNZlBBgdakZpoS62FwPumwAAIbZd45xHauhjprMEGI2dhI0rTaYjX0VTHu1qx/YCRFnAT0uK6OGa3VoBTemoYYBLhMuj0mJPysMjM7FEoEQ4BeGmqRcRPh8pJtbRTcYJmbBPfdRI4RdW30ckS/lla6/NqB+o9gS5CV8FupW2MY8JtA7ys0o5ewcRsOEFAHWIdBZ6NJhOhun4x5FVhqG9pkQk7WACviGZ1J6hTQQY5/Bl12losh5tGtpJE9iVwC/EA4OvqxrZgv2genQ7edusNub50zzvAWzsmDRqleTwidg2aCmaA8T4maU+4NqKVljD6znXpY0bsiK/ScQyCoGbwcHBRE83vZmF1p/3tfyXtZngKoTJR2Le2bv4+wMmFpIzpiGlsRe75Goba6oHl88JGQiNcuPKEvjkxGWiPlmGotlwGaNU4Ua+myay98hpmne9EficEqZu3PLYS5c0Y4t206jIb/lxRnUeulfY8r+e6DeTwrsKq4jkGl/+CDa+9qC6vgjExTG9DRvg==
X-OriginatorOrg: eizo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4561.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7b96ff-bfff-4365-0cb4-08dc8b0b6cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 18:13:56.6872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2329f911-3157-4dd1-9105-ef837241b69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gv1JJ+7voIl4PDcc97E1mhIwSNn9zaRY4OzYylzd6qRD6fcHHNAj6GxlX3sbHlcg4jmAMoS1qJ8a0RpB6xGpMluUGm/jknAp3qwH92i2WaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=eizo.com; h=From:To:CC:
 Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:MIME-Version; i=nick.whitlock@eizo.com; s=key2.smx;
 t=
 1718216042; x=1719425642; bh=KLU/7nZ3jEAaLqmn9l/1netWXcP/nY2fBcspNQM6Z3Q=;
 b=pOq
 cPli0ImaJ8oiKojhieGP/K11LGdyW+p8ghBzemOFy7mxsW9kc2iJNoiqVQe532svCOaYM+RY8ctof
 gbSApJOImOalhjFv8AwIbpQgWQobi0b3VN/2ogquTG/FacBrfmeTq5uV8w54vvksawh6IVpQIW94F
 kIrSMekcVMs5WwSBfGzqnLn3KnaF0YAUzT/yr0bQZDUD2fexxA8Y3nzpZhI6g1eaVuSEI8TtmnE06
 3atPGccJiutHesqCxCq2L++wv5PzSqce/oK8tRThqI5Qz3woOSYVNo8oqeU6A9w32BI0VJLYEvOlA
 6L/CCgxLvXlTakyrPNfMYVwDtsnDaXg==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eizo365.onmicrosoft.com; s=selector1-eizo365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znIlX/NOzpEqcbKYQdRCgiVyfr9QKZY/yzsp0cBlb0E=;
 b=FCfxUaGTCe3DEVD8sTt+MwxtK5RKZD1Lq+PGkoCwQRd1Bv4SCY0V/h1pkFKir/FiQttdgKZoRrGX4yQMZQe4v4ZmT49VP8LsWDwpOpt8KizCjMSsN4pm+OP2Kz++yoWZMCpKNsvE57dKqmaTpIpr1QqGGPyOspRJxhs+oQXWVQ4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=eizo.com
 header.i=nick.whitlock@eizo.com header.a=rsa-sha256 header.s=key2.smx
 header.b=pOqcPli0; 
 dkim=pass (1024-bit key,
 unprotected) header.d=eizo365.onmicrosoft.com
 header.i=@eizo365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eizo365-onmicrosoft-com header.b=FCfxUaGT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eizo.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello, what is the status of this?

Nicholas Whitlock
Software Manager


www.eizorugged.com 
482 S Keller Rd
Orlando, FL 32810
O:(407) 262-7100
C: (772) 643-5400
Company Feedback 






-----Original Message-----
From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of nick.whitlock@eizo.com
Sent: Monday, May 13, 2024 4:04 PM
To: vfazio@xes-inc.com; buildroot@buildroot.org
Cc: yann.morin.1998@free.fr
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump version to 550.78

Hello,

If a selectable (or user-enterable) version number is the consensus, then I'm all for that.

There isn't currently a way to use recent NVIDIA discrete GPUs (read: Ampere and up) for GPGPU in embedded spaces until this gets resolved though. 


-----Original Message-----
From: Vincent Fazio <vfazio@xes-inc.com>
Sent: Monday, May 13, 2024 2:03 PM
To: ERS Nick Whitlock <nick.whitlock@eizo.com>; buildroot@buildroot.org
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Subject: RE: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump version to 550.78

Nick, All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Nick 
> Whitlock
> Sent: Monday, May 13, 2024 10:59 AM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Nick Whitlock 
> <nick.whitlock@eizo.com>
> Subject: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump 
> version to 550.78
> 
> The NVIDIA drivers now have 64-bit and 32-bit versions bundled into 
> one .run file.
> 

I believe this was always the case. See the /32 folder in the x86_64 run files for 390.x

> A configuration value was also added to check if the user wants to 
> install GTK integration for the NVIDIA driver.
> 
> The legacy version of libGL.so was removed in favor of the vendor 
> neutral version.
> 
> This has been confirmed to work on kernel 6.1.4.
> 
> Signed-off-by: Nick Whitlock <nick.whitlock@eizo.com>
> ---
>  package/nvidia-driver/Config.in          |  3 ++
>  package/nvidia-driver/nvidia-driver.hash |  7 ++-
>  package/nvidia-driver/nvidia-driver.mk   | 69 +++++++++++++-----------
>  3 files changed, 43 insertions(+), 36 deletions(-)
> 
> diff --git a/package/nvidia-driver/Config.in 
> b/package/nvidia-driver/Config.in index a8617a939b..0fcce93e28 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -90,4 +90,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
>           provides Unified Memory access to the GPU and CPU memories for
>           CUDA programs.
> 
> +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> +       bool "nvidia GTK acceleration"
> +
>  endif # BR2_PACKAGE_NVIDIA_DRIVER
> diff --git a/package/nvidia-driver/nvidia-driver.hash
> b/package/nvidia- driver/nvidia-driver.hash index
> 620112e6c8..06e3314d53 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,3 @@
> -# Locally computed
> -sha256
> 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677
> db  NVIDIA-Linux-x86-390.151.run
> -sha256
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c4
> 7c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
> -sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997
> 526  LICENSE
> +# Locally computed:
> +sha256
> 34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf7
> 3  NVIDIA-Linux-x86_64-550.78.run
> +sha256
> 5ac626496a6388d37cdd53e0300525267a4b8c89fb5980da060783afd561faf
> 7  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia- 
> driver/nvidia-driver.mk index f1217b00aa..9ea97a2a9f 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,10 +4,9 @@
>  #
> 
> ############################################################
> ####################
> 
> -NVIDIA_DRIVER_VERSION = 390.151
> -NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64) -NVIDIA_DRIVER_SITE =
> http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> -NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run

I think we did this so that 32bit builds didn't need to: 
1) fetch the 64bit bundle
2) handle the /32 subdirectory based on the target bitness

If we used the installer's native logic, IIRC, it would install both 32bit and 64bit libraries, hence we stage the files and copy out what we need.

> +NVIDIA_DRIVER_VERSION = 550.78

We had some discussions about a bump a year or two ago and there was never any real consensus about what we should do.

The challenge, I think, is that the 5xx series drops support for some common NVIDIA products that may be more likely be used in embedded environments (like some of the Wolf GPU products).

https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/

At the time, we discussed having different selectable, but mutually exclusive, driver versions so that users could choose the version that provided support for their GPU.

I had intended to do this but never found the time. I was also rewriting the installer to be manifest based but that too stalled due to lack of time.

> +NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86_64/$(NVIDIA_DRIVER_VERSION)
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86_64-
> $(NVIDIA_DRIVER_VERSION).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License 
> NVIDIA_DRIVER_LICENSE_FILES = LICENSE  NVIDIA_DRIVER_REDISTRIBUTE = NO 
> @@ -23,30 +22,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
>  NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext 
> NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
> 
> -# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; 
> it -# has been replaced with libGL.so.1.0.0. Installing both is 
> technically -# possible, but great care must be taken to ensure they 
> do not conflict, -# so that EGL still works. The legacy library 
> exposes an NVidia-specific -# API, so it should not be needed, except 
> for legacy, binary-only -# applications (in other words: we don't care).
> -#
> -# libGL.so.1.0.0 is the new vendor-neutral library, aimed at 
> replacing -# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The 
> latter contains -# NVidia extensions (which is deemed bad now), while 
> the former follows -# the newly-introduced vendor-neutral "dispatching" API/ABI:
> -#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-
> opengl-abi-proposal.txt
> -# However, this is not very useful to us, as we don't support 
> multiple -# GL providers at the same time on the system, which this 
> proposal is -# aimed at supporting.
> -#
> -# So we only install the legacy library for now.
>  NVIDIA_DRIVER_LIBS_GL = \
>         libGLX.so.0 \
> -       libGL.so.$(NVIDIA_DRIVER_VERSION) \
> +       libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
> +       libGL.so.1.7.0 \
>         libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_EGL = \
>         libEGL.so.1.1.0 \
> +       libEGL.so.$(NVIDIA_DRIVER_VERSION) \
>         libGLdispatch.so.0 \
>         libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
> @@ -57,13 +41,18 @@ NVIDIA_DRIVER_LIBS_GLES = \
>         libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_MISC = \
> +       libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-api.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-egl-wayland.so.1.0.2 \
> +       libnvidia-egl-gbm.so.1.1.1 \
> +       libnvidia-egl-wayland.so.1.1.13 \
> +       libnvidia-wayland-client.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
> -       tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
> -       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
> -       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-glvkspirv.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-rtcore.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS += \
>         $(NVIDIA_DRIVER_LIBS_GL) \
> @@ -87,13 +76,26 @@ endef
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> +       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvoptix.so.$(NVIDIA_DRIVER_VERSION)
> +endif
> +
> +# Include GTK libraries (if required) ifeq
> +($(BR2_PACKAGE_NVIDIA_DRIVER_GTK),y)
> +NVIDIA_DRIVER_LIBS += \
> +       libnvidia-gtk2.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gtk3.so.$(NVIDIA_DRIVER_VERSION)
>  endif
> 
>  # We refer to the destination path; the origin file has no directory 
> component  NVIDIA_DRIVER_LIBS += \
>         nvidia_drv.so:xorg/modules/drivers/ \
> +       libnvidia-pkcs11.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-pkcs11-openssl3.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>         libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
> 
>  # libglx needs a symlink according to the driver README. It has no 
> SONAME @@ -107,11 +109,13 @@ endif # X drivers  ifeq
> ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
>  NVIDIA_DRIVER_LIBS += \
>         libcuda.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
> +       libcudadebugger.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gpucomp.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-nvvm.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
> +       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION)
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
>  NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server 
> endif @@ -152,8 +156,9 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == 
> y  # virtually everywhere, and it is fine enough to provide useful 
> options.
>  # Except it can't extract into an existing (even empty) directory.
>  define NVIDIA_DRIVER_EXTRACT_CMDS
> -       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only --target \
> -               $(@D)/tmp-extract
> +       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only \
> +               $(if $(BR2_x86_64),--no-install-compat32-libs) \
> +               --target $(@D)/tmp-extract
>         chmod u+w -R $(@D)
>         mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
>         rm -rf $(@D)/tmp-extract
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do 
> not click links or open attachments unless you recognize the sender 
> and know the content is safe.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
