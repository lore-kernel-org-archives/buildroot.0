Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C34C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B923410E9;
	Sat, 12 Feb 2022 14:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2shheI6T8YRa; Sat, 12 Feb 2022 14:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7AD409E7;
	Sat, 12 Feb 2022 14:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDB51BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61C9F83E75
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWn2OorM1mXM for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:47:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB48583E73
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMbUd89mV6fLVCvmbhLVM00CYgCGLdT9gOOBBtPyFj/dwMrMu8jWtkBgU6YXq3nnb4l1lMRlBRnc1eH3ytQexuNzXWFoQ8jQS+bW33MU+8FqjRQESeOHnVRG3gkcqHPIzNnDltgBfUQ30LclLTqv178GwYkNM2LaLl7VNIXDQ46CwKGt8oSYuJvBaGLewzhAephlbH3f1rv5rhw1CAnXfQHgsD3NsdUhl128NLjW/W264nzyvThM6RFUg5HBVoq0C+FIfYPOCkop1r5sWiP134p+imd+wYRodr9/TDROGaeF6LPz8VdVdsvNXrHyVl+TCFD074ja5MXfjor0Dr57pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+ZdRvzoJU7HZlgyQKJ/z6PyNwnYljcLWmkeOWKpSDE=;
 b=ePIo+dT3KL0O8Y3c3elDg1w9ZVHKzrXV/SeIjV2QGVqmSs/ef0SCDrpB/a7LVrjB/df6487hHSOFS3nksEUMlwaL0nJezP4MVfZ69vD1vmhs5bpKk7P8JQaJydDn2t1K4EYtdxzi3E2lpCrCTPhLDMo4AZGum1yx2CUGkRoEYCr60IlWlA9sR61OHL6S5ghb+MdHmY2EklKj82b3rpqpf3I579ilcW8FeSw553g1MdkuT/mb5Ch5oK3W2ZHsvZTvvvHD83ecGiER3PM7WeYSgGI3+LD1KoULbrnJdkHQEtXWQpu87zW2BVWobmF3Ud4U4MuiEcaQZKAuzh06OoRDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+ZdRvzoJU7HZlgyQKJ/z6PyNwnYljcLWmkeOWKpSDE=;
 b=j4ZxFisZw+bDhB5/0q4Rlp7G4lJxhu7xBhx/L08mFOccKfQDHl4Add0CCX2nicUdQs6C3H+F/VHGJHI+GPaHQ7f05TQ/FIT8Ck8dvDYNq42FT7cb4ICzocNxYBpSibhOQRGLcwBzAaIBFhjS5osQsoENT8Qf7NL077JIOHjrAYo=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB7098.namprd02.prod.outlook.com (2603:10b6:5:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Sat, 12 Feb
 2022 14:47:25 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Sat, 12 Feb 2022
 14:47:25 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP5foAgAAI+jqAABFGuA==
Date: Sat, 12 Feb 2022 14:47:25 +0000
Message-ID: <E985101A-901E-442D-9946-456B6D047F88@xilinx.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <69189572-6eba-ed26-52dd-08a8b098f124@lucaceresoli.net>
 <87bkzcnqpx.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkzcnqpx.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c78e85cc-a802-439e-72fe-08d9ee369582
x-ms-traffictypediagnostic: DM6PR02MB7098:EE_
x-microsoft-antispam-prvs: <DM6PR02MB70983D2474FE183E7691A3B7D7319@DM6PR02MB7098.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rOLj4a0MwE360LowUr+xB5cnRzTDxusISJL787xClEuCq/U0Zy/DmWthZZ269U5dNbjqb9wx0ej0iE7s+UaSTfhcLLUE1hzfNkFteyPVINGbVgtGObvpu6r8odXmL9TQYR4o3x3ZpTxnm/V7bUcXEdakOrBqLtBYRZk1qaGTQOg8b0d50pHX8Wfg3+ZB2pAIZs6BW3sSm2UcOX2xAU8WoNB9YHEStoPK1MqYZqcGL7PS+4QqYQn1OnZ89ARv7V7W1THTA9KcMbTwxZUxQQqhV4Qj0uRSpuirMOD9W+3OvMtc7H30y9MEjwhS0o2siFGHbvTy2dogsXcisiv9gtRIVL9Dbv/zw3D8fBlyf/tRc420gcDG0SWmI5o0ZH9N8gxH/FV7aVT1GCTqAWvB5bGuLZs5jOfxJ7I5oKSmyA21Mjsv3s0tLQGQEwAc01uKq7fR9dA/9SCsf3dUpYGYectqBdYof87NykwA0by+RpHA4uFTYriqhGOXT0i4HfkjYMf/DM4o3zCc73VLmHAe1r5JUA074/XkfL0dPbnlUl7FzHyMWMhkzpeFdhQsBw6medxwVNn+IVLjkn3w9UwQexetE2nU/WfR3F+dOOpes9r9G6Y/JqW7SFgPChpUiOZ0+nGMLGDFIuI2wAhSoNVgqgL4kDyvP8wPtHwGfe0T6aEXGdnSuU2wwbnzpoJ5fmli0XhFQT+6VltIIBA9UhpLPLR/ZF8AmfjaS3OJ5r8sfG5x8x4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(76116006)(64756008)(66476007)(36756003)(38070700005)(66946007)(122000001)(8676002)(66556008)(508600001)(8936002)(66446008)(5660300002)(6486002)(316002)(6506007)(26005)(186003)(2616005)(2906002)(4744005)(54906003)(107886003)(4326008)(6916009)(6512007)(71200400001)(33656002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?84+X9ayzC9Qs5ABDMqQKtGf8MIepXkIjldJt448lJVKaAa0vL7BFK28dboWV?=
 =?us-ascii?Q?5kFhkzn3vJSZMu3Z1zPvGWHjeMMhjR7UHi3ZUplQbwjNxIB81ht3oOfAL8Wp?=
 =?us-ascii?Q?+7H9fHXGDO2aOvt6nrJUE9SF3L2RVgvvcyZ4sMSp+rf3AsR/wDfOlIDJc/XD?=
 =?us-ascii?Q?Xwa6/zZwWXnsJM8u2Isgt3ZiE7oFD1hnrhNV44CKXIWvnqfobtJVcrK+wtzU?=
 =?us-ascii?Q?GI5eFNKf/71/ovPVoWSv9ThWGs+6NfrcC3RCtRqCzXqx7HPNwJmMOACXq6Vj?=
 =?us-ascii?Q?AoLsq/OWttxKh8LCWerXifuzWEpce8CDdT6Io2Akqep2M+VYd0FQi4YTBFNf?=
 =?us-ascii?Q?xxVWvRdqzoATfa3z1cUJhJJqY0Ef+kkGX3zC4VOw8k9kPiWbUGnaBv+Z294m?=
 =?us-ascii?Q?mfYG8Je7aUeczyCa/UVqRsQ7XSnL4EzDbNR1xvz89lGU9WTLO5uu84X8r+wt?=
 =?us-ascii?Q?v8tnd2wZrW9qNjsfi4ONRebqiO2tf/46EMTPijQLmlMbykMYcfeTjo7yFCYC?=
 =?us-ascii?Q?MeEoEPKk9VwsZeL3orTs7z8GS84wS7Zs0I7d2s4IxWpRxmJ9OjKDb4Yj4ipr?=
 =?us-ascii?Q?Dvi4L4gEyilz/MavNUwLe9ey/0ihG84c94RTXAChYhvWZV8ihRaFgdyGNZqm?=
 =?us-ascii?Q?5a23S1B6oOUGtTMSeuPWbt/iHiVPf2aCZ0bPcCMcbMQHrXpQGlJ/GeDB2FI5?=
 =?us-ascii?Q?00Pv3YRAkZGut1GrH06PwgrZuHuR7Xdx9ZANWa00E1pQmxVj8sd3d1Q5ulfb?=
 =?us-ascii?Q?UotjznGu8QAoyeP/Ul05DBSohk4O1yTGBLA0QGu0it+IFQ5DLHPIJHb4Ldtp?=
 =?us-ascii?Q?TjybzkdV49gcjQnHQFnC+ofCCSZdL7uIrdsKe/Qw2nh5x56moHtEfMVNxPay?=
 =?us-ascii?Q?lYRFhYRIKddYd6Y+Tdj4hI9PouBWAvSvwmyaR/FnVrB0H3dgSYW3bg0Q9HSt?=
 =?us-ascii?Q?I3a3u0ppEb2LwzKoSU8uGX+pbQGU+jYzTX+fAKyhc0wZiATjqnnzgxT/PtW8?=
 =?us-ascii?Q?z8dzCJe3Ip4ONY20r2cU4STPsBvGlXLNFlmTIO/yTwxgxlKezzFgEX38ZbBj?=
 =?us-ascii?Q?MXX838B3TxhEFQzjokwuQf0cqvTHzoW0BVEqmbgCTEuGSYkGiYbgAR1WNAUa?=
 =?us-ascii?Q?/i77y3D08hJspNxuJkbo9HxVXxtU3qknRv8Go+PbTMQu6flGW50KSvG+i6G5?=
 =?us-ascii?Q?aRczLf+dWFeLS335XuKbtjYEKhBcrMu4GQnh02LFvQeWnjFQ4e5E7gEPXRdx?=
 =?us-ascii?Q?oVtuOqdztINOKcbVhgt9UGmp+OqZyQ8yqXLDBWzIKVj8us+BPGae/0rILusF?=
 =?us-ascii?Q?mKS93H58iIVehQ0UtMcPdsHRoqHa2QGO4FHqJ8thLqplelr+cGWyXyPS61Ul?=
 =?us-ascii?Q?fB9Oh7bJsDJW4A0upEjuuy9G8y8VIKptFaEWNeMiOJDh4yF/PkSPZ5FnvLxb?=
 =?us-ascii?Q?ncXqc0x6SkNOTgqTdoOgKDhcNEw8SYiKinYRN9FRfYGspBnpPsGeBjjVLX11?=
 =?us-ascii?Q?9Vc3ijiB914sfKbEN9VnhFFih/+lNxa9ZodATJUfGpMCSyXFpisUSj06mlIr?=
 =?us-ascii?Q?ixCsLFdIqn9ZUU3URXjiNrPMmxYSQewJTK4jEs6jh1qJFaB6E6WvL62lcrF5?=
 =?us-ascii?Q?T1ItAjb6PbbT+HCURmXDEeo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78e85cc-a802-439e-72fe-08d9ee369582
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2022 14:47:25.3010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKC7ZBQzluUqz08olR8uPZc85uJdjQ3QzHfkwqChWQlvkOKy7ulvL8of+M5s+aLExNNSjTmMV1wme83dRurR0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7098
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> 
> Ups, I applied the series before seeing this comment. Lets handle it as
> a followup patch for zcu102/106.
> 
> --
> Bye, Peter Korsgaard

Yes, I agree.  I will make another patch to cover this when I return from my vacation the week of February 21st.  

Thank you for applying this patch set and for all your support!

Thank you to Giulio and Luca as well!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
