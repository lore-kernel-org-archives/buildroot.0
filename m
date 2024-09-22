Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14E5CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 14:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD3281193;
	Sun, 22 Sep 2024 14:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oAwwSATcp1u; Sun, 22 Sep 2024 14:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D0D81090
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D0D81090;
	Sun, 22 Sep 2024 14:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20D561BF3F6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1044581090
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 14:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0sEhFJso5ui for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 14:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::611;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 140F98107C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140F98107C
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::611])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 140F98107C
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 14:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZWy7DtEzhHp6ZACuA7U5urgmQ1xU2wfXCTmvgCRQFbX7wYnPv5Hsx1YMQO5dRFzvJlgHIBDf6HxMdO/Kr5KE0CRXaAs6Sayty3jd8ml8Rva6QX9U8bRYVepeQt3QwYRITm9lucVv08UNoc3/ZO7b7EhuytVxNhxsSVfMLNMvrZAeWtdA9rLfDBUP+X7mlVGen2b1RzxDBanSx3lwbTjyFAEvK2hXI8wJfOPQWHGPg3GBlaC0tMSEWilPGx2MlHrBJOCbeEdFqr6jmu71OXbaqhaWJY/bd5qNGFhLV037elYDjYgj3CXgF8auZviQd3Xb3qyUSF84cHmV27VFDJRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOKzRHgY4LCSAI3p3oPJm/riH2BEhtfQZCElHIKRD2c=;
 b=dKE00qb8LJRqVKIwwdwqSAYjNiJoGRYrXsay+jvZRaLgv+218ZSlO6RXkKJvBNqYBG2t/8vN9y1vc/wtaASa1Z/SbzB1x0qz3wUMwuNaoKqknoHv4KNkrhRXo9CZfw1OlCTgxqFNBONRC+PRPYrecCdPbJUrOVPXQoUj7z6tO05sFMt43YDRTPRzpz5zICqJ9mBvz6yvGa+7gP8lIc6xZgr50jY8R66u6TBVoKbBOlwmKBjmKBUpprjwin14X1MEO3Jbue3XyaTMbSJbtGfuPSbpdVzpmBYzlaR2eXrmc5qJQDewLTPiZb9zBSVAx6u3tOg7vGBYHS3HCKiPc4rHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Sun, 22 Sep
 2024 14:27:26 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7982.022; Sun, 22 Sep 2024
 14:27:26 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] board/xilinx/patches/xilinx-prebuilt: remove
 duplicate hash file
Thread-Index: AQHbDPkFAwjGDT6nWE2ldwBV6eekOrJj3Ljg
Date: Sun, 22 Sep 2024 14:27:26 +0000
Message-ID: <CH2PR12MB50042E5AD8309FC7F051DB6FF06E2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240922140907.918582-1-neal.frager@amd.com>
In-Reply-To: <20240922140907.918582-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6052:EE_
x-ms-office365-filtering-correlation-id: 4f09f77b-61b3-41d6-103b-08dcdb12ae72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/h4OR9wLaTqeRrZVunzK2wVaK6/1cRXOnch6mDnvbE29vNsyXyGpR6GbbaLO?=
 =?us-ascii?Q?4ne4qwsOoflfltHjh35AWfkNF/oW4opINiGL+1bHB54QWqJ9Lwaie9rWDja2?=
 =?us-ascii?Q?Z056VFTXWQkzUz+KmFY8k3ZWQU0ZfoNtfdyLKSkk79053HVnengpZ+4axEtK?=
 =?us-ascii?Q?a8fnkmVki39kC8TEufoIPIK1FyxL00bvSwGMg2UFkM3OAgQ3Q9P5Cn9UhkcS?=
 =?us-ascii?Q?Dufre4YhlfNjYbiqKl4rGYGrs9h5qJ6rNU/lswuNdi5YqmTInQr1J6ROU2gP?=
 =?us-ascii?Q?L9+expn/F80FgYzDObvkQk6Yi0htxw5zsxLfhlz6iTPNhxZ3DNqloKvVzNnV?=
 =?us-ascii?Q?YTuydBEZUZRmPmO1FfZVBt5DFu34CF0M4Mc6+pKfoUDOpOBHusRPvISKAWqw?=
 =?us-ascii?Q?Crt+VcOorzfnBSUIesJ5v1jGHe9nHjacktNuwvoeN1PZSkjVBSlcs4zUQFb4?=
 =?us-ascii?Q?Ovgie4OnP/LT9wqwqEYuxAlXpaiL9hTgF/kwZ6DoEgQtlNYWMjV8sp7qhMnS?=
 =?us-ascii?Q?KGWa8/UzeCYAz8M0PHW7gADVK4OEOaC3BMCoinH6JFCzbMRi0mKpOETxw9ey?=
 =?us-ascii?Q?i18dkTkksE2YixsS6qbIutJZoYE5RgPQLjO6TCZHeHf8KpalZugkQdFF/RIp?=
 =?us-ascii?Q?YXy4vADN/Kt70SG8LAUO3GL1galSQ+PkPpwAhFnmh18GS5wds7j+4j3NcsGG?=
 =?us-ascii?Q?aAP8CF4zBYtBpi2SdlFtl3xWYExM59SCokfFZhpOdIhH770gsGYvAwl/w8bc?=
 =?us-ascii?Q?W5QLNgvIaox21MSMsdDtL2HLUleuF/440+U8favySW1Axi723Nhk43jDpVPA?=
 =?us-ascii?Q?49Rzv1A1i1xZeomjHjCZRmPB7Sr4FsJjXU+p/2Y7MPaG5wyEezweKdJFHZ2o?=
 =?us-ascii?Q?VhswQ7jEuyfvzlKNoX6E/+NQWVemKW7ohpQnUTgPYGV3kSvklUJ4fEVa2JFn?=
 =?us-ascii?Q?jNe9qZc/hsnNz1AARV5+4MX3R8kaXHhI8QMnKJ1NRlo4vTJm+IE+F7kr4y9m?=
 =?us-ascii?Q?LCm381sdfZdj5Wory6gYc66uLCZlisYlfuh2Chofz8z4UK2gHz5KQ+dd3Luc?=
 =?us-ascii?Q?P1ri9ihoDkb1/rIpKwgCZn7pTRgxgTzCm0GUNu1qFulxH2r3VaaFWsDNPjC/?=
 =?us-ascii?Q?qF8+lkiLWnjmwV8p6UKcXVx2InvVLPFJOymBL5s0pswOye2RFREQ0wDy4Xji?=
 =?us-ascii?Q?1qc6VzFQJ8wc3kS3jRlQJ4vOsb5xN2RDN7tiV/Xukw32Z7NdcOBCyXE9gZYg?=
 =?us-ascii?Q?JBghCI2Yq5VCxdukhftwbLhZDCapQPqRSJGKrp1+wUeNjzTifTG0Nu9wwfSV?=
 =?us-ascii?Q?mXJO0BEV0Oix9e+/8Np5KZLLjfoLoWZRrzTphafacmdBEkeGIBv1S6XDfzuY?=
 =?us-ascii?Q?DMconb0iTar/b2JG1/dRTaIgc/5t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/oXhYzpW8iYc8QhEOG+jtDFtzcPwfQECZfI0wix+oET0iPmwtpGcNjgaqD8E?=
 =?us-ascii?Q?uzGchbK7i9a48y4Xp58lcMekWJwYEleKe5r5o+t3/q8XZQLu7yvVzE4ke2tW?=
 =?us-ascii?Q?XTwD2HkKupU/kqNOiNyc1mg4VC4+st02ngZ2o1GgxMEMNPjJuiQhsGo5icWB?=
 =?us-ascii?Q?s+hPktEFDCzC+L2Ju3C14BLirYYRvkhT7jfmBGqbNwEMj9cSEL0s8e7op0LA?=
 =?us-ascii?Q?wd5apYZy81QNEqLwl617H1dTTVGldbuhehWrQKvZa2UY37j6QW1ljXu24qGw?=
 =?us-ascii?Q?MriMsxw02paS2UwXWOWWAi85jlXbYaF0YyWnyowyr8RQeStuk3hpymiUsfDn?=
 =?us-ascii?Q?3xTlVKpZf7X5SkljouxqDtCFYaEfEbU/oUdDSGhgwRfHvQTViBobIYRR1y0w?=
 =?us-ascii?Q?VnOAeyZIde4PBSiiq3rlKwGl0uvV8EnJ9liCK5IeFcUd8UV+Wxn6n6rZ1E3p?=
 =?us-ascii?Q?4KD6m9ioW0hTvNdDb8U28UuAsjkJgbywdPR8PRO8Q0U8rloagvCQRORK1bpD?=
 =?us-ascii?Q?tQNOgLuww44O/9GArP4J7iSD2fx5jeVCW7dtgpnfLjzJgi2bqURY7r7+Eck4?=
 =?us-ascii?Q?h6fL6wQT36qZGQRNxd0ytZd2RaNDnI1PApQaRfijiJ3UcRke4nApgdlyxpI0?=
 =?us-ascii?Q?QCuJejAZpQHXwocPHHyVEC87IIztLc3inLsG7kOVo9TyRuI4rFTyNzPdIgJK?=
 =?us-ascii?Q?JttT2LS9GWxa4Lb40A6w+BjMXUtGGquMvIh2GiPIB7O5AFGNHA67twJGpCLd?=
 =?us-ascii?Q?zACKgwQ+MDxD5+tykPqQ5YK1wEf1ZisbODMQg0+4h0o65EXQN3gCRHKoY42C?=
 =?us-ascii?Q?HTlcVm62x6oAgWJSmoC0PURhrv9JPfMOMr+6kk/jf1QnQoIUykrYPuj8PuxQ?=
 =?us-ascii?Q?72IAsnx5jL0de64dENpUOzxYeOShZ0xo4nAlmQKqAnyc5P4hK9PQReeEygP9?=
 =?us-ascii?Q?TUdowSxb+5+xPpX0nmFA34PGWfr7Tl2G7gLWuX716TLWRbz7rMqANEgDghI+?=
 =?us-ascii?Q?wsd4dqpl7uPAylJ7/GGsZaLWDWmBvsf3hNLs9eZ8jpd+ZMngOQAJ1U5vastA?=
 =?us-ascii?Q?dMhWIOix4kP7bIS/Sv/cKhhyLxRGPW0/aYr2dNjiA1BoG80iURjjFa/r5NXW?=
 =?us-ascii?Q?RyWj1h7/42WxFcdQk/KUpzynU5rxChPOE34okOngkJEAQCwQnXS3+xYnr8Pw?=
 =?us-ascii?Q?GGgm4rNWvYf3cxJ2kZc0ZsNu01y9P7VFxNdxnJs9NxDfd5UrKBnekWuQhJHC?=
 =?us-ascii?Q?hDjKrC6vguEstB8s+paHNql9/aE6fh+xJoS3UuwjA83DPJdTKP5pWYB7pDcA?=
 =?us-ascii?Q?TUTQYEptNrnd+Wn1uHiLFROWzCsIHwVDIcIzF/kn11oE4qJi80+nlPLbqeeU?=
 =?us-ascii?Q?LYe3fhSY884Fsh/6kjOz4G9M/K+cg7lP5RnxCDysQ222Of4WREeoB1ZbQq0J?=
 =?us-ascii?Q?r/axQcRlK+6lYNFWlEZPXtOEyUF0HPiqe63bcDlot4hBYwm5F2kZqGJGMx3v?=
 =?us-ascii?Q?WYKC4jTBluiSgx1p9pYXtXU4AhxMnTvuE0Av/m/L/bpKmhpvoQkSGYw0Po97?=
 =?us-ascii?Q?YIhp56nX5P9qd/HjCuo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f09f77b-61b3-41d6-103b-08dcdb12ae72
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2024 14:27:26.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vay95SWkfIq8OpHLrmfrGr4ooBsx/jhnKurNjwSLiwLpMiAyJ/vposq/FGdKlxdb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOKzRHgY4LCSAI3p3oPJm/riH2BEhtfQZCElHIKRD2c=;
 b=uJhx5Pu4Cwitu37uKFUXNqp9uyzDze0v1KpYrvRlLtPIYM9CLOHRdySi1CFmDdxrtPT5cvRWN1MQEsse+FI7ZSGslGud7cg2VMu/FKW1K0bepOYuEKtOEEQVjtNCDB3hhgke6pe3UdHUdBD2+YIGHK2W4FwJmKED2xmneV4wtbo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uJhx5Pu4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/xilinx/patches/xilinx-prebuilt: remove duplicate hash file
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Please disregards this patch.  I just re-read Yann's commit msg:
https://github.com/buildroot/buildroot/commit/85e41f5f21378a10adc3468c758555009e5ccda2

> There is already a xilinx-prebuilt.hash in the boot/xilinx-prebuilt directory,
> so having a hash file in the board/xilinx/patches/xilinx-prebuilt directory is
> redundant.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 --
> 1 file changed, 2 deletions(-)
> delete mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash

> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> deleted file mode 100644
> index c955cd79f5..0000000000
> --- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> -- 
> 2.25.1

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
