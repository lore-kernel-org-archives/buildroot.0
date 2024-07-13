Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56975C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 23:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9674340096;
	Sat, 13 Jul 2024 23:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLm2wo-gvAqY; Sat, 13 Jul 2024 23:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F40403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F40403C4;
	Sat, 13 Jul 2024 23:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4D7D1BF309
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 23:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2D760780
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 23:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWqa72IPWexy for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 23:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::608;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5BA46075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BA46075D
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5BA46075D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 23:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMItGWwvs6q2S89Rb1e+0L393E8i4bXO2z4PA53U6wL5n7nhaYlnweiOao2xNqaB/zqcU0Xm+boep4IdVB4OBF7Dt+wdG3V3m0ArmFl/pYNIYzS4FFccKVWONpMMXpRQxiy3508aUB+/vUQVe8N2le91jg2cUWAvBF2nf0SH2vpDBH2fj3iWnPqhomgY7+gOd9azEpCuEQ/GX1LrJC5Gx5QbpjrnmnNPX1WyYG5gCsEsVo84AoJ1S3nF0F93+mfa5zSnBnWygHxNmwmGJcyfQHWJBbUyib4FkqqA7WrqFh8Lz7n+qy0fI8JjzYePQ3bgwiwY8nsOs735UVN9xGEzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS1xjlnLKT5HYRyt4ReknZ7y7AdEFViFM/3uwILXfRI=;
 b=xhPmPhIhiz474g6q42V3capwMH2nfJ7hHm+lYh1wKRUxFUvE2x5CTIk33sfM7/G4aPB7bVYdc+H+7tMnc6v3dEIiipSqTUqc7++EE4JAWQ9GcJjHdZ83MQIPHz+gVyZcE+t5mq04uwRZzg78u67P+x1VuX/KS+MvaG8rKkk2Pt3SlrHEU+KZgchCz3qlovWlKG/VoCAM4lQjuKoYMGqxvrNkPHEPOvxOy4wZ+f6nqa8SRnPKn7lKkSX3jyI7XGQ89Zopcia71AKp7NUW20yZW8jZl3xmxdRaN8SjsoMVnH8lxg9JG4cn1eQeVRwdhhV74MceFL+GFO1C73ZMlY019g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Sat, 13 Jul
 2024 23:58:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7762.025; Sat, 13 Jul 2024
 23:58:24 +0000
To: Romain Naour <romain.naour@smile.fr>, Brandon Maier
 <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
Thread-Index: AQHay9aaLdiTpd3hLkS2J+1Iy7ra97H05gCAgAADuACAAAb1AIAANScAgAADo4CAAD10dA==
Date: Sat, 13 Jul 2024 23:58:24 +0000
Message-ID: <CH2PR12MB5004D963A3D1AEF6053304E1F0A72@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
 <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
 <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
 <D2OOCH8PNMRR.2A90SMBTA8GG@collins.com>
 <ffa0f733-474e-485d-8da4-6d729139809a@smile.fr>
In-Reply-To: <ffa0f733-474e-485d-8da4-6d729139809a@smile.fr>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH2PR12MB4247:EE_
x-ms-office365-filtering-correlation-id: 6a9ce5df-be83-482c-730f-08dca397ae95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ivs10kCjhwexojGzrg8gkWUVFg2iCTsyHxBmCAd6rE8SOIl2AhMyOiS9YF?=
 =?iso-8859-1?Q?nWDweIZl3NBu0fY81kVYWyXfFJs034sma4kmMyAdzasot39iJiiunvDivF?=
 =?iso-8859-1?Q?4gvGkEXoLwdkbpbJe0HslkZi42oQO5QrYbPl89HkgWjY52qsMhZRTED7+R?=
 =?iso-8859-1?Q?vRiEdPEEjMHhgrz4DWjhfJCA9ReKmXkcOmqY1VGSY4ZfPFZ4Fvq/8o3iuD?=
 =?iso-8859-1?Q?YOUE2cvLMT03+Dqcz54h3gG1t28glpXso7Q0kg0KFMHROwN7g326xXyAnj?=
 =?iso-8859-1?Q?4WQVYdt4B0pnV3RHn4ayGtaOArGdKrc6aYmrt1r0nEC4sP/0rsxUj7xXv6?=
 =?iso-8859-1?Q?7BNvcTRwzvoV4/9j+ptGGu66GuKKlXPWgHgCvjre+X/dV4XqHFz/rViNak?=
 =?iso-8859-1?Q?njJyoppN1yXj64JrH9NTgIZJTe3Onstwot3uRkE4KwnVdOIK+HklrYr8YM?=
 =?iso-8859-1?Q?SlP8a3k1YlyLWzAwFoOOWjYOPmuw+P0R/Q4g1IOQMqfOZ7RE1LKICgGFWn?=
 =?iso-8859-1?Q?BNfR4VbmV1BgaRa638uViwKRsmkEja+PQkv6coHVnscbDFnXvWNCZNy1B/?=
 =?iso-8859-1?Q?VkDm/MQiZqhAOp4c+lOZYA6c/iTF1QTjjh880AYDh+NTjj1pMaQ6nCRE5Z?=
 =?iso-8859-1?Q?n+s9B1mOWRVBiCDrGcdf/Nnf5Hz7IC6oyKut7eQEUtXYbhJ8mpEv5SNnTs?=
 =?iso-8859-1?Q?GH6Z3T6YQKege48ZuhA8E5I6TwDywbucRtZWzykEwKIJcRHR/oavL+GQBv?=
 =?iso-8859-1?Q?29qgZ0fjb43evHT4UJ3L8VawHwEWrBZ4CGUMpbsSm6CRmP1hGxMten9LLa?=
 =?iso-8859-1?Q?hAnzxCJQJdNPQsl3tiO5A9Es2AE32bTnBvk4XGEJeK6qGaxzZ/6x8o0juR?=
 =?iso-8859-1?Q?fw/kj4FEIuNTYwfIGUiDooKwxxwkBytTB7Vmh8trd+pFTFYIKFi3OqhVVO?=
 =?iso-8859-1?Q?7Fg1V3z0SCaUkVzQMDsRhCcOXbKIHW1myvWdDKFHo38AGNG/rFzsFO+xkA?=
 =?iso-8859-1?Q?BA+foArfY1Eg3EyrVH8D50bskOwTo1SYKuz9q2pLv81kn4J6CiAFDatzGc?=
 =?iso-8859-1?Q?OAEzB/OHVVv6jX0NnPK/d5z45eO3ITfgtDnLSuouSSgNXJlMkeh8FwUN32?=
 =?iso-8859-1?Q?yq0GxJCmPUxdg8kWx3EMA02MtJOEgwRqva6S65KDKNSF6RVL7BwD1R7nb7?=
 =?iso-8859-1?Q?zTAc3GOZlL7lR3XRWphsBrQ0qurA6jja5NzFbRcV13SI5QveX2k7JYc7C9?=
 =?iso-8859-1?Q?5pVEsbYYHjamlhmhMuNtLiez9s6eA0FkgUbLYznWd7FTzjqXLdsSV2Pd96?=
 =?iso-8859-1?Q?DRHMN3pPb8ELHnlNbjFJ20CZg9BNX4PbaGm5vbwAAWCCUBBmI7ZyRaAcjg?=
 =?iso-8859-1?Q?llz90SQEfYGK2RS5lFsJZkPqAJYbmNInualdGwyCRB/OgX7krPinODML18?=
 =?iso-8859-1?Q?3UsIPFjXVCehLoLU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oQTkYosaZO2+eDKf2GFMGmwSU15WHPTF8w0478hwhjNmKBxfIhlPz1Y649?=
 =?iso-8859-1?Q?GQKb3Uf68oV4QpEQCCwNb7ruF3XpRSOsyGIA8zOEu7TpH02px+Er8pBRFD?=
 =?iso-8859-1?Q?bN80793NCSaEQeH8CyLYl7Zo18gniTgYwiy/eHvC6zQBp9HCW89VCH1JIP?=
 =?iso-8859-1?Q?RUovcgrJV5jZKQX1D/MsaUa4oZcqeh1ojoLHUFdprYnzg/LI91vCprdw0N?=
 =?iso-8859-1?Q?zlGZWP2YAVSuDUyqbixsbkn9wqCVqz0V+TfMjQ1CI7rzR8fh3kU5rUzJ97?=
 =?iso-8859-1?Q?ZENvARmfFyb9VE44qCqGdYsGwFkC8V66qIb/1bkIYwalxLIuTCkcDl9u96?=
 =?iso-8859-1?Q?gKFsXzlQM4kWrL71ETjLc1uwBlnQ9zTBR9mp+nAyExb+b7s57ZxYUuERY6?=
 =?iso-8859-1?Q?ErKoCpCZbwPUBvxpR6EsPp96f/shf4xzq2n3YMN5+kVlIu4Erf5rsbutbc?=
 =?iso-8859-1?Q?ycKi6OWf8G5RJtwrfCvkFWynSs1x3HaMkhGSVpe4Dz8pkQtKInHbjudZfb?=
 =?iso-8859-1?Q?cjWmOFas9011bj1hkzybRrvBONDLbNHFvPuJaEbYB4J7VAfAnXo15Vsqpz?=
 =?iso-8859-1?Q?WMsy814GCHFTPBZxdb8+sa5t/4XRtAbtJrLO2fZFSn0d96IWnFFEcJrmvV?=
 =?iso-8859-1?Q?V1g48AK8ufvjhCb8iYRYSEM340XC5EKGQwt4NczVyNoPYS5p40S/igt67m?=
 =?iso-8859-1?Q?ZeWRuhTjyXjozUp3Xll6Q0uvIXCEmcsSJPnOGUb3dmMV7ILsj1hjdmZQ32?=
 =?iso-8859-1?Q?aIP+WN6dmD18WETtGM23I0mKxJFMz8tzDIaud/7dm6ba7K9Ev2HanG4cYi?=
 =?iso-8859-1?Q?haBqixdrAeMh9g0awhc+rj8WYdeDDH+rbQ+Sc2cbXJBsbR4TzxBFXXESFZ?=
 =?iso-8859-1?Q?QY9bCtX09rQS95OBA/8to3IF5qgq7DZYLRWk4VGItf8p0RDmqU6nNGYRqb?=
 =?iso-8859-1?Q?07co+DAXeNbeCPCJEbf1U6eVIVbSVxIc2BcqcGegz8kszleEp45kNCVuZQ?=
 =?iso-8859-1?Q?VoQvpU7q2NfjRsZI6ICX81jXebwd7G0lCLwvyG5CzHHvilts7WqyXE7xAt?=
 =?iso-8859-1?Q?glLVha0SFwNeRpKnZBWnQPA5igiRQgsiQRpEXvzyVs+6OExwewy2jlXYnu?=
 =?iso-8859-1?Q?1s/jvJtufnJ8lz/tZYvbEcKHvfRlyb85+o94my9BsGGN8wqnB4FbyaCSUQ?=
 =?iso-8859-1?Q?mjnyUxDMQqEO/r0dj2GRErCMxcqdY1m1CP8dtJWnWViHmpA4PxJbVtHZGx?=
 =?iso-8859-1?Q?6smsAcvlG6yaA3rZRxn1nkuPYnJZkObxWQCHWlyrwwXky/90cTvGyf7UqG?=
 =?iso-8859-1?Q?aPEg4uUtUGDpuf/4290+3/6lbqMvBl4DrkIzrCUboBJZYLsV7qwyAYJmd1?=
 =?iso-8859-1?Q?9bKmf10N0gAOhf2ctJigobN2YBqr8o4PjLNv72WLOroSgxvAHkbWsY0lwZ?=
 =?iso-8859-1?Q?6vsupQcZXxVFiVwQjmO/G2tQe7nDsqTEHQujaWYfpAZo4yUCnc2bv02ONM?=
 =?iso-8859-1?Q?LOpReDYxK+fQFtVQ2CSpMBnSCM4Nyo2eDkj/uBgIV+39PBhcMT8WPdeJIE?=
 =?iso-8859-1?Q?A4y/TA4ATDMLhHWmK+SLrfbgplE+iklYLGxzzP0QUrADaf8ho+ylro+k/L?=
 =?iso-8859-1?Q?Kd5hBoa3optmGLtl/uwAuhoKsBeB0TkFmalUc8ZKiauQInNlv05cDEb8po?=
 =?iso-8859-1?Q?TF4Jbk4/ClRGWhK+C9FVs3d866bOjo7EMvHY0q07?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9ce5df-be83-482c-730f-08dca397ae95
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2024 23:58:24.3788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hR5Gw0Soeld/nZLIrXMN8uEyamUu6r+x+JRdi2YS1MsGQ/8jOs4fqWKwHaENns8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS1xjlnLKT5HYRyt4ReknZ7y7AdEFViFM/3uwILXfRI=;
 b=nJM5aXCDoZVPHEUsCQI9UravZehD+8sVwD61J1h4JzUcjDHpF3eYlpaEP9ff077TxFEDZSq2sBf2osO0qxH/A5Vm6a3T1GHyyqrCRzvBj6GbdtmuvK+LeYUffuGGl7IQ6LKcUdr67Qd/sOTlQFGZ1y924N9CKnkK7bj5oONTf1g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nJM5aXCD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2188406338396515603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2188406338396515603==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB5004D963A3D1AEF6053304E1F0A72CH2PR12MB5004namp_"

--_000_CH2PR12MB5004D963A3D1AEF6053304E1F0A72CH2PR12MB5004namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Romain, Brandon,

>> Hello Brandon,
>>
>> Le 13/07/2024 =E0 18:21, Brandon Maier a =E9crit :
>>> On Sat Jul 13, 2024 at 4:08 PM UTC, Romain Naour via buildroot wrote:
>>>> Hello Brandon, All,
[...]
>>>>> @@ -20,12 +31,22 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
>>>>>  # We need the *.pdi glob, because the file has different names for t=
he
>>>>>  # different boards, but there is only one, and it has to be named
>>>>>  # vpl_gen_fixed.pdi when installed.
>>>>> +ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
>>>>> +XILINX_PREBUILT_PLM =3D $(@D)/pdi_files/gen_files/plm.elf
>>>>> +XILINX_PREBUILT_PSMFW =3D $(@D)/pdi_files/static_files/psm_fw.elf
>>>>
>>>> is '_' character intended in "psm_fw.elf" file name instead of "psmfw.=
elf" as
>>>> for Xilinx dev boards?
>>>
>>> I had not noticed that. I double-checked and the file does have '_'
>>> inside the XSA, but does not in the Xilinx prebuilt repo. It is strange=
,
>>> but this does work as intended.
>>
>> Ok, that is strange indeed.
>>
>> Maybe a comment about that in the .mk would be useful?
>
> No problem, I sent a v4 to reword the comment block above to call out
> the psm_fw.elf

>Thanks, I finally added a comment before merging the V3.


> https://gitlab.com/buildroot.org/buildroot/-/commit/1dcb311afe1043bf36909=
9eec8b6fa6a06adc0fb

> Best regards,
> Romain

I have been following your discussion.

I agree that it is not clean that our Vivado
team is adding an '_' in the psmfw.elf file
name.  This is strange because there is
no '_' in the name when building with our
embeddedsw github or with Vitis.

For this reason, I am going to issue an
internal change request to get rid of this
'_' character in future Vivado releases.

That said, could we change this patch to
use a '*' instead of the '_'?  This way it
will work with current versions of Vivado that
add the '_' character to the file name and
future versions that will remove this character.

Could one of you create a patch for this?

>
> Thanks,
> Brandon
>
>>
>> Best regards,
>> Romain

Best regards,
Neal Frager
AMD

--_000_CH2PR12MB5004D963A3D1AEF6053304E1F0A72CH2PR12MB5004namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"ltr">
<div dir=3D"ltr"><span style=3D"font-size: 11pt;">Hello Romain, Brandon,</s=
pan><br>
</div>
<div id=3D"" class=3D""><font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">&gt;&gt; Hello Brandon,<br>
&gt;&gt;<br>
&gt;&gt; Le 13/07/2024 =E0 18:21, Brandon Maier a =E9crit&nbsp;:<br>
&gt;&gt;&gt; On Sat Jul 13, 2024 at 4:08 PM UTC, Romain Naour via buildroot=
 wrote:<br>
&gt;&gt;&gt;&gt; Hello Brandon, All,<br>
[...]<br>
&gt;&gt;&gt;&gt;&gt; @@ -20,12 +31,22 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT=
_VERSAL),y)<br>
&gt;&gt;&gt;&gt;&gt;&nbsp; # We need the *.pdi glob, because the file has d=
ifferent names for the<br>
&gt;&gt;&gt;&gt;&gt;&nbsp; # different boards, but there is only one, and i=
t has to be named<br>
&gt;&gt;&gt;&gt;&gt;&nbsp; # vpl_gen_fixed.pdi when installed.<br>
&gt;&gt;&gt;&gt;&gt; +ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)<br>
&gt;&gt;&gt;&gt;&gt; +XILINX_PREBUILT_PLM =3D $(@D)/pdi_files/gen_files/plm=
.elf<br>
&gt;&gt;&gt;&gt;&gt; +XILINX_PREBUILT_PSMFW =3D $(@D)/pdi_files/static_file=
s/psm_fw.elf<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; is '_' character intended in &quot;psm_fw.elf&quot; file n=
ame instead of &quot;psmfw.elf&quot; as<br>
&gt;&gt;&gt;&gt; for Xilinx dev boards?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I had not noticed that. I double-checked and the file does hav=
e '_'<br>
&gt;&gt;&gt; inside the XSA, but does not in the Xilinx prebuilt repo. It i=
s strange,<br>
&gt;&gt;&gt; but this does work as intended.<br>
&gt;&gt;<br>
&gt;&gt; Ok, that is strange indeed.<br>
&gt;&gt;<br>
&gt;&gt; Maybe a comment about that in the .mk would be useful?<br>
&gt; <br>
&gt; No problem, I sent a v4 to reword the comment block above to call out<=
br>
&gt; the psm_fw.elf<br>
<br>
</div>
<div class=3D"PlainText">
<div>
<div><span>&gt;Thanks, I finally added a comment before merging the V3.<br>
</span></div>
</div>
<div dir=3D"ltr"><br>
</div>
</div>
<div class=3D"PlainText"><br>
&gt;&nbsp;<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/1d=
cb311afe1043bf369099eec8b6fa6a06adc0fb">https://gitlab.com/buildroot.org/bu=
ildroot/-/commit/1dcb311afe1043bf369099eec8b6fa6a06adc0fb</a><br>
<br>
&gt;&nbsp;Best regards,<br>
&gt;&nbsp;Romain<br>
<br>
I have been following your discussion.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">I agree that it is not clean that our Vivado</div>
<div class=3D"PlainText">team is adding an '_' in the psmfw.elf file</div>
<div class=3D"PlainText">name. &nbsp;This is strange because there is</div>
<div class=3D"PlainText">no '_' in the name when building with our</div>
<div class=3D"PlainText">embeddedsw github or with Vitis.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">For this reason, I am going to issue an</div>
<div class=3D"PlainText">internal change request to get rid of this</div>
<div class=3D"PlainText">'_' character in future Vivado releases.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">That said, could we change this patch to</div>
<div class=3D"PlainText">use a '*' instead of the '_'? &nbsp;This way it</d=
iv>
<div class=3D"PlainText">will work with current versions of Vivado that</di=
v>
<div class=3D"PlainText">add the '_' character to the file name and</div>
<div class=3D"PlainText">future versions that will remove this character.</=
div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Could one of you create a patch for th=
is?</div>
<div class=3D"PlainText"><br>
&gt; <br>
&gt; Thanks,<br>
&gt; Brandon<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Romain<br>
<br>
</div>
<div class=3D"PlainText" dir=3D"ltr">Best regards,</div>
<div class=3D"PlainText" dir=3D"ltr">Neal Frager</div>
<div class=3D"PlainText" dir=3D"ltr">AMD</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH2PR12MB5004D963A3D1AEF6053304E1F0A72CH2PR12MB5004namp_--

--===============2188406338396515603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2188406338396515603==--
