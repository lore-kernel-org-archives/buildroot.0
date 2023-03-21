Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE07EC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 01:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383B140ACB;
	Tue, 21 Mar 2023 01:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 383B140ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKQtKJBSOKgp; Tue, 21 Mar 2023 01:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4B640AB9;
	Tue, 21 Mar 2023 01:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4B640AB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 143921BF3E1
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 01:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E22CE81303
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 01:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22CE81303
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bp5y2V_t9sro for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 01:28:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A5781266
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::613])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27A5781266
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 01:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGM3FNuJO3StPHhRO6w/gY5k8FdGwDzt+Ywv9LEPk+jMP5A7Wxx+x63JoKQBa7qBDdUeTe+6otlNBOSFHLuBWAVFpil6fpVPld/fHrcZWfb4hkdWMtHdxnNQCy9eDOuvru7QDCFFJPtTbLSD78yqpWrfn1ill7lXnvw41ymCVwHlk/Mv9ApkSNM6tPB7LIN1/7aXJOXQa70o8YHQoIziTv3p/jcnmdqikyYLaeCNDvLwTB+krvAyivwB1lsWPOhkW3tsPePqYy8VWelPEj4cbxJRNWEdzresgLna4oHG38zDJhtDvVNgWMvBvEWifwq2xCnfIF1H9WToAFw5OBiv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO0kiGYQVvrCMCury5Ur9/CRWWXRypqAPpa/H5XUYqc=;
 b=dMAkrnf0B6Exau2yDBq42t23XoZRL/0yBSQUwzSHFoVXy2U+wPVpNUE0okTZToEy3a7Ocnn3QjKhm8yfGcUmZwq+fH8DATVDhVcWTQXB3dR9cLOTNGDYCNoKP7rRD/BRdKFXmsllP3vYFkcJ5ABoQN4BXqWpMaSjaM47CfiykzZO0acPIOdxT1Vjy46XSOydcKHOxSqz5LqNcXeQXdt2k9xzc+7FSPbR/hsKpQKlt1YbgB7BXOFhgB8to9OKOBPyJ1BUnmSynj3l17MXaN6L0mEWavulewQyFD3YMaV9BSRng4oMgDCX4pZA7HGAnzc298AzFlWeH2TCcz6nKnhIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.70.157.244) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rigtechnologies.com.au; dmarc=bestguesspass action=none
 header.from=rigtechnologies.com.au; dkim=none (message not signed); arc=none
Received: from SY5PR01CA0003.ausprd01.prod.outlook.com (2603:10c6:10:1fa::16)
 by ME2P282MB0289.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 21 Mar
 2023 01:28:47 +0000
Received: from SY4AUS01FT024.eop-AUS01.prod.protection.outlook.com
 (2603:10c6:10:1fa:cafe::c) by SY5PR01CA0003.outlook.office365.com
 (2603:10c6:10:1fa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 01:28:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.70.157.244)
 smtp.mailfrom=rigtechnologies.com.au; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=rigtechnologies.com.au;
Received-SPF: Pass (protection.outlook.com: domain of rigtechnologies.com.au
 designates 13.70.157.244 as permitted sender)
 receiver=protection.outlook.com; client-ip=13.70.157.244;
 helo=au2.smtp.exclaimer.net; pr=C
Received: from au2.smtp.exclaimer.net (13.70.157.244) by
 SY4AUS01FT024.mail.protection.outlook.com (10.114.156.125) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6199.26 via Frontend Transport; Tue, 21 Mar 2023 01:28:46 +0000
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (104.47.71.170)
 by au2.smtp.exclaimer.net (13.70.157.244) with Exclaimer Signature Manager
 ESMTP Proxy au2.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 21 Mar 2023 01:28:46 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 22634637
X-ExclaimerImprintLatency: 2210134
X-ExclaimerImprintAction: 7d5ed0c1cbf54ffabc54a689dcf92ead
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:8e::13)
 by SY4P282MB3614.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.8; Tue, 21 Mar
 2023 01:28:43 +0000
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::910c:2436:356c:7299]) by ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::910c:2436:356c:7299%6]) with mapi id 15.20.6222.008; Tue, 21 Mar 2023
 01:28:42 +0000
From: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] PySerial issue, buildroot-2023.02-rc2
Thread-Index: AQHZW5MmoHIw95eJQUmmBE26P+WisA==
Date: Tue, 21 Mar 2023 01:28:42 +0000
Message-ID: <ME3P282MB13479A857B70CA76AC387783B9819@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rigtechnologies.com.au;
x-ms-traffictypediagnostic: ME3P282MB1347:EE_|SY4P282MB3614:EE_|SY4AUS01FT024:EE_|ME2P282MB0289:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f8cffc-796f-42ac-d24c-08db29ab9dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P/hWzk2Ma2fuO7ZqYPJEHHktYm82zpW1Q69RG67eNQhLkrKYRCD/r2uyiHWt77Et0ZzkocryFRLZhZEP+vP4m0VbJV3H4O/goM9UI6fDlYuVYqGqAO6nL6wFUO7Lc0ZXSsezG6UyMu7RK9DznUjVrI23OyIcl9y6syJdvljDaIvJVNfpyERZlQ8FLydDpQcT7RwAxhaq6gUD30JusNF5kG+eVMqkYGWQrzPAFRfCxQiBGIz88UtSkOj9lXYVnTW+R4uRxLuon+TQsJAi3Awmx928MFm+1X1EcfjTT6adqIxbxNHtYKHDT/fnE9/6di+w67xN1axsPVWNk+nDDtyg+SrIQ7JZDOSv2/67xDO3Lw9OShe5Bh/hK+NooguAiycgi6gRoYICjvmG2nu54y4yu04kpp3pZiBZiafJgQk34sBPbIV696CtulS7qMR5EUwL72sAD4AxdguRwK56meJfxn9Rf0jk2/JbQpW3OPGIbKLVde9zygE/8lyfhWRL5oB3YSKogAE9FIfCZaU3NHziZtbX1p9Ffz16Gh4mSUp1XpMA5yI+PmmzAG5APtL3EBdAoQoATWRyiFn4s5BYl93t8IwpvjTfS39qF16PYRm7jWaWuIBmSHn4NuA+35EDqaTkegmY8XPxNGURl5UBufKvsxcfGpBdxNaVu5vt2hM84L9Q6dL8j03jlUJHPavJtg9L/VgkOWS7/Yj4iVonNydvCQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM; PTR:;
 CAT:NONE;
 SFS:(13230025)(6029001)(4636009)(136003)(376002)(366004)(346002)(39850400004)(396003)(451199018)(8936002)(52536014)(33656002)(83380400001)(66574015)(55016003)(38070700005)(99936003)(122000001)(38100700002)(41300700001)(6916009)(66556008)(316002)(66446008)(64756008)(66946007)(8676002)(66476007)(5660300002)(76116006)(91956017)(86362001)(186003)(71200400001)(26005)(7696005)(9686003)(6506007)(478600001)(19627405001)(2906002);
 DIR:OUT; SFP:1101; 
Content-Type: multipart/mixed;
 boundary="_004_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB3614
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SY4AUS01FT024.eop-AUS01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f36492b3-df81-412c-2348-08db29ab9b7f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZyaRKZ4FZfjhgIcFb52b/w6e782oTsWL4/qSMoroAmaxmExouiydqmjBnXjDViG9Af4X3zVxN6bRPiQw4SBBWQqM7d2tSGWsss6Pfr7tu3VSK75c79aO2ksJSY2nRjVuZAJMMxQYzODik3igIn3aLre3OOVNxrGtYWg6xv7HanrhwXbrQsjO4z2C4ljMHZeyUOTCjxCqHLgyt7sykoIeUpVNxmkDkkdreV73QvBMYVedEmbUVhi/nSfs96VrwIkvfbuHzdWyqVw11UKMrSnAG9ZoxLPAtaN1udvlWie3TchDQfOexH+7BukWAsLXUh7ZZ8rsnhd+X7JiafZOHXAB0mwajfi26wqpEJmF6TmD531pbXgRnNY/OtmVPX/spJJ4u46HqhKeGhDnJ+5pGYVQYYrNah+7VY1gtXdIdlVu5HGRwoYWWkyf3rgZqGhUs88i1CPQw6BIRiowhSG6BWLgRHa15Aoh9KgerowLiyZ60ifohujYQxyVz7v7nZG0Yw19BNVVh4Tbc5wJUugNlh6Fmt/oqaywYUh/ngGAtKss9dpAxaPmrNutiXRWPlXdie96o3Cw4f0OV3K1mKnbmOUJQPECYPJ6fiqAHl8Axu2D20gjjspZ11QG7KApmYRLidLoIkGPgj66h3fh634rl9IRFmmUjHp4p2kZD5WxK2ajRf5LTBhVvD+VXnlnttrQ8Aa
X-Forefront-Antispam-Report: CIP:13.70.157.244; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:au2.smtp.exclaimer.net; PTR:au2.smtp.exclaimer.net;
 CAT:NONE;
 SFS:(13230025)(6029001)(4636009)(346002)(136003)(396003)(376002)(39850400004)(451199018)(36840700001)(46966006)(86362001)(356005)(82740400003)(36860700001)(99936003)(70206006)(7596003)(7636003)(8936002)(33656002)(2906002)(52536014)(5660300002)(235185007)(40480700001)(26005)(55016003)(6916009)(186003)(33964004)(316002)(6506007)(83380400001)(336012)(66574015)(47076005)(9686003)(82310400005)(478600001)(70586007)(41300700001)(7696005)(8676002)(19627405001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: rigtechnologies.com.au
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 01:28:46.2935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f8cffc-796f-42ac-d24c-08db29ab9dc3
X-MS-Exchange-CrossTenant-Id: d9b9a834-a53c-4fa3-b2c0-12e53d54aec8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d9b9a834-a53c-4fa3-b2c0-12e53d54aec8; Ip=[13.70.157.244];
 Helo=[au2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: SY4AUS01FT024.eop-AUS01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2P282MB0289
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hopperindustrialgroup.onmicrosoft.com;
 s=selector1-hopperindustrialgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VO0kiGYQVvrCMCury5Ur9/CRWWXRypqAPpa/H5XUYqc=;
 b=gcAlF5r7xsXaay6oxz5527Vn//4rvCLsp6EzuLZ0P+AV4xE0mxLHy0d2WESP4h7rqJ2uWjE2fDgGI0/PoFL3xth9upfzcRV9nDYSMzSePHKqXo7OWPl7cNORwwEfHJKa6NjLXLzSwiWwSy8l1lbAwb2Vq0PHospRdJRcdY0RFYfxUiI2snjzlpPVzVKimv6Y0HVjge2H/KmqrgyBeSLTHAk92/A9OpB8RARdhO7QewXV/oQLKyjh6V8prIuoJ8MEXurmTMiwVYiNy0QPohPIBVRLxvZeWCBk6OL6MGsdqHSDFQ1r9qhnlZEtSYy6VF/8UGHakazzYfSlTwzMHpAdGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hopperindustrialgroup.onmicrosoft.com
 header.i=@hopperindustrialgroup.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-hopperindustrialgroup-onmicrosoft-com header.b=gcAlF5r7
Subject: [Buildroot] PySerial issue, buildroot-2023.02-rc2
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--_004_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_
Content-Type: multipart/related;
	boundary="----_=_NextPart_b4d007e6-3364-43c1-bd42-5994119ec39d"

------_=_NextPart_b4d007e6-3364-43c1-bd42-5994119ec39d
Content-Type: multipart/alternative;
	boundary="_000_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_"

--_000_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm not sure this a Buildroot issue per se, however, in the interest of eve=
ryone else I thought I'd mention it in case someone comes across it.

I'm using Python 3.11.2, Linux 6.1 and PySerial 3.5, which I believe are st=
andard for Buildroot 2023.02 RC2. The board is a De10 Nano board with addit=
ional FPGA fabric, an ARM platform.

During some tests I came across the weirdest issue. After sending a serial =
request (serial.write(bytedata)) and reading data back in (serial.read(n)),=
 the response data was prepended with b'\x00', about 4096 NULL bytes. I che=
cked the line with a logic analyzer and the data transfer is very clean wit=
h 8 bytes request and 8 bytes response. I replicated the test by looping ba=
ck RX and TX lines using a simple Python script (attached). This happened r=
egularly every second attempt.

I reverted to Python 3.9 and Buildroot 2021.02 and the issue has gone. I'm =
building an image now with Buildroot 2022.02 and Python 3.10, and will see =
what happens.

If anyone has come across this issue or has a solution, I'd be happy to kno=
w about it. I found little in terms of this over the Internet.

Cheers,

Alberto

Alberto Fahrenkrog Senior Embedded Engineer 
Orica - Perth Technology Centre
p: +61 (0) 8 6365 4056
e: Alberto.Fahrenkrog@rigtechnologies.com.au

--_000_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I'm not sure this a Buildroot issue per se, however, in the interest of eve=
ryone else I thought I'd mention it in case someone comes across it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I'm using Python 3.11.2, Linux 6.1 and PySerial 3.5, which I believe are st=
andard for Buildroot 2023.02 RC2. The board is a De10 Nano board with addit=
ional FPGA fabric, an ARM platform.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
During some tests I came across the weirdest issue. After sending a serial =
request (serial.write(bytedata)) and reading data back in (serial.read(n)),=
 the response data was prepended with b'\x00', about 4096 NULL bytes. I che=
cked the line with a logic analyzer
 and the data transfer is very clean with 8 bytes request and 8 bytes respo=
nse. I replicated the test by looping back RX and TX lines using a simple P=
ython script (attached). This happened regularly every second attempt.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I reverted to Python 3.9 and Buildroot 2021.02 and the issue has gone. I'm =
building an image now with Buildroot 2022.02 and Python 3.10, and will see =
what happens.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
If anyone has come across this issue or has a solution, I'd be happy to kno=
w about it. I found little in terms of this over the Internet.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Alberto</div>
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;font-size:1px;direction:ltr;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"width:100%;font-size:1px;"><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"vertical-align:middle;"><table cellpad=
ding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=
=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;=
vertical-align:middle;"><img src=3D"cid:image430350.png@B0EC2D76.ADEBC01F" =
height=3D"60" border=3D"0" alt=3D"" style=3D"height:60px;min-height:60px;ma=
x-height:60px;font-size:0;" /></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"padding:13px 0 0;vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#000=
001;font-style:normal;font-weight:700;white-space:nowrap;"><tr style=3D"fon=
t-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family=
:Arial;">Alberto<span style=3D"font-family:remialcxesans;font-size:1px;colo=
r:#FFFFFF;line-height:1px;">&#8203;</span>&nbsp;Fahrenkrog</td><td align=
=3D"left" style=3D"vertical-align:top;font-size:0;"><table cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#000001;font-st=
yle:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.6=
7px;"><td align=3D"left" style=3D"padding:0 5px;vertical-align:top;font-fam=
ily:Arial;">&nbsp;</td></tr></table></td><td align=3D"left" style=3D"vertic=
al-align:top;font-family:Arial;font-style:italic;font-weight:400;">Senior&n=
bsp;Embedded&nbsp;Engineer&nbsp;</td></tr></table></td></tr><tr style=3D"fo=
nt-size:0;"><td align=3D"left" style=3D"vertical-align:middle;"><table cell=
padding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#00=
0001;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"fo=
nt-size:13.33px;"><td align=3D"left" style=3D"padding:7px 0 0;vertical-alig=
n:middle;font-family:Arial;">Orica&nbsp;=E2=80=91&nbsp;Perth&nbsp;Technolog=
y&nbsp;Centre</td></tr></table></td></tr></table></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><tabl=
e cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><=
tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:4px 0 0;verti=
cal-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" sty=
le=3D"font-size:0;color:#000001;font-style:normal;font-weight:400;white-spa=
ce:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"ve=
rtical-align:top;font-family:Arial;">p:&nbsp;+61&nbsp;(0)&nbsp;8&nbsp;6365&=
nbsp;4056</td></tr></table></td></tr></table></td></tr><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"padding:5px 0 0;vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:13.33px;"><td align=3D"left" style=3D"padding:0 0 3px;verti=
cal-align:top;font-family:Arial;">e:&nbsp;<a href=3D"mailto:Alberto.Fahrenk=
rog@rigtechnologies.com.au" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#000001;"><strong style=3D"font-weight:400;">Albe=
rto.Fahrenkrog@rigtechnologies.com.au</strong></a></td></tr></table></td></=
tr></table></td></tr></table></div></body>
</html>

--_000_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_--

------_=_NextPart_b4d007e6-3364-43c1-bd42-5994119ec39d
Content-Type: image/png;
	name="image430350.png"
Content-Transfer-Encoding: base64
Content-ID: <image430350.png@B0EC2D76.ADEBC01F>
Content-Description: image430350.png
Content-Disposition: inline;
	creation-date="Tue, 21 Mar 2023 01:28:46 +0000";
	filename=image430350.png;
	modification-date="Tue, 21 Mar 2023 01:28:46 +0000";
	size=14270

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
YUYrfJl7ad4AAAAASUVORK5CYII=

------_=_NextPart_b4d007e6-3364-43c1-bd42-5994119ec39d--

--_004_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_
Content-Type: application/octet-stream; name="serial_test_nk.py"
Content-Description: serial_test_nk.py
Content-Disposition: attachment; filename="serial_test_nk.py"; size=2739;
	creation-date="Tue, 21 Mar 2023 01:25:06 GMT";
	modification-date="Tue, 21 Mar 2023 01:25:14 GMT"
Content-Transfer-Encoding: base64

aW1wb3J0IHNlcmlhbAppbXBvcnQgdGhyZWFkaW5nCmltcG9ydCB0aW1lCgpkZWYgcmVhZGVyKHNl
cik6ICAgICAgICAKICAgIAogICAgYnl0ZXNfcmVhZCA9IGJ5dGVhcnJheSgpCiAgICB0b3RhbF9i
eXRlcyA9IGJ5dGVhcnJheSgpCgogICAgZG9fbG9vcCA9IFRydWUKICAgIGZpcnN0X3RpbWVvdXRf
b2sgPSBUcnVlCiAgICBzdGFydF90aW1lID0gdGltZS50aW1lKCkKICAgIAogICAgcHJpbnQoZiJC
ZWdpbm5pbmcgSW4gV2FpdGluZzoge3Nlci5pbl93YWl0aW5nfSIpCiAgICBwcmludChmIkJlZ2lu
bmluZyBPdXQgV2FpdGluZzoge3Nlci5vdXRfd2FpdGluZ30iKQoKICAgIHdoaWxlKGRvX2xvb3Ap
OgogICAgICAgIGlmIHNlci5pbl93YWl0aW5nICE9IDA6CiAgICAgICAgICAgIHByaW50KGYiRmly
c3QgTG9vcCBJbiBXYWl0aW5nOiB7c2VyLmluX3dhaXRpbmd9IikKICAgICAgICAgICAgcHJpbnQo
ZiJGaXJzdCBMb29wIE91dCBXYWl0aW5nOiB7c2VyLm91dF93YWl0aW5nfSIpCiAgICAgICAgdHJ5
OgogICAgICAgICAgICBieXRlc19yZWFkID0gc2VyLnJlYWQoMSkgIyBSZWFkIG91dCByZXBseQog
ICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZToKICAgICAgICAgICAgcHJpbnQoIkNvdWxkIG5v
dCByZWFkIGRhdGEgLSB7fSIuZm9ybWF0KHJlcHIoZSkpKQogICAgICAgICAgICBkb19sb29wID0g
RmFsc2UKICAgICAgICAgICAgcmV0dXJuIHRvdGFsX2J5dGVzCgogICAgICAgIGlmIDAgIT0gbGVu
KGJ5dGVzX3JlYWQpOgogICAgICAgICAgICB0b3RhbF9ieXRlcyArPSBieXRlc19yZWFkCiAgICAg
ICAgICAgIGRvX2xvb3AgPSBGYWxzZQogICAgICAgICAgICBmaXJzdF90aW1lb3V0X29rID0gVHJ1
ZQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIGlmKHRpbWUudGltZSgpIC0gc3RhcnRfdGltZSA+
IDAuNSk6CiAgICAgICAgICAgICAgICBkb19sb29wID0gRmFsc2UKICAgICAgICAgICAgICAgIGZp
cnN0X3RpbWVvdXRfb2sgPSBGYWxzZQogICAgICAgICAgICBlbHNlOgogICAgICAgICAgICAgICAg
dGltZS5zbGVlcCgwLjAwMikKCiAgICBwcmludChmIlRpbWUgZWxhcHNlZCB0byB7bGVuKHRvdGFs
X2J5dGVzKX0gYnl0ZXM6IHt0aW1lLnRpbWUoKSAtIHN0YXJ0X3RpbWV9c2VjcyIpCgogICAgaWYg
Zmlyc3RfdGltZW91dF9vazoKICAgICAgICBzdGFydF90aW1lID0gdGltZS50aW1lKCkKICAgICAg
ICBkb19sb29wID0gVHJ1ZQogICAgICAgIHByZXZfbGVuID0gbGVuKHRvdGFsX2J5dGVzKQoKICAg
ICAgICBpZiBzZXIuaW5fd2FpdGluZyAhPSAwOgogICAgICAgICAgICBwcmludChmIkJlZm9yZSBz
ZWNvbmQgbG9vcCBJbiBXYWl0aW5nOiB7c2VyLmluX3dhaXRpbmd9IikKICAgICAgICAgICAgcHJp
bnQoZiJCZWZvcmUgc2Vjb25kIGxvb3AgT3V0IFdhaXRpbmc6IHtzZXIub3V0X3dhaXRpbmd9IikK
CiAgICAgICAgd2hpbGUoZG9fbG9vcCk6CiAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAg
IGJ5dGVzX3JlYWQgPSBzZXIucmVhZCgxKSAjIFJlYWQgb3V0IHJlcGx5CiAgICAgICAgICAgIGV4
Y2VwdCBFeGNlcHRpb24gYXMgZToKICAgICAgICAgICAgICAgIHByaW50KCJDb3VsZCBub3QgcmVh
ZCBkYXRhIC0ge30iLmZvcm1hdChyZXByKGUpKSkKICAgICAgICAgICAgICAgIGRvX2xvb3AgPSBG
YWxzZQogICAgICAgICAgICAgICAgcmV0dXJuIHRvdGFsX2J5dGVzCgogICAgICAgICAgICBpZiAw
ICE9IGxlbihieXRlc19yZWFkKToKICAgICAgICAgICAgICAgIHRvdGFsX2J5dGVzICs9IGJ5dGVz
X3JlYWQKCiAgICAgICAgICAgIGlmIGxlbih0b3RhbF9ieXRlcykgPiBwcmV2X2xlbjoKICAgICAg
ICAgICAgICAgIHByZXZfbGVuID0gbGVuKHRvdGFsX2J5dGVzKQogICAgICAgICAgICBlbHNlOgog
ICAgICAgICAgICAgICAgaWYodGltZS50aW1lKCkgLSBzdGFydF90aW1lID4gMC4wMDIpOgogICAg
ICAgICAgICAgICAgICAgIGRvX2xvb3AgPSBGYWxzZQogICAgICAgICAgICAgICAgICAgIGZpcnN0
X3RpbWVvdXRfb2sgPSBGYWxzZQogICAgICAgICAgICAgICAgZWxzZToKICAgICAgICAgICAgICAg
ICAgICB0aW1lLnNsZWVwKDAuMDAxKQoKICAgICAgICBwcmludChmIlRpbWUgZWxhcHNlZCB0byB7
bGVuKHRvdGFsX2J5dGVzKX0gYnl0ZXM6IHt0aW1lLnRpbWUoKSAtIHN0YXJ0X3RpbWV9c2VjcyIp
CiAgICAgICAgaWYgbGVuKHRvdGFsX2J5dGVzKSA8IDQwMDA6CiAgICAgICAgICAgIHByaW50KHRv
dGFsX2J5dGVzKQogICAgICAgIGVsc2U6CiAgICAgICAgICAgIHByaW50KHRvdGFsX2J5dGVzWy04
Ol0pCiAgICAgICAgc2VyLmNsb3NlKCkKCmRlZiB3cml0ZXIoc2VyKToKICAgIHByaW50KCJ3cml0
aW5nIikKICAgIHNlci53cml0ZShiJzxceDAwXHgwMFx4MGNceDAwXHgwMFx4ZjQ+JykKCmlmIF9f
bmFtZV9fID09ICJfX21haW5fXyI6CiAgICBjb21wb3J0ID0gIi9kZXYvdHR5UzEiCiAgICBiYXVk
cmF0ZSA9IDYyNTAwMAogICAgc2VyID0gc2VyaWFsLlNlcmlhbChjb21wb3J0LGJhdWRyYXRlLHRp
bWVvdXQ9MC4wMDUpCiAgICBwcmludChzZXIpCgogICAgcnhUaHJlYWQgPSB0aHJlYWRpbmcuVGhy
ZWFkKHRhcmdldCA9IHJlYWRlciwgYXJncyA9IChzZXIsKSwgZGFlbW9uID0gRmFsc2UpCiAgICB0
eFRocmVhZCA9IHRocmVhZGluZy5UaHJlYWQodGFyZ2V0ID0gd3JpdGVyLCBhcmdzID0gKHNlciwp
LCBkYWVtb24gPSBGYWxzZSkKICAgIHJ4VGhyZWFkLnN0YXJ0KCkKICAgIHR4VGhyZWFkLnN0YXJ0
KCkK

--_004_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_004_ME3P282MB13479A857B70CA76AC387783B9819ME3P282MB1347AUSP_--
