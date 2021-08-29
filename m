Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F1FC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DDC6056B
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 22:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6DDC6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF46C60600;
	Sun, 29 Aug 2021 22:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LZ9imslRNzr; Sun, 29 Aug 2021 22:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A56606BE;
	Sun, 29 Aug 2021 22:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57FDE1BF94B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4183F80CC3
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 22:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="CVeSRphT";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="AkJMEta1"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KruvGzBjiRS5 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 22:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33F3180C9D
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 22:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630277052; x=1661813052;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=SqbIfEHCYoOuBhxwkW4Bxi8PhbwiO2LUzjKYBXMBCEQ=;
 b=CVeSRphTT2HUcGdgYRAknvfk7XjjOAUvMKuQwRw25D811iOZaQGllxw5
 vPyOWlqwMFmOvJmOzz8V4IHJn7d3mTrgsbBBCI1MC29q1AJgoUecliDpE
 YqA0s8YObu2igOW7Ll/wC6Sage847lWgpk9f4b9YHgEdVLBqLuJU9nBDc
 SblpHQ4KdRK/CIK2fTLusoPLuxksPp4g+ZFJ014oxIGDfBkI6F3ja//GB
 CQJ7BFC37YNylKXF9iRQe8GJPoY891DjcwHIby3N6bL2jl8Whsu+s7irP
 KYjBeEM+mvYiejifh4K9n4RZ/jjivuBDXpC3wTHUhjV6NOKp5LQJ4Cd7R g==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="282504369"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 06:44:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIEtdN9Sxh+pCUwt6ORcARZxujsfP79vpCnQf1u1yK4Q1wQYLpTX8yo31tLXeMYRn4U/tMSUAex0yoaq4E70Q7l013iGfaU2kKAUFgkLSi4fl/9AKZTn7G5FRXDIc0UDFam15JPH8uiPuj3IEteXg3d5gnG9pEvtoW0WylvFyi6tu/30SNwF7lSBTARKg7+tL75RCPfT8mibYwW8pex0i7L0pnvQF+RGIothqPGaLZeHBrKLjq7QyG/zvZDWn7Vsa++lsDoHUmKWUOfpPFHaBYbmTYQCvWTiolNOuO1hHPFaPbuvz3+bR9BNLA2yPgD8aykQYvGY3NMtw/TtYNCNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqbIfEHCYoOuBhxwkW4Bxi8PhbwiO2LUzjKYBXMBCEQ=;
 b=B1FpzTelUnUcT5dGzs9GuEV641TsHiIIpEqKevS8mQRfDBS8F6dWkWQFrPAXY3jma+z7FQw79+NTuJY3x+rGRKjG43TlABDN1xOw6Z3eEiEbjfgX9h3r8fXXFF2XijJG9dhZO3DlIJkBVr2rlw93LglXujAtkMIbfIThmMe3wxPEXSQPR24Jq/EhPDAH0ceC2pr8k5OuYpAZA2gMcB3TQXelWaLQGhHPMGVyS6VADg2zvdmS73H+iKjU6mmvEj2dbpK2N5fksavEfwEzwFaGyPOXFvtTjW69bZ5zEoaMXCFnURBZzbFsmPAPBRyNA2n1z8blFeOqG8NpebkCRR3tyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqbIfEHCYoOuBhxwkW4Bxi8PhbwiO2LUzjKYBXMBCEQ=;
 b=AkJMEta1CUt5/cvu7wt3q570gAtIBXFu3Z4p9N/0ixb4t6liOiFabYW6mNxry4EpZ12/c+WtSpEXHBPD76kV6jaXa/sTzvIGEkPxl1J2W34uX5fo0ptl3WjCCzUDafZPvLY6IZOV1XrdQ9K6/rGzS3OlD2mv891pbEVNkeFH7+k=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB4474.namprd04.prod.outlook.com (2603:10b6:5:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sun, 29 Aug
 2021 22:44:06 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70%6]) with mapi id 15.20.4457.024; Sun, 29 Aug 2021
 22:44:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 0/9] Add RISC-V NOMMU and Canaan K210 SoC
 support
Thread-Index: AQHXeRNpVU2a2KhQ5Eq7PKb+9hA3Wg==
Date: Sun, 29 Aug 2021 22:44:06 +0000
Message-ID: <DM6PR04MB7081F43ED2ED993455564AF3E7CA9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <4bcbc59a-0294-8cc8-0138-d0cdeb1ada7f@mind.be>
 <DM6PR04MB7081A10C9989A566F1A380DBE7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
 <20210828154841.2af7c8f7@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a5ba0ba-8680-4c5a-95fb-08d96b3e8203
x-ms-traffictypediagnostic: DM6PR04MB4474:
x-microsoft-antispam-prvs: <DM6PR04MB4474E3EC9974450940AD8BB1E7CA9@DM6PR04MB4474.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nVt1sMTZleHFWiy8e0L8aZBsRPgUkxZuHsNxDIGrJ6DZP+ShUc6SC9rEaYeLAnhbZaSHMCEVy8UNwfPZec+mM7XhUNQMLfNehzFEygPkEudsvqTVNe9P7rea90QzcPOITqqVQ7Bt6cCQCZLvcQyToxVucQ0DDKrGE/1FbDSObNILchLuazwmZQT2xJQW9r40roXsJnfFP9ncfNc1gAp4G/eliJnU/6rUJQ2Z+GDOVFkHf1jT5hBEDWiJ5SKnla1hv0obfCoxp1I8AHtvsvqHVXkwPkjZH+8OfoT4eenzsxsi1aruDfaY98lCIsxiKzqPzOA64xpsTgSY3voaBeIXgeMxjCA0dYEp73mjlYjCtm1uAffnY6v2cTGLYGCPM4eIPb/X9eiJDq44N4G3PYTF2W0wN6GppTl4AyZ6HvQEfiMOaqUHuhmtIm0rXm5xLNJeke4WEgYC5oyolgSoR0J9m1/wQQNoXjgEFES6hwQt56qJ6JcPpjvGNnTGmLBdYrIBubCbVxj9bhJ0uN6njPhb4KV1t4xhe0KILKTrZcSksJIba0mMmAYOHs0d4gSHJjStsBQmetGd3a4AsjPKpfHYVMYNAn0wM+YpH3XG0Bv/H0ooUV944vQbyQ7nNuSsSs1oLE5ARj4uN2DvVRReb2PS2jznMhSGQOJYJt308DJA7tnVUOaX9tNEzTjok597BpFT5/XHll8FsvlSkzRQ8oNEvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(33656002)(4326008)(316002)(55016002)(66556008)(66476007)(66946007)(2906002)(66446008)(9686003)(478600001)(186003)(52536014)(8676002)(4744005)(76116006)(91956017)(64756008)(7696005)(8936002)(6506007)(53546011)(6916009)(5660300002)(38070700005)(71200400001)(38100700002)(86362001)(54906003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qu6ozquvFtZv0kgXvO3AFgCep3VThSVDw0b7gmw+2K1/wU9aSviw7H81Eimv?=
 =?us-ascii?Q?Fw0jWWmRz21jBk1Bxi0t2qpnlALNLwJ5Aqxrf78wIw84IgSRo8X93Sc3Yo4w?=
 =?us-ascii?Q?EffYLlwO+jaOoHXejukwta9/OWWcbAyHQ7S73geE8bAGlxdmKm3INA5WxufL?=
 =?us-ascii?Q?Msv0KAfh96XDuJv9qVUbm0EzTFtvjhTwnD7F5HCkr0MPvoT/hltzcWjuBv8W?=
 =?us-ascii?Q?UBy2jP3NKPnyyl+Q5GwgAM6fiYVLTuyGUdjo1d+Lf6tjvCm0XkPEqw2P3Dc9?=
 =?us-ascii?Q?MQGPDReq+5UmBKl0SWZKM/oq7EB2+K2HsSPVicllmW8S4QN+sSed9h3tIeRk?=
 =?us-ascii?Q?BxPSSztYic2+k7OL3wbWX47dXBSQcSWtSsxqMzleNxWXJaNLpoGjkVbB3RxK?=
 =?us-ascii?Q?xbVGc6ZuiTuApvcAaidRFQ/NzlGCHzIy18YmhawCGbWDxriuN47TWIcGux5N?=
 =?us-ascii?Q?L/KLA39SMDVIf0RTmBBPAfcx53ro++DuNoMkGHe+zWAwD3VIz/bazIC6hf5G?=
 =?us-ascii?Q?eOZrIGpGGSJCyhP1AVN0QSUrSkPZTETAMgYWRJYmWuTl8QtUV1dE2CghCjPT?=
 =?us-ascii?Q?b+VcaArmcN7obWYI+JypGjRMdrx8FCL9dpwwcXBrPvl6y32WukjvUNgX1+Oi?=
 =?us-ascii?Q?QTMRkotDjcSekvjlgbfcbyBYUYjlmmdoUvLIp6nHQe501LVUfrRFUcQz0ytG?=
 =?us-ascii?Q?DKJFXyGZx4ve4nlL4bDQXYToafvj9aqNNPUzTmgxA02f8HQZaFPKQjPPfJ7w?=
 =?us-ascii?Q?YYSMdWoBiyMDUhSq0jmGYkrjvomz8Yg22kZECp/ikDlabenZ5hamuZ/ea/+p?=
 =?us-ascii?Q?T+4vont07y2gkDBXauA1GdwZEgszQ7R7j3esQGKCs4l3k0ZlvKZM3LqbdceW?=
 =?us-ascii?Q?W8g9rugRkW0F4mh8k6NIlVZXD7jlVx8TslgsWOMN8pdzKH9CXEejorFG6ceJ?=
 =?us-ascii?Q?0jDUM1d1Y/xDFCRPme65K1MTLMSOKZvXySYUuKSw2dQFI+si9ge7O4QkF5VY?=
 =?us-ascii?Q?IrwHt8mrJLGzatVLA7gS7E/BeljutKkKeiPxPhCHrL/uuJc5bO7Pb/Q8G3vI?=
 =?us-ascii?Q?vojcEZ5Vo4njbYYf4JEAMxcI7VOaa+iS+uwJDAOIFCeFiRyWPF/bhzuZ3rxO?=
 =?us-ascii?Q?EC/ocIq9L0+4a9pVBufOfFsOgNc1yhwO7fWza3frSVykdt88748IZWzWWX8H?=
 =?us-ascii?Q?WYBjWJ0sIaH+w35An0YHYAGJRIxn2pQQBP+b4+jsmoj4RuggBGZRVEYEj2AJ?=
 =?us-ascii?Q?xHTiiCsT6lYPRpMaVi5S+b+N9nJZobfuOx60r/3y+dtz4Xo2fDrF6Njyp2I6?=
 =?us-ascii?Q?/bNbLmX5txw0Gs8cHrwXrWHYx9dKqPO0a4bV6pbGTtDAXnc04Ud5og2uEyx1?=
 =?us-ascii?Q?oknc6SfkrCPLi/0OiM3sYc6cVwNnEk68tfzdEvO7kU419gdsAQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5ba0ba-8680-4c5a-95fb-08d96b3e8203
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2021 22:44:06.2445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7Fprft6xQ+ldqHLD3zvIunsbPbiE3j1Slj0kNATtCXtrZxP9Iwiiezpdihh6btVvbdJmPjNAU6nmeXYC8K5rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4474
Subject: Re: [Buildroot] [PATCH v2 0/9] Add RISC-V NOMMU and Canaan K210 SoC
 support
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/08/28 22:48, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Fri, 23 Jul 2021 22:40:40 +0000
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
>> Thanks. Cooking v3 :)
> 
> Did you ever sent the v3 ?

Yes I did, on July 24th.
I can send a rebased version on the latest tree if needed.

> 
> Thanks!
> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
