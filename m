Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2049CF34A9
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 13:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 768C7607C1;
	Thu,  3 Oct 2024 13:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NTrPlHo8XeI; Thu,  3 Oct 2024 13:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6174F6076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6174F6076D;
	Thu,  3 Oct 2024 13:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B808A1BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DA7606F1
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4VnpfNQVPc9 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 13:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9124560664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9124560664
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9124560664
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 13:45:18 +0000 (UTC)
X-CSE-ConnectionGUID: Xv/EXHzbQSu00voD3hu+mw==
X-CSE-MsgGUID: G5IrjnbPQQKgxW2RXZpQyg==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="27547105"
Received: from mail-eastus2azlp17010000.outbound.protection.outlook.com (HELO
 BN1PR04CU002.outbound.protection.outlook.com) ([40.93.12.0])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 21:45:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgUxP6Mzbg+mAjy46ff1Yz8BNgef5MvwDtKcVlpRSxj01LJnJelMvF1n4u+k2FGJy5zOVWRU5Y9m78aU1YhjjZwmvqnyQkkKlT9Dg4APIWX5bLip7NMQMIB5DiPQ3T2zm2TOnUJa/3MY6Vft5oZOt6g+APZBsnXyjGMY9XLmfYHX9z0vXBRjG8Kb3yAYb/jlEec+e4Rdb9WOynOTlPRJ28k4wnG/VHLzNg2VHVxWZNAuiJk1TIcJd0QSvy/R4wpXJqakcIlEB5tBiEhMmfhMEiRkFY/tRJFhq9hVYlGoPHsKx0OX7nE6yYbCvqliTjf1SwBLZ67iS7JnOXD5sz1Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSvVFV5MLZShmmlOlbIaZE38Mqh6KPRyikEbCS96KYI=;
 b=n4pXXe/8P38bOHL8rA5fO9IPZboqWUa7uI1B6shrZnUKeorF+f8SNYInrB6sYzcEzOV/q9u8LnjvC1fU65F+Dy/ytObQy35TwwIZLSPs8gc/vEMaHUyaJVN5vr5FzMXJeBZLc3jbDLuN/dvUYaYtMwtTFs19zSqkJgTNheASYX9232AKdt/G7a5RPXuW31Ps+UTVPRVy6zB8cP5QSrYjRFwVwURb+DY610+wFL/RQ3MoRfaLJ6w5LdaQUBM23M5ZRwox3ZybnliJjpgThABuwRm03LM4YhGkTMPyy+RNbyh4JdOKeAcHdPuMkF5XTPFeai76CFOHRb5oeSKX0SXcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA6PR04MB9352.namprd04.prod.outlook.com (2603:10b6:806:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 13:45:14 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 13:45:14 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
Thread-Index: AQHbAuUc1CB3U8OPVUq64u+ENUXuQbJXwU4AgAPx8gCADVlKgIAMIpyA
Date: Thu, 3 Oct 2024 13:45:14 +0000
Message-ID: <Zv6f6eMFxAUl5EuI@ryzen.lan>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
 <20240909182103.3667296-3-niklas.cassel@wdc.com>
 <20240914222032.3fee5e2e@windsurf> <Zuk_RMVJAzqVO5s8@ryzen.lan>
 <20240925222613.3f62ed72@windsurf>
In-Reply-To: <20240925222613.3f62ed72@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA6PR04MB9352:EE_
x-ms-office365-filtering-correlation-id: a96ccd71-1e89-4c84-38ca-08dce3b19bd1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?zlRHTPMGTi+oezOcQeyiX59wWTjOxgUBtVqEeSHwMELA42hn3Rebc1rmf0Kz?=
 =?us-ascii?Q?nKUdhhS0xrfF2Bw18L6LwRVr2byUf9eC00UGK6p001B6CRcCxkmFtilJ1vrX?=
 =?us-ascii?Q?5xDqHws/AatUHmLMJrZP3KOyhkOzGsdhWlS2V46ENui+Yy4OZ+oLj6hG6lun?=
 =?us-ascii?Q?TqLbE+kws5msFwixEY0A84z9iTEI3LGElyiDFZThQ+bxYg7ddwxg9j6izd1x?=
 =?us-ascii?Q?VjNByBP09AuDlFKmis86ONag4S9fBACCRLa65IQV0KwqUixiBN6OwHrCGLxG?=
 =?us-ascii?Q?k8NqF38jEgETCWBBnmJgWkXfio3EaKknLrvm6vYbHBu6vH8JCYHClfPJRgMD?=
 =?us-ascii?Q?Kjd6cfb5hTjnmHiST8kPvZ4e4Yo/Ptc+T4MYV48nHe4xDF+4ftuyVEkgiuiK?=
 =?us-ascii?Q?XufvRMiIGFDmaTVHrzBI+poNjIM0hZpcaAjQGcDZ/48kSBW2fh5+sUd/j8b4?=
 =?us-ascii?Q?mnQlZyJBIC1vXcqQX1U8sIUas2x+N4uwEyadbE2zqst1hneW7njPYFhhAQ4R?=
 =?us-ascii?Q?K7eDwrmk6mahLAUBUIMfNsnhSlgh2f64EdNzekNHy710Fem/NrXY5Uzah1jk?=
 =?us-ascii?Q?D+PU/0kOvU0y9POWxoslQ+VN7MVjH2nWPySb5mEefCWwhs8/q3cpO/S2Oo+h?=
 =?us-ascii?Q?SNl/2LMEPCZx/M58vOB5Pxh7YHAWITRQ4sRq9wUCdPsmgRGPPiUqDt/XL11i?=
 =?us-ascii?Q?Qn8oduJhtpXt9+LdkISHe/8NvGi0oC/xA6lPiXu8DhKm2IPDIULCurHwpR3p?=
 =?us-ascii?Q?3+Lc5he1eFfMxhcyMCWSZkLyc5aU5my+S2LC2AdLu9/tOrGQMT0EmRB0BJE8?=
 =?us-ascii?Q?Vjw+QU0jQvVIYyeNnlwlNFX2xVx9gJbeW/wPob8U6BUBKdjb7/9hBaeJFbFk?=
 =?us-ascii?Q?sPWm/Mfb29MY/CjgX5w3noPr77oSioG2uAJumX2yTQ99kcHj5uoXPmVfeMNV?=
 =?us-ascii?Q?Ohc0xt3eLs57lfFg1cDtf8/Yreo9ULlkkK0wFVZltLldK5LcOy/FkPXXIR9A?=
 =?us-ascii?Q?qryGvDIdRmLgY80wnbtYtldscL4U/30RyTiWpmLXLiYdtXhE471fNu5I9G2J?=
 =?us-ascii?Q?Pz3y9O7I1M/Cgix+jRlZ9i3duRqWUI7N9POd7V3KQkD4iXR7cH53ObpxZMBm?=
 =?us-ascii?Q?3CW9XA4lLqQULLWlx+f3qwFB4G2umHWZIHxsbbhzzMjyHem1QXN64+CeiKyd?=
 =?us-ascii?Q?UUmg2VFba0WZhOqTgU3fcXJoJ68o0Yt4dn3ACro0u6Uing6sDeQggVyBjtoJ?=
 =?us-ascii?Q?sWSh9+yP2jA4NLGLthdy1sJZZ5ftm4QYg8WY1kmqZU0ljHuiRIzFwcYDfr1y?=
 =?us-ascii?Q?mDnRJ47Ih0uQ7EqWN+iqC4T5f0V1hMYSEPUGBjcs1N1f2g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gy/q3NOM/vdTC+Xdl9vKPDpVU4x78AqupsI2qstn+sEUDDGd9cI6S4UrXehB?=
 =?us-ascii?Q?TxpiIwwUweU/Wb1JrCkr5kEXH/bWhjMn1b3mdeo/jgkER5LNCCv5qUzM2qEt?=
 =?us-ascii?Q?8+en0/2dxM6okgEGoVRsp5/iW3UreNKnBlZT9rRFAE0eKBTMMhO10y371sWT?=
 =?us-ascii?Q?EByD9JdrasFNoBMV3qe8MeF/r/38SVhHub9NNzc+z4bC0OZ+Y3Jt0Z8smQyi?=
 =?us-ascii?Q?VQjEgcwpsBbTV9IItUijgsYIsoAO6bXCYd+dcYw8/+y6lWlHvXucYwRke8bf?=
 =?us-ascii?Q?B1uR+6w1srzzGNhrxyh8Wc9z8M/rc1M53tZ+HDseFa8n/3KQzQkWM7AjRggX?=
 =?us-ascii?Q?4cZgnP+9R+QgRZhDd4aJInYuEoypAsUPIGSCcSWU+VS+hwF/Kv+FJlE/6F6V?=
 =?us-ascii?Q?UZKSv+LgWDFSjdBMPhxvytADU+ZT4mHBmkNAsu534L1xpVaikjiBJNoA5TrX?=
 =?us-ascii?Q?T0rn6nUYKYhEKMQx1T83SGRHRRumfWdrcOuaRPwWaQ8VOegPsd5GDO8K8KvW?=
 =?us-ascii?Q?q7v1b3+HJ/RXcPW+SMENxcXWyKH9T/BlX6LxDAplpa4vJS6lsw0fQwC0O5Pw?=
 =?us-ascii?Q?cr4Xpt9vrrumplcsqgfrHPWk4pZIUgx6rRvvdUECN9maBAOrzBxUimGsWGJp?=
 =?us-ascii?Q?mM11kyhAbyuRi4yd/1PVq03xzuU3RWi20pjgkDbDqo36yF9tR3vtyuNR/p6+?=
 =?us-ascii?Q?g6lt6KrFoPXMEOZVrPJWGmglUVcR0SLbodMRSM1dPp4z1X12zsBq8U4ULNO+?=
 =?us-ascii?Q?lVItTaaoJQFSiPSfiQcGoWthGe32nELl6YgDr9JUmCkYFP2/6RXIo1gMN0Zf?=
 =?us-ascii?Q?Zkaxums8GPTmEfds1eeGgRosVZBQQo06NjEXdT2Jz1GHm8R8fVrcSDZqZAYY?=
 =?us-ascii?Q?zMYT8O+YRKi+yEgZpeRpJnxPwjRWhS1NbVlWL5plRm4xktNrIO30l6jvO+Wl?=
 =?us-ascii?Q?R1uzNUJnJ7tG4o4rx9vN5bRNpqREQWEQ9U4ybLNkGxcXv/+12TSpIAytvWKc?=
 =?us-ascii?Q?OV1n2WGYsClKIdFLysrWtyeuYy82/QLyzGnwy97R02WfQKoqvTLXJ/XiJkBd?=
 =?us-ascii?Q?mlsCyXUpUWiG17uFdsQL2N6/PEGwGr+W2X6GuhBQNcayS/0Qn6s6KFRY3asV?=
 =?us-ascii?Q?imoUiQh37sZqFav/0T1FE3HYLkzdYAsHQsQ9vaOrUIv3t5TP7aSvOlFvUZ9n?=
 =?us-ascii?Q?sE3JYpp+KIf5H5JKkGSkwSpgHbEyf0iirFcrsllLiEHMvBkiQW6eV2KrnJ5A?=
 =?us-ascii?Q?B75qWsS3LrAxVrAVKSLi/Z+R1j0ZQnUPXsdYtkOzOy5o7KMEJfBXq3f1qd3c?=
 =?us-ascii?Q?aMl+8WoiN2iCl1ScCfnNaA8+5eFSPqFjvgT3i+uqFXIc5kfS38CWI1umrx4j?=
 =?us-ascii?Q?UXDC7Wp5+zOb/Fr/xgyCv4isFtstuHEK4xPTeuKIsSTvFJ5/YZCwq0boJEQR?=
 =?us-ascii?Q?BRozndaVE0EsGSMM60HDkFMolBXSkgmUAFlvwyeEHuoChCM21Oxa1I3u/nny?=
 =?us-ascii?Q?cekoDw+Ha52FYxpIMvbo6qjsYI0hjcHO/EkTxWgFFCb2p3FJQK5MuyDAtFdx?=
 =?us-ascii?Q?gH8ZzZLxWozhbFPIDgm6GDBey8Cl7+tApbghYvJ64ktJwmlbGz3sB06ypn4T?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-ID: <F0C3579B5C4519499D6524D6F0632534@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M3MCcEGW0f3sMOansxiOOn7jVsf7EuBR1/dKfFQBvpkeeT8Zhl07Y6PIiebIvq915K/m7vFxNGdeDCCN9k62B2O8G/FfXLKM5rI5H2e1FyQzUzxWttRD6EvRiRfhAOGQEVTX8VcgW26UYJJTkmiiLwi/PA14Q5jLjwivwD9JkL+vG+NkvP8cvXcV6sAcRh1TdjStF7Mer9cRPI/JT7hGUDymiZnZH9DIsjdnUN1+kr7DMKXJcgvtgUTH/z9JzC7GPdo1QXZfTjKNNYbvL+ojx1jqSo1pdyVZ361Vze2HOcBk51wUiD1Lw+IfchcEm0AOcXR9Dp7aJMTMzd3Eys9JSDoTTdNZKqA3JMcb2SXs1cucOX7Exvcd5bdcCaMaxJwgSw9fQcmioISIKBxYOlJOjhawtYUl/Y9sNZfA/ftrIcls3Na3K+CBSCZi9EJuJVsF0DfWJJ2s5Yj5Ft/fxbjKG1N5R2JwH1deqmudzLvve2SGC7T4YFAXIQAvMBAzJFb2SAAurTWoEe0WP5ZvXQYmzQLJRLA9k3A+edRTS4kS/SaNdXLDegUjXYeG5mBSxZd4fvkabbCGN5/2R48tmdg3PFGPcJiybRxoLfKy8GV6aWMp9VBXPr3jEgZq/GBdwLMX
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96ccd71-1e89-4c84-38ca-08dce3b19bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 13:45:14.2139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAn0xXzWefZxXKMr/S9BAKXp5AEmwlC1T+BW/PFbVn8TsBEAn9EMof9RdRMSo88at7VyiCJwsgIaiHpimWAHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727963118; x=1759499118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=FRBD0pCOhSo1i20wjrLkpR/iAdu9IjpJhySr0fYVk+Y=;
 b=hz8MNEBD758jdP60uaampl7We4v3NMJJzakyGyGwVlhuoiTm6laHZB9j
 7Gcw/ha2buMxy2GLfxDCg4HNzT7ZMGIKRcfQs2HbWRvUqzknMQWU8rWtu
 6jGNU6XYczEHH8CcB6oDwn48TI83GVgOYLf9J9X30AfM8/nPHKCv0y+pE
 PstGRmlBR53Fet8u3ADQ1HWGEY0vCyYSkIF+oatHnjvEifXAAtzOZfPxp
 QhS+NwX5PBGaxPY7lfMGL5AjyqeDUN9s/7D2DFSl+ua6guG8X5vTz+lAx
 IVwNZyv2rOGmUGJYhTpO54+81jvcRGsMd9L9d8xaABNBjS/17exSjaY+s
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSvVFV5MLZShmmlOlbIaZE38Mqh6KPRyikEbCS96KYI=;
 b=ruf7Lqo6SML6ksE+rXul13QXbejcI6xTgTYoIeHpv0PmcGEh146+XoA8DrZsnbKqF7E7IDSkZy7KE/lfnun05+/KSqEOpg4F2dPOS/r2Eozy1cbM00mrHKZDR62S2zRrIyxOMk2VobMjsPcBvasXAu8N4p52dR1V4triAP+RO6c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=hz8MNEBD; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=ruf7Lqo6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable
 uboot-env on the SD card
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
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Sep 25, 2024 at 10:26:13PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> It was nice meeting you during Linux Plumbers last week!
> 
> On Tue, 17 Sep 2024 08:35:16 +0000
> Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> 
> > > This won't work because the output directory is not always output/. But
> > > I believe this is useless, because you're creating an image of what is
> > > the default environment. So basically, you should instead not create an
> > > environment image at all: just tell U-Boot that the environment is at
> > > offset XYZ (or even better, in partition X). The environment partition
> > > will contain nothing or garbage, so at the first boot, U-Boot will use
> > > its built-in environment itself, and at the first "saveenv", it will
> > > save the environment to the designated partition.  
> > 
> > Well, what happens if you simply point to an offset or partition that is
> > empty, is that uboot will see an empty environment, so it will see bootcmd
> > as empty, so it will just enter the uboot command prompt without booting
> > anything at all.
> 
> This is not what should happen. Indeed, if the environment on the
> non-volatile storage is empty or corrupted, U-Boot should ignore it,
> and load its built-in environment (which is compiled into the U-Boot
> binary). Why isn't this working for you?


My first appoach:

It turns out that is you use:
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/radxa/rock5b/boot-env.txt"
Even if that file is empty, if will have a correct CRC, so when uboot loads
the environment, it will successfully load an empty environment.

Ok, so this is no good.



Second approach:

I tried to create an empty partition:
	partition uboot-env {
		offset = 16M
		size = 64K
	}

Then I can see that uboot uses the default environment:
Loading Environment from MMC... *** Warning - bad CRC, using default environment

However, it then continues trying to PXE boot.

It doesn't try to boot using extlinux from mmc partition 2.

Looking at why, it seems that it doesn't even find the boot flow.


$ bootflow scan mmc
$ bootflow list
<nothing>

If I don't have the uboot-env partition:

$ bootflow scan mmc
$ bootflow list
Showing all bootflows
Seq  Method       State   Uclass    Part  Name                      Filename
---  -----------  ------  --------  ----  ------------------------  ----------------
  0  extlinux     ready   mmc          1  mmc@fe2c0000.bootdev.part /boot/extlinux/extlinux.conf
---  -----------  ------  --------  ----  ------------------------  ----------------
(1 bootflow, 1 valid)


So for some reason, bootflow does not find the extlinux if it is not on
partition 1... I've looked at the bootflow code in uboot, an it appears
to be able to scan multiple partitions on a device, so I'm not sure why
it is not working.


My third approach was to use:

	partition uboot-env {
		in-partition-table = "false"
		offset = 16M
		size = 64K
	}

However, genimage does not allow you to use '"in-partition-table = "false"'
without also using "image =". I guess we could add code to the rockchip
post-build.sh to do "dd if=/dev/zero of="$BINARIES_DIR/uboot-env.img" bs=64k count=1
and then use "image = uboot-env.img", but that seems ugly.


The fourth appoarch is to do:

        partition rootfs {
                offset = 16448K # 16MB (uboot env offset) + 64KB (uboot env size)
                partition-type-uuid = root-arm64
                image = "rootfs.ext2"
        }

and simply skip having the uboot-env as a partition.
This works, but is not the most beautiful either.

Will submit a patch using this appoarch and see what you think.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
