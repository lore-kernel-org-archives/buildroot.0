Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17729C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 12:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAB7461211;
	Thu, 10 Mar 2022 12:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBWPfLL1mwKl; Thu, 10 Mar 2022 12:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92FC61204;
	Thu, 10 Mar 2022 12:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1DA61BF361
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF01A84739
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGibPU_Mywnn for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 12:42:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB9C18472D
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu/FKVz7RdpLYIyvkZUlc4rsUcBT8fUHNIrua0h5CZoBbWPjQpI/6QdHcAgJ+KURJTS891mNT+dFrO3t/scrbrFfnM1vaiRP0m7HE9Snj6EqXEL7st4DDGfABC49amCp9W4T5djZfuFKvK0f1owRJ0FubRYvay1co7gBTkcFQAx59XXfz7sW7t2M+7+/DBOXjn/Rnb6WOxlbnNjUxDfA/UV36NVcFwBOzWk2oNW1JNs+acSFJIqqwqFNj4T4jdR3FPBEyls/mKQfGIfkiozjurfgyhAEeDar7+uudnIx7M4WBzTrd2SSUpo2h4d3Q0U2XtW7nyqmM5yF5nfltNmStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Wf6AP8Z+s/3QnVo4VOnzaxjl1vXX/SNsnrXzeZp77g=;
 b=Lj2sno70BROCem0GEtfeHXZuEGXYpG4Bf5iKEw+0ck6VXwplunOo71XTpvpsLQJ1VtcN4QbWATdUFR0sqf+WNdCSIdUBw+fvtPJs/I6xJ4+hJRg0axuY0Hv0ztJe8TCuQJzvKddXlxRw8HVlSHJVE8DZudP/fOo24MB0ORdi2iEIOGqmnWTP1Tv4Ew6SHjrQhcVJGhC7q+4BP3m71fVeRSu6q6XKbsPrzfiURDAW/aaeP0Weby+uQhAoM2DaZoGIyoaFE3CuJIER8xLbSHt82E3/4p7WkzUiYKeluVu1McbySo8OCfHQCZLqGrhhSuSBp4gn3wzFqnLZPHB57zmK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wf6AP8Z+s/3QnVo4VOnzaxjl1vXX/SNsnrXzeZp77g=;
 b=QI5oFMlpDiubQ2zkEYeDU7MZdPN7kG3HrsJQ1KFEurEFsLJcTiQ3ubNu5TOe88iS5frxH3qKFuNKMKIypMVxtYXjbXPeNmhagJSpTT/Py0TTR8EmnbZ/YxYHIOPrlmaQ3e05Db6+XcE/z3lNWQRVNBXd6yC0K0OtbfK2AQ0KuDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by AS1P251MB0704.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:48c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 12:42:41 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::690e:181b:89ee:1f5b]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::690e:181b:89ee:1f5b%4]) with mapi id 15.20.5038.016; Thu, 10 Mar 2022
 12:42:41 +0000
Message-ID: <8794da8eac039997d08572a1508077ff878cce7c.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 13:42:40 +0100
In-Reply-To: <20220310124106.2916278-1-nicolas.carrier@orolia.com>
References: <20220310124106.2916278-1-nicolas.carrier@orolia.com>
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::13) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2ed3d9-2554-4ec1-adff-08da0293778b
X-MS-TrafficTypeDiagnostic: AS1P251MB0704:EE_
X-Microsoft-Antispam-PRVS: <AS1P251MB07040D37AEC4DFA437619548840B9@AS1P251MB0704.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SdvKA7C5nR87zOVd/vmTQNzkUTZOiFmZr78pfFuf3mOi8Sg8txiKiqxwD3WmDZgfLeN3qiYgFrydC+IW4kuUYlymaUMO/WJDTbbK0et+XAGVvNk4fynuqlLcNa7ybLBbJfD/pC32DMNFL8qDAh+sbFAdtOvJ7FPqMhFrN43fa9YqbkWTKOwyleeHAPZvd7+9OAEo7cCYPOJDPmKNKPfmd4DQERZ8Pc1KXaemeQK3LOIDwpDoF/t21PINa9TwpsLGZbbkcLCN9qHlCAnZ2ho4vNo2jcRJD0YaotGyG7ZiUkJY2V3V593Z91feUpl1YjybYPfFDYhvBVvZBb0QumvQ/lhNhyFhC4FaTSROmNVTkX1ZE0cNz2J94V6Ssamx72DGKOudQ2+kf5ieCX9+qz4lH+3cWnNoj4DWLg+kWIedibysDxEV2Hb3zRLLutBn1Bx56ZQryvpbbevUIQO4BaPZMePiWRmloPFpamLkNWFQ1b1ZIXU1F3P0ZQISVR/n/RAXChZg8ZCvF3NP3Qr5IVN9KGshpoE4D2XM58HUvlw0gmI7MGjxLjx2i9QYrSyuhEV6o8foMonT3PMMnYvdOjLeXCLFlwalgo2VR4Xe5VT9UBVjoE6I0JQqtji+jUWOyCzC0Qy2DTWXcKZOcqF/nezZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(4326008)(66556008)(66476007)(508600001)(5660300002)(8676002)(186003)(2616005)(36756003)(66946007)(6506007)(6512007)(52116002)(86362001)(6486002)(54906003)(316002)(2906002)(6916009)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1g5TGNaUXR6anRKVnhwdWpQZ2dXOFlMekNVNXJmNnRZZWN3MVNPa05lRjQ2?=
 =?utf-8?B?WTQ1QVhFSVZEcFBOMXZvNjdmN1A1OWs0S1VhUHQza1Y3M1BXU3Q5Rm1WUysr?=
 =?utf-8?B?WE1PWldZZks1NTBRVndvOWI3ajNjaHFZb0VwZnRsTG9abEdYQnVPU21sejlQ?=
 =?utf-8?B?S1RBQzhIdVg5Z3krQ2NDRVpHQm50NStFN1FUc09UT21iN0pBalJnWTYrdzdv?=
 =?utf-8?B?WnI2bWV1NWFqRjN6c2dLRXk4YXQxaFF3azBYa0pUU21na3gyMkhyVHo5ejF2?=
 =?utf-8?B?T3JUcklyL1NiYjVOOEdzT0RqNTgrRFlsV2l2L3dhVzlscHVUSWExSDVndG9s?=
 =?utf-8?B?UHN4UkhQZGNhNndtUTdDR3czbUQ5VUtEQ1laQWhvSWhLTTBoVmI5MklKL2ov?=
 =?utf-8?B?RG9Ld2dUZGlXaWRBNnhtRzRnRVUwYzZnckFVSlVDTjZlRFl4VG83WkFVZU1F?=
 =?utf-8?B?bVlXTWRMa2x4RDFqTU5hSWxHN1J5K2RDSXJZeTNmdW9WZGdrUW5DdFJFc29I?=
 =?utf-8?B?a1F0aXUwMEk3M0FRaG10ZlRQREh0ODBzYnlONFJjRjBtb1UzVzdwNDdqQ2x2?=
 =?utf-8?B?ZGJNZDBTUHlMSFhOcDA1QzlUa1N4dVZ6TTU2SlZIdFFOUGlHSWt3aU42M1VX?=
 =?utf-8?B?U0pkWVhuSXlYYkttYklLblNaMXNOc3VZWVhxM0RjN1d1aWhWNWRraDdXNklZ?=
 =?utf-8?B?bDgxVDZ2b3p2ZUw2bm9jclRFbmlvcVpvZlRNa05FNWZUOTE3TnBlZ1ZaVGo5?=
 =?utf-8?B?dkhaTWx6L2tGTFFGT0FxbVVlMTZmSytDeHQyYmU4cTd4WFZYRU0rWTNCMmY5?=
 =?utf-8?B?RnhGOVpxdDg2N1ZWdmN2RE5RdEQ4cTRjYjlQOWl3c01meUFWRGIydGhNY2Zq?=
 =?utf-8?B?RUUyd3RsdzI0MTlvQmNGOW5SNGcrdXpWQzM3d0JjZzdjTTNBeTdCcC9nenRa?=
 =?utf-8?B?NEZTa3daTjNnbWxVWXhZVDRsRitnV1BkVmE1SXdpSXZFckpJQ2J2L3dTbklF?=
 =?utf-8?B?bE40L0oyYnp5RVhmSy9VeW1HZUgvV1Q4UVdyaG5HOXNBZlh4MXJoWG8zU3Rm?=
 =?utf-8?B?dVB1M3RnSCtBWkJwcWhWRWlWUlpRUzY5cnJRWEkzUGdTOFI2WDg1OEJnSWxX?=
 =?utf-8?B?ODZ4bXlzYlNGTG03cXlGKy9yeGtvK0Q1Y0RCNi9DUk9rMTZDb2plTHFxZW5U?=
 =?utf-8?B?Ri9iWkRneklOakhzWHppLzdBeExyYncyUDdNMVFVc2N2T08wTll1V29zb0Er?=
 =?utf-8?B?M05hUjF6SVVKQ0E2U1ZJd1p3b2sxeUFYTTdmd2VDZTh2Tk95WERSSXpuR3NI?=
 =?utf-8?B?dXIxakt3RkpSbkxDZlZrcDRGemEwdjJMbnA1cnFPRE1PVWpYRXB6Zk1iL21o?=
 =?utf-8?B?aEVSRWZJam5SZ2VnLzlXdDZoNzBISEU4ZEsxcldYT3ZTdUFLdndTdHg1N3Bs?=
 =?utf-8?B?TjRUc0JPdEYwaXUrRHBDWlJzcHhpSlFGUnMxcHhDc0YzSVk0Vk4zQldlbzVt?=
 =?utf-8?B?MGUxaUhXVlNBNFlKNU5iQW03enk3cXdLaVlQU0hSK1A5d3RHWlBhWTRBNFZ3?=
 =?utf-8?B?ZWwvcWJISEprSmtLVzRNTkNHbXBGWUErRjZmUXNLTWROTmtORXFqZmYwNTRW?=
 =?utf-8?B?SWhUTUQ4TmVwanMvcUN6dTBsRGxqVk9MUitkYnp5dndQMWt4YmtUbkhzNE40?=
 =?utf-8?B?SGlPT1MwcnBNalNGSGt1eVFJTkhFOFV4V3BSOU5jSGN1aWdMdXowUTYwRkJz?=
 =?utf-8?B?blRKSWtpdDJwSFE1WXdkZjBDcFo3NkNrU3BvS3A4WUVnMkI0c0E0SlJnRkNp?=
 =?utf-8?B?OEREWWpWVXBldEFQTHZ5ZFc2LzRGb25aVllGYStYZ3BRb1hFaWhKSGwvZHJK?=
 =?utf-8?B?LzB2UUoxbzFnQjhTN3FHakI0VVp6bzB4Rlh0VWgwVGhqcGRMdkZSbDdqUVlo?=
 =?utf-8?B?Tnp2SGY1R1FtVC91eEF6OFRTY2dVbXcwODJDcVdNRHcyT2RlVmwxRmIrVDBU?=
 =?utf-8?B?RUVGTTNzSUxWQnR6eU9xeVVobWo2djZuTGVwMjM2WDUvSHFaK0UrdXIwNFZj?=
 =?utf-8?B?UFZUdkxxVXFuTEVPbW5MWTI2ZFBNYnA1cTlYZVRuQUtUcTh3cVBMYWFocGMv?=
 =?utf-8?B?T0svaXloNTFuS1NaK3dYQWQvQWU3YU1sTkVES2lPcXVUR0VCWEwxdlUxbDZM?=
 =?utf-8?B?V1h6N2UrQWIyV3dDVWFvS2Q1R0YzQTlLTGx3a2twbG9YaEt5SHoySXcyb2Ry?=
 =?utf-8?B?eXdadEpkUis3VUNoVXF3OXRsMUxqRFNYc0pNYWt4NTdDcmVIWGsrRThzeHdr?=
 =?utf-8?B?ZWlwUWxsMFN3dHlSYkkxUm9Vbi9MQklFL2dGdUhMTW4xVTN4Wk5hdz09?=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2ed3d9-2554-4ec1-adff-08da0293778b
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 12:42:41.6374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94oxyQuoJfDdy9HFD2TS98OOhXs8DeTBurt+JzqETxpHufGC156msQVCf4R9bC33DGaD3LXi3adUo6ivQ5AwqNbkQ+ALCNEjfCk/wooQh5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P251MB0704
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: fix compilation
 with linaro 7.3 / 7.5 toolchains
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?ISO-8859-1?Q?Ga=EBl?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBmb3Jnb3QgdG8gYWRkLCB0aGF0IEkgaGFkIHRoaXMgYnVnIHdoZW4gdGVzdGluZyB0aGUgbGF0
ZXN0IExUUyB2ZXJzaW9uIDIwMjIuMDIsIHNvIGlmIGFjY2VwdGVkLCBpdApjb3VsZCBiZSBhcHBs
aWVkIHRvIGl0IHRvbywgaXQgd291bGQgYmUgZ3JlYXQgOikKCk9uIFRodSwgMjAyMi0wMy0xMCBh
dCAxMzo0MSArMDEwMCwgTmljb2xhcyBDYXJyaWVyIHdyb3RlOgo+IEFuIHVuaXRpYWxpemVkIGZp
ZWxkIGluIGEgc3RydWN0dXJlLCBjYXVzZXMgdGhlIGZvbGxvd2luZyBlcnJvcjoKPiDCoMKgwqAg
cGxhdGZvcm0vYXVkaW8vZ3N0cmVhbWVyL0F1ZGlvRmlsZVJlYWRlckdTdHJlYW1lci5jcHA6MjM0
OjU6IGVycm9yOiBicmFjZXMgYXJvdW5kIHNjYWxhcgo+IGluaXRpYWxpemVyIGZvciB0eXBlIOKA
mGdib29sZWFuICgqKShHc3RBcHBTaW5rKiwgZ3BvaW50ZXIpIHtha2EgaW50ICgqKShfR3N0QXBw
U2luayosIHZvaWQqKX3igJkKPiAKPiBUaGlzIGNvbW1pdCBhcHBsaWVzIGEgcGF0Y2ggdG8gcXQ1
d2Via2l0IHRvIGZpeCB0aGUgY29tcGlsYXRpb24gaXNzdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Tmljb2xhcyBDYXJyaWVyIDxuaWNvbGFzLmNhcnJpZXJAb3JvbGlhLmNvbT4KPiAtLS0KPiDCoC4u
LngtQXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLWNvbXBpbGF0aW9uLnBhdGNoIHwgMTcgKysrKysr
KysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gwqBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMDUtZml4LUF1ZGlvRmlsZVJl
YWRlckdTdHJlYW1lci1jb21waWxhdGlvbi5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3F0NS9xdDV3ZWJraXQvMDAwNS1maXgtQXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLWNvbXBpbGF0
aW9uLnBhdGNoCj4gYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAwNS1maXgtQXVkaW9GaWxlUmVh
ZGVyR1N0cmVhbWVyLWNvbXBpbGF0aW9uLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi5kYzJkY2RhZmI3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvcXQ1L3F0NXdlYmtpdC8wMDA1LWZpeC1BdWRpb0ZpbGVSZWFkZXJHU3RyZWFtZXItY29tcGls
YXRpb24ucGF0Y2gKPiBAQCAtMCwwICsxLDE3IEBACj4gK0F1ZGlvRmlsZVJlYWRlckdTdHJlYW1l
ci5jcHA6IGZpeCBlcnJvcjogYnJhY2VzIGFyb3VuZCBzY2FsYXIgaW5pdGlhbGl6ZXIKPiArCj4g
K0NvbXBpbGF0aW9uIGVycm9yLCB3aXRoIGxpbmFybyB0b29sY2hhaW5zIExpbmFybyBBUk0gMjAx
OC4wNSBhbmQgTGluYXJvIEFSTQo+ICsyMDE5LjEyLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogTmlj
b2xhcyBDYXJyaWVyIDxuaWNvbGFzLmNhcnJpZXJAb3JvbGlhLmNvbT4KPiArCj4gKy0tLSBhL1Nv
dXJjZS9XZWJDb3JlL3BsYXRmb3JtL2F1ZGlvL2dzdHJlYW1lci9BdWRpb0ZpbGVSZWFkZXJHU3Ry
ZWFtZXIuY3BwwqDCoMKgwqDCoDIwMjItMDMtMDkKPiAxNjo0NDoxMi41OTc0OTQ4OTEgKzAxMDAK
PiArKysrIGIvU291cmNlL1dlYkNvcmUvcGxhdGZvcm0vYXVkaW8vZ3N0cmVhbWVyL0F1ZGlvRmls
ZVJlYWRlckdTdHJlYW1lci5jcHDCoMKgwqDCoMKgMjAyMC0wMy0wNAo+IDE4OjE2OjM3LjAwMDAw
MDAwMCArMDEwMAo+ICtAQCAtMjMwLDYgKzIzMCw3IEBAIHZvaWQgQXVkaW9GaWxlUmVhZGVyOjpo
YW5kbGVOZXdEZWludGVybGUKPiArwqDCoMKgwqDCoMKgwqDCoCBbXShHc3RBcHBTaW5rKiBzaW5r
LCBncG9pbnRlciB1c2VyRGF0YSkgLT4gR3N0Rmxvd1JldHVybiB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gc3RhdGljX2Nhc3Q8QXVkaW9GaWxlUmVhZGVyKj4odXNlckRhdGEp
LT5oYW5kbGVTYW1wbGUoc2luayk7Cj4gK8KgwqDCoMKgwqDCoMKgwqAgfSwKPiArK8KgwqDCoMKg
wqDCoMKgIG51bGxwdHIsIC8vIG5ld19ldmVudAo+ICvCoMKgwqDCoMKgwqDCoMKgIHsgbnVsbHB0
ciB9Cj4gK8KgwqDCoMKgIH07Cj4gK8KgwqDCoMKgIGdzdF9hcHBfc2lua19zZXRfY2FsbGJhY2tz
KEdTVF9BUFBfU0lOSyhzaW5rKSwgJmNhbGxiYWNrcywgdGhpcywgMCk7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
