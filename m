Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2904CC7EE25
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C9F81ED2;
	Mon, 12 Jun 2023 11:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C9F81ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oV9zd4EDXgIe; Mon, 12 Jun 2023 11:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A62E581EBC;
	Mon, 12 Jun 2023 11:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A62E581EBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2E8C1BF2FD
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7926C41731
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7926C41731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6HsYwQdz6F9 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 11:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED8A415CF
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ED8A415CF
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 11:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBTbaW28q5OcpipxMF3N2r1+tZgQkNkek2XoFJhTM/UyYpN7mQdmBuQSPRCKp01oILzvYJISkLjegyFHORghisNQav9Pfa7M5f0Gxe7m1DokBos8Kk/tfQ/8nr8P6FXFWtMuKfRA9sSNVLH2oEoiNLQc8A85hupc1ZVa9xpmZFS8DDy/JpfLokToP9Jvo8Ml8uKwYFq/axlGHgyCt48cTHTAAktIzlbFcJJqfhCSSi8xtxqoBq3gycUuEVRfCe11kFmfwKTVUMhUM7TFtJaLe02LIJRUhdhYm7OOm9TgyvSHF9oLBXqM76Li0lSV45AI4lKBufx+7R/J0uRMK2Kz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHDkv1N0FrlmPnqSZivyZA08MGc0X9CO4mC5hFPAKyo=;
 b=GDUL72eBPjgYj79n+/w/1Nnc68Z5EgMNIIw8o9esCgmxuvFWbJHsqcFQKuWEn6fmCz5loCNf81PI4pzwdgLNZt4nSHYsh5N1RQmWh/2tFpWdCTpe6Xg/EvPpttNltPZAWbf0oH5R4I9G8+7GZokF6J68xEwhulp/WQgIg5iWXolLD7sAV2y1yC7TkNF6+U5f1d7rWBWszpNLYKiqXBMD6lYSEYW1O9hPTOWRFxDPaz/ic/8Hjr2DNyUtKtQGjcRmkGTcWFGaCu2YSmySRRlwDRjYY2e1mko8+GH/Lyckhi3GYEeylhcOVYKyxaxsA7LwPjC023iIJ0nhV0BnteZFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 11:50:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 11:50:24 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] configs/versal_vck190_defconfig: bump to
 xilinx-v2023.1
Thread-Index: AQHZkrskP/liNbRIm0asI/6i0cORU6973jwAgAtEImA=
Date: Mon, 12 Jun 2023 11:50:24 +0000
Message-ID: <CH2PR12MB50045983C06CE1D36CA84193F054A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230530055353.43786-1-neal.frager@amd.com>
 <20230605094634.61f94358@booty>
In-Reply-To: <20230605094634.61f94358@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB8015:EE_
x-ms-office365-filtering-correlation-id: db37ee81-a7ed-45bb-95df-08db6b3b3533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IZliMHjiO2Fn5QnfPZ7YZ8Ecl8muXk7z/g2LbQIh5vjn6vic3UtN7y1JO1QDaIhyPAGLPkY5UDPHurZd8aWZLQgAIlIkCWFrdg/7I1xEzUEjyXT9N81MyyW56Q2EY/imb4s9E0kcv+x1qKfZvamL+DmzmdB6wHCScSJFOosMgdX5IhZcmceaMJQYscIgWKcPfJksATBmuIcUtsf1iOYCu1zhMawVl/ajilI3+oS8XnhkwCiVzjUxhuW5k57bE/I5+KxWHUR/UtSCaBl8dxDhCQpb8Pqz0904JWYoLajU6urjjoGThae1d6w57AibX/mo/vm7SWK9Y5AI173xorTZIy6vxihOr+4mMAmAfPPTCrdzU9EytVP4fy/ppa7+YuCg4gNc7tG7ZgG8TfEcayOM9XU3hnA+wNj7Nfr81PDPqJkX6/q6RwXbskdnZNhOUPbh/YzU0s41BlLCALi3cjRL9XAcHuBGctfe0u8/P0YbNbv1i/iyOJmC9KYsXmO48Wx1LCjorW6Z2r3HSYE3AIqMj4b4lFkGrNp8Oh7hrDxAJwjLo5BG/tCiFFF9UFmOlLvichloNggMqLnTUzktYANzE/tMfYqYFKUKLV4Oeisn2aM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(71200400001)(478600001)(7696005)(66946007)(66446008)(122000001)(66556008)(4744005)(2906002)(76116006)(64756008)(66476007)(38100700002)(5660300002)(8936002)(52536014)(38070700005)(54906003)(8676002)(316002)(86362001)(4326008)(6916009)(55016003)(41300700001)(33656002)(84970400001)(6506007)(26005)(9686003)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r2MbDuFYXZvDJsVD/LsOHvK9lkje/jynPLo+ZiG1aQl/9Ul4hiEXwU5fro79?=
 =?us-ascii?Q?330NwBcC5xHbyl8QIs8zb/7vBiBVz+Jzy5ViJDmgXOMnjC6J8ajb1+fQlz25?=
 =?us-ascii?Q?3jf2k99X/Z9ka4QFjC7QPCo1mN6+J9S8Zfzf9BGp3x8LdyAbwAZz35Jz8vGI?=
 =?us-ascii?Q?KvDoO3l60MNDcaOoZVTLcxQMyY/czq2Gh98OiXkceWDZupJRstNfFYZ++hce?=
 =?us-ascii?Q?Kh96nzXKcna0B7JPeEnTgmW/Jb8hq0Dj7NBzKyaBXIH/e1JA02s5ek8NQSVn?=
 =?us-ascii?Q?ZThpVyAMOdLoIp9isl2kdCftDVa+Zha18aAvCMyikfFZoS0k312HSL5mTEhO?=
 =?us-ascii?Q?yN1sx9UtZrU241gfMT0DnvTjleQ8nCVPF7EA+tWF4DOHAnASEQQD075o9Unb?=
 =?us-ascii?Q?iUs1z0OBdIwV0dYcWfwzySN6q4/qE535aOTv6A/ltefKGP26JU48rRb27ryM?=
 =?us-ascii?Q?JCpsNXkHhH7eZrrfBHZoCVHLphfH8lST7/DvU6C8Ri88O6XYi7adPYSayfYu?=
 =?us-ascii?Q?ELXOFO9pTkg693jQbx8icPawUc+UFt6uKk/u/zr5usBY1v1gIBKFxJWuzhc3?=
 =?us-ascii?Q?R/w0TT72oxSZAtflJu0iIgMKtwXOnMwumkVMysGorrNwz9ksIBU0eLHmKqXu?=
 =?us-ascii?Q?sx1v9hKs61z3bjVOR3CoyG4bdfiZClTNVQagdIhzfMocOocMTQutKKslMbFl?=
 =?us-ascii?Q?EX0JpET5+O17qddJNgpH+HQ58MWlRqj8qb542BpiTKJsE+RofL1Z+PdhUt3B?=
 =?us-ascii?Q?P3afA5D4XLlwhwHu7iO/SIh/Q3sv0RPVj1nRdFlKttk8KjjDJJGrzxXMrIhu?=
 =?us-ascii?Q?TzoIA7ClpQ6lWoUXtTh5DwE9HnBRPTkx2+KPqsHqc/01TY2HM/1Y5JFcvE0b?=
 =?us-ascii?Q?bKIMrMLgcr57Qj5+GKU4LyziGGO7fKggOjh3kYGvlDro0HaVszBtfa85tqsE?=
 =?us-ascii?Q?HhPTw0DZ9rOtniQZbdTJ+yWEQLCDyA0SBg/qcVO85JeQDGHdUGw96secNfG3?=
 =?us-ascii?Q?5TlBaNr/3c/0Gwe4loupb+G8/XtGcfLIctiwI3KRtXnXUCMbsEOj0CZdCoMG?=
 =?us-ascii?Q?75vyp49tHv3snOL+CNkpocW+zIVlCvAfJFMbAd9JYQz/h6VQ+IDLsOaB24xF?=
 =?us-ascii?Q?H7Vf2RCrh2aMEPEv28Ys62fr+inK28RNv2NPyTzf7M1pJ64K5BuXvLKS45ln?=
 =?us-ascii?Q?W3r7ssOIwOWgMZA5m1V0dOQ8TOWhDT6Qn+i2pR85UeMPVGCzbsJ/UJ8VOhmW?=
 =?us-ascii?Q?4ko2vv4nTDS4GuGP9fN/h4pApN3ZQDYeKvAQIY6gzN7nKaSxBKlwENmYlCA4?=
 =?us-ascii?Q?4P0aJzIcvmmoPQw28izO+2WGjQMsQUdoYS36QFhEftrJTP+WTUMVVdILs9pi?=
 =?us-ascii?Q?lGZwpRvREnI6c/il6EAPVybm0/B5v7GOihQPTF8fgG2TmWj+CoZuar2dUG6R?=
 =?us-ascii?Q?XlWkbgYipUejrrgMGUEC2/YcAeXPymT7ZoQFuKLQ5Vyy6RAnmdaCS6GzQJ6k?=
 =?us-ascii?Q?+GGnU+JP0NVJYxbtt+XliZnLponoDtm8n71RNIIpF3uNBDLjpcawZr9RckuQ?=
 =?us-ascii?Q?Tio1vdxjT5anJFUSk1I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db37ee81-a7ed-45bb-95df-08db6b3b3533
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 11:50:24.2304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylYxYWDnCtsw7cII4Pvsa0s5KyvW4bYlGgtqtEqAD8lek5BwQ/Yuoui/+9leLb7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHDkv1N0FrlmPnqSZivyZA08MGc0X9CO4mC5hFPAKyo=;
 b=KByhxTeKxYpjsh30IjQQY4XT6vU8eaBIwA8o5UVTi4gwGU/Zah+REYbotl5WhLk70qw2RagaHBUZUkVnQDp5S3v4Uo4cvihP/8WeGPa9W6nZ+1Y1O3PxNAxkLUrHUVFaIczH9mdEtGaYaaa3JiQsqDMRInEduJp+QwNn26HvWk0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KByhxTeK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig:
 bump to xilinx-v2023.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

> This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which 
> includes the following updates:
> 
> - Linux v6.1.5
> - U-Boot v2023.01
> - ATF v2.8
> - PLM xilinx_v2023.1
> - PSMFW xilinx_v2023.1
> - versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware 
> repo
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just a gentle reminder regarding this patch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
