Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F00AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 16:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03762408C7;
	Tue, 11 Jan 2022 16:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4KtrWMLbsfv; Tue, 11 Jan 2022 16:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E34408C8;
	Tue, 11 Jan 2022 16:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21C081BF842
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC5981349
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=sandc.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5GynDcGMJnH for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 16:01:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::70c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 153DF81303
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 16:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0nJs+79evIFydQN6pjqsqlI0oE4qfrRhGFKEaJgCPbUTNdP0Z1doOWSyhN8NmSpOuv3Ic3NcYpZvq8Ut4IDXknncM7wveu8UUU7EasaOIFoXd8KlQv05W5fK7YfuNK/7wlLrSi+mhGENgoT1d5nr/YgiRYKh26xOAqozRKAIJKJs2l80I9OghqSoD7x84IdrikOPOCkvDJ+rv6uiaeoFVEifI9X5gyXoDKVjxBRXHdsfB5zVQAheWYf0SZlE2PuI/18B7mvW4a5uyDpJNd+LG4s55cQBi3kxDVuiobcJwTmbQshq7ZzBZ/NI1+CTTaWL8LrDhx1XB/jHU5IIhIB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NZ7fXwufyk0U+eBvD+CTcreE+pXED/jnAEhh878e2g=;
 b=Q+5V4N1symVaoPoW0bfePKT8vrXLctx1GWTOw8Psz7YZqF9OVXYoBgnrwJH5yjvunKjwYVM2RYTu5Yo4hCN661dh39cvZxdCsdR999ynaEpbNDtHpdHnHUPxDljPzeEpC5KXkizMz8sgVtkf8AFFqLb/ntB1phJMjJinvDgNX6Ufwmylhf7UFou9kaLoBjgICE+w0iszZfVOxoptN+xpMjbpm0OXcB7EFyscgVnwhwtqdVgz6GQ1oIZqmgZqLyTH9BguO8h1GNjshrgrKela+2i55tY/Luzn6acKKozQE35Pox8Re8Kkfl34OVHKSp4uryY3A9Je0wGo5AxsY4blDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandc.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NZ7fXwufyk0U+eBvD+CTcreE+pXED/jnAEhh878e2g=;
 b=cVZXEyNVDf1N32wOw2VQkReVA7zhi4VIeGg8NyRo7WH7ccES4YoyOFZxhZb6lyR41fJDkBenA9MSnY6dswuDza9StpcQ6Kj1YPy9NCwwwY0UYb8V4f+U/LtXo6Y6LDQsTJ4OE970U7lQr55FQRjkqHdQyJ/Pw9px9sN3aaBl8z4=
Received: from DM5PR02MB3291.namprd02.prod.outlook.com (2603:10b6:4:66::11) by
 DM5PR0201MB3432.namprd02.prod.outlook.com (2603:10b6:4:79::36) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 16:01:42 +0000
Received: from DM5PR02MB3291.namprd02.prod.outlook.com
 ([fe80::20f1:fbef:b95a:cb33]) by DM5PR02MB3291.namprd02.prod.outlook.com
 ([fe80::20f1:fbef:b95a:cb33%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 16:01:42 +0000
From: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: creating packages for opkg for buildroot based embedded platform
 software
Thread-Index: AdgHBIFw3r1byiMiSuG8MFlo5LpjHA==
Date: Tue, 11 Jan 2022 16:01:42 +0000
Message-ID: <DM5PR02MB32914F0603DC48BC02D1CA328A519@DM5PR02MB3291.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d787698-df3d-4366-80e1-08d9d51ba936
x-ms-traffictypediagnostic: DM5PR0201MB3432:EE_
x-microsoft-antispam-prvs: <DM5PR0201MB343236CCBA0C9E04D85511098A519@DM5PR0201MB3432.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XhWmK3tbLIvSUCnJTQsUux+ICXqgsRYLGjdSMdp+vZRhPrhvpbQWJDpJTgtn2GfIEugGd2RVLtVoZcJAn6vca+EyKA7Qx6uiVBqx0hpuNemyXOgQ+GRvi4LjKoO6DM8mACTEK4TJFRzYUJrK/maWSlIa+H86RCQtRSYkEjLTs/mq3aEplMZ4n9mHbrgZrB+SEdRVLCSHTU6If/1VkPp+68JhrphauxDSuNDC/KtM1SAW9GnnJEpdIQ0r5s8vvvlRpUMiNVs3pANJWEp2mhf4I3wSb32oRHyDuGtDFNiFDJNkCS7dbKg5h1Etnh4a/NZcTmAIQ6yAUOg6CtrILuowVYmhhEccywP/TFgrrtL+KI+XTVno/lvBlcrHfrrWQKdL4/CLSHnBpDPdoiR6eAbzJz4stFTXhNq8Cx4srOVF46srN3zYE30SBjz1NlCaDt06oKR3s09d1UoePkqAlLD4G9QOzw+xtX+1YceX7ajlNSEBKuG4ec88G1nfbrox5hy6zKgOAcAo9Ysh13otsQ9hO9mGhWZ/h8i7xqkubzaMz/OFMxZeFaUS2fPFImi/zEd3xKzE44X80isTnyGlCz/83KOx+qISQtzOVJCm/zZzwPUo1u96y7Od6rlzYCbUQFmWY9hWoFDPXMEjsXeYc6HuDiar+yhu5/5UDqsFN4/yvNaqpM0jYg3dIUS3hjYfwariSzSWBFjcdm9h8RCUadoVonsj8dxdGWVgA/Q2Lo7xPvJZ+TX0KfwUtMvlY8dbOKQCo5nCgqPnJR0/FvKl8xXQbaJPgChJIaQf50maPMBnLqM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR02MB3291.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(38100700002)(38070700005)(33656002)(52536014)(86362001)(8936002)(64756008)(2906002)(6916009)(7696005)(6506007)(26005)(316002)(9686003)(508600001)(55016003)(8676002)(66476007)(186003)(5660300002)(966005)(66946007)(76116006)(71200400001)(83380400001)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jRhRQ3NoKkGwSRuWjpGGK4sf77HkM18F2W+CuJPGVDDTq2Vxh2jlrI+MdG08?=
 =?us-ascii?Q?12/2UNCO528Ven7CSn3yNmESR+bAi2LUJGcWQN73/P8uMIOuSPnHbWCq3D47?=
 =?us-ascii?Q?NvgPPVpewl0xJ8mzyYwRdSMfTM5x0g8OWGdba3N8F7dCRWPZ5oXh+WKyJuNT?=
 =?us-ascii?Q?b2wXZzAVLdtK0X/3AWktO4pnqN2P7SQk/c1CQtaOjvlHVSWqnTsL9dkOnDht?=
 =?us-ascii?Q?ipStm6RMDAMCph26uasH6In7ZocSX/VVl/tRc69Yf67wGEhZ6kQ1huSYirTO?=
 =?us-ascii?Q?ARerlumUaVU6Gb8Y5sQQdmWd9Qg0Y8a8fg0mtwhQSwaChe0YxcYv14rLIUhi?=
 =?us-ascii?Q?6FIB2dlzccwP/unBqAte8Cpwv77hcvpsuoN1HOIkzLomKAYbGSZbP5+CZzKR?=
 =?us-ascii?Q?rtn59D7cAhoC4DGWChabntOXxB4dYq+aLsomi3MAdVt3pIXJhYL0f7JnWe/s?=
 =?us-ascii?Q?7x3AFkdIOnu8WoKBf4IcM4g6D/Z5q41mN45IvnqXWXxwQiHzgzA0Fqq7Shel?=
 =?us-ascii?Q?qPKLQy/NEpxZRtxIPFAF78SUSlXVOGi+Ntd4g3nYoilycDsTkzhMBtoM+sZC?=
 =?us-ascii?Q?wPXjfmDxWBag4+cwgDFVfR+rEz9J89JHKQpb7Pqq5qQ0bT2oNo6R18YyAVcE?=
 =?us-ascii?Q?Ce0lUv2nYJ+Xr6kLIgGfJLAUkY8IOsvTyOnD9k2FgMXd1YiJHNOCxHPh3/k2?=
 =?us-ascii?Q?5o2dStPrvLQtAbY60+3Csa/+8lQ6IuLuda0DylO0znk1iung4mVRJhs72NSR?=
 =?us-ascii?Q?bGGK1oMRUvUBHFxplKBCED7a5V95bPMyIwVXwcP8DhKaAK0GLWcW9Vaw+Lpu?=
 =?us-ascii?Q?56JFkxkykGZE5j0ih3r+GiQs25MVGwm4Yhf/JsqfVNgb2FGNk4GcZc4AwFpe?=
 =?us-ascii?Q?SfGcgNqx6J4nam8cch4PwUUTA8gr7+YkE3s/o8pCJIXslEoJei3gjLUwabsx?=
 =?us-ascii?Q?VAYagQ14jGv2ry9lkEO8m2sFnoCDipjyy3CYAIl67frNiwpvOhyNf8wfWbg+?=
 =?us-ascii?Q?0CA2OBdSSVrJIt1oECLqNHe7fWvE/iaYJx5TaZLL/ghaxxbWcjfsZdO3UEr7?=
 =?us-ascii?Q?hFF/4kMSVpOJPFqnFlNFji+O6nUrSjAtiPjzB0yYfEFRyVxZ3sHyZAA3qWrP?=
 =?us-ascii?Q?4xGlW9u3OM0DIYGoX/3o0vcQixDsKWceXBnwrwqIGrYGmm3iRQS/vrAOtgrk?=
 =?us-ascii?Q?o5WIV0ERFk1dZy7NkKX3auWYUk4wMNPva1TJ3MBAcvTIwoi4pJlpO3K4aPCs?=
 =?us-ascii?Q?70EwoF9gB8BgyzWcvgqvTgDXWAdjmy4UqLRoMHs4scx5b8huCtQvBeeWyZw1?=
 =?us-ascii?Q?DRTkpzCjL04JLD/Ee1v3GX2D6Sken6wNcpPxyQNrJNIL/JgcHjjy6a/Gqjwl?=
 =?us-ascii?Q?Dy/+oYPGWQxLKqXkE1NLL0ZsFxTFN0NlT/74CtpwYpAChvLh/NDGonCfcAbD?=
 =?us-ascii?Q?emhbNfyrzj4+BV6Co5/jNaDQydV708X3aSLNG6X77sU6mkONvpsZs75wA2Lg?=
 =?us-ascii?Q?uVrwIqFImCAmza7UqJAnBc8eGrdJsWmLx9Pqk1d6OOYoR2W/lXGBGadWm+9L?=
 =?us-ascii?Q?Bppk/iQthzOzdtT7xPsMEbl2d0PesbMMLxo+1CuGnTFJqlOuL17GErNgH++1?=
 =?us-ascii?Q?7LOMGgh4Z9pIL2AUjKxjm8kNFcE6cHZAxVc7ffOKe7ZbScfgb9tLmmaOSDcI?=
 =?us-ascii?Q?p+2vqg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3291.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d787698-df3d-4366-80e1-08d9d51ba936
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 16:01:42.8271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoAwQc0cxCH59AyI6WQi0ocd16EO8ryKE2/LKI9CKkxr9HK2iUtzDn+BabgqT4wb7eYMgM98PhhHTPwvVcXzr/U7Uh1I1zUnIqw5psW+zlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3432
Subject: [Buildroot] creating packages for opkg for buildroot based embedded
 platform software
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello, buildroot experts,

I am new to buildroot and was working with a buildroot expert for migrating our yocto based build system to use buildroot. Unfortunately, he has left our company for another oppotunity. Ever since I have started using buildroot for our build, I am very happy with its simplicity compared to yocto based build system. However, I have learned that buildroot expect the entire rootfs to be updated on a running system for updating fixes which is very expensive for deployment where there is limited bandwidth available to update the system. So that is the challenge that I am facing. Good news is opkg tools are supported in buildroot which is good. Typically, we would like to let our customer do periodic update to the system to have vulnerability fixes and other fixes released by buildroot. For example, let us say we base our system on 2021.02.x. So, when there is a maintenance update to this branch say, 2021.02.06, we would like to create an ipk file with the changes and provide that for syst
 em update. Idea is the file will be smaller and thus requires less bandwidth and will result in quicker update to the system. Do you have information on any project that is working to create a package manager for systems that uses buildroot for their build?

My research showed one resource but is for open embedded or yocto or openwrt and is here. https://raymii.org/s/tutorials/Building_IPK_packages_by_hand.html

Do you think this is what I should try or any other relevant information on this topic?

Thanks

Murali Karicheri, Software Architect
S&C Electric Company


________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and which may be prohibited from disclosure under applicable law or by contractual agreement. The information is intended solely for the use of the individual or entity named above. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution or use of the information contained in or attached to this message is strictly prohibited. If you have received this email transmission in error, please notify the sender by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
