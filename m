Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC74CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEEB60FED
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECEEB60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B848C400BF;
	Tue, 28 Sep 2021 11:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4wvutsnfCSm; Tue, 28 Sep 2021 11:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7254012A;
	Tue, 28 Sep 2021 11:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4902E1BF83A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 380FD60AED
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="lT8fvqqj";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="u61hjuPJ"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCprQTdmnMYr for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F28460AE5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:21:22 +0000 (UTC)
Received: from pps.filterd (m0075556.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18SBBFvK039858; Tue, 28 Sep 2021 11:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=nSziyUoxTsbcC4Vy8SRdEhs8ilo5sY06vMWG/7IXyUk=;
 b=lT8fvqqjCjTf7e4Lph97KJZgepvDNWutz/bcWd+tjY0pc+tZqzaV05zBny/AAGJ4h/rQ
 KLoxWHqP5IZsYbP83kNPZwBkehsvMu936Sl2QsBeCASDvpL8j5LrZy5A69TZGSp7D40z
 H1+8KksirSrMQrFsFqwOzpDGInDub00jPaLDFVpjCo24scrH/6q0DCWRZ+uaDqVM6iii
 1OHQdHPasF4iNggm/GoKd5EHOYeHXuGnOgbkeM/saX2NOwNMmmNIVxRHbJAsLCqR88mp
 7zxUwsaHJ90toS+Jqdae9ZJfLRNvf4eqvJT5TEmW2uOAtb0uxJ9PlhF+2uUUzc4ugfO4 vw== 
Received: from xmnpv39.utc.com ([167.17.255.19])
 by mx0a-00105401.pphosted.com with ESMTP id 3bc10a8c00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 11:21:20 +0000
Received: from qusmna5k.utcapp.com (new-mailhubs.utc.com [10.161.160.133])
 by xmnpv39.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 18SBLJIt149083
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 28 Sep 2021 11:21:19 GMT
Received: from UUSALE03.utcmail.com (UUSALE03.utcmail.com [10.220.35.13])
 by qusmna5k.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 18SBLJRZ023252
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 11:21:19 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE03.utcmail.com
 (10.220.35.13) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 28 Sep
 2021 07:21:18 -0400
Received: from uusale29.utcmail.com (10.220.63.19) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 28 Sep
 2021 07:21:18 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by uusale29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 28 Sep 2021 07:21:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=QVj+XgxR5ZIKdYOOwMx39MNFjkZs/j/27jgF6PVYgDT50zkYjmFuHxepzm1/4G0edXnbUPlwsKixUwEUj8LTPimdYo3jyMQk1tcNlLXXqqfiip5ngpUU3b5vKiiFOtm3IHz14fGdarTf7AEjRdIir9iAmfS1FmMz0DAmsKYC+aQF2evI9R7WRV8NMwnILHvnJsD8JcJYBO2uDrqQ8yjA5jeG6rel8phFe64c+STcdny60xkwGIdQ1crLU0jObAXYcmz6Mz8Oz9/6fFEdzTvddbQNLRs2utWlr9f07h7XsDH/zSpfr2CaiZBsMFkwkbc/fkYquuQw6vARrmX85I0O6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nSziyUoxTsbcC4Vy8SRdEhs8ilo5sY06vMWG/7IXyUk=;
 b=guxlchpTKpGxqIYPcdDmPcDr7UEsFdixwwikfPwlisAQYWB3s6AEvRFLdwcvuIXcLJTUsFcPacHDcQZp55ShTIuRoc/EtEpWvvh9yFkp6pWJO008oGB/c0FdCDhYZWeR9bcxmy9qYv3E2biX3FfUTuKjgDqlutFB/acwym2EGYwKrPo3AXARcdpCJcXdsVsZGyUD9yhT4dOcIqE0wYzZog0cXPpVgKVswKzZDoP5XDa0kfyTasceXSyClvxX4960uBI59Pj9svEg6pJXg3jYeQWJui/ncM7tBhqW98RTem0e9cn0+9DwhrS+Mgu9tjPAHGkz/VTTkpAQ3J4UKyMvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSziyUoxTsbcC4Vy8SRdEhs8ilo5sY06vMWG/7IXyUk=;
 b=u61hjuPJGFvL2SPpkuDbjlQmdWWLSalk3ZKRT5iKRP4tBm9VXaJIKyin7dgRMVhgRculjwfRFj1ILFNYBpwk5rCdAsrMQwJYFGewAuusGQdSWw/Nenof8BCCTzsNuybTM3lU7Bra75jPEnVDatEgUJw3YH4uuT5ZBOpiHadRHJA=
Received: from BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::9)
 by BN3P110MB0497.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Tue, 28 Sep
 2021 11:21:17 +0000
Received: from BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM
 ([fe80::adbd:c91b:132:6be7]) by BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM
 ([fe80::adbd:c91b:132:6be7%12]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 11:21:17 +0000
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [External] [Buildroot] [PATCH 1/1] package/strongswan: add
 option to enable systime-fix
Thread-Index: AQHXs3+Sr0nDssVTQ0Ghh/cPmJzUW6u5ThTB
Date: Tue, 28 Sep 2021 11:21:17 +0000
Message-ID: <BN3P110MB0465E9C70D7AD1FE5CD20619F2A89@BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM>
References: <20210927090909.1248365-1-martin.elshuber@theobroma-systems.com>
In-Reply-To: <20210927090909.1248365-1-martin.elshuber@theobroma-systems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: theobroma-systems.com; dkim=none (message not signed)
 header.d=none; theobroma-systems.com;
 dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28380a5a-ae5d-41a1-29ba-08d9827216ec
x-ms-traffictypediagnostic: BN3P110MB0497:
x-microsoft-antispam-prvs: <BN3P110MB04974A58C4F1C31D9C6C6348F2A89@BN3P110MB0497.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRf8zIhc4sw8bDjds/5wSy9KtXhpZeMIb6RxtHYP4XIsndLjptsr3U5fqR4D2u671EqSKKjiTHl/vrG6MNuNA5imbWykiK1egv8HTtNS0EWj/Y641Wx/Cg7xvPa2+HcDkkjbld4Dj5QcQlb/6tphkquxMpDk6C7OQtexxVna2wYLolTVNWUvLxEeakClH/YIxMoEBadYdKJpr0QybH+A1tvglgDR1sSrycieYA77wI0snEWIWl6YOTV/wZQbXABEeYh7uQRx1KJP/qVFR3a6ovS8J5tdwYtTfs44g7sRyCqzS+rN/kY/gCG/jM1VZ8wO+fuFq1TwcwpFPmDmkOQDZU2wS82gIOaCKiuBz0j1UgB47KaZbyJBynFnm8zJyzga6VtqgsShUazMkEqI1GNJx0sjLF6YD/PG0S2QQX0iNiEprxa0W5oSfMmac1jmxKUQ010bugekwiSF4+PRJFYHQSDP8oAuYliMLXbaoTD9P07b9xMuNcSDjiDQGrrhQISdeP7va11HhbbJUo8hmWySzvTW/dYlcjsmialWyObftZyflIRMLf9IYyN/KobLb+Fdi4PXamN43ZvsN1RBOT8kSqANQqPzxLGnfDGkF640TWw8dQvRlC48xnJf/iQJuw9ckwdsl3S1nTMVvu+SCIzKxSyWNr9JWhqRPXQC+hoKtAvTdJv0VllsMyt5KW4TUFKjdK5/iGwqPqnDxXRegS/7Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(8936002)(66574015)(71200400001)(33656002)(9686003)(38070700005)(8676002)(966005)(55016002)(26005)(2906002)(86362001)(4326008)(5660300002)(52536014)(66476007)(83380400001)(76116006)(316002)(110136005)(122000001)(53546011)(4744005)(508600001)(66556008)(64756008)(66446008)(66946007)(6506007)(186003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: uJ0Da4KlwpRpKQIQY5Wk/aVnmXjb55HzzW1SJnhqPx8fygprHjbkjx55/PsDFynFa/Vof8Tm6sWFH3PznOxLZgDSfNmrBob9rWAQ2wlnu3qtyZiL6eQAqdRZKhY/DuIAbkQ3UvOcGKObl+5TQoOOFqSZCvwvZ1EFg8zy0nEesL/8s0QsETOPiuQOstLZ5WYWIFZvm8AuzkYJN6obiqcZ/9PwUB7/G/gMuA9pPfYoJQNA37lVLzdAUw20yKyaWv6bVnk+pujt/mNZji/z+7ekVY749KUenoMwy4d9jJwbDlCWLblcX3p46X7vRQYuVRArJgK9xYq9Fa+vo9jpEOv7HwGcqZJw6vdpd7FXTcbwXAqlxBR5O+9eMSi2hQJ4tQWs39Gvc/B30nQXYFc33uQMmzydYOGgwu/60irDDVfqWSA7gCMWdcO/p2w1RbZEgNWgWxlo/tLUK2BHq07ucdVVTC6L7UqbqpYwPZ4hUDDaoWmTytBk+k3heBmU+I9F/FtUTHV6NJ2SsOiQ9Kofnezb2g0OQg2X/jFrJr32dymYumlB8TxH0Kwomih7A4RLeYLtSWK4KXNwZIghpU6jIUQJPIqpseiryyaJLcei1mSrJQKFtUVv1RIDv9za09XZsXgvG7+SGs1345aK+Cv5+88EVOcTu/NjODxV/cwy/CRspw6XrHDtGoTwPHCqdfc7IbArqUuooK1mTDnwC/KEfSeBpQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3P110MB0465.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28380a5a-ae5d-41a1-29ba-08d9827216ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 11:21:17.1284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0497
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: lwpmRI2NUCqfA2sdrxUzzk_VLfKOEmY8
X-Proofpoint-ORIG-GUID: lwpmRI2NUCqfA2sdrxUzzk_VLfKOEmY8
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280064
Subject: Re: [Buildroot] [External] [PATCH 1/1] package/strongswan: add
 option to enable systime-fix
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
Cc: =?iso-8859-1?Q?J=E9r=F4me_Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Martin,

> From: buildroot <buildroot-bounces@buildroot.org> on behalf of Martin Els=
huber <martin.elshuber@theobroma-systems.com>
> Sent: Monday, September 27, 2021 4:09 AM
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Cc: J=E9r=F4me Pouiller <jezz@sysmic.org>; Martin Elshuber <martin.elshub=
er@theobroma-systems.com>
> Subject: [External] [Buildroot] [PATCH 1/1] package/strongswan: add optio=
n to enable systime-fix =

> =

> When building embedded systems, which buildroot targets, the system
> often does not know the current time. However, when verifying X509
> certificates this is often required.

https://wiki.strongswan.org/projects/strongswan/wiki/SystimeFixPlugin

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
