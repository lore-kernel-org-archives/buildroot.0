Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6313D5B16F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 09:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F0DA6077D;
	Tue, 29 Oct 2024 09:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1S4POFlM2QsV; Tue, 29 Oct 2024 09:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72067607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72067607A8;
	Tue, 29 Oct 2024 09:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25206112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05EAA4063E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIAfjubdPXiX for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 09:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::61e;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C25934064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25934064B
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25934064B
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibRcKmNJMeAHbj1U0dM7wpQX7TqNJclm6f16GpDVbcOy4q0RJ63BXYSn4SndGQXJY16+n2Tv/3PF+IqnZX26SOSYG2CCLvevaHy+W31UilzOUtVRpHk5MLLfX11DqdJ8zLXBww9kVXsek6Z3V4s2S+AmEegXkC1h0CAGH/2XKsgMdkH+Qw6VXvPR4QxK9BJG9RkFH7Xs52uThw4jiMBEPH+Z0Bq8QPHvIvVt/ilpjOwKc3KLoj2iiKj2Vi1HYOksJYxgMMb3MfxSixp7mEU85OANOIt29k5n3pUxJOzRxAalSdOJHM4V8dYz4TwPkod+V0QJep7WLqweKJ0/eyC6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPh/Yz5RfGiMdN1IIPr8KNS7EJkbHcIamWKWC0e95a0=;
 b=EqKszVYTJ/3SDxOHp1PlfukOOu8OYmSymTBgwdiw2J214W1pMhmxM5RgPT8oSQCNo3cU5IQLiMfDzVWG/rM/Hme0s/nyE5Eterpa+yDgxv/FzBOn7T+2Bepuwtp7dkqz3+BIRsTiQpftkwdUldd3hJFD4Tpblh7r3YUce+Ea/75sTAX3RtIP5OJXi+0vW/mrxzSGkHtQi72/XRlvlGiav1/BY9pS47ORNeshp8Liv0vTn0f7C3IDCVc8ncBh/hS7viyr6J33ttAhWrXJApuX4VeglDRzezV/hAf4xJYWPjR9fITYAjlCg+ufHwOAfEnn+cKawH75fXEQIk9sWrpvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.27; Tue, 29 Oct 2024 09:08:41 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 09:08:41 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: clean up variable names
Thread-Index: AQHbKdC5RjVKTZ1nSki9qGu57LYSNbKdbquAgAABocA=
Date: Tue, 29 Oct 2024 09:08:41 +0000
Message-ID: <CH2PR12MB5004C6ED05628E45F099A388F04B2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241029070344.2661276-1-neal.frager@amd.com>
 <20241029100133.06382c6e@windsurf>
In-Reply-To: <20241029100133.06382c6e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB5745:EE_
x-ms-office365-filtering-correlation-id: b9bbd607-e440-46a9-2d05-08dcf7f9488d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?d20kj4V+B7rLKgoOk2kfwJKxhIxHOlrYsPWLpVDT4UIWKH3QiThwepSVCCIK?=
 =?us-ascii?Q?n7jdbnTPv9DHD+Ar8pKhnoTCIEmD8ANNRggFznyRg0c1FjpCZtclhLmY5mnu?=
 =?us-ascii?Q?4f5riEFR+cUrNq7oCxkyEVE04194qO80dzrOla+XmindZkP0qRzb6Esq0Xoe?=
 =?us-ascii?Q?VWDGQRte5NUnb0ewy+JvYkaekm9TSN4wu7adwzB5CBEhwU09D3WXqUThdHDH?=
 =?us-ascii?Q?kYYImxRxGJCjkuZjZE0JKpSE3ieVERyt3pdTf4rwmsBxl+KdQzQ2EbE0zabe?=
 =?us-ascii?Q?OjoomwLI5YPLDJL2gMxyrdyAdmFuXwZ8eMnkBAU5N/Umwl6KnRD7eiN0C3iL?=
 =?us-ascii?Q?G5SY+i1WaOH1GwGSBOGucIaauZLBzfYjufZGGAqrxlMu298cRW59DSLWUcXp?=
 =?us-ascii?Q?SZAy3zhgZ+5IEOAGZewYwS7V1Sb8ywJdR2nWnx2eyc24mZkw8mY8+JPsa96Z?=
 =?us-ascii?Q?71/Yl+1JblYWTZI8QtFwTKOMeZLnNShMHuZqASJedT4khKShUJB8B0mgYeS6?=
 =?us-ascii?Q?WF27UVMN/MN4ADAFfGY7DR6vVq29KbHT4lPiyhWQ5fQPZCVOvBCwn728abwk?=
 =?us-ascii?Q?ddNxnYUPuust8+OamK2KpWic+YYZGfC/r8kMsbGl2hGa4F5q3NLDPmVBcoOV?=
 =?us-ascii?Q?fbw3gYgdFAZNBG2UAA8yVYWPW/WWopE1weJCJKt1s+L+DXpHJ/3qRTtGok7X?=
 =?us-ascii?Q?NgAAUxXtnjUsDTrTnWcgEPSrDzuuuLu+IsF+ssJSM8WmRDCHC/Oel7bW3mMO?=
 =?us-ascii?Q?lHJqGoGZ/mU9b7KS8kIH69HMe3ErpDW1vs1C4XEYsgfKOlYdlgoDtaTn/Wji?=
 =?us-ascii?Q?rK4YJ+blPpo5/I/3hYP/LSADchUnShFBkHkvISJjTNC9fL1W2Ysi82s8H/Um?=
 =?us-ascii?Q?Zw88K2YMNyWUtVrLMI/MEZGoMXgeMTSBeZGSnTe5hnxendwTjLw5uUfonEX0?=
 =?us-ascii?Q?zkRTRlSvI+MnvEgG9p//zRrUtqU/NM4P8jNqmGjZgFmvKbttXwgX4iXDDTOT?=
 =?us-ascii?Q?h2bf/6ez7fwRLFX7rRZ76rso1Mg2yVVVkgf/hjPq9H5LUpuCWk3gC5FQyzae?=
 =?us-ascii?Q?LgUX65LFHCq4DXMjV/87WrVa6g3TNw+k+xzSx+Q3q+Paz/1tngziYOL06Fkv?=
 =?us-ascii?Q?OcUW82cUXo9Wc9RMLYQ1OIduGFYcg5EuT/Bhfut4u/QgvFCiy0OJP8UqbjUd?=
 =?us-ascii?Q?RqBU6F7qm6fwnI+vDWu0fzTua+cs7hO+dSkfpOC2r+QFtxM2SNHUvcyUwtCS?=
 =?us-ascii?Q?/eSpw0aOdUgq56PaEZ/JIQwFSFGTza9iO3YRGSS7gLZGsOp2UiKBV2j0N0+R?=
 =?us-ascii?Q?l+ZOD6VfxjBzK6U9g70gjOrQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?elGgPFCtLV5HLb6+GxiCXV3Q5Hp/JZTRH9Qwifb08wI5bnaryaarCwh7Qd19?=
 =?us-ascii?Q?x+mxEI5i+fdCWMC6rI+NLtqd2bRG+2o3VjF7Z27l8quIy8aTM+h2bJiky7dW?=
 =?us-ascii?Q?AfxaVStVOpfqMGHmxS3LvTKmxN/lzwx46BQZFPXpfnK9P+zO3N6CTw8dfiRM?=
 =?us-ascii?Q?DTvClnYSk4YtEGKsL9fR8HG4wiK58mRDhqWeFeuQhYEGx6oskffsm9RHNI/x?=
 =?us-ascii?Q?H99UakyFH2icWVwYn4RphNci9oA9+8psHQzUfLBMvdf/1ayHon1Q8BsY9OvM?=
 =?us-ascii?Q?f4PR5OrZgRcVbJffgVmQbbtiZB79f3/0pqcbp+FZaADyJ19Fdhdt6C6yBX9T?=
 =?us-ascii?Q?5NA/sZ05ACkMsAR9YpAjJfMdfdGIAvgLyc4tpX7C3RopebohICihk1hWOT7b?=
 =?us-ascii?Q?SEl0HFh3fNhGdKg58Hwp9b3cI97ZSgO3+iD7fr/xWITBraOdXq7s4hp5A6BH?=
 =?us-ascii?Q?D0dDPUrNW/rd779sgEtGqAWCuhDKbJbIJF0y0ZyFpCNv+9Zi7H1fnIliFvkE?=
 =?us-ascii?Q?blVwLg1iClugqIHdbkT/nrVbPNMrBe1o3GlwCudkUvCrIIZ55r9URzDIRcSg?=
 =?us-ascii?Q?XCAJ93ew3kn8gkBaFvLYtxXtyQ9lTRkYBoGQZ4X3NOe5rzNhRojRsvLAPhzo?=
 =?us-ascii?Q?COmeG73RhLUErv6ClHA5kDS0teSX5ivzr/p0bURB0+jbG9t1MPEeH4VRXwZb?=
 =?us-ascii?Q?y4fKdQwt7n97IBfikWh2JCEXK9VyMjRTzoEQ7ML8mzlEYhGB4rEhQZdcVEGd?=
 =?us-ascii?Q?9yDrur7mR+fjIFRRP3z287be4Ta4iSk5CA0mDa+54lzPrNjPOsubIaZ2L9qz?=
 =?us-ascii?Q?1bZy1UAdtG08v49XuK+zVhrF9l0fqBzHggE1//vUQhXwu7u/MTQxGWsNV0sL?=
 =?us-ascii?Q?DemdIb6R5PU+NtnucnkrY0RUCwAByXLNSfi93uhwzoShLyJQgDQnwqN2Q3BG?=
 =?us-ascii?Q?vic3e00yP9vi6rUa+ZbUpGhp5sWKdSuQl5fcLjHE6StqcGXadVpNsj2+Q4E6?=
 =?us-ascii?Q?u/pqLFgF33CSooc9UNw484byhsEdqHG96INzHdGFbeSRWfluegSs1VKNxsI9?=
 =?us-ascii?Q?yzZNVm09lX7OvEJnRXP5abBn5LDDCW1RP4Vp7umxADtCOeU6uzWT30ODmrZc?=
 =?us-ascii?Q?pXVdbl3ciFUFF26WZ2Hnz94r9vgcEdd1Ge0ntglDc8og2qh05IyK/rf1754N?=
 =?us-ascii?Q?FRrg6Nkmri07RjWt928f9pP2NYaoLB9xr4QBXOIwPNNas7M1hPG55t6rWAhn?=
 =?us-ascii?Q?0yjYFpLSw7ta2bxZhWxNs8mL4C83+w7+FSVNfwIc5mhJT7OvJIq1FG8KKy/p?=
 =?us-ascii?Q?fSvZ7+/bhgjKZNgvMU6HDqlPe4lMdmpd6s+lRZoPxdz70mu+Sevb8oUoHYc4?=
 =?us-ascii?Q?1cgwcSQjke7brT5Sn6QxcgMI9pwucBVwSJ/lqcmf8cJqGObmHmhE5WCOz38N?=
 =?us-ascii?Q?bnXx796zOFeTmHzTxqS6sc0XY5+DuYe1G1rG9nuWBRFjtLQ95LBErfAPWiPi?=
 =?us-ascii?Q?v5nEf3tZ07t89welXumKwvDQaDNdF3VIJb4xVgMRSc5xq/WBrlSUHVT/JpYj?=
 =?us-ascii?Q?D+IC6TZXE8uxXeRUrG8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bbd607-e440-46a9-2d05-08dcf7f9488d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 09:08:41.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HStLN6OFeXSK2Ta4gNzl2FgOBkwnNfn+yYYcdbQnf1uCySEsMVrYqQYe2Ghrj0/s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPh/Yz5RfGiMdN1IIPr8KNS7EJkbHcIamWKWC0e95a0=;
 b=ADLb/XdcyrjkE5UrimOTXeH18HaL31LqJru4q3NzHSmDyD2f9rJv+VTmWV20Pf8tvPn1gAQM9Sk+V0l7KYfFlL4yleARpVS2zpTUrWnNYce4R/6ps9xgVZFhlfCpM/VznlvFe1Bwl9X2HKAuKTr3q9NTLyFE54jA6VFLjRUbn+8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ADLb/Xdc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable
 names
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> -BOOTGEN_VERSION = xilinx_v2024.1
> -BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
> +HOST_BOOTGEN_VERSION = xilinx_v2024.1
> +HOST_BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(HOST_BOOTGEN_VERSION))
>  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
> -BOOTGEN_LICENSE = Apache-2.0
> -BOOTGEN_LICENSE_FILES = LICENSE
> +HOST_BOOTGEN_LICENSE = Apache-2.0
> +HOST_BOOTGEN_LICENSE_FILES = LICENSE

> No, the way it is done today is correct.

> Even for host packages, we expect those "generic" variables to NOT use
> the HOST_ prefix, except if the value needs to be different between the
> target and host package.

If that is the case, then maybe these are wrong?

https://github.com/buildroot/buildroot/blob/master/package/binutils-bare-metal/binutils-bare-metal.mk
https://github.com/buildroot/buildroot/blob/master/package/gcc-bare-metal/gcc-bare-metal.mk

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
