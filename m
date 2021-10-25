Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D28AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:09:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDBE60F9B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DDBE60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF17280C13;
	Mon, 25 Oct 2021 13:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjbJaLu5Y65n; Mon, 25 Oct 2021 13:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BE280C06;
	Mon, 25 Oct 2021 13:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A91F61BF30A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96E494038F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="AM/w3I3q";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="OCqckPA4"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xvy8rkjX8zmg for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 13:09:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FC1F40387
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:09:28 +0000 (UTC)
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 19PD73wp031852; Mon, 25 Oct 2021 13:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=8ojkqCPiEvDo1yTzI7YEC8zs7HMuzLueSfSBGttoLsM=;
 b=AM/w3I3qMeJFKImGauVHHdixKVxsaSJdOVqEu5OTfaGamsJtAWG152nv9LW2FdOut0un
 DBnwttfrMko+wD+k40wUFzxzGdnakbiaVyjH6PJtVaEbznc743qFiKmsbtyTRTHdE6ul
 bD35Bj/M+ZQ9XMx0Vsz19N9+0XY8F/J26KcGozNcx3LSbkUjyDwbUIOdwWH5MI9x08PP
 XNj47Wfn9HuC3Lr3EXOTMBfVhehvazsL6LNqya2EMLmY/6NhG78LBCZ8EroQ2PondOP9
 RTH584brQPpVT9mPfD8BDq4ZAWOXiuBGXyzzQIDZcMAxyF+AlgknMClxcTraSgtfFpQ4 Gg== 
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3bvvd6geux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 13:09:27 +0000
Received: from qusmna5m.utcapp.com (new-mailhubs.utc.com [10.161.160.135])
 by xnwpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 19PD9QXs172334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 25 Oct 2021 13:09:26 GMT
Received: from UUSALE09.utcmail.com (UUSALE09.utcmail.com [10.220.35.19])
 by qusmna5m.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 19PD9QV6023893
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 13:09:26 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE09.utcmail.com
 (10.220.35.19) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 25 Oct
 2021 09:09:26 -0400
Received: from uusale2b.utcmail.com (10.220.63.21) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 25 Oct
 2021 09:09:25 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.150)
 by uusale2b.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.23 via Frontend Transport; Mon, 25 Oct 2021 09:09:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=DT/7wvq7Otit1Shx+3IvZmPkU41SzeNhalcBJ+rnp9KDenB3zMGiCUYBgB+qv+TZdYJ2PvxRlsswliGG8yi8ixfy0XNQG1uPG81qzXqyxo0sQKEn/9IxZftibfqjEPlbwQleywKtiWiAUxrTqQ4J3O/q5DPB8qKBHiXX0oq7p9vPKekuYr65mWjipJoIH3frYuTC6Hh+JxdHaYzDWE/VUgljamKX71vn7En6CdUn1Z4Yyy9h3pjFnSpRBfyQPoaijH1TtJzFnj2H1Xz2LT5E82bnfUDhhI3NcC7+SJs1PZRdBheCkDvuIl/7+urc9kZk7ZqZ15sQA9hpRHxBZHChbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8ojkqCPiEvDo1yTzI7YEC8zs7HMuzLueSfSBGttoLsM=;
 b=JoqIzlSQ+bZUe6+QTNRf4xSa/as6pI0GjvSCuoc1SbSIwi2MeBl3VLQQSKLCheCB9nckSd1JWhPzkZbVhmD1edaVdSmFHx3wd4fUF5Oa8mKNOT4zLmpywWtkJ5//JBK9OvFIwgrd9AWLRyqge6EFVS2e+TovJEp4AP2PNbEKYEzVNTgd5GVr0FycYbKYHQ0LTxbJua8WRX+04V7bwCjQOJInsImTq4GJjrT6gAjz/VBiC4aobPS/BbO35cgZM4Ramin9hKr20gPO/13Q2jvw5shswj0JWlbTSOvm0g8GqFvv0zh5GVuxRSZAu0XFYKv7ev9qXonFdTGTxfFeVM8nxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ojkqCPiEvDo1yTzI7YEC8zs7HMuzLueSfSBGttoLsM=;
 b=OCqckPA4mXO1GKcgVVaoB7TvpAVNmOjpZo4U1yLU4yMdq9J3FtZQ589LcouAe81UFDm0K0fFYwrrBycG0vEmkUoHWyuvC9X6obyZFCRHwRK/dYoX4x9usVk+LhwBr4eOfAwwhS/RJBR4fqFQ1umL8DFVtsJWg1PER7KhjC6D48c=
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41b::12)
 by SN5P110MB0528.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 13:09:25 +0000
Received: from SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065]) by SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1515:336b:17:3065%9]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 13:09:25 +0000
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [External] Re: [PATCH 2/2] package/lightning: [revert]ignore not
 applicable CVE-2020-7747
Thread-Index: AQHXxGjB5TqgPyJmg0Wy5sTtWGIhsavjdk+AgABDTxs=
Date: Mon, 25 Oct 2021 13:09:25 +0000
Message-ID: <SN5P110MB0480C708DCA6CEC9E1765471F2839@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211018214014.1202-1-matthew.weber@collins.com>
 <20211018214014.1202-2-matthew.weber@collins.com>
 <FYZI1R.QAI4TMAEMRIG2@crapouillou.net>
In-Reply-To: <FYZI1R.QAI4TMAEMRIG2@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: dfc3f6bd-9776-ec55-a849-2051221460b9
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27c547a6-47a3-4b48-f90c-08d997b8ab3f
x-ms-traffictypediagnostic: SN5P110MB0528:
x-microsoft-antispam-prvs: <SN5P110MB0528A90E1A05E851F65D22C4F2839@SN5P110MB0528.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDGHFnVuxZWkShfm+DqlYaCu7X62s6AxXDhZEj0Fkvyc5+6lscPxmiQi273MUWowAr+apxdy/ESUN+lleeuNhoaWeejTyY1si2Ki3055D9XodYvr3DmGyYWl1Uq6bOJu1yuaWsErfOPvvee+Q+vJ4eprmHtbsrEHNbFnR6pk4rYezitSMwg8pOROMGq6pn+5IOJI3Vvj8a9JASa7usfwp+5Il60kNC2gn9b21GM/fptHjy1Zo3nQnNqZps21+BL6rRpZz1ItHidYsWW93ByOGmX8b/IAVMLEmcYvYLEAK7iLKx0VmDUqP3SI7/IsavH/wIq8AYTp+8wjW34IeJ4TTs6Wodb65XmxH/0zXlC8YwtKpmpQ1wvkBFBuRESS1jFlaM3BJCHGcH2DXVP1MahsbQ+EmAfSpLi+xYM+Knklf77pFefhRYa5lImfvcT89/oc7hVQsGkefm8I3CVPIGels9f3KhudMFOgv1z8yBMiX4AhJpKdeQYyL5o5W4CuJCtD73I/4eb+wYdL0u+YoUVNXFzM+Qgul+xT5sPlLWqkwQjB7ceSMehwVuDMGwwcJy0RM834Igu5EfmuawDYqjeS4vHOsG4adeyr+hl4AhatKNOt5IZw8INkyUgprWQYEMSL/KlMXRmRY1g8yWZ38vFrQmpLJYSP0H/wjw+WPF5AxXg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(508600001)(186003)(55016002)(66946007)(9686003)(8676002)(7696005)(53546011)(8936002)(66446008)(76116006)(83380400001)(86362001)(4326008)(52536014)(66476007)(64756008)(6916009)(66556008)(316002)(6506007)(122000001)(33656002)(5660300002)(4744005)(38100700002)(38070700005)(71200400001)(26005)(82960400001)(2906002)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: KxLxrFAOoHYo0zwCXxHH+yfjxIbGTxl4SHH+SaqeAjdbv6/TAlT2kOLvWBX/tGJgUDgO0I5xStQsGisYTxUOpqWLqoqieLbGWA6nuwyz6Rm3a9uzTYSw7CrWoZJY9D7rW4wCWPkwbO/c/0iia3FYfAajKYPrynioC/1nfCeBO6M7M6B2xNU4l4V0x8IUKL5Dw9UWk6jc9oV9N4BTiiO7kiCn0ffov6/OOS4IG3EF4w/kdV0W883bwZMLQTZMZCeWA+j7BADUqvzyh8adzLIqEgY3W7pE/WdEsh15uRX70ol5PU8Ce37id3DKcPfiwZJ5SlxDR6eV8tHmNj8E+U5X5wXhnxcY6rdVyciH3YTGMI0UMjWBMnWblv9hPllOvMf2mRZz3VloVcJDa6O6ELCLb/+L4kTWdAXzrs6UDHiqXjcRjU+f1n459SbgLfBQF6jJI350OvwcewAY7B9K23sgnK59hWCyShR72zMUd0sQSn6DVYdScOAjAftivzFCVUJB2LdIzL8xw/QLlPdY5TVXhGnYt+HLVzwXjJFXWL9wZZwPjUn6Ayb+ElVQzLO0Vjbe3kNKcUdUhSAS60BbUnCMtXh8ICSyc+z8pINYtq0TGOhvW9HgtM8C218Tf8H8CHHxTqkXOsbw3F/foGRhSba7VTMDOBG9pnmXyOg6L1rXCJGNk0esTxoopF/yRpay3pht/1QO8vyEEVdV8MLk9WCZ7w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c547a6-47a3-4b48-f90c-08d997b8ab3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 13:09:25.1009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0528
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: VOMR3yZzrgfQdvz2YL_PLHN0N3xGruz5
X-Proofpoint-GUID: VOMR3yZzrgfQdvz2YL_PLHN0N3xGruz5
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250081
Subject: Re: [Buildroot] [External] Re: [PATCH 2/2] package/lightning:
 [revert]ignore not applicable CVE-2020-7747
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Paul,


> From: Paul Cercueil <paul@crapouillou.net>
> Sent: Monday, October 25, 2021 4:06 AM
> To: Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Yann E . MORIN <ya=
nn.morin.1998@free.fr>
> Subject: [External] Re: [PATCH 2/2] package/lightning: [revert]ignore not=
 applicable CVE-2020-7747 =

> =A0
> Hi Matthew, all,
> =

> I still get the emails about CVEs in Lightning though :(
> I just got one a few hours ago.

The changes to resolve that were merged on master last week and I noticed t=
oday that Peter applied them to the long term support branch (probably afte=
r you received that email).  Which branch did the email list CVE against?

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
