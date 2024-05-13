Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE5C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 12:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17A9608FB;
	Mon, 13 May 2024 12:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0e6vUtH0t2g; Mon, 13 May 2024 12:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239B4608E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 239B4608E0;
	Mon, 13 May 2024 12:31:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1BE31BF35B
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5F4040413
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 12:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An5N3ZOaSTZA for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 12:31:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06BF6400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BF6400E7
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06BF6400E7
 for <buildroot@buildroot.org>; Mon, 13 May 2024 12:31:05 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 May 2024 14:31:03 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id AAB8CB5ABD
 for <buildroot@buildroot.org>; Mon, 13 May 2024 14:31:02 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 126F4B5ABC
 for <buildroot@buildroot.org>; Mon, 13 May 2024 14:30:52 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 13 May
 2024 14:30:51 +0200
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.50) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 13 May 2024 14:30:51 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYGQrWVNw5vSJIOF71cPP5VUt6lEK6DhohpXYDjuJ1MSM1A113yjHLqP9jvnxuicSqWmhTz3tDsIdRChamzIbzNrTPzw8PYspEWn+9HJ4XdBvEOncYbi7MD9v9QKovdsOkY1zw8fhfcF+sjRK1LZQ1OyDMC6/wqzwBetRxKiLCiJSljk8oDLm1hnE86E75LG2FQNL5etIAUbgzMawHNcXKF9M5+DwP3u4h6VRBoyQkYeGD+qEqRtYxzutTc5u9HMY1yO4NXkeN1btXgJVkpyfS3MuYRWNyOD0s1VKsNsHiAs9meSWBX1AjhzwN8ct+mJYt5lT0vUtKwyF4FJy8I/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYDn43uFd1L79Wfe6p6jafIUOU8Zhtqfk/ebXvtS62Y=;
 b=J/RdzYzbz52zTAgiu1mA2FpvAFC+BdlEu/5fPz153ts82GeE1XvfKBk4ougVDlt1864NK5z5mdxEw9OkEaR9ecgJe22vJIpYY6hJcZnYluIBT1+kU6iaZmXw7GSZGvsUyUPjjukkl/voP1jXNG9DKTOTI/SYjaZ8FL7CMtpJLRH8zyOHhC9Zf9smOFg2anRjGvy68paCr30B2YYpp5ceTXhjwXYpIDb9VNk2C4/bJ+ahaMGPrsNdoRSM8ab1wkE3dJGsIqrr6V6Fegskd7MtmWZELu0MffVZaVm+O7iMcv1Sewe8nq6CqFn5+XO7d08eHb3dbiXpr1io7c4Ja9etMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PA1P250MB1066.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 12:30:49 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 12:30:49 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v5 1/1] package/libzenoh-c: new package
Thread-Index: AdqlMUTHA490hfp6R82ryRibqLYVjw==
Date: Mon, 13 May 2024 12:30:49 +0000
Message-ID: <AS1P250MB0608AE15BA5CBF4C19C12B0AA9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PA1P250MB1066:EE_
x-ms-office365-filtering-correlation-id: c1cd0343-6fbe-473f-2747-08dc734885ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?HprxN/PuVa45ZHBu+1brQCtaAv7yyvOWMFq5HmGVE1ioLNjZ9TTeNiiTZuG+?=
 =?us-ascii?Q?oM6McuNMPppbDCDidtm/mvltq4lBUpbs1xSShySNalWrTBidXhOEjs3JhG1e?=
 =?us-ascii?Q?2BVHVo0xl5oAQUInoKXiY44bydqrK3kQJLVM2qI81RNocA1dvAmx+Gw+3SDH?=
 =?us-ascii?Q?X6JHIZdweJSRXW+iJ8NVr6UQpxOwcERAgsfLmgBn2ydsU22i7gbImXEOzCJO?=
 =?us-ascii?Q?AmphRaMs8HEee3gftwuvS2qrqJW528v3w8NKgndIfpAy6eLxYfaYxjMbOtD4?=
 =?us-ascii?Q?6ly/HvnNz8fwb3s8Un57TM+CgSDz59FoCMwmQiUG3qCvvgmZn2mCjVXDJnp8?=
 =?us-ascii?Q?J4pU3TQAOULXixp24jq/UJ5tFicii6fT8AMxxrh8cuKwgUjni6KZf3yOMkFg?=
 =?us-ascii?Q?ydnLaIb8cSql93e41/Ovn0+Gf8xAdn9upzWr+L3C9cnCXI90KrsKS5qNYGPn?=
 =?us-ascii?Q?iQUhyVzC7zlRK5tO9YAiYZQZzrQ18TNLQinegPaO68kfWX1qyf8TwAoekkMZ?=
 =?us-ascii?Q?Y6EvEveOwtmIO1grq8APe1GlZrZ9wEnBR6e5SqQi7R/w/wwRRgPZHBQ2yL5v?=
 =?us-ascii?Q?AyrQQRHteyvP9Fnny9gPHLgnBqveixKC4tctyg3Cqq6w4xUXFh+Uqoug1cOW?=
 =?us-ascii?Q?gYOelf0wvZhKZcCXeED7jb+DOBYL86dRe21aLTUandsNf6+Fiv+n6iVl2HLH?=
 =?us-ascii?Q?F2Ed5VHZHi7lw8d62GVvuccCBv00IHyU2EFlHHEk9WV67jzvvuGrID0BH/fs?=
 =?us-ascii?Q?jSLecDyFjY2P1VDIFLft/cjjaAnboDlKcLw6lt6MDobyyI67xgWnJ8HPfidb?=
 =?us-ascii?Q?Xr3ZuSiweDzyZS1gMc+3JsyYCaZU6YOIsa4lnLuKEd6Jq+2Ahm66Bo5HRyCt?=
 =?us-ascii?Q?6Y2soVDoMVvGV5bjbaOjmB6mtdaqUoXKVlIQDMS6DQtsW6Y5JzgyGEKAPJn6?=
 =?us-ascii?Q?wmj1XP6z9WKYYmlT8kq3euf2riBOwq6+DiaXjXiVhdFP3qdYutkKOO9FaUhR?=
 =?us-ascii?Q?Ext1QnkPETjfNNBHrECReo5K/c4ztU8hqeesXRj5uQunyiC+joVjNXAoIpse?=
 =?us-ascii?Q?s4CVK2MtYg7xmyY9CDViLUCBLpqj+1a0oOrs80+dPWFT5NXlDCk7vYP9Iprs?=
 =?us-ascii?Q?51iZcKYbuVtPA8x4K8QObX3QnpyqHOMPH4YsCBmpKTC4MNfe8gAf7HKneL8m?=
 =?us-ascii?Q?cMG1C9swLtrElyvrPcZOfxeWn2vMwt2zZmX1KOff+P209XbNFnDkg/xjogrI?=
 =?us-ascii?Q?NdFUCfzIzpcAi+7JDcEQFWpuHOEPaKQYJTXcTulUgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F2Eg8vISqX87kZGq8wkQAN2EeeHZAYUGuh6nRYDhzznlkfOA2aif/VCBych7?=
 =?us-ascii?Q?XSLnihmZlpR3+6RmIr+2J7Ha5pYzldWsqs+qXwQmc8GCnXAcc0Pnw8zZXg0H?=
 =?us-ascii?Q?Htx/QAKrxQXprLyhYoxu9jNk7z55m3X3aUKNxE4+/3BTa0tVSqkY5kcErALT?=
 =?us-ascii?Q?7J02bZtgCidlOQ2FpsimHmqf91D6K/XQivS2fXBnpvF8UlM5/+wABirTnFe2?=
 =?us-ascii?Q?MKzy5eEJZUR8JVwrrXS41ZRe7IVKiBzt+2zPZ33cy6FikGSaR0bPyqT30ekp?=
 =?us-ascii?Q?wsqiArGOCYRrWSm1mlQA3SgtcZUaOtQfeBx098Tm+IUViBs0gAsEMHrQ6PkQ?=
 =?us-ascii?Q?K/7k5G1mRwBoBDlQWmZojQKQ/Ptc2/DBTScabiRXtViWf3ryn1v0gk9Steas?=
 =?us-ascii?Q?RgFWmHcGyMgfmqd36hpmJHJZlUx9j22X2+GYD9IUEXTJP6k+Fdv+mZxu61sm?=
 =?us-ascii?Q?0Xvx9l/jxgOlzAzOgOGyBjAu/JCgFhNFZ9BcC3VylX7M+o97PE7C13GFsOjh?=
 =?us-ascii?Q?GLdKrXH4EVA4T8p/9H9epJqFMg84bvHBZp01mXeIBk4KCGbjZzGqbV/1z6Rd?=
 =?us-ascii?Q?DDjNmydENrBC5Um37s0WxMObYQ4y/sMMhAyrL5VxVDCdRtZ9GHPqXypX1TF+?=
 =?us-ascii?Q?LFQMVdaN4KwYuaXD55ybc9C1If23MsraggcT0TpTkocuXuT9UCsKMk+8M+ql?=
 =?us-ascii?Q?SHntFvrvKh0kXIBuOSPR8jEcvJQtI6z/dtTxzACOzuaBt61oThq4H8+vmzBh?=
 =?us-ascii?Q?D5/1UdRBHDMADioOrI9XHCmdiZSDTUPpfXhiVV22lD8rl/63vxFpLlv0LDa7?=
 =?us-ascii?Q?PEX2O0+zEnnyqj9GM0hEpGh5h+PU7Ofvv/UUEm0gdQZPVfgJ7270iDmJRWEW?=
 =?us-ascii?Q?O+HKDjjzDM1CkH91FUFGCRztb656bnPeed0LrLCJlJ1VykB1iBxcfb1eQbbH?=
 =?us-ascii?Q?A0tsFd1mQ0Ffuy1PrQ9G4BgASKSQlt8Gscla0kIMyLwfu3BIDpNb6t5yl/Lf?=
 =?us-ascii?Q?40NnXhDRS6GPt0xaarwi543NUy3jYvEwEZ/bKy/3Mx4ApksJDZgItnzZrLRO?=
 =?us-ascii?Q?oYiLCFEHbKwkW7G32FKpnMt3552i3tHbqjNJL20krb7Q0CbHDj6kuCgVQen5?=
 =?us-ascii?Q?ZFcoBZRATZQtK+x2EoYDhBwObzcQ6NS9fOsGUiPEcVxjH30ostgK/Cn5ruQQ?=
 =?us-ascii?Q?au6xqGRj4QlM+nRqhpYXwI54uq+rZfht+8DYVMWAdpaCVaqvbHs4RxddSAE9?=
 =?us-ascii?Q?665ykbgruj1iTDmAU3db3edeltdZaAaXNx75Mv5yBS53KlRt5giujX0QzHyx?=
 =?us-ascii?Q?IJhS0bIjAYYTERHKiWm0xBJM5dDb9/rAI8fh8OJzwSvZbomPznY0V2tKM7zw?=
 =?us-ascii?Q?lkzOhyuLWhgwhsextcdnqMJn19Nj/ZdMjag4IMSdulf36mMLSc6tW9H7qIFs?=
 =?us-ascii?Q?++6GXZaDqWjSqminEbg4GSNqdI/rmyP2v//Aj7nE/0XLh9BnTg0e4SJxUaWi?=
 =?us-ascii?Q?dC9xK7Eapv9XDbg3BHX7eJ9lj0quMALioFcrCQRHntDPdjgDwlDN/eiFM7oP?=
 =?us-ascii?Q?Yq9mLUqLKVYnmLR7QgpY92Wk3oVHLB+af0zxobQCMCmj5LhUd4QRmB65Wz5u?=
 =?us-ascii?Q?Cw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ANViHbBrV8eKnLpuijUv5hEtpMUHh+mv8m2d8uzKz6H02NiJyz9HCo8jyUtTYWuJCMCdVjJ3fyNUwdm5bqZEBXva82dmOqymrtObO3vi6Ve0/2Xu31MXJXRra6zjgYNs7gpI56LgVm4WSVnzZSCCJuFOo48QG2V0j3xhJCDQPfV+MmIkjGclQJTLXkYX0+gCOsw9QcUUu5LhA6JyFqvp0U6qHJVwJD5reinOKUyqozG8nvieZwqEV4R9oYqwg3KX8W6keG68dlGhyoL0MhhV61YfChcThCnr6/m7Wp6VdMghBGEIPAqjt4n64B9n6qbyrxT9sJFJk3pmylqmKgaGUpS+sH89kP9v2m6plw4MDw/20vtR82AVPhDzSFOu4V+SVcMndx02khyFfzjufAuq1AYphEPUrmHNmlASfpF34PX6X63Sq0M+Hi0ITHIiGuJvuFPMgbJPWtUsu3+n9EtUhYsezRETmUVIPY2obSlS5ANbrMHTzpUUUyA+SD1lVYQ0iMbrT5L7AQMaCl4jjPx3Zo4Usqe5p7tc86WkRtFgxPnKVlD2m72Sul+yBucPkJirL8VDV/r1S4pnWpIuNsbuyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cd0343-6fbe-473f-2747-08dc734885ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 12:30:49.8010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3LJNUmydnGue/T6u5NRaFw0+eK7li/Smxg88NZzrqBYRxCwquRgKjstFB/nDk2h02wxZ+dzp8aHxF6FzMKYVrdF3qrGB0LASAJnklb/Hnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P250MB1066
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYDn43uFd1L79Wfe6p6jafIUOU8Zhtqfk/ebXvtS62Y=;
 b=EtKl61781SR3ZNqnbqCYSAsApZMS98hUP3+VzRzn1IOGIfv0gZXaVciWyO5FG42xPpXOBKa2OBEEQYsPufb1SO2xQGXuXMzZBnD27xgri9RHy1nchkDxkRoZFHHHRBv8WwutiR1bzUE6VbBiuSHAEI/BdoDPUYkkzF9jFojjTTQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=EtKl6178
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH v5 1/1] package/libzenoh-c: new package
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a C binding based on the main
Zenoh implementation written in Rust.
Because this lib does not provide any binaries or examples,
and the cargo infra does not provide any possibility to
disable the --bins option in cargo install step, we
have to override the INSTALL_STAGING_CMDS and the
INSTALL_TARGET_CMDS macros to prevent failing of the
buildroot installation step.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v4 -> v5:
  - bump package to 0.11.0.2
Changes v3 -> v4:
  - wrapped long lines to 80 characters
  - use BR2_ENABLE_DEBUG variable instead of "release" path component
  - use RUSTC_TARGET_NAME variable instead of "*" path component
  - shared macro installs only the common set of files
  - INSTALL_TARGET_CMDS installs only the lib
  - INSTALL_STAGING_CMDS installs both the lib and include files

Changes v2 -> v3:
  - bump package to 0.10.1-rc
  - set INSTALL_STAGING

Changes v1 -> v2:
  - renamed zenoh-c to libzenoh-c
  - added myself to DEVELOPERS
  - fixed LICENSE
  - install shared libraries to staging and to target

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 ++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 35 ++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/libzenoh-c/Config.in
 create mode 100644 package/libzenoh-c/libzenoh-c.hash
 create mode 100644 package/libzenoh-c/libzenoh-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d653648718..930fdf8d3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -83,6 +83,7 @@ N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/libzenoh-c/
 F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
diff --git a/package/Config.in b/package/Config.in
index c29b4a5101..135e8f6bb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2048,6 +2048,7 @@ menu "Networking"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+	bool "libzenoh-c"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  This package provides a C binding based on the main
+	  Zenoh implementation written in Rust.
+
+	  https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..969f9eed6b
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8a8058cb5277e36652cb4186f0a76b7555892eeaef4225b1f1aa556a1e77619f  libzenoh-c-0.11.0.2.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..5a340ba138
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.11.0.2
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+LIBZENOH_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/debug
+else
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/release
+endif
+
+define LIBZENOH_C_INSTALL_FILES
+	$(INSTALL) -D -m 644 \
+		$(LIBZENOH_C_LIB_LOCATION)/libzenohc.so \
+		$(1)/usr/lib/libzenohc.so
+endef
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
