Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F108C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B3CB60AB2;
	Thu, 20 Feb 2025 13:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeOiWXj8zswb; Thu, 20 Feb 2025 13:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F864611B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F864611B4;
	Thu, 20 Feb 2025 13:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65765194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6077F60A3D
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naBlnG0QG8cm for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=1392cf689=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 978E660AB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 978E660AB1
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 978E660AB1
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:56 +0000 (UTC)
X-CSE-ConnectionGUID: hQcvKi/VRh2kMxiUdiXxZA==
X-CSE-MsgGUID: lgoBh5DbTY+uFI+zc0RUFg==
X-IronPort-AV: E=Sophos;i="6.13,301,1732550400"; d="scan'208";a="40000817"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2025 21:25:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7ceyH27S4LmQIaZjDKEKsRheSq74HTDUfvDTosvmf3mcUScjQ0pK9CtlCD3QNY5F38ub1Wg5AgkU52nN5tqkMRJvvdC/wfsvAIsZeWbEF7ozGCXg/Rr/OccYdk291BOAJ5mW3/xDkSmeuPcrhHBp2iXGVBMBpom5dgeNbjvEd01Ovvsa1yeht1RnYoxoqlOqUsd92RVReqsoG7UBGx9/CRnLo3HsM5blRSSOJ40IjMHGi0qfBe2qHPSexZEQeitKrgmgF+f2NCEQJcqT5SrSJ3mCwo9RmWlUhlNlBxuvGBxefDAYtra6zCXDqBtkrDAlpLyBXsQetTeiYqv6KvQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYhAgtTvcoFAHFuQdNvii4jqenuWNdDX7fQ8PW9PhLI=;
 b=JDvIAEvtsl2dMUZAFUgF22TJTySjhUPLfMYxp1fixtVyv+s2S2QxWzVLjOcR327M4Wqj1yiIV2aSIgAu0FfG+JWqDQvcOnNevxIctwk8Fchg/3WZs3HNlQdogGoNyrwIFrQH5x7OXflsMlTO2dKQ5rCNC1SPvlvzX0Ri+RBZu95xKsbvhnYJEEnoc++UMcsvkZFR1CBqwXl6knibbKFO91k2j4D5KaU7vZw6z9p33TmQ9HAL05NJvOMiOQ5FLP/+1nUJSRanswwb6c3LLQUvJsYiZBa4tith1+mQZwCSe4bFLhNdiLAf3zHn8vJ3bCAVJyLdTfa0rp5CeZE+sIGByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6288.namprd04.prod.outlook.com (2603:10b6:208:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 13:25:54 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 13:25:54 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v5 6/6] [WIP] am57: add dtso example
Thread-Index: AQHbdyL+PuWZ6SS3N0ab0sPrZemYurNQR6kA
Date: Thu, 20 Feb 2025 13:25:54 +0000
Message-ID: <Z7ctYoil-sJfLIAv@ryzen>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-6-romain.naour@smile.fr>
In-Reply-To: <20250204163622.192932-6-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6288:EE_
x-ms-office365-filtering-correlation-id: 0cbfbaa5-e916-4b4d-7ef7-08dd51b21a82
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?40LIrVTpPpGVviBXZdf7TYuaThw/zjloCBl+Yq3TQN+IPpAD5OS79lrBclVY?=
 =?us-ascii?Q?OuDcAf053bnH6HBY/BCVrJONnC5su/OKDF8+886vt4M3OAPmRHG+DAPG7iJ0?=
 =?us-ascii?Q?TKnOERdp4Rw1AAQkw8MVEfmlxEYGfgySAQf3bhN/Bj+9bCZNLVDUXxPgyY3P?=
 =?us-ascii?Q?mulQpwACR1+QCYDWHcC7Pd0cISYgleh03FOgr5/7Is8lWmbrf2eS9I2qiBxZ?=
 =?us-ascii?Q?BsX6WDbNZOZT+DsoXN/erzrn0IKZNN+2N/iBu93ErKkuay9yPzfcBGOMgxSj?=
 =?us-ascii?Q?P5d9L4JrnfgG9bFQQ7+7cAof/w/29Cji4c9eIH5uynWqguN+twvt4v9N59g5?=
 =?us-ascii?Q?9sL4+B60oKJxsSAX+CkjgMcejYsa+xpjGK9FPmtUV9FhkY2ewJLE7U+tHdPc?=
 =?us-ascii?Q?ualDjfZ2t9EUdsOXFjpDelOwTMQMBgau2iBmaJg60jdkmiIYoWKv5GlM9Uv1?=
 =?us-ascii?Q?K3oj+nYJIbgBb1cfGEOFhLEIUDJnH8ts3q1s67KR0y8OUGd/HvyLBEsnnAip?=
 =?us-ascii?Q?NcsbpyE525o/bqIo5wxxxw22sOLIAw4PtubsJ6TMPn8KiWfWVA+II3cJUAi1?=
 =?us-ascii?Q?8RXlILfwMbzQlD9ksKiGMSKmP4gfx7CtG17gruWW2TUI3nJg9Z1AQrCHCCLh?=
 =?us-ascii?Q?TRV5c/reZ23ueXj9CBvmCMnyQUd5DKKERTuBd+QxBKQCPHJTbTHk0WeROAWS?=
 =?us-ascii?Q?rAG9btirlRsCPgFQn5Ym8QcTVVJsMRD7zdcv11gWqYbSoeF9dSdbAiZG6kuP?=
 =?us-ascii?Q?w40fifTyKa2QI+AvTQzrTyCENTKD9Qns0/WraYJyYOT5OobCYopn5teraxfv?=
 =?us-ascii?Q?w+0CagPT9e40HhZFJAUuYKzCFekJ3hnS42SfN52Cfk/jSq52Hh2V3AXCJpUr?=
 =?us-ascii?Q?FDNqWx5aVKZoAbE1UiEzvyV/H/vFPH1nJWiFMUbMCcnbyoekQ8slS7Bno2ue?=
 =?us-ascii?Q?mbeWExRUmdeJ0+jSRNiAaf8f28li8UV1DXW/CPYQ2bcjbEry1o9j5N0A7X5M?=
 =?us-ascii?Q?v6e+knV3uXlsHXflQ45n0KxP1U7CHNJKgAfGKm7bWLbK4vFyMjhwjSLZ5sgN?=
 =?us-ascii?Q?avD7nrrK6JZp3Z9sRKb8K9RhGFYXWQ6Vb2QsvQ+NDkuqvEscx4EMvHxdgSeW?=
 =?us-ascii?Q?yLR0aw2D7qYxHtE0hnU/1C+3LFYDhWJvpKQWSHNivQcrZdnApXzsszD4fXzf?=
 =?us-ascii?Q?JjrrqCktAy9I1XTNBkvJVwpRdjemZywQYy4iW/i7xu1mSFuJY9BTHOKoYUdx?=
 =?us-ascii?Q?nxryO283iwQZ3c1mUaxK3IJPoAHgh+G8ejRqXZ3lt/l308cWN3cF8aHCqrC9?=
 =?us-ascii?Q?BLjU3lIA2/gmi1elb0E7CKZME5biZqbEReE6+padxD5BaplPqt0ZMF0CjA/5?=
 =?us-ascii?Q?Q0AuWV+c2B49nnqSswHeGYExxDGUFjod5xIygGOamD7obhg5CDJAStc/nocZ?=
 =?us-ascii?Q?eFV0Nxo695klQ6sjG1FZhD6WgIu+aSqM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EJyRDdXhtTsLEQmtpPUim3Xmc8cBdBDsXn0h47yOsnL2jnjTbhQyW2VkYG2j?=
 =?us-ascii?Q?LIbgvVK3RlkiDP9wcdYHNqgygSmbAXbTgqa5OweF8w7Ki0WivhVid4G1rZ3M?=
 =?us-ascii?Q?Xs64kdPvm0xCwVCEr9ZA5NHtApBudwBw0a03iMAiS3dddcSFVXJznbd3KSwK?=
 =?us-ascii?Q?gMLSJBHAaDWzJQiWH5wpFoF2Jk8d/XCSgVFOMCVQ47Ba7lhjQTCDneFrnWEz?=
 =?us-ascii?Q?Jjg7eBucOXZ42JQmEt9Y0pV3/wEWTJTwKh6+G/3E7FN8Vc7JQQJKy2iDuduB?=
 =?us-ascii?Q?ncjEU6RiCi4xOHLV031NJ2zKgbpBX0k18vhBeE2T3cR2aDrGZxo4kvdEcnns?=
 =?us-ascii?Q?8M6YbWB4+igMybjEq9JZXyXaRoYJ/R1I1mesLx1I4kGg368fx0snrQd1A1wO?=
 =?us-ascii?Q?laB6k/vxIgfRwu05ievPWToOU1I/+ASFpcg8b9QNqyOO8bTfpI7fMPXKQq7G?=
 =?us-ascii?Q?yTFINp+UTarRQmsV778/QqQAAze2VG1/LQBDkELJVVHXnD/ugzSqQEQ18YzB?=
 =?us-ascii?Q?/56Y4j8FhXDhxy5uiVubj8R6cahv+1wHfEb4vnyZsuNix0yD+0dRer3BEw5l?=
 =?us-ascii?Q?nsPqX5KZXE0Jdnrbd1SLobFHBd7rFagTXUlJ2ngWcczRiFyHo2Lg08xtRIdx?=
 =?us-ascii?Q?nuMiEGdtJHWuqyWwh2HGNHPYJxJx/ABMVqudWttj/0sIKkflz5Xi3/KlLBLU?=
 =?us-ascii?Q?JRLkKgzApVNhipWrlhltCtu0VPzO5Lh4hDlbI3W8uLmrQQ77Y5kmRv0KhueV?=
 =?us-ascii?Q?J9aeZ3CndD2L2mnMkgiHczZkvsEspuskY5gW3quFd7wuy1uBP/f6EAOe4G75?=
 =?us-ascii?Q?Tx4SfOWESVuleqfnZYRAe6mfz0dI3+WJBIga1Sy9vOsLBYH90qvDdrw3v7DR?=
 =?us-ascii?Q?0NW7XPKMsaHFo3UVXSlm8Pqvc1LpVbdf0/pa5oxbsOkQ+8eqYw6XGlvO6MQF?=
 =?us-ascii?Q?x1pF+Wqnq7GMj94Gr3HUZX7ltLa1vnSubM5FDnUr4LJrCVtHiiiE37UD8YI4?=
 =?us-ascii?Q?s9sSXgMe+doGMfoxKeHJb4dqGe+DUrl2tK8LFSMDO/5QtjCLFCU1BvSQ/CW6?=
 =?us-ascii?Q?6BSmPAE8xML9ei9r73nX+zXaZ2Y8DpEKyqaZDqMtkU18TSSGn2PTHWBzGFOZ?=
 =?us-ascii?Q?qT+j8Vv3pMsbKHNp5ENgDvuqq1fWthLD6Ub7BgLLDGTUwxq5zSslsPPwHYJx?=
 =?us-ascii?Q?1cOHGAVHkHs5fS7Ol+fOG6aQmfSW1ecBkKwY87VN8lfODpkJOXS/KnFZdOoM?=
 =?us-ascii?Q?3rspytoG1hVIUoqn0LIt+0UgGnKIpbzLEfdSnE287PelMzOpNtL73CrfEDgV?=
 =?us-ascii?Q?8zTxZbU6B3hJtTyCQpMsh10R/KLXGulhkIYJ3l3oYsFlBOMWR2YtlGGEdOeq?=
 =?us-ascii?Q?BqEWIstcd1IcAZyvt0XkHAhq/mACWv/ROiRlH2rDdLrF/ZqNWnKg0ppXhx0P?=
 =?us-ascii?Q?gOQZil5it/zg0KFaz6pmoa4x4B4hqoZP7H0T9pA1KaXflnTAgqw4I0wmWKOM?=
 =?us-ascii?Q?3m9DO0hvpihS3P9BsTXCxnO6cQ4MkIct8IdYy5BbPR+XvwzGPW2PXoeM4uV+?=
 =?us-ascii?Q?w7e8aFwORRbnQx17NKoiLatv2U87XLYlZJanrv4YsdFRlIoXCsYG3b/b0NRm?=
 =?us-ascii?Q?Iw=3D=3D?=
Content-ID: <85712AB7F26CB6468747D50CF0D3E68A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xqz0qGIwaVR2b8jADCZpR0A0ls+vV4gSCD1u2e+iniCKrcLlaHgbuKBWadRK2rN4O7nzwdo26/Pz0YZuciLO8cvSuFSsaxeJtj78+WtddBEJH2/zQTYNXsGpbZIa0lqaqhMeSwkz0PSLbf8MGzFgg7LTx5VeFJN+YKfSx+l9Dae4lYlAO606jswBtZDzm4lOio20ZjUDm0otqf/BNShUNkUiJorfOV5GFFbz5kUiPgcfYsN+ZnuYlysmE5ZjICZrbIvL0xiHHoPc5Rpb9znVU6+tczR1he7Ar0qy8+EWczSt7wrvUjdo9QoR6CB3DMOQRRIZcFMwXHRoLpDDEyNQyum/BsTQYLq07ZFGG1x0/4vIoRVMFdJpVVjYWxF9IxHNFP4rfDJHJZrBfmnSL+fuYqH7kIOSgoe9PFSFxxzwnNn/Rlv3xm04UAEGwmxYdBJjOhMErvpkUwtXpDbYxTpwgCdOM3Hvl+jiVbt2zT7/4/QSzDtPop7sfcxHMTl2vNCQtKQZCsJo4tBPrwknRFsDmryIaJMLHoWKzx/SJdgeiLFcMEPy4sZuyMWaZ4L4C8LYleP/T49g3ZljUDbgVLCIZRfV7beyqq94xDvpE7UgMbm4mcy5Phc6N+M9gbLaFLl2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbfbaa5-e916-4b4d-7ef7-08dd51b21a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 13:25:54.7204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/f4uqd9X3PxbqP8tgFt+IEBOeCUxO0sqchINCw5d1QxS55sJZQRJJVeLvf/aFKcPCYPUnkS0LV/ggweunK/Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6288
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740057956; x=1771593956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=KYhAgtTvcoFAHFuQdNvii4jqenuWNdDX7fQ8PW9PhLI=;
 b=KARK8jtTxm8qDbf+2k7q7b8hH/8WreZv7js+9amFCgoOcIHAnpe1sHRe
 k3/LcvkKZ+wOH1VfY85Ba3q9BvopRE+mwcLaa/t3Ekq3aUEzk20gjhkdG
 PY9WscOYpX+YtsLF8ujeCu0U80iVG4HzwgBVfgA3oo7LjgN9UzV9IMG3t
 MD+hwZRJrZeB36tQEV2TJSM8bK0ZlbcI/8bZLll4podVOsECiZW6TSzjS
 KJ0Jk6aPZKw1oSuS0enHWIuQEcuIxY8e32VxNHcNyMEZej77gp3AiiDMZ
 hruWQN2hbzHXMxg9y2gg1uep0v7Yv0bh0fQA8UOyyRqGUGHzMoFktrAqI
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYhAgtTvcoFAHFuQdNvii4jqenuWNdDX7fQ8PW9PhLI=;
 b=HajNY6gHu3ddGNft+1NG5nZISDRHI05ntXm6HTr+BSYoHJuCLO+XARVbiuD2y7VDb9kwB3oDPn2ejrOeChFR73KHv7DsIYhj4YehBSakm/OB9uJ5RM4VTmXhzSWi+97HBPW5Tj+mzGSI926PTLp3PEg0H8w410ToRgV1rFGZA/k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=KARK8jtT; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=HajNY6gH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v5 6/6] [WIP] am57: add dtso example
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 04, 2025 at 05:36:21PM +0100, Romain Naour via buildroot wrote:
> Only for testing external dtso build.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---

Needs a proper commit message, or drop the patch.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
