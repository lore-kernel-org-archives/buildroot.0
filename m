Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CEEC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B5983B5F;
	Thu, 20 Feb 2025 13:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flcb66PtmBge; Thu, 20 Feb 2025 13:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9B983B07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9B983B07;
	Thu, 20 Feb 2025 13:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DFD2D92
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3200E40096
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xEkUVarvvN3 for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=1392cf689=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83AAA401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83AAA401B1
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83AAA401B1
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:43 +0000 (UTC)
X-CSE-ConnectionGUID: 4Td7c7umSnK7Tzi878S1vg==
X-CSE-MsgGUID: +S3mT6FeQISvIxI4Wsw/cw==
X-IronPort-AV: E=Sophos;i="6.13,301,1732550400"; d="scan'208";a="40000803"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2025 21:25:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Htr6KSJrgwdfwu8nPNQWIf54K+r75N7C+T8aqqMXEvWaWwxCnPTexIbMOAPf1f7RgyqzmIlDi92vM2yGXd+Lhk9b+DGF/SPbS8tqt8XPEYQ5GSgbAy/9eRDDOu+BggJh+Di3w/xWrh7cjI6hCOSeCtu+6ccuDCwzfen+ecMHtBWe002eB43yKl3ArsG1i9xg4UXW4WCfaWMN4VeL+S/mlklXFDlVa5ola0CxXLkDUFeb0qJz7h2+iEjZ5lUh/6hyVlfMqlGcp9NRruT5PZbjaAHExpEOijd2lVZCqmH+PqHN6qRpaEV2wfGs4AMm15ur4oZnVmeq7LR/1sL3mlS8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9/3eEGI9nC9oMksXXKUGwf0SErLKwZ1Q47d3aqP5K4=;
 b=NkT4rWnsjWyJqh9OPmCO1blEGpSIqr7gr2DQP0LYvwMI0RoXTUxypegCtU+TpfmHc1AF1+kIDKG1YxstsiIoCS9r/nb+9f//fUZJULTVSNWpnnC4ekFB/lxSaZNX+/tPkkt7NytDFnVr2RLuTqO34+a5Nr3vbYxCqV2uJ4aG5uZa66f5i3A58rzHD3rsNW71pNPOvEGlj6E5s0CaOLsp/o6tE87fqRoeONa3Qa3Ix4qU/Nz06Cg16waowN6HAg0tp7icoacFRFIDgy32ughXRccQg1hUFTYEIraLgqlZitZfgWRiRfY/eZHgGI7bKj8uD63dyVcR7YZjelBXsntknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6288.namprd04.prod.outlook.com (2603:10b6:208:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 13:25:41 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 13:25:41 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Edgar Bonet
 <bonet@grenoble.cnrs.fr>
Thread-Topic: [Buildroot] [PATCH v5 4/6] configs/acmesystems_acqua_a5_*: bump
 to Linux 6.12.9
Thread-Index: AQHbdyL9PXPKu+KikEuZwxyz1OOYZLNQR5gA
Date: Thu, 20 Feb 2025 13:25:41 +0000
Message-ID: <Z7ctVCChIdUiW-Oz@ryzen>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-4-romain.naour@smile.fr>
In-Reply-To: <20250204163622.192932-4-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6288:EE_
x-ms-office365-filtering-correlation-id: bc455f32-7ed2-41fc-7f26-08dd51b2126a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TJG9noSZHIqBwshHClc/seoSmUro4Uq6sVRVGo83y/vpOHyumYmyzYryAd1Q?=
 =?us-ascii?Q?QFuLoG1exvsXn0jBKOvT8dLy/NwhMK6R4z9R17/9XAzHY80hTDr+2ceYoGl3?=
 =?us-ascii?Q?+4TWhfgir7uw0QZ3jCOgCYsVPWc4zBsT2VaIXQDqOOd4yBDHqRNnbT67bNC/?=
 =?us-ascii?Q?/0lsQS5T28YfxiNKSSBkumfO6jJs4mitoPGQaD2SYmOzngZL8BfxJjk1E7BB?=
 =?us-ascii?Q?982E9tDRADNhnH/bJsfiJ0fViuG3zewoz0mSYd8/Y/3Qc021ew61zJ6bDwwL?=
 =?us-ascii?Q?v8zsrtIy1CghAsecW+8/oicriwKscZkEg4Rk+e1F0q7dwnLssk5rMvJZihfi?=
 =?us-ascii?Q?hDSDGDBihbLFXuV2fd1fLvnaCW1NWdwhqGf/g3Ht1Yex88HsXtjDI9uPV04o?=
 =?us-ascii?Q?EJ0DTokQf0lAI6++9hfEDkPvRBzubsNvtn8wER6FplrwHK2OjnLeqGIDsEK7?=
 =?us-ascii?Q?ckfBwP/0ao0yNCLSwzUA+jgwmGMEeALheYvPdfNlRAIC8i07qXkawxS+VL0Y?=
 =?us-ascii?Q?ZT4lr1+nZFwlL80VMjckB4yK6CVvqi2Dx+XYec2cqPBBt4OIO65mqSX7DF/g?=
 =?us-ascii?Q?zmg/DcEIF1a7vxxcqGbQqlIyghsKICV4p0OxKzYSiTnMwVEi9hIhnWK09JV4?=
 =?us-ascii?Q?6pbED4Z39L49VyLBi8bC5rHuQE/gWMiyOMq5g8bJ2DKhDloyDQtwVm+dTnlX?=
 =?us-ascii?Q?rIqdxRoL3eTNGDkNB7cFaEN8PcHXATnSeBS0aYLYkML/U5MIMKJ2FOSy+LQI?=
 =?us-ascii?Q?rjGApxmk93w1WZe6Up/I4gEP3pNqh/rmiiTfqv6jV4/GhQButcfB/L72nY7Q?=
 =?us-ascii?Q?ggn65ogLlE3W9VwJnBw5JKu+IwgSYIPIZ4R6/X/yBdBQIgK01wtkwBqLuu10?=
 =?us-ascii?Q?NB/Wec9n+SPBgwNrcl8/jbaXXvQrqJGBxuQvhf7ueIIMaJzdr83JskdJaLxE?=
 =?us-ascii?Q?QX3/nQ1x/2a7RMod5hq/G8oTGIUMJVLESWWBV8QJUJjBBoggrC3JqhafsEhr?=
 =?us-ascii?Q?DDvMv5Qqlqw3ucl9QcIpytMd3hDM5cgLipkWOWwf8hJabxxS+C3iemakVoH+?=
 =?us-ascii?Q?jrnyQNPvw9Tyel965FwYj7CxkwtM9/ozdPIbqrlioNujlIbtoEoZgSH0MtFD?=
 =?us-ascii?Q?w2qnzk0IAJ2CIirQxTLodaoV5XyrR9vOW3g49HL1eRXsgz2Zod8s+1kWLFH2?=
 =?us-ascii?Q?TY+UPAm1qQbx0PRD+Urz9GColXW06DB2A+C4DOYVcBjUV7A3btH1XjYYjHdN?=
 =?us-ascii?Q?xOtu5/zos1QVgfNnz08ItRP14N/+TnuxcQy6GOZ46JU02joEZHgmYmpMtlwe?=
 =?us-ascii?Q?TrzwO+YZ3gT48dMbX7Jx5f5gHZYUEshzbEtaUalI4bkWL/jcr6pnW+Jc3xUn?=
 =?us-ascii?Q?d75Bh9MQ1QRXKhvmnn3Dsa4taH8Lh/IvA8qtKSi7g4Lfq4+eEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iJRnQwVt3/FKvpU+og0pf3/rz/sGMcTP3bw0Ov52ukHs/iwrIKJ6kFs9jUZA?=
 =?us-ascii?Q?/Gf2UN9Re0OxJWt2QGj7xhRGEWqi5/bo1Qul6CW89sWTlKbHabIltZq2x95J?=
 =?us-ascii?Q?ygMgoBCa2b++mzFSaIiwajqD9iGfZRZDWL05FInBG7XRNai+4i/qqL+CH7PM?=
 =?us-ascii?Q?nNcIMj+brpKwjD8orzF6k8qq+2zeT8q1MglUK1jo0IYyH/0J0wFRw2RZ4/il?=
 =?us-ascii?Q?XaRckJFreyGTrVtZWy8B15XZChBnQQARvzHgQvv7KhjyQ2dbvAyWdq4dy8Cu?=
 =?us-ascii?Q?u+iMI467mY8VwWd1lUrpAerKTJm7Nllb+wqE3D89xmpdEy5o1EF6kcBeNGA/?=
 =?us-ascii?Q?yYM2SlvmBhWn9m8tO8MmbhFq80BDw5+0qskn5Lfx8JM5OiovwcfwPZE2EaMi?=
 =?us-ascii?Q?wAXIRiBCRMxFm/qg08UPeEaNkP9jrACH1BRtkRoE4DFhbBjowoa8IYhLrmBg?=
 =?us-ascii?Q?Ph+NoOs5er4zSb8wkdUeYRZtlDXI4M2OAvbBt0XDGrz+Vt3akgIX6myWnGKA?=
 =?us-ascii?Q?utxbU7bSKDV5k/Oz9lOKCw80sPIFSNVeHkcYou8mDvIAjrHB2ZJsL6IdH0eC?=
 =?us-ascii?Q?XolxwjZDVpSL3mUkdNvoVM/AEiZqXhDy69+HDF3/nrfZ2Ea3NHEBDY7/1OFo?=
 =?us-ascii?Q?3Bipq5n7CefJa3jaf5aHLDW+BIo8VJ/iGDjs3gM2Y0o2p4a+MMbUWrNtLP63?=
 =?us-ascii?Q?QOmfKLyF4+soolm6rxjL6P7kdX3t/ZTUdlw0Z5HxB+sKXjZuLbXn/qYOcl4J?=
 =?us-ascii?Q?EOJ75gk+uUvqcEbrsqESEGS7iiwyDDrT0/qH/X5/vOIP1iWGM3oRWFM80jqP?=
 =?us-ascii?Q?E7fKdpCtfXMoGUovezLv+1Xkmla1g8cf6X4HajfTaIjqXDWFuboh+f7whisB?=
 =?us-ascii?Q?bFSH9w+3AlzJ+pbDJWvpkwEeO159+On4z67ztHcV+X5NYf8Q1/hat2L1mnGl?=
 =?us-ascii?Q?o6m8Mab+fYPwMfDMDF5MBJsmhKqIyHda8HWRiDnfAYIatJH0IXgouAabyc2d?=
 =?us-ascii?Q?kkOZGJHU/p7N1dSK1csNBNRIsjjkyjQhf4f5ZzOS426nQ++23Lnvuqcl1xiA?=
 =?us-ascii?Q?1NtQudRzHpsuKDDzeQKXiQzO2nMFZd1JVprZuyIbFJBieR7nlAHbLspIPZZc?=
 =?us-ascii?Q?V6hYN7ndYwD1XA3Ue0qhXPfN5e1Vl9pLZ0U7ujJmrDMOu1VhoG5y9myv+XvX?=
 =?us-ascii?Q?Wk1DhHR0fmQXtirkIsTjTrDtZE5zBhqKDy4T6nEAxwf9/lynKleY3NcbjrOB?=
 =?us-ascii?Q?Gj5EqBiIISaoOtXYUEwfl+HE565Uwmya2RyXJHh+FcWjgw5QuH57/PWZpHhM?=
 =?us-ascii?Q?lYSP9GOCXxEEdIguDXG5k0VxGxLT6aiLyZuhoUAUA5dgFLDagWanZnk7l9wq?=
 =?us-ascii?Q?LN5ztekMFXeFDTLdXe1aZD0JF52WvzQ5tPV4PFiurE6TB3GtBIi4CvbPdu3C?=
 =?us-ascii?Q?258eW9eWKxDaH/g661XRbJU/wnLOP+wmO8rI4yR5mfWvopGFm2EQ91od8PDu?=
 =?us-ascii?Q?o5jjwuHOwwGWzqN44NuG5n96ul7V7YeUbnDzPF+Ig3Sgr3jYs0NpWLHfGE3p?=
 =?us-ascii?Q?0WZp2B+JiWYcQJdT/vOLGoSeu4olzi146G5jKNw29CXjzx4p0UQrMVHUmjm8?=
 =?us-ascii?Q?jw=3D=3D?=
Content-ID: <2CE33F37D21B5D4D8B92A1625321E04D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1PujzgfMPydeSi74Roe489KMMcjcHzEUfaYbI9y2L0sHJ1+um5LCZovQMIqMZlYj/25diybr32cDLEQtDlt3LFLMWLyjs6PwsrH9KQL6xnU9OA0TRiK9MCWQV6agVYofA++UUu1zQDC3riHR/ELtRcKOIaHU6w5pU6jP7H5S3PxKFqdFOzHmHTuEVzCSrpMHzLIbygC+Lmh7M/9hCku+Pjsa2EPwPYTZK/3n3gknVQqgEaK5MXRiOmwivBZCP5cJzcQTbg9Q3fbmdNaKLtBXZBL989XCOVXMpbjfrAGIr7bORGUNoqxqe5KAh+j6Aib+B/qTRsaY8yDC7tlNIEmcdxb/bHrtF1QNEjXFc0M/brk32wpWS0Od4IrQ97DkEpzMsXtXOjPivpz8rUsjJ350YdOIpwEH1ZJekY5N51avPLJEsrgJlQ/CPMBAapJ8xn0wXDt+WTLxDyhTjHhKyqGXfNcwXY7icboKwVzVrtEJrm9vj+0516Blv3CM/jGkTdta2+/dHLRxTHu2Mgmoa/57XsrvK4CZAyCHBl7PJP0fC8mnNlJ7JZHqAEX+u6OBhFIUAk6A2fnbMgNf9nBpQvjCtJgWthJFK2fGBfYVEEg5Q/dHWz0f8vKbW9EipcI+e8KV
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc455f32-7ed2-41fc-7f26-08dd51b2126a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 13:25:41.0908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Id3TTEztnVHgykXd8DnEVQRQgdRkg/GMsDoiCQJ3hayv/2fdszIX4y4n3UQTAn0ctBlNNcumFxKRRwTRYsijeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6288
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740057943; x=1771593943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=lw93BSIJaUXsHFgOfI/WMdp2nOWzK7aeybSnO8aJEhE=;
 b=UhBlca0JV0QQvsCPhBPM4yrRgzpexTpGvs10CAcJv967ZcA9cjju5vu3
 PFFd8pmubG5DxYckBG/YsfQudjbEbNNTx7n4eEl5VGzo4VHYz/b6ZkFpP
 R22Mpo7EvbyacvMkOxU/vKv+MxlltZ/xbikpR9x4HbwtpdLlenXQh+K9y
 PJjznmQXkUY6/mZ9u3m20hwrSDdJkxSMqMXlgD6YCHSFd5VYU65ETrmgM
 CVbZ09lU8y3yLbzCG4jMio6bifzfMJJwaQjSdm7UZiK4HEMQCSOUmpdwd
 qKjAKlk+nziesJZNHX3miMxzn+D0N0+yktOqFbmcT5I0FH6t2Q/sN94OI
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9/3eEGI9nC9oMksXXKUGwf0SErLKwZ1Q47d3aqP5K4=;
 b=cy6P2YqcASmSdJMOy8XDXL+YIUP2GxcqJ7fYVyE1ng3YfEswL+NBUw5WQYk9lYB90VVqFDNHOuImPVR7QCqSNAfSm6Eiuvfzg3j1aVBVmzZ9d3wuGr/Xq4vt3JNNnCCqmpm5/b/LeiTdKOT0Lj/+5e7kbaD1fZAPdPhYvtysAUk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=UhBlca0J; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=cy6P2Yqc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v5 4/6] configs/acmesystems_acqua_a5_*: bump
 to Linux 6.12.9
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

On Tue, Feb 04, 2025 at 05:36:19PM +0100, Romain Naour via buildroot wrote:
> Use the newly introduced BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
> option to provide the Out-of-tree Device Tree Source file with
> its vendor subdirectory that is needed since kernel 6.12 [1].
> 
> Revert the sama5d31.dtsi include path update added by the previous
> kernel version bump 6.6.12 [2].
> 
> As noticed by Michael Walle, newer OOT device trees should use the
> same #include directives as the in-tree device trees to ease
> sharing the files between u-boot, linux and OOT external trees [3].
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> [2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
> [3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/
> 
> Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Runtime testing:
> v4: https://lore.kernel.org/buildroot/e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr/
> ---
>  .../acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts     | 2 +-
>  board/acmesystems/acqua-a5/patches/linux/linux.hash         | 2 +-
>  configs/acmesystems_acqua_a5_256mb_defconfig                | 6 +++---
>  configs/acmesystems_acqua_a5_512mb_defconfig                | 6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)
>  rename board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts (99%)
> 
> diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> similarity index 99%
> rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
> rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> index 411d1942f5..60be8a67cd 100644
> --- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
> +++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
> @@ -9,7 +9,7 @@
>   * Licensed under GPLv2 or later.
>   */
>  /dts-v1/;
> -#include "microchip/sama5d31.dtsi"
> +#include "sama5d31.dtsi"
>  
>  / {
>  	model = "Acme Systems Acqua SOM";
> diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> index 4b20a009a7..7a4c4e57c9 100644
> --- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
> +++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
> +sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index b102dde0ba..a50e306b1b 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -2,7 +2,7 @@ BR2_arm=y
>  BR2_cortex_a5=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> @@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index da54eaf620..6ae8d037e7 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -2,7 +2,7 @@ BR2_arm=y
>  BR2_cortex_a5=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
> @@ -10,10 +10,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -- 

Personally I would split this into two patchs
patch 1/2: that uses BR2_LINUX_KERNEL_CUSTOM_DTS_DIR instead of
           BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and removes the vendor prefix
	   from the .dts.
patch 2/2: that bumps to linux 6.12.xx.


Regardless if splitting this patch or not:

Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
