Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776E6C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFFE840926;
	Wed, 17 Jul 2024 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghixx9G9TLjY; Wed, 17 Jul 2024 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4822240914
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4822240914;
	Wed, 17 Jul 2024 10:17:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5AE21BF38B
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C350960ACF
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVw6YwaaXUwI for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 10:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::705;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=luca.pesce@vimar.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A191607BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A191607BD
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::705])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A191607BD
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 10:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdPBzMKsoFaq5knVFJ4qhBqg/DzJVNogWqxOLIKlu3RdmAp4M7/zBr3hvFfUJW9Td7EPp8uIUW/P20XhQliXwvVCcagCzvFr2WTF3MB+nAoNYE9IPmIGAQosk3KLllT3A7pu5iiDWP92b6xQOs6urO3VzJ/As1iXeON/f9fZMdcxuPxNhB8ZhYGagzqxfuxkH789ctk5synlvbCyOaOYtdj+opUkDJGVutcwYdO42jSlx6RKyei+cqoA6JdsIMazBLDndRlvxbKsZYbShn/3jHeXGqA2+7YXxJuhiRF520SKO/nof/obndY+x3lQhqAubDUpLgWMbu4xv5/m28NNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD6y+88L2RDVfassxsuM/k8uZ4lVblsy1dkXH/iBhdM=;
 b=mQoBOdK4NnEnDTWXma5re8vOqD2Eqkt5PvbLcDUxhfgryYyRO3YHn9D0B0X3BociwutVoENK55g931aCZTqUA04JVlqCNZWICJkQePDq18Sg0Oj5UuMnDLKGvDkOCUDrYwlvG39UN0Psf87OlrwaNltFi9ABSdo5ZGwt6fQXWAtJA3ZJlbLzIM15PE1azJg+Mlfr15wDOGFXj4MA6lV3ERssEIU8DFg1d+ziMbwIUqrsGVOh5vT7bF/wHSK0dhWiJ9EXGop6/y+QOnz0X3nGdU6wm7TXzea7ChihSt7u/UtFwULLFAyqfHps/sK88M3uhJXWzGua5aMU0fBShSQXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AS8PR08MB9743.eurprd08.prod.outlook.com (2603:10a6:20b:615::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Wed, 17 Jul
 2024 10:17:01 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::a728:c9dd:b81b:4727]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::a728:c9dd:b81b:4727%6]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 10:17:01 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/pkg-download: restore user's
 original umask for the whole download process
Thread-Index: AQHZCV9bidCl0ih3bEKqg8czv+H377H5zHUAgASDLdU=
Date: Wed, 17 Jul 2024 10:17:01 +0000
Message-ID: <AS8PR08MB6870BA7398868F81C00E70D081A32@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <1670323283-5697-1-git-send-email-luca.pesce@vimar.com>
 <1670323283-5697-2-git-send-email-luca.pesce@vimar.com>
 <19631b3f-55ee-4075-8571-84b1d9b1e293@mind.be>
In-Reply-To: <19631b3f-55ee-4075-8571-84b1d9b1e293@mind.be>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|AS8PR08MB9743:EE_
x-ms-office365-filtering-correlation-id: 850d3d0e-3834-402a-9add-08dca6499915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?sOFwkuJcbm8tvMAUPcyaIstbwC3YXI6Gb5c1dycWx4E1Xj42yS2OMQNGqR?=
 =?iso-8859-1?Q?NDZ8W2JA3Ob0aAcYTsmhtHtj5lf+tZCFHIhe4AQZfwUqhWXicJ/L4qkLxz?=
 =?iso-8859-1?Q?ASv7ul8xhdi1UXYZPU9sQ+J/GXBq4kupLCbJq92VM0j/0M61MIL7DI4hJu?=
 =?iso-8859-1?Q?lho78NMha4+KpfjgDOK7i9NGfNaSrh+isy6MuoRZ2zzfma96tKq0i46s6s?=
 =?iso-8859-1?Q?8y1rgQ2qCvWjaFf5gTQ/9rJFVi5Y9+29G2ScmAuqQem5KPOz3OysgX+15s?=
 =?iso-8859-1?Q?rRq5sCuXbxfZYQeewd3QNN9MeEq6ILA014p6pWIS2xUfvrzjd9q8Tja37P?=
 =?iso-8859-1?Q?t7CI3/0lUzov4IRtBenw+/iq50Ze9weWhna0ADk+nyQpNYuA+jSnGM1mWF?=
 =?iso-8859-1?Q?4A38BxOMzovTfaRGLRBHKoyxjSojWIS3XgpiedECngIH40MAYb2DGrZ78p?=
 =?iso-8859-1?Q?c3BHcj4Occgkj0gJG4KcJ9b5QG/kwlvzxME5YFTeyZZUbr3v6fGdTHL0Ni?=
 =?iso-8859-1?Q?/qpE5jHH1NEI0TIjlDzLAHI3fU6QqGF+bWul7YbChF7tOdbNez+3mk1QJP?=
 =?iso-8859-1?Q?nygaFBGo5VzkjklGT1g92yzZVst8Jl07ZLRygOoAAqS07hf2i4C1St+tH/?=
 =?iso-8859-1?Q?YjA6orYI1DEw2LNw7Gx+IoKulOLbCOJxqjaJXRKYcdOsbKhR9QdcSXBuFS?=
 =?iso-8859-1?Q?3+WygTSkZmL71ATr45iba1EfVhAfEqanWB49dFTjOvz1zd6ulhoOjAm5xL?=
 =?iso-8859-1?Q?rhTayVuEF2CTCKO9Z4lbbpwnvBN6BjW706TkfGYLGgtrsXn1BOIVoBP+UA?=
 =?iso-8859-1?Q?4oTi1KKII4veEOPCz5V7go7cM3obyCJXD41GtwBAXlN1jvDASBRQIls95A?=
 =?iso-8859-1?Q?nSD2ctW8Fm5ttSDI+PSFkN3BvQmVUD3/iMNY60YuPMBPbZNNxNQ1HkjARl?=
 =?iso-8859-1?Q?MkJ+XcW6z03iniYRqc4tFllsPA/mdfd+B8MtnJ3I61iH8ZrZtD4x9Wb8rr?=
 =?iso-8859-1?Q?3BT3SbfLcHUIYjkKAgt8soR9I4nqBzzWWcYPq/SVCS2NTIGBJJNa364KLV?=
 =?iso-8859-1?Q?JuE3rVM8U/Ewpw5jJNJWNeH2wFQrHTer8qPEaa/1D6FgK/rNv3yM3dMdvg?=
 =?iso-8859-1?Q?2xKAoLe1duHx8McpqzIiQ+e+ERhQIxVl67KegkD5q3JmKSXUcoL6pn6MYQ?=
 =?iso-8859-1?Q?zchNM4nssjNd9Y1lrYSDS49jidjHEMezBYAuuOSJ1iculFBjGHSGibwBDK?=
 =?iso-8859-1?Q?xAaBes9bh7naqmN3Ap7Z4ShZwPGf+0ulzbgDSWj9yKk8bSUX2XQeHmmuZ8?=
 =?iso-8859-1?Q?RIauHO6ywjFf1CLB4ioHF+620K0B6v+RFnC+0+glxaD7fzWoLr69vUL8on?=
 =?iso-8859-1?Q?MQVdXnz2E2WDplBwdzbZin0RGfYIPPIBBoEZw3F3tP7AMwSF372aJFMLlb?=
 =?iso-8859-1?Q?KBHDeN8dtxjQoRTZIChpN/w0A8GeY4oS2oAWVM4C9FH9U2jbJjguniBHI4?=
 =?iso-8859-1?Q?d/2ZeuHn/VrLSCyG7zLbJy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h5hNud84YqfqRnwSAItyqdcXMZ/T3MSo3NQrKLsf6n8dSO+Y2R52+hMub6?=
 =?iso-8859-1?Q?A0kxrlpXW0r+A2DwEqCCYdOS+JXRKL7Xs2jyPnPScB/IpgouRdP/BYewRP?=
 =?iso-8859-1?Q?zZ35pDpNWRCNj2rYKLC78Y2/8UQBIqLPfyahG+fFF5FAOpsqMQwwTnLgOz?=
 =?iso-8859-1?Q?o6QflWNVBRL8mtxp4JZnbrDs+wgbwxAiZj+IH/JdqTccmOd0lZoUNYDGIc?=
 =?iso-8859-1?Q?Oys9iPOsYQUTAIKAFPRKUNuryiSdX3UFbMTVRbtcdIC1yDEiTxknApG8NM?=
 =?iso-8859-1?Q?Ayg0VGd/Li7GUT6ke2Eh34mSYb/IjacalKYMVxVVg3sGNdzI4R575mB/OK?=
 =?iso-8859-1?Q?ALh59AJEX/5bC6CggsUMQIa7ghM6MecI1lKHVfU7+cwSpbat9A7ycdvr2c?=
 =?iso-8859-1?Q?F82Ju9JewM0e4/Q9BiMGqGnhLJ06zpWp9bhi3ml7unnUJ3yXNQDGZHwFPE?=
 =?iso-8859-1?Q?ioOiBEhzH7V7AqZeEPizKeQDv2Zrw7psVX4McoObGgW1GvJ+DDW8Cl8Y/X?=
 =?iso-8859-1?Q?M3FYkGRXRSrfeLlHU/Mj0nQIaiyW9+Gz1jy79sF+EehJGfxQTNgqW8fRGv?=
 =?iso-8859-1?Q?S79jpBY8Bz9QTklPnxYeXsmLqlAWK7nHIMbkkmoZkRKLiKJg5BoEBIoK+S?=
 =?iso-8859-1?Q?UOr8dHDs/BnLaxsLHXB+VcwRGGCEt8fYJ5AAIaNM/Lv0aSQCfigKrijzMe?=
 =?iso-8859-1?Q?Q8IqXoaTyaGE3DkSSDM7kfmmd25OUaWAoQ0S3LBICGZgEcveVmZyI40FVs?=
 =?iso-8859-1?Q?Nmw+jYh+X0cKD/PFUUGEcCDequVhxkeP+10cuEWxo6omiehDpJGt/3WZaM?=
 =?iso-8859-1?Q?mDmZH2kiKRY5FvhJ1GgCAnKEBW7ftyzWnoinx6hbGp73Udw3OuoD2aVkyA?=
 =?iso-8859-1?Q?Rk4PqlgS4pnjh0Czh6FSXrTQ2c6k1Yq026rpQf4IgrC50UelBQajOCfel+?=
 =?iso-8859-1?Q?zVh0yMXkPSzTibvU9Ydvmw3xbXKqprakv7BpEjeX0fsO1p2smQsLVAkNWm?=
 =?iso-8859-1?Q?VA2PeUKhxhsMj9d+SxpYdOoqNPj93wfu9YngQxV5qBHs3xbpKVq1DvGB40?=
 =?iso-8859-1?Q?lzx+9qYzI2iXJfCaa5Na5nETqRuCxxmzhBQ6Lnw2wwGSHPR8D/SQ/SKC+s?=
 =?iso-8859-1?Q?ElQzH0WvdQT0hdKE9fl0HfaOVhOna7zNgwTMprDDXosVcxkNbOhK8WmyrS?=
 =?iso-8859-1?Q?gWw9U53rxOeab3MXr5zdtVmCQwffkAK7Cn0D7lqvIsdlLVWkZw6TX4A8Uf?=
 =?iso-8859-1?Q?sdourfipzbUAbHAJt3n3r4SJ2OhIh1JIl6Dyz1r0prNZ4EMpe9WBBGiTYg?=
 =?iso-8859-1?Q?DSAmifbYlqEFb/W+2b/C7rL3J8uMKx+qHyB2RY4QkATE64IrpTpNK+MthM?=
 =?iso-8859-1?Q?+to8cV6uiUgtvFIdFEejToBDaFDurVXF77fIQrGoPztFxwyqDJoXkwMw64?=
 =?iso-8859-1?Q?GEo1We2K7f9trIEiDaEnQd0hkXwUCtXtOTO6s3lCuO0iwMtyH5gSWf+0sM?=
 =?iso-8859-1?Q?gVvGWB4mVaExR218YI/bXHqwCe0Dugay9lLsjZlicF824iGl41lA9Kt763?=
 =?iso-8859-1?Q?xNddRiZFNgY37FDL/iXvrxDxaL3fAksft1vn8L4w+6nfGk7CpQ1or/JyEF?=
 =?iso-8859-1?Q?JxV2sIp1144G15+bajg+PWibjzrnt35XuQ?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850d3d0e-3834-402a-9add-08dca6499915
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 10:17:01.0822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3oyTCxF4sqPcNIJVdbq4lmrlbuDjPse6MiJ02fiv9UEHZmbw+WlitWrfr9GeR2RxXzDGG7cX45FGPje59YnIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD6y+88L2RDVfassxsuM/k8uZ4lVblsy1dkXH/iBhdM=;
 b=WAlk21/FfHyL06q9WTiLei2g12SI74KYcmQOQjIg1UuU9ZGRgpGi5ToOZPoMNVypX/CBtK3P1M1RIxVz5Pr9GUvDOuxoHlRQYVLVSoOM9f47wy30N35qbX+ZOw0XgsfMcYMxCeFLKpOC+YCZMKAM6zyWRb85C/JS6DwJEcA1RgM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=vimar.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=WAlk21/F
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: [PATCH 1/1] package/pkg-download: restore user's
 original umask for the whole download process
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> Sorry for the extremely long turnaround time for this. Messing with umasks is
> something that nobody really wants to think about because it entails all kinds
> of corner cases... 

yes, indeed - also, the patch was addressing a minor issue, so I was prepared
for a certain review delay, no problem.

> I hope it helps you!

Of course it does, thank you!

Regards,
Luca



________________________________________
Da: Arnout Vandecappelle <arnout@mind.be>
Inviato: domenica 14 luglio 2024 15:13
A: Pesce Luca; buildroot@buildroot.org
Cc: Yann E . MORIN
Oggetto: Re: [Buildroot] [PATCH 1/1] package/pkg-download: restore user's original umask for the whole download process


  Hi Luca,

  Sorry for the extremely long turnaround time for this. Messing with umasks is
something that nobody really wants to think about because it entails all kinds
of corner cases... In the end, though, it took me just a little more than half
an hour to get this merged.

On 06/12/2022 11:41, Luca Pesce via buildroot wrote:
> Root makefile imposes 'umask 0022', and this may be more restrictive than the
> user's original umask - which could have provisions set to share files/dirs
> with other users.
> As an example, the imposed value makes the per-package download directories not
> writeable for the group, but just for the owner - the user that issued the first
> build that populated the per-package dl dir for the first time (say user A).
> Thus, if a BR package changes its version (e.g. for buildroot update), and
> another user (say user B, in the same group of A) starts a build, BR fails the
> creation of package-xxx.tar.gz inside the dl dir, because user B has no write
> permissions on that path. Furthermore, in the case of the git backend, this
> makes the git cache not updatable by a different user. This is disruptive for a
> host used by many users, all belonging to a certain group.
>
> So, to allow sharing of a rw BR2_DL_DIR location among users, we save the
> original umask value (but only if it is more permissive than our REQ_UMASK,
> which is our minimum working requirement) and restore it during the download
> process.
>
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>

  Applied to master, thanks, with the following changes:
      - CURR_UMASK -> CUR_UMASK.
      - BR2_ORIG_UMASK -> BR_ORIG_UMASK.
      - Don't check if the umask is more permissive, apply it regardless. If
        the user explicitly doesn't want to make their DL_DIR readable by
        others, that's fine.
      - Don't export BR_ORIG_UMASK.
      - Only set BR_ORIG_UMASK if it we recurse, and only set umask if
        BR_ORIG_UMASK is set.
      - Add DOWNLOAD_SET_UMASK to simplify the latter.

  I hope it helps you!

  Regards,
  Arnout

> ---
>   Makefile                | 17 ++++++++++++++++-
>   package/pkg-download.mk |  6 ++++--
>   2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 88f90cd..ec45589 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -68,21 +68,31 @@ endif
>   CANONICAL_CURDIR = $(realpath $(CURDIR))
>
>   REQ_UMASK = 0022
> +CURR_UMASK = $(shell umask)
>
>   # Make sure O= is passed (with its absolute canonical path) everywhere the
>   # toplevel makefile is called back.
>   EXTRAMAKEARGS := O=$(CANONICAL_O)
>
>   # Check Buildroot execution pre-requisites here.
> -ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
> +ifneq ($(CURR_UMASK):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
>   .PHONY: _all $(MAKECMDGOALS)
>
> +# Save the user's original umask (but only if it is more permissive than or
> +# equal to REQ_UMASK, which is our minimum working requirement)
> +ifeq ($(shell printf "%04o" "$$(( $(CURR_UMASK) | $(REQ_UMASK) ))"),$(REQ_UMASK))
> +BR2_ORIG_UMASK := $(CURR_UMASK)
> +else
> +BR2_ORIG_UMASK := $(REQ_UMASK)
> +endif
> +
>   $(MAKECMDGOALS): _all
>       @:
>
>   _all:
>       @umask $(REQ_UMASK) && \
>               $(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
> +                     BR2_ORIG_UMASK=$(BR2_ORIG_UMASK) \
>                       $(MAKECMDGOALS) $(EXTRAMAKEARGS)
>
>   else # umask / $(CURDIR) / $(O)
> @@ -91,6 +101,11 @@ else # umask / $(CURDIR) / $(O)
>   all:
>   .PHONY: all
>
> +# Export the user's original umask: we may need it later to honour user's file
> +# creation permissions when creating non-target files/dirs (e.g. during the
> +# execution of dl-wrapper script)
> +export BR2_ORIG_UMASK := $(or $(BR2_ORIG_UMASK),$(CURR_UMASK))
> +
>   # Set and export the version string
>   export BR2_VERSION := 2023.02-git
>   # Actual time the release is cut (for reproducible builds)
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 0718f21..eb2a242 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -107,9 +107,11 @@ endif
>   #
>   ################################################################################
>
> +# Restore the user's original umask during the whole download, in case he has
> +# provisions set to share the download directory with his group (or others).
>   define DOWNLOAD
> -     $(Q)mkdir -p $($(2)_DL_DIR)
> -     $(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
> +     $(Q)umask $(BR2_ORIG_UMASK); mkdir -p $($(2)_DL_DIR)
> +     $(Q)umask $(BR2_ORIG_UMASK); $(EXTRA_ENV) $($(2)_DL_ENV) \
>               flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
>               -c '$($(2)_DL_VERSION)' \
>               -d '$($(2)_DL_DIR)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
