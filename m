Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06460E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C18812B2;
	Wed, 11 Dec 2024 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AM3sgY4drsG0; Wed, 11 Dec 2024 14:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8D6813AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8D6813AA;
	Wed, 11 Dec 2024 14:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F006F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ACF460A47
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uynPDPBdTOch for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 14:08:55 +0000 (UTC)
X-Greylist: delayed 1108 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Dec 2024 14:08:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5E14607FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E14607FD
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::620;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0620.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5E14607FD
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dXIKFatY68dPgWQmbX7nr9CsmDBBSY5HQLrceUQ+BY8dRRSw6xBAiRPmL5lpyeGifBaXShQWeB+z+XzJwZ3+ceH3+0tvDi6InHUd9fMc5LJamh+qToFyCdwI8xb5qI8Af7bZDM0gFPZoTHuekoYEJ69U2TExwEGBrmvuoQusAytCehoaPX8BzjYB01GYuiMLudtWA0A9ZAtIkjK9kHIJHlczkHjIgGZ22qSIp1N062MhfMj9k4J6Odwb9ELuFIErqO8hG4rdO5KkkagyxsUCZPh2e9HZQxvgWp6PoedaL1t89kmI2KEWYAo02YK8SUeSWQ+UJF/Wq0I8tVTtYsXF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krhLM+x7VXX/2n5//f//7aXx5SVcFkQ5xgZoXsuK5e0=;
 b=AqJ1itmQHsmY1Ywlt8o8GgKlituPoHdg3OMPdUhV4Jp4Y9SceEH28yBS3NLsEYcTnrK6bfDIyBUo8eZxF38yWO7whRqztX7YZq/s5wgMzPwY/K4sz5XTYZFSXKhYMpgnCBsGqXD4usAE8e2IsMdL1TaQ+RSZ5DApKSIjEdNx/FFqJtbufTc3TYnvAdDTxwsQrL9x2yDUWLQauuLAI4EYltp7freZQbRraMYnLQxmEBT04wOZeIydix73f2Kc6/8ohvBupmp8w+1BW1sT2VTbAR5UmBXtK2NJufBjlPdwNZ/FStSDJ9JEIBnoMNOeQ3WZtBGFro6PmQSpTF70D4FfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1346.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.27; Wed, 11 Dec
 2024 13:33:06 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8182.026; Wed, 11 Dec 2024
 13:33:06 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Christian Stewart <christian@aperture.us>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/mmc-utils: fix hash mismatch for readme
 file
Thread-Index: AdtL0WbOsHxg8ZK0TU2n1BCd2oIanA==
Date: Wed, 11 Dec 2024 13:33:06 +0000
Message-ID: <PH1P110MB1603C71E341837BDF44E0CC89F3EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1346:EE_
x-ms-office365-filtering-correlation-id: 2a38136b-71de-43ef-dcb7-08dd19e8584b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|41320700013|366016|38070700018|15866825006|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?dLyJsDP11Ao0OrHsi/rSE7bAg2bWm1dOwE+xFWTNLOHQINsDKpftZ7Xkkv+u?=
 =?us-ascii?Q?xclR1OKYJjxLaW5I1yX5tY/m+5g4WCvxKQAResHKKvvFbzo16NQmwoJOWVd4?=
 =?us-ascii?Q?x1ZE7SD8+hf67DO3iU6RqIIeOn+B2p6B7yRMpx+GzbrQMbb+NUsUFEqLlKZm?=
 =?us-ascii?Q?4uRHGqKNhXrs2+nMN/+nux6UGK0Uq6F86tBNUdfMg7DbHeCVHigMuWtiR+66?=
 =?us-ascii?Q?dZm9c8S/Fn1s+bL0u1BtgEmS7wsEFkii1YVuJHzBoUXaYUSwM73UfU/We2p2?=
 =?us-ascii?Q?XnrwVqf4g8lTd7vJK/qfML+t7RxRVzOKsQMLmJ822U3DgWVAoFr2zJZoxoNP?=
 =?us-ascii?Q?TF656OYhePA5FtZnLGdc9zARBdK7pOoZ8Jjllth+1WibTraWxgmpFZcOXT7d?=
 =?us-ascii?Q?02aNlhzOWBovlcJt1qp6aEAuzmldWhAOAeID1FCDLJ/rmYbXHGki1NCh1LmO?=
 =?us-ascii?Q?ziF5HZ2j0AnfsjawSslHGaswsSe9siN432KkjA32M696KhURNmwZK6kYDpDQ?=
 =?us-ascii?Q?Hrk7Z2SIsF+Uc2To/1ktuhXkomafTx3SUhCiyM5TwStfIRU+iCXOZRPiolJW?=
 =?us-ascii?Q?pdxwxfHKbpzWbccJCB6EXoa8lRlzUAezibtml62UccxiEwWlpPYfFevGZTMB?=
 =?us-ascii?Q?L2i3gyqoqSf3OdKy6/6XovWJXYsPsiQWKzgQHxHircNXJcwEhWtiOv9zz4jj?=
 =?us-ascii?Q?af3Dbi1+veJ64xcSdoocNC00JBzxtIDK5yPFiLhqybwp8TRqF+LZCS0TLCzs?=
 =?us-ascii?Q?VRn09IkyCHnwk8v/IcemhRIawZHRwOwJjX1lHSMQDIqi6f8VHgtJthyHOYYR?=
 =?us-ascii?Q?0NgXABmIoDfgNA11AleEYz44I0lWWssBpTiq8OijRBr3nFCUONiF3oRzDgMC?=
 =?us-ascii?Q?Khbk4CK9WbMC4t/+pR1K3qxhaBnEbTwuSj+uqEP+xpU0n0ccQuPeEixuMRGF?=
 =?us-ascii?Q?O9qZBc9pD5GYXke1k3R9m9yZF6YJFSGUqj1k3XymzwjIP1QHSdNHaPybvCwT?=
 =?us-ascii?Q?sVbWjZXSuedgsE+PqIcNUuw5XaXX61Wpf6Abis45hrGhmkeZLW8ZnhyDkrUC?=
 =?us-ascii?Q?oQzJx6a3JnRNBAAxlqqCWZd0GhsxWHfUoqdqkSlLM7Iv4jJm2pkq4T425x2r?=
 =?us-ascii?Q?LbFZZPd4WnsCqpWBm+cMYp75vYLVAAuLiHrfu4wOpDlQpBXko8Q78pu3PhRI?=
 =?us-ascii?Q?bYESiyCAIEVL+j3OYtJ8aivnUCmhkynpf8bQffkOHbxO4vgVK4v2DGVSBMCx?=
 =?us-ascii?Q?tI2Enj0fRhIWS/nWAk+j1i0XUnjrbBrM447DyzL7ZJbzG+x9YKyq3eYGRPt+?=
 =?us-ascii?Q?VcgpW71HvpKBfifau1/YMqlsnwkGzltFZk7R+1WXYFPgorBO9zPPX56HkwCk?=
 =?us-ascii?Q?semHyNG1eI3s0AEO2wnqfcRlf+XiRCb8pI5kg9iTyjYs2+i6CYwD+HK5WjJZ?=
 =?us-ascii?Q?vhEaCNz117i/NVmfV+FJUceE+rLKJP92MLPrrYK9w0uJAbGPw48fOQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v4Eb1IHpm9UMAkkLrFXAkMB6MtNNd+JUfaXALpPP3802ba3kJ+IeuFxhaY+1?=
 =?us-ascii?Q?d4mZVvxGkUB5nhJX9K4IgFKfoiQP5txJfZtEoPAsYLC3/KedrthH2xd/zp+g?=
 =?us-ascii?Q?1u+jfFvWB5vu7myp+QEtBbjqa4ekCBjWq24kb5p2L/4s9MlWlM55sy3dmqRY?=
 =?us-ascii?Q?pVYPivnvgyB1hzgMLeld2maPoOxi40lbCDyXJYoW0xT0xS3C4CALCYaf4syu?=
 =?us-ascii?Q?veFTfJQP4o2hKIb4kRbEDU9hjYAVncXl/0NQ6XK44CTMVjKOyZ+9h7jQ9jAl?=
 =?us-ascii?Q?0LAcfmjePy4Fl0yV6EduURK4TyALLg6yYTEjZ1Tw4r/Hi/J5vQzIrra7aJi9?=
 =?us-ascii?Q?Tf7rWqBcmEqgO6ADKM4k9kUQV17yBc0UKP73XR1LibiEjnTjYYlR4AndsQbt?=
 =?us-ascii?Q?xJdP0y0KAKbKVMOsBkca1BKkk/NL8tlpN0Z4KeOpAoGGP4O2znJcmzPRh6U5?=
 =?us-ascii?Q?FT8uE1k1EpUaS0fy/vQCcRI21vGjBsqtZs7jRjtFFvbyoY7KBX36gAVD8Npv?=
 =?us-ascii?Q?1Mykl5JFQL6JdBqi8PEsBB4igBaeShjUsV2sAeaaY/0CPRsxCdyeS91M8kUm?=
 =?us-ascii?Q?jkRNbLUwuebb7UHrotAy0Q/sbuMQx+RugQPoDOVx05/1aR44PpsXsq9b3gp3?=
 =?us-ascii?Q?6FRZZgtPg2kFLVhVPPjXrYLY7I6+9ow8psPnHI+hsC/wwG0+pp2h0XiblOIo?=
 =?us-ascii?Q?+ta4PyfXBh8hSfmlYBxEJ3Qf6/NDtc73YbSPQM1u4JHSIoHhCqI3cQprJx/y?=
 =?us-ascii?Q?y3PNzG7ngR2gmyDSd2msA4EX2qUEQm+ookK0Zg2yLHiWGpblcWsUsyO6TLA8?=
 =?us-ascii?Q?TgDqMTzkWiqQqRJ5wd4YG7cnPY6VPjviqF387kVD6yTv+jhxoXoZBqok4+iy?=
 =?us-ascii?Q?GZYpfTpQiqIXTM1zydmE1pLUASAY3gnPXM1o+AbLP0G6+eqY3p2L7rL5mR1h?=
 =?us-ascii?Q?lidv6VCIiAiy7rTG5At+M15wJGWxB9YKZIaelxuIWHvxvZOYQfMbdhSN9d5m?=
 =?us-ascii?Q?fM1VDmGj2+bq2KXZvoAcTTLLNsqv3zTolxdnlUKys8UCw67bF+dt+c70rl73?=
 =?us-ascii?Q?hYZyFh9vYLg6DoWEKfYBJZZc1KSz1hL2OdShlUiIZ5rHR29jNwnUiyvuAClA?=
 =?us-ascii?Q?wr2ORXy9TVWIZsOkAp5QhHSrwbLrTlzqgeBYpbbhYXRVFK8xc7lS8GuVr7i8?=
 =?us-ascii?Q?Wgl9iUUzQaBwTs3S7giXUOYQ+myIV9qpZ0R6gtqACJ8+uUdjrFIUHrbWoETX?=
 =?us-ascii?Q?y6IKCdZIgsIENqE3e7QG8s+NXhPfxORTzdQOa4vhhWzyyKrpDsftx2e5nmhA?=
 =?us-ascii?Q?Jdgro4JMVFxibh4SOIucNSgspbACZ6dCL1Xjj27WEK3pkN344RB9ywIEWyAN?=
 =?us-ascii?Q?jkuyfZiP+4TCejvVWWCf2Hvo1+asrWGWziwN2Gx1wq3SwVJ6SyK0EP59tl/O?=
 =?us-ascii?Q?UMJi97yTXlwKBCOVs/4Hljb9k4A2rGzk9Zus2anYxZd4NlCi3B3UbR12t/fS?=
 =?us-ascii?Q?K2eLJCG0nl043+U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a38136b-71de-43ef-dcb7-08dd19e8584b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 13:33:06.0924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krhLM+x7VXX/2n5//f//7aXx5SVcFkQ5xgZoXsuK5e0=;
 b=rvNCjnCns1CUcBQApyIBLOHz/R/Zl+MkDFF8kUt9gsdRboxumVWwuC5eT8epvRpTsIaWLao/QgIs8yNd5284YA6RQsrhSt1ufO+bC+NF/r32Tp7wRpz0Qje5X6xBfch60GLDXdWhzmFVqtLj3MwgDDdzzKcC8vwDnMOoDqfFqq4kqJGgodosvgq9Ur5vkomNwT0ym3trKjp53T3WeMmNcCiOm/dSEFQ1vZdFdT/XNjPwXsnwIVwJAdwAJYZJr7OuJmgrMWAObl3pDn5UMhE+Sw5XZKI990wX7SSCsTkqpDB6RvqXguMOTgYZha4UQ49W2DCSue4wstpoZvJlaMFo3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=rvNCjnCn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mmc-utils: fix hash mismatch
 for readme file
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Christian Stewart <christian@aperture.us>
> Sent: Tuesday, December 10, 2024 6:50 PM
> To: buildroot@buildroot.org
> Cc: Peter Korsgaard <peter@korsgaard.com>; Vincent Fazio <vfazio@xes-
> inc.com>; Julien Olivain <ju.o@free.fr>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Christian Stewart <christian@aperture.us>
> Subject: [External] - [PATCH v1 1/1] package/mmc-utils: fix hash mismatch for
> readme file
> 
> Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21
> 

Sorry and thanks for fixing my mistake!


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
