Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F7ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 11:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E9A606F6;
	Mon,  9 Sep 2024 11:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWtSdx7gcjdC; Mon,  9 Sep 2024 11:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04D1606FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04D1606FF;
	Mon,  9 Sep 2024 11:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD1CD1BF3BA
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 11:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99B81401FE
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 11:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msrzL2wYi0WH for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 11:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=975aea9dd=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 536E5401F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 536E5401F8
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 536E5401F8
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 11:01:10 +0000 (UTC)
X-CSE-ConnectionGUID: 40soxu42SW6hMkbNNcYszw==
X-CSE-MsgGUID: wG9XZronQN+/1Uaxpt/y0A==
X-IronPort-AV: E=Sophos;i="6.10,214,1719849600"; d="scan'208";a="27046883"
Received: from mail-centralusazlp17010002.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.2])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2024 19:01:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP++tFv9sxyN2UrCYTxkmDdeX9wzuMx6RJhm7GvxnI1A5nM5Hfgvpk1JWSsC7QJ2wJOfrOVuzxZY5m8meo2l9jxoRKvaaVPzRXiR0yprAgHkr8BWzkqasx1hb7su79Q40CpN6V1RoUQZuHeBbBf0KiY1kidR/46QY/6xk4HUyEfBKOp0XAIeo51+++ITpgg7SgP0Ho08rvx9Tqn7ahESmyXdhsIDr4Ba6V9EzSRPasbHSa0WlzyqSY9bWM/5SE4tMWHEKR80Wf1hDVwijDnnPBeJvZIZNchhPfTWqFbsbq5D7EcmXCxDPTFziHhf/2ozjw24gMiSjDditBfHcRWbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7tqpLDi68e3vmEfbEwIgl9xFbA0CPVp/Zp7vHZGJ2I=;
 b=xjhFhX2SQJKvjODcj+acnFPI3omCE4lU1KvkZ6WOC3Cte2NKTD8RT/JrdsI9LJUWS8n4GXImLr/LQvO5iCe+bDrG4FI3y1Wpl+xIO+9IVaqg7/Z4G8qmThIDWiH/VTcpEh8wChtJXGRxsj5Uezwkpu3Ot4AInvsfq8Fr0vi0hQJQD4BLqLWUvb18VIF5i5T+cfXACudFTQctrbLDmdRtb0ypR45ue6yB+p3+c6F5naoHP4DFyg2PNrHE6ZhvDqwqxz87uwy6xYApm6f6XEbyAr/YoU5l9b+ywc2khQFNrSzj+cRNK1pilseXon/aTCZHupnNvL0+lbLogiW5rBjbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8324.namprd04.prod.outlook.com (2603:10b6:510:db::11)
 by SA6PR04MB9375.namprd04.prod.outlook.com (2603:10b6:806:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 9 Sep
 2024 11:01:07 +0000
Received: from PH0PR04MB8324.namprd04.prod.outlook.com
 ([fe80::2b06:73cb:e6c5:cb9a]) by PH0PR04MB8324.namprd04.prod.outlook.com
 ([fe80::2b06:73cb:e6c5:cb9a%3]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 11:01:07 +0000
To: Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
Thread-Index: AQHa/SUvwik4mZfGrECETvuPU521UrJGc/mAgAAIYQCAABOSgIAIxOwA
Date: Mon, 9 Sep 2024 11:01:07 +0000
Message-ID: <Zt7VcrAFvluzqug0@ryzen.lan>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
 <20240902104433.2561797-4-niklas.cassel@wdc.com>
 <20240903212611.613c6d42@windsurf> <Ztdp2oxw8KKyKfJv@ryzen.lan>
 <317c4a83-974e-4a46-9711-f9f82f0fb1b3@mind.be>
In-Reply-To: <317c4a83-974e-4a46-9711-f9f82f0fb1b3@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8324:EE_|SA6PR04MB9375:EE_
x-ms-office365-filtering-correlation-id: 64287de7-53e9-4e98-e917-08dcd0beb4b9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?O2dlXdgwagSfgVETe/ea6UHsfCfNQuEcGlERFdtoV6kiAj6sXoqGTA9Wm2qI?=
 =?us-ascii?Q?DmSuvWLoHhBwL6OwXUIGkjQow++ZE6ChW96/SsILvzNG6SdDikEqQLePHmd0?=
 =?us-ascii?Q?Mm8++lRc4TYYbD1u4zP5yLVwhV96QSNj9OMJ2yKoVa/XQ6QFjEVYXqV86IyE?=
 =?us-ascii?Q?ixY2oSaX8x0bf1GPb6phN3XwjVOWUiP5IXvV+RCE7ECXIuhpP2zkFq27otiz?=
 =?us-ascii?Q?Nw3s5h+srPbnuqq0p+TD6H4PGsEjLHx/jaDO5w6K59mtQiS/SMImPCGfrMUw?=
 =?us-ascii?Q?uPNgsVinlLiPPumrINggHtv71SPG/1u0izHX8gn5FZiT4NgyqfCD9pbNt3vM?=
 =?us-ascii?Q?/J9Cwyj7tmp26rOT+4KD7+/iilHE5wdOpl0fSfdmTIS9iuUBtmTmsRoMO0cW?=
 =?us-ascii?Q?ynq7lx28qS7RaQmjNactFHCCrMOEVnGy0E5xkDMiFWD7ABi9Ehbc1ZAoS9wW?=
 =?us-ascii?Q?arnqx2AA0QAq70EqXS+gXyy3moMGD0Vf3xZDNKRaZ3tPZ0jh4D5qnMgjTAWW?=
 =?us-ascii?Q?z5KBSRXW9nu/TUXKExsI6tXF7zv5dRR7fRTgpCwAcZQ3TVWshlysJKH0HlPH?=
 =?us-ascii?Q?pDV8r+ftZg2V5mWoYYF19z1PY0bAp5/SUjsUOG1uqoaFuJWcpDU5AdTRB5/o?=
 =?us-ascii?Q?xnSC4PkqVqrOkLeclTPeAxgGkpbfY1QBTDc1G+pk3SfrLXn+Rbcbjh62Y6E1?=
 =?us-ascii?Q?4dY3eCt7FJ7sOu5/C02RYRaf0Fp//wDTpehcTpixgQN0KOm9rnEAqceaCO/v?=
 =?us-ascii?Q?NzLNyMWPOv3/cYscb6lP3PyIWdpnDW88FjlUNDcEvOdicYYhnqqp9Crls4YH?=
 =?us-ascii?Q?3pUe94QyV2uy44ySdg/ncNGc7SiIY0WMwfJqNdDFXB/md/lVXA6W7B2kV9m7?=
 =?us-ascii?Q?1VXLpx0otCG7ZAbX/6VnVxyUStR9Jz6qdk94AaUpp9gVzx/u42zEF3WRSpTP?=
 =?us-ascii?Q?BeTR6YwhYiO+bn8hC/+9ynF7TWndqJ64CkoqMWS0J2ySNEMcfuwHNWhYk2we?=
 =?us-ascii?Q?SFM3tqlyvo3BtK83zsW/xrI/0Tdyf1Ol4HZ9Jtc7sikWjKs8GrmiWSL+jWJx?=
 =?us-ascii?Q?fCyQ2cc24it9gZZzWToRLSxYMmJd2JfDGs8rpqdsckx1jTBqzvLLode7nKXv?=
 =?us-ascii?Q?QJe1dPVDqBmzjmXXbyFFH/9lvQR44HG+Mgw74AQIiA+Vvy1yAR59fYRXivxi?=
 =?us-ascii?Q?tdTZreuZowUgwhgR8tFnoZEpb1nAhywB2+nxF13RgIJaWp6e+oE6njgoN4Df?=
 =?us-ascii?Q?Z8K4rea/kJCHPsV/ehekTQkDfv0AsRRyijPZUEM7+m4bDDxxhRLHAZ8dgi/6?=
 =?us-ascii?Q?DP2YnszYVaABpgnX5un/ZXDmd6CshLFwQ4OpBy83VWTRXPBDZe1tPzZ14xyf?=
 =?us-ascii?Q?jU1dJ5/uWk+jrSTKxz5xHON6nMLkoGGiGfMqY7vQktYwwhh8vw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8324.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hhc0lLSzKtBpO3aXX1/hV8Apu4/MvlTGlBfzUDbXSxWtH6DWrRNstPRcumqZ?=
 =?us-ascii?Q?wQHpUu7qTa3+uuvHOPS2FYhnJgo9kjde235ObGsu17KdDSUKadalSvkVKV5B?=
 =?us-ascii?Q?owCup/ghDPTiYMYXsBkmZGfokwAWeUeq7K6TJG5FbqP3G3K3fAEK9xaotbNg?=
 =?us-ascii?Q?NKkxD8qxLAHnI0cJywGGa11KOdYqZlXdGyh73kuKQsqvRuI6hVYhf1wXT45a?=
 =?us-ascii?Q?u2iNktxUW/TwwLwxqHwPqIUWPobXe/e0jzra+IFDAwMIGOe5zebwkdUerqn9?=
 =?us-ascii?Q?NEMqpIcGM/j6Q3dHiw83YAJ8kfu9hWvsZP2A0O4oofkV7Az3tQojshJsJn8B?=
 =?us-ascii?Q?AueKWEdHgMJQFDQZF/+MSaElLL0BLUhBms7u1Gk2wbib8OJYAz6ctS5tnWKm?=
 =?us-ascii?Q?+X/ec8KtEus/a3xwbOaOW8mz7cfWTVwABgxs5pAjEclisAWV3jtH5aEsAj7s?=
 =?us-ascii?Q?uzyjLpeqeC/Is0gmxMvsOEw4VXbwA8gjPy1co0TtP1Xq1UPbKMntd8AgQSjb?=
 =?us-ascii?Q?/SLcp86vM4RmxuLno3xxhvGovTrmdxCV3HtDTxeZ5ZsHd4Yhsf4EP3awg5gw?=
 =?us-ascii?Q?G8/P0GxmTztev1KPRkL3HJdtq+ixnU/jbcdlYCclxIjyYdzzQVAW1lw3bBTl?=
 =?us-ascii?Q?eNKZ8EqjSQB2CmtqW28MWVVo6bvk8F0cl7GeZlhFEqS5i7TrD3rTRbtQuIqy?=
 =?us-ascii?Q?KKsxx6jwYj46HkBAtKCZkPi2T4UVyjHEr1qMbScBjBGZxOklUrUhhpsNy5A0?=
 =?us-ascii?Q?FPrK1eWdXXTXvwtBphyOmzRE4EiuPt0CTe2vAOAQ1DEKuLuwe/miql3qwfgP?=
 =?us-ascii?Q?veNlBciNqvCcke+z7zDfjicnIpq3Xzyjd2ANWa71MWKzPAdRpHI6T+ezCiuq?=
 =?us-ascii?Q?vGbVsZZJzTmBOlZpBZ5t6t7J9wNbQnt93qg8gi7G503IEKBDrmQ2EZZ16Iod?=
 =?us-ascii?Q?lxIxOu51TAhEASpZHnfm6iEnt6L4Fn+UiUiXlycwxeCggGmTK+X2xdBKsJwK?=
 =?us-ascii?Q?ahVNU8C3fV03KX6wenFBKymRwIsWo7BNZXqYxNW7p/U4AW1xGnMLg4SLt6RJ?=
 =?us-ascii?Q?xvkQvDHP5oKpN4Os113NCAChjF2WWci/KNE16Se/hFiNTdSEA1a7JVeMYrxs?=
 =?us-ascii?Q?1cJeLXhFt9jRXCezzTJPmS/ZmVUgZBungpJYHdoeXlZhA9kUQqfkUl/eRdlR?=
 =?us-ascii?Q?4PfWDsWfPUwrXkIUDdQ9gioBMla7VhqSh9zmGfAhiKceTfI916Xc8d6kS0I3?=
 =?us-ascii?Q?orC7hPy7+crQjzCQE5ZpHAjGfXT9UTvZWEbVEir9AK9sr46CZa1sxWRuNv6W?=
 =?us-ascii?Q?Udfj6TQXit77udXfw3PmLJy4pSKUdgYNuZNXx0mZI/CmGFGlLv3JWyqeut3c?=
 =?us-ascii?Q?1A8cEHmyvgRzW/CBYPIwtxLnOcPvLhjQGEIGv1l0haJgL16cTWrjMIW/MkRQ?=
 =?us-ascii?Q?nH1Y+lLZXDXCCCsG06TWmgCae5j77r9DOKlHWXoXm/jD9fAz44elhGzJ8UOZ?=
 =?us-ascii?Q?DcHf7cgaDapCQiQv4pdoVISTuIr2kXLF9gNhnUtmi/S1u+g2iCb63GTlyz1I?=
 =?us-ascii?Q?b1VJRjieRjzH6Bd7GL72SiEXxUfVHcWMUFRTXPH5sQjVlsoJlCgdW/PTUwzH?=
 =?us-ascii?Q?GQ=3D=3D?=
Content-ID: <B85247DBF3C24C479CBB3D123E9F98B7@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bZso7ewSpe56fFAZBTdPFOGVL5lCZkrPXBSLU4zdnFP0KpDh5IncMxiQZHvmJ1xaElZgOV6tJ8qk7liB5h7v/652nAofq7GbyYXVXrFHPWoWaxrl+6B/tlrMYP6Af3+LYc5sEaQJvWc7oHSZ4h4zBG/FZPrq0pQDVYDHbi9r7cdmCKP3Ij29zm4zZ52rHABt+ukidXhM9vZujojOXXBe9JdWfS2Z1/FRQt/giIOCJPcS0slmI27EMLUm5cfPTb+8r6iQnextOYkGffvM+aC0I5fIXkp0HuCVLnsgjujNAFXSDZBp3oO2wwQKseZ5LRCoMwAoJyyLoBBTPRzfZT9L00PDnatfmvzUrdOIlDRLbwr3Wq8MriMU/v0PHhfXFbOzb5S8xDS82ERd3/e0kKfewXittJESzF89Zmf73fLpUc3MD5W8GgPRbcPJ3iHMacgD1EUk222lejPuwCGkZs1stXmgWLELtFvaNmmEshUm8eoO78BJYBSEGb6krE4s8eeARKYoA+9IhbFMJKXNtgdg4U58hbozTTCQyISr23e/RQyVvjeGBSbVFID6HgvZ3bWePTguUG4jchzmJxS3dt4vqE83ppHaiC2VWSnrxR7moEoEZW+m4arvcV2R/ouI3xUI
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8324.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64287de7-53e9-4e98-e917-08dcd0beb4b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 11:01:07.3785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HceXqckLvQuhvMrdtgyfiyjpf0MHC7T+2/MzmBQPAMge/dGYKAOyjlUhTDMPESVEZIysbrg47lq5teOow/qjrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725879671; x=1757415671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=QIwv/dyngKEMS5oK2wdPKcU6TUdtr33i8HH9ZaEG19U=;
 b=cpWu2O0K+gGPenkldQLqXEgWaMyyP3CVbpqYm8d18sdTW5McQrOCkT3c
 2/ySz/qzPku7vWvmRm7SBBHuL1udw3D2l9XeM5bAzX2dV1m98YyksPcQn
 mnPjZ25vKOpdrs3hEF9vEE9WcrvhZrKUJ9Xwrw4Zq/aRyehHbyo15N1AQ
 kRoujxhsr/51hJgcwhKo8nSFMtlA6stajX9Dm5XFFLy4KUbQKjpdxB4fa
 yQwwGjUzXrtFgRQ/kska6cNUHwlQboPhncKJZLMv5nQ346RW7yIaSUtYy
 xuLDg11gfGQM/mo6JGDRY2ptHYKobHEASFfG7vXY7AelUhimj6tAAmj/q
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7tqpLDi68e3vmEfbEwIgl9xFbA0CPVp/Zp7vHZGJ2I=;
 b=jZMlR0zA/IQB2XkMzYO3WFEOFZ6DPo0dTOqfnknpZPeP+jR84uf37u7FSaAD9sGPll1sjmZEg+6ajgxEW+Khkm9ApTYpJP3NMLy7EUYF1RE7HXhqPnKDzv4sLXt6JcIVE4Twx6LUOcNM4n7wpEKv37jtRZVtXxaGAlGlD3oaEVw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=cpWu2O0K; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=jZMlR0zA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 03, 2024 at 11:06:13PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 03/09/2024 21:56, Niklas Cassel wrote:
> > On Tue, Sep 03, 2024 at 09:26:11PM +0200, Thomas Petazzoni wrote:
> > > On Mon,  2 Sep 2024 12:44:31 +0200
> > > Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> > > 
> > > > From: Niklas Cassel <cassel@kernel.org>
> > > > 
> > > > The arm64 defconfig enables both the R8169 Ethernet driver and the
> > > > PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.
> > > > 
> > > > Enable udev so that these modules will get automatically loaded by udev
> > > > after the rootfs is mounted from the SD card.
> > > > 
> > > > This way, we do not need to build these modules as built-in, and we also
> > > > get the benefit that any device plugged in to the PCIe slot will get
> > > > automatically loaded.
> > > > 
> > > > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > > 
> > > I'm not sure what we want to do here, especially when this ends up
> > > needing net.ifnames=0 that you add in PATCH 4/5.
> > > 
> > > We do have already a small number of defconfigs that enable eudev. So
> > > far we only use net.ifnames=0 in 4 configurations.
> > > 
> > > Basically, I'm trying to make sure we remain consistent and have a
> > > policy that applies to all defconfigs rather than ad-hoc solutions that
> > > are different for each and every defconfig. That's why I'm a bit
> > > reluctant with applying your patches as-is because they only solve the
> > > specific case of this defconfig, in a specific way, without creating a
> > > clear rule that all defconfigs meeting a specific situation should
> > > follow.
> > 
> > (Replying with the email that I have subscribed to the list this time.)
> > 
> > 
> > An alternative to specify net.ifnames=0 on the kernel command line
> > (to disable udev predictable NIC names), is to create an empty file:
> > /etc/udev/rules.d/80-net-name-slot.rules
> 
>  Well, I think Thomas' comment was primarily about whether we should enable
> eudev and dynamically load modules rather than using builtins.

For boards that support USB, PCIe and HDMI, I think it is a good default
to enable udev (or mdev), as you could see from my other email, enabling
udev will load 45 different kernel modules. If we don't enable udev,
lsmod will show 0 loaded kernel modules.

I don't think we can enable everything as built-in, especially since a
user can plug in basically anything in the PCIe slot or USB slot.
(But I agree that keeping e.g. Ethernet as built-in is good for NFS root.)

E.g. I can plug in a USB to Ethernet adapter, and with udev enabled, the
correct kernel module gets loaded automatically.


> 
>  Passing net.ifnames=0 is probably the easiest way to disable predictable
> NIC names. Only, it's surprising that we have something like 25 defconfigs
> that enable eudev, but only 4 of them enable that option... We should
> preferably have one "normal" way that this is done.
> 
> 
>  What is BTW not clear to me is _why_ you don't want predictable names.
> What's wrong with BR2_SYSTEM_DHCP="enp0s31f6"?

Well, if you do a:
$ git grep BR2_SYSTEM_DHCP
you see that everyone except:
configs/ls1028ardb_defconfig:BR2_SYSTEM_DHCP="eno0"
is using eth0.

But sure, it would be possible to specify the predictable ifname.

I guess that it is just a bit unintuitive that you would need to
change BR2_SYSTEM_DHCP="eth0" to something else if you happen to enable
eudev. (While if you have mdev or neither mdev or udev, eth0 works fine.)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
