Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F69BC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 23:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 855E840571;
	Mon, 13 Mar 2023 23:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855E840571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbytdYSbb79A; Mon, 13 Mar 2023 23:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05784056C;
	Mon, 13 Mar 2023 23:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05784056C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6B801BF377
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 23:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F0F360E28
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 23:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F0F360E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nl1RdtZMWnyu for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 23:33:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8276160BD5
Received: from DM4PR02CU002-vft-obe.outbound.protection.outlook.com
 (mail-centralusazlp170130008.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::8])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8276160BD5
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 23:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR9E6VZblrAs+hUA8b2wGarPCpdJnmp7+5U28oV3+NH9bMAKc882MdlDD2CRBskhGH9wiahCpQDYER4cTk1321k0a0WNWLfcHfmQ31CZpnEtj1pWy8A9nQdkV7D9+D69jN8mVAOTCkDOJ0Xhv/qoL3rb5oD9Pe2DIKp8YolrthwUsCxgk2tcBtp2Jh0Qymch2so1CQGy+WR2LAFqcwPArnT/8BKfVR1uKjl8yzRJayNWHocKnaIOkx7+sSlC4KvfP12MLca76PmgrpKx1+7lp40awo+Bky4s+xeSCMl257YRz/SzzIidYhiSc1Ppd/rBefMXjHgXu3YT75ep0RYeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXIE/yIaSVUMkavHySkD6gsTAA4/bwDTpEf6uHcf1Ro=;
 b=TaPTIXYzPiq85Ngdy+JFgoOJUexAitbPaBu4WhNxx6l9/f9dlz1S7DTTbKTLkDTWG7R2dPk30CFHppuovEVtSu1AeOWDvcPNUVsGv7wcnm3fsgHXe11enrIoBnYep0MjdZvwepdkEFEnw6cy2bFOUXaQfDaCJ+/J4bm/GR9Rqo3sYCdQ3EwxUKqOKojahLIDpxD0aR+9ohQhvaIMqOG9agYIGaih/CQ4SqoB33onwMcSPtF0qoBlZ8SvbQeG3aUj53+dDP2wd8X/whBzscEDE4sle7GdOG1ummR5VjjR2gNqo2cP4ysK9i74TzmAQO8jRyWjjJHRZ/1J43HMjwz9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR05MB7625.namprd05.prod.outlook.com (2603:10b6:a03:2ab::17)
 by SN7PR05MB9985.namprd05.prod.outlook.com (2603:10b6:806:261::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 23:33:45 +0000
Received: from SJ0PR05MB7625.namprd05.prod.outlook.com
 ([fe80::1178:ca4f:682d:1c84]) by SJ0PR05MB7625.namprd05.prod.outlook.com
 ([fe80::1178:ca4f:682d:1c84%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 23:33:45 +0000
From: C D <dellicker@live.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Forcing linker to look at right library path?
Thread-Index: AQHZVf9+ezz2XZsLZEmD2c4DuBHbRQ==
Date: Mon, 13 Mar 2023 23:33:45 +0000
Message-ID: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [p1iDa38ekC7UE3fIEkFaWy4JrDtZSUzN]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR05MB7625:EE_|SN7PR05MB9985:EE_
x-ms-office365-filtering-correlation-id: e12df1b9-9c8b-4a00-578b-08db241b63aa
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kgaf7loiLX/MvkRDAX4DEgbLsyhPd0A5pb5x9jdAcih2ASPgtCsTHnWh5JhnXXjUO9Ff77J2YS/vPhaVmHk1VAG7Pa0bllav2vMAMBCQNmXRu9IhQO7xMOl2Kf6DWnQ2OfY8z9EqIS+JVjKQx1TZTHdX4lSMEAQv3fTVTBcH8uGk+6k/WOJT6ahFisXuGaKzB0MVSkZLnvlf8C7P99sZNIq3kHMYJkXx9ijY0+BDl0vb2ajzXCu8+5PPpxf6O4YexKaIVcf6YoQ7KZfWZyLvU83jiATMmlfDgdIFZ1t+u4IpypfixugbBkfYIELVR9AgLBQPOzqRvZPuUO7MMArjeaPmHvJdIj/X8JTif/JXYA0Zc7jIhi3lk5eestc8RJv+pOy/Wq20vR084Ptcl4WM4bIpeGVqgVTLWv07UsT3xE3XpDYTxXumQhfrcFdabgG6XQH9cImT2ZCxBsFdJO/vTeJMRxBrLvgcSscwKKjzOsAa1PGKPFVCrSwEeCBlvw5A59As/3wYesrPciZ1XkOZuwZE+JdqW9lbaqoM34aimmaHveYpDIaOvmuUDAnFjmtwWr5a2TQKUmiFzTu6qYgOfi7aAM2ISrttw56nrK9fxW8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3qDQtRmOr+4RGnBQdU6nl/ZINTHoanQrHk1ISP/YFk03V9zyv+82+wzZ69?=
 =?iso-8859-1?Q?KXTMuTqpce/8u5bc1KKnX+yb/mvutyMRHsLOGgowNFRclbcfurFiQ7/NDK?=
 =?iso-8859-1?Q?2qB1IpM1wJDY93XfBSDaB4sNVcD4maRGsRkHifsbbt7WS/KcTJQ8TQk1mR?=
 =?iso-8859-1?Q?JhYd64LB+GbI+l36WYh9U9tuKfZ+4XrI3pGcabWJ+qhx6qDXktPANgCNh4?=
 =?iso-8859-1?Q?qAA6p/LR1xWeMZR/XJkzFog71eK7JnZwhBHL96d/ojabMuTEmBOqsijtTk?=
 =?iso-8859-1?Q?Go7SJDqbybrvjYXGTMXTF+4dLnaouulJ6Dimq5pvoqrExxcHMfVotu4GxN?=
 =?iso-8859-1?Q?S98ntdZVe4ISAK5bfqsAmZnLzvlOaJZMFaNWnzu6DPXSDIcmFnxKcqSF62?=
 =?iso-8859-1?Q?H1OBX9tg++0ItHRPOwV5ngICwU/ZIDgBnZVnnNOnOZx2t9fakniymg7fBO?=
 =?iso-8859-1?Q?tS73tKxAN6kab58n9AYFLmd+Bo1gj+hZrLlzn1Fbhp+WQv+G+vIgM48liw?=
 =?iso-8859-1?Q?6Hu9MvChiqVRXFBiOA+mWXXqA1QHHeV55RpeyQXQ+ri/uDFbOtdcUOmxyq?=
 =?iso-8859-1?Q?ityGKrwcHjirJFDC4xkrnE/sId8+QK9QwzLydKS8C2CLHrbPQPfE94i7y/?=
 =?iso-8859-1?Q?tojDihRCZ+tvk1TZ3WOeIfdEEAQK7nBm1RAl7CwuWh/cPahPswD9IKwJlu?=
 =?iso-8859-1?Q?Ma5rngZXQlFMzbGvTwZQXZ6TMaxie0t7GB5LQHq1JLymsJt0udGPBYSneH?=
 =?iso-8859-1?Q?DslJwItiRqr+hf+zthIr/6nH86hm64IiDNCstO1imKIwdWCPNO2J43WGW0?=
 =?iso-8859-1?Q?x+iQlj4qGJjkW7YIy8eKRNjQoDLGYM9GBQ7DJR2Ylbr1LcPw8VESys9lDh?=
 =?iso-8859-1?Q?h3PO4Z9tj05Ev6PqBItHR8A+n1vMCVD5BX6aM/UfDilov8HpTSzoBJiMmb?=
 =?iso-8859-1?Q?4auZzoko99EExzqOZq5TXaAMGI7bgeGBf4w/uAIqlUdfbZOB8WiZ/1P8l3?=
 =?iso-8859-1?Q?ohpQs8UsbN6DFdG9W3IhW5/LiQ9dDFmsHL1ReMhcBH/JyaAxXXdFrLCxjJ?=
 =?iso-8859-1?Q?MFiInRYh2q1+cnT/wZ+yg3pqlXwJuxv6MTEvYK6kWZfLN9e9C9Mnu6PuPF?=
 =?iso-8859-1?Q?rwyRo72BBQcJm0bXoWLqk85y/YNBN6zReafzYLr4Br0CDG9e0Z6IYmgVna?=
 =?iso-8859-1?Q?MoLFnBNPZOGG7qzdTzLIuK60gtPGPOhAvITgVnMTHiAH6Iq8aud4rq/8vZ?=
 =?iso-8859-1?Q?8j5lx3l+fYDvUnbGi/CBaR40WKx53nl7GrY953gvhaVL/c+KjpQ4cGVkkL?=
 =?iso-8859-1?Q?ztVR?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR05MB7625.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e12df1b9-9c8b-4a00-578b-08db241b63aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 23:33:45.7412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB9985
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXIE/yIaSVUMkavHySkD6gsTAA4/bwDTpEf6uHcf1Ro=;
 b=D65+rv59/wQaBheeMkIx8VoGXSWQDO7I8eAoryJBIQKuwMzPBnsZW0Z0falrq+NXRsFIi1uvmUGdZn1QnOfaCaTk0rsK9yBvfy0leGS5MPErlP4CMlxEL3Mg6UklQyVyZmT2osm7q+KNOkvqci37vVEKnGgopeD9onE46eKKNCI0C7gDgn95JKjVrUBpRcsr8bfS+VZGrs2vCmJqpM9squuJBmnpzjN84YpOVKiUEaeHpCxWy6JXeEe1D2Et+VwP85SWxY2JBwV5F/nJIAv8XkqZrUmRzvnqFQWiLyuFP7XuZFytLswFUUrJnbCDJ2y3fvtoblrjXVlv0FuCcPnFig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=D65+rv59
Subject: [Buildroot] Forcing linker to look at right library path?
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
Content-Type: multipart/mixed; boundary="===============6972855718816211489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6972855718816211489==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99SJ0PR05MB7625namp_"

--_000_SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99SJ0PR05MB7625namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good afternoon,

I'm running in to an issue with a package linking against libubsan and liba=
san.  I've figured out how to compile Buildroot so that it copies those lib=
raries to the correct output/target/lib and output/target/lib64 locations, =
but it seems like the package is linking to the versions installed in my OS=
 (RHEL 8.7) in /usr/lib64 instead.

So, in /usr/lib64 I have libasan.so.5 and libubsan.so.1, and in Buildroot's=
 output/target/lib64 I have libasan.so.6; when I boot into Buildroot and ru=
n my program, it errors out because it's looking for libasan.so.5.

What do I need to do for it to point to the correct library location when l=
inking?  Is this a Buildroot config option, or something I need to set up i=
n my Makefile?

Thanks,
Chris

--_000_SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99SJ0PR05MB7625namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
Good afternoon,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
I'm running in to an issue with a package linking against libubsan and liba=
san.&nbsp; I've figured out how to compile Buildroot so that it copies thos=
e libraries to the correct output/target/lib and output/target/lib64 locati=
ons, but it seems like the package is
 linking to the versions installed in my OS (RHEL 8.7) in /usr/lib64 instea=
d.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
So, in /usr/lib64 I have libasan.so.5 and libubsan.so.1, and in Buildroot's=
 output/target/lib64 I have libasan.so.6; when I boot into Buildroot and ru=
n my program, it errors out because it's looking for libasan.so.5.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
What do I need to do for it to point to the correct library location when l=
inking?&nbsp; Is this a Buildroot config option, or something I need to set=
 up in my Makefile?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
Chris</div>
</body>
</html>

--_000_SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99SJ0PR05MB7625namp_--

--===============6972855718816211489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6972855718816211489==--
