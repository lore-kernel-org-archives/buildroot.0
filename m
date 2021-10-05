Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6048AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5D8613AC
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E5D8613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F6340167;
	Tue,  5 Oct 2021 19:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IccBcuAms8o; Tue,  5 Oct 2021 19:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BEE94023C;
	Tue,  5 Oct 2021 19:48:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66A5C1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62BCE408A1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="nK09xgoZ";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="3jVt56pq"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5-oMAfh_f4c for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:48:09 +0000 (UTC)
X-Greylist: delayed 00:35:59 by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 307E74089E
 for <buildroot@uclibc.org>; Tue,  5 Oct 2021 19:48:09 +0000 (UTC)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 195J1VcW025346; Tue, 5 Oct 2021 19:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=lYNGx47Tp6H7Yl8XSUmOXEWGIJr0VX59xzXgBlSv7dc=;
 b=nK09xgoZ2QFEuayr550WsI2+dBAGKeZXV+Iwa65qwQiVM+K2zLT1SGa1nT+snusyDzFR
 MweWJGOZJRmTfYIsdT8IOEMwPVpeaYT74cl0VEh0xRpab7Ie0nJM+dwx0fE0crtVcs5m
 ARevPqxUnTQiAllN0uk971Pb0GRbHWuGnLrDrk0ClOzhXSEWYTjCoc8iFXMMcbqOPcD6
 IdoBFP/snEVwIocj/EThdlnZ3as/Ry6cA/CHdUs4OaxGcahU/kSbbRFxGhEts5Abk1eM
 2yYnEg2XMXEF553EHvIOA2+9Mcd5km5LfqF+uJETh+/5bsTs94ms0nbc+8i3/uRMVJY5 4w== 
Received: from xmnpv36.utc.com ([167.17.255.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3bf16577hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 19:12:05 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xmnpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 195JC4OO196207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 5 Oct 2021 19:12:04 GMT
Received: from UUSALE0E.utcmail.com (UUSALE0E.utcmail.com [10.220.35.24])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 195JC40A008573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 5 Oct 2021 19:12:04 GMT
Received: from uusale29.utcmail.com (10.220.63.19) by UUSALE0E.utcmail.com
 (10.220.35.24) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 5 Oct
 2021 15:12:03 -0400
Received: from uusale29.utcmail.com (10.220.63.19) by uusale29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 5 Oct
 2021 15:12:03 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by uusale29.utcmail.com (10.220.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 5 Oct 2021 15:12:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=AI6rbwG2XTaOFJ7DPnMEKlIMnEW479WoBKJleA8mS11tBXZ2QcgCNrK/IgWvXobRaRAgn2VgQXLTBCzYYlR2XP8x1hnZpq5sgX128V4rM+Whpca+3ld+V1ZlbjL1QzAw10PfP1zgKxdrmPZjuGdPK4HRKCnYM07F1hMY8IGM/11y/zH7tSGRbND9HNg/G6TZGZwxYendUnk2AtNSXG1Dz2dktbjp2ECaMe2TTzYBTckfZA/hqQ3GjkROHntpTh1KqNQPQSw4mB+/JRCJOZ7ES9nVOESV/wWGcB32OqEk6RJJDWB3HofrPjv43aydNhKvCuB4nnKnwbwj6xQC5mw07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lYNGx47Tp6H7Yl8XSUmOXEWGIJr0VX59xzXgBlSv7dc=;
 b=j49cZ6pU5BTJG8Jg+eAifNeeFlKEqx6hHWlpsu2b6ygWu0Ewv0YfcUbwzFtli8KpHtewaLJF9KxkyshPHqQeqcls6OiqPEr2UaIOvbrWcIUkWU6nWd8RAh1VCcZJj1WF45IZ+QRgWGE+Jkr28ITGm38Hn9zWjX0TwhvlJWGlnu4KyKpspp9pOLYgUMP4P4ZqNAeH7LEGQfiKKwlz10wvYHenv0TNlczTsiMmwPaXXNyyDTWoyjwH5tP7HIJkiWvZ01M55qnmkSleQSjckLeTGNyrOtLQqMVGxTFv82XgWYTXD/9x1m5bmlWAY2XuZcpEoOR3QIB3Qia8FqrJqX0wSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYNGx47Tp6H7Yl8XSUmOXEWGIJr0VX59xzXgBlSv7dc=;
 b=3jVt56pq+W1ySnizcsBxEWXVqPMlwK95dANcKcmt6MMNAqXD9XRTyzSHCr3MDh7/taX4Swp8AiKmxym3N+62tBJvethuceXIox7w78GgPMXJnKAlDU2DGtMFy17icvnONJTqyB9fmcuVI2JnPIs5pmY5GxRp18aJm/XWO6L1+7U=
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41b::12)
 by SN5P110MB0798.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 19:12:02 +0000
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065]) by SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065%9]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 19:12:02 +0000
To: Arnout Vandecappelle <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] Re: [Buildroot] Adding new products in the CPE
 database ?
Thread-Index: AQHXuhtxKpstjFJC1EaUdRBY+L4njKvEwv9z
Date: Tue, 5 Oct 2021 19:12:02 +0000
Message-ID: <SN5P110MB0480042A1D71166EFCB40D85F2AF9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211004094915.516ef395@windsurf>
 <cb2befb9-e57f-895e-50e7-e42f5b195123@mind.be>
In-Reply-To: <cb2befb9-e57f-895e-50e7-e42f5b195123@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 45682215-6f6a-dbb9-bff8-633dd088b4c1
authentication-results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cba156af-2071-46b6-5190-08d988340356
x-ms-traffictypediagnostic: SN5P110MB0798:
x-microsoft-antispam-prvs: <SN5P110MB079865149C682C6F35D9A731F2AF9@SN5P110MB0798.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nYPfBlHLhRhFTPeWdn29YRO/BCs5TubbnOV8/3ii6xSU0FmvlM3Sj1WVG9aMSGGhaMsMLBqbVjQSmVO/ZgKopBlrBSEptR2N613++GkaYe8lJmYlyiqBYVvf3qb8oE39bGQ/mCJnU4gCay34aPONHY4At8PLIwW2igRlel7I7+JiZu8rRelXvtVTHNf2ddYzSQF7yQdYrSC4jg7bkdLGcqFi1Lyy0aNQ1r64l+WVtq1+fVYL6xI25zHo2Lk11peom0sexhRD10s1X6Mg1yRvA++gdefMGpT5OBk6Z7I8iKjY2nShfKBhd+BIoRGKfPbWTzwL046Iqrb3FRy4c5iGT7Hj9M+Lxmg+xhyoIhZzc4r/MWMi7VcjfQ4id0cKGtEMz/QYA8sDhcd4AoN6SGps8qCwzVBvXWbzm6mDGkbHTxce1TSMYy+x6RmhJSEGFpMT7EsEmJ4p/TvLaoVkbRpqdyFkMl3cKbTElhqq3Zkvca7u3OLyCB/RZvSRKxtfbf3li3xxq6VruUg4RZsrGI9LYrjQ8DWKSkO07xLNzkdA0EMEkBjNI7LA1VCN0UnCyl+z74Uq2zTxvrzE8qejf5eIrdFh53Wpt0MpTXLXUMYyH/gY4b9IBoENm+miWwewu71Z+jUI0zGEtknMHSLIlyp29gl4lVE8W/m2k/Do1llge1K4Cv0UPblXl2/UsETBJfGznTiOACDi806No/uK1ovj+PaZVA8fdfSJOOS6UJ4r8xaVI1c+RKWhBxQlLoHq30XnSPP7ymdH8GadA5ZnlDa5jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(71200400001)(86362001)(66946007)(66446008)(64756008)(186003)(66556008)(66476007)(6506007)(26005)(508600001)(966005)(7696005)(76116006)(316002)(55016002)(83380400001)(38100700002)(122000001)(5660300002)(33656002)(8676002)(54906003)(38070700005)(110136005)(4326008)(9686003)(8936002)(52536014)(2906002)(15866825006)(130980200001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: hC0hL+eLCayAyLkTmcYtnI7lM5JAaJlggP63A7aCsjcoZEN2Ii5GJLpbMAe+3F61mgzcWJ73YXnpqX8ISCIvZiPqzNlRO9hbJ6cizpEV67cuGdfovmSVXkL12cktK7eFA5dB+zPIT2DWaR0pix6tZwE0fwiVKn2cfPaBN7p8nmowGEGNIIH4gdwbE7sxfIW5pc1YbF5pPDdum92FVYgnjOicvyJSWwZqw19pn4amVSBSM3OrkYOiR8v5Uz4mjH4HcJuAXgcFTgcTBNh0NPX/HP/qEmNd4Cyr9hz8OCYcV2beRN6z63mDgIGWlHn/+aNDdW+Y5jICi6d5nc/1EkSf84MWdGRlvMdYqX73Gk5fA/lDoH9VAwu50lDy+V7hTVJ1eChsC8YVoWLoY8S9lkZAgDVHH66726LJLA6eGrHGPonUioGMuPm8BmjPmSJcRhF6h8HiVYzwGUEI9tIPI4XT8xt0epzhATXSqs0zBdzzKiAif865bE/zMSBMm9qxBdTNBRU5P7HNLc2G/mZkxtNJynTXmYHZjQI5MKeIhNPOd4ioS10T6ABlNafCGVo4N72ty0jY3AA6O6dQ+N6FZNr4UqQaaVfXLaTJPl1SD20pPGJL6Y2n6dfrN6KlpwieZP15McHANMi4Hkzbs35ev3XKcyqUk346oSOAhaSYr817BHUrjfJTI1ODKNB+jgZ9YnAbW/TGi9ptWwaSVix187UEKQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cba156af-2071-46b6-5190-08d988340356
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 19:12:02.4431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0798
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: Ct45gbeonZegE-AZsdMr9awIy0b-XhrQ
X-Proofpoint-GUID: Ct45gbeonZegE-AZsdMr9awIy0b-XhrQ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1011 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110050112
Subject: Re: [Buildroot] [External] Re: Adding new products in the CPE
 database ?
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Tuesday, October 5, 2021 2:01 PM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Weber, Matthew L Col=
lins <Matthew.Weber@collins.com>
> Cc: buildroot@uclibc.org <buildroot@uclibc.org>; Yann E. MORIN <yann.mori=
n.1998@free.fr>
> Subject: [External] Re: [Buildroot] Adding new products in the CPE databa=
se ?
> =A0
>
>
> On 04/10/2021 09:49, Thomas Petazzoni wrote:
> > Hello Matt,
> >
> > I was wondering what was the process to add a new product in the CPE
> > database.
> >
> > Indeed, I was investigating
> > https://urldefense.com/v3/__https://security-tracker.debian.org/tracker=
/CVE-2011-3332__;!!MvWE!VPRf0gaaOCsnE_JQM6pGz-1aoPEj-5ToeWvMQhYpCm-cI3SkMsp=
4OAcAY74VaSz9TE70$ , which is
> > affecting our "argus" package.
> >
> > However CVE-2011-3332 affects the Argus product from Iceni, a PDF
> > extracting tool at https://urldefense.com/v3/__https://www.iceni.com/le=
gacy.htm__;!!MvWE!VPRf0gaaOCsnE_JQM6pGz-1aoPEj-5ToeWvMQhYpCm-cI3SkMsp4OAcAY=
74VaTcLkKg6$ .
> >
> > This is completely different than the Argus package we have, which is
> > https://urldefense.com/v3/__https://openargus.org/__;!!MvWE!VPRf0gaaOCs=
nE_JQM6pGz-1aoPEj-5ToeWvMQhYpCm-cI3SkMsp4OAcAY74VafTb08-R$ .
> >
> > The NVD CPE database has several Argus products known:
> > https://urldefense.com/v3/__https://nvd.nist.gov/products/cpe/search/re=
sults?namingFormat=3D2.3&keyword=3Dargus__;!!MvWE!VPRf0gaaOCsnE_JQM6pGz-1ao=
PEj-5ToeWvMQhYpCm-cI3SkMsp4OAcAY74VaXBFw7T9$ .
> >=A0 From Iceni, from Oracle, from Litronic. But none of them correspond =
to
> > the Argus that we have packaged.
> >
> > So I guess we need to tell the NVD people to add an entry in the CPE
> > database for this other Argus product, so that we can then amend our
> > argus.mk package with the appropriate CPE ID information.
>
> =A0 I believe it's simply sending mail to cpe_dictionary at nist.gov. Fro=
m [1]:

Yeah, it isn't too bad.

What has worked before has been to build a proposed XML entry for the new a=
ddition that includes the basic VERSION and PROJECT reference fields.  The =
NIST cpe team then takes those refs and verifies they make sense before add=
ing the new entry to the dictionary.  You don't necessarily need to include=
 all prior versions (they sometimes fill these in).

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
