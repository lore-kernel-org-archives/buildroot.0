Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17C7C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 15:10:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FD4613B1
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 15:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79FD4613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DCF60767;
	Mon, 23 Aug 2021 15:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3l5V5_whJ6c; Mon, 23 Aug 2021 15:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FF160669;
	Mon, 23 Aug 2021 15:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 787881BF3B0
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 15:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6823E80D7E
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 15:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="FvQrTiRA";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="hkfa8uLj"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgPiNPCMK_xT for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 15:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F30F380BEE
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:10:02 +0000 (UTC)
Received: from pps.filterd (m0075556.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NF5R5o044207; Mon, 23 Aug 2021 15:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=EH7vPgcucIfym1JZmvYlsq+ZjRsZ768sqFgyXjxpK4w=;
 b=FvQrTiRAYKUZCvhForcUJf8VET+rEJ40uJawNoL8QVZaqgXtX7lYZslur1e5gHCbT1W+
 Lo0A1+LJV4XtUZuyTlUuHjJ9K+9+RolzUnXcEALAKRbrStB31/eHEAPdTR17UWmQL+bm
 KKKJFm7M69M1hwI4Xzc3oyXrHBolLS+60pgHqf1qG4bFEC13hJ7wsF7rg9z/EtILnHyU
 mJCIppJV8pXXyUhghjsQa9B0jikM6H8uIAS1WOtR4xm6iiBXepQtykOHt8YuD0ZfDcAQ
 C6vFPjlRLb1Lw6QOg7ip3eeFcCHKNcWKn9xRBXRoyXI6VupMDKhViS31F8iT/tyDVcIG sg== 
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0a-00105401.pphosted.com with ESMTP id 3ajrebppec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 15:09:59 +0000
Received: from qusnwadv.utcapp.com (QUSNWADV.utcapp.com [10.161.48.86])
 by xnwpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 17NF9wMk008662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 15:09:58 GMT
Received: from UUSALE0P.utcmail.com (UUSALE0P.utcmail.com [10.220.35.34])
 by qusnwadv.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 17NF9vjj007983
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 15:09:58 GMT
Received: from uusale29.utcmail.com (10.220.63.19) by UUSALE0P.utcmail.com
 (10.220.35.34) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 23 Aug
 2021 11:09:57 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Aug
 2021 11:09:57 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 23 Aug 2021 11:09:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=uCH51lCPziOgt921TudQR5mSsrPG8TQNjnk9fkv9/FNInwX9hTekkkBeK+6j5tKTfoKJZG1QipfreBGz4tYEFcTJGX/idvuFYLxWazLbICqUPAO8hvjDxnWs12Ams+LZUOrt4P8JTPCBP3UT0K6GjAIAnE9Ko/uMc3K0G2X/SQKhOc+eh0FEEgSu6xDl/P1ZMg8gNh2hYgrOB3Um/jxlHUJRWvPrPKUA0zFX/mniYYVhqpFLnDYXYKR9JUGnPcsA3Y3DjkYpFhPTJb2m8+fFvuBA51ui4aEbYZab8s+ufEWND0LkpGOX2Cl9ts5XgqpglQtO4l0jzYhj3hJYT6xFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH7vPgcucIfym1JZmvYlsq+ZjRsZ768sqFgyXjxpK4w=;
 b=xbHipDqW+5rbYS6Uy8vmZZsJm6PzL37GP0gn7FwJc+gAtTbQeFPRsxfDcKN4PU43DMTHXcW1F/E25bFp8eurt4lUnsrrFkWY4TbzvU9vfU17Fc0ZYi+c72dSC9XWVrTO2kapvwXhSmqCSaltddCVBr+jqfg8o4t7opXDmhha725jL60tOsUGoLStIndy3uRqTljV66MFfk2Qup735/AeQ2huq4BwVY4C2gRaMlvoFKSxOht5XNJJCmPHOj0jvzrqemr6r6/IRueKqslcqN16TBLYWUakZ0jqGrGTsHyBuH4IJr6OnhfkRWo8W8PwaqoiyOYxVaxq4/oscJbMT8dXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH7vPgcucIfym1JZmvYlsq+ZjRsZ768sqFgyXjxpK4w=;
 b=hkfa8uLjyHv8DETU3ZYyE+suhm19I5cqKg2/vegjstTPxByN9JubxjX33yHTilE9CngPARuJuBM82zu1bYFHhcdBokLdGLorM4GiRXljzH6wUBSix09go+xB4m2J8V7XWtm45awAdNdViZmhI0N6ehKW80jg8M9bEe22xsZibx0=
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM (23.103.22.148) by
 DM2P110MB0187.NAMP110.PROD.OUTLOOK.COM (23.103.24.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Mon, 23 Aug 2021 15:09:56 +0000
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) by
 DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) with mapi id
 15.20.4415.024; Mon, 23 Aug 2021 15:09:56 +0000
To: =?iso-8859-1?Q?Jos=E9_Pekkarinen?= <jose.pekkarinen@unikie.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH v2] package/restorecond: Add
 new init script
Thread-Index: AQHXlgt5c3mBWk7p40WvkI86vHgC96uAmCSAgACaX9w=
Date: Mon, 23 Aug 2021 15:09:56 +0000
Message-ID: <DM2P110MB0105E1F3F6C2D8D1E03AFFD1F2C49@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
 <20210820233611.1d6d1c71@windsurf>
 <CAJPV9MqEN+zLtFw_70cK1CURFp87Nynt_bOhfxBfgVNnCdN+Qg@mail.gmail.com>
In-Reply-To: <CAJPV9MqEN+zLtFw_70cK1CURFp87Nynt_bOhfxBfgVNnCdN+Qg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: unikie.com; dkim=none (message not signed)
 header.d=none;unikie.com; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c941a07-8a27-4527-ba30-08d96648115e
x-ms-traffictypediagnostic: DM2P110MB0187:
x-microsoft-antispam-prvs: <DM2P110MB018776AB278490582A8FCC29F2C49@DM2P110MB0187.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TfXhl0l54qDqVoeL++wTVxOzbD682xwcZQ2Un3Lx0/w6kNvV4rIL1HATYveVuqe/F4aSarMjq02yAkSMCWoSymqg3XKMi0rwAzhnzurTrgvgCg5RHErIgzQbkY6S4UKinInchINLz8iX+U68f0NNBDfvN3CVVn7PFozkjoG7zxrWgaMrxY1WhVrliyK7V3ciso0HMQ50+nsuY1oWttx5JBqorhoYq2nEhkbWjagyansBt/IPEm+VnHgOSP2P1Q5omblNc61NI8E5MtTzHaVPvUzX1PctSSjqThhYraLJdcRdzzJKftm0jKEtS76gIVFQp+mkAG0G67j3OqitQd4eQE0bXT1JriXcS0+wPZB/7nMrqTsUy6YZxCj1Ob3jS80ClbUG/6vWOSptkKIhqeZ97+WfvoFGV9Phb02ROL8WnMXHoQ3ye5L+AtVqGyCf4mCtCLhq4z3j9ZhVFBgB8xiW/O/ylVetT5WqaHFuspBTm5UJFG2OGAAsxgzUWPABJDPfFTiw40tucU82JqW77nkNlmMCRLAkgcGzmOiZ+pp/rSaChOc+GKFvWFRvnPl2fxVyIM+YSQE8cC8eD2uVClZ8bKgGNwc58jezObzSYapW80WfTMKqVpIs/3SbZ2F6WsvL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(186003)(6506007)(71200400001)(53546011)(55016002)(7696005)(26005)(9686003)(76116006)(66946007)(122000001)(83380400001)(38100700002)(38070700005)(86362001)(33656002)(2906002)(110136005)(8936002)(66476007)(64756008)(66556008)(66446008)(956004)(508600001)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Tl8+QII3lWT9OTmZMj/h0qzUGbAbwomL0/axXaIWQIXB5Ypx19ALxv6UgHw+Cb9WKiF5PKGPtJwdBZG/hFteiz+mz5XPUIdJ6Yo+rVYVr0fk6MAu6K50/LsdprUMJTlzEYqvERcnbY+AhpfOH5CfOgZ18LijtNZ2j8h3wnN95Bqt91ic4P3M7qmQW3p7XT6g70y+NezuIHk5GMteYG7147aKWjNrHlZct1uN9Kj4foK1EpRqi8tLiAoI7FO5Lp1Xm/ruBur+w+I+qxFJbuLYkHgA/PBLr2+jthIJfPP/PnH6xrjpZr2RSuU5onMEAFTQ4odrXq544s76owePgBWL0AQfETRGNQtp3xgbmUVJRGd3pSNJv6NYUNO75sTq1vznm9UqaRnutzk1ivlWnbegfQr5g7urmqDxg3G72N7VHBzQ+ICr2tZXDGuAetj+nvEspvcxLMMV4EI96BlgvveOBAk8izpTXG2rxAtsg6syG+hNDdtyMJQkkvZXd5A1CBJ5zpk+ISrYV7SubXDHGZAIVHA2JLxyYfqoOR5Qp6i5S48J4+mNL1tTzfDY597a59elZn5i1WR/RlYhULnEIioJcbSSnDlgQzO6OjlXh7pmM6YJKL8CdYRoKe97FlC+FhQP1aHCbtPRGGJ3jrGp5q7PcppScnzS9zjNM4RE5Ymv6mCd/ZqibX5RHtRWbl+fdUlUs1MooZTANYK5KG/AWCoMSg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c941a07-8a27-4527-ba30-08d96648115e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 15:09:56.3765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0187
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: qx880JCem79vk4zty2Gly8CZ_tDm57HS
X-Proofpoint-ORIG-GUID: qx880JCem79vk4zty2Gly8CZ_tDm57HS
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230105
Subject: Re: [Buildroot] [External] Re: [PATCH v2] package/restorecond: Add
 new init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Weber, Matthew L Collins via buildroot" <buildroot@busybox.net>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Yann / Jose,

> From: buildroot <buildroot-bounces@busybox.net> on behalf of Jos=E9 Pekka=
rinen <jose.pekkarinen@unikie.com>
> Sent: Monday, August 23, 2021 12:45 AM
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>
> Subject: [External] Re: [Buildroot] [PATCH v2] package/restorecond: Add n=
ew init script
>
> On Sat, Aug 21, 2021 at 12:36 AM Thomas Petazzoni <thomas.petazzoni@bootl=
in.com> wrote:
> Hello Jos=E9,
>
> On Fri, 20 Aug 2021 14:23:22 +0300
> Jos=E9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > The current restorecond upstream init script is no
> > good fit for the user space generated by buildroot,
> > this script is an extension of the original, that
> > brings some changes from the debian init script to
> > use start-stop-daemon instead of daemon, while
> > removing dependencies on /etc/rc.d/init.d/functions
> > and /lib/lsb/init-functions.

Oops, I was reviewing patches this morning and missed this one when I respo=
nded to the "autorelabel" email thread.

I think the example script I referenced in that email is still the most bas=
ic way to do the boot fixup, however, it would be worth going through the u=
pstream scripts/daemons to see if they are viable and fit the general crite=
ria Buildroot projects might desire.  Some things that come to mind the ups=
tream scripts would need to consider.
- .autorelabel is different from handling all our memory-based filesystems =
on each boot.  Does "fixfiles" cover this without requiring a .autorelabel =
set?
- No impact to boot time or requirement to run on first boot
- read-only filesystem support (may need to tweak the scripts)
- Additional Buildroot package dependencies to support "fixfiles" as is.  C=
an we make the selection of this conditional on using ".autorelabel"?

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
