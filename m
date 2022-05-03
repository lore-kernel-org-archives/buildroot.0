Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8953BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 23:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17C3B405D9;
	Tue,  3 May 2022 23:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F2jKJn71wmA; Tue,  3 May 2022 23:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 115974049A;
	Tue,  3 May 2022 23:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA441BF4DD
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 23:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA72F60E69
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 23:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=hopperindustrial.com.au
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wr2leTfALn9I for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 23:51:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66FA860B9B
 for <buildroot@buildroot.org>; Tue,  3 May 2022 23:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgscBVCw0SfzJCYz0SPSC11Gf4rBdOA1xRj2KZnJjqwHwm6qcFTps8hwFpVqHtBXe52G3pz3HqB2tI1D242HdayrjGO/JEXjbac/yp/0p27jH4Mo3ryRc8Khov5DBGW9PUdCqtrHGf5xbjkNlcQaGwg6EWYr0xB4SXKGyeI/RoOYhyaHF1f51zWVjXCKRb4GXX1kePvKGDlJiqvRKrVhhHG1/1DdyLN7IIb27LOhi9Edp2rBMw2I0X10nMbSpRC3uUO4JUYc1de61M59LYlVnKZMgwW2KvsrqzdGZfXVUc0LqKL891Prenfri2KcoolpW4ApQR/b74g29m4bSItHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNnT9yoSlIS7KupIDz8bN76kWHMHRo02Vllp1jFxdz0=;
 b=FRlv/xscQbVfKfk+Nnfn/T1a7XjcBI9HF/XoR4t1av8Qdky6GpHolz96N+uvQSlksVcIzAbfWExTUjkQOdh/UiRTvAsvcAm7khuOiDX5RLPcHWVzS+KAfsowg+3hvZVLCvi6iMaBgZXeatm3yecufSP7m6byeg08PqMPTGYFsdpvDkU+INDq53PktGcsOQC+PvTXcwHuUWdpJ6fGwX3IP7jOie9bpgbASPMlUB6PtVp6n7f+pdLhZvIElEm9j3C8rl6gLnaRJgBB1lnMvxxJmEURIQdKOft7jgSf+j//33DQ2gjLTarnAVen+v3/4gsenH509s9d+SS4se5BPhO1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.210.80.79) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=hopperindustrial.com.au; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=hopperindustrial.com.au; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hopperindustrial.com.au; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNnT9yoSlIS7KupIDz8bN76kWHMHRo02Vllp1jFxdz0=;
 b=bizlA0wGGvBcQJBCDTH8MdgVdK4UHfeWJDnRs7wcxj9Bz6374oShgb3cvWXM/zFUvjimo59JrBPVAZ9RuO9Z8Wo8A12rLT0EubH8q6aEG1TVMSpbx0CMzosdLVP9ITNt/O+n0TfSuowH0JHBqg3XZlg+V7hRC14/FSpklk/IKkEOk5FXhkGy69LBqIza7tL1zaQ07e1tdz8H0kqhR77XeMbAmP3f4fy5OM0ArSooeysdm/9Ch6K+GXwKsmI0eeH1pNnPDC5ADGZh9TicJA6w4RqppjqUiICznLoG5bxkKg7HMS/P6hAj7nhKflroweRk64EXrjoeL4PU3bzNqzCR5g==
Received: from SYXPR01CA0085.ausprd01.prod.outlook.com (2603:10c6:0:2e::18) by
 ME4P282MB0934.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:94::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Tue, 3 May 2022 23:51:44 +0000
Received: from SY4AUS01FT004.eop-AUS01.prod.protection.outlook.com
 (2603:10c6:0:2e:cafe::ca) by SYXPR01CA0085.outlook.office365.com
 (2603:10c6:0:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Tue, 3 May 2022 23:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.210.80.79)
 smtp.mailfrom=hopperindustrial.com.au; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=hopperindustrial.com.au;
Received-SPF: Pass (protection.outlook.com: domain of hopperindustrial.com.au
 designates 104.210.80.79 as permitted sender)
 receiver=protection.outlook.com; client-ip=104.210.80.79;
 helo=au1.smtp.exclaimer.net;
Received: from au1.smtp.exclaimer.net (104.210.80.79) by
 SY4AUS01FT004.mail.protection.outlook.com (10.114.156.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 3 May 2022 23:51:42 +0000
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (104.47.71.240)
 by au1.smtp.exclaimer.net (104.210.80.79) with Exclaimer Signature Manager
 ESMTP Proxy au1.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 3 May 2022 23:51:43 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 25872146
X-ExclaimerImprintLatency: 2794771
X-ExclaimerImprintAction: d5e537c1d09d424e89c90b7f9b0e5963
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:8e::13)
 by MEYP282MB1991.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Tue, 3 May
 2022 23:51:39 +0000
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::1dad:2cdd:f73b:ce9f]) by ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::1dad:2cdd:f73b:ce9f%6]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 23:51:38 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Question: Rebuilding file system only (permissions, overlay,
 etc...)
Thread-Index: AQHYXof1wYefaxnR9Um0DGgnqOpuPK0N0yPl
Date: Tue, 3 May 2022 23:51:38 +0000
Message-ID: <ME3P282MB1347005D7306927E91934CC1FEC09@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB13472730DDFBA4F0A245A9ECFEC09@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <ME3P282MB13472730DDFBA4F0A245A9ECFEC09@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hopperindustrial.com.au;
X-MS-Office365-Filtering-Correlation-Id: 283cd60d-3f67-4d8d-c2fd-08da2d5fe00e
x-ms-traffictypediagnostic: MEYP282MB1991:EE_|SY4AUS01FT004:EE_|ME4P282MB0934:EE_
X-Microsoft-Antispam-PRVS: <ME4P282MB093454B1B86CDA2AD1C4DCB9FEC09@ME4P282MB0934.AUSP282.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: TOpXWsx4NskL4naMmKa+Rw0wZn9UFPcCvP+Byfr4zYKC7JTC+qb8rhl0IwML1d6uJi/UBODCpmfnsiTRznCEsg+yhHPzV10PuhaRDvodkVQOzJ8HEnO6iJSVqruHwpJ0bC/otPI5cofOv5LplhJvweVDDBbWgKubMPVe5aTT/Xyp9fcgfhTHjdNff7bDLwwphfOsXXU+N/S1i9RTD0wCKadIRAAHPdfKoxq4X/EN6io3XIB3b4UA6V535CdQBwplzbVNMX2LQwX4KlBQBVEWWEPRkFZ0TejnanP24di/HstR4em7lkx/zG46xJHacMshXsI3qzkFnPq0SMgqL6bMhdY8AFfRmZMiseBX8FjC/KHLvH2l5HxsRyJuzjLMMBLDEWM74M2+O1UsN9NgNB6eIu6MBbaINvHn2JgViwcpFiL2dBeqsciwX0Mz6RRZy5XQrI9XoNiHhXO9IZ17Ko5bHMigfcB79GBYY+HtXH/JANPM0jDwslcnwSewMuFff33SJvDRyYHWPHjjjrSEHm8AYY+eTzwhI4eHxRYlfYcozDlfGXCk/I4CGoeuooWti2UhoN8XaOcSPOCl6y9J8fZ3Wvs+lD3GNYHWQtsW8EnXZ4tbp1TRWBSznp5mrsDBkGekFlf7w+qgcRwuKw+pB6khs5lCHu7RUJVf7PfETHIlNtPYcxxwr6qhbO/73ncK7TqWJkNk6EbhyIAi+QMr/slcqQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM; PTR:;
 CAT:NONE;
 SFS:(13230001)(4636009)(346002)(136003)(366004)(396003)(39840400004)(376002)(6916009)(316002)(38070700005)(38100700002)(71200400001)(122000001)(52536014)(86362001)(8936002)(55016003)(4744005)(5660300002)(66946007)(76116006)(8676002)(66446008)(66476007)(186003)(66556008)(64756008)(83380400001)(508600001)(9686003)(2940100002)(26005)(7696005)(6506007)(33656002)(19627405001)(2906002);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB1991
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SY4AUS01FT004.eop-AUS01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6785e7c3-479c-4abc-201a-08da2d5fdd9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ODRnDdq8JGatuuiGhhFEnFoerH9iuYaZxrTQPOIfRKrKh6cx2HivIy8Rp5UWEpt0vgeZopxp4O+os9tixkvQGg2D6bAv/+GYLKVhV7d8PZHwbFuFNclKr2rVygPRnOSqn6Rifx4ag/JFVgropkNwXRi5YBwQelI0JCy+lV6ifjRlQv36GYLEmVB1nibqDtzGstxL7yn308QKTUSNCvMbt2C1c47TFSdohP7vy22BRd+jBqhr7hics39IJhMzVGtj9L0ahfbCKuved216UCfvCGlk68GVheAQyRouMxtePjRVCREMFEcPtSEKO1sO57AUh1rO6xBXFbyN/uDjxzT+Jj875NI7FT+tX/9A2JZ+k4KJ+uy9m267YTbwr3idfmGkS/v2YLo85lp1Uq894L3RSldzEZzwvSdIzrbA8hkMKDhVKrKfXj4MqVeSMLRHP9TvVYdmk60sHcZS+J+n/RtMJ4HmOYDRWKNYwDgvjNWDYpWZ6bOZI0PtujWznBmsVtn43qQHPPM7AeCaJrWnKwdt2H1/Ee1PfKOuhoLtF+vcanTPn/cGLVayvGqqqe30HpaXBnzAe4ezZoVzNKU2BOABR6WCm5ahU9KfQLlJXkQ5U6mo08HPdIRFbyAnA8b5MqeE3RlpbBt0Ijbr4chE5ZebWDSoxmSVcoI5VJK7qhfqX/PPx32xblIXT6QZdXeF7Lf
X-Forefront-Antispam-Report: CIP:104.210.80.79; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:au1.smtp.exclaimer.net; PTR:au1.smtp.exclaimer.net;
 CAT:NONE;
 SFS:(13230001)(4636009)(39830400003)(136003)(376002)(346002)(396003)(46966006)(36840700001)(2906002)(2940100002)(40480700001)(55016003)(33964004)(6506007)(9686003)(26005)(86362001)(508600001)(52536014)(8936002)(356005)(7696005)(5660300002)(70586007)(7596003)(83380400001)(7636003)(70206006)(33656002)(47076005)(336012)(316002)(186003)(19627405001)(6916009)(36860700001)(82310400005)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: hopperindustrial.com.au
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 23:51:42.7428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283cd60d-3f67-4d8d-c2fd-08da2d5fe00e
X-MS-Exchange-CrossTenant-Id: d9b9a834-a53c-4fa3-b2c0-12e53d54aec8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d9b9a834-a53c-4fa3-b2c0-12e53d54aec8; Ip=[104.210.80.79];
 Helo=[au1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: SY4AUS01FT004.eop-AUS01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0934
Subject: [Buildroot] Question: Rebuilding file system only (permissions,
 overlay, etc...)
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
From: Alberto Fahrenkrog via buildroot <buildroot@buildroot.org>
Reply-To: Alberto Fahrenkrog <AFahrenkrog@hopperindustrial.com.au>
Content-Type: multipart/mixed; boundary="===============2682456019123601949=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============2682456019123601949==
Content-Type: multipart/related;
	boundary="----_=_NextPart_2e8f589f-bbb9-477c-8eb6-1a8d4e1c05f2"

This is a multi-part message in MIME format.

------_=_NextPart_2e8f589f-bbb9-477c-8eb6-1a8d4e1c05f2
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ME3P282MB1347005D7306927E91934CC1FEC09ME3P282MB1347AUSP_"

--_000_ME3P282MB1347005D7306927E91934CC1FEC09ME3P282MB1347AUSP_
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm a novice in the Linux build world and Buildroot as well, and I'm workin=
g on a CycloneV FPGA-HPS board. So far I'm very happy with the way Buildroo=
t has helped me build a system in short time.

I still have a few questions for which I can't find the correct answers onl=
ine, I hope this is the right place, if not, apologies.

I'm trying out a few configurations for the operating system, users, permis=
sions, file folder overlays, etc... Is there a way I can get buildroot to j=
ust rebuild the file system and add new permissions, generate a new image, =
without having to rebuild all? I'm talking about changes to:

BR2_ROOTFS_POST_BUILD_SCRIPT
BR2_ROOTFS_POST_IMAGE_SCRIPT
BR2_ROOTFS_POST_SCRIPT_ARGS
BR2_ROOTFS_OVERLAY
BR2_ROOTFS_DEVICE_TABLE
BR2_ROOTFS_USERS_TABLES

I found that running "make" again did not provide the changes expected... o=
r I did something wrong.

Cheers,

Alberto


Alberto Fahrenkrog Snr Electronics engineer 
Orica - Perth Technology Centre
p: +61 (0) 8 6365 4056
e: AFahrenkrog@hopperindustrial.com.au

--_000_ME3P282MB1347005D7306927E91934CC1FEC09ME3P282MB1347AUSP_
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
<div><span class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, =
Helvetica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">Hi all,=
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
I'm a novice in the Linux build world and Buildroot as well, and I'm workin=
g on a CycloneV FPGA-HPS board. So far I'm very happy with the way Buildroo=
t has helped me build a system in short time.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
I still have a few questions for which I can't find the correct answers onl=
ine, I hope this is the right place, if not, apologies.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
I'm trying out a few configurations for the operating system, users, permis=
sions, file folder overlays, etc... Is there a way I can get buildroot to j=
ust rebuild the file system and add new permissions, generate a new image, =
without having to rebuild all? I'm
 talking about changes to:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri, Arial, Helvet=
ica, sans-serif;font-size:12pt;color:rgb(0, 0, 0) !important">
<div><span><br>
</span></div>
<div><span>BR2_ROOTFS_POST_BUILD_SCRIPT
<div>BR2_ROOTFS_POST_IMAGE_SCRIPT</div>
<div>BR2_ROOTFS_POST_SCRIPT_ARGS</div>
BR2_ROOTFS_OVERLAY<br>
</span></div>
<div><span><code class=3D"x_literal">BR2_ROOTFS_DEVICE_TABLE</code><br>
</span></div>
<div><span><code class=3D"x_literal">BR2_ROOTFS_USERS_TABLES</code> <br>
</span></div>
<div><span><br>
</span></div>
<div><span>I found that running &quot;make&quot; again did not provide the =
changes expected... or I did something wrong.</span></div>
<div><span><br>
</span></div>
<div><span>Cheers,</span></div>
<div><span><br>
</span></div>
<span><span>Alberto</span></span></div>
<br>
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"width:100%;"><tr style=3D"font-size:0;"><td align=3D"left" =
style=3D"vertical-align:middle;"><table cellpadding=3D"0" cellspacing=3D"0"=
 border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;line-height:n=
ormal;"><td align=3D"left" style=3D"padding:0;vertical-align:middle;"><img =
src=3D"cid:image369376.png@F3B07478.0CFD7E6D" height=3D"60" border=3D"0" al=
t=3D"" style=3D"height:60px;min-height:60px;max-height:60px;font-size:0;" /=
></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:1=
3px 0 0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"font-size:0;color:#000001;font-style:normal;font-we=
ight:700;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Arial;">Alberto<span styl=
e=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;=
">&#8203;</span>&nbsp;Fahrenkrog</td><td align=3D"left" style=3D"vertical-a=
lign:top;font-size:0;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;color:#000001;font-style:normal;font-weight:400=
;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" s=
tyle=3D"padding:0 5px;vertical-align:top;font-family:Arial;">&nbsp;</td></t=
r></table></td><td align=3D"left" style=3D"vertical-align:top;font-family:A=
rial;font-style:italic;font-weight:400;">Snr&nbsp;Electronics&nbsp;engineer=
&nbsp;</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"vertical-align:middle;"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"font-size:0;color:#000001;font-style:normal;fo=
nt-weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;"><td ali=
gn=3D"left" style=3D"padding:7px 0 0;vertical-align:middle;font-family:Aria=
l;">Orica&nbsp;=E2=80=91&nbsp;Perth&nbsp;Technology&nbsp;Centre</td></tr></=
table></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cells=
pacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"padding:4px 0 0;vertical-align:top;"><table ce=
llpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#=
000001;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"=
font-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;font-fam=
ily:Arial;">p:&nbsp;+61&nbsp;(0)&nbsp;8&nbsp;6365&nbsp;4056</td></tr></tabl=
e></td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"padding:5px 0 0;vertical-align:top;"><table cellpadding=3D"0" cel=
lspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#000001;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;"=
><td align=3D"left" style=3D"padding:0 0 3px;vertical-align:top;font-family=
:Arial;">e:&nbsp;<a href=3D"mailto:AFahrenkrog@hopperindustrial.com.au" tar=
get=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#0000=
01;"><strong style=3D"font-weight:400;">AFahrenkrog@hopperindustrial.com.au=
</strong></a></td></tr></table></td></tr></table></td></tr></table></div></=
body>
</html>

--_000_ME3P282MB1347005D7306927E91934CC1FEC09ME3P282MB1347AUSP_--

------_=_NextPart_2e8f589f-bbb9-477c-8eb6-1a8d4e1c05f2
Content-Type: image/png;
	name="image369376.png"
Content-Transfer-Encoding: base64
Content-ID: <image369376.png@F3B07478.0CFD7E6D>
Content-Description: image369376.png
Content-Disposition: inline;
	creation-date="Tue, 03 May 2022 23:51:42 +0000";
	filename=image369376.png;
	modification-date="Tue, 03 May 2022 23:51:42 +0000";
	size=14270

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
YUYrfJl7ad4AAAAASUVORK5CYII=

------_=_NextPart_2e8f589f-bbb9-477c-8eb6-1a8d4e1c05f2--

--===============2682456019123601949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2682456019123601949==--

