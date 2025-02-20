Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFBC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F06660AD9;
	Thu, 20 Feb 2025 13:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMLqtvfDTbTA; Thu, 20 Feb 2025 13:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D4960AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D4960AB2;
	Thu, 20 Feb 2025 13:25:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA19D92
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D5F060A88
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E54CLLuRrLha for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=1392cf689=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B926C60904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B926C60904
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B926C60904
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:25:55 +0000 (UTC)
X-CSE-ConnectionGUID: vgjHR/03SKS+F38NaGouig==
X-CSE-MsgGUID: MLkdI/HRQ8WeB6uOshuLYg==
X-IronPort-AV: E=Sophos;i="6.13,301,1732550400"; d="scan'208";a="40000813"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.9])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2025 21:25:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzkHuFM+cbCoxB6tZF4ROWB8s2rlDSnQpIRR80IBtexLyzHXctBLWM/OBDdlbPHM6WXp1HnYD+IrNZ2+x08UJh+Sukmwt3w3WkAUTv/HCDi/C607GUvH1um+koi80Miw38AIQPKYWyao/2CE1Kr/QaRNwCpWNbnFUGv51Zu6ypmi/gSSnuzPzZvWoYPYi48jDVvHuT7E9peXtXdcg3GDudyrut7JcudsyI+4/X25wXHP3JtSObUKY8CfFI3V89mntL0Q8CqNnmVtpscDUz+bGAI81rXDxifNKtUWzWC17YAsYtvd3dRiDQ82hhqPYB0OtYm/cWqfRgFmtds4hZgbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3+VLTk4SOBv2LFYGWbSMBOqRn3g/nbYGS/csI9fR6w=;
 b=IKwxlQSDtpVK9VrcV+mvT4ivS930G+kDHgv6l2O9JgQlCsskCXVH2svtv5yMgy1C6buL8NFSdoexC29yr52n5A4r6aN0wZxXRX/yuZvzrxUtnj+I7E08jvvGVYse/EYS0Z9XS2YL156IcAnx+8r1xbvTl8ppLGJc3DVzIjAVbllMCRRQhW30uOiDU93xOkE7u7ClXi/WMbOzpv1OQjJKDZD3tBIs+SFw1NMJB84nwm52AdDXuoGIag0qLUqQ+y8+RTK4IASlSKXi+uv6g366S7YTYavuyrx3SzmMgipS8RESs34X5YIlgIsfx+DcufMfEZget3+S3HQHNeNaCMZ4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6288.namprd04.prod.outlook.com (2603:10b6:208:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 13:25:47 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 13:25:47 +0000
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v5 5/6] [WIP] am57 kernel version bump 6.12
Thread-Index: AQHbdyL9UzjHj6QarU2C3VtU97VE7rNQR6CA
Date: Thu, 20 Feb 2025 13:25:47 +0000
Message-ID: <Z7ctWzDxnwvwJ3MZ@ryzen>
References: <20250204163622.192932-1-romain.naour@smile.fr>
 <20250204163622.192932-5-romain.naour@smile.fr>
In-Reply-To: <20250204163622.192932-5-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6288:EE_
x-ms-office365-filtering-correlation-id: a5c26cbc-1451-4e0a-4484-08dd51b21656
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bCn0EqDpxaUuXFOvj703adHNlunFwgaHG0pNeRPmVP6WU70oEk7R5bFa4U3o?=
 =?us-ascii?Q?w+m29JiwqV5775f+6Qc7ZtslrVmRuyy1DQrBd759/EnCD5iQ7E/iPpQurx8j?=
 =?us-ascii?Q?vqzz+6NwjnVAKpbiKyiQIGZpmS1hltBNcEFlcWe0SZEGllcwqcEa4RcD+7S9?=
 =?us-ascii?Q?SzQ5jRSxrN3jUMWSY8OtjyNbO7PFFgir4rO98+bixfyGCt36IpdiX9I95+bG?=
 =?us-ascii?Q?MBMJj7fHozc+zCw/zox713ubjUFR88OA1ST+u5wJejOmWHGQ5Dns10Yg0CB5?=
 =?us-ascii?Q?6QtIPvqq7qoY3+swETUWejxA6zk7LiX4A0hX2IZi2iWp3KxF3NyjrWovnySQ?=
 =?us-ascii?Q?8P66OcDY/mm8Tmypd8dA71ZA4YX29n2/YnVP68w4+/WrvsCoN1njQi56irGO?=
 =?us-ascii?Q?kRHvWxCQoLuDcaOzZomz+aLMsn40u0Bt7Nim3O5WT4O/iiMddluOzCoLY8/l?=
 =?us-ascii?Q?e4m1JthCnJp/bVtl4GgE2gOxourPgHm8Z4O7YEQyXifiiDmpTElfUtbq5LwA?=
 =?us-ascii?Q?k+0Ceb+3uZMIrYWG8XYm1rNl4y/azyhAiR48Uw3ab/bKjq7BxAidnUi0Q6Qh?=
 =?us-ascii?Q?cLpl2ICmv44D9IQ8a4E9ejzrJCjZRuIKY+HbhPfG1z7XVGcLNzB9FWZT3gQw?=
 =?us-ascii?Q?fI+H5TO79a4sXozlmlTvO1AGaBc+MzZOv5FH/Vwlap23MDGtVTMdotzOEPlW?=
 =?us-ascii?Q?l49gF62GmhSEqNoQrGthNdacHH9a/gnd54anNwVsv29e96o5/3/W5TQifDpP?=
 =?us-ascii?Q?mrT6UiAHzT77ocmkf4zn2ehehEwc7MvXbcT9LxtwBAoWncgXrMyMLo0LnvI5?=
 =?us-ascii?Q?0Z3++ut2k65H40qQyYlavV3WApQ9NRJVIiAsSarXM0z44HrUl89t1EQlPGjt?=
 =?us-ascii?Q?v8erq3BxW8P/gVXKmh9mO13Rxi27H38zEuhq1QTCeLQUxySPiORE+ryIQXug?=
 =?us-ascii?Q?wIDKMRqV7IXgLgDmQD5uE4uu0KQEL9q5Y4gvM61FygfxtU53ohthjZijAaKh?=
 =?us-ascii?Q?GAHHbo+izMHF0WJJWbqHVT6dosu/ak3i73RyU0IJRZJrZkliypU/Obu20tVM?=
 =?us-ascii?Q?yiUKCPATy6D7DoQ/FZEOK82eXiogMar4wRwoOFsATxov76lDZuY0qneVzf3C?=
 =?us-ascii?Q?AkCbDkw3LWoFWgyyrLfrklECaWL+/lg23Q8r4/R1kQidVcXe83T93ED2Dgbm?=
 =?us-ascii?Q?pSUfWy/G1d861OZb1mUOQjdT2Kksr94TZmNMbhPC0DZfuMdxBQEWewNL/3rq?=
 =?us-ascii?Q?hPMSU9QZIzkhkXaWvm8HbUtN+4zt/zUfENqvDZFvDKFqr0WqiOt/3GH5iShd?=
 =?us-ascii?Q?I0yWIJFfBUnm6G9rx9NR2vc3kaRTjedBvqzzbjKymjTI3p73oRyiB5a1uQlf?=
 =?us-ascii?Q?QSA06W9moyXuVc+MfJDKzC9/U/aQXES/tftBYCWRdz5f7yJDZMwkaguDcOFX?=
 =?us-ascii?Q?U6uo3YJhFGJcoUoLrJKOZQql2HN+NWI6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7SpFCfRHBbAssaP/YoCq2v4Efag6EMp78QXu6VYcaQg6zk/jcEpLde842ENg?=
 =?us-ascii?Q?Hf9qQAJcudKwIH+E0SEF7Qcka4CWMa6TVoAvW/vdXKkdUp3vtiBfghxoYfWg?=
 =?us-ascii?Q?F2XoX0506y1YVcNJXWaWkJ2CmkkrJrKyh5UBShJSd71c8LQgn3u3kmdpXirp?=
 =?us-ascii?Q?AfFkbVNF2Exo9PxYBJETYRh6z9L7JwBDgM4g53fhAaRRJ/TWk1JY/p/KApKh?=
 =?us-ascii?Q?REdITfWEbN0pnx9K0xNk8qIR2roTBda1q0Z2mAnI3KinFRcZiXtedoarJJ5F?=
 =?us-ascii?Q?vBTvMdUkenAEl+guK6LaB+X1HfGBGHvnCRBUpg0b00elroHln+eedUWZnNj1?=
 =?us-ascii?Q?U6eS5to7ATB2dk4Hn+QoNg9/A00Din1Mz3b1LdRN83gQq3Ep+b422L9zGueB?=
 =?us-ascii?Q?Curi8j7S5bGwyZ3IxC4ymVGIfql7D5xq7h83e7VjmDzd4yaot4N+vLJTiRWa?=
 =?us-ascii?Q?O77VkZHYZ7bAVJ3lUjFsgT2b8MYVavBmhTetDZOY76BnGVK1hKF9Sy9Hz8m/?=
 =?us-ascii?Q?r7KkGxKkpUIbCA83z9CqJPY7SnPQMyeN4c25lp8iHBsVwcX3VvS7Rfvwx6Yp?=
 =?us-ascii?Q?CseHc/YesGnGOMMb1vqSMfAASN/JsHmrC9oNYBp88dmKwoCJTbq6LB1NqXVJ?=
 =?us-ascii?Q?bFo3M3OVMOqH9IrogSgae2PS3t+K8za7m3/CBDPGILTwSazzlF3bwMVxyIT/?=
 =?us-ascii?Q?jo0/JJJxoInGp/QOUZfL9qETtLZGWXUL2f7oyKxG96t9ghSh3+xRgivmoATX?=
 =?us-ascii?Q?V1tyEGTC/cn90PjzYaYdTkKqdudjM51m39Neotio7mEvONZ+JKrsBA1oFH4I?=
 =?us-ascii?Q?ItmDuHL5CYyrUsug6fXXhcg+AbAOTwPkCXxdADcEVi7RQdlOfBj6RYZ+1l3/?=
 =?us-ascii?Q?Ot9KRwYOFXjX7zmUFnr9IstWSkOJOOewJYns4XzrgcAZjOlmsExV6mtUqCej?=
 =?us-ascii?Q?8mz748TrolXVZdfmviplzY5yBg+OezCOEY8h7M7KyPVBIPxm4UV2/iYwOAD9?=
 =?us-ascii?Q?5Tg+pE+w49UdbZIv/4sCSxRv8MsHCLdsc6RuMj2cFdvheHS6QFUYD/ZTldVv?=
 =?us-ascii?Q?4/kKkNe70fADtES8QRrPqxTrSZJaq4DvEofMqDJl+kTIhesqazN0zFDSY7Ke?=
 =?us-ascii?Q?frWn3v9FroUI0kljZg0JqyLScVzndLvsBBcRXbD+VxV9foOa7RuVUcDdDrhy?=
 =?us-ascii?Q?Hy40JJ43897pHnTGHbuqPS+WJ0sQ+08slSeCnlIQWN8SsSa095kDnS1N7PPE?=
 =?us-ascii?Q?uAeb5qpYEN1/MveLCplUs+4fBL14KF4C+rqXBECV/tOgD3VFIQDmHXGDmgla?=
 =?us-ascii?Q?YI1XA4r4CTaSOedVspH4b7AOOUMPr2DVxNT9s86LeTolXX8KaTrYTQ6KI6Zo?=
 =?us-ascii?Q?+k3kys5vdqf/HTKCAMy+LimhFtNQuKLQD474kTARo5TiOkvND0K4BeYSCyVX?=
 =?us-ascii?Q?OC8CZHo5YJyNbsJ/7UQPrV7tCxFrlWn+mjvozyZcFsocCa1XGkyol/dWOOh0?=
 =?us-ascii?Q?d/SQyl09JqPWkFhMNN8nuij9N61+RsKlC5E2RQjEsuv2d9sOcD8684o1qUI6?=
 =?us-ascii?Q?pt1qIbCMCda/gfjjSMeSkppbQXUyq0WOcszASKTBgEofEL/sGH5o1qrBEWtv?=
 =?us-ascii?Q?7A=3D=3D?=
Content-ID: <03EB36D1A07C674AB93429D3914BD9E2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: G6qqgvGdBe+J8oz1XUeS0sa9inWIVOYJ7qcusc4A3fhrBQJwoQQIXrG6rL4B/3/ReivhUKLiayMhbJ/Q6owfIAJzrmpbQe4FFOa/VL80BkouCK02ExgG6MZwv6dPWS7h1RCuN+mWBGGCbO4auUDgrIbrNiKvI49groG3xq1FKczb55bk6rTdcKGMNp+1Bo5HuCH/wJmbV1sDOZVPyS5E0IfFu87SvMV7EHhKHRlokVuXWo4J8GJF5zWU3DCvRqIX1MkXq/ESIw2Yom3+TIjfR4JPlHDo3HHNeA0xAaIiez+PYbe56nnGsq/m+SPZ4GHHVIQTn9lLaaDpNGMS2UDnEmyI44fIfIjy11pR88t94dCK7mxBRNRByk++0tnrKvY65ghOk6PFKU+HWMVb92T69LVDF4z2TqzFXVnPcMjrVofm1dscbGGjvP2FieJjEYJKYdqZS65a8SgNEWA1HYRCH9tejlKBNmzDcVFg0x68XkE3iEpsu4rxqDyMhISaGY7cPJYIWzF6alfgx69rn8Nw+cUyfMoX9LzGt0LlkUejhaeQNqpI7iUAga2o4JbYDaCQ/pnDAAM/cMrWkBAzi2WA2Do7lNDUd18QfiaOBm8xtFu4QZyNn07v5q3W6zb6fiNB
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c26cbc-1451-4e0a-4484-08dd51b21656
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 13:25:47.7221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIouBjOqPMb08MoMLfskyl4SB63k+H8U/m8pCbBmSRKvr3q74btIE5Q4CSUifyEqDyvI+auM09ATjm3H0TUtgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6288
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1740057955; x=1771593955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=ctrPDYqkvgr/aFPlWHw+1NuwHeM8rIA30Tj1q4dNVHs=;
 b=J5mZ89m577aQfGGbkrK2dqop7SPigJDwDYFi1Fl4SYUU6+8m+Kt8x7ci
 zQQa0FNnSh0iCknTRPYQM3CHRT04nB9s3mCDyQd9DH+ewdV0b0c9Hl6JV
 zyaYZRmhge3y7JAaZL6FBtFIGgduuZmurOWMyD4d+Ib9Z8otqhf8BXHF9
 6a/rt8AGsyelKsNaICO+uMT3B8/HedMrTKHkT76sV/zgXNYDNCGrlMlbY
 obIbslcfyGyeycQ4w+8+EjpMGuxjirQI2LFU11AbVFGw2THZqxF9vQ29X
 vVGHS7M/xehW40fQhigD/X8UtodtjHYxrtFgNLFiOeln1rn/lL1/AVFpZ
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3+VLTk4SOBv2LFYGWbSMBOqRn3g/nbYGS/csI9fR6w=;
 b=dfMxxSoFkiMMLk8sIsMBjQFCA+x+PscHXGHejpbUPBYxSGSj51DoJze5ZwG3vLLZwIwKt5yW8zgK3w/qsLp1DER5qsKcAIxUOH5ce4fH/CpmlH29LD26HDLn5MhwappHimTPEgTNcnOw/xVyMwp3yAc4/Tcx4bXjWg0kg073P5c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=J5mZ89m5; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=dfMxxSoF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v5 5/6] [WIP] am57 kernel version bump 6.12
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

On Tue, Feb 04, 2025 at 05:36:20PM +0100, Romain Naour via buildroot wrote:
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  configs/am574x_idk_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
> index 5d3ec12ad6..4b90d12745 100644
> --- a/configs/am574x_idk_defconfig
> +++ b/configs/am574x_idk_defconfig
> @@ -1,13 +1,13 @@
>  BR2_arm=y
>  BR2_cortex_a15=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
>  BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
> -- 
> 2.48.1
> 

Needs a proper commit message, or drop the patch.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
