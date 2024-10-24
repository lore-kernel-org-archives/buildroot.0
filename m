Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD09BCFA451
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 10:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744F86085B;
	Thu, 24 Oct 2024 10:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOZcvf5n0BVu; Thu, 24 Oct 2024 10:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2856066B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E2856066B;
	Thu, 24 Oct 2024 10:14:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A006D5A5A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 10:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC22407A1
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 10:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PamlmVBJ8gmC for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 10:14:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260e::714;
 helo=eur03-am7-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A5264027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A5264027C
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::714])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A5264027C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 10:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur4vIxd9n/+hrAd+ml/CkIRO8N8Puu2TCiZ4O8e4hlcsfbcvPuLMlFEWYQvtIYtOG+IB7/tsWU6DbjtT38DPceka78ULLKc2JTcd+nay+yZWxZecPrugJeRwVTWZWuDPVZi2SEVmWxgpsI10vkPSWgOaDP8EUk6ow8roZYUfz5jgxiNDnlBeaJxU8e7s+o/+F6RiAMeL36jrlX5f6qmQ1jA/5TQCOnjkN/EhYJmvX7zy5Wb+6j/XVxfoclNg8KBUDgDx8IqOpAoobKRI350klYwoCgvpTE1iWjdVwTrNSSsEehZVkUrXRY/nBkgNSmYIjaCm8hMjrLfIfvL/oRQ83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2UjTrclAI0vP50L17vje51kRbyPnpMtw9F3y/ludfw=;
 b=i+tSTab4Ix1Ro0Q08H5PTU2BzKc5oZb3mP09ib6O5tPWXLZBCv9ERpz3870nHWON9JPnpLoBlVQgqsLzG4AQnJP4kkagi0f4I/QirJ3VJk2aIpll1nTklBTbng4Ga2mHDugn3bXK1TVIagsUnQ+IId6UHTjw0ctBtZPiWFUfuSq/2TaMt0Mys71MzZnAX39svkqYmSRSXtkYEauiiD3c79uiUUDQUg0LLgUrmnNk/FakckvhUrgHAMzHBOF3SBSIMbc4ZWWyZfox+zCFFq4IJ6a6kQr6NABSN3L/8O+luiO3zNFtcdVS9e62w2uwFJIWP8MibniQm1FmumsDPiO/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by PR3PR06MB6890.eurprd06.prod.outlook.com (2603:10a6:102:88::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 10:14:04 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 10:14:04 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/certmonger: add certmonger
 package
Thread-Index: Adsjr+UlTTOopnvRS0uIZFEAq0BmcgB3gI4AABuubFA=
Date: Thu, 24 Oct 2024 10:14:04 +0000
Message-ID: <VI1PR06MB8926480FA28C325114C6C20CAD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB8926C0355B067317D6675B37AD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241023225534.34ed60ff@windsurf>
In-Reply-To: <20241023225534.34ed60ff@windsurf>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|PR3PR06MB6890:EE_
x-ms-office365-filtering-correlation-id: 852316e4-43e5-4cbf-481b-08dcf41496a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nNNdJ4MYwE058qaErlQ9douS467rtvxghPQEsxweG84MVXqxZrAwvPDHRnS3?=
 =?us-ascii?Q?Hdwbervskt1D1TiikUTVPuOM1yRSzwYeufzYuuXgRl/ejkh6PZlsLFUh6JIf?=
 =?us-ascii?Q?1L778j6Ml5VfD9jTQLm+4TMLUYuoczir1OlB/u8yBNtHaVM3hLJrBBmXSd9c?=
 =?us-ascii?Q?fh/qjDhFcd+SWNzUnrn1Klk1DpufbUTmz1zC/X7Dc54oVe+pUcucbXY1zKyu?=
 =?us-ascii?Q?CV6yt8CQ2ohNC4fXoHYQrD+SN7/zSQgFMaAziuw0k7n32GdRX45/M0cwwhOB?=
 =?us-ascii?Q?5sWV6V3JKFpVh52BBoyEf5twC1oAervBrgOXJwcf18uxr1OzIm+knOiR9qrZ?=
 =?us-ascii?Q?GaB7xpsnvYU49WP8ZxFsfoVvvYveztBIdbmOz8U2MQHr19DpleINUvTk1nAS?=
 =?us-ascii?Q?5dslhC4y44vpsZU98XA633n0mLgxzcmYwi2R8geAfzNedxcjmlvQ+xOOb9/J?=
 =?us-ascii?Q?T16CjyppF67M13lNRxotlhPd9X1e69O4awB3YRfWWQj1glE2a8Dh/IlwXQ6L?=
 =?us-ascii?Q?iGAiKXQrvfboOXEXLN+qfj97XzTK9a8FF0HCMdvBRyFKlNSPKlsVpZL3Q87P?=
 =?us-ascii?Q?Aq2dXDWDvej9etoxOUcpJpJ4DrU4WXfw9mFQWkLwQJ+LYzWm01uthPE2xuf3?=
 =?us-ascii?Q?jY+rjgeoj3CttGuipeCeBqt8n/pKE+CZVfo+j/VSrixkKvOeYRBFIKjEKU+y?=
 =?us-ascii?Q?OJBSgoRLrsMor1IHLyC0zHIUN51J/Y7xUP/6hS4ZflRhHmPouXuqWOzPn6r3?=
 =?us-ascii?Q?6+njnwVEbJBs3Xn+U+zwZkyl7T77i+6vO93aLbHil51ugSHvuOaPnxgbKXnq?=
 =?us-ascii?Q?JplQe9hVMrkZcm+pJzDVsMWxFSCyhKHRLbz5TvLrYwotfbj2hA9AB9QBq/sw?=
 =?us-ascii?Q?zOt8HFIilwUioXA00Lje5aC5RvZeHVuvfJPOs0WwLrPEJoVOT7GRNablrC8z?=
 =?us-ascii?Q?89rh00ygmTA5ylNwn6VNgD9WCdhIpVX4AiTJi3wjC7E1mQTRn+qqvD9oTfjm?=
 =?us-ascii?Q?yBXtYkxMM48NlzZ9vNds9zKcKL74kZIJ5ZrAI0j6ZEakvzQfWT1HMmcN98k2?=
 =?us-ascii?Q?RQJpI+7McrUaRQXyFrv63oeFHXgSpr7e6Ck7XK+CQLuLh1t3N/y0mLVHSkux?=
 =?us-ascii?Q?zrIziCcljAR8Q0CQI1MmPqPZ1qUYKGuG0paQW1rMri3K2YHPtV2vPh+5xjEW?=
 =?us-ascii?Q?s5MG8sQxo6vIKLJiKtoIPOBhz/B0tYjcU/oWQFQpFlOVLHxg+gMvnMLfYP3i?=
 =?us-ascii?Q?UlzNqGR4IXkFABwHCKzaNFVQaGdx/GOAPV0aGq1trp+ZmaPqI+Zz3megP0wZ?=
 =?us-ascii?Q?Bj7pNQ+JCoFVjrTHAc8UA/aF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PHNMVpoHkowBxBcWWeMOHaxUY2aV6f/I+HrCWqZhP8NrbVJ/LHwFLX8+cl5r?=
 =?us-ascii?Q?BXVlY4AtKL5Ljrveb9UqvTmxGKKvotlSz0gwipeX8qQUOX7YNaKQgAe7Z9Mb?=
 =?us-ascii?Q?Vp23+JNH2JccFjBy7TBlsyZv1/htKad4VCqRIn/2ld6sdnuEX1NZ30uwcQRE?=
 =?us-ascii?Q?hTJ058yNkaDYtSu8W65tMrtv6I8efHx1aNSa6JxzA+9tFUIvUf0mJlWvROZC?=
 =?us-ascii?Q?sQTXi4hK8oTIP2HmvYTMYh8z1jDZtC/7umUi5iUmxnRMR3YEF/lCxjuJ2Gtj?=
 =?us-ascii?Q?UmcT8K8p39XO9FDdnLFg8eGQ0Mk6e7Zz113DHmW47El66mL+I32ttfRsOboN?=
 =?us-ascii?Q?CeM+wPPmjpa/u7/RtkOZvh25IkmXQRJzwxY0ABxJYWPRzFqzIGdz3D1YHYTL?=
 =?us-ascii?Q?RU8503mLXFiL8AlADVmNUaSmu+96ryF3TjNk1m9RfpNl4aNoMrCDhMQ6aZod?=
 =?us-ascii?Q?SkNPk5YIKyq8PY5xhIr4vMAtQMCQoLawCwt/HDF3pHtOPltql/vFPkojoIDr?=
 =?us-ascii?Q?5CkGO2475Zz/dt4gI6LZsi1Nee+Fxkbp4fOC61Go4iOvs8zPDaAFw6Cz8h0y?=
 =?us-ascii?Q?shWAedEJXGaSBVkmnxS5x6b0fRddfWcGlV9JwZjtYDSD7SgUBtBwwooY3MdH?=
 =?us-ascii?Q?5sTORq2H94Za+TVPSqaHWtkYnjlsLIUtPsCosiMHohIbqm0SMNCxklPcVmzz?=
 =?us-ascii?Q?HEIW9maAwPCqPg8F/rEil+6VSm6Mrt4UriWri7h63mbJGCSdez3FOSISj9Px?=
 =?us-ascii?Q?/jHhljBqQVx+agA0OMqSMTeNJu9EGyIwFg2LcfN202wIDyPLywQ/c040GcKu?=
 =?us-ascii?Q?HLbgs5RqCCYmFwHioTXGP1xS8CaRqX0LUhE9RHq1Uy0IBAnAQhirPr1A8BAk?=
 =?us-ascii?Q?mmDyvQaLyjxQk+FVOS6u8n0eaub9oY1/vFQBd5Ynqq/BbtwrjdyizR/HYrbY?=
 =?us-ascii?Q?4KykS+FN2d/4J1LSpod0iVWkSKmGLXBVRMGCmPFrEv1MB3cxs/DHXqdXFtyT?=
 =?us-ascii?Q?ZSWD5M0LrTkr7cm6c0S0Erg0eYyKLtHiqBzpYME7ylcx8qNJpuHWw6/MDDJZ?=
 =?us-ascii?Q?0n7qrGY09ynn6e1OR7k+p+4xAFbn8+iGXv6vzZS+kJTs6xwlZ6Db5eAsI4nT?=
 =?us-ascii?Q?C+FcY9/RANljgulgHYIQ5ZFw2+4RdVifoIYy/7VryJCbxpHNpvRqS0zrnL/4?=
 =?us-ascii?Q?2i2HaEZnuKfqrcaspFuqJlXC0Z0zvvbmRuhy/fkLDxtO0E0s1rWqwTYoJ/l4?=
 =?us-ascii?Q?OWGotoAiztMof2Hl/BLX+F5kPKXbOKPmQ4dLJSsJ93ilDhAIeRG5ibVymVdh?=
 =?us-ascii?Q?VN8eeBLp+0boOdrPJL1H454pjrLU+9D7Tpx09OfCQFvy+m22Vyk+6Mr40o6j?=
 =?us-ascii?Q?LOgmcRDec4arMpGXbLmhN7UW26na4va52QnmVHW912eoCJN1TkjLpHY+j6RU?=
 =?us-ascii?Q?SIcy3DIWX9RnQacwnXn7S1bXCM4jnSsQxBtmgId2ibpBmAOeN/or4zqcvYA9?=
 =?us-ascii?Q?03uKbD183xulOl7RF5ZszTcVL/KMGtJWYvtPXDYxIBFH3ud3L4xjmG4e98o5?=
 =?us-ascii?Q?LM7oZGJwEmuaaIHxlSM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852316e4-43e5-4cbf-481b-08dcf41496a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 10:14:04.3153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KD1+g/zReoOSekNx2Fgjc0zLLpZoudfqwq9g+1k9Sb46iQwVNeSp+OY9u5yyyH1P+lAVk3GwLr5KiRWbuDsXbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6890
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2UjTrclAI0vP50L17vje51kRbyPnpMtw9F3y/ludfw=;
 b=RxNVrKiIVBr0HcAyq/Mi5/asDKtInifS8D8peR2poLLOsceedcb7CKgN+7nzCzOIkdwJPEE+B1myRWecSgkU1S16/jMnhjEeKv4SFxvmlFM1haCv007tbK0VwxBO2zjZ60xz0ZHnvwSVP9ANE9FUoIiPZG9+RmjVIC7cDJkfmR4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=RxNVrKiI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: Re: [Buildroot] [PATCH 1/1] package/certmonger: add certmonger
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas

Thanks for the feedback, I will send in a new patch series soon.

> Hello Ayrton,
> 
> Thanks for your patch! Here as well, I have a number of comments.
> 
> First, same as the other patch, the commit title should be:
> 
> 	package/certmonger: new package
> 
> On Mon, 21 Oct 2024 11:56:54 +0000
> Ayrton Leyssens <aleyssens@idtech.be> wrote:
> 
> > Added support for the certmonger package (version 0.79.20).
> > Certmonger is used to monitor certificates and can refresh the certificate with the help of a CA.
> > In today's age, cybersecurity is a critical need for network connected devices.
> > Certmonger can help maintain all the certificate stuff so the user itself has less to worry about.
> 
> Please wrap the commit log to ~80 columns.
> 
> I think the sentence "In today's age, cybersecurity is a critical need for network connected devices." is quite useless in such a commit log.
> 
> > Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>
> 
> Please fix your Signed-off-by line, like explained on the libevent patch.
> 
> > ---
> > package/Config.in                  |  1 +
> > package/certmonger/Config.in       | 19 +++++++++++++++++++
> > package/certmonger/certmonger.hash |  2 ++
> > package/certmonger/certmonger.mk   | 25 +++++++++++++++++++++++++
> > 4 files changed, 47 insertions(+)
> 
> Please add an entry in the DEVELOPERS file.
> 
> > create mode 100644 package/certmonger/Config.in create mode 100644 
> > package/certmonger/certmonger.hash
> > create mode 100644 package/certmonger/certmonger.mk
> > 
> > diff --git a/package/Config.in b/package/Config.in index 
> > d4cc03dcdb..73efaae622 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2688,6 +2688,7 @@ endif
> >                source "package/zabbix/Config.in"
> >                source "package/zeek/Config.in"
> >                source "package/znc/Config.in"
> > +             source "package/certmonger/Config.in"
> 
> Indentation and alphabetic ordering should be fixed here.
> 
> >  endmenu
> > diff --git a/package/certmonger/Config.in 
> > b/package/certmonger/Config.in new file mode 100644 index 
> > 0000000000..9d0e112b5a
> > --- /dev/null
> > +++ b/package/certmonger/Config.in
> > @@ -0,0 +1,19 @@
> > +config BR2_PACKAGE_CERTMONGER
> > +             bool "Certmonger"
> > +             select BR2_PACKAGE_LIBTALLOC
> > +             select BR2_PACKAGE_LIBTEVENT
> > +             select BR2_PACKAGE_DBUS
> > +             select BR2_PACKAGE_LIBNSS
> > +             select BR2_PACKAGE_LIBXML2
> > +             select BR2_PACKAGE_LIBCURL
> > +             select BR2_PACKAGE_JANSSON
> > +             select BR2_PACKAGE_LIBKRB5
> > +             select BR2_PACKAGE_POPT
> > +             select BR2_PACKAGE_LIBOPENSSL
> > +             select BR2_PACKAGE_POPT
> > +             select BR2_PACKAGE_OPENLDAP
> > +             help
> 
> Indentation of bool, select and help should be one tab.
> 
> The select entries should be alphabetically sorted.
> 
> Also, are you sure all those dependencies are mandatory dependencies, i.e certmonger cannot be built without them?
Unfortunately, yes.
Like you said, Certmonger is quite a complex package and has a lot of dependencies.
It might be possible to make 'sub-selections' but this should be something implemented by the Certmonger developers.
I am just the messenger adding the package to Buildroot.
> 
> Finally, many of those options that you select have "depends on". You need to replicate them here. For example, BR2_PACKAGE_OPENLDAP has:
> 
>         depends on BR2_USE_WCHAR
>         depends on BR2_USE_MMU # needs fork()
> 
> so you need to add:
> 
>         depends on BR2_USE_WCHAR # openldap
>         depends on BR2_USE_MMU # openldap
> 
> to this BR2_PACKAGE_CERTMONGER option. And do that for all other options you are select-ing.
> 
> 
> > +               Certmonger is a service which attempts to simplify
> > +               interaction with certifying authorities (CAs) on
> > +               networks which use public-key infrastructure (PKI).
> 
> Indentation of help text should be one tab + two spaces.
> 
> (Make sure to run "make check-package" to find all those small coding style details).
> 
> The help text should also be followed by the upstream URL of the project, see all other packages.
> 
> > +
> > diff --git a/package/certmonger/certmonger.hash 
> > b/package/certmonger/certmonger.hash
> > new file mode 100644
> > index 0000000000..653ba1dcfc
> > --- /dev/null
> > +++ b/package/certmonger/certmonger.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256  
> > +1e66094ef4130fc15c8acf5abfca097c2f8f40f57f699f80bb14e9941260d473  
> > +certmonger-0.79.20-git4.tar.gz
> 
> Please add the hash of the license file.
> 
> > diff --git a/package/certmonger/certmonger.mk 
> > b/package/certmonger/certmonger.mk
> > new file mode 100644
> > index 0000000000..c6a9c179e4
> > --- /dev/null
> > +++ b/package/certmonger/certmonger.mk
> > @@ -0,0 +1,25 @@
> > +#####################################################################
> > +###########
> > +#
> > +# CERTMONGER
> 
> lower case.
> 
> > +#
> > +#####################################################################
> > +###########
> > +
> > +CERTMONGER_VERSION = 0.79.20
> > +CERTMONGER_SITE = https://pagure.io/certmonger.git 
> > +CERTMONGER_LICENSE_FILES = LICENSE
> 
> Please add CERTMONGER_LICENSE, which it seems is "GPL-3.0+ with OpenSSL exception".
> 
> > +CERTMONGER_NAME = certmonger
> 
> Not useful.
> 
> > +CERTMONGER_SITE_METHOD = git
> > +CERTMONGER_DEPENDENCIES = openssl dbus libtalloc libtevent libnss 
> > +libcurl jansson libkrb5 openldap popt libxml2
> 
> Please sort alphabetically.
> 
> > +
> > +MY_CFLAGS = $(TARGET_CFLAGS) -lssl -ldbus-1 -ltalloc -ltevent -lnss 
> > +-lcurl -ljansson -lkrb5 -lldap -lpopt -lxml2 -lcom_err
> 
> This variable shouldn't be named MY_CFLAGS: all variables in a package should start with the package name, i.e here CERTMONGER_<something>.
> However, why do you need this special CFLAGS variable? It only contains libraries that should be detected by the configure script of certmonger, so this variable really shouldn't be needed.
> 
> > +define CERTMONGER_RUN_AUTOGEN
> > +             cd $(@D) && PATH=$(BR_PATH) ./autogen.sh endef 
> > +CERTMONGER_PRE_CONFIGURE_HOOKS += CERTMONGER_RUN_AUTOGEN
> 
> Please use instead CERTMONGER_AUTORECONF = YES instead. Indeed what you did doesn't work, because it doesn't add host-autoconf, host-automake and host-libtool to certmonger's dependencies.
> 
> > +define CERTMONGER_BUILD_CMDS
> > +             $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CXX="$(TARGET_CXX)" CFLAGS="$(MY_CFLAGS)"
> 
> Why is this needed?
> 
> certmonger seems like a quite complicated package. Is there a way to easily test it? If so, it would be good to add a runtime test in support/testing/.
I will look into this but at the moment I have no idea of a runtime test.
Testing certificate exchange might be a difficult one ;).
> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
>

I will soon send a new patchseries containing certmonger and libtevent with resolved remarks.

Thanks

Ayrton
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
