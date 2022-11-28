Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B6C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 15:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C99E80A4F;
	Mon, 28 Nov 2022 15:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C99E80A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlAKyTbxZIFH; Mon, 28 Nov 2022 15:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D41E8145B;
	Mon, 28 Nov 2022 15:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D41E8145B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2B731BF329
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 15:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948044087A
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 15:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948044087A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJZ7f1XoD4p4 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 15:17:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF7E400A7
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF7E400A7
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 15:17:55 +0000 (UTC)
Received: from mail-db8eur05lp2105.outbound.protection.outlook.com
 ([104.47.17.105]:6303 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1ozftG-0005N1-0D;
 Mon, 28 Nov 2022 16:17:50 +0100
Received: from DB8PR06CA0060.eurprd06.prod.outlook.com (2603:10a6:10:120::34)
 by VI1PR0602MB3613.eurprd06.prod.outlook.com (2603:10a6:803:6::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 15:17:47 +0000
Received: from DB8EUR05FT060.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::5a) by DB8PR06CA0060.outlook.office365.com
 (2603:10a6:10:120::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:17:47 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, BODY_SIZE_25K_PLUS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, MULTIPLE_REAL_RCPTS 0.000000, NO_FUR_HEADER 0.000000,
 OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000, REFERENCES 0.000000,
 SUPERLONG_LINE 0.050000, SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000,
 __CC_NAME 0.000000, __COURIER_PHRASE 0.000000, __CP_URI_IN_BODY 0.000000,
 __CT 0.000000, __CTE 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DATING_PHRASE 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FORWARDED_MSG 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __IOC_PHRASE 0.000000,
 __MAIL_CHAIN 0.000000, __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000,
 __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_URI_TEXT 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __RCVD_PASS 0.000000,
 __REFERENCES 0.000000, __SANE_MSGID 0.000000, __STOCK_PHRASE_7 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000,
 __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000, __TO_MALFORMED_2 0.000000,
 __TO_NAME 0.000000, __TO_NAME_DIFF_FROM_ACC 0.000000,
 __TO_REAL_NAMES 0.000000, __URI_ENDS_IN_SLASH 0.000000,
 __URI_HAS_HYPHEN_USC 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000, 
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2022.11.28.143616
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB8EUR05FT060.mail.protection.outlook.com (10.233.238.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.21 via Frontend Transport; Mon, 28 Nov 2022 15:17:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.51) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 28 Nov 2022 15:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc074w+ZackPQTIjffbT3PWQB9YHNyyu1xRNyuN/NYCeGqYOsWO4dy7ScDCRfA/gJvUs3qcdwT/q0h51SgM+W/T0y2Z+8NqFrc9b3YTEsVxLravYTMUjPI6vV0mCxHsHMAtiZCXiyNMQ6PJ5fkdkQWQGTjmlvPz1QutdAnNa56yOzma2xn4QJ/K/QytbCeEcXCw2rcwi/lHPDhmv+kHEeEO9totfo3GeYLOAc3qJzw5yySaTNLmrrnN3ltoveq7D1FcgWJZbmwll3yRNq+cXrl6PUPVW8PY+RAcXLHqOnJLHq2ReuQ0T/3w5PWdgK06VLc0akJCOWTC53IC5Kp6CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K8HCk2El60IRGTpZPFM4SOXxt+UTqneDvSzgTGwyzU=;
 b=OpZaX7ENAhfO4tndd89xWxqm7vO2aPQqozWPxPkR7HAhhTUVtrj1atLWfS4yUXJUBz69kV1W+zXY1hhe0XpkG/wtZWDKeNOvH9iuk2VpI0BxZuUiGf1+5iQM+M84dwVO+aNjMTocuhdF32g9huBToaScwaGU0xFzt8NjYCzornGqtLEzrINI3SPFKcTOgZ44b87W6Tf2au6wNXlTG+O+u3vrihyfdAcznUuRiLJnSZ1D2YMp+GS6AX0ltuiKah4wSpRAB6Wy5WYpbNE0l5kmZudB7OA0Az1ClgCFctJndFzFJLy6r5aK80Va1/87ubHM9YQuYhBJOR2FwGU2VNXQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by HE1PR0602MB3642.eurprd06.prod.outlook.com (2603:10a6:7:8e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:17:42 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%7]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:17:42 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Index: AQHZAA4I4kgHULsEBU23MOO8dSK4y65OKUqAgAErrT+AAH2SAIAEk9jt
Date: Mon, 28 Nov 2022 15:17:41 +0000
Message-ID: <AM5PR06MB31539DCE3243B81D0E0B9D6584139@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <CADvTj4rmM5-9_qvHqKCRA3FHebK5O3po2dtUg7bXkPW+Oii8pw@mail.gmail.com>
 <AM5PR06MB315361D4448EE9C17B1C3F65840E9@AM5PR06MB3153.eurprd06.prod.outlook.com>
 <CADvTj4p-u4aELr0Km=cGzh092dMXq0rq=gVOHV5jC=eQagrYXA@mail.gmail.com>
In-Reply-To: <CADvTj4p-u4aELr0Km=cGzh092dMXq0rq=gVOHV5jC=eQagrYXA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|HE1PR0602MB3642:EE_|DB8EUR05FT060:EE_|VI1PR0602MB3613:EE_
X-MS-Office365-Filtering-Correlation-Id: d4db4eb1-8408-467d-a776-08dad153b4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OAXDrSgoi8gq3sXZrYXZTNACxZFdNXw8vgod8UV4hJqxM45k3ZQ2hk9x8eE5QrgqI3JdhI5ELpSTTCVgwFyiw1iqVJM2jA9ujWbK+JiCf5YhJBQOGGFse+WCykUbjeTuqFnowk2QHJv1d/BXRfvH+SaL3wCU0H2LaUakRMuNfDDzj0SVak9PfLvgff6hjESfWEC8IX9IFrxV1viydipBp+4ZuAbnKj7+Qu83edAIfX1OaIDMeCYnqP0LMQ1zJLICo48XsDEz6vBh+fXRi5o/lCx/ELQg834/quTlVHijTnJYwETcikB3WdUODAdyMYVH5J2M4+j8g1cRlLtebnlFgMKzAp+dtL1v4DDgzkhAgmPigk0e+U1K8kuAjpYYlLIOdwsnCL53sKBl0ilJnUyWPwzvxM9CeKNcRrJ2Tq++89NGhZW2JvAUMjWDmbeJZkbw1cyjS/iuh/Au7/LyJLOv/Flw8W6ZxwKOw/7XcyVpeKX6E/yc47hbuEQ6BOB2OeDfDDVDiXNEHp9sf1M0AM00wKvnCWuH3kB33C4pRZj1gAcA0F0gbUCW7QGkZy7rmTqzfE28m48FPGcT9WdBhUFUBEypF02ctKfDQScJmCBINp+67+/qSOa4UdPJKwR70+4O2klMhgSsSvzIpW1IPcbxiXWebHK6aCETHzb3TC6DwTc5Zrh+sBfIGZZMEr2t73PUgEO6nvLhAs3zdxFkHDlo6xTXD9FQ1dmYPC3WllwbQViDZs3vPi1XmI5xUk+xWz9WqQXbXSJfn3qNEsWtEJ1qjQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39840400004)(396003)(136003)(366004)(346002)(451199015)(38100700002)(7696005)(6506007)(53546011)(86362001)(26005)(9686003)(66556008)(5660300002)(76116006)(66476007)(66946007)(316002)(122000001)(8936002)(4326008)(52536014)(66446008)(8676002)(6916009)(71200400001)(64756008)(2906002)(33656002)(83380400001)(30864003)(478600001)(55016003)(966005)(186003)(41300700001)(38070700005)(21314003)(69594002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3642
X-CodeTwo-MessageID: 0231ae36-e0b5-4cc4-b9b1-40661706ea7c.20221128151745@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT060.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 82ab176e-ce9f-4974-f68e-08dad153b1ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Os0nklkKDWp/eOQAAAkyWCmN6TqC+glMz8EolPhvk+8Boj9mxRgSNkUmoA1YcbySR12Tk68MM3q0NN82imdlxV2YClGoZ56pcNhdFaKrio4Q/CAqlFOI5sVVqSfovb3JO06RQVF4dxSspU8oeUD4W5IaD6HX6JsEL6+0nfGl3lxU9aNP1f3TJPoXXlDY3wius6mU67xsEd+cfiHcVoNzeMLXDZjQ1nIDDTz3w+/LZG6OvWYZ+22kLH7saANjOyhw8AT6WbtRbpF4+nFP7DYBoMX2ba+iRC2sxZLzDm87owXxdqj8klQRB1YjLmvbfmIGvz3E0oHsHqMifJRoZMnee+g8BIX79+YfApY/8XlVY2IyYLDC3NCtBv5S2fG49R1EiG8XvB08sjTeQqLc6e2vrobRvhTcoP/cSGy/qiw/ex3scSpMIVF1W7BEJEkS4DUWxtV276cwKlHY/ebd/TeJgf4SK+8iVLcdNLYj4VmdRe6Qs7tqxz3Vx1ynHbZxlEfRec9rHPgprC5OLR+jLzBDK5jcnlIRpcF75HoxbsgZTmt119LFJbzNvXIX4Lks/p5PcWeq1H7ax/BjogKShKYzr34W4WvRP1a4x2rMBhU39pE0f6yRtsAkRPLNRPvcb5ylH3/2GcPL7w+yLkwcwKNKg3pNQeIhsmK7/oMTA3AYpzYtRMrhfNataO079mKfXIlYLmH7JpEKtbHC0sQ64evuelgTDj1qhdDy+UdKowi04+rkyvTO2V068wfpCcSU6H4
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(346002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(41300700001)(5660300002)(8936002)(966005)(8676002)(4326008)(30864003)(52536014)(86362001)(70206006)(33656002)(70586007)(83380400001)(26005)(6506007)(53546011)(186003)(7696005)(82310400005)(336012)(47076005)(9686003)(316002)(7596003)(36860700001)(356005)(7636003)(40480700001)(6916009)(478600001)(55016003)(2906002)(21314003)(69594002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:17:47.0661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4db4eb1-8408-467d-a776-08dad153b4c6
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT060.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3613
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2097999842942894493=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============2097999842942894493==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----5C7D6906319A7ADF9CB7CF7733BE8F86"

This is an S/MIME signed message

------5C7D6906319A7ADF9CB7CF7733BE8F86
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi James!=0A=
=0A=
Thanks four your great work!=0A=
I was able to successfully build it.=0A=
=0A=
Unfortunately i could not build (linking error) the example program label_i=
mage.=0A=
I use this to verify if the inference results are the same across different=
 Versions=0A=
on the target hardware.=0A=
=0A=
This is what i did:=0A=
$ make freescale_imx8mpevk_defconfig menuconfig=0A=
=3D> in Menuconfig: activated C++ Support in the Toolchain Section; activat=
ed tensorflow-lite; activated host environment-setup; =0A=
$ make=0A=
# everything built fine=0A=
=0A=
$ source output/host/environment-setup=0A=
$ cd output/build/tensorflow-lite-2.11.0/tensorflow/lite/buildroot-build/ex=
amples/label_image/=0A=
$ make label_image=0A=
# linking error, full log:=0A=
=0A=
Consolidate compiler generated dependencies of target fft2d_fftsg=0A=
[ =A01%] Built target fft2d_fftsg=0A=
Consolidate compiler generated dependencies of target farmhash=0A=
[ =A01%] Built target farmhash=0A=
Consolidate compiler generated dependencies of target fft2d_fftsg2d=0A=
[ =A01%] Built target fft2d_fftsg2d=0A=
Consolidate compiler generated dependencies of target tensorflow-lite=0A=
[ 94%] Built target tensorflow-lite=0A=
[ 94%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
bitmap_helpers.cc.o=0A=
[ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
label_image.cc.o=0A=
[ 95%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
xxx/buildroot/output/build/tensorflow-lite-2.11.0/tensorflow/core/util/stat=
s_calculator.cc.o=0A=
[ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/profiling/memory_info.cc.o=0A=
[ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/profiling/profile_summarizer.cc.o=0A=
[ 96%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/profiling/profile_summary_formatter.cc.o=0A=
[ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/profiling/time.cc.o=0A=
[ 97%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/tools/command_line_flags.cc.o=0A=
[ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/tools/delegates/default_execution_provider.cc.o=0A=
[ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/tools/delegates/delegate_provider.cc.o=0A=
[ 98%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/tools/evaluation/utils.cc.o=0A=
[100%] Building CXX object examples/label_image/CMakeFiles/label_image.dir/=
__/__/tools/tool_params.cc.o=0A=
[100%] Linking CXX executable label_image=0A=
xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../=
../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: unde=
fined reference to `tsl::profiler::TraceMeRecorder::Record(tsl::profiler::T=
raceMeRecorder::Event&&)'=0A=
xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../=
../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: unde=
fined reference to `tsl::profiler::internal::g_trace_level'=0A=
xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../=
../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: unde=
fined reference to `tensorflow::profiler::ScopedMemoryDebugAnnotation::Thre=
adMemoryDebugAnnotation()'=0A=
xxx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../=
../../aarch64-buildroot-linux-gnu/bin/ld: ../../libtensorflow-lite.so: unde=
fined reference to `tsl::profiler::GetCurrentTimeNanos()'=0A=
collect2: error: ld returned 1 exit status=0A=
make[3]: *** [examples/label_image/CMakeFiles/label_image.dir/build.make:35=
1: examples/label_image/label_image] Error 1=0A=
make[2]: *** [CMakeFiles/Makefile2:436: examples/label_image/CMakeFiles/lab=
el_image.dir/all] Error 2=0A=
make[1]: *** [CMakeFiles/Makefile2:443: examples/label_image/CMakeFiles/lab=
el_image.dir/rule] Error 2=0A=
make: *** [Makefile:166: examples/label_image/CMakeFiles/label_image.dir/ru=
le] Error 2=0A=
=0A=
This did peviously work with tensorflow-lite v2.8. =0A=
Maybe i am missing something?=0A=
=0A=
I guess this is broken in v2.11.0.=0A=
A fix may be in their master: https://github.com/tensorflow/tensorflow/comm=
it/8562f9764937db51a4742fd10057463880579329=0A=
I can try to use their master branch to see if that issue was addressed in =
the next days. Alternatively i can Test v2.10.1.=0A=
=0A=
Maybe we need to wait for the next release v2.12?=0A=
=0A=
Best Regards=0A=
Stefan=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Friday, November 25, 2022 17:16=0A=
To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni=
@bootlin.com>=0A=
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package =0A=
=A0=0A=
On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com> w=
rote:=0A=
>=0A=
> Hi James!=0A=
>=0A=
> Tanks for your Feedback!=0A=
>=0A=
> Yes TFlite 2.8.0 is not the "latest" Release.=0A=
>=0A=
> I'm absolutly with you that using special Versions is a bad idea in gener=
al.=0A=
> On the other hand, it was my fear that it may be difficult to prove that =
everything works properly with newer Libs even if the build succeeds.=0A=
> It was hard work for me get it running and I was happy that everything wo=
rks even with the known limitations. But i learned a lot ; )=0A=
=0A=
It seems to build fine with normal libraries and without all the=0A=
manual copy hacks:=0A=
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D330091&submit=
ter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D=0A=
=0A=
See if that works for you, I refactored your patchset and it seems to=0A=
build without=0A=
issues now using system libraries.=0A=
=0A=
I also uploaded that series to my personal github if that's easier for=0A=
you to test:=0A=
https://github.com/jameshilliard/buildroot/tree/tensorflow-lite=0A=
=0A=
>=0A=
> Maybe it is the best to bump to Version 2.11.0 and they try it again with=
 buildroot's own packages where they exist.=0A=
> But this will take some time, maybe next year for the 23.04 Release.=0A=
=0A=
I bumped it to 2.11.0 and fixed the build issues I ran into:=0A=
https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.1725476=
-8-james.hilliard1@gmail.com/=0A=
=0A=
>=0A=
> And next time i need to add the [Buildroot] tag to the subject so my mail=
 sorting rule will work for my own mails...=0A=
=0A=
I think you also accidentally dropped the mailing list from your reply as w=
ell.=0A=
=0A=
>=0A=
> Best Regards=0A=
> Stefan=0A=
>=0A=
>=0A=
>=0A=
>=0A=
> From: James Hilliard <james.hilliard1@gmail.com>=0A=
> Sent: Thursday, November 24, 2022 15:54=0A=
> To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni <=
thomas.petazzoni@bootlin.com>=0A=
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
>=0A=
> On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager=0A=
> <stefan.hager@ginzinger.com> wrote:=0A=
> >=0A=
> > Hello,=0A=
> >=0A=
> > this RFC patch series proposes a way to integrate the Tensorflow-lite r=
untime (TFLite) into Buildroot.=0A=
> >=0A=
> > This first RFC just integrates the TFLite C++ sahred library.=0A=
> > After a sucessful first integration the next step wuld be to activate t=
he python library for TFlite.=0A=
> > As a third step i plan to integrate the NPU Backend Driver for TFLite t=
o use accelerated inference on the i.MX8MP NPU (neural processing unit) for=
 C++ an Python.=0A=
> > All of this currently works locally as a proof of concept for a few use=
rs.=0A=
> >=0A=
> > The currently used Version of TFLite is 2.8.0 (official) which is prove=
n to work.=0A=
>=0A=
> This is an outdated release right? Are there issues with 2.11.0?=0A=
>=0A=
> >=0A=
> > TFlite comes with a bunch of external source dependencies which are dow=
nloaded by separate hidden packages and then built by the main TFLite packa=
ge.=0A=
> > TFLite needs its own versions of libabseil, eigen and flatbuffers wich =
may conflict with the Versions provided by Buildroot.=0A=
>=0A=
> I'm unable to find any documentation indicating this is actually the case=
.=0A=
>=0A=
> I skimmed the cmakelists and it doesn't seem to have strict version=0A=
> requirements:=0A=
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMa=
keLists.txt=0A=
>=0A=
> Have you tried building against the normal buildroot versions of these pa=
ckages?=0A=
>=0A=
> > Since i can not gurantee that TFlite will work with other Versions of t=
his packages i decided to only let TFlite be activated if this packages are=
 not activated in Buildroot.=0A=
>=0A=
> This is probably not the right approach, other packages may depend on=0A=
> or select the normal versions(flatbuffers seems especially problematic).=
=0A=
>=0A=
> >=0A=
> > Currently TFlite only supports a limited set of processor architectures=
 (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bi=
t Support).=0A=
> > Anyone else may activate further platforms if needed, but testing needs=
 to then be done by them.=0A=
> >=0A=
> > How to build a minimal config with TFLite:=0A=
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> > $ make raspberrypi4_64_defconfig menuconfig=0A=
> > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tens=
orflow-lite=0A=
> > $ make tensorflow-lite=0A=
> >=0A=
> > I'm hoping for Comments to prepare a first patchset.=0A=
> >=0A=
> > Stefan Hager (10):=0A=
> >=A0=A0 tensorflow-lite-abseil-cpp: new package=0A=
> >=A0=A0 tensorflow-lite-clog: new package=0A=
> >=A0=A0 tensorflow-lite-abseil-cpuinfo: new package=0A=
> >=A0=A0 tensorflow-lite-eigen: new package=0A=
> >=A0=A0 tensorflow-lite-farmhash: new package=0A=
> >=A0=A0 tensorflow-lite-fft2d: new package=0A=
> >=A0=A0 tensorflow-lite-flatbuffers: new package=0A=
> >=A0=A0 tensorflow-lite-gemmlowp: new package=0A=
> >=A0=A0 tensorflow-lite-ruy: new package=0A=
> >=A0=A0 tensorflow-lite: new package=0A=
> >=0A=
> >=A0 package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +=0A=
> >=A0 package/tensorflow-lite-abseil-cpp/Config.in=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-abseil-cpp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-abseil-cpp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-clog/Config.in=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> >=A0 .../tensorflow-lite-clog.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-clog.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-cpuinfo/Config.in=A0=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-cpuinfo.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-cpuinfo.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-eigen/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 5 =
+=0A=
> >=A0 .../tensorflow-lite-eigen.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 9 +=0A=
> >=A0 .../tensorflow-lite-eigen.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-farmhash/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-farmhash.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-farmhash.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-fft2d/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 5 =
+=0A=
> >=A0 .../tensorflow-lite-fft2d.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-fft2d.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 15 ++=0A=
> >=A0 package/tensorflow-lite-flatbuffers/Config.in |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-flatbuffers.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 3 +=0A=
> >=A0 .../tensorflow-lite-flatbuffers.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-gemmlowp/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-gemmlowp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-gemmlowp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-ruy/Config.in=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> >=A0 .../tensorflow-lite-ruy.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-ruy.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 ...2sse-since-this-is-only-useful-on-x8.patch |=A0 34 +++=0A=
> >=A0 ...build-a-shared-library-instead-of-st.patch |=A0 55 +++++=0A=
> >=A0 ...build-tflite-with-external-delegates.patch |=A0 59 +++++=0A=
> >=A0 ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++=
=0A=
> >=A0 package/tensorflow-lite/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 56 +++++=0A=
> >=A0 package/tensorflow-lite/tensorflow-lite.hash=A0 |=A0=A0 3 +=0A=
> >=A0 package/tensorflow-lite/tensorflow-lite.mk=A0=A0=A0 | 232 ++++++++++=
++++++++=0A=
> >=A0 35 files changed, 848 insertions(+)=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lit=
e-abseil-cpp.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lit=
e-abseil-cpp.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog=
.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog=
.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-c=
puinfo.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-c=
puinfo.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eig=
en.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eig=
en.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-=
farmhash.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-=
farmhash.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft=
2d.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft=
2d.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-li=
te-flatbuffers.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-li=
te-flatbuffers.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-=
gemmlowp.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-=
gemmlowp.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.h=
ash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.m=
k=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse=
-since-this-is-only-useful-on-x8.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0002-Added-option-to-buil=
d-a-shared-library-instead-of-st.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0003-Added-option-to-buil=
d-tflite-with-external-delegates.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0004-Removed-source-repos=
itories-and-git-pull-configurati.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
> >=0A=
> > --=0A=
> > 2.36.1=0A=
> >=0A=
> > _______________________________________________=0A=
> > buildroot mailing list=0A=
> > buildroot@buildroot.org=0A=
> > https://lists.buildroot.org/mailman/listinfo/buildroot=0A=
=0A=
=0A=
From: James Hilliard <james.hilliard1@gmail.com>=0A=
Sent: Friday, November 25, 2022 17:16=0A=
To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
Cc: buildroot <buildroot@buildroot.org>; Thomas Petazzoni <thomas.petazzoni=
@bootlin.com>=0A=
Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package =0A=
=A0=0A=
On Fri, Nov 25, 2022 at 5:07 AM Hager Stefan <Stefan.Hager@ginzinger.com> w=
rote:=0A=
>=0A=
> Hi James!=0A=
>=0A=
> Tanks for your Feedback!=0A=
>=0A=
> Yes TFlite 2.8.0 is not the "latest" Release.=0A=
>=0A=
> I'm absolutly with you that using special Versions is a bad idea in gener=
al.=0A=
> On the other hand, it was my fear that it may be difficult to prove that =
everything works properly with newer Libs even if the build succeeds.=0A=
> It was hard work for me get it running and I was happy that everything wo=
rks even with the known limitations. But i learned a lot ; )=0A=
=0A=
It seems to build fine with normal libraries and without all the=0A=
manual copy hacks:=0A=
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D330091&submit=
ter=3D&state=3D*&q=3D&archive=3Dboth&delegate=3D=0A=
=0A=
See if that works for you, I refactored your patchset and it seems to=0A=
build without=0A=
issues now using system libraries.=0A=
=0A=
I also uploaded that series to my personal github if that's easier for=0A=
you to test:=0A=
https://github.com/jameshilliard/buildroot/tree/tensorflow-lite=0A=
=0A=
>=0A=
> Maybe it is the best to bump to Version 2.11.0 and they try it again with=
 buildroot's own packages where they exist.=0A=
> But this will take some time, maybe next year for the 23.04 Release.=0A=
=0A=
I bumped it to 2.11.0 and fixed the build issues I ran into:=0A=
https://patchwork.ozlabs.org/project/buildroot/patch/20221125160724.1725476=
-8-james.hilliard1@gmail.com/=0A=
=0A=
>=0A=
> And next time i need to add the [Buildroot] tag to the subject so my mail=
 sorting rule will work for my own mails...=0A=
=0A=
I think you also accidentally dropped the mailing list from your reply as w=
ell.=0A=
=0A=
>=0A=
> Best Regards=0A=
> Stefan=0A=
>=0A=
>=0A=
>=0A=
>=0A=
> From: James Hilliard <james.hilliard1@gmail.com>=0A=
> Sent: Thursday, November 24, 2022 15:54=0A=
> To: Hager Stefan <Stefan.Hager@ginzinger.com>=0A=
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni <=
thomas.petazzoni@bootlin.com>=0A=
> Subject: Re: [Buildroot] [RFC PATCH 00/10] tensorflow-lite: new package=
=0A=
>=0A=
> On Thu, Nov 24, 2022 at 10:14 AM Stefan Hager=0A=
> <stefan.hager@ginzinger.com> wrote:=0A=
> >=0A=
> > Hello,=0A=
> >=0A=
> > this RFC patch series proposes a way to integrate the Tensorflow-lite r=
untime (TFLite) into Buildroot.=0A=
> >=0A=
> > This first RFC just integrates the TFLite C++ sahred library.=0A=
> > After a sucessful first integration the next step wuld be to activate t=
he python library for TFlite.=0A=
> > As a third step i plan to integrate the NPU Backend Driver for TFLite t=
o use accelerated inference on the i.MX8MP NPU (neural processing unit) for=
 C++ an Python.=0A=
> > All of this currently works locally as a proof of concept for a few use=
rs.=0A=
> >=0A=
> > The currently used Version of TFLite is 2.8.0 (official) which is prove=
n to work.=0A=
>=0A=
> This is an outdated release right? Are there issues with 2.11.0?=0A=
>=0A=
> >=0A=
> > TFlite comes with a bunch of external source dependencies which are dow=
nloaded by separate hidden packages and then built by the main TFLite packa=
ge.=0A=
> > TFLite needs its own versions of libabseil, eigen and flatbuffers wich =
may conflict with the Versions provided by Buildroot.=0A=
>=0A=
> I'm unable to find any documentation indicating this is actually the case=
.=0A=
>=0A=
> I skimmed the cmakelists and it doesn't seem to have strict version=0A=
> requirements:=0A=
> https://github.com/tensorflow/tensorflow/blob/v2.11.0/tensorflow/lite/CMa=
keLists.txt=0A=
>=0A=
> Have you tried building against the normal buildroot versions of these pa=
ckages?=0A=
>=0A=
> > Since i can not gurantee that TFlite will work with other Versions of t=
his packages i decided to only let TFlite be activated if this packages are=
 not activated in Buildroot.=0A=
>=0A=
> This is probably not the right approach, other packages may depend on=0A=
> or select the normal versions(flatbuffers seems especially problematic).=
=0A=
>=0A=
> >=0A=
> > Currently TFlite only supports a limited set of processor architectures=
 (ARMV8A: only 64-bit Support no 32-bit (doesn't build); ARMV7A: only 32-bi=
t Support).=0A=
> > Anyone else may activate further platforms if needed, but testing needs=
 to then be done by them.=0A=
> >=0A=
> > How to build a minimal config with TFLite:=0A=
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> > $ make raspberrypi4_64_defconfig menuconfig=0A=
> > Activate TFLite in menuconfig: Target packages -> Libraries -> [*] tens=
orflow-lite=0A=
> > $ make tensorflow-lite=0A=
> >=0A=
> > I'm hoping for Comments to prepare a first patchset.=0A=
> >=0A=
> > Stefan Hager (10):=0A=
> >=A0=A0 tensorflow-lite-abseil-cpp: new package=0A=
> >=A0=A0 tensorflow-lite-clog: new package=0A=
> >=A0=A0 tensorflow-lite-abseil-cpuinfo: new package=0A=
> >=A0=A0 tensorflow-lite-eigen: new package=0A=
> >=A0=A0 tensorflow-lite-farmhash: new package=0A=
> >=A0=A0 tensorflow-lite-fft2d: new package=0A=
> >=A0=A0 tensorflow-lite-flatbuffers: new package=0A=
> >=A0=A0 tensorflow-lite-gemmlowp: new package=0A=
> >=A0=A0 tensorflow-lite-ruy: new package=0A=
> >=A0=A0 tensorflow-lite: new package=0A=
> >=0A=
> >=A0 package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +=0A=
> >=A0 package/tensorflow-lite-abseil-cpp/Config.in=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-abseil-cpp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-abseil-cpp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-clog/Config.in=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 =
5 +=0A=
> >=A0 .../tensorflow-lite-clog.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-clog.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-cpuinfo/Config.in=A0=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-cpuinfo.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-cpuinfo.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-eigen/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 5 =
+=0A=
> >=A0 .../tensorflow-lite-eigen.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 9 +=0A=
> >=A0 .../tensorflow-lite-eigen.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-farmhash/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-farmhash.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-farmhash.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-fft2d/Config.in=A0=A0=A0=A0=A0=A0 |=A0=A0 5 =
+=0A=
> >=A0 .../tensorflow-lite-fft2d.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-fft2d.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 15 ++=0A=
> >=A0 package/tensorflow-lite-flatbuffers/Config.in |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-flatbuffers.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 3 +=0A=
> >=A0 .../tensorflow-lite-flatbuffers.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-gemmlowp/Config.in=A0=A0=A0 |=A0=A0 5 +=0A=
> >=A0 .../tensorflow-lite-gemmlowp.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-gemmlowp.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 14 ++=0A=
> >=A0 package/tensorflow-lite-ruy/Config.in=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0 5 +=0A=
> >=A0 .../tensorflow-lite-ruy.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0 3 +=0A=
> >=A0 .../tensorflow-lite-ruy.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 14 ++=0A=
> >=A0 ...2sse-since-this-is-only-useful-on-x8.patch |=A0 34 +++=0A=
> >=A0 ...build-a-shared-library-instead-of-st.patch |=A0 55 +++++=0A=
> >=A0 ...build-tflite-with-external-delegates.patch |=A0 59 +++++=0A=
> >=A0 ...epositories-and-git-pull-configurati.patch | 203 +++++++++++++++=
=0A=
> >=A0 package/tensorflow-lite/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 56 +++++=0A=
> >=A0 package/tensorflow-lite/tensorflow-lite.hash=A0 |=A0=A0 3 +=0A=
> >=A0 package/tensorflow-lite/tensorflow-lite.mk=A0=A0=A0 | 232 ++++++++++=
++++++++=0A=
> >=A0 35 files changed, 848 insertions(+)=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lit=
e-abseil-cpp.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-abseil-cpp/tensorflow-lit=
e-abseil-cpp.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog=
.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-clog/tensorflow-lite-clog=
.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-c=
puinfo.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-cpuinfo/tensorflow-lite-c=
puinfo.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eig=
en.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-eigen/tensorflow-lite-eig=
en.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-=
farmhash.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-farmhash/tensorflow-lite-=
farmhash.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft=
2d.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-fft2d/tensorflow-lite-fft=
2d.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-li=
te-flatbuffers.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-flatbuffers/tensorflow-li=
te-flatbuffers.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-=
gemmlowp.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-gemmlowp/tensorflow-lite-=
gemmlowp.mk=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.h=
ash=0A=
> >=A0 create mode 100644 package/tensorflow-lite-ruy/tensorflow-lite-ruy.m=
k=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0001-Deactivated-neon2sse=
-since-this-is-only-useful-on-x8.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0002-Added-option-to-buil=
d-a-shared-library-instead-of-st.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0003-Added-option-to-buil=
d-tflite-with-external-delegates.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/0004-Removed-source-repos=
itories-and-git-pull-configurati.patch=0A=
> >=A0 create mode 100644 package/tensorflow-lite/Config.in=0A=
> >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> >=A0 create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
> >=0A=
> > --=0A=
> > 2.36.1=0A=
> >=0A=
> > _______________________________________________=0A=
> > buildroot mailing list=0A=
> > buildroot@buildroot.org=0A=
> > https://lists.buildroot.org/mailman/listinfo/buildroot=

------5C7D6906319A7ADF9CB7CF7733BE8F86
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIISDQYJKoZIhvcNAQcCoIIR/jCCEfoCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGggg7BMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkq
hkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBB
c3N1cmVkIElEIFJvb3QgRzIwHhcNMTkwOTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMy
WjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQL
ExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1cmVkIElE
IENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOqx
Ra06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnu
usnOWvpISoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NX
jnbOhJS/1NjGq+ugLMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9w
gfW7XuhAi2j0y5d9oMT0SuVeKFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8Rp
Lt05WI2G2RNVVlHYaU0CAwEAAaOCAgQwggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5et
I4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXyuNtgv6l+vVa1lzan1jAOBgNV
HQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEE
AYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUwEgYDVR0T
AQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3Js
My5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNV
HSAEgcYwgcMwgcAGBFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRp
Z2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBD
ZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0
LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQCo3MAIqR0kekGYrC7
0EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJdgkASGsI
NabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2V
joECzez2y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7Kn
bzMS9quFSuyOGILcg/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUw
ggOWMIICfqADAgECAhALkxw61jln6mcjv8OvmvRLMA0GCSqGSIb3DQEBCwUAMGUx
CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9v
dCBHMjAeFw0xMzA4MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2Vy
dC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANnnKC9SPzZySYiTNPP4ah4xVICf
rVRBtUfflqjUr4AtuQrPdf2JpX0k+uMiDCu8lRcLM78ZTUEGkAC9DE0Q/ge15xxu
IlUxZZe90xfSHmLz2+psUIw/hAyWz7fLA+DKbaEUTBuJ3e0AsFJ8r5FssTgT0ekS
CMAAsBwrEdp3cDabrs55h9yCcOYJdHBVaa+jaJ+/3bZ5s/KdcClV9Kv/lWHzyUBv
HdG+k7vTiCq7nb9yWlZxOz/U89EK/ijvo+7Zma8D049gt/KSobG9iYkfMM3Dpi5i
M64WAndEWueBCjynRC55uD8EvFygh+Ebr1GOzews+vj+bfA6fKqL5GeVMY0CAwEA
AaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYE
FM7DSrmZVfK422C/qX69VrWXNqfWMA0GCSqGSIb3DQEBCwUAA4IBAQDKpVWM48hB
bmknp3UR7zyGNm/SncZ4OB1plqKSaS44bJt9BNSJpbExN4rJIcyrbM2LHJrWv0jS
MmbBisDzLzrvwOPUkYbRUOMD23N3b0o5U+3eJse1fa8rQtF1YuNKKwLHUEvgaeKW
bA5EZhBEj60F6/h5rKYb6Dc0nVPJYaqiUq9KcBaGwjrIsRNwNtjP7vQKNNVbTP0H
nKK62QFyXPNNwd0OsRwNxGO+rfQU+4nsokEOTMzIV0DQbgOqzQyOiZmZbPA8MK84
32+8o74pICerdP8TInjel1JVHoO1VCAD7q7AT1beN8zDf6oEJ7vTd7hi2xd8nCgi
E3Nszyb1iinnMIIFwDCCBKigAwIBAgIQDGW+hPuss5Tc1j96Q5g6rTANBgkqhkiG
9w0BAQsFADBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkw
FwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1
cmVkIElEIENsaWVudCBDQSBHMjAeFw0yMjEwMDcwMDAwMDBaFw0yNTEwMDcyMzU5
NTlaMFAxIzAhBgNVBAMMGnN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tMSkwJwYJ
KoZIhvcNAQkBFhpzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbTCCAaIwDQYJKoZI
hvcNAQEBBQADggGPADCCAYoCggGBALLxSkM9EsxkQXXj3kZ/6dJOhNoLOTjKGQW1
ddcuYyOhaOFAlwTiWOJsF+zupjR6cNzNorR8PZfAYjdrE3L8ROzQy1+HpJnOF0a7
gXgjF+AwyHz5Cuu083jZAaCw/csVTrQZe9T0a8/b2g+MUUhmvlfo7jMby0TiV4eE
AUe3X3COMvna1i9j9Uk2QruwgrfZsG/tG6IEUBKyjcRBbh76LuFym6tKum+dQxMG
RxuQ8KzthVoSndJ4uWL9yZz6/03yTSknRaS1qlwEDsThZ8M642/feqQ1dg4t+0P6
OKGYz40Lln6KtCE+f8WMjwZ0zwVzylCdXxYGDuo7vkMTlbkrzg4vl3U8Sxm8uwVO
tx6mVxkXWfUMJ6pAjmHVgvwIDpvFlXQChoMB+fNx9MtxGRB/x4bvbruvvcMg3HsR
b+nzQPQhTRmZ5Tnv/d88Wlriby3pZtz+jkk0/eNEbiJsV4FFE15VMhvdnqB9u8c1
WQjk5k/4VNUtzxvuGAi3JcTWWfSrywIDAQABo4IB+jCCAfYwHwYDVR0jBBgwFoAU
pWIgUNy7W1eXrSOPNeJUbKl++U4wHQYDVR0OBBYEFBKUfzpvibxxH4xLryC37QDB
TEu0MAwGA1UdEwEB/wQCMAAwJQYDVR0RBB4wHIEac3RlZmFuLmhhZ2VyQGdpbnpp
bmdlci5jb20wDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggr
BgEFBQcDAjBDBgNVHSAEPDA6MDgGCmCGSAGG/WwEAQEwKjAoBggrBgEFBQcCARYc
aHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBiwYDVR0fBIGDMIGAMD6gPKA6
hjhodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDbGll
bnRDQUcyLmNybDA+oDygOoY4aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lD
ZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwfQYIKwYBBQUHAQEEcTBvMCQGCCsG
AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKGO2h0
dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVu
dENBRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBIPYM+hSk3JsrbTSvw969Hyo0q
5+maixbUrVPlQdS+4brWiFdcKLOEhmqliUVeuEYIpstCSf+jRtuupI7m5EnIwf6s
aiGxHcLmC/BZ7C7eIXGUx3eYDzZ0aqyXnmzo+WYSHnIhUeVRJMmzIOgLOqfiOdGI
slKn5jrR8AgHpc3KO0p4yATSp9f0X6V7RSXuxL56BRzsponJiPkUu5ZlIUlvkXpQ
8FHSRqgAZU+h7lkXDUfpXB3pMRqpWUdPTFfLVGOfnfVAzoq1227xYYnb7NgcLbCw
tQDB/J7BifTyjx203oQ2Pqw2FbSYNFIKyyc9gDEMAh7+RVEY6Bj05nR+UjN7MYID
EDCCAwwCAQEwfjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBB
c3N1cmVkIElEIENsaWVudCBDQSBHMgIQDGW+hPuss5Tc1j96Q5g6rTANBglghkgB
ZQMEAgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMjExMjgxNTE3NTJaMC8GCSqGSIb3DQEJBDEiBCBaIdiU9rlq3nTv2Lk0
SbklfGhIN0W+gQBrVb13C9Bm3zB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYCNQPdwDG/BnXjOX+tW1XUPT4MKC7EFUodT98GRFwC4
7t5G2tbfD6yaD9Eg2hirnelSC3vPs4K1tOyCFvvNVfpIsBlJRRx8rXjcIOMQzHPD
CTe2mq6mWvWOjCUKxHFery5Wm1iJFcKcIoeZYEY9P7CAXFltJwgMgA7FwoqLVzZ0
Jsuo0jcbVfzl6Pa/sdLp3koEuXDDm6fW3vKm3ztxvRsFL5PZeKSozdtfiBLFd5k1
/gJvsacTGyJXVomPS6SZnkAlxHdOD8m0nj0siTH8uhXrZpRTJet8s+8scQFh6QxW
6hmrd53KXwYXqwDc7dS9AXQgcvQqDm4LaRYNoCAzBBBquBj7CnVBOS1QDs3TlIt3
a/ld7RxThQgv4fxUJVQQaoFzcuAzi+vc8dAecNc8YzwqDomBfuc7x1mfSqYbwJk+
+PbX4+Rd5o/ah9StTH8Wlh8Vpg+PiuILSBTHRteU0xLSwBL6Ef5iED2nE6m1IntA
R4/iW0vJ2guJIrGF9zrCFKs=

------5C7D6906319A7ADF9CB7CF7733BE8F86--


--===============2097999842942894493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2097999842942894493==--

