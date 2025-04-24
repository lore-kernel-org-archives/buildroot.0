Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F741C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 06:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAE2482164;
	Thu, 24 Apr 2025 06:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBNIKHI9ujDs; Thu, 24 Apr 2025 06:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFCBE81779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFCBE81779;
	Thu, 24 Apr 2025 06:11:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4461BC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C754607B3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woSb0UFi-J8l for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 06:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2614::72d;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 263D060741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 263D060741
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2614::72d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 263D060741
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkItRID91WyBOz/P0WH6LJrUHKK4Splo4h41qJGJVuyk2zdlxFCd+axwRWrepeWxXINMj6DvzEYuwgv0PLcReqQhN6eZmSTB9snWH9i8dRa5l5tioQf9o+3zd9hidc3Rx8DHSrKK2ZTjWLrgqc+dMWozg95CISpZoVjnM4fYwriP63cqLkZh1fey4/PlPtsYGw3SPCvXj/NrK2s/J6qrJhHYXj3B0tB1WR1KW5JxpTIhx6LZ3hticr3kdqsrmTEuYchpKUXJBaFlm4puYIc4bb6zT6RAY7UM/xYJJWwPPUSDCgK2kvNTWW8Hn7B8o2oitrOSV5uIGYyW7HvlCe7i6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxHUxuPAn4s2umc9QowmcHVZWLqZfhaGrxVjG0iMmw0=;
 b=iQ1p5Ba5CACDjIiAEtriUCaRiX55LB5bTeJle46079A6SffJ190Gf1HowqYHrl65iOFBPtEScVFfXW+ryY6DzAARQny38lsrhKH0e2nn75+q6VBXu4bNZ7viGTLBMHR/KIvNpyLdnjUSTPtc1TCzBjlSy4d8C8qydzUDoQw0EASuUHXWXAFEFFPgBszGka3ZSPrgBkP3c/C5ovgPiECSo7JR31Yzd2F4gcNyi1Scu/CHweEM5xbHzi4eE9S47hBtifdZM8tssyEy9WIV09/jeCeXPhOicrx7MryQWjxaR40oUun80qKeRu6u0K46a4jwBds6WVFCIpZH1h85cY659Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by VI1PR06MB6752.eurprd06.prod.outlook.com (2603:10a6:800:181::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 06:11:27 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%4]) with mapi id 15.20.8678.024; Thu, 24 Apr 2025
 06:11:27 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Gilles Fouarge
 <gfouarge@idtech.be>
Thread-Topic: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
Thread-Index: AduzjwUR7RQGYSXVS0GUpWsf/XCeEQBCmpeAABE3HRA=
Date: Thu, 24 Apr 2025 06:11:27 +0000
Message-ID: <VI1PR06MB8926D3F9BF282F9072C81811AD852@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89261C88ECA6A6ACC6D9FFCCADBB2@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20250423234823.75225cab@windsurf>
In-Reply-To: <20250423234823.75225cab@windsurf>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|VI1PR06MB6752:EE_
x-ms-office365-filtering-correlation-id: db3feef6-8e9a-4f28-cf2f-08dd82f6d905
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gqB93FaxhlSHAHsCgMGctnX0MwYOS3fLK7ju7tzuMEBlqRVx840kBOR8VUHi?=
 =?us-ascii?Q?vmbxJ9gBfvYs5RTDaL1Rgv+mNN4Vvw8+TMnl6sl4pwRRfKSIBYxcJ1nU5A8I?=
 =?us-ascii?Q?un/AKtPwVDUwTkaNeQJYXyBa5kHRmFAYjX05l93s5iwuh6NoYAzceSYmN4Ds?=
 =?us-ascii?Q?jtyw9HWh4RGv+TPKEaBBJiRj0uqWoQQsL6Hs5ww3eTludO43SzX/aOEQz0LW?=
 =?us-ascii?Q?BScvF+csP+MSk8Qhh/sqA04+RVJ+z40aqgSL4hEwjY/cj9IwBwZ8dXznEEIp?=
 =?us-ascii?Q?8VlEok1U4bX00DE9GdfTYYfg+nf1oKyE6p7efp78Jeir740uhzpR/8xgZ+Px?=
 =?us-ascii?Q?qO4EkqbyykWFYuBVvJuSPS9AWnjYoUjbHX5GyTsfsMD9aSuHNaK3pkJKnyxL?=
 =?us-ascii?Q?hR7a+Fhy1wPiLv3RCMDPIK1zmJSNtCuJ1CWXn2qjngx+CFVYZrdDpjAxs4az?=
 =?us-ascii?Q?eOeKAuaxMVfmcAnNGqxnbb8d/vmzph9jc+cpJMjqieNminrWHUZVlb4TuZO+?=
 =?us-ascii?Q?mxtSR+1WStsoU1ZdMz7dMO6mCr/1BJQi8sPLvLs+LTZSyEjoUMJrNbSdFpUB?=
 =?us-ascii?Q?yZbMEi0KYc56Kg10LscJSooZJgULR0Kgb9S3h6XYanok9jjsRxBDraA4AzWI?=
 =?us-ascii?Q?8KK7JsqK6kIeGru6tXbSKnNHULyVJD83lZh0BEzuGowQy492r9pqC0bJanRG?=
 =?us-ascii?Q?wwDUmT0unjsryeWFz4SHk1ilbsO52IpXauqrWtd1bPhg33d2tkaHwTTF1r3i?=
 =?us-ascii?Q?Q0MnlxMuozDB0cwto9J6i4X6E758oTyjcVAY8e/yv++SOVDVsveomxeT0MVP?=
 =?us-ascii?Q?03P69HG1soexNhU1y5snNOINOpspLGzo7FKbAEz74M0JV8kodBwFM59v+OJk?=
 =?us-ascii?Q?P5t55awJF/4HiFfEJkb6HrgI/wGMBDCJe6pYaJhr6mvsaPcZTBrgozri+5eR?=
 =?us-ascii?Q?wuwsqLe3WLlDZGMgm+Cgg2ihHQP64r/Q901UiUXDs7YQRA9TqDegn5CqMQWq?=
 =?us-ascii?Q?JEbsCRi/l4SYmmvAimUixCVQuqOMEaIymvSmd04Tne9hIAbph3vgxahDPF7e?=
 =?us-ascii?Q?FjZPYO6rwiaxGAZty5YRXV50BiKDw+PXkmfe+yCSdrTII3vU00cWCt1HmgQw?=
 =?us-ascii?Q?kKFQueOdRyJjwrhGNxhtsH3DbA842kGCc3udhSoG4B8nasa+csNWvDe+Xq7j?=
 =?us-ascii?Q?UPulTix9lIa1IP78O1RNdqThGeiwKFdqgAEC9aM+QqAl4Mr1f4Skv94Dj0s5?=
 =?us-ascii?Q?aEvkkpptmDbJnrVEYZTGqT5yVLYHv6i4QMiNs+gPOOr0wNfFdISRCfG7nmvT?=
 =?us-ascii?Q?UoMexeOHbKrDvzLqvE7KER8DlHUUGC306LTQDBeR6b5j2ib+5WEhug78o6bo?=
 =?us-ascii?Q?PzjUBIjdhgtjwsNAntELTd+QVgJDqYm7nQ4wX9tHrfRYzVKvEf/JxeYBlR4b?=
 =?us-ascii?Q?aOCW0TEJFpA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JMux/l5sWlP3MM7jpiCMnkOZNm3kM+xhqZ+xXl6gwgyCOMMxG1KdZkfln1Vp?=
 =?us-ascii?Q?0wXgsoagrLWPYXEpOIF7sx/IPMjvAcd/a5HJItZ5Sfv6KxN0EMQTfM3esJXf?=
 =?us-ascii?Q?e+hvk35y5IEPkRz1c10uf2Y0kLv5k4H7fNJmpLZ0VAeVKutzz7DOIESs459f?=
 =?us-ascii?Q?/1DbZoslAWjvst22USPSQUjAvqgqJZv1TmqqyQhNPa6sAEPOPya4AT1RqBBb?=
 =?us-ascii?Q?FCkiLUEytK7bqnDMKvdcXPgjYMMNhYdOOB6MD4z5ZiTnB0GYigQQ0zofGEDe?=
 =?us-ascii?Q?6gZgLnR1zVBZcOSSPs0Kc4cnlezjzW0ewcSMLylqIInHfSHolfRIGxoqf0hu?=
 =?us-ascii?Q?himrPzWoPZlhOmuT7bBVUjl8VJ06KS+CRteqfSKjHcrznhJ9PwBesPjr86d8?=
 =?us-ascii?Q?1dzz3np2IgiNpsXWpgQI/1FjzxDNu5z+ywZRB/1cSInoMzIj8SEL2CnnW0uK?=
 =?us-ascii?Q?TefsXzDmvYZlSr0NwdALyHoB0s5ey/VodC5A1iebD89myefqFj2u82hYNXg6?=
 =?us-ascii?Q?9fpiUiKPXWLsscwt1/FY3xFUL+jqWPrYCgY5yx/H8m7LqWzwb+MKZUPMCM7r?=
 =?us-ascii?Q?3FBPzsGBKzyU1KuX9EAPlZZUXaJihU0KaNv+TcsUQLDXCxAjvOLU8e78hnkA?=
 =?us-ascii?Q?Kz+ODIVwUssMYyviT46VEku6crebwRLSq6hEHBjhYIsjcgGGRsLS99IqSd1D?=
 =?us-ascii?Q?Y9d6B6Lji/5TaUyNJLkFOhNmgUr6ywlUIPT0P2x1JbxOHrhbMtIwR7TGuzOF?=
 =?us-ascii?Q?7Fq+46k4QwfcEeIrAYM21ch9dgOCc+8N6T0gQkTvEy5nCaWa6WxvY7kEhrP8?=
 =?us-ascii?Q?6u1P//6G8PrfYABQBbCLajiRZ2q4ik8vm8B7Kj5qHese4gzTw3z+QMbKyrxB?=
 =?us-ascii?Q?Hl1p2/4Ga/XGQH0EedyR1fZwFWtxuwhSC5goUNN3Z9D1UlDK90I5hIjTFTvx?=
 =?us-ascii?Q?vombkc8dHm87m5iq+xpkI+5b13vJMlyFaHqRQAFlNI9P/7RV6gT8X4fQ9nLg?=
 =?us-ascii?Q?xnoFavkQIOc1aehm0QKkq3tNsBnjYDIXmNdooPWRkdzAy9D8kkBMxyYbrHbu?=
 =?us-ascii?Q?BdF7cNIKk1ucAkE9UOZwZvci73LxvPoX7lVINQXtPqaJwGc05J9lD2n91+87?=
 =?us-ascii?Q?E+CxV/D8craQ718nTLOVaoyTWSZVTSnQasE+98cuxEiDY9K0Ylm7urGuFios?=
 =?us-ascii?Q?qsQlKPAVMEweLuc+fnOvDs3sNeEXcNdDOp4Cq9HhgGHNYRevytI1VWkYmVLZ?=
 =?us-ascii?Q?E41+g/GfSMH+g6SYVACPminTaOYu3Meok+UP3UVIX9ELDnnq/W72I7UevmOo?=
 =?us-ascii?Q?4Gr8gQSALYenxiUvCxyKMFIH7HovcFEwDjCF/dXlNs8VUL9u7tNIk5Nks+F6?=
 =?us-ascii?Q?kv5VFGETXqTR+MPoXtJ4e3TbhNKzReC5E5RGLmDTNd7wD9WGKA/rd8YNdP07?=
 =?us-ascii?Q?5obMgyB1TtyTUQuE4WTdR1HfhzPn07dF/NYHEsDGtHRSqAqYfCWUmWDO+QLl?=
 =?us-ascii?Q?mCE2v/oASxmwUusve2g10lSR/fFGMRmQ6UMIbCfBD+00p4DEzZv+ut1Y/UJ3?=
 =?us-ascii?Q?CzDUACMMillTvdy3FbM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3feef6-8e9a-4f28-cf2f-08dd82f6d905
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 06:11:27.0822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdxBDrM1QsfP6aGFXWOncmeUj6t5aUNnDpgX8ikR7QzPR+IbG7G341L6ORddIsIxyOxUFlPwesY9coPHPcUeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6752
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtech.be; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxHUxuPAn4s2umc9QowmcHVZWLqZfhaGrxVjG0iMmw0=;
 b=u8D28Co+qEGNzFQrhtj2ClrjQJ+y0PX0a0g9kutv96jNxq1jfVJnIDaGYaRssubvK7edy1/Fp5/zuGDdCLf69kaOBrbWwlGJrxvIYR91ven2ajoRUzwdmVALMqzgxK8xS0CF0DjH6ScTdsDqRfeipGt7x2gBmxAr6RutETm9xSI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtech.be header.i=@idtech.be header.a=rsa-sha256
 header.s=selector1 header.b=u8D28Co+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
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

The issue presented when we were debugging Certmonger (which I still have to send in correctful).
Same Cermonger version as a Yocto based reference build.
So, we looked at the dependencies.
When checking versions with 'strings libnss.a | grep -i version' we saw version = 3.108 (debug) (while the reference has not).
Going through the docs of LibNSS, I noticed that the make target of LibNSS is not using the default passed make arguments (like -O2).
When passed no additional arguments as defined (https://firefox-source-docs.mozilla.org/security/nss/build.html ), it is all 0 by default.
So goes for the BUILD_OPT:
0: Build a debug (non-optimized) version of NSS. This is the default.
1: Build an optimized (non-debug) version of NSS.

-O2 disables the production of debug symbols, but the BUILD_OPT var has implications on the source itself.
When in the so called 'debug' build, LibNSS discards all variables / sets them to NULL if not all arguments are passed to some functions.


Ayrton Leyssens
Embedded Software Engineer



Rue Saucin 62, 5032 Isnes, Belgium
Phone: +32 81 55 46 10

Discover how we Open Doors to Solutions
www.idtech.be

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, April 23, 2025 11:48 PM
> To: Ayrton Leyssens <aleyssens@idtech.be>
> Cc: buildroot@buildroot.org; Gilles Fouarge <gfouarge@idtech.be>
> Subject: Re: [Buildroot] [PATCH 1/1] package/libnss fix buildtype
> 
> Hello Ayrton,
> 
> Thanks for your patch!
> 
> On Tue, 22 Apr 2025 14:01:24 +0000
> Ayrton Leyssens <aleyssens@idtech.be> wrote:
> 
> >  LIBNSS_BUILD_VARS = \
> > +	BUILD_OPT=1 \
> 
> Could you clarify what this does exactly? Indeed, Buildroot already passes its
> own optimization flags in CFLAGS, based on the
> BR2_OPTIMIZE_* settings, and we clearly don't want libnss to override that.
> 
> Without your patch, when I look at the libnss build, I see:
> 
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -o
> Linux2.6_arm_arm-linux-gcc.br_real_glibc_PTH_DBG.OBJ/tstclnt -g -g -fPIC   -
> pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR -DLINUX -Dlinux -
> D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -
> O2 -g0 -D_FORTIFY_SOURCE=1 -Wall -Wshadow -DNSS_NO_GCC48 -
> DXP_UNIX -DXP_UNIX -DDLL_PREFIX=\"lib\" -DDLL_SUFFIX=\"so\" -DDEBUG -
> UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -
> DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DDEBUG -UNDEBUG -
> D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -
> DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DNSS_DISABLE_AVX2 -
> DNSS_DISABLE_SSE3 -DNSS_NO_INIT_SUPPORT -
> DNSS_DISABLE_ARM32_NEON -DNSS_DISABLE_ALTIVEC -
> DNSS_DISABLE_CRYPTO_VSX -DUSE_UTIL_DIRECTLY -
> DNO_NSPR_10_SUPPORT -
> DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES -
> I/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-
> gnueabihf/sysroot/usr/include/nspr -
> I/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/include -
>  I../../../dist/public/nss -I../../../dist/private/nss -I../../../dist/public/seccmd -
> I../../../dist/public/dbm  Linux2.6_arm_arm-linux-
> gcc.br_real_glibc_PTH_DBG.OBJ/tstclnt.o  -z noexecstack  -z noexecstack  -z
> noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z noexecstack  -z
> noexecstack /home/thomas/projets/buildroot/output/build/libnss-
> 3.110/dist/lib/libsectool.a  -
> L/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/lib -
> L/home/thomas/projets/buildroot/output/build/libnss-3.110/dist/lib -
> lnssutil3 -L/home/thomas/projets/buildroot/output/host/arm-buildroot-
> linux-gnueabihf/sysroot/usr/lib -lplc4 -lplds4 -lnspr4  -lssl3 -lsmime3 -lnss3 -
> lpthread  -ldl -lc -lz
> 
> So -O2 is present (from Buildroot), and the -g0 (from Buildroot, by
> default) disables the production of debugging symbols which are apparently
> enabled earlier by default by libnss (using -g).
> 
> So from my perspective, there is nothing to fix, and things are working as
> intended. Could you clarify what optimization you are missing, and
> how/where you spotted the issue?
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
