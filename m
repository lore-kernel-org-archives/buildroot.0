Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B541C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 11:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7B3606E9;
	Sat, 15 Feb 2025 11:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXkgT6skdfha; Sat, 15 Feb 2025 11:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F76860A7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F76860A7F;
	Sat, 15 Feb 2025 11:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDD6872
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 11:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD01F84812
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 11:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7VLFPM2pizj for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 11:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::621;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95A2A81BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A2A81BCB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::621])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95A2A81BCB
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 11:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH2IBuXUrnd52bBSvtlkh/KzMbzgoUP485IYpJQnoDIO41l/9ZHM03sKmx5lStai8XHRGIQE6J5/1DBNgsGZgchuCzc4eGjusPfQ7Z0RI/FeF1qFVyma1FgCogRigH+DAaK0a+8mp01ZsGWCPKmqvHsgxNfLPAdrsGTjyB5BwEa3qggy0456glEz9cgUUbD9BYOpSOT0YcXMpWqmHR9wSWP0IR9jNkyLQaM7vQjVUg3qi0qUxETvjmMiQ0GZQfsz/XqLCKDH10pJsplf1NBCJDgTkn66rrq8ZRtmRo0AJH679CSPWImV3jsSOpHTUouPKKjJdzE+ZtILaMeE0efw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHBIJjTEc2PytXteyrYYUrGPumLPf1s2ONywGNQXBPc=;
 b=pyZXfkPrWA1TEXQGAyvZkhAUn/54QetWYRDYcdPRmi8BDwOyO/y5Ip7Oc4/eKtLISW4yHBoiDykJgS0itsNMA8tsHnfr4OpOb8/46GZL2IszYXQjcLF3B9vHAWeNc3LQwTxBitffmXFUYyTcYMNgR9uov8cvZEGExphYuxcTaF3YYjF+b9pmiuSEgo6PE7E0MeMjsjSa/UWb8Uh0uBElTinp/XSVcvKR/Xymorfel8CqJef3vnFdkyuIcQZyqWQiZd8EFPE1lcpkuuQXfrDJJj2ifn0eFUzwD/dOj+zbA257f1FYaKVhLuVAIkK/L25qTAtA0oKodUajA5b+cmea3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ1PR12MB6196.namprd12.prod.outlook.com (2603:10b6:a03:456::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Sat, 15 Feb
 2025 11:02:31 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sat, 15 Feb 2025
 11:02:30 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
Thread-Index: AQHbfwEU5tKPK+VZW06b30ul8C4XmrNHWSmAgADZeXA=
Date: Sat, 15 Feb 2025 11:02:30 +0000
Message-ID: <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214225831.23731a2d@windsurf>
In-Reply-To: <20250214225831.23731a2d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ1PR12MB6196:EE_
x-ms-office365-filtering-correlation-id: ba64a86d-55b0-47b9-be11-08dd4db03e16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5rR51lMubdoSVeWUNMciABw/l4TUdP1L9JcMCSa6riWxnAbq23Tje1b4qk/d?=
 =?us-ascii?Q?tMtWVPWeC/sFFOzaIKz75cXFX3iNtmZ3ngwk6KZIvJWwD5HvPiVrGgYL8y87?=
 =?us-ascii?Q?YzDSUyBQ4WhAacqSXBBVSayY+DKOsnLrdRgpCjP//j9myZ3KYfLDTEXJ+tne?=
 =?us-ascii?Q?G1fqUdmVS8A/Dhd0eUH/01xQDyaHwjFaiNWnvQE/UxAX2lr5FUYoUJtdlILI?=
 =?us-ascii?Q?k91L8+m0/fPaptpf+j7UFVE8iB9W9PpNETVNCvaZ4Xeqpd0KCeiDBRcCZYso?=
 =?us-ascii?Q?GTJ5VeB34E5X0aMk9xtdbb2DPzxhrrAO8Xsjyfql+cBcvxqBpJbSf5Jkb4kK?=
 =?us-ascii?Q?77kDhFQZxrtzjKw5+yuUbaKqYmSUeldhitZcDPbYTCtyIky8NEYFiZbUAPMU?=
 =?us-ascii?Q?6XjPvUCfB3DufYVAwC7i9gkOe4IGnhB/Ks5GA+a4J/mrk9x1FmMqUE6vJ9T3?=
 =?us-ascii?Q?BAjpi1NL70XiPhvB/F2K5t/3p3q/oWl6GQLLtFbRSP7UiRPfDhBwpoQgMD0n?=
 =?us-ascii?Q?z+lhCcRn2y5FZdL1smgt2Y3oEEYhcXn1W1IMV54JEHJnVCYzOtCTDfX8XrfE?=
 =?us-ascii?Q?btmvpIsNXq/Y5Oo5VXZguBTeBhallS3l9xsaX5ScjpFwfZWauvhv87gEXdJY?=
 =?us-ascii?Q?9nenvSXftIx5TrAQ74RtadpxSX8qEa9x0jtDxOvGubYbDid2gzEaDWce218p?=
 =?us-ascii?Q?HKqJCFOgiK7JS8S0qEEYgMYwjN4ILDt9EKWceTcN/HB/7pHLi7atRGhXYyRS?=
 =?us-ascii?Q?KFVdwd6A7+IKVov+UOkaabbD7hsqWiaNG9mvyEXgiLSU8/OP/SVJtDKW04MN?=
 =?us-ascii?Q?8cwR5bFWd2/QOoWaim6NQkm7Z8NeisGyf7ePDRawOsi2zZT0W7sF+Wn0SDDC?=
 =?us-ascii?Q?tWYTNyefpEyjAPfQj3RwzeHywM5Ig4eO86jWWxqo2hLp6+sr+6CJiYBoBQMS?=
 =?us-ascii?Q?ecaI9p1wrv79PAnuxATJT8QxupAF5qYFS2uQjL1fx+zPZbFZWL5S2pTDNcNN?=
 =?us-ascii?Q?EEOlgnwQQo+76rJk2e80zlA6y1xM0WeRGNvTIWUJK98bRo4ePJu7EQ1EQkhl?=
 =?us-ascii?Q?ZJHMJvHsMn28nltjctLtPP8VOeZGCLXQtrPjVsbJV9oElCIzkZ7ItTns4t3d?=
 =?us-ascii?Q?QPuM/lnCE/5qVP2KVzXmruv3fo/3IDr/8Cn0+LWbje6y3RB2q2mEDKgz7kcS?=
 =?us-ascii?Q?kLgHyUJzKOVZYXNg0r7xdid4dF974Y4TuTaFPs2yPuQ5Qbh490EpjqK3xkBx?=
 =?us-ascii?Q?o025SxWZjQhkS4Rp/RgM1FPSi5RjpKwhX/cA5M0fU2jvAPgsBZDXRvO6SwZ8?=
 =?us-ascii?Q?FIIqw2+Qdd5imOr7DDb/ntTAh+2wuIXxBrWUkfmj1ucb/TOIvvFhMPeNfwIc?=
 =?us-ascii?Q?pKKnenQbMfTzjVYhrpCIxsHPAaStEzb9flZClUcDalelFaGokgFqSUMoPeka?=
 =?us-ascii?Q?YavtZoMJID8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bP9x9RboPse9s+hZIeoBMjuiwMyIMrtymVCEdSTi9fLu6vnNFafNcVV+G5id?=
 =?us-ascii?Q?L7nziJRMJ1/pxfCu0S4EyDo1TXUvvnJQPUEpzsPFG66IbY+IP7uns7j8wOR/?=
 =?us-ascii?Q?gmHE6kLL2nQliGkerwJHpFqy+LkX6Ixs8ScW+Y32fC7nrIm4AS8DrZPEzJA4?=
 =?us-ascii?Q?yDLeRArfT3fMHpwH7e42ErditCYGoH7ohuCgYkD4i/FC3NkD6/pe92r7Tbsn?=
 =?us-ascii?Q?CLMEWn6PD9b/nIoOo2N2Lfdn3TXyXgU1z2DGfygzjBLvDdDlACzuUiChI7pB?=
 =?us-ascii?Q?SY0MwEhZOoe0h308BT4Fe4IqGmeHpUTZoqZqrGeJ/CltGK4V4dwAJjvnubrH?=
 =?us-ascii?Q?iYdirKDfy7MUo6RuEC5VFykt06hXOD78opO3/HHMLqS0Dvg5CRHYN23pDUu1?=
 =?us-ascii?Q?4CoNQN9r3rfTiLBObpe9qPwCp3HhswU0FzuRN4v2VzcE5857G1PcbjM/OWo0?=
 =?us-ascii?Q?778btGxT3iCfMNB0UGvxBbERZnJqoi4X75v9W/Zri6LaZ6YUVvm/j26vhaPA?=
 =?us-ascii?Q?dVP1D3RXvsS4dSfWsaziaB6WmOwNoumxiB0CV0v5Nftc77QhHRyeWrw4UzVy?=
 =?us-ascii?Q?DgGXf9GhQts4bIzz9fcUzAGvudKEiH4Tkua6Eqo6CY+56C8gNVrknSn7pWWd?=
 =?us-ascii?Q?b9IDd1NzDwtkZKpR1993D2oE5h3Vi51osRH7+2SHlJoTNu+1zG4wfsjSkNt7?=
 =?us-ascii?Q?LA1WZOHd3OTgDWeF/YILSToYWJB/1GDzdQLnrArSS7WveeZww2C8GbGM2Vec?=
 =?us-ascii?Q?3XdGYJpslm/lKiuA3F7Mt6wFhE2TMys6IlUYH2hXg1AfRix5BYY67y2pjWkn?=
 =?us-ascii?Q?nAofor0LrViUIJfH3vU5ko5nvYWBgDhn+fwtTrJIfp/J4hLckge0GoxwF6Gu?=
 =?us-ascii?Q?FNptm6E5TMX38v22ZY10QWbqY1uBSa72BkoCj6RZincxkkGsv917n5zgDhou?=
 =?us-ascii?Q?NrQeUYa3Nl+tw0Ik6yBBjHIcIyETyoGdQBqKk3UYVMYnSmsxr35S7eaDKTG1?=
 =?us-ascii?Q?JSCxb9+mq7eou5FPvgDdwr6aLt83r8BR1/1sJEYSjFrJxjaEqGzGRpjZguQ6?=
 =?us-ascii?Q?bFKElWF9FnYnErHv8gFKBYPnhKROt6r1aLYeIzoSDoWzf9cz9pt7AYOHym92?=
 =?us-ascii?Q?LLWDbmiD61XcOB3GIU/7A+bS9xBpfUSTe3rAqqaQPJ9efj9gFwmwRsUvofRt?=
 =?us-ascii?Q?3qzGxxzi2vPMfTglxhplL4m/7JFebIwMVwkT4VM1jTT4nHIi+QRDfL2dNrF4?=
 =?us-ascii?Q?pKIqiJ9xQSL/4aJkQF896tjHt4X4cD6mIPxQGiBY4Ws4NlcLzTw0+kYkqdZY?=
 =?us-ascii?Q?wHMJYNiH6hV9uEL4Fonw0XtFruRz5NAMuZyT2VfJeq2szzGbw1kGwh+pjj5S?=
 =?us-ascii?Q?1BE15B3Tgch88g4NXXXNX41b41AjpLqZZ+T3/D3GyTLAgPY/QxgSvzv75dMw?=
 =?us-ascii?Q?8mnI2+xbeQTuSM+howdQwvBgNnGROUNSGXtnjUOQsYJbL1b3a+VE+Yeh2cs3?=
 =?us-ascii?Q?qnaKgal1Pd6WVbDVlVNbkT6Ij+hAJAPWuF6iBf2cUSU+l148HB973NOs5SBN?=
 =?us-ascii?Q?d+dmYBEc14WgNlkyFEQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba64a86d-55b0-47b9-be11-08dd4db03e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 11:02:30.7440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvnCw9/VbgwW62aOtWJr0fDXkLtCXwuqFUlC8BKf9RzQZSUTrT4c11JgrwyC0/9H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHBIJjTEc2PytXteyrYYUrGPumLPf1s2ONywGNQXBPc=;
 b=yUpNzy06+EtUY+sXXVacMR5ODE+xYyNRQlqwQZM2JYMf6lUmxUCEECMkyo1ggfZtZnWunsi4pl+F9+9QkCGGfg2bh189tYvjKp+THAdAGAyw+5pa2CwLJ+iURaj6xCmqumuMmqMjNN49KobTeFvb6NVW2I3DBAnC5SahSFCfas0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yUpNzy06
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Hello Neal,

> Thanks for your work on this topic. Overall, the approach you have
> taken is exactly what I had in mind, so that's very good. I only have
> some implementation details to comment on below.

> On Fri, 14 Feb 2025 16:53:59 +0000
> Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> +# to build for multiple arch tuples, it is necesssary to build out of the
> +# source tree, so that each arch tuple can have its own build location
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		ln -sf ../configure $(@D)/build-$(arch_tuple)/configure;)
> +endef

> You don't need to create a symlink. We do that in gcc because we're
> using <pkg>_SUBDIR, with which the default CONFIGURE_CMDS from
> autotools-package assumes the configure script will be in the
> <pkg>_SUBDIR. But here, since we are anyway implementing our custom
> CONFIGURE_CMDS, creating this symlink is not needed. So I would drop
> this HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS entirely.

Lovely!

> See below how things would work.

> +
> +HOST_BINUTILS_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_BINUTILS_BARE_METAL_CONFIGURE_SYMLINKS
> +
> +define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \

> Add here:

>		mkdir -p $(@D)/build-$(arch_tuple) && \

> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_BINUTILS_BARE_METAL_CONF_ENV) \
> +		./configure \

> Replace with:

> 		../configure

> or:

> 		$(@D)/configure

> whichever you prefer.

I confirm this works.  Thank you!

> +			--prefix=$(HOST_DIR) \
> +			--sysconfdir=$(HOST_DIR)/etc \
> +			--localstatedir=$(HOST_DIR)/var \
> +			--enable-shared --disable-static \
> +			--disable-gtk-doc \
> +			--disable-gtk-doc-html \
> +			--disable-doc \
> +			--disable-docs \
> +			--disable-documentation \
> +			--disable-debug \
> +			--with-xmlto=no \
> +			--with-fop=no \
> +			--disable-nls \
> +			--disable-dependency-tracking \
> +			--target=$(arch_tuple) \
> +			--disable-gprof \
> +			--enable-lto \
> +			--disable-initfini-array \
> +			--disable-multilib \
> +			--disable-werror; \

> I think the final semi-colon here is not needed.

Without the semi-colon, I get the following configure error:

configure: WARNING: you should use --build, --host, --target
configure: error: unrecognized option: `-p'

It seems that the loop wraps around the next mkdir instruction with the
configure unless the instructions are separated with a semi-colon.

However, you are correct that the semi-colon is not needed for the
build and install steps since these are single instruction loops.

> +	)
> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_BUILD_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_MAKE_OPTS) \
> +			-C $(@D)/build-$(arch_tuple);)

> Instead of this final semi-colon, put the closing parenthesis on the
> next line, so that the loop looks like this:

>	$(foreach bla,$(list),
>		something
>	)

Done.  Thanks!

> +endef
> +
> +define HOST_BINUTILS_BARE_METAL_INSTALL_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_BINUTILS_BARE_METAL_INSTALL_OPTS) \
> +			-C $(@D)/build-$(arch_tuple);)

> Ditto here.

Done. Thanks!

> Thanks!

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
