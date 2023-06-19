Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B3EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6084681F29;
	Mon, 19 Jun 2023 13:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6084681F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sT1jjm4o8yVV; Mon, 19 Jun 2023 13:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95D0C81F54;
	Mon, 19 Jun 2023 13:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D0C81F54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05D631BF4DB
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 13:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD41D40880
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 13:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD41D40880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLUWKVTtvT_m for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 13:17:30 +0000 (UTC)
X-Greylist: delayed 00:30:25 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBEB4087C
Received: from mail2.bender-group.com (mail2.bender-group.com [194.113.57.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EBEB4087C
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:17:29 +0000 (UTC)
Received: from pps.filterd (mailgwag02.intra.bender [127.0.0.1])
 by mailgwag02.intra.bender (8.17.1.19/8.17.1.19) with ESMTP id 35J5jJ3H028585
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:47:02 +0200
Received: from extraseg01.extra.bender ([192.168.90.20])
 by mailgwag02.intra.bender (PPS) with ESMTP id 3r92w5gxex-1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:47:02 +0200
Received: from mailgwma01.intra.bender (unknown [192.168.90.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by EXTRASEG01.extra.bender (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:47:01 +0200 (CEST)
Received: from mailgwag02.intra.bender (mailgwag02.intra.bender [127.0.0.1])
 by pps.seppmail (8.17.1.5/8.17.1.5) with ESMTP id 35J5J2Us008212
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:47:01 +0200
Received: from vms062.intra.bender ([10.0.10.62])
 by mailgwag02.intra.bender (PPS) with ESMTPS id 3r92w5gxew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 14:47:00 +0200
Received: from VMS062.intra.bender (10.0.10.62) by VMS062.intra.bender
 (10.0.10.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2375.34; Mon, 19
 Jun 2023 14:47:00 +0200
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (104.47.7.171) by
 hybrid.bender.de (10.0.10.62) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2375.34 via
 Frontend Transport; Mon, 19 Jun 2023 14:47:00 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRwnR8p9+cmFiNrFvxqamFD2S+XZckS7ILZNvHtv6tDiPUAoUBN8QvPqTbG9Ytl8vqNKav+w5A1ifW5Q4roO52YSp5NQhotasqbYU/atNnAbeXsUq0bYyPeLCtYN3jc90Pboux+7EL35gvvy0uYsq7/rDhhqTCvbINY4+3Y5gZd/IOlSQe7BPsPJyPykWDcNG+o6ypOmTAFd32YvLFjgp5SjKYsWWNJuubwQJcODW78lfqxkpeGv3Cy2XgNUavPiWdHy+/tP9uvzA4fo1k5ZHjpZ2iwTBRYobmvLSITVMqLbq/L8LRUQMAEl1GJvoAxnay+xzkqH+roJO/X7dsMkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7geOfrMW3heR7Zxra/YBLPTWV38WPRuhhhPtg6tphc=;
 b=AEi+/Dh0cdCQEV/QWNqhAH2JWvcd2ukXWyc3F2k776xBUue5kzhHfKH5ZOH/dS6orVvftF4cuYyoXDyptcC5WapULvvsaQ7gcNWvYXUGrVUTv8fA1QV2CSv1neWCuwAYV54qJiBaKfbPtev8L9u4s62vwJqDwOWxMLPWkOk/tErM4sTlNCdrHHZoQeP1QyfJwBAnef617Wh3kGRu8tdXEk0uGs8zmNaedleRHjBUOjW+Y8ev1TmAPFAzQIY6DV0Q5DhCBm1eqaXlUxnrkbTF5YCbirUrhdIkWzwa05GB/+RYdet71Fv5sSz1eDqbrnetzynK9ESDSUjG1WO+I/CobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebee.de; dmarc=pass action=none header.from=ebee.de; dkim=pass
 header.d=ebee.de; arc=none
Received: from BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:1f::13)
 by FR2P281MB1493.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:8c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 12:46:58 +0000
Received: from BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9052:1662:4535:8a90]) by BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM
 ([fe80::9052:1662:4535:8a90%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 12:46:58 +0000
From: "May, Torsten" <torsten.may@ebee.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] OpenSSL v3.0
Thread-Index: AQHZoqvZptTLIlZpl0+EOS9lSaifbA==
Date: Mon, 19 Jun 2023 12:46:58 +0000
Message-ID: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BE1P281MB1668:EE_|FR2P281MB1493:EE_
x-ms-office365-filtering-correlation-id: 266a10e6-f8a7-4e14-f3e1-08db70c34528
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJxFzDh5Q/3/Jog9ngzZ39ve0FTISzxdAVFIGpqoT89jF7S0U8g0+wrrUE+iBoGXcya7NwoWfrWqIo0fV4OrUEIYDLr37Nc2VpLTndy6+vQHSEuIptEZbR/i1stGAIHjh9mL4C30NoMrY6cp3Cil08NxgtYY+W/Zk3EGm7LMfm9APYiClQ/KCUuC7RLPpAAt7KRPxlJGCD0lHRURPTXJqmfylwHKJRlAce4Tl49anLImwJx6IaTrlufolYMY8w1Thd988RrHqIXEm4tp8kNsTLeeX9ZW5mh9Lvj5fD7Ou5100f30RwQuZ0vGKyMUjOq9AK1D14jwadClJJg2wN7+s1YCoaHwp1apsNmgyDGHLzmyHIBT+2HVevDYuY4g761rI7exvVWnRTnXxVxg38AVMvQlQMsKCJSR+In7xkDU4YGJCF5O8c/3xTq0ZVuV6wyEKtuPXi1A0/pY1NFApPVqten5wOIcsQFPjgD0+ep2ZQ7adQBtg87/8hSZ5YTvbAkAUrarzCXYXg7BaOiTJLUgCaD8nJ/GOKLkC8vhqDWl8yKsHWjXez1QASBQtVsYI7UUdkhyPQqN/LFzGxoWqukBFrSbk/Zz0iYiWlri8Vju99fGHQbFGAiVrkaGajYumTzAwiqBeo4Kz1MM1ssBW9XpR7IkZfUSavD1GytYrQLJ0Ek=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199021)(41300700001)(5660300002)(52536014)(8936002)(8676002)(2906002)(38070700005)(558084003)(33656002)(55016003)(86362001)(9686003)(6506007)(186003)(478600001)(7696005)(71200400001)(122000001)(76116006)(66946007)(66556008)(66446008)(64756008)(91956017)(6916009)(66476007)(38100700002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j8fETxa+eh+UUr9ZWY8nu5PG2u4S/wn9nLQNxfPYXZC4+xX7f9JJ69FBWHXJ?=
 =?us-ascii?Q?X03TzMBgk022QlagRw78fv7Es7Xmthct+gr9MNyR5W7o6a9k7oKPHoTr9pbK?=
 =?us-ascii?Q?/acSRh/SPJy0m93gHKahCpUaSrdISPiBcuO3sQRDbOPBgdmNvPOh+rkbo+qP?=
 =?us-ascii?Q?bgKwIdoDEnnJ/crz1RN/w0h+uP9os2PJBmxpd+vBWAAL2q5RRq05dqh8fKPu?=
 =?us-ascii?Q?CZ1H1PbAROsRSs2zhuIGbtzUba8liNkH4Dpl41vC7ZfVEw/DzkYw2dM2n8VC?=
 =?us-ascii?Q?Awa6aaB9H+qrjmbb2wiRISZ5UG4INs52lpujCV8hoN8unbeNr9sNWfb1OY3o?=
 =?us-ascii?Q?Fp/jgPLEWD01bezp/z7CYZAFsLDYAracGGNAS2ZoeUUQcIPlwQiVYWq/0tzn?=
 =?us-ascii?Q?X3gxxrGHCwnneHQros/XsVb0Pt41u5PKmJLeB0hTEe8NQoaCQfWfg4VTmOtD?=
 =?us-ascii?Q?7jhJzdiRh0GyM4U4VPMjS3R8MR6OybiFVJKMIPTjVuVWV5QmkCboZ7E6cOWr?=
 =?us-ascii?Q?9aPuyHETHnF0uNXV6TODzMMUz8w6D9Y8jqSdI7wb/sgNJmsCzkFHMiWCKzTd?=
 =?us-ascii?Q?A95VdXKG3fUwxSjSlCnkVabUlIHmqDOFYLiIiKeBBDWPT3mp/Ito0RAOuqKI?=
 =?us-ascii?Q?O4no1eV7wUveiV8IxEFAih44N4nH/t5SC3J1zxKVrcY5pRZ/Mj5abIHFWzli?=
 =?us-ascii?Q?ng/SYm1CUj35ic5GYuEC9224A2u3EQNHDpckRzsSkJXaosTXf3Zz2AYu0qX5?=
 =?us-ascii?Q?QRPd56Wr+QZEj8OpM0ZkR4RYKGBzGpX1yPZbDAHz+hMaBwqZ0x0P64i3XSUY?=
 =?us-ascii?Q?IxLNNuBeyo+PtB6AGKIbkos/7pCsrjmGWOvXEgj50iV/M/kEwmVgQuzSWvoC?=
 =?us-ascii?Q?Sk4fUh2+l0Z+WPtNFwR5JGSvpPEo64i889KyukmnCjXswe1cMhAm5aZ7VZpf?=
 =?us-ascii?Q?HO4X6ppGnyJ5TWegwEjm2qXO53tNcSsN7POiJYwJ8xO1XSdy219WkjfwI9un?=
 =?us-ascii?Q?8tN0wUh+GclmB37SWpgyJNI2mwyBXgBxLU0SLoL2Ct7yrXE7YKjyFjE7I2mg?=
 =?us-ascii?Q?PSYOLs6JUTqRKPg1uzo3TDbpqnC7GnUwnVz7eHHuOJSByFhASqMC+ZNfL57u?=
 =?us-ascii?Q?VdD1ZJucxytEo1D108IdIL8G7Y7ljtCwmk+oaDRL8O2PqJ1R3tneTGFDLnNp?=
 =?us-ascii?Q?OUa5qvw0cpsYu+uG4yxuxjrc99Xd0MuFlSnIHWXzGBw2wffeEPKMkAiEOJAo?=
 =?us-ascii?Q?nqkJ/x5ptz7r4hEnPaS/4ubHk5qmLCOxmzqZ9/ziss0dneBDPXvyMHuY+9TZ?=
 =?us-ascii?Q?cEhVg1vY9uIY/6BiO7P3U8FzOxXsGhzZSn5efwJs35W1WtRVJAhp3oYLx621?=
 =?us-ascii?Q?aX3DUykTqxWOIJlLURTcPd4NAS4jjGPPRJNQFy8F7VK+4+clnDKJ/qCQuKBq?=
 =?us-ascii?Q?v8nIPQbLBqBxJgi7qgms2MoQnF4+LG2EDMIxzYl8FLbkVOwLrv52ukVa2sof?=
 =?us-ascii?Q?RmVl61UbcuH7ur5sPnfmgm/C5jygmPqAQXkCHzfMyrKd2khr5gUqTYvf4Fiv?=
 =?us-ascii?Q?vHo9CrzoqjJ4W8SIvW6PS0TBsaVcpDuPqbHpMoTEBcKSjA72bT/Pan+2Jxu1?=
 =?us-ascii?Q?G/wBPOBNMa+F3oNO7yUd2LE3euASV7CpzDA93LoSNcOncs+dO/jCRJUXKdM9?=
 =?us-ascii?Q?TAjjug=3D=3D?=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 266a10e6-f8a7-4e14-f3e1-08db70c34528
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 12:46:58.3952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f516ab38-e108-4989-bf85-0219703b8744
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +PR6Hvs/gGRgeWvJl+kTegqBaxkBQ6kKgZxNSAlxERDly56sk6JVWKp7qcZFLNBNsgpG1uj8h+nvVJ4M8mFw5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1493
X-OriginatorOrg: ebee.de
x-proofpoint-rule: module.access.rule.seppmail
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_09,2023-06-16_01,2023-05-22_02
X-SM-outgoing: yes
X-seppmail-outgoing: ok
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_09,2023-06-16_01,2023-05-22_02
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebee.de; h=from : to : subject :
 date : message-id : mime-version : content-type; s=mail;
 bh=84WLzuXAenP6CBLkPE8xVqg/Jf9XVLCat/pnKaRV/jI=;
 b=qOOMbKLcjgdjzOTtgUtYqGb3G2YTjypRKcrbO1mFQNalN+Tm4XRPDm7LR4Fog9nMti8Y
 foZfe9KcGFrPWQvX8hZpbKxTetDylliMClowYHxqbFgRjDNeyDAVMWLeXlIWfe9cdvIo
 NHqRyEjzd0qWvkAVUNwjDVhNSF8rlSOmhZa/qgNfLEG2jmZQCjnOe+Slq7lnHIZPrZJ0
 mxgH9kMFFa0NQt/7x9eGRs9/Uau8e2SR5Kn016W9wKuTvrxC7dc4K6gY8aL6Ob6Cw/3B
 Z4jjeBmrv3TpY9plwBtaZMh8ZnjxU+Ta1/R38/LI5zf8i7lZjHdJjrpHpeJwU45t9bHc GA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mybender.onmicrosoft.com; s=selector2-mybender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7geOfrMW3heR7Zxra/YBLPTWV38WPRuhhhPtg6tphc=;
 b=N1mkuC/aRThRIdO3tZAxBPr/i47YoSuswys1EIbV+qDhmoNHoV2DUeZPxUUETieUX+vxwpWor9VI0uW+3nql8q5v30FISMrwU2lnU1LTbIgjdBpd4oUk5Zog5TqtRabDkKUXHiSMjHzXSGhgXvYbSmAjmsrvp0YP/bzFi5QsrHY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ebee.de header.i=@ebee.de
 header.a=rsa-sha256 header.s=mail header.b=qOOMbKLc; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mybender.onmicrosoft.com header.i=@mybender.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mybender-onmicrosoft-com
 header.b=N1mkuC/a
Subject: Re: [Buildroot] OpenSSL v3.0
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
Content-Type: multipart/mixed; boundary="===============6307246366277785338=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============6307246366277785338==
Content-Language: de-DE
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg="sha-256"; boundary="----6C0BF6B467FE8AE3A074560E50B0CDB3"

This is an S/MIME signed message

------6C0BF6B467FE8AE3A074560E50B0CDB3
Content-Type: multipart/alternative;
	boundary="_000_BE1P281MB166840C4621F6F53B7B1B3FEEC5FABE1P281MB1668DEUP_"
MIME-version: 1.0

--_000_BE1P281MB166840C4621F6F53B7B1B3FEEC5FABE1P281MB1668DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

as September is approaching quickly, is there any progress on that topic?

BR Torsten

--_000_BE1P281MB166840C4621F6F53B7B1B3FEEC5FABE1P281MB1668DEUP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div style=3D"">
<div>Hi Peter,&nbsp;</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">as September is approaching quickly, is there any progress=
 on that topic?</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR Torsten&nbsp;</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">
<div></div>
</div>
</div>
</div>
</body>
</html>

--_000_BE1P281MB166840C4621F6F53B7B1B3FEEC5FABE1P281MB1668DEUP_--

------6C0BF6B467FE8AE3A074560E50B0CDB3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
oSqrfruFfGVmcKfpItvuuzL6q7GGP6tIgbir8yrdN8cuC/ar31WtVCAUOreJRG3n
6D+uiCEYjkdWlQDJ7GVuVkcUTa0uJtLUi2zK8zMt+fCbjreGJoHnC56LDHwFpzx6
+fCFkJyJZzl1EbFjsNQjLH3cHyt27QStuhHJB0kN4ygPLhEU0ray/3i4/lpTgCSs
C0i6TjIxUeyq/rtELAvX+X2rjdpsqwjd80E9j/VBQVzGzFHKDkQft2qAdlVpUeZM
/ReA+7NU7rBKHTOTBnm5YRGs5A5bs93gsSVct9TTzfR7ngFUK4KQoeHKQ43wQaQc
B8DWMxajRUaPhExp/ZNXndPlb8skDDEtA5jCADlEeSKBbeTq/AtkJm78yp4aA0Tt
f01N6RGydr2GfXu7VD9RkEfHi/j/TizyCDCMGcEsRzWevatTpCKunwwhGSm9npvP
hNyO0TVLIhCBG2LtwEvTK5AiSR8tIa6Rxd/x1kFUcg7eyjQQ9cmandVcFuTNJbHH
qHFGrPhThReJqyQaOBgyJHPpVa74gGMDb4Sw36CUtalT8Itq9VR55f9bnKJvIuH/
QCllbG+OSGkxPoEbO4tY+lsvO2t9ayTwvPKN5ZrmrHjL2IIrABcdeWoJLtZuds8w
+9tZAgMBAAGjggFnMIIBYzAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQJDL8q
oh0EJAyy+UAKQcLPWnKqgDAfBgNVHSMEGDAWgBRbJXuWpGVRfrg588B4Zl7oOufw
7jAOBgNVHQ8BAf8EBAMCAQYwgf8GA1UdHwSB9zCB9DBHoEWgQ4ZBaHR0cDovL2Ny
bC5zd2lzc3NpZ24ubmV0LzVCMjU3Qjk2QTQ2NTUxN0VCODM5RjNDMDc4NjY1RUU4
M0FFN0YwRUUwgaiggaWggaKGgZ9sZGFwOi8vZGlyZWN0b3J5LnN3aXNzc2lnbi5u
ZXQvQ049NUIyNTdCOTZBNDY1NTE3RUI4MzlGM0MwNzg2NjVFRTgzQUU3RjBFRSUy
Q089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jh
c2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwDQYJKoZIhvcNAQEL
BQADggIBAAL46l3QisysCAM2VGb/CimG4VSDLDPox2yuEKlUgX8qLYgmraaoNCgP
GQapneIClQQyZEwLyvnjfcMTW+iXQI534+OCgYetAWAHw8XhIP23MJc+uhxxdItf
Taex/k58CXh6h1/xrKElEZfHLBGckOpyFj0CNam75SPYH1JAt9COXdojvDPpMv24
dZ9Dvj1XS4dh3u2WyHB8frcT4QlAuxkCBw9r3R/SzA5aEhjkwbGcvr4rER7lmsXg
oTWx5OGyYq7A6Gx8lof6YN4tiRwUQUA5onfvsBVbAT8ezuYUqZy+gp+xYhffIkO1
Mm+3BfwYytp6Q11ltSb+WkGhaXSX8UNRjdx/2VeEpx1R8oJtqw5806Pl4MmVBG3y
x5134qX4yMW5ZwZvbf3Gf26+xWrbBDbbMG9dvciZ/sRylsy5y3SLJKkTC3i1Bsr1
iyYWc5gdcZWd8/BS6WxVfgUiF9CJPGXtV4B3/NisvbNTjwd7WBN6sefJsPjjyaGR
4nTOymgbshvElmCUkNvlCLc+zIh9Z8BV/Chz3hw72s8PHLYI0jM++TySSKBacIge
EBeYenbdYEg+ckU+cGuM60h8WbVWBRIUCkZNAjYJ0WxzIVIn2GvE0nKnTH7bNs7T
Pctc4u4b3fk6/U0T/w7OUrYWcTOgl8Vf9oIYF7U6m5u2eKsb6/1aMIIHcjCCBVqg
AwIBAgIPRXOLMhlC+HUxekgG6wqVMA0GCSqGSIb3DQEBCwUAMFMxCzAJBgNVBAYT
AkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxLTArBgNVBAMTJFN3aXNzU2lnbiBS
U0EgU01JTUUgUm9vdCBDQSAyMDIxIC0gMTAeFw0yMTA4MDMxOTE2MjhaFw0zNjA3
MzAxOTE2MjhaMFwxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcx
NjA0BgNVBAMTLVN3aXNzU2lnbiBSU0EgU01JTUUgTkNQIGV4dGVuZGVkIElDQSAy
MDIxIC0gMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK1mlxAxJhlg
BGAMtBG6/Pgsc+zJkd8OTSALhaNK2f0/+ieNt0TnI7gkyJ0phAg6V8l3E+j0Faku
40/nj/lejhgsHyF8gvhhgV+P9JZu75PSlvUT4mPSIe8RlQzMrjun92kx7IXbhySl
gsQOM/SD/lbxKLnElbMEyeQfn09VHrRP4GwSuwzRIWxZleo/hb7Kd+cPIf8FNNPX
qXfd5MX4lT90WJ3UdTQFYdK01JBW3tVP4Ath9jtRldmqutgz5+4/7/u/usb3DcM7
BBxxM295hRybgfVACJKsYjLkJk0JAqMf0A5FBdIt/0k3rU+AxfQDATjFCqYDAzn0
2LzAGcJbcox9Odl0+aOwQhFPHp8Ry6I85nXQWHjX8ii0jTesFXTkTb5eRQuoTkpI
0BYE76Sct1O2GH1HkAIdg4soI4bjap7M3nyJRNmDit46hV71NbECqO14j33/DkUv
s/r6u9EF6qJh1DYcWW+Xyom+Yd4HPIqaKjztIltqHCEc7FvGmlkQqUvpzn2iYuCy
dPLbHatMqIu3F/MPEVljeIlz47zkwy0DCc+CIUdtrDajQDH8HoQAdewJmWKWUQgT
QGRKZRkc0eh3MKaoMvk/hTkcvjHd1sMnaM+aa3Gp7YoY6IFcItC3ORUqy8YGHe7H
eRS4+uIjmy+iU6T26YivkV24j8GiROMhAgMBAAGjggI4MIICNDAOBgNVHQ8BAf8E
BAMCAQYwNQYDVR0lBC4wLAYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3CgME
BgorBgEEAYI3FAICMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFCtmGmME
GQOnGfw158O40TaPTppBMB8GA1UdIwQYMBaAFAkMvyqiHQQkDLL5QApBws9acqqA
MIH/BgNVHR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC8w
OTBDQkYyQUEyMUQwNDI0MENCMkY5NDAwQTQxQzJDRjVBNzJBQTgwMIGooIGloIGi
hoGfbGRhcDovL2RpcmVjdG9yeS5zd2lzc3NpZ24ubmV0L0NOPTA5MENCRjJBQTIx
RDA0MjQwQ0IyRjk0MDBBNDFDMkNGNUE3MkFBODAlMkNPPVN3aXNzU2lnbiUyQ0M9
Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNS
TERpc3RyaWJ1dGlvblBvaW50MB8GA1UdIAQYMBYwCgYIYIV0AVkCAQ0wCAYGBACP
egEBMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZYaHR0cDovL3N3aXNzc2ln
bi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93bmxvYWQvMDkwQ0JGMkFBMjFEMDQy
NDBDQjJGOTQwMEE0MUMyQ0Y1QTcyQUE4MDANBgkqhkiG9w0BAQsFAAOCAgEAvFxg
4AvqZothV0hW7gudd8Vcu7lstjDrIKinahkT30x0mL1n00ASbhR7wbFVvpCZy9oj
Aj3VKdf9Nu++c4dYVrgspkWANg8lj8rZAUtxdl628dISURAXc1xKrvnKqSWvdmfT
IiAkWKi5I8RF14ktxHuHZk8+I8ndFU27iqKRvvehqiXpb1uIaZ/gY+laTfRJ48KO
/0iV+E2AJAd6UudNVXLOCMhHXhbZm3mDkxjzKX3qHTU68/TSt8TTCZSl+Ql/jXF9
T/4dZMm15ev20a4Xliki4J9PbxTZvpiVdPzcl5YYm+5lz6l/TevFjFAiUflYSRk8
zqhrVvRyTQDNj3x3SYbN2YAD1r5I7X3hu+Fxf+O9lCjABECS3ZI1b29vzWYm83vk
LY9xyqjMvIEtANwk+keHTW2qP76bShVz2eu7CJeHymMm0xnfZSIp46vXpmJuumth
/XKebCCxru+Unc2dn6tsPZ8/+WmC8DkGE9snIO30PVMKIAyPKFMOldt1NC2zTN1e
n39aMqzjc7ehKNsxc1raZku4audhwNbUnUL5CSDIsvZk0RGaLuYuji0nzVD8jXlx
bDOBBdi75pB8Sw9LNia88W2wX3SNQSZ6xE1WvNAhJ6eLpozm5zh1rPFw4hONonwm
kHTW/3EV53wUltrlizW88HtH2LzbGp+UpyHNcp8wgggxMIIGGaADAgECAhQ7ygH1
S1i8jswQyw10eh4adoCSkDANBgkqhkiG9w0BAQsFADBcMQswCQYDVQQGEwJDSDEV
MBMGA1UEChMMU3dpc3NTaWduIEFHMTYwNAYDVQQDEy1Td2lzc1NpZ24gUlNBIFNN
SU1FIE5DUCBleHRlbmRlZCBJQ0EgMjAyMSAtIDEwHhcNMjMwMTMwMjExNDI4WhcN
MjQwMTMwMjExNDI4WjBmMQswCQYDVQQGEwJERTEdMBsGA1UECgwUQmVuZGVyIEdt
YkggJiBDby4gS0cxIjAgBgkqhkiG9w0BCQEWE3RvcnN0ZW4ubWF5QGViZWUuZGUx
FDASBgNVBAMTC1RvcnN0ZW4gTWF5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAwzcccZS+b8xjsxL7/Npam39R2G7KbtuvsCR33JToKaYTzbGalHZB2ig6
4/crCPht/9xxjlfEtbIDGD6x2EBMdkMOcQbp+WzHF6EJSDWCmpxxyfxSocsZt2Js
8ePP+5q5QpUt6cbNJzH9JYubfVyLlJHElocOBq/K2zoyUPJj6Qr7tr1VE9eAOcuz
gipVpLoKOKqYtvDLNOzb4U7bYZYS3PprVlw/ZTP2RUODXYH3ZEwY3Aa1sF/BKSVB
cUYTmkRpu/ROwyAzdd5QTc06xrAqMr+LHSYfmjiluOtguNdOWJ0QKTPfVmylDX4o
qu5CunPdXH6G2ifzA0zmf3+W0Kj5xWKMicUZ2LVcs8oaedLsMxkqx5/r6KtRkyP0
3AOVFhippXk9kUb5SSpMLwPD5UFSg12PWp93EvKNoF1T9jUrfBc/Y58Ju08g6nwZ
3ZNefKBuLYd2i0TUwcdXVarFi0aKcf2HwkXjzBnlQShXMDxEXIXWHqhud5VYEN5F
G+QrjxixL9RauEWXE8rfqo9GRpbryCOul6ePrPNAIq28WgrNEiUI1vYIURWPL0Ik
wQkqBsGFwXcyGqCy60X9titu2l+Fjwz0YkJG/3boue12kKQ+9sTpslRpe+cdhbQ6
vwD2ajLUJ2QCNNe7wOHrdjx1IpW7j2yJOBo+SL3/oRQlBCGHcYECAwEAAaOCAt8w
ggLbMB4GA1UdEQQXMBWBE3RvcnN0ZW4ubWF5QGViZWUuZGUwDgYDVR0PAQH/BAQD
AgP4MDUGA1UdJQQuMCwGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoDBAYK
KwYBBAGCNxQCAjAdBgNVHQ4EFgQU7mDOC0rcd89FNshsXDMd9TiEa0swHwYDVR0j
BBgwFoAUK2YaYwQZA6cZ/DXnw7jRNo9OmkEwgf8GA1UdHwSB9zCB9DBHoEWgQ4ZB
aHR0cDovL2NybC5zd2lzc3NpZ24ubmV0LzJCNjYxQTYzMDQxOTAzQTcxOUZDMzVF
N0MzQjhEMTM2OEY0RTlBNDEwgaiggaWggaKGgZ9sZGFwOi8vZGlyZWN0b3J5LnN3
aXNzc2lnbi5uZXQvQ049MkI2NjFBNjMwNDE5MDNBNzE5RkMzNUU3QzNCOEQxMzY4
RjRFOUE0MSUyQ089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0ZVJldm9jYXRp
b25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwZwYD
VR0gBGAwXjBSBghghXQBWQIBDTBGMEQGCCsGAQUFBwIBFjhodHRwczovL3JlcG9z
aXRvcnkuc3dpc3NzaWduLmNvbS9Td2lzc1NpZ25fQ1BTX1NNSU1FLnBkZjAIBgYE
AI96AQEwgcYGCCsGAQUFBwEBBIG5MIG2MGQGCCsGAQUFBzAChlhodHRwOi8vc3dp
c3NzaWduLm5ldC9jZ2ktYmluL2F1dGhvcml0eS9kb3dubG9hZC8yQjY2MUE2MzA0
MTkwM0E3MTlGQzM1RTdDM0I4RDEzNjhGNEU5QTQxME4GCCsGAQUFBzABhkJodHRw
Oi8vb2NzcC5zd2lzc3NpZ24ubmV0LzJCNjYxQTYzMDQxOTAzQTcxOUZDMzVFN0Mz
QjhEMTM2OEY0RTlBNDEwDQYJKoZIhvcNAQELBQADggIBAAB/qC6b8EgR3gde78a9
mRuFyNe5bdDK4B6ZvoICTJaqFkRK6KhBdIghsAI5ej16eXqfL7pJICniCRazuR5d
N+NSH5HqO6CSOR9icUNTiZJc7jAxCCSq1ji/aI1t2xdi5WeJP11VF3ynISzqWD0h
5gYQ13pAkgEGJsg34I/zWyfUwaF8f6EQXjoxUnzBmbyMr/RgEQ5wNfXmQ133w02f
obu/Bq7p0j1cyHTJOlY9p7Nmoy4spxde75oc8CnHc1TcefUcke+8+kkMWsEJ/XAV
kaiLRyYHr/z9J1WtYps0POfDHAKIlZ5LcytGjD/Bga4C5H3yPn70lhkL+QJTIZNZ
fhbRyepT/PGq7IcXd5noUgHCjDzMDxwm0bhrSxosNzf6DtcuPaTox1uekqsuxYuD
OEK7ZvT9F5lZ/eK7QGuUMTm2XbP+lhKvdDuClQbjbvLenyrfhIbr/80szeLWOoJB
w+eNFsT5Xq1tV80gJ9L7vz/uroPs0LvcXmlsPgHpwEHS1Azxwn0USGdBLWhiOjQ/
CY8nVJU1MDkfNVhDKwKXLKc+jMvlz6I8qrQV37rdRPTUEI/KoCeR6acYaHG+wsun
N/JPiuKsrzRIZZ/vgTqqN1zjfHxTrCNtgeC6yur3TDtdsHYRXMzSsPeqwo2iXzWK
dHB35EOIEos5ClGUV9U+Mi1/MYIDhDCCA4ACAQEwdDBcMQswCQYDVQQGEwJDSDEV
MBMGA1UEChMMU3dpc3NTaWduIEFHMTYwNAYDVQQDEy1Td2lzc1NpZ24gUlNBIFNN
SU1FIE5DUCBleHRlbmRlZCBJQ0EgMjAyMSAtIDECFDvKAfVLWLyOzBDLDXR6Hhp2
gJKQMAsGCWCGSAFlAwQCAaCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yMzA2MTkxMjQ3MDFaMC8GCSqGSIb3DQEJBDEiBCDbvDmC
ILaCDbruAOL8xjtZBwtU1kCq+AOSyceOrACGzzB5BgkqhkiG9w0BCQ8xbDBqMAsG
CWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMH
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG
9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAgA/C0SFUcq5zb26vWyAn8GY8p3u7AxB
sjyNz4Xw2ZOL4nluUWrrdGGnFKn8El8CJGNivKKVOhgtuy71tDq8XtAy/7onlxCe
Sy7b7giAAB08nzEoAmD5LvXd93rauA/gM9h4mL12mPCq6CyWWf62sMRIotkMMWfL
5MIxlpQHT7m6gyEoKx3Vy/hOzI1XA94EDtSvi9bY9Pt20Ara51MjepzkTFAQot9H
k2/XQn9Hyt9+iaaMKFXECvnOqIMR5qKfuk6rnIxh/AKMV0fWcseAE425yJudWedV
cgts8QrBllsao6HK1fChartfqQgNFU9R7o7z5mCXM3eiAHuuIdA586NguLdZ3Wfn
kA5MaGxrh7hgSgiFET9vxs2bZO2ieehrAnHPEMVg/r66HCCW4Tvtd8ICVbTCV/Tw
uPy7Xb1ia5UVZN7LPoOx1EJmq78wRP0PGheQebGQlQTm4pyzGUpKuJTewcIjiW7a
zx8kTBsB8H5tq5enwHMi05i73u8jZqvN4PYh1Dv7sQL/2rJUqvdzeTovJCF0VYH6
4BoNBuVFJGYU2N8gTw8iFm8soFXyli1kQzFCSIRu8UNVjqou+cGgMibjxkVJCEPD
veMp93i4i5FjE8BOg/ZojWTokQaW76QEJ+btde0C8nnk2UFYUrFtMglUL9wqLYAf
N0PILyx6VwJJOQ==

------6C0BF6B467FE8AE3A074560E50B0CDB3--


--===============6307246366277785338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6307246366277785338==--

