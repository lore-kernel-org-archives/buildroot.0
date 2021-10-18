Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2B8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:14:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312AD61351
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 312AD61351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C536F82B1A;
	Mon, 18 Oct 2021 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8aM71ZJcS0w; Mon, 18 Oct 2021 18:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1857882512;
	Mon, 18 Oct 2021 18:14:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174F21BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04EA740459
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="giyNh/NS";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="qqSbwu7f"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZamkZorg5ltc for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 18:14:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0D33402A2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 18:14:01 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 19II8STC030587; Mon, 18 Oct 2021 18:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=W081myv6vmF2Bck7YEjKYaQqGliYIEUo3dw54df/bKs=;
 b=giyNh/NSx4NtPbNjhU7HI7DzKjG27wjVSxLIab+PtrVsnwZfWMpESj/YNhcNoXsLHcL9
 ag0yHyn6xGM5HeyMVuQkvrA2iTXBg5plbenqtaTKdrDQ3Emj8uwY07rt2TELk+XJRosS
 VMvB4mwR5NlP2Q2iDqORCmhzx+IGpn1m0X3U/9vBOgUH/0ki8FpTdSubSJRpaLCnzvLq
 lNcXXxtTy/CIHpALZz+4LIPSoCc6UFk2vo5iVGragC4TbOc7fnW1jnHijJjCJ6lb6E6/
 s4AYgsT9f0xErKuBX3NGRUt/63AUMswlHizxYR5htHfOrRS28Aa+6ddPhfgH6oapI8Ry 8Q== 
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0a-00105401.pphosted.com with ESMTP id 3bqn5wh14v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 18:13:51 +0000
Received: from qusmna5m.utcapp.com (qusmna5m.utcapp.com [10.161.160.135])
 by xnwpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 19IIDo1C191942
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 Oct 2021 18:13:51 GMT
Received: from UUSALE02.utcmail.com (UUSALE02.utcmail.com [10.220.35.12])
 by qusmna5m.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 19IIDoTc020393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 18:13:50 GMT
Received: from uusale2b.utcmail.com (10.220.63.21) by UUSALE02.utcmail.com
 (10.220.35.12) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 18 Oct
 2021 14:13:50 -0400
Received: from uusale29.utcmail.com (10.220.63.19) by uusale2b.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 18 Oct
 2021 14:13:50 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.184)
 by uusale29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Mon, 18 Oct 2021 14:13:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ElQ5q+0nRSwSgxlpLTOb/upw+dDI2DLygZ/VYha/eo053EY+ki4PfNIXdbDvbSsF4I6KN5suCKjG6Wft+g9lX/TkRL5ZX3oUjXCm0uBoQZyJleR0LN+fqXNmrweJVZI4nz65FFU3EN5dAVAyIkrLg4nufwZ/1c4cZsqX5ysCP4nQf4O0M+N6eqchaaqET31gNF/EjSbt9joYvOkGl5TqCkov/BC0DzYfAzu8BFFM9hSLtzcBZJMfJwLHyccf3L10LE7vVMSKFaVO5NsVoaGWOviXOaaPZ33E9u5IwMOsGkA6D3uI17tVHgas/qoXq+ExOQBOQa07ErFK727lvtqN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=W081myv6vmF2Bck7YEjKYaQqGliYIEUo3dw54df/bKs=;
 b=Im4zQXxPMLc72tZPlMzRUOLJeH+vjF/xKb9pe/ZBxJiDmx5NJE8AjbR1EnDu7xPRK+F+GXJNcDOnAZz7VQHuTJuDydd7NWSzyHNAJdYe+UBmkA5hXQ49NRXGHXqtUlw+vOuw4Wg4EX9ncQsKj2KyLXcTLrU8LP24lTFQ3WmcSWlakM2LVhInHCaNwIl6q12AkdD1nIOB/tyD6AYKwb7t9NmSwh8psuZueint/K2Hli2HwbWq2VoerEJV926oCqAaUjMr43IM4m7rShMjv4zZ8wvnRPyVVUzfPavZDwoq1y2rvRa6SFLFUIBBtUUY1e86mac9SQdLBUgCE5WDvUljyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W081myv6vmF2Bck7YEjKYaQqGliYIEUo3dw54df/bKs=;
 b=qqSbwu7fPHokChZbqT3NSE0Wf1Ghizy5yz9aNYq/SzJIeg+5gjcC+x82eXMFfBBjL0mO6i4U0nDOGTDvCQAXY8zgLy+vMg0UtWSAmki2jjpG196piamU0CZHTm7RoleAAYgNC2W/RXHN61aoQFjQFqvoYuJ3ae7Q8Xp/QG6iDxw=
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41b::12)
 by SN5P110MB0829.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 18:13:49 +0000
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065]) by SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065%9]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 18:13:49 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [External] Re: [Buildroot] [PATCH] package/lightning: stop spam!
Thread-Index: AQHXwmQ4euozmZLJo0iWOIc/sGXIKavYu34BgAAq1wCAACutSw==
Date: Mon, 18 Oct 2021 18:13:49 +0000
Message-ID: <SN5P110MB04800DD4BFB9A94B4D96E504F2BC9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211015215003.181073-1-paul@crapouillou.net>
 <20211016080238.GD4165837@scaer>
 <SN5P110MB048022947C6AD67D5341B4A6F2BC9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
 <20211018153354.GS2400@scaer>
In-Reply-To: <20211018153354.GS2400@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c68ea266-5c3e-a90c-4fad-e663d2f20afc
authentication-results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af4f48b1-4f30-48af-ca6f-08d99263087f
x-ms-traffictypediagnostic: SN5P110MB0829:
x-microsoft-antispam-prvs: <SN5P110MB082904C87B817A26C0A73945F2BC9@SN5P110MB0829.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PNmoIAw/0uzxj1mDy/WrAxYGowYdGhjZsOIY8Eu5W9ttL3vJD42nEnHnylfTyYRij0kSq9bQDAjxKn8OTcPEwMUycHNEiltsAgMUCrdRNZpDK084wMgyZJhdqhpjM0NldjUGnUabHz75E4D7cl1KSgwYT7HO6RzItItCUo0rBdoKZiPMmZI4jqX0vW1Lz/QIEW7iTawOWI1hqk8RKVNyg18CQ9OjvKDSvpHO+f7iLP65FNsH1VtgccyGv/P+u06dRw2eK5FBNUj2jrty/dsJEHBqibLZm/RJBrS4OL0xwRfR5U0nvPQDjJpmiICBjNLg0DHjkcoa9wXzoC4THnbBnC2+UKtn6zgJW9aYgIhTibODrRxdo9Ty1N2Bxg1V9g4a3g/NhWL2Agu6eeo7SCjfE2ikdfQldmGnwpHbNGC11/kaOVv7MLW4608I4bb2aBlHBWw4Dfr5Q+FyMTWP4GhZSE0TpvNpTRTa7RLiIbWEuq+wlldeeRFnqk+umMFalTsHIJLZSy1evECRr3UwudDZeA4hKFG5h5uNutkCk75rZuH0axSkGUAXCzgjYKUjcT+hQnIMwkCK5KU7jH0hq5cYfExgbsVujSrd5oid5fY0TvYh2IIO/RdVjoPca3oYrq6iCK7dn/S7b7FsCvRJxyXBfzHmB5aGo/j+OXM7Ms1YM4y+a7uMNLrLT1pyb/KIyCz1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(71200400001)(5660300002)(33656002)(66446008)(38100700002)(2906002)(186003)(66946007)(6506007)(38070700005)(53546011)(55016002)(66556008)(4001150100001)(66476007)(64756008)(76116006)(9686003)(52536014)(82960400001)(6916009)(122000001)(26005)(7696005)(83380400001)(508600001)(86362001)(8936002)(54906003)(316002)(4326008)(26753003)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: tNpPnpUA4ffe9GjXr7wNEEbIWMhl1d/y0QoSjecolrGHU3O+LQECMWBVfKH4sddTtI7FhZyg6rPQ1ivT+Q0YPMlIyCDdx4NcaXAIVeZ4Qtyi9gVKaFkvLoNoyOtqc3oyPB3aySDPNr8QLGgYfxat1v4uj7LoMSktQ6KMiWJPhK49kDNNI1jnMyZu0dqus3ISnoYGHZCVQoot0o/oIdObJjDicwrckSbSveE4KWsLhrIxe7/u8lh/x04YLQa9iy7j3kMnSoIqqMzl+65Xi5vtLqfUU1lYpGab4piy5CiFe36cDGPAQ2vMIEDjwS59I628ctPYp4gkZ4/dsGaqI1BfsaAuPYqUP4ldvWAlHrbeNMD5MJSLjcjDVsAZ/oH0y4zFXmImiebIDEQA1DUC4H5aX7con+WiDMONkOF0R6uEY2OICGHYlDbakBpzUHxfi6qP5rCRLCUp7pd8OIg9Pujuuh27DMjNFyCpESjP7hdx+AZ9zITB0h9cKvWSaodZeY3FIb6iiEsNNPpxXltLm99dGfuWHN4ClF0XKJX4/RS5CfOVtxJOwQAJ/OkKfpK+5YuzGhYLOLCuomRSkok99gFkIp0YFlUWGWPMhDVWpLx61HS1FSigpkASLtOKUbEJNMPtZg56gMBquAnJjPx1nlCyoePfgrmNA8vBThje2ji9XzANwpJ4QzQT7qs+ZM0PmdKX6yQyf+188YeoR+yFJL+PyA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af4f48b1-4f30-48af-ca6f-08d99263087f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 18:13:49.0416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0829
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: xE3nXQvbxVfid--UN4Xve3EDRLYBhj8x
X-Proofpoint-GUID: xE3nXQvbxVfid--UN4Xve3EDRLYBhj8x
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110180102
Subject: Re: [Buildroot] [External] Re: [PATCH] package/lightning: stop spam!
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Monday, October 18, 2021 10:33 AM
> To: Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Cc: Paul Cercueil <paul@crapouillou.net>; buildroot@buildroot.org <buildr=
oot@buildroot.org>
> Subject: Re: [External] Re: [Buildroot] [PATCH] package/lightning: stop s=
pam!
> =A0
> Matthew, All,
>
> On 2021-10-18 13:21 +0000, Weber, Matthew L=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Collins spake thusly:

[snip]

>
> > So in this case, I think we need to submit an entry for the GNU
> > lightning package (cpe:2.3:a:gnu:lightning:2.1.3:*:*:*:*:*:*:*) as
> > there isn't a CPE. [...] I've emailed the XML [1] to NIST to make
> > this update.
>
> So if I follow correctly, GNU lightning did not exist in the NIST CPE.
> I tried to look for it yesterday, and it turned up mothing.
>
> But now, in addition to the one version you submitted (as per your XML,
> below), there are a bunch of results, from version 1.0 up to and
> including 2.1.3:

Correct, they add all entries so that the package now can be tagged with CV=
E when they come up. They needed the latest example xml and then create the=
 rest.

> > Once that's added, then this .mk can set "LIGHTNING_CPE_ID_VENDOR =3D
> > gnu" so the CVE filter is clear for this package (right now it is
> > free txt based and that's why you've picked up the server CVE).
>
> Patch pending to be sent; pkg-stats still reports "CPE version unknown
> in CPE database", although the website does include 2.1.3...

The CPE isn't yet set as valid in Buildroot so it can't find it. (guessing =
that script has some delay as well for updates?)

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
