Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC3C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 15:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E82A405F7;
	Tue, 17 Jan 2023 15:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E82A405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfEiqFpu9Ypq; Tue, 17 Jan 2023 15:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AD57405F4;
	Tue, 17 Jan 2023 15:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AD57405F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EFA11BF836
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 15:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58673606A9
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 15:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58673606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLnb8pfBlf_Y for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 15:52:40 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4986066D
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B4986066D
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 15:52:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.97,224,1669046400"; d="scan'208";a="221098775"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2023 23:45:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8jvrQvM2fhINCpym8eRhkvnm75cMKAp1/knkPokjl0zdv3WEaJ1jtbPpZeCx6yWzwRuirnqB+HFcx7Z8/NwpX2dvWz1+NLNziXkyhAzFm6ixDRLU+qhX1JZh2bLMri2LXapITTdQEohZHDrEp/oVSCVKNdwpUpp/TLnujYgmv3X3SvjW6xy+I2P4XpzTPuTVhfi7lFZFjFXMdI7vHTlJR8A7qihGFRUlMSNa/hx+mVpEBMmXyQGPIt5TPooO2op7AjPDhCAv/0EOMVhslMQqcprnZN6/+ZOLK5iYrpmsHCYLt+014lvUOmLv8ZMj9GT0xyNnA7crS6DhbTSW7748Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FToY1vdT8zFxDdK5Z9oaXuMhJvniqCf3mkUO4EhnPVI=;
 b=c/O8fJ2dkKlJoXCG03T+0iKiwkbp3xa2G86+0PCyZfkm+DS8qH/cKDgAzyo5B7o4ibaRiYS1pqHdvvuNU+/psPAjmOmazq4aelq0ZzvbA+FneMziaCR1o9WeyEqDDRK9Wx1igg1qXzd/JpDa3cfwM/ojGH/oASocklNV9bDJI6y+zlLbuIFpkBRXhY29pZc2PGdtB9oXeGvh2U8m3cQugN1pWpYL9ISFtnFNk/VJbEBt8IEBemIUP8cl3shl+KsyBXF+0UpvwNJk4xQzbh2SrUJClJB0GE90ng4oWwCKtubpB0tpL00SxiIkPyvNNSoyZOabGg3qSeUd1UH2VWYKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by MWHPR04MB1200.namprd04.prod.outlook.com (2603:10b6:300:75::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 15:45:28 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::a65a:f2ad:4c7b:3164]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::a65a:f2ad:4c7b:3164%4]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 15:45:28 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 0/2] fix elf2flt on m68k, xtensa, riscv
Thread-Index: AQHYz4zKb6+NMxCdskq0v0jBH4ohV66jdleA
Date: Tue, 17 Jan 2023 15:45:28 +0000
Message-ID: <Y8bCl2PFW+amUUqB@x1-carbon>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220923224039.31d67d9c@windsurf>
In-Reply-To: <20220923224039.31d67d9c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|MWHPR04MB1200:EE_
x-ms-office365-filtering-correlation-id: a8b656df-53b2-4837-f356-08daf8a1db96
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aFuYewicTqEfPDelvTNVKozRrJoiAPiwp84O4b3rJRI4CbCBpG6l4exQofktTqPDUEScRlW0DpqiouAS6bbWefwE7FmmvdA4NeWZkE/MmTliizaEmjRAsCx0lBvN6hOwQOSeiap9hxbGTCidE9Mi7rE/venTz6fwicTHxakGK8gmsf9DFpPpfO6uNDhm7QXbFVCP9+e5RFZ6w4yzYrcNEM47eVKy2Y1Q8Cdy9l5ytrmfqHdXrZ3/r2wR0da1sjcESFD53HzFGC8RGkB4rcp/q9Z69Z8Wod3gABYHEJEzG5PjM2ywpweLzHzlia1DpauKUkTqJJa/8su/Xs9nwO+q9U6NhYMo/f8EehVAlODsvnmeJNf/2JzojQoS2izcVJpfFacNCd7dx+9Dw90WQJvK4tnmdbPkizHFdLdRf23Ezv9KtCOxK4SY1D3ILsdSeMGzQPExjFdA/H/HwtPatno0cOkaFLLoWyZMw/1wQLBQKnuUYOkC1xtUw+o9riLEZiyHsSB4uUP+7i+Q3Bsl8uSItck5vGD7KLxPUNyrOjnYAgxn0MGRcXvHt2fx36XGSEWRD9g+3x+4f6q9n7dMkhhWyfgVHE72twt69ByKOdI6uc0D/P8rMOeSpcG63S/y85sVKyHtyBjUWKTLWudl5RaZ2klWs09HBSJHkUVoeFB9BKFggMAcfFVW/4Ej5oYIyGs8iW28hJ0gvxEsEtHjBJwqWFszIHSTkTmhHjShHbNaLDCaukxU6+YQhIme8Uwuk69gNTzmm9jy9AGy6iKBjVrGc+gwmH4bR/8D8csW3FaJBAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6272.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(33716001)(6512007)(66556008)(66446008)(91956017)(66476007)(76116006)(9686003)(186003)(26005)(6916009)(64756008)(41300700001)(8676002)(4326008)(66946007)(86362001)(5660300002)(82960400001)(8936002)(6486002)(54906003)(2906002)(478600001)(71200400001)(316002)(38070700005)(38100700002)(6506007)(966005)(122000001)(67856001)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MxkSdL8DTbs0QURWoh4u3Jk1uiBGRh3XbYiTGmFlR+jtZ2g6YiL/7FC3WdER?=
 =?us-ascii?Q?XCXFgk2kMcXtNob0toHOvpWOGHDm6MoqThbXYOoZmUVBbwyeao6SiGOzlzwa?=
 =?us-ascii?Q?XSe1/Y+7lC4mJtp4ngFL2NjCFCdVhqVzx6W7UxWm6S72tcAlOz/rdNnLAS9U?=
 =?us-ascii?Q?+GWAVnaUmVg98KN9l9Eo8kXwk8kn/Yk6tXZ8oI3cFylDUB0P5Pz/mI5NtDUd?=
 =?us-ascii?Q?JWVFESCf8rGYaOqSdsONE+cKyOXquveZbmBdnYcv7yC3aQ5u1P7g2Fy9eTvD?=
 =?us-ascii?Q?OOop/1BgJ7/IfVKRK9R/K41lHkHa1J1mjCBzvUUVDx2EtPXpmobjwbEO5sOi?=
 =?us-ascii?Q?opffeqbk0k+WWhE2Szy5791J5R9Ulb5YMK3uOWA2irgna37JwdgWZhP/yY3U?=
 =?us-ascii?Q?ExMokjDzn7RIV8xaGATSKvAb3vi3RdqHJ7mDyWX/k53AXT606eqra8C42iZA?=
 =?us-ascii?Q?Wmt5MPyH29XvPX4gUQHyqxnrwu/hv91u2oiyNf5iPUmUUmlfA9cW3yI/f6RB?=
 =?us-ascii?Q?aH82Dh38Sqy8rXEid86GLKg/0gf5hfcQaAd6JDJYAvrqX4wf9b9Bcr4bIzdB?=
 =?us-ascii?Q?2FNkB+psDFHa9mJ+QKbECtYnLyjwSfQtOgZDfpL89bZTxzG2BLv/urUhVHxt?=
 =?us-ascii?Q?8sU/xUxfnC71nmBaIpGBgNKkT0Byvb75K7HN62Vf22RYgFT6irF0EYbZvcMB?=
 =?us-ascii?Q?mNV66aDCsnGfWb03yX6KEP4dWn+Kf+5axoT3fjtIH1XZTCQora1Mnw8JG/1T?=
 =?us-ascii?Q?HKmcfOa2NJKFRrwHOoXVestBycrQ0bYAuME9zXHk7C6rfjWOz/LZGzVwk9hp?=
 =?us-ascii?Q?qx/s8qHPhLm+fPXLwfVG+ud9uAck3qJ5n0fwXOzpZuaWlbEr1QnRSCxm/BQF?=
 =?us-ascii?Q?jKzX/WMMxPBPXJ6s7pU6XQNolLr4Tuays4qMAxKM9g+vQlk9fX24w62a2H4N?=
 =?us-ascii?Q?Jbj7HMrumY8ahokAMAf4UnEY74KTqcKnEuKzrh2wNWA5w2jtOvqyijUYb4j0?=
 =?us-ascii?Q?jUDosqqI4GW34fyzYOK2ewBJF2+qS+Yv0k/USXrPE+Z/h9wd20bW3fwBmQ02?=
 =?us-ascii?Q?suKzeDnTzEErjh0ICzA/dkgSt59pWpCyUVuRrq80Q1kUzqsQVRUlgsZFbViN?=
 =?us-ascii?Q?Uop/jZzWpcQ90l45XMjy2q9A90zaCqrbuwN1LaFzO1USwuHy7RtTgUypcxM8?=
 =?us-ascii?Q?JpATJsGq/odSpTANgtVoQMUK70vw6VOx4GQO6VgIGZ4e6KZM7rGUaySTtjRZ?=
 =?us-ascii?Q?yelmZDCnweI5dwH8HQw0QeRhkSr/l0/osPJAO6HsLHPmR+l+DJQWlJ+wppy+?=
 =?us-ascii?Q?WAAGBXNMzcvb5EoxnfYyglIKQflY85CcRZHPL+UTT7l0E437eQTDv8RyeWOM?=
 =?us-ascii?Q?W3MavjBvuVWhZqSn4UI/7FOdVIMLtZC6X8Xtw8Nk8mXaAPK5Vp6BEsYfP26M?=
 =?us-ascii?Q?+R7lqseYbKUDlXx1YRvkt1WWkcqJWK7zg4Lc3TPH5S9z63qlZ1wiJD0Hcg3S?=
 =?us-ascii?Q?TY82B9oeimmIfCv9UTQ92ne7BYzVGDLlyoSE8Nt0/fyv5M0E8Zcsu6aniOnn?=
 =?us-ascii?Q?54zurBeIWnqvqpXzVTLFDKVngKVzGlmlulTo/rVQxmEMvIpJy9twmpuh4S8s?=
 =?us-ascii?Q?gA=3D=3D?=
Content-ID: <940B4DB7E2879544BE02260AEABCBF61@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ovNvgs3bD58hQ8soT7W8hZS3+xyngnwyP0Vt+p/pV6RuOHq+/xHp4ULKE/KJfvSn4bXe7nJ7BQOT9IGLbXbOpLvnTCmSp+dl41qirSpnkSDiZhq8Ba+aqr7dnTSNEcUL196C4eaOYMn5jmHflUrQ557fVPy5DRy8+pVvYjBPKgBuI3ly7iFGKkVyPnvXZs3Ji/BFEhfnBCdLK9M7/2jEtmCmljfXROmqFynm8A1HYuNPftZfjza9l7NzZWeZY9d1uIsHH9gR7dKpoeHRsTEzKQ6MS4HlqEjciIcdEMyoYzjKr8aPglaR5xfvj6jR2XV50Dxjn5tGSeZOdY8GLIZBnKSw6ggoazmLrAJwmrDSf1LFsNU4FJdxqFgDzs5bbjyAoJmh7CISgfalUufcrXoRn4kxZHErJFtGnGUW4vqCTg7jO3BsJuYav3E1hVftYU/ywmXSw91oafJtxuLV0Xcvl7MxTF6Vzz6ctaAaj5ZU4sE/62UxmTZFOUuVtDMG45Dn1uwQSDgI55WeCMkdTpEKFj1Tjr7SvITGVkG1rlJvinOQZRePxu3TGSTJTtODcv3NsLSgoOrlFmOsX71fDgF5qDi50nr35opRUiaLmQwA3u+sews2v7nRcAeI1+HyP/PfGV7SSa4l86JZ8lZ43jIM48gjlwbOoYmDMLz5VGy3XGr0uH3DkNsoWmlwvL1IAFXJUtxNz5sJbgLmzRjw887jZ+859EALVx+Eg4OijIdLwQiPe1xOCFsqB5JjPwVyBVRbbC6aUj2eaCYGF/+CB4orhZOxCY3Tyl+zpPGyWOGzj0WAiBWSZ/tAGMhQDBk8CnuAQhZOd2Ka57K5CTYhCvtrlJGNFtCjdoDvU9mquI5KCAbN3kOiH4+sKg5C3XKY6KE2B8fe9WmpLwYsOgncmGDxe42j7CGcx7Pdsb3G+WawaLM=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b656df-53b2-4837-f356-08daf8a1db96
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 15:45:28.3560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJr/Djt+8YsxsKVMey6LT5z5VmLv/eKCe7Kzv4OyLu+ueeAv6fE0GRUBtIFaKOWTc6SCYza+v61fsgZNaC7jIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1673970759; x=1705506759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=VxnT3QG0CTs3AwWFiNbeo7bk2wK/PlUDGYDAwjGqE98=;
 b=m/JVN0tN/7fCugHraUtojiKCVu8gqQvGd+/Jd7LbYcpZVa6CO1bkgwQy
 hTkN5lz2W9fs6oixkPg/rkrGPcKDf3l0GIxiYlpCpp0RHEnSjLjXDMNGf
 ez3ZsvdYezUazOGbsOhRCRZ31w6oImXi6mQEMYKr+50fzrY6kEcb7RweD
 kvM3jtFxgA13nvGcgj+UMyyjzwaC9WBJFuKHAHsItpFS6qGwWk9XiC3rl
 9qO/SOpqyD0lVxs+Y5VWc5AS4SQlfxtiuGusc0h+ReYFc/b22FmGrarWT
 4EsvmBbbkQzadLHpo8le1j3mVq3cZOyWkA2Qh4JqMQRijSoEuOtvH52/0
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FToY1vdT8zFxDdK5Z9oaXuMhJvniqCf3mkUO4EhnPVI=;
 b=ZHD2htLrCvrqJiBppXMaj4YZ7fMGXfx7Qt+jLJYjWu0VWCuLYVdFoomVvhJf0Z5JbE2/f4eTa8VRs2sYoLiHbUVyw23QbO84wd1UfSOGDTYjEQmuMyjmFpIViey8KWCtbMtwNimFnAQTTMs9Q8+09rIV0mRCwAF+0pvVfa/SN5w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=m/JVN0tN; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=ZHD2htLr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 0/2] fix elf2flt on m68k, xtensa, riscv
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
Cc: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Sep 23, 2022 at 10:40:39PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> On Thu, 11 Aug 2022 11:40:47 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > Niklas Cassel (2):
> >   package/elf2flt: remove broken patch
> >   package/elf2flt: fix fatal error regression on m68k, xtensa, riscv64
> 
> I am sorry to report that on Buildroot 2022.08, which has those
> patches, the following defconfig still fails to build:
> 
> BR2_m68k=y
> BR2_m68k_cf5208=y
> BR2_KERNEL_HEADERS_5_4=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PTHREAD_DEBUG=y
> BR2_BINUTILS_VERSION_2_39_X=y
> BR2_BINUTILS_GPROFNG=y
> BR2_GCC_VERSION_12_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> BR2_GCC_ENABLE_OPENMP=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_PACKAGE_HOST_GDB_TUI=y
> BR2_PACKAGE_HOST_GDB_PYTHON3=y
> BR2_GDB_VERSION_12=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> It fails with:
> 
> /home/thomas/buildroot/outputs/m68k-coldfire-uclibc-bleeding-edge/host/m68k-buildroot-uclinux-uclibc/bin/elf2flt: ERROR: text=0x3c826 overlaps data=0x256e0 ?
> 
> while building gdb for the target.


Hello Thomas,

I decided to (finally) cross this one off from my TODO list.

Submitted a fix here:
https://patchwork.ozlabs.org/project/buildroot/patch/20230117153503.2075602-1-niklas.cassel@wdc.com/


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
