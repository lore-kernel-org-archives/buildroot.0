Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B7CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 17:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF25540D5D;
	Fri, 15 Aug 2025 17:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kg-TqjJ_nWRt; Fri, 15 Aug 2025 17:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A5140D30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A5140D30;
	Fri, 15 Aug 2025 17:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75806228
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52DB140D22
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aItj4aYeV0-A for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 17:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::62c;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97BC340CB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97BC340CB9
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97BC340CB9
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 17:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKkn/N6qjq8vvovsXHCF5aImH7+nIGUfMmGKwoKe+3UpMFGkb85+INfk4cTM2x2TSY0bhu1oMRn4kczR3J6JbLgw2sVaghG/xofX7+zRq2i5YjmE4d9E9/pBeyPP3Br5QOK4eU/dVxAgRteeOArlyJbpUQK7sYbqirH+Kuj7rc81l04xJ4r03Cg9iAmw7C+jpLkNcDETBtLIrZ0wsBO/nfRGD4sQz867uB8o4WJ5ItaaV+2B+i1qjGE90M9hk2L9PsCKf8s28wIcEZorp28S+rwbpHQxa5b52qL0VY6WwLVh1GAaMd/XtZGqcabJqUXIfp18RsVAJUVcQp+z14AW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhwiqKvHkKxytjYI6PjIT0R0mOutfKqwFqAlmYBDxvo=;
 b=C5spSOTMTU0DJs+cQOKBE4FXNhCGkZWFSPgel2VYRYdfMUzOmenuhqsjTdcglcXuWlfi7oAyxcrtCdlLt7FxBz09ZEsi6YNbuq/DQCCEfXUIGwSZGl7mcYZBasq/zXeoA3piak2wgbqSHRulhmaDpIXI0/Zwu8J6WytiOhukHAqDHxrJjfJLjc+k4jPEtmbz/s+kW8e7Jphmk6Z6FM6BHG3AsTKeJ1nridgyZXZqdBdpSkhUUjaT9MeRLX7I38MJ7mue3pJJIlvbvs8XKslJ+Uhf/TnI+9NtSsPRcy7Xc9Lv+8ifNsKi+s5xZJ04Fw9Df2yCRrEx/q+sMCjQLsCfcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 15 Aug
 2025 17:11:53 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 17:11:53 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Olivain
 <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH 1/1] package/gcc-bare-metal: bump to version 15.2.0 to
 fix build
Thread-Index: AQHcDfk7NJeQg2tNQE+twuWibsCkgrRj1zYAgAAXQfCAAAP+oA==
Date: Fri, 15 Aug 2025 17:11:53 +0000
Message-ID: <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
 <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-15T16:54:03.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB7250:EE_
x-ms-office365-filtering-correlation-id: 47c240cf-b0db-4fd5-3451-08dddc1ed4a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DQ2tRjlKaXsGbyF9rW2ydKqf5sBmGJkZnZOaTKwTUNnzT5nqZJehEcaxb6oe?=
 =?us-ascii?Q?rGxxaK34uipZ3Ftq3HDoyzLw7itjUSqsUqiBoExW1T1rtSSoyl/CCk8XsqQq?=
 =?us-ascii?Q?+FxQWozEQbV/vT7q2mIDs72ioj3zrCIMVDr1EyYUWzEVX5P6sJ0U0aL/8ZED?=
 =?us-ascii?Q?hS930qyHeiBYTIu5g60OwlIk2pzQm3Jjcmh8NNxRNzK3InTira435/Nb0DRW?=
 =?us-ascii?Q?kTU28ayLyH59BDnyo8u+3plz9gXeqZTai9dR6O94JUePLRYfJjflZow1oTQG?=
 =?us-ascii?Q?cHlBna0usJ1uc7yH3shiLVv6ZvhY4dkBJADQ+hUVIs6YniQMCobXcFo9uOE2?=
 =?us-ascii?Q?dNniREsKNxcLpTXagqheTuaZk0Ujp35X0Z8rkazLqARUMk+geI/+YOGQc9t0?=
 =?us-ascii?Q?CZu0xUxuHlUvEmaXwKyBgBWD53bV0MHZ8l7XevTY4KD6uxGFW5XMgPuTIvcs?=
 =?us-ascii?Q?yYFAyDUamrwaw869mK4tgSHfz8wxVFwP81i++GQsviCPsQw0lWqdk8d5StDn?=
 =?us-ascii?Q?b1pvhhdaYVRHhgXrLV0bF2Ox//ommw0XpuUvGN1dTCsZUhbcKN9ZcmWR9hm+?=
 =?us-ascii?Q?ZQxqYFUPwlib12J5NxgsuzSnX9sPbEOeE5tKFlH1Jl8t2+/Zn1fJKO6KJN5G?=
 =?us-ascii?Q?WIBIPJSJ/QGrgRRvHkEDEYrZ7CMAhwEbWdeDRx+B1Ep4Z+QNebmburanwJO/?=
 =?us-ascii?Q?+swp/Mka0HPhgR15Fo1vCdSTsLDnLmADZ8TcF9yDtPL4s26Rl38DYerTseQD?=
 =?us-ascii?Q?gLaBCaim/J92fdm6ttvXdg2eUpDQB3Kl642ai5463cFNpIW8RlvqT6Pr4BTc?=
 =?us-ascii?Q?K5mTlPc84iHaUm4tF3nxKBN/9wGeOsJQ2UhzSP/dVSyXbQi8BLPBt/YVYrp6?=
 =?us-ascii?Q?iqEl0DMcOG1sJ7TAuF1PJlLqtSqS5jahdqZJj8AKeTciyuySg6OvoS3QYjEL?=
 =?us-ascii?Q?zcQd+bir/SOIPxQZI9scz/FINb3ZtJ/Yl0MZlMu0+RLt0IKss6tbhOuslF7z?=
 =?us-ascii?Q?s2d1HVS6y9JvQL7PuvZpGWMB84Kz8wSlXlHydUY1GKpsv8CJDbOH/K3LFj+t?=
 =?us-ascii?Q?w9cSLIDXuY9edzAsVC1dhKLBj4NYY6GFxtipREvicOveEP/cB10D2qmUO7Gj?=
 =?us-ascii?Q?1gysIUA2nKnxiE93cPvAu506Ag04oWqVvV+6ACwUqrFCX/bwtJDpEdfaI3mn?=
 =?us-ascii?Q?rdHDjzfjnhneSCFFulku17bKVgiR8EUV4/16qRFLjX06M9mM7poBFtqG/anu?=
 =?us-ascii?Q?a1aj8d5Pylkny/OuCYiEzm/nzlZ5Yl/WCJgxmtfvUUcGCM08sv9BwFuUTRLB?=
 =?us-ascii?Q?UVV7JOeRTXp+gMA9tgSzui0OfJeOdvqYrsHNwZ2A7zHQ9ypPMWyfmyPs9IPz?=
 =?us-ascii?Q?/hg23THcxBx06tV7a0r/kye7w8WlXbwoJgxt6iiFd3Nf1EqzTujZCSl0t/T0?=
 =?us-ascii?Q?K/YuYz/gHgVKX6UshvBFOi7eZKXXADEzldetHaNKAIAFThuwkxkxJ0OgmYp1?=
 =?us-ascii?Q?/ipucmE1GTsjEp62Xdnm1aV/48InFtzbDUAQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bwYkoXVJa6yjmNsf8ua8RgEu4mD/iJfQ9catH1PRmlIQlqYYASYHE8lcOjDj?=
 =?us-ascii?Q?sxVq4wwH9C+NOudPcwsJUcuzL2M7CLFeWO8IcPKawcH7cdxc1NwZkDSnnKuZ?=
 =?us-ascii?Q?+KZNy5kUD9XMPF0CCB6wiBKtOA+++EIsUYghDnIUKfMQIXfqTZ03/5Yt5Zyv?=
 =?us-ascii?Q?BWufJuWn5YK5kJU6cWsvzRLshL4mAJtdhlQktfKM7QI7VeMVVUKarI+cp5NA?=
 =?us-ascii?Q?snL4KDsiSdxhjCWJ2JKtrnidHvooJp3CUSO/KRb2v6GI6lyz6Kn/C7WQ/35J?=
 =?us-ascii?Q?7KU3BEZK4YH97k/KlLl2CR/BHNNUvdXS5yNaCCi04eG0eS466iHIE/xtpfF0?=
 =?us-ascii?Q?Ntmo1/PL3IFXkZW0fXXgAuyK+Qw61eFQcLvGVnWiQ5DQKBUiRhAj5kHO5RBm?=
 =?us-ascii?Q?tkCCTzhkyVdOPDewP3rwfFSa5lUJ7ahOCrwsdeuwJEVfLRr0h6WKYhON0CzT?=
 =?us-ascii?Q?bWL1OLQCzQQGStMTDypB0d/o93RGLBV0b3o3+JNhO5GB/KGd7MOxrFoe0UZ2?=
 =?us-ascii?Q?BF3pMNfwDloQY9zMvrMvexVbgt4bl6wemiMLI7/3kLRtUkPU0u6C02/6lwZW?=
 =?us-ascii?Q?4pGYaHatPq8OTKZwZpWlCppeTy+blQ65DjBo5LzZEoVJKOgV8psaP3ONEBID?=
 =?us-ascii?Q?Gqw6xGRTzoHWAlnG7XmJQoflatTjIrurI8HFmckeb5rUMvgmC3J6nzkKq5Hc?=
 =?us-ascii?Q?C3vppvZfLhxWwRWSrzlB0okqTg7nt0+Lz6D7ZC2YM+wfv9Zn+JnmpgNKZGic?=
 =?us-ascii?Q?H0+5/Y6iZDVJhsQLoPCSm77A+L/VHuvR8/JBLI3ZZdKpp5tFS+T5WF7JjXlH?=
 =?us-ascii?Q?J8xIGYMT/osv2Q62DtARbnMgfnsROGM/aUi6pCy9J50vRQ7HR2Tv+5aS1ueL?=
 =?us-ascii?Q?zI2HU/J3hVV+fg7+nIVZYbd7J4Y1syhBSNXiqAbGIHDx9OLSmcXZ9zr9vFZk?=
 =?us-ascii?Q?XL/+4nM9CebOqE7GJM5XSbRLdA7HrEP7WGJTzxe8ckMdQXUgU5o72K9bayXi?=
 =?us-ascii?Q?eph6ueUaRRTnvNoSM1h7a9tnR3ilXZQD8aO+TYLjyC2/yMGPbo2pBkshtAyc?=
 =?us-ascii?Q?LR8Js/A5wuOukE3HUAOz7Sihkzbdl55k8C+fTdKBffV6ZI573ThkGeg1X8fD?=
 =?us-ascii?Q?pSlAVJzmpwzzA/xIbk+Wg6eha1RJwXAoUrPnd+t1jwBgf1VrtQEO+D3aR6zR?=
 =?us-ascii?Q?GYOK2rscMrg9ogD2kNH6IBvUSFjTTWNpE2Ygr8Xwzia/j0SBpeHSYXwCwl8z?=
 =?us-ascii?Q?I16FF1zPNouVxqqs8OjBp4yH2Omt17wE5x5mbtQERtixNZAeZQcrI3T1PjBd?=
 =?us-ascii?Q?rAkQ7o8FPY0XuJ1dCHrpVBCwYh/H85kvII+/dkAp/1hg2yZY1HpohsAAK/fa?=
 =?us-ascii?Q?e/+CtD3oAYJJ6nLali+4qX94ZF100im4qbmHvJ7w6rs4yNottx3IclKIMoP6?=
 =?us-ascii?Q?79Tfl+JDcEFPGdly7URoVLzbuwtULgDncCgBp+uNzW6oJd+oRdXmiNCHkeew?=
 =?us-ascii?Q?P+68ZooGkA+reVMQNSM90oKxhg0ZRBKZK9+r0A3RWvlurvSKsEmxRQLYWx8A?=
 =?us-ascii?Q?4yE4vLskT8KRLuzpUbU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c240cf-b0db-4fd5-3451-08dddc1ed4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 17:11:53.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbMrdqxaVvoRgQUqOfhRmB5IKCNaXsplvCPPjrpAOZV7zyEIUBg2wA17j8ar6TTC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhwiqKvHkKxytjYI6PjIT0R0mOutfKqwFqAlmYBDxvo=;
 b=Tn41D+3QwCQ8b4RijbNwGUnEYZbpa6CwEqjtZKV0OsLWKmD7jHFt8K3Rre4weyy6B+FQfL/M03kjXjO34GArg/Y7HbzBGUw0Y46ZLA3jTvabew1+dOPGRiYKontmfLHQamQtErLKGnw45oxgkz6Oi0ys4qo+kD6gfLBfZfZSsR4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Tn41D+3Q
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

--- SNIP ---

> I do like your idea of adding a comment to the gcc package.  But one way to
> fix the issue better would be to not immediately drop the old hash from the
> hash file when you bump gcc.  This way, we can then bump gcc-bare-metal
> later without build errors happening because of the missing hash.

I just thought of a better idea.  How about we create an actual hash file for
gcc-bare-metal instead of soft linking to gcc.hash?  This would make the
gcc-bare-metal package 'Thomas-forgetting-proof' for future gcc version bumps.

--- SNIP ---

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
