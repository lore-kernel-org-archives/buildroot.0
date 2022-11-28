Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D70CC433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C03D81430;
	Mon, 28 Nov 2022 20:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C03D81430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WqmO7iUr0O2; Mon, 28 Nov 2022 20:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE24A81427;
	Mon, 28 Nov 2022 20:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE24A81427
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EDCB1BF2B8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED04281427
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 20:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED04281427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5dQ4-eQn1fO for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 20:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BD28141A
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0BD28141A
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 20:40:47 +0000 (UTC)
Received: from pps.filterd (m0078137.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2ASKXFGH033856; Mon, 28 Nov 2022 20:40:45 GMT
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0a-00105401.pphosted.com with ESMTP id 3m38x2b0ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 20:40:44 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ASKegpc092372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 20:40:42 GMT
Received: from UUSTOE24.utcmail.com (uustoe24.utcmail.com [10.221.63.38])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ASKeg7j015270
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 20:40:42 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE24.utcmail.com
 (10.221.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.15; Mon, 28 Nov
 2022 15:40:41 -0500
Received: from uustoe1y.utcmail.com (10.221.63.22) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Mon, 28 Nov
 2022 14:40:41 -0600
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.150)
 by uustoe1y.utcmail.com (10.221.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.28 via Frontend Transport; Mon, 28 Nov 2022 15:40:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=wTQWMYt2hAU+X6zK73jcYZ3ondGBzl+NeEUsv2DBhtk+VjBRIOQrbf7qodkaxw+76rpgTfIyM62ZOa+Xi+EGA7vlgyu1VK3wcZ4Y468brfrgbIdhV0gwalNFDpTptETWSpePpdP+YLr8jWr+kZxn+gLwj25Q+yGiEFyHlOXKDqVf51d6nNAXtUB9I+ZloB6lD6XxfvvKJgKMGfNeFwgPz6EnGE4kZ8fStQ1UY1cXf8Svw4jgTtcy6I3B6BwK2Iggx1FGdmAdjDpIKyDtsrJ+7K05UIwaSzl+Fqx3Se+O0TrkYmSN9A29pSw5j+i5ya1lSlmGT+JI/hJoYUuAoSGyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0qCYeDmngXvVQ350VVpD0ql1uFGLw33unIXZ+PC6iw=;
 b=dwXsaab2Hb2xBzXD1YZqHekF85n341/H3cHS5HLsJVJwK+bTPgDeO/GkxYLRkZy8DTXujMkwKm+8fReUX5A2bpkWN2JaMp4+bHKxCvaXq6FJOCoKu2jtXSsU1im9Hep9I+Nu2VDIPQZUVhzxyn8kFDkTjQlOedwMyd5qScHKkuc9o2g+mUTHkwwjDJ/KlxlaoFLXi12rWiLPCxcttGx34srH6OIJ5W2w+IEb53Z9JWAiyZCIyM6d5BoZMdtnS5p0Q/EyIOlVJCcKNPzk8oo8ufd7fltfZ5uP1b0gpO8xm85BjR5j3VBcIsl/bD2dXSv6hbQVDVl6i8VvwRGw4w6sSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1500.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 28 Nov
 2022 20:40:40 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::eca2:7105:f7ee:d34a]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::eca2:7105:f7ee:d34a%7]) with mapi id 15.20.5834.020; Mon, 28 Nov 2022
 20:40:40 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] Makefile: fix SDK
 relocation for per-package-dirs
Thread-Index: AQHY9TTupAfHZuCpGki94Y1MeSmC1q5OOZiAgAat6tA=
Date: Mon, 28 Nov 2022 20:40:40 +0000
Message-ID: <BN0P110MB1673B3BEE45B99C3A71C9042EB139@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20221110184734.22425-1-brandon.maier@collins.com>
 <9e198280-ba2c-0006-8335-d5878fc75ba1@mind.be>
In-Reply-To: <9e198280-ba2c-0006-8335-d5878fc75ba1@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1500:EE_
x-ms-office365-filtering-correlation-id: f9eac5f6-3348-4415-7c74-08dad180d067
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: utgQ1/3I64K9IOU52Lk9yVUHdoybU4drFwVMFJdaWdRTmQOqjMRqk9H5pLJLvKykq5qRrzFEDS5pfLiwwQdg0xRhjF9Je1KUO5ehR3OwDuZQEU+Vv0mcKXmT6SoEJ1iFd/90UQV7l5qi+hQYFXjjOWGQSV30JzhWb8g4pBxfGgZ6pf/0AJDXD5e5CoxaP0jsRCxMrtqfQ1ahnOHa2zwlyUltcVTbWME6/TWiWPS1ISyNh8u9p4XydDyN/tqr3wKv2dwXAcdyXblfXP8IanfzqOXg6Om+pkxwNmTNl6WF6x0bThwFBa8u9v36LK4QzeJGDaXE7nO1vDdQcPgVdQdxNSy8jCoKaCXH1nxiGiBWYw/vEih6HhIdUsaoQfed4r3HGWIcCKREPUyHZtrN+6g/s5Pag27BEz5aQtKBGX+X1gry7lCZtadlr4NK0qkPvfSXjv4MnzVZHI4g0F/HJbn3waE5fgx1zfrNN2TX8Ce/CtSJnC9SNzewwTczpbpl178RW9Rznavzy24umg6redl3UXtsHsv9wmTstTEuxUVAM2n6kmbdwRpPMiz4g//r3EjL0E1NML9TrALiWziJjKAW9ZahyyhEFI8REGtLF4SzuhF2pWjMwa4JF6rsA/VJVCgG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(451199015)(83380400001)(33656002)(110136005)(9686003)(7696005)(6506007)(71200400001)(55016003)(86362001)(38070700005)(82960400001)(122000001)(26005)(38100700002)(186003)(66556008)(5660300002)(8676002)(52536014)(8936002)(66476007)(53546011)(498600001)(66446008)(66946007)(64756008)(76116006)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 4RblL2cJsvotql7TxdUwf2evcIes+HNZHymbiS45+CzzLQJYYMFqmWDdw8q5E9BqvD1Jxr06aVGNyq/yaxztSD7ebiMfwZylJhajrqdOjdVINioU2Y2hdY7E6Rsaaq07+t5SKHDQC3pwc3R3f+df+XxwLuVum59NVqjPj6/5/cDB8NNaaKVCw1BzOYgfZRo5HdjGeeujDgvT6Ypx+Bx833lT+rg1wwApbUh23/AOyf4NT1XSno2vofEMXjcWBBdCd9a2dH4Ax/j/fjpKQiiSO3li8aNsYd9QTFHO8brGp5fAty+leo7SMeyNXtU6J9ZkHoqYJ7xV6On1TkQH8aQy7q2nLTIYybYi9UX1HmHJa+XC3xtXLj/il2XTM3TAKFazpCIrYuJJJdFBxZhHp870AolHd9i5HBIaX8smtbZtmjw=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: h0nsB9U0jgGz/lGiasEQkOzv1PNQXwcFaUvRNm9ffZeoqOj6Ujqz79CJ3ouAzIKxPN0g4mwfFrmIEWNcfxYNEB48XpAcpg4E4WGoKwKFQgEFMpFHdtWQyXY8z2NosK6NCKi599k8AyWjty2Bm/uJixvhB3Ssfc6gcCKwnD+ky/TaUlQRtIevguXtK6qZ/fFOwYfQvCLTrd+ZWedTBuIkYMvyi3vdgPb9qrLeBWSrNfV5vR0nxCeZoKm+BRyX76XdHM4VtMhOZDpQM7ac+CKU0qlk4qR29HSG3nQaoVbZri30kCt0quEgGykX8Ud3t6am1cVa/BS4nnzADMaLRpKQ3E/KWcn+zcoxUOO2T7Kaoje+eBGQwDPG/t0C6y1dDJmuslc0etjGh0owIoqMY9QdURrAXJiHODIzXcnxjVydA+G+9QjRHnREQ/WM8QMwQSiMq9CW0s8W81Hb/2XZdfHqzW8vKapRvhCfNiBuhjIiwsPvVMRvzrlzqF2v15wlXu9DccYsj0iy2RhYq+X9Q7BqUTMkGA7Q3Z8dJFGUcSg/5F1b+PU1CzQ8Yhcvy/2Im78WiRZOmvFNdEL8W/X8soI9OlNQZszo/IjpOsBZJdnQlY2Sxdt33ta89Iiv8EEJ3AKYtucN0skgGRRRgDzwC72EU1xvSdVEG79zNlKGntd3pjA2jqr+Hyir6Abs97shcCGtQitGzZhbNfpCMKm4ePLedeHPZYCRY8cL6vRPk23kPjmyc6X1mfDexPPguvhwUnI63Ek/6Z59vnIoEjoTf4qnUhXbHBZT/OIRw4ZgJTreAN5LOAF/k0TMzZIIuXPO7vk1
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eac5f6-3348-4415-7c74-08dad180d067
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 20:40:40.8496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1500
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: G4ZNV-p-bJpYNGWg15MpAAf_XMtTaPtZ
X-Proofpoint-ORIG-GUID: G4ZNV-p-bJpYNGWg15MpAAf_XMtTaPtZ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=s0qCYeDmngXvVQ350VVpD0ql1uFGLw33unIXZ+PC6iw=;
 b=VGRmZNeb834HFxgJvZzHcCbB//93AZxb1IbeuTLZzziMCSYbzRKRsudgMaPdc0gfbJZe
 vWDps6QveAyYeq7+ILZycm+1EK1h24s2dra58Kxu4//GOatQiPOvKCM2hL7WumEDSYgZ
 6eQYOc+anisv4TIUnUf4+FgalRmz5XPd98S/CU2DTxYBz5t4HfSv/OzuIqwITwe6eTzZ
 xCtjVmP4r7NJQeBlN9/hLZAedjZUEuFur1T2u06Kz+9qtBTT1FwotSXLXmFqzumXcCf1
 rigXMrtQoD47j+DqtKpXJbUFQRnI2EA82Za5ckiAuiZxTM//NEsnKbwBrqATHGv7krRs IA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0qCYeDmngXvVQ350VVpD0ql1uFGLw33unIXZ+PC6iw=;
 b=maeu281SyaSQHEiUPADZnReSGlTc5jnwqpkj0gx1YGBExpJrH4tWhCRSEyq+3Kncnq9Ehhdt7edU1ANzLulRcFPlPtwmoDmZTv9UjMzVwGv9mXAnj6g4Vg3qR1LgQLKzZUDaDhV+SoEohHD6KL8kKHJZUSnVSWOydWoH13+uPXg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=VGRmZNeb; 
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=maeu281S
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] Makefile: fix SDK
 relocation for per-package-dirs
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> From: Arnout Vandecappelle <arnout@mind.be>
> On 10/11/2022 19:47, Brandon Maier via buildroot wrote:
> > +# Replace the old path with the new one in all text files
> > +grep -lr "${PER_PACKAGE_DIR}/[-_a-zA-Z0-9]\+/host" "${HOST_DIR}" \
> 
>   Check what is used in PPD_FIXUP_PATHS:
> 
> grep --binary-files=without-match -lr '$(PER_PACKAGE_DIR)/[^/]\+/'
> $(HOST_DIR)
> 
>   The --binary-files=without-match speeds things up a lot because it will
> immediately skip large binary files.
> 
>   PPD_FIXUP_PATHS also uses a shell loop instead of xargs; not sure which
> one is
> better.
 
Before switching to --binary-files, the shell for-loop was much slower closer to
a minute for me. With --binary-files it's about 5 seconds, which is closer to the
xargs which is about 1 second. So I don't mind just using the PPD_FIXUP_PATHS
code.

> 
>   However, I think it would be better to refactor fix-perpkg against
> PPD_FIXUP_PATHS. It only differens in the replacement part of the final sed,
> so
> that can easily be done with a make function.

Agreed with all comments. And reusing PPD_FIXUP_PATHS will address them.
Will send updated patch shortly.

Thanks,
Brandon

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
