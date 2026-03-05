Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F3F30928
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 10:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8530481E39;
	Thu,  5 Mar 2026 10:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mHGRbUespKN; Thu,  5 Mar 2026 10:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C002281768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772705336;
	bh=+esPLuNdT6jvLhYGZUgvgfsNzyb4t3hi6vU2RSLrPqA=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fEgq8l02s/ohr6uJTl706+v3I0frMsV+QoNyBabL6FuyqNsoKa25ZJMTNiD+kllDG
	 KkfKFCNqNN2sc5+9zjS8qIJgjCXHA4tuAwcMXJ+M7K2YCeGnX96WYceuDtA1mTRYgu
	 IrBL7pz231oNZW1NpzGBapZJcsY7geX0ol5lAYsUaKjyZ7Tf6QEoD4j5oREuvzz4S2
	 Zwz2p63RqSqmyKCczHz469Q/zq6JwxDMaSBH7QASuTCuiQpP6xXhbcoIbqgHiHWiu3
	 DoLzRGVKCz5Ku2TK6TQByAIyY4KguN0xQQO3KcfLrPhJg7B7ZE8yqC+dl65Xf26WDR
	 7ZhwKvV2lkMMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C002281768;
	Thu,  5 Mar 2026 10:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E902A1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE2E381768
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPopbcAJCQ5M for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 10:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::5;
 helo=ch5pr02cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7BA68175C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BA68175C
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7BA68175C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 10:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjSX1SqGSs/1jZJ5K2OMBLzQgnCNTDfNqC1oRHcKkrZHzuIQDk8fq2To9IRMWNY4zS4HACWVDk465diutHfk6ldm8KY73FFy1fGFHNQSSrw29O7dxgkttYqz+Sn0Zc5ibzK4iCOAzgTRF7xPxOmFke0uYkMcTKT2ie1/tcZYv6lvI2KclHJsVYlZMRjmEV9TUec0WgPvO2VCg3/PnjN949hyCvGlRg5D86T5/0708kM6A5pKj8Zx5dQrmtHXjRX9Ww0TK8J0dBjjlB00G4kmgONgKvVbiSThF97xtH9FPZpShJxywad7NvE862tJN45qnd6diLikGYFM3IHRiWQofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/dYbl42vbnI/EIyJdaQhPjjsQefzSPoMG6ZO6xf7b8=;
 b=jLti2SoPKUPTDjQG+p6BXYlU3o437/l1lyeNSCc9yYR2qEmI5xCzIN/JPEUq6Lzp8IG6gxNR1GYR3cCvMVh5p3Kwrc/rro/ESUVqmUGOc4tGRKVjz8x2SpJKVQadhUpboMzW4GDUrfejL+343l0dJ7ebFJKO2EgbCVejPLuIFfQPV1Rfb+J6jYpoOg7d7HNj0oy4QJo1pLWpMlQHGnX2fCTRF07NpOyXa1e3tb1QlhMnC5UWw0rRSb9TWn2Ghf5CReyCrR/zs8hkPjTkqq0lm2vN+vBAyE9OWncTuUawWDCi2gMjQBaZunz5NwPTP2lFJutXX14k2sv9bxFDCPkAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:08:48 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 10:08:48 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v3 1/3] linux/linux.mk: export LINUX_DTBS
Thread-Index: AQHcq+qEwytf1SDRA0u5PL9VC8hQXLWeqbOAgAEOFYA=
Date: Thu, 5 Mar 2026 10:08:48 +0000
Message-ID: <BL1PR12MB50323A317245D2E484A1459AF07DA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260304152057.3465672-1-neal.frager@amd.com>
 <aahzAZ47FxSAGgEF@windsurf>
In-Reply-To: <aahzAZ47FxSAGgEF@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-05T10:07:00.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|LV2PR12MB5944:EE_
x-ms-office365-filtering-correlation-id: 62aec878-6b3f-4fa4-5254-08de7a9f3183
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021|41080700001; 
x-microsoft-antispam-message-info: jAO15aV78bz1Ge0WBUhov08y4PU3OFjHj1h5+kVwzWXfMsCC6orIfVTlwm69a1GbOjYPyZikuheYjUddp4/UHX4GbaSE2xR1rwEsmycQTuDjOC5Cvimp3Ro6W2EKbCujebgHatlBCaLbE+t4uVC2vTRsC4uO4GsBrjdrIS0mDlR3sl5hDFxtCfPZpB9DN/OWk0NM7xWQPkvo+q+s22lH/9XSfiojgz4D6GnXSmMSRw7Sz0hcTpgjEEBX63HAXK1rOsVf0pVX4WGAE+h6zFSJIVgeYjMj//uq+qQvNLMlvjULKTRyJ0aO8I05mZ83CWJ0av8VwpeYg5xFIgw+S2cf/ZsZ23ZfRQBLGoCdcJ2iV9KxG1UeqweOfGXx5v6/+VR1Y9gchbnqnQUyBv0rVorHiLzIyg+T5wrW1orAKpjMrIErtlv63HPEeh+cHf8IcQHnAoXjEH8zNAWeyZA2yuaSfs50OxGiNgZpMFfJk35VZxR3d57JKZDjnxdd+EZ0bSMISAcKNcJKpPjYWXYwet5/eDpMOqpIU7gbGw0ym55T755smnCm07OwjaZHkUWnoxDW/FfXoK9kDHhP3xnvK61txAB3qFnA4LADpADHjP7Lo9nd4B7TGBS2iIAylyiAIaza7H6Y3vGWkZP+5MFuc/W4/AWwWY307hyOSma69XiaUgTzPcPG8mQBuhLrmBLkzhNI6GsmOjAuDbLOrvNaSkLv/yhhl7zEM9nirX6kDxTXWJm1IVn4hsNcWCEEFwmcsBClM4RTEgtU7MaMyxLmvVZ3ac/JJKHwurBw0zxb/ScXTvaN2YCq3OKdWOxDXlhUMSnMAHqiRn14NNSQ4saqumAGVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mxl34keVooDzxShP2WoS1Rs6eT9QmGSuj24bBHEg6Jz14GJ/VPOijlj4V38u?=
 =?us-ascii?Q?vGpWAHprepCXTDmyhSPEcDbf9yd/BG4CCG7PFh6MWBYIqz3N9UmT38R1X92m?=
 =?us-ascii?Q?tYnPkKc77J7FS+RBtQa55EntSmhVJttsg872L5Xa88x2YSfI4k8eT7/67ttL?=
 =?us-ascii?Q?M01CvVb/yErW8VbH5EvQnr8tNlaT1S9BosQuMBPLb+2CCJh3qpgC/FYUcIjt?=
 =?us-ascii?Q?OFShl8FJFdaO40N1OPQV2/8GcchUYrucxOm0A4UmmfB6pV8o3yQC7LQiMkbK?=
 =?us-ascii?Q?b2YADLH5fldsC4gsGeBl446LyjnkTdzIbYLY3Z8Q+KNP/3VgQGVlk8erQNOA?=
 =?us-ascii?Q?wdPN4va7P02MKuJMzisq9bTHHUQyLe7e/VAttkVD7/0Hyg3DHEQxcF7bD3uW?=
 =?us-ascii?Q?clONLynyZumlA3FauoA3/wTGmCGpjJjLoLZmsLRkmuJpVEjj3n3j8/YZk6kn?=
 =?us-ascii?Q?Xgw9qj8X5DOVx7u8j97X4SLPUO9agLcaEbGzTRYBF5cLb43u//U22uIM0CpL?=
 =?us-ascii?Q?w82oQrqMWMIjvGY79T12EUtEFh/XYwuV5uTAWHURCPAZfogoXPk21mJmg/Ox?=
 =?us-ascii?Q?KSxRnrdii98rXcGA+z3O9AmR+47Q7p9YcwJ37kg7W75AwWGgyK8eV3RGm24e?=
 =?us-ascii?Q?F51zNMSOjTphz75m4nSKF+3LtYqjNEvqaTEIYwmzjT7d9spy80JhMU7IAz3y?=
 =?us-ascii?Q?3SAnqXoXUXsFnGcYSlIIVJY2oUCf70IfYuhXjt2rhKQExUgW8OIcUMwqkCv0?=
 =?us-ascii?Q?/t6yx3ATu1m9H1DjxCvzkXunaqFqDoRd6qNveHeSRP9i2s63o8fYCGCinuj5?=
 =?us-ascii?Q?j8fyzAKrDm30uVj8ACT5WXUddCbUWylPe+fzuFA0W73HVcsQ6VsVwnWfWRPH?=
 =?us-ascii?Q?PujuPe0TmDKUu8behLvpG2kNyCz5mnPLkH4mVzHwq4M8abGSqmgjUZZBDkPd?=
 =?us-ascii?Q?Pf760S1xtr91fsETI+B6V/VH7ci7Nlf0AZQkZrfDt8YhQrO2q53BEVHEmJXB?=
 =?us-ascii?Q?4zH9PxpFWo9C+7pe4xVEgI8dNK9RvAhAR+agsum9AdhKTisiQ37okBY8Xo13?=
 =?us-ascii?Q?AsPsJtKrGFRrJV3RY+K2cZ3h2mQaxeH9M0AociMwjrTdsdbkH/D3pAD5VzwJ?=
 =?us-ascii?Q?2G1imT0CGLsQJ4NaIM6ln7TW2sSDcAQXbEC8aZaOIuzyGJXPdsrqwrUaeowj?=
 =?us-ascii?Q?sjWbLXXh+nxJmpUqTR4tTc7sGQR7Orhtiu7aZh0nuqv+7DyOI9Y+JXuxXctG?=
 =?us-ascii?Q?XGDx1X4VeoPz7DhRSCevGvYzaWORWR8oMKhofrqkGbDh7DfzmWpdzn/KdUSd?=
 =?us-ascii?Q?gML8UTe2whw+JrrskR6a/pWdgM5YiqNw9YPKMR3dTVqya1VdCtJfvbsGl6l8?=
 =?us-ascii?Q?OCH74VyTc1xHUr/B0IK+JmmU5A6H5GZT45m+n2pPJ3QUpqQ5VNtY6kNHBTaq?=
 =?us-ascii?Q?ulNh1M63HzQoh/UXANlZ6OikKeQGk5BE3Zxk8JAzHS94O5wsia2uyTt7OTvh?=
 =?us-ascii?Q?AQqGxoePl7hEfQPMgfX6euu3pd84i6IB8hNS1ujSWfix09JzJT1j4X7v389G?=
 =?us-ascii?Q?c+YyxcFrV/x8evM2sWIjoL4NraxWJcgUmfO5kP0w+GVXeD2xfuzWB5xf5Pre?=
 =?us-ascii?Q?lSNjh/VhZrqD3LSJVDUr7hkWkTQXOyUaKLWKgBxB0k7Q6w9i46500ztt6Q27?=
 =?us-ascii?Q?iMaaUhwm3JRaNrPJ0rMpjQx3dgNMQhF/cyftqtrR8tNZ2Da1?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62aec878-6b3f-4fa4-5254-08de7a9f3183
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 10:08:48.1751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wcyyoh2IRu8Wwukj4CutjJQrH9VM/IoZoftAk6ZYsz6PAhOGRg2QktzDKNw3tCnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/dYbl42vbnI/EIyJdaQhPjjsQefzSPoMG6ZO6xf7b8=;
 b=Wbcy9a+fAaj8jT7URJOHBjgHjkdQnNE54IGz3JTGTdGg4+K0/RQK2muuui1EzCv/3ZIEpq+928oxfDO076QdIj1XCbrZzxodMBv9Q4OceGqYO6WCt9pzYz39D5yz0KVxR8q6c2LE8necBBin04/fBsMHPbg+hygx4nDtaTJHIQA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Wbcy9a+f
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/3] linux/linux.mk: export LINUX_DTBS
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "fiona.klute@gmx.de" <fiona.klute@gmx.de>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

>  LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
> +# Post-build scripts may need to reference the LINUX_DTBS,
> +# so export it so it is easier to use
> +export LINUX_DTBS

> I find this a bit "meh". What about using "make VARS=LINUX_DTBS
> printvars" or "make VARS=LINUX_DTBS show-vars" from your post-build
> script?

Thanks for the idea!

The following works without the linux.mk export patch:
LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
ln -fs "$(basename ${LINUX_DTBS%% *})" "${BINARIES_DIR}/system.dtb"

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
