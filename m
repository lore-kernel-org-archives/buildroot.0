Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013FCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:59:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C806103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20C806103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9F980A89;
	Mon, 25 Oct 2021 13:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2adQHvs6zV1; Mon, 25 Oct 2021 13:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A7280AB3;
	Mon, 25 Oct 2021 13:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7BFF1BF20D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6629401F0
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="UDskw9OK";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="V/lCnH6t"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoii5LkchDFg for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 13:59:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AA1940159
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:59:25 +0000 (UTC)
Received: from pps.filterd (m0083135.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 19PDtvFw048513; Mon, 25 Oct 2021 13:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=D7ZQ0g4wboMPEtHSSnUMXIeWMZogq0mjH5rQK2a+8xU=;
 b=UDskw9OKbhZQYxyWEqtBvBlSHO6Sjeqx7ByRPnDMxOxKj5J6EWtTc8pyC+spNhBxyDl+
 4M6TSqcmFUWgWJfbehuJAqVLpZVqO9TF1TMQqM6NuuEtCaWlWm0slLRNGm2Je4J3fRjg
 2M/00OdD3IOWytC/QJDDi6hBKy7hlWfZSCXMbA9eczLZ6lVoDKq8187SV9yR7yJJKCMq
 UjBv3sa4z/Asqwl2xNjFxKPBis0ZdtYOacMXPEX0bLo0LJ7Hb3yueQWFRRCMkaNkpTPP
 OfgZUWAo0QxFC2JaBokRfRL9NBVqTsXdgUsTK5qV7SSDuUmkZ/tsTrWyuX86S2XZLsMX BA== 
Received: from xmnpv38.utc.com ([167.17.255.18])
 by mx0a-00105401.pphosted.com with ESMTP id 3bv8m8n2ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 13:59:23 +0000
Received: from qusmna5k.utcapp.com (qusmna5k.utcapp.com [10.161.160.133])
 by xmnpv38.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 19PDxLrP082185
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 25 Oct 2021 13:59:21 GMT
Received: from UUSALE0A.utcmail.com (UUSALE0A.utcmail.com [10.220.35.20])
 by qusmna5k.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 19PDxL4j012964
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 13:59:21 GMT
Received: from uusale29.utcmail.com (10.220.63.19) by UUSALE0A.utcmail.com
 (10.220.35.20) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 25 Oct
 2021 09:59:21 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by uusale29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 25 Oct
 2021 09:59:20 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Mon, 25 Oct 2021 09:59:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=wDFMLxJi5mU9Ct0pBhBgbIRrAARlwG3UEDMmmkwufLD0+SlkxeVCHAoM77AuNDQs3WJDW7hHGOoq2t2MevMX3wCq7JBXtUsmh5R+Ms5SkQpyPvJNyYzaD8lslxjmjc7uHjBlLtI/QEw7aHKTLcVa1EaLFkiaE7K1iXFMyyJpsl6Gtv68yUDH5cnnqhnvFTBX4bjGMmVH0tQ6nPglHY+0fZGAD4JrxXPb8e5Qyl/m6yNVmT1Qxa+su6KVIw7jfJtI99YnSsaLEZBfCyeT3Nu9aE+MfKK2B3p4f60WXgfzhno4nMNB/lhM8SYE5dvKd8S8p1mEE4sJItpdhiqac22gsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=D7ZQ0g4wboMPEtHSSnUMXIeWMZogq0mjH5rQK2a+8xU=;
 b=oardpF/rMjNbbj4QiJjpyvGHwodQ+eKcOFSXXN/k7I1sTuUYSr3bkzv8YKww4cenfUk0iHVVFAjwMq5PUJ6MI4QrlnBxfL4dEbBxa7yFKANnKjN8S3ZYiQ5vNWvDIGdkpm/MdQxQ7mMDNDcxNRv4G5v2FLXNiddF/V7CqPik3E4QG+MhQ8JJj/zfue5Pb9Rktei5lzYJWQQrfjioRazRf9i+O0cHLKvQGHWB5kKjtbgmunObvV5Meg6lsr/XvYPZO5Wk6o50pxPUR4w91iAfUUtSELERoBdeCLOSB0ydbCYfJppsdYU/OOSR8eq598fY2aclJrwIGKQBR37P0Qb6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7ZQ0g4wboMPEtHSSnUMXIeWMZogq0mjH5rQK2a+8xU=;
 b=V/lCnH6tBx1gmV6C7QUVdyvKDCH6C0LlLjVsZFb9wv9skIWPq0kM3WysvCwIhwue335j8hWDCTiFgBQVC2ZBMhuIRK2lZ0msNB08Eh7SyyulY6t5DXGnxi+K2CMY04nGCjj8NJN8YZlZgki82nOW94zoL4LYYAs/KzIgo7F4lTY=
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41b::12)
 by SN5P110MB0930.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:42a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 13:59:19 +0000
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065]) by SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065%9]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 13:59:19 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH] package/asterisk: security
 bump to version 16.21.1
Thread-Index: AQHXyOG2pX9iIswsOUeBrPK4w+82y6viQJe3gAADJx2AAGG9gIAAqmcAgABsmZs=
Date: Mon, 25 Oct 2021 13:59:19 +0000
Message-ID: <SN5P110MB04803C34244B063AAE82D02BF2839@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211021064029.31168-1-peter@korsgaard.com>
 <20211024161541.3258ff38@windsurf> <87zgqyxxwi.fsf@dell.be.48ers.dk>
 <87v91mxxdt.fsf@dell.be.48ers.dk>
 <CAPi7W834b_zZD6EQzTJ1TyjrqD3wuUXYfhiPuopN8-Y+r7dNvQ@mail.gmail.com>
 <20211025092044.461d893b@windsurf>
In-Reply-To: <20211025092044.461d893b@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c42be250-e319-ad6d-b211-1c5f9aca6225
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79c2068a-d733-4212-8fac-08d997bfa431
x-ms-traffictypediagnostic: SN5P110MB0930:
x-microsoft-antispam-prvs: <SN5P110MB09307278A3A43B98D6742C04F2839@SN5P110MB0930.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: //sN24kYp+5jhXGBIUvvoCB/Y5TUwIQ85EFVDADYtFvGpJo7efJqUEOpTxBDwMblbDCMg/ZenR/NCM/jI9xBmfqPpqkYCEkJ8IvxGXnh+9II6HWxv9iKiNW49F9xHNsMhWOiTgGqewPFcx98+a8hFqYMum7eNuUa3vHq8nXzQ0AUQFf2T7h8DN1KERBxExbnyB5AqaAqllxHocHUzg6B27p8YlqXOFSme7nlBIYhRfQw+PmJHphUHzbhGUUCv42CxX4TfLl26EBKnDrUEnBt5kaahCGR7d5bbcKHxOaAcPgTJGbitDV+Mdy/W0yL4Xpla5Ee4YeWxg0K9UGh3hsrd1hPitfhGQBROaJI48yIWngqVJy8d7QpPvtfpniBEfxRTO1i+b9pihdkVi56RmmecJ476tiF0UPIG108SHslhNcvGhjlnxGojXMbNaKxftTll/bMyTJ0h1ndCpAMExCHiyO2WMmTpDSeDAyKtBVVuXkC8P1IMHfMdMB2Hl0KKh0BB1651+ZIzloVKENtEVS57uGlEygTaJqYYCRfz4zDKY+R0H1DIL7Sy2jHkBZyj+ZjQFzIbijiiwuJtHV7VvGrGQ1G+L/JXX+kTIUvj3IpnPGjJxnf71HfkCrL2+CiIjGRt9qNCtQQazcA6ipRO9Iu3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(15650500001)(8936002)(55016002)(2906002)(76116006)(26005)(5660300002)(8676002)(86362001)(110136005)(54906003)(186003)(7696005)(52536014)(66446008)(66476007)(316002)(38100700002)(33656002)(508600001)(53546011)(66946007)(38070700005)(71200400001)(9686003)(122000001)(83380400001)(64756008)(6506007)(4326008)(66556008)(82960400001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: iCqiNxxkP0FdWV8whgCTbYxzD7X1meUWdgzLJseVWTRPZRnAB1RAXHLqnWyVCkjOZKT4UyiY2GFBFuWtM6Dmlc86bBAtX3na+c56A2e2L3ajmkDUSEA/VV+0AWZh91dgoJWhyOy4ikLBuJdOw7vBQ5p6ujWpYYJIZFAeEt+pOQ/ZRMfzkaitf1vMjs9ORGwYBOllLE2hD2Mf4ae4cgQVbz2+3UP3YsnkOYUpgmmTwGiL/Nam0F7Fd8KQzFeuxZYKhHKCRGO1uIGS2aXu4gu99PPUTzP5zwqsICA8rfLuP7A4B6cdIesg2EikYMmEKFI0ssakASVkpFBvKSls1V/gX55BN0pdsKuTb+AD/15fkkg4ByFOYlT7enTVwUIsY6fjjEpEQjgmA+DxoBCqFjtsiKmIChoXbg7pyVXtVe2SE8N60LvK75OXlVQEadamu2v3ErfnJqUDQkxrRf1IrV0S/0LMJLd5onwc29k8qpg0YnbdRPubqslfgyGYj8NKOafwPtPLKhgQxfsTFJS/BF9J/WCiWQuCvX+qKwoc2sjCQ0aueTmosjAYCKLChrytk2Jla65T9Gc/rVKxgmuaGnEQ6i8f1duwRHUQOVg5LqXmd33C1ar+Mj+u7g4RT04PzCryE1ZOTczz8ov56LoM2gUmQ0/hwDagp2ei9+9OSfrCYD9JmxW8LqGU7bdyiD5/39ErzX4DdG1ok0DVWFTHgKYtow==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c2068a-d733-4212-8fac-08d997bfa431
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 13:59:19.7145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0930
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: 1BCUM8yassyVyQmJIDgXXMPALe7_VvtB
X-Proofpoint-ORIG-GUID: 1BCUM8yassyVyQmJIDgXXMPALe7_VvtB
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250086
Subject: Re: [Buildroot] [External] Re: [PATCH] package/asterisk: security
 bump to version 16.21.1
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
From: "Weber, Matthew L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> From: buildroot <buildroot-bounces@buildroot.org> on behalf of Thomas Pet=
azzoni <thomas.petazzoni@bootlin.com>
> Sent: Monday, October 25, 2021 2:20 AM
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Weber, Matthew L Collins <Matthew.Weber@collins.com>; Yann E. MORIN <=
yann.morin.1998@free.fr>; Buildroot Mailing List <buildroot@buildroot.org>
> Subject: [External] Re: [Buildroot] [PATCH] package/asterisk: security bu=
mp to version 16.21.1 =

> =A0
> On Sun, 24 Oct 2021 23:10:51 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> =

> > No specific reason, I missed that the digium entry was more up to date.
> =

> Ideally, we should notify the NVD people that they seem to have two
> different CPE identifiers for the same software product.
> =


I've sent an email, and CC'd you guys.  From what I can tell, the business =
CPE had been used for a long time, and recently they split it out into a fe=
w different CPE.  Honestly, not deprecating the old one and going cleanly t=
o the new one seems like an opportunity for CVE not to get assigned correct=
ly.  I do think we should use the open-source CPE and see if that covers ou=
r Asterisk version.  Then we could compare the CVE between the old/new for =
that version and the more recent.  That comparison could lead to sending in=
 CVE updates for any CVE->"both CPEs" mapping updates.

-Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
