Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AD9C001DC
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 16:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B2541766;
	Mon, 31 Jul 2023 16:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B2541766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFI-Xjr_wvOI; Mon, 31 Jul 2023 16:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21EC1409DF;
	Mon, 31 Jul 2023 16:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21EC1409DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 119B21BF3BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F142A60E7A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F142A60E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W-F5u1qdVjd for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 16:01:51 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::612])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23562610D5
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23562610D5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCw36cg805QImea85tH4VTU9ZqhB1gGFL6kAiYU5sqSMntybdIZQIQXs56ACbagurd0UyTeBfKF1h36/m/BBfzhprBkWcQydxhqoaRWzIuET33l8Os0h3ofPr1YzhhsAGV2cXL5IQE9P3tL8GicxCftVvDm/kbAwvesdckN6k/O6dUVCjNb2zHbLTfqzUMezWrSw6jXwqtRVoW9AnenrlPgp6WUregQ+fLU6wdb0MdztgDj7/Egs4IgakLYvXVKc9doM76tAcoK6B8s5JTIcAK54LUSIygNeehCGpj8PaLyh9vALRf6jC2L58q+Pfla1eUHL7MUTzPtK7bWE99X9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa7UbE5GPfLsID/M9qYXJQGHW5ubJ0gjaIuq2mjfb90=;
 b=aEdj+fntT7knOb3Jgzbe01bxgkgp3ttDh3W3jUkPW6vssWnCq/yisqCooMa9BSI0RVO3Yj0D9TuxcWU+w9lEOzue+X7SqF/Yw8eYnOnKKnf+Ji9vNM/a0G2bAqbc6XL2UPCnm8mZAK+SboAEtHK40DuWU+a2p9RQ4zJ7DG0MrPyJ0kk6byu5Uvt9/IQ89kHPaOySUeT27KjYurTx+w+oT6GsRg3omu453Gs6YibpY6aPdLpijFpOAWQSQzbaYufIGD9vedtDLHJZhMpIuPHFeciT85wNd9S3E0j4Zf9Z5V6JhGH7ZefFQaNCVN6DVDZIFsBfxczxyZugVOKttY6ezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:01:45 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401%7]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 16:01:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
Thread-Index: AQHZw3XSD/nC8eKrlUCtMfQ/zbF586/TzBKAgAA8+UA=
Date: Mon, 31 Jul 2023 16:01:45 +0000
Message-ID: <CH2PR12MB5004F616135C586B599F520DF005A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230731061113.193556-1-neal.frager@amd.com>
 <20230731142113.3945104c@windsurf>
In-Reply-To: <20230731142113.3945104c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6265:EE_
x-ms-office365-filtering-correlation-id: e6fd8178-29ff-4f11-8950-08db91df7073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dV5TTSRh26SuvrQAAPO0kv0pX3MofSQIgaTcXmrle9PUppMHDkT9LbkDSZGqyejQzDWMH/qpmyw0Vrv+MyPk+/nqRgwIeMNpFTMUMw1V0orXvr3zuEKueoo62XPk6tQXGaND+rvTuOlNya0H58o0RkVdSXDnsVBBcpd6St7AzqxKPJhoBX1qvfyjQipMR2zbD6VLvf4KYa0gvapKxKHlMcKkGg8TRnFpkTA9pUWyNWVHT2BWAwJ0iS1J0NnViurk1avTfRIHJdpjiRZW9+SdjcDyNIlrEB3g8c99JIJpRTqqFkA5cTTtlvoBALz99WEkJi+ZESwybBYdGOFzJqhfbhtq+2xXIJ+fKWl6ooYW9czhQM8xUSw0QivyqQNqJgDUAq/a7GK7egeW+fZj8xGO2jbCEAawGgWOJ/KQnx05TS8yYXJSdSQq9+GLOvSreSv+Cy8H/Gn3D+//LiRwn0hhrqN34lFWFTWnebcpM2djg4qZTNsvgjkpSWiHovdmOWtix+TsJ6euzeM5lkcqzRmC+ArIw911eQ0glulQv03tRWR52urKpooJuKgVoUkQ9n9mmT7V74Y8kZkJebHHDN8uEDskI6kA/9s6ZOcGPwbIQ7k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(38100700002)(122000001)(55016003)(86362001)(38070700005)(33656002)(966005)(9686003)(71200400001)(478600001)(7696005)(186003)(26005)(8936002)(6506007)(8676002)(52536014)(5660300002)(66556008)(76116006)(66946007)(66476007)(54906003)(110136005)(64756008)(2906002)(66446008)(4326008)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1OjIYX20kzEpq/zIRwFziqLdyGa3bCYvW9fCljCmJ0ZBfeK+lnIU5SVr/tZI?=
 =?us-ascii?Q?PFrvn3jKuRMHOkW5ku5mTF1MnpE9TngQE29QKgL64uhjesuwE4jritF/7MB4?=
 =?us-ascii?Q?xeARBbbofYiKqD0/6zraGJ8kCSQFYOlt9DRqrEaWDMtifdjrX16WVXtAp6sB?=
 =?us-ascii?Q?DhXlgDiizzy5hWcX1NCuhwS4CoJQJwpmZmjvJ8qxKyckbwN9HVn+HX63DUmp?=
 =?us-ascii?Q?L21QSQaVLfBvtRVHFhxnxdGh8t4ROOEr946jEfDpFar80pGGtNpAtbgT/kCc?=
 =?us-ascii?Q?wBu7wnuaKZlvkuRG6LkXp3beGFkw4epLxzTEoEq0HL3ycpsS+0oKyJ1x2zKo?=
 =?us-ascii?Q?bpdxdJMlK2wtoF4ShUnInJpWiRoe2S5YUk4cYh8gP9D6Tr1hv7q1PazKx8RI?=
 =?us-ascii?Q?F29J1+pEScLvSSXtDeyr0RLAFetKj3danR6ASgl25zx/CpSETU/qVWKDrfXu?=
 =?us-ascii?Q?hqga8I/iS00Z3GjuVjGahnOH41eLDTxXSINi1K0N6AiwEGLh1LfCeieKtO40?=
 =?us-ascii?Q?gTho44/mWRRO/KFPeokPKV7G1RSrZt6O6ql+jPSNDnaWMme5/BRAH8VmIBy0?=
 =?us-ascii?Q?UG3fzJi1JUYwwcTSgBNIjV5HuX5FGSlgGDu7gywA62w2kSnEfjPT++HEPGj0?=
 =?us-ascii?Q?qZ3L/3tVYcPmHxfj1i8p6up+y4fUZoLHmLcN0z1ON5teXyhEMT23BpNsyMAW?=
 =?us-ascii?Q?Ejno8CR333JtYyPJoSHYUHmT9L8Ry4wGinDOsNi9oTH3H6quPMw1p0jUi23h?=
 =?us-ascii?Q?Mql4PWIDHqQ5cjsotQvf2PZZ+9fS3+VT97Ta1zckcVg2JMAOkXQf2RWHkptP?=
 =?us-ascii?Q?8SEBY0iczREFzyzVah6YSRgv/lCiL8UEy3azawGa+NNROv38F3tocFa+7EB0?=
 =?us-ascii?Q?6A6xRwX+YDb+fjKkQnnklIiGx0Iaw5W092FwQm8VhX1i9Bhi+HKWLFL+ZHUa?=
 =?us-ascii?Q?4xMMkPe/9l+ASDKf70e8byE5cm7ILvPJVQuz5c0OZM308z5Q7zzrOOP+oEWh?=
 =?us-ascii?Q?NR/x+gkfSg+Jac8u3x5YbPi/34La2svWvSu7ckP7nbRmHINww/cnkDmUY8UU?=
 =?us-ascii?Q?Rvye1VJY0kA1QQYk/EY7SdgBoacGs0LGshFYd2DtkmR5HLVooV7Dghyqh3Qu?=
 =?us-ascii?Q?b9BmtP6Km4z3e1aOWQjZIbrw6ddG2zBs3Q4/S/UsnK0QFIeYUs6db2wRKLTk?=
 =?us-ascii?Q?bNFFeauUtIN5NFBGESYAxPWj340aUR8/cb5Mi/na7jQ+XdB1VJv12t/e7HQS?=
 =?us-ascii?Q?t4fQIT535cmZxw8gYgWr1sJLPl5qsB05snp0O0JO46sOgEtJ2oCiVP1pJJZe?=
 =?us-ascii?Q?nSOJeMldwKbF1HfrSvzmZkZsDoglFFMOiC9crSSYWY7vuRXP4Ws9Hjl6V2Rp?=
 =?us-ascii?Q?ZRz9fjz8PnDgHLq7+HXIQgyG4F86RQ9RKNacV/XWE4CUv3m2qQqT7YvV8XDm?=
 =?us-ascii?Q?jAqYIpg2pEcgYoZM61zYoa3YSz37TWLjnzhKlURxVvKgsaGANqQkLHMefTIo?=
 =?us-ascii?Q?dKc1IQKyFMttnt9vFx8irvWSV3NOAiClrgDz0FXNjJAhDirMhnrUoG/L+sV5?=
 =?us-ascii?Q?yO1K7h5U18kKSVfsA7E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fd8178-29ff-4f11-8950-08db91df7073
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 16:01:45.3367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMFjHAAkvF4rAMrAQphH+M3caFHV3WnrcUQz0pZRlxj4yFe70y27ImXAOmAvTWuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa7UbE5GPfLsID/M9qYXJQGHW5ubJ0gjaIuq2mjfb90=;
 b=Yp5hrYpJD+CfUqHrfAtTY/+9Hg6Rq0GuyWzUE0Bby0azGP8LKM+TFX4YJGlpHkH298ZeoppZyVk0ESWvoW7zDmLOEcIpueO478wANNyBZwW8wetW3c7dLdrqwUeWYt2YhsHhV7FFhx/c044PGFDCZ4TlX4Gxg9EumYiv5HBs51s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Yp5hrYpJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX 
> permissions
> 
> There is a ticket filed upstream[2], so until that is resolved just 
> disable the warning
> 
> [1] 
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb9991
> 2da01a6e8434126b8fac7aa75107 [2] 
> https://developer.trustedfirmware.org/T996
> 
> Fixes: https://developer.trustedfirmware.org/T996
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Thanks for this patch. However, could you use upstream's fix instead, which is https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c.
> We have already integrated it in Buildroot for upstream TF-A versions
> 2.2 to 2.8 in commit
> https://gitlab.com/buildroot.org/buildroot/-/commit/7b774048be6292bb61f90759ad3b7b58a33a1650,
> but your defconfigs are using custom versions of TF-A, so our patch is not applied.

Thank you for pointing this out.  Are you ok with my just creating a link to the arm-trusted-firmware patch for v2.6 already included in buildroot?

> Of course, same suggestion for "[PATCH v1 1/1] board/versal: fix atf build failure".

Understood.

> Thanks!

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
