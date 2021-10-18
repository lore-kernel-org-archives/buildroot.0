Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D0EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17F96103C
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B17F96103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9BB4040D;
	Mon, 18 Oct 2021 13:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwhVNRyUKVFT; Mon, 18 Oct 2021 13:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9168A40411;
	Mon, 18 Oct 2021 13:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FBB41BF337
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 13:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E67C83B1A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 13:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="pRJ3L2Kt";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="GvV9Mmye"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUq0IiZmA6xt for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 13:21:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2F1683AF7
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 13:21:46 +0000 (UTC)
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 19IDAUKs033356; Mon, 18 Oct 2021 13:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=qo2nDMj7tUMTR9tqZB1ZKo9yhXAoaNi5ogV3BUR6MqI=;
 b=pRJ3L2Kt90fKRtqDiZjuBgMx123nuojCADTOB7YlXoxndEpTKAt3PK7OKmgd1b7HBEGx
 LN8YsHpDSc7ztRbUm3BcT7Cwib+RM1ZM1iFe4A/xGhT0AQMMkZuZlrfv0stXd3dUFgCi
 8vnFguM3v8jQ9To7JZCraGCnDIpADkiRzgyEhubsoEn6v88ONI5VKUq9nsgz+THGWve2
 0ZECqJNqvREfC2xrx0/oJPqxO/r0+mLJBJxcrxj+T2aDfVzs9xPeYq93FW78OJmEc0G5
 VEYtIPz8xozC2cqH6vLG49ZJ0dQTMrpZPhAYsU174Fz/d8mfV/uGmyXvXVfmjgXbxEdN Sw== 
Received: from xmnpv36.utc.com ([167.17.255.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3br8r521e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 13:21:44 +0000
Received: from qusnwadv.utcapp.com (QUSNWADV.utcapp.com [10.161.48.86])
 by xmnpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 19IDLgSJ144073
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 Oct 2021 13:21:42 GMT
Received: from UUSALE08.utcmail.com (UUSALE08.utcmail.com [10.220.35.18])
 by qusnwadv.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 19IDLf4H001532
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 13:21:41 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE08.utcmail.com
 (10.220.35.18) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 18 Oct
 2021 09:21:40 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 18 Oct
 2021 09:21:40 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Mon, 18 Oct 2021 09:21:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=gB/FxPEwCM2ZiNnegwn6ye7F0aTdJHfHUpBD5Z4XferdU76f2+GN+koNxQ1d3vbIbu/UxcjrwUZHNPY9khY9x8hya4km/WsFzI0WdajvBdiJ6DJRPVYijzw1jF6LzP21nSRVqi/L/k1GOuIl5Nn6beMUp9CM8T4+QmaDporX0V61Q35gVnzofECVAYcU34Y5VHpVTm7i0qsx6Co/KQE8TJKXR2ebT0Q7fdv/6VvmvoXols0KcNW9oXQ1tu2wqZTiPKYfVwC6j2EnqX2ML3ZaMOkFs0jQQD3ETNQ4/HHG+dG8ac74HAySHPtCHMLIi0ITla03jhpVoFUSiTkiVZ6DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qo2nDMj7tUMTR9tqZB1ZKo9yhXAoaNi5ogV3BUR6MqI=;
 b=hHbbq73FIB2J0X8z3M9m5GoTzDKCzhPHJdn8uinGZxoaUiPZnVJxphD/fWJz8mV30xWafp3bxvCZT8OxpgUBaPX3Q78oDy/Gt1IJT/fPU1EyGdtnNGi0N+2SjARC8+uolDvFVqN0E+iBSev1EjhKEIVo6gUcZeTp3LIasGkY9f6H1xlGIyt/4ecW8oRtsNwpe8w1e0EIIHk5SOcRzcG/3L2/hHjIYTM09eBg7HafmwAGFAhyflzSPnezd1nMNBeZ3yJWfS9NZuMDhgNj4opkrP8i421PFZER64IwQGjL3kkoGzzvHSXH/KcnWFocROIjC4uqTYM31oL9nX76quhPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qo2nDMj7tUMTR9tqZB1ZKo9yhXAoaNi5ogV3BUR6MqI=;
 b=GvV9MmyeiNtr65knAOcbh9yWcJD8jOJkptgfbqUFuJ6GhLtLPwIlv8xC/TS1+V7vDMmb0U8aC6Q2nzqqxshZaZfRIzXXpZeAoMwVVgY68wUIdU9RRukVctxRVyy1c7NL4tPtUjPYa3IcgN4uGrieYQWppYjiHDi6y54j7e6EWVM=
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41b::12)
 by SN5P110MB0335.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:419::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 13:21:39 +0000
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065]) by SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065%9]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 13:21:39 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Paul Cercueil
 <paul@crapouillou.net>
Thread-Topic: [External] Re: [Buildroot] [PATCH] package/lightning: stop spam!
Thread-Index: AQHXwmQ4euozmZLJo0iWOIc/sGXIKavYu34B
Date: Mon, 18 Oct 2021 13:21:39 +0000
Message-ID: <SN5P110MB048022947C6AD67D5341B4A6F2BC9@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211015215003.181073-1-paul@crapouillou.net>
 <20211016080238.GD4165837@scaer>
In-Reply-To: <20211016080238.GD4165837@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8a7d0c7a-1e6e-71c4-f6b2-70059d87be91
authentication-results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5728818e-21ca-45be-4509-08d9923a37ef
x-ms-traffictypediagnostic: SN5P110MB0335:
x-microsoft-antispam-prvs: <SN5P110MB03359B43BF8C1ABB61EFF948F2BC9@SN5P110MB0335.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QTuKtO6qlqbigsgTXVuo/qSExQjDBUTU9FjHdOChQJaQe5+MTZPDJPi75s8/1lJAQfOzj+9G70RRGZ7nOxWWx5RzNIKP+iCsZmLbTHVikyP6LDn7sVMH+OQv6cCcLWB33VXE+OBbJErCFajZu7aC6PqKDVDrCThuu9m4tWmkfsz9MNrEfUqxVQ8sjqmNa0tLsqeRL32Al2zyIW75Y6+VPgh3H4yEjKasAtFyldgxwvNIqt56CQBHTdQ4UOMUfc9sNQY3TFwHAT/Hw712XXOZRxEVxusL6reoPT8Y0OkWe+IyIKdiGRY0lJ9pYN7kasOewbsat+8ykxxGcdkJg9Aav4G2SioLj2momQZ21E2EKgNUwUrmmamYp3bnTega8HXVhwoKlqvZA+SXxLmMH+B6aKhS05WTyAjFAraE+su8o5ExMuoC8Q0+sh4nvLmohMdPcBUJUHvDEigLuAKn5ONI49ftBELs5bALMtoXlb61yMgVMchRfVm6v7CczwpJzC+BhNre9FcCvoOIPvwbKOlPItaFz2ns3FyGuP6wm/4gqaAezNJYbQCxJtPMMFm4lB+Z1/Lm2F0g//xmfhjKfgc6gDGMoeXlWHzaqe17mIO6TzOVR/bJAZhG+HMYp3tPWv6+gz8qiRSAkp832EDf7bTW3Nxnh7R9GYKJxCyRpyZ5u+3aDvmbtIzmjuXmWpb57QZ5uVEWnTmp8CToiwXMp7HjgxzeEjjoOdWvX/edqh2m/W7A3FBoJTKdyUShi+aYvh9YjXFLbMonzRa5DQNBKMXmJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(5660300002)(508600001)(8676002)(9686003)(71200400001)(33656002)(52536014)(38100700002)(122000001)(8936002)(38070700005)(966005)(186003)(55016002)(66446008)(66556008)(66476007)(76116006)(4326008)(6506007)(316002)(66946007)(2906002)(7696005)(53546011)(4001150100001)(26005)(110136005)(86362001)(83380400001)(64756008)(26753003)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: muMOmaREILuOldBa/4FfVpCLNs1XFWl9HCoONNDvXx0k6pa9GW45Nmf6yyMWZkNkIbJl6wEQBuOcFPWbDtzymeiYrJhIUufwcGfpZfruIwB+1vJaQUVGc9dmf15sN1PV9wBhcMhl+SKjFMo9SIhNp7/TE0Tt/ytbcl7tPvlCuFecuVuSWkW1WFkEbVulVtf9V0prtbx3IUOn7y10UHI+UzpuzQesb5WUWe+B+j42peGJ7Y2PIk6zBiqwq2DBchO5C8Xh38Mgan/os0u6Fs3dTlzKVrQC+POlrEtyPgdUKyGM+yGjPwfeMNVgoPCpWiFH75Z+jWy5LV7Y8C22LH2Ru+4DCtq+u9UzZ9zQjes1xTWf/ve+kFnyXHVKpVNDk40BEUQ98elHFUS/XgOct9ocE9vdsruL3AVBvrwf3HEnykKY2aWtpaiIPH3anKMyAoJfDAqJ5JgEuuLciqwUewadKSS1A6n1kqctnlNyX4afL3w6Gf6VzKOBlL2wTcsav8FXcS+QW/2Be1OB+UR3mXWmRApu3rinYmpV4MyxWhuH5Y/cUI164COk9abcuwvuF4mkTJc+lsMxZ7YbloP1iAmRtMxGAKn10Ufs/najy0MP4n6LdeZR7yq+YPnaZlaCyuRo+AgxW+Ekj+h1hcg1yrp6i+c6wG3iMfeOZzP+sEu+mKcjrQ8NeF8TJu68LeQ168HvzaTSwN7eGGWGCSCHoThBpg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5728818e-21ca-45be-4509-08d9923a37ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 13:21:39.2932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0335
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: iUNbSI9Fh6pP7oIZLANxYHnHfGLhDKqA
X-Proofpoint-ORIG-GUID: iUNbSI9Fh6pP7oIZLANxYHnHfGLhDKqA
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 phishscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110180083
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Saturday, October 16, 2021 3:02 AM
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Weber, Matthew L C=
ollins <Matthew.Weber@collins.com>
> Subject: [External] Re: [Buildroot] [PATCH] package/lightning: stop spam!
> =A0
> Paul, All,
>
> +Matthew
>
> On 2021-10-15 22:50 +0100, Paul Cercueil spake thusly:
> > Every week I receive an automated email that tells me about the
> > CVE-2020-7747 vulnerability in Lightning. This vulnerability however
> > applies to the Javascript lightning-server project, and not to the
> > GNU Lightning project.
> >
> > Ignore this CVE in the Lightning package to reduce my stress levels.
> >
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>
> The goal of sending those automated emails, is explicitly to have people
> registered on DEVELOPPERS, to take action on those CVE reports. Such
> actions can be bumping the package to an non-affected version,
> backporting an upstream patch, or, as you did, mark them to be ignored.
>
> Bonus point if the NIST CPE DB is updated to avoid the mismatch, like
> adding an entry for GNU lightning, and thus settign the correct CPE_ID
> in Buildroot.
>
> Matt: is there a process to update the NIST CPE DB? Can we add that in the
> manual, even just as an URL?

Thomas and I had started this elinux page covering adding/updating a CVE or=
 CPE.
https://www.elinux.org/Buildroot:Security_Vulnerability_Management

So in this case, I think we need to submit an entry for the GNU lightning p=
ackage (cpe:2.3:a:gnu:lightning:2.1.3:*:*:*:*:*:*:*) as there isn't a CPE. =
 Once that's added, then this .mk can set "LIGHTNING_CPE_ID_VENDOR =3D gnu"=
 so the CVE filter is clear for this package (right now it is free txt base=
d and that's why you've picked up the server CVE).  I've emailed the XML [1=
] to NIST to make this update.

Regards,
Matt



[1]
<?xml version=3D"1.0" encoding=3D"utf-8"?>
<cpe-list xmlns=3D"http://cpe.mitre.org/dictionary/2.0" xmlns:config=3D"htt=
p://scap.nist.gov/schema/configuration/0.1" xmlns:cpe-23=3D"http://scap.nis=
t.gov/schema/cpe-extension/2.3" xmlns:meta=3D"http://scap.nist.gov/schema/c=
pe-dictionary-metadata/0.2" xmlns:ns6=3D"http://scap.nist.gov/schema/scap-c=
ore/0.1" xmlns:scap-core=3D"http://scap.nist.gov/schema/scap-core/0.3" xmln=
s:xsi=3D"http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation=3D"h=
ttp://scap.nist.gov/schema/cpe-extension/2.3 https://scap.nist.gov/schema/c=
pe/2.3/cpe-dictionary-extension_2.3.xsd http://cpe.mitre.org/dictionary/2.0=
 https://scap.nist.gov/schema/cpe/2.3/cpe-dictionary_2.3.xsd http://scap.ni=
st.gov/schema/cpe-dictionary-metadata/0.2 https://scap.nist.gov/schema/cpe/=
2.1/cpe-dictionary-metadata_0.2.xsd http://scap.nist.gov/schema/scap-core/0=
.3 https://scap.nist.gov/schema/nvd/scap-core_0.3.xsd http://scap.nist.gov/=
schema/configuration/0.1 https://scap.nist.gov/schema/nvd/configuration_0.1=
.xsd http://scap.nist.gov/schema/scap-core/0.1 https://scap.nist.gov/schema=
/nvd/scap-core_0.1.xsd">
        <cpe-item name=3D"cpe:/a:gnu:lightning:2.1.3">
                <title xml:lang=3D"en-US">GNU Lightning Project 2.1.3</titl=
e>
                <references>
                        <reference href=3D"http://git.savannah.gnu.org/cgit=
/lightning.git">VERSION</reference>
                        <reference href=3D"https://www.gnu.org/software/lig=
htning/">PRODUCT</reference>
                </references>
                <cpe-23:cpe23-item name=3D"cpe:2.3:a:gnu:lightning:2.1.3:*:=
*:*:*:*:*:*"/>
        </cpe-item>
</cpe-list>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
