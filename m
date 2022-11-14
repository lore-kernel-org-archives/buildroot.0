Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21ECC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 13:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D43D81306;
	Mon, 14 Nov 2022 13:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D43D81306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P0qRe-H_t05; Mon, 14 Nov 2022 13:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C188D81091;
	Mon, 14 Nov 2022 13:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C188D81091
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51EC61BF379
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB30140347
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB30140347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onXoFjO80sd1 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 13:28:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AF7E4019D
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AF7E4019D
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 13:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdu17/Za5T8mEvJGkyvPrET/HD+OQGPTwVtpv/nBUdULNW1h/zGLPRKkZ/sypw7KeSqN087lgl/2+s8xAiuUlLGu48ijBtplBR/RPZFIbYpMOBlPcXrwxjknit4j41HHyJL016/EKV6cepAQsRPbbhatz4mTUw/yiX0/dk9UbnnOQYJfoFi0T8Z8e1/fCL0QzfC+pWh6QO25s4spTsnHgmIebHDm7Tk2MgpnqKuSxgZGhcGzNhndmcUQulDK6mMY0e5xjQbEunpwdhbEkXigBnt81qOwhRMEDakvPFB+kAR8o3dkqIZ95mdAjK1G/OiF3RHmUsUkxyrDhLTCk7/3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UDA33eml2Otrjg39bBrMd6EetfuwGGVJjK8JXOFDS8=;
 b=UB9MWc4ltcTvJmXYLl/zv49QDW6JuMmR1IgeVp8pObIvsbD5sd+gZ/lfYoCjhJwwcyiy7s5ng8P4DN0GVoQ3mWUgF8nI2Oc5ZqR9kSVSyHnxhl/2/qHRdOEvaTpV8tcV9QAD+rDazeuoS6WQJan0NjfhsuyvgPFYkD6KkdmkvPkqPIV6/jPv5RCSl00zMyPWxURNWdi+UFvJFC8Mx7QRgUNEUyOwWi7J4ZPyjDdjX2raz2HfsOgoOveoQx5Y78m4rKmCygEDMWyodWetynAyyqPC6PTdJcEY+xHl/pgByHFcsIsUiGWumGg+aBJWahNMda+nIbML0/T+0Html/KarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Mon, 14 Nov 2022 13:28:53 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 13:28:53 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
Thread-Index: AQHY95CvOWzbCNQTGEOxWUMidKLHK649VkEAgAES8yA=
Date: Mon, 14 Nov 2022 13:28:53 +0000
Message-ID: <CH2PR12MB50045834EFCBB8E12B848E66F0059@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221113184933.47232-1-neal.frager@amd.com>
 <20221113215834.00ae7f71@windsurf>
In-Reply-To: <20221113215834.00ae7f71@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB6133:EE_
x-ms-office365-filtering-correlation-id: 17916cd8-41e2-4250-949f-08dac6442cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qI73FOs+/IPTO5PiKMt2V+wcFjzIy79f9StNwKVEUbR9vs49ziSmSFHENq8lWZYqoy+LQ+FztdwEJ89ZXlakLadrUH8K/dkviELd4EJjrfDsnx10meUZDfgoXNoofM2WacqGGrvBIx7CVklJzn4NIosX2C6riRx4J5NgC4/wKUdElM0c3fTqiRMG9S0qi3uLpOLdUP0GkrDMJmWvRlRDXZZhqE9FEzEbtz29AC7rzXDAQNiKv+eLZqoD0oP7fmc9VSkJ1BCEH+HhUrRsw6BIvgC1g/1xQEo/2SPINimdoYqo3SaCwAtc5LuL4FGOO/hKI0a6TrosqrzI6a6RksZbWMZKZJ8Y2GuMrfJDXu3QK2vgULXsZFWL+5jjoLHhgWzTXe63lnWbouwzZTahNzjH1HJeaImdY1hKun7B6/UJnQF+H/E3LIHPMlGzA3KMNzR6ikUnpT0/N5+jJhzxx9SGycNkBaY8cAKs/880j5KVmpTXAiLFrlJNUl7EYt6mH52ACkv5EkyonM3LRDDBmA1YwJF+y5t82tqKyGXo31H46ky5rgzOo4i/hLtCCvRPQgxdue7QDdCUI29NkdvS1LJ6uUg/PBQ7aPWTLx/vn0OjOKnAxtX7GtGzd8Ku6JCvaPNu32uBHIIr0a5+izSFO+OBV8FhAe9wYUK4vDGHyWX7YGIwoWorzdLd8NVkkvSy6kX9UvKacFIXhZj3aNptGOx2Ea6F4eRMFddkS5wKbgFjsfMM/jbTHgpgsuljcQIm6+M6/4kOesq8wtay+0KP5yx2ymiIFINxdfY54OwipXfQd8M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(4744005)(38070700005)(8936002)(52536014)(478600001)(966005)(6506007)(7696005)(33656002)(110136005)(2906002)(122000001)(316002)(55016003)(71200400001)(41300700001)(66476007)(66946007)(86362001)(76116006)(66556008)(186003)(5660300002)(8676002)(9686003)(64756008)(26005)(66446008)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jGx0XReGnhWlufGJ0/Qwj1oadl+NpeIcqPYgS7iFJ9aQrKhBg6jyQjzULWA8?=
 =?us-ascii?Q?RUdF/aT4wGvHt3ZVuPcHAPgycfJTEW2lUigRuNGiCi/RxQCepJJIiacbOXV5?=
 =?us-ascii?Q?tu/5nMbFB3X+Eduvbpbn+yMtDGvDuYGRihBD2YSwqawinN2npqHK6l1dSQOy?=
 =?us-ascii?Q?zMmsn9ifb25ppYIuipS23iT/+saBHZzPVb/2IQR7xujsXDBiVaZSTA5E5aLR?=
 =?us-ascii?Q?SZVszEDXe/GwRe8LSCHSQuFWTOBMC2MnE/wBwx0mhq/wxoESuoV9YIFFl2qV?=
 =?us-ascii?Q?e+RDvlL+iRiW1WS7HNy51l4iu0hi5bNEjc7zI1IQr0AYJeEk3z7+7Gncfjee?=
 =?us-ascii?Q?ISFp6eqTUxrq74ZjzUbQawbPSrjwtnXs1ijPCVzU5I7f/ELBohoMmHcPIN8u?=
 =?us-ascii?Q?vuEwGCCiW0SSkh3/9F8p860oYOeIF3MlRrn3wNOWnUvgl0BacXnLPIDKS2Ic?=
 =?us-ascii?Q?MafA0mnxKXcZ7cGZy/SolErIIhiZteIFwqKMXnnbJqZT9IWd39YVn8OK7XVG?=
 =?us-ascii?Q?IvVwRadvXuoKhL9wYZfURn5IcOujifzWXUoDkte/KIiPIyVG345YBInFjJr3?=
 =?us-ascii?Q?NRHRPv3Kv5GvBYn/E2NtfeM+hOxC1JvFJktxGNbdXklCiQ5yjFFnu4b2Xumq?=
 =?us-ascii?Q?+ztyxJZBWaCzRCfgfekRKyfNVWsHxCysBMrMAaG/aDkiq7/8bRMT78B3kEfk?=
 =?us-ascii?Q?A7YH00wVl513+zCTEGKqlUFLSmtbzA8g6UqwExlctGv0TOiG6DuOqeSR+P6r?=
 =?us-ascii?Q?WiEyf7MRulqmakxZdKGBINLknpJREvj0D5GbGAbzoU7yKdWnGMiJq1DxfKFW?=
 =?us-ascii?Q?EBiEuwkFvZfUS10rL+stF9e5KqkBI6Hxh+mLb79NyIHBlZ7xejdw3ALDGYRf?=
 =?us-ascii?Q?klhsLYw7A9bkWVQH0Bqg5p68vKTo7dEaJjfYsdYyEwvG3cQHS/dTmskNmvQw?=
 =?us-ascii?Q?DVbZ/mAM1cm9DLonXTeMUnk4V84b2Tcd/izgG5dmtgAIb4IEIM840BJiXqWt?=
 =?us-ascii?Q?laQg0yNjRgxQZmAgyRxd02lvu7cz9dWY17vx0DUJrA5wmcaruCXnGj8umqpd?=
 =?us-ascii?Q?fSwZM7OtClImbiImuRF/eQfLRkgT0lJ+GidpxwWl1Vb2Xh4B5AasCufXtcSM?=
 =?us-ascii?Q?CVhX3wLXlWbSxFkbfSX1I1RD7s5yPodLCFdxnzAPQGxVysgS6TqWGtOYGZAf?=
 =?us-ascii?Q?djE4XjfCcL+nnvS8h/HX+WBB4Vg8jh6YebO7lldlGIPLj6xnpezN2m54Cj2c?=
 =?us-ascii?Q?Q6ERb+m5p5BGykRvVyLc40HAx22J4sV4wpS4oW9xZ6vT1FJHxfByrw5olxvH?=
 =?us-ascii?Q?A96La/eJ7SzoCZpJrCEKnEJdFtVWzcBLgMs/3LnMGmOt8gyAjuxRRckkcStY?=
 =?us-ascii?Q?DToBH3ofBoLuwcivOf0OFIVRRT6xCYzSBgtoNKlShSkEXunCb0ay0fhxeO9w?=
 =?us-ascii?Q?x241a3rYz58xhMyP2zKKtv9RJJCAWJkMTW5Qf9/F2l4gMAXCH7RfRXPx25P1?=
 =?us-ascii?Q?k+zxaAdry1OXHEOvs1qi9KQSC5VlEiJ6dWZ+TJKJnpysa5/IMDBXH86GlSGv?=
 =?us-ascii?Q?ycGeUzb3XikCztqCU6w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17916cd8-41e2-4250-949f-08dac6442cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 13:28:53.5436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyJeR0uiLGMsgXw4E//zyOV0PfbjSP2xoTV9nem9ImCMSEsChwAK18HBFxuj+gGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UDA33eml2Otrjg39bBrMd6EetfuwGGVJjK8JXOFDS8=;
 b=k8bE98hRsQvpMsqBumPKMSnHRaVrlYM2xWXxlQy4iGMf4D+k3eNQrT0/77/pbkFNggSXwW1YUXUaponwEyWHMmryRpmlMmcqeH/9Is5wDxE87LTWcvC+tC3OZeoODmzfBoWmKRpQvcP3qqQZHhFtLqkHos3/VLoDGRrrVv6BGd4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=k8bE98hR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: remove unnecessary
 CONFIG_MULTI_DTB_FIT option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> This patch removes the CONFIG_MULTI_DTB_FIT u-boot option for the 
> zynqmp_kria_kv260_defconfig as it is not necessary.  The post build 
> kv260.sh creates the proper u-boot.itb without needing this option.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/uboot.fragment | 1 -
>  1 file changed, 1 deletion(-)

> I've applied to master, after adding the following to the commit log:

> """
>    Fixes:
    
>      https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
> """

I was too quick with this solution.  If we remove the CONFIG_MULTI_DTB_FIT u-boot option, the generated u-boot.its file is wrong.
With the wrong u-boot.its, the kv260.sh script generates a u-boot.itb with an incorrect device tree and all of the daughter card peripherals are missing.

The SD card interface is thus missing which means that even though the zynqmp_kria_kv260_defconfig builds now, the image fails after loading u-boot.

I am working on a new solution.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
