Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE1C47DB3
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 12:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBD284DA5;
	Fri,  2 Feb 2024 12:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBD284DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cDYDp7eO5Ms; Fri,  2 Feb 2024 12:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D425284D9E;
	Fri,  2 Feb 2024 12:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D425284D9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37C5B1BF417
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 12:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFFC6F49B
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 12:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DFFC6F49B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTXftwuHigwh for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 12:11:36 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8716461AC2
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 12:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8716461AC2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6NYUs2Mqo6SdQDge/Ku9blx2qHHjhMc+vz+2YRq60jAFhFBhXcTWdEqWi8Q32lFDgYqJTQRG1Ic3tSKp2zwP1uNTD326NUy08Weh+s6OxsKxC3OOKjUxo21E6pv/EOJw6fU77c28cUH1AhEUA1cpUElZgBSu5fJVsy1jKmUDnWdUdpsmKFwwwgr/fVFNIADTBguuuy+zBv0B8JViYlaZZcFwLfzv//s+xsOyxO+SVCG99/y743dLP2EbsABM6DeSEtQzeCssNkmea97NhpJ8eDudmEWTgKy60YxoO/I5vS0u6m/99n4Rv16uY7ahKjJLU7ycK95jad/w3G/WiDoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqXgQ5qYkuAL2NhQj4s6BaVDMrZNvjTSDSYICQGKQjU=;
 b=iEhTxHI+6oNYZ1CdyDhCX3Z9jZN1EWQBuvhtVUMHw3k6j/3sKRp7mJlX/tvoW7HMCTZAvTT7TQUPikSA2de2a59ZJPMIXQiiuHP9PS68xZIhiyvMfBQdjXApuyAo3KCRCygF60CSv+EvWUOvLPCIt5HKaR1uWjkSRS6mxikv0jMYAER1s518mSdhE+zBbWVxO6PIw0oRZJq3Go/buUX9rAnUPgA57BUEEHSiS4/8dv1aypZ23GZiWiX8fAnUxZrvOAzMcCcRrDCpycXpYhYDll9dbE7M3jeD5Y6KXDk5DZ5MIkVRvxkPoRQX9TEGo7p4UMBHDCwLuuuVOI25bDYN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 12:11:32 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457%3]) with mapi id 15.20.7270.007; Fri, 2 Feb 2024
 12:11:30 +0000
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v9 04/11] package/newlib-bare-metal: new package
Thread-Index: AQHaVDfwcY5IAGXSCka3+KhJmKnMfLD29wgQ
Date: Fri, 2 Feb 2024 12:11:29 +0000
Message-ID: <CH2PR12MB500494BC58558496ED6A78B3F0422@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-4-neal.frager@amd.com>
In-Reply-To: <20240131112223.2175855-4-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB6561:EE_
x-ms-office365-filtering-correlation-id: d0b52bc3-2f3e-448d-9ec1-08dc23e816b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qski8f3qHCiCtq/9QdmtGScWjlCza2tjFFvWIRr1A+QfgiRA2vL5GAkrbkcoYQlYNF8PS1L3lu9dXf8rHQgHJ0rjcaeex+BGOKvH5uPs6eob3L89FhCM1oF7M/GK1pDkiNn8CWl/8Mb86T3SnX70AMqwQ589uDtHLf3q0c/9p/R0bF0fAAJJLEr+JMG/30xxReA0aNQ95Cc9BX81WXfLoWZf0cM2DNSMw4AAOc3Ss/y9dBpZrbpJLWogDE+6MetFhcb0StSiwRfsXXCXV7iHFG5XzxyfEK8nzYGOYh9pXuclcQbkovHzk9JcZafcQbJt2wdiuPJm2c8lMQNpv3gKhcbVvicXItFm/2hJ2idHEBuGev5BRhC4KOQuFH34A+AH36LpK+orI12SULuabiFAOMJYypRYG013g7O2iHBFe66c2m3er2V2lM5QYQkUvPwG9yX1rCnqFi/WQ1snLlzy+WDn1C6oKwJwoymkt+2A50U+ZGPutUmjnGBYxpgCu2CwyE+rVp5pvpw1MDlYDZyR7oxBQJd8cioqlIQnW6UUZuxbbuJI8eiduY85obH2e3OAySK+aTOcrmx9bfifwxYZs+tve+v1QcfxTN8ar3yyDEhv5zgzJFDuN9gBGwTf0k+I
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(9686003)(66446008)(66556008)(122000001)(8676002)(52536014)(8936002)(64756008)(4326008)(71200400001)(478600001)(6506007)(2906002)(7696005)(54906003)(5660300002)(6916009)(66946007)(76116006)(316002)(38070700009)(66476007)(86362001)(33656002)(41300700001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJLamdCVUFsZSttSG90cjIvK2IySldISnNuZDFzSmdPT0tTOHhsa2dZWUVk?=
 =?utf-8?B?OGhFWk5KN2c2Wlk2aW40MXIrekFhSnZBdXM5NmtWenUvK3BMZG5scmttUzZZ?=
 =?utf-8?B?WkZtNGxvSUlaMjRIL2hsZE8rTUVwUUd3Rm5Ic0NnZUsyTHFlQS9YT3FUYmFm?=
 =?utf-8?B?TjhRK2dIUzFkc1ZjWUg4NW9lSHhETnFQMVhDSlhVbEc2REVxVmNUMm8wZ01q?=
 =?utf-8?B?aWRjUktUengwSDdZNUxQZk14MU00UXZsNldQUzNuNWNibjQ1ZHhqZFFjUWFl?=
 =?utf-8?B?MVZWc2F5VGp3b2liOWhGZWdESkdtckkzSVJsZW9ma2R0OXIrU2NHOThPNkc4?=
 =?utf-8?B?OXhOTXR6MVBBcmdCVG5kbEhFNWdReHhyZmxLMUhDVG9iSjcxeWIyS3dRQnQw?=
 =?utf-8?B?SjQwbzN5T01NM2NNcVRvcSs4MnJyZWdXK0NmTmJyQ21SYXRNRUlKZzg2TjJ4?=
 =?utf-8?B?b20rejRCZVF3T21ORHhLUlVPMnpWSXNvcloxKzRITlNEVXo2c2pQeVVNQ24z?=
 =?utf-8?B?Y05tNUVnZkN6QWUwSkdXdUJibUxtbC9YMHFldGMyQnVHOC9WUXN0eFdKWGlQ?=
 =?utf-8?B?WGNJWmlrU29GYmZSR2c3bkR2bXRzSHZkZVoramIzV3ZVd1I0V3d3bE1qU0F0?=
 =?utf-8?B?NTJBaVQrMU11VElOM1dBaStOV0F4cXJWWmg2SEZxNSszQzYrblJEUnVkdVBG?=
 =?utf-8?B?UFY4VG1rNnRjUFpDRVRuZmlaTTA2UWo4UFdGVmhpQ3hkdUpFRVhwTHNzTTl1?=
 =?utf-8?B?dEkyQmZJTDF5RG41WFNpdm9aTTRLNHcrL0Y2UVA1dktSUnZ0RFhDZUl5NzAw?=
 =?utf-8?B?dFp4Rm5HSlkrZHI0cm1JenlsaTdhdFhxR1doamMxTjhWYllYU3Z4M0NhNjdJ?=
 =?utf-8?B?UkJ3d1VFTVRzVUROOE5Nc0djdjZ4S2cyeTRrSHpUM0JKTkNqNjQrcEV6TFMz?=
 =?utf-8?B?N1FXcU1xNy9Ec1Z3VUh2MkZUYkVWbTNkcEVNaXl4SDZlQnRHeEQwZElBQkU0?=
 =?utf-8?B?RitYOVlqWVhwY2kwbnQwdmJGSFhJWkhzR3IrQUp2OGdvOWdEMlBuVUMzM2FE?=
 =?utf-8?B?aE1BME43M0dEa3RrRm5HN2lWelNsWkpQb0oxRUJPYVN5T0JOWEJvSjNlOVJK?=
 =?utf-8?B?L0VQS0RkVDA2Zjd6OUdUL3VrNytPeGgvY1hNTXUzWENwalVsai8vTWtydExN?=
 =?utf-8?B?NlJQdmpObkY5elNUSzZ0WjZ4d2tvVW1rWm9VUEpwS0NBT3pKbWJHTmxtSUwr?=
 =?utf-8?B?c2hqUEIxTHhOUlBRdEVWNXB0OWY5SjNidG1iT2J2M25PclowTGt6cXJ3QmNR?=
 =?utf-8?B?ZXk3UXdFbHFiMTdMVUNnNjh0WFhxK21qaW8xVCtOQ291WENnQ2FTUmw0cllI?=
 =?utf-8?B?TldheTMrWGVFZENMNTk3V0NIcmVuVzJMMlJMd0RNeWx1WGhCZ1VDZ2t1SnE5?=
 =?utf-8?B?ZW1UemxkQkdFK1kyNlRZelFxbU81UXA3VDh0VlFPTGJPalYyRVZjRkxZd1Mz?=
 =?utf-8?B?SHA5MDFNaVdTK0htLytmdWdneDRJdERiYkxsRmwzWVVoc0JHRVZFTDRoQUZQ?=
 =?utf-8?B?N1dORE41bnlKWVNIaU5DL1RhK1ZhVTgxWmxEbURTWEtMelRiRW96QVJvUmtI?=
 =?utf-8?B?RERtSDdkWWczWTloQlg1OFRNVW1Pby9UNDUreVRXVnl6bDA1cTRYUzdpekky?=
 =?utf-8?B?UXQ3NXpLY0QwODQyZHpiT1hIcEpwQStSeEdaYkpVQ1BtWFVZQTMrWThDSFFK?=
 =?utf-8?B?dDQ5bk1ReVZvMVgwRmV2T1NGK0Y0YTZsbmM5QkdsV0NuYUUrUit1dnZxelBo?=
 =?utf-8?B?eWx0NmJSUlFwblR5RWtJaWJ1Rzdva2NCQzhiOUdQbUpSSkxvOXlPbm1MYnpK?=
 =?utf-8?B?Ui9nSmtOSmFPZlNxa2EyNTd3ZW1CUlY5dUlxZk1OaXAveDc0MlZ6NkxTQ3NQ?=
 =?utf-8?B?RWZUY1JjUHNhWUxvQjVadHI1VWhadTc1OFVvZWlJbFBnUzJyS1BGUnhVbyt0?=
 =?utf-8?B?d0NHeEI4WEgzUjZocmV0bXFHMkdzRG1NQlQxc3N0ZkRiRlJhaC9xMnY4bG0r?=
 =?utf-8?B?cm5WVkFOemJsME1RVGhzcWJGd3ZQaU9qcEhRZ1E4WVM1V1BMQzVaTll4dkdl?=
 =?utf-8?B?aFlqVjdNeWFPVEp0MlBLL3dudUgxWmNBcUtFU2ZsbnlocmxsNjcwTHhVcFVC?=
 =?utf-8?Q?/Gjkp+p6q/dI7dkY4siPPhI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b52bc3-2f3e-448d-9ec1-08dc23e816b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 12:11:29.9762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ep5An16KnGo0teNyIZYbH5JCrk5ua6YD4FSqnGcn2Bc6BHXezSjT6eHpAYwpXOjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqXgQ5qYkuAL2NhQj4s6BaVDMrZNvjTSDSYICQGKQjU=;
 b=hASxk0xadEcqnPEDc6LSJprqAmCU83oehv5BVkZs7xUqLd1kGXwnRS0Ntl9WS0YQDw/3pc1Bj+6sJ20sTFWpNSG0e0iYnmekc4+4AvLa5ddRbqWRdIXVCJcwREzRRn6zo2l5offa2LaFaqA5EaZsgzCK5Rz9PjTz5Rgx5ACX1ig=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hASxk0xa
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v9 04/11] package/newlib-bare-metal: new
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Have you had a chance to look at v9 of the bare-metal patch set?

> +
> +define NEWLIB_BARE_METAL_FIXUP
> +	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/include \
> +		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/include
> +	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/lib \
> +		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/lib
> +endef
> +NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP
> +
> +$(eval $(generic-package))

There are two things I wish to highlight.

1. Thanks to the binutils 2.42 release, we do not need microblaze patches
anymore.

2. I chose to keep the newlib fixup. Even though the --with-tooldir patch was
accepted upstream, newlib requires autoconf 2.69 for this patch to be applied.
So rather than including a version of the patch that works on the output
configure script directly, I thought it would be better to just keep the fixup
for now.  We can remove the fixup with the next newlib release which will have
a configurable --with-tooldir option.

What are your thoughts?  Do you think any more changes are needed before
applying this bare-metal toolchain patch set?

Thank you for your support.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
