Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D94160FBC;
	Wed, 13 Apr 2022 07:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzsS6JBvqLIH; Wed, 13 Apr 2022 07:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFAA60E26;
	Wed, 13 Apr 2022 07:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85C511BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 673BB60B4A
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rm5AFBX_QrEd for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6E9A60A7B
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836406; x=1681372406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4FASjYUYyw0JuVhjE5fd1WFWBG3UiyR3y2Wi+SMD474=;
 b=Dr6xIK5B+nqwWquX9yw+srXOIMV/XLMPPnzI3ds08bRJRDuNgnAr6Uoj
 lt2jsvES7mcBq6kxLfk+aEqw+XyOZkcPOB20UfAkzqDesYbi0zIgmQBnH
 xiTczw+V54iB9oxQeHmzqNw/DB9wPxi7j8NWknCZRl9IOR+YjvlvNbMB8
 e0r96N/7xDNbJhiKRx1hirD98w9ovuXuqfyV0X3Jx3JJzxTqo3IxVKZFi
 F4hDL2T8BMsP6joD01s9RxSfQmsHSr+ZLnzNPrlDQaKNzG3uJChUql19u
 GqHHJ9JOmoTHv3pxfOgdf1MckRBNjLOpIGtvJ6eMm9NEkdcA8XnHsV88N A==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="159938633"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 00:53:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 00:53:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Apr 2022 00:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqLGemKmK49V3+J8V9uC46R0k0qMIfN/f9tsdza1AUFEGqbDbx/fC6/WsiI4A9Ig3cBfx0Wgan/vI3QtaqFShe0n4DQMm+jvBJzhudNfuyf07LRidirMRGnXoSUelLHOuJ/Fv7MlX5CeRx8zE+P/rFmm/lZM+Vr8+Wri/+0zuIp7nSL3G4qK2wHAQJ7dlUNW9j7zYsKaym6lbi/R4a38zljhcDM8b5PevG5NVQI+WbnQp90KA0oa7qZqlXqKBgzDOTZUHfuoWiK/DmZN6T8XRPTBoqLWrwJChWz3eqYstUOi4iaCImLBpdYWTAwmjKnyShiEb5vZq4VxOKYCkEjGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FASjYUYyw0JuVhjE5fd1WFWBG3UiyR3y2Wi+SMD474=;
 b=l/g0O4QbxBFVmpQi7uZNoFLHbBPsWJgHlP77DXVBgXVzsfNDO6pRHfwJctVSSsLjqGCiaeWb82bSlvMYCLo97eqaKBy5tjtYoKELMtbHE0tLqxs+bBjoYNIsmXYNbr402CFp0CGiP+L3i67lAViqv+5PaOZ5Kx2y+XpuoOWpLspgVoSrroKh+0s3bcjpzVdX+oTsMCLnulmrQVW0axNVgfbW0UBCILlmvv0smKFECxJFSoYprQPCnMsyR8olta8pAMnKFhqQiYUtx0PIGz1lAkVW0UX8hGMDFnPJ167e+kbKbfrFiHcaQktoMaBC298Yj7u4V3a2EHA8Fk3JKfdD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FASjYUYyw0JuVhjE5fd1WFWBG3UiyR3y2Wi+SMD474=;
 b=nGw7BApugxJO5QvlTpgr2kDFfAgcmPDmai0fwbzTbQNA/3JPFUrPJL+E38A0QCmTvwzHgfTpRV29s+I+MpbLRhutQn6h+1584kHTr9Jl+RkZItkVXxVMmzU382kQJFhzGTLD4M46KQ8ZgmlVIqxgdhkcM1w7lHpnMgnvvSN0ZAo=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB3771.namprd11.prod.outlook.com (2603:10b6:5:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 07:53:17 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 07:53:17 +0000
To: <yann.morin.1998@free.fr>, <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: security bump to version
 4.4.3
Thread-Index: AQHYTpm7dJIT1qsDb0u0HEw07B+vgKzsslQAgADHhYA=
Date: Wed, 13 Apr 2022 07:53:17 +0000
Message-ID: <0d822429-2bc4-cc37-354b-1317024d72e3@microchip.com>
References: <20220412181607.1451580-1-fontaine.fabrice@gmail.com>
 <20220412195906.GK4029883@scaer>
In-Reply-To: <20220412195906.GK4029883@scaer>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa33e01-ea2c-4916-0c51-08da1d22abaf
x-ms-traffictypediagnostic: DM6PR11MB3771:EE_
x-microsoft-antispam-prvs: <DM6PR11MB377109B49D6891C93635FF67E8EC9@DM6PR11MB3771.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MduoKiQWIr3fChmMDpu5PmcOlpzF0TkMq56eiv0sZSR+9qxfc9cGxuODjcVCMVTq48h6i0lVsBLsAbhxI067e6plRbMuL940R02jSJXm3fyZCYdvfBbwv13nzHiu1KtV56U57MbH65d8OhOMG0XGdwkd/FPa4RQ1sHm4iMckeC1axHSHHDj4iG5vB3AhNXwqQRfCj3HvXUWvqOpDecVp356UGZipG3qmKzRIOL1mccHVjlj5VJ1RktJmXZ/iSwkRhAUgQ0ScQzfH+O+I9CVszmaevYNM/B5hpZlghJH+UmzBaX/3USVy2YdoXgTZCN3DPfda248H1TP/hdkvm6Jg6mpWoMZGiLL3MVHhuQlYT1qJQQQSfaVxnooQIIUFWBvKRhcQrmG/7QeUk817brfva3dJN0dqzCTLwp0aAWjubNh2iEzvyVoS+O/Ls05+lhuOYEg3FgBQjWdYchQdt0JdUUVW/bBR8s17n5y0pPav+slXQXoULWHVNZ9vjYk/cK65xPWuAMSVSUBIIRlbrQomOBryYZKWww3tJ7J7twhPLAKoon+R9Kum/TFMr70AR2OdN26cdit+ZFLQ7P63CxxXOxwssx3uXLlTZ3ZyRwx7WrOwCaZBwURwsBZPJ9l11kiZwKHlmup1xrVoI1XstiMqYYGYqTr/iI/KnfXduudTN4msPm5TF9pOw4roRNyPdSSP+0L0KOBNfbPoVT51P77GEm90xPlUbMsDyuN/4XYVAElEYYGrm9QxnHoVNw7+tAIvS/DBm60K1LxkpAgGXlDzftNRyiu15TEzItDbD64THpeCUU9gwCDI2FhtHPtbSAkfhWMkkBUgTEd4Sf0uNkpxB93lCRjTd3MwwpHj0gEXuYpK30TgoPx2FFt7tDN0kz9c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(45080400002)(110136005)(15650500001)(36756003)(31686004)(2906002)(2616005)(6512007)(53546011)(8936002)(6506007)(86362001)(38100700002)(31696002)(6486002)(966005)(508600001)(71200400001)(122000001)(66476007)(66574015)(66446008)(64756008)(186003)(26005)(316002)(5660300002)(91956017)(8676002)(66946007)(4326008)(76116006)(38070700005)(66556008)(45980500001)(43740500002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alYxam5HZHBXakQxRkZ0VXNOQm9vVm1vdmRYb01YcGZBWFY0Qi9JU1BDOVcy?=
 =?utf-8?B?Z1BLVWRiZlVXNjVpblcySDRiT3BjcEx1V0RlRGFrMWwwUVVPTEpuTHZ3TTBz?=
 =?utf-8?B?eDl4QWVEQjZhQkNaYUxOMU5LSFlFSlZpenNkT291VERKNjhOb3hTWE5VWUM1?=
 =?utf-8?B?VTEvWXQyUHBEVWlrT3hKc1dhUDZmVnRwYkVkbmg1TmtCZVh4clJINkovUXQz?=
 =?utf-8?B?dlpEbGdzbU1neWxDZVZXTnBPcnBYZGg2OVdIZHh6YXlTeGh3ajNYeUxLVmF5?=
 =?utf-8?B?U0t4dHF2dGZlSUs4WXZPYWNReWplVXZKM1R3STF6bGFFVG5QMlRJMDZRU201?=
 =?utf-8?B?Y1REZVdBNXVpQ2dNVG81Tnp0eEJra2V6TzB6eFViVWcvdmtyUzNwVDN6bU5k?=
 =?utf-8?B?WDdCbjB5RkZ0K3JRR2FzR3RzOTVVbkk4bEN6Ly9kbkxsYzljakRnaFlubC9V?=
 =?utf-8?B?YVVXWTYxS0lEb1Ric2o3cUFwWEdqbEc4c1VWZFJFamZPYjllSm5DWXlqbzBG?=
 =?utf-8?B?Zk1aS2IvM1NMZVNKS0NEaFQ4SHNmLzlGMEFlbDdIWURvQ01SVmR2Qmt6TFNW?=
 =?utf-8?B?aFg2RHFuNXkyeHhUTzFrQ3h1S0cwQVpDc2NNSTYzU2dpQ2VoWlhOMUlkTVF1?=
 =?utf-8?B?SnRubmlWS1VvZkJpdE1pcDdNNzNpbHdRbUZjUURCNFJlZUFEblVOT0dtTzhV?=
 =?utf-8?B?Ums2NjNoSFc4Vnh3NWdsUkhOZ3B2MTVEa0ZKeWJwWk5QcFBhaFZFWnhJK1NG?=
 =?utf-8?B?bzJidEl6cjBnYWhQVmpYeTdqQWtUdzJiOE9paHYzM0Nmdm9ESVNzT1JFOTFn?=
 =?utf-8?B?VitwWXNFZndmNGJSSi9JSHpGRjNYZkMvb0RoMUpvT0RVQklKNlB3enVzTVZZ?=
 =?utf-8?B?d0w5VUJPdnNBNm5ISnFoTytJSnViK2grZ0tjWW9rSWdaV1lVbGswTWJlY3ZT?=
 =?utf-8?B?eEFBMTN1empnMS9ZeHJvU3hjb3JEYnNEK2ZFM2pza1E1MUw0NFZUWG5JUnJF?=
 =?utf-8?B?REc5czNoKzl2aXlVcFJrc0J2UG11S1FzQUxMNXV1Y3dVa0tNVXZaVnlKdEZs?=
 =?utf-8?B?dWEyZjZkdmlQL05sUDlVbm8wZXk1R2c2cnpqMWVLSjYwckUyb3FzVXorNGo5?=
 =?utf-8?B?RzJhcFB5SHhvUW5Tb2VMa1JqVFM5cFFDVkpIMHA3QXBMV0NLVWVtV0dtNVZj?=
 =?utf-8?B?U3dML2M5SkRVKzZnakZTcHNtS1Q5WEx2ZFc2dEhPR0dOSUF4RWFJK3lPRDRs?=
 =?utf-8?B?OXVRZHRHbDNQNXEyT1FHK1E0S1k2RkEyT0ZnMzBQMVdKNEd6RUtIZXJUUzZC?=
 =?utf-8?B?cjYvWkh5WXFmSVplQ2F3Y0xsZWJwR21tZHROZWNOOWltMG5rWU44Z2lBODU2?=
 =?utf-8?B?K01mNHJyeUp1a21qTGRzTTc2YmtkWTRhZ29aWkl0QjFzQ3JpZ0hGQzl3T0JQ?=
 =?utf-8?B?blVGV2ZHRm91cjZNRGF4UDZ2MG8vd2ZUdUNTaTBBZ0Q0NVpxQzZGWTQ2bmNL?=
 =?utf-8?B?R1dad0VIKytDQUUzUm0xYVhsbWRXcGlUZUhvbXFHVjV0b3pQcU1TRElqYlQv?=
 =?utf-8?B?cjFwaVI4MEw1OGlvK0Z5NjdHNlBaRWlwMmd3ZGdQTk9nQkRHS0NnZmg4QjhV?=
 =?utf-8?B?ZGREMXZvVmhCM3RPVmRXRUNIOG8veTFmMWhxTjBzYnNaczJ4eDk3WDExRzJs?=
 =?utf-8?B?VHNGdVE5SUFCaHJyYnJ0Q0VGQzhzTVhOTkdaQ0dDTWNYT1g4OWVjU2luMGc5?=
 =?utf-8?B?d2dTRXFIbitXWVZXcTRKUWlUektVenlhYVIybXF2VWZ4anhTd2RyWUdtamlE?=
 =?utf-8?B?Vi9wTFBrdWRRUjBMbkxIZDJVRkJRQVllMzZzdnlmeTFkZG1KL1AxNGJBMjBS?=
 =?utf-8?B?VDlhNnorZUdHVElmUDBVeWRycnEwQnJzRW5LamZyTnlLbWtaMENMaWhOLysr?=
 =?utf-8?B?eEhuOFNrYlcrbXNEcmdQOW5vWm4xRHY5QVlUS1JodloxSVdnK2p0bEVKT2R6?=
 =?utf-8?B?cVA1c1ZLUmNyUUliemNHWGM0L2FtakRXd2J3R1hmOHk5VFRQREtBOGxSTVhD?=
 =?utf-8?B?eEEzT1M2b1hIdjZXcE9uRGNuZS9ncnVtQnZRSEZjRVpUOEUzMXdRTnZWZklI?=
 =?utf-8?B?VmIreSs4N2d6Yk5nd1dYZ0NvSmJRZDBjcHJrUUpqOVZnQTF1YVZ1eTdZU0Zi?=
 =?utf-8?B?RzVWQ2dqYlh4cUZETlg4VGpXQ2haeUhKb1UvOHBaZFdqV2Q2K0Rya1ZJWGN6?=
 =?utf-8?B?RDI4czZQZUNWQXhQS24xamxld1VvWGR5elYxZGMrZDJ3dDZtU2xPSjh2STA5?=
 =?utf-8?B?ZkFUeEZwOUNQWjA3NjAwNjlPVkJjbE1JVWdmWjZIa0dhSFprOGEwTUtSTGVD?=
 =?utf-8?Q?AL+Qw76F+WO1Kjm4=3D?=
Content-ID: <DA552BE85A4675479475606FA5F062F7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa33e01-ea2c-4916-0c51-08da1d22abaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 07:53:17.1566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfU/vEUoGdsoxNYErOo7FKFQwsulvpuh4FQLXvxXMGrdzxL8/VOyBLNO3fN1BDtWvrnfG506JQ8MIESpUyPViopkV+TsDkMI9KjoNvkKXKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3771
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: security bump to version
 4.4.3
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/12/22 10:59 PM, Yann E. MORIN wrote:
> Fabrice, All,
> 
> +Peter: candidate for backporting
> 
> On 2022-04-12 20:16 +0200, Fabrice Fontaine spake thusly:
>> - Security vulnerabilies will be fixed by bumping internal bind from
>>    9.11.14 to 9.11.36
>> - Drop patch (already in version)
>> - This bump will also fix the following build failure on platforms
>>    without stdatomic lock free thanks to
>>    https://gitlab.isc.org/isc-projects/bind9/-/commit/261c84d91d1b4581df9f7f0ec031908299de7726
>>
>>    stats.c: In function 'setcounter':
>>    stats.c:300:29: error: 'val' undeclared (first use in this function); did you mean 'value'?
>>      300 |  stats->counters[counter] = val;
>>          |                             ^~~
>>          |                             value
>> - Update hash of license file (ISC address updated and preamble removed:
>>    https://gitlab.isc.org/isc-projects/dhcp/-/commit/429a56d73c0f9f2edf400fd6313850a3ce4fd809
>>    https://gitlab.isc.org/isc-projects/dhcp/-/commit/ee868403d0df934442a438aa6b5832bacabb7b23)
>>
>> https://gitlab.isc.org/isc-projects/dhcp/-/blob/v4_4_3/RELNOTES
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/e4d027b5bcda852d0b5a54035de5ed37499a4ef0
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I tested this on top of 2022.02.1 with sam9x60ek defconfig, and it 
restores the successful build for the package, but only in conjunction with

https://patchwork.ozlabs.org/project/buildroot/patch/DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM/

Thus,

Tested-by: Eugen Hristev <eugen.hristev@microchip.com>

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   ...e-ISC-DHCP-does-not-build-with-gcc10.patch | 121 ------------------
>>   package/dhcp/dhcp.hash                        |   6 +-
>>   package/dhcp/dhcp.mk                          |   2 +-
>>   3 files changed, 4 insertions(+), 125 deletions(-)
>>   delete mode 100644 package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch
>>
>> diff --git a/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch b/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch
>> deleted file mode 100644
>> index ad244267fe..0000000000
>> --- a/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch
>> +++ /dev/null
>> @@ -1,121 +0,0 @@
>> -From 129b7e402bd6e7278854e5a8935fce460552b5f4 Mon Sep 17 00:00:00 2001
>> -From: Thomas Markwalder <tmark@isc.org>
>> -Date: Thu, 30 Jul 2020 10:01:36 -0400
>> -Subject: [PATCH] [#117] Fixed gcc 10 compilation issues
>> -
>> -client/dhclient.c
>> -relay/dhcrelay.c
>> -    extern'ed local_port,remote_port
>> -
>> -common/discover.c
>> -    init local_port,remote_port to 0
>> -
>> -server/mdb.c
>> -    extern'ed dhcp_type_host
>> -
>> -server/mdb6.c
>> -    create_prefix6() - eliminated memcpy string overflow error
>> -
>> -[Retrieved from:
>> -https://gitlab.isc.org/isc-projects/dhcp/-/merge_requests/60/diffs?commit_id=129b7e402bd6e7278854e5a8935fce460552b5f4]
>> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ----
>> - RELNOTES          | 5 +++++
>> - client/dhclient.c | 5 +++--
>> - common/discover.c | 4 ++--
>> - relay/dhcrelay.c  | 4 ++--
>> - server/mdb.c      | 2 +-
>> - server/mdb6.c     | 2 +-
>> - 6 files changed, 14 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/RELNOTES b/RELNOTES
>> -index 9d0a0414..6919dba7 100644
>> ---- a/RELNOTES
>> -+++ b/RELNOTES
>> -@@ -103,6 +103,11 @@ ISC DHCP is open source software maintained by Internet Systems
>> - Consortium.  This product includes cryptographic software written
>> - by Eric Young (eay@cryptsoft.com).
>> -
>> -+            Changes since 4.4.2 (Bug Fixes)
>> -+
>> -+- Minor corrections to allow compilation under gcc 10.
>> -+  [Gitlab #117]
>> -+
>> -             Changes since 4.4.2b1 (Bug Fixes)
>> -
>> - - Added a clarification on DHCPINFORMs and server authority to
>> -diff --git a/client/dhclient.c b/client/dhclient.c
>> -index 189e5270..7a7837cb 100644
>> ---- a/client/dhclient.c
>> -+++ b/client/dhclient.c
>> -@@ -83,8 +83,9 @@ static const char message [] = "Internet Systems Consortium DHCP Client";
>> - static const char url [] = "For info, please visit https://www.isc.org/software/dhcp/";
>> - #endif /* UNIT_TEST */
>> -
>> --u_int16_t local_port = 0;
>> --u_int16_t remote_port = 0;
>> -+extern u_int16_t local_port;
>> -+extern u_int16_t remote_port;
>> -+
>> - #if defined(DHCPv6) && defined(DHCP4o6)
>> - int dhcp4o6_state = -1; /* -1 = stopped, 0 = polling, 1 = started */
>> - #endif
>> -diff --git a/common/discover.c b/common/discover.c
>> -index ca4f4d55..22f09767 100644
>> ---- a/common/discover.c
>> -+++ b/common/discover.c
>> -@@ -45,8 +45,8 @@ struct interface_info *fallback_interface = 0;
>> -
>> - int interfaces_invalidated;
>> - int quiet_interface_discovery;
>> --u_int16_t local_port;
>> --u_int16_t remote_port;
>> -+u_int16_t local_port = 0;
>> -+u_int16_t remote_port = 0;
>> - u_int16_t relay_port = 0;
>> - int dhcpv4_over_dhcpv6 = 0;
>> - int (*dhcp_interface_setup_hook) (struct interface_info *, struct iaddr *);
>> -diff --git a/relay/dhcrelay.c b/relay/dhcrelay.c
>> -index 883d5058..7211e3bb 100644
>> ---- a/relay/dhcrelay.c
>> -+++ b/relay/dhcrelay.c
>> -@@ -95,8 +95,8 @@ enum { forward_and_append, /* Forward and append our own relay option. */
>> -        forward_untouched,   /* Forward without changes. */
>> -        discard } agent_relay_mode = forward_and_replace;
>> -
>> --u_int16_t local_port;
>> --u_int16_t remote_port;
>> -+extern u_int16_t local_port;
>> -+extern u_int16_t remote_port;
>> -
>> - /* Relay agent server list. */
>> - struct server_list {
>> -diff --git a/server/mdb.c b/server/mdb.c
>> -index ff8a707f..8266d764 100644
>> ---- a/server/mdb.c
>> -+++ b/server/mdb.c
>> -@@ -67,7 +67,7 @@ static host_id_info_t *host_id_info = NULL;
>> -
>> - int numclasseswritten;
>> -
>> --omapi_object_type_t *dhcp_type_host;
>> -+extern omapi_object_type_t *dhcp_type_host;
>> -
>> - isc_result_t enter_class(cd, dynamicp, commit)
>> -     struct class *cd;
>> -diff --git a/server/mdb6.c b/server/mdb6.c
>> -index da7baf6e..ebe01e56 100644
>> ---- a/server/mdb6.c
>> -+++ b/server/mdb6.c
>> -@@ -1945,7 +1945,7 @@ create_prefix6(struct ipv6_pool *pool, struct iasubopt **pref,
>> -             }
>> -             new_ds.data = new_ds.buffer->data;
>> -             memcpy(new_ds.buffer->data, ds.data, ds.len);
>> --            memcpy(new_ds.buffer->data + ds.len, &tmp, sizeof(tmp));
>> -+            memcpy(&new_ds.buffer->data[0] + ds.len, &tmp, sizeof(tmp));
>> -             data_string_forget(&ds, MDL);
>> -             data_string_copy(&ds, &new_ds, MDL);
>> -             data_string_forget(&new_ds, MDL);
>> ---
>> -GitLab
>> -
>> diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
>> index ec7c4fe58d..be03423db8 100644
>> --- a/package/dhcp/dhcp.hash
>> +++ b/package/dhcp/dhcp.hash
>> @@ -1,4 +1,4 @@
>> -# Verified from https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz.sha256.asc
>> -sha256  b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a  dhcp-4.4.2-P1.tar.gz
>> +# Verified from https://ftp.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz.sha256.asc
>> +sha256  0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818  dhcp-4.4.3.tar.gz
>>   # Locally calculated
>> -sha256  9961fce0d83a6229b9084cdadedfa723a53274c63af610c9adb61b607e0f5a76  LICENSE
>> +sha256  45a39c430be0920cb9570f34b32d2378fe6048c034f2f3265b9326d64ada73df  LICENSE
>> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
>> index 460e62a81c..e2690300c1 100644
>> --- a/package/dhcp/dhcp.mk
>> +++ b/package/dhcp/dhcp.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -DHCP_VERSION = 4.4.2-P1
>> +DHCP_VERSION = 4.4.3
>>   DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>>   DHCP_INSTALL_STAGING = YES
>>   DHCP_LICENSE = MPL-2.0
>> --
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
