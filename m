Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8AEC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 15:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 482C04194E;
	Thu,  7 Mar 2024 15:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYQBs15_hTNP; Thu,  7 Mar 2024 15:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67504190E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67504190E;
	Thu,  7 Mar 2024 15:38:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACBEB1BF59A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 15:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A57D760844
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 15:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkNVJm75bQGq for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 15:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::601;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E94660819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E94660819
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E94660819
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 15:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgqhqL3AoeXhQCI61+aNEOTVn8J/yqL70BsV/wN0uNUv7A8rPT58v/SfpoLtrGy50tbaC07VhdSQzbPEBBav3d8bRWhTOaUyHvLSbDZhaf9z3v6/WWBIr9RJ4GegODhv0Loh1zSS9m5r27z/DGEA5lJOY/iqn3T9c3mJFESsXr3rnJsV2M9d/fWK4F99wJzoWrtqSnOsPS0dMtRHnSYxHLvqM8C/WBHMEGEgPAZWEiAjvjKoc723U3kMeTUhKac1tAkNqDK6rkOKJUnX4165jGUIt1KbexMren3DU4a/J95QstILMurQ8z0qAWAsJYJui5iPJYO3vPV9879MMOeHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2aTLu6AgaRv2qsClJ1yrYPO37106QOijPJKim0SXaE=;
 b=ZfcRMWFcMX/N6x/qenh2oPlzmoQ7eRZwa/9BXQtPIwWRPQqCoCtwsUZ7Z9GSr25wwbrrhFWtDcC4HOD6laj+0H3oa1xJ5r3w/bKR+N4Sv11o7vBfaBo2UtzYpk6LXJedJ3H1FfedDWr6FkUvgf/CaBPxgf7FgJpn7MJD92sAZTQ8NN0DHN/EMDyqV1x1In85HQcn5ywOst1J6c/97+tqEgv7nM+pAl3tpY5PbfVHAkOm9bukaqfU/aC0NMeYy3NlpQma4GozLIddHl656Vhn6YHSF04k8qvWF6ttMbe26PXpTRWOSDHeY82P5igtlj2yXwwgDtFXjWB2GV8b9FEK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.27; Thu, 7 Mar 2024 15:38:26 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 15:38:25 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/gcc-bare-metal: add CPE variables
Thread-Index: AQHacHvWk/l4uD8T6E6hzMx3Xp4fP7EsaZVQ
Date: Thu, 7 Mar 2024 15:38:25 +0000
Message-ID: <CH2PR12MB5004A3DDD6C4F49F101B9E53F0202@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240307104008.28932-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240307104008.28932-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB6615:EE_
x-ms-office365-filtering-correlation-id: 81d9a541-9890-4db3-023d-08dc3ebca134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AY3uVZAazzd+VPkcpdHxILWbknMRHRjUErfz0PMYMPykqKD6BI6tuRrrq8Pz6n0SwEVRNgpf+WPwnQKtxqNNivLpBOHwFsfpOnGMQJmMfvxe3jfQYPWa2AN2C2Y/Vq9IIkj/s0QAxqEjPbyEX+3WZhkpDPdQKS+63JC0k8NP/bM9AwRDIw87kzvsqY/TPvYUAq37j7De0vd+VGLe8cR9tB+fUZKhbHtkrDprH3ACTPkRzibXAmzczZ7bLtNB8pidk/oCtY0bTDuvUsJG3k2Vhj18se/EclZqYVVg/iqUywMpjlolfze1hDHBgYboEalq+aV7LGEQ5JqgjxJ5EAvOBzI9e18m2072pMSceHWLl7NSgxjT6/B3EIKX9gnDkMtcmthV5/ecbJ2nVrO036HPW/LpAkytvRhq2FEHvRu3Ol5FZ+zd5HeSnoFhAICFr5gH52u1KIOV4u3ZE9eb97+AFuPGvX6U73KSODXVL/W+kplDteuDFljP9LYXnp/MZ8IS8/SbynifbuQGr4JZwG3TnTTIKCPk/iu6OzOGEg5Bj267eTCjbzE817FoRF+RayBEHC6y1xg27yTm+OE0uHKrTdnUMPMaBhtyOcuOLIt72dKrNBrvHHvH7MRRgliObbLSrvRPShbBw/Jhcy30QGsLJ2SQaX8g7th7d8F27DbWGUE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3TPEqix90EE1RU0eJfZuIj7Ael/IiJVTGCgNaa/E0YVUia1IQMMVINQrK0Ou?=
 =?us-ascii?Q?h7KdfJ161H0wkUG2QkrdvMp4Df9Q2iZYgRw+fc0hMA7AvwD7lFDAxYWc7uPy?=
 =?us-ascii?Q?ORg3XIpRzeHojHl1o6jaUp8ib9lzQ3hiPNWvcR7Ujh5V8A95cwrdenWPZg54?=
 =?us-ascii?Q?LaqvU5nUEEqWFfKxZsF4JZZPNRB1L+pXdyayZMucLIsxY30Ufjj1Zt4llz0F?=
 =?us-ascii?Q?oivGIN3+zeg7VO0HDyjRGy6biQHj1HCeolGfS5W/IvHA7jg3CNjNThkWpa01?=
 =?us-ascii?Q?9XMXKvZW7aOl4GdP0mxVleAIgjK3ojgbSzYdXZTBYQAptbvmEHTjdmhu+FJl?=
 =?us-ascii?Q?T+WMMzmafpUp4L81JhW4oepehBdBlSOp98cKjZyh3GQMtSSrlMhFyFapH2lU?=
 =?us-ascii?Q?O46ZTjy/eKD8/thEBv2+RqSy6dHPgSlJSUIwQxuyzth02yCwQWvFQG99sbpa?=
 =?us-ascii?Q?F2No978usO6NVY1VAkHDfwEbQSg1V8TEP269Vx1++wv4OROqyr7lCMsD6o8L?=
 =?us-ascii?Q?X7tUQJ/ABghZ0Pr9YF7gSA3nkT+sf+wpECcdCs/OEEDn8UALPHDIUwIEYPx0?=
 =?us-ascii?Q?+wOr0iiM6W4NYEduuRe7x3QS2Ahc7xcUIG4tGXW+ufGLAwINhBQDgG0KSCjZ?=
 =?us-ascii?Q?KbTvVITE8KZRdjuCGVYrsD7dPZw4NjjQwN+WKALNmrSeoBgLqFFTwpIFUlA1?=
 =?us-ascii?Q?t5/789KN40bPo4LxnqrojJMPsXN9fr01uiOdQSEa7q9VJfOcN/k1u7i2cdJs?=
 =?us-ascii?Q?hviEP/n6V8f8daOVg5TYBxqcmDTDIuP+bAvK2OUNuRINigPvckhcFsTIpjLz?=
 =?us-ascii?Q?EznEJQBgk6myLssYiIK2Wzv8pcXjb5aw4ZNgmGiJf4lUvgeLWE7Esdf9+EJu?=
 =?us-ascii?Q?XXjLvrbl5BwKbk9NmXPlgYckeqY134YVgxvylvh+KnjOAK/392Kl/HIw76FR?=
 =?us-ascii?Q?HpymMtA+H4JnytQ8amX+PTFEq2DzcOhMhLXCQPnS/JcIR3lp2lw+IE+DPii8?=
 =?us-ascii?Q?mJosW04+UfCiqa/LpF7QgdX9fxxXcBYkUMVjKByDDusAIKNorOACViDNaAkA?=
 =?us-ascii?Q?WXSsYAUN5o9dYPh5qJDZzkq20B4D5FIazuRYauMHoQJLgVCuxR1oDr5qF4pN?=
 =?us-ascii?Q?A8HJnnK2gX3QzM/2T+BatqMb/8B0S3bdTIkSkSlJy3avaXHHUEBjz6dJ6La/?=
 =?us-ascii?Q?1ExTZ4N11ENxb6tZAK0yEo4S6qiEXM3LQXjC9jeITd8g0ebUaaV/seuS9/P0?=
 =?us-ascii?Q?5+sjCwNNsHIbTEHsgLfqR0YM6O0tGeK5MCWu73vJPr3ptCOeLO5t43B27dVm?=
 =?us-ascii?Q?I4Wm+CERtbtH9/MV17IB+sd0zsCIDeINzjPvHP5ro/rae2Q/ER7sxhKVladJ?=
 =?us-ascii?Q?QsB6YsGho7/IMt7pzdOTmk24TV9LTWFfMSEtM1SOdeNnYcfHuEjB/42+//bf?=
 =?us-ascii?Q?A7qrNDS762hU7iyB2EGvXav5yirv6a4pHIbJ3TcxLURBsu2ArtLzWFnV5Kgd?=
 =?us-ascii?Q?OG6S5OmeP6epSXU/FwcuFOa72sFDAZw0psZGh33E4m6V9Ez9HUmkbVxWvVV5?=
 =?us-ascii?Q?0dh4s0ueOFANfsIw9C0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d9a541-9890-4db3-023d-08dc3ebca134
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 15:38:25.8727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NslELXvX+SVFpFmPQTfSv4g9mYYVD7w6NBqbG6vvJS29Z5P3LtOQ/5+HofbCUoes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2aTLu6AgaRv2qsClJ1yrYPO37106QOijPJKim0SXaE=;
 b=Kkx7YKU3wwYhcoBHaShrclLEPe14a9tTCyxFxhhkAQDPBZFZkqSdJY8QFMDumYefRB36vtQF00+iRKxEMEdJvOwB+VSz2BtxbFiGSa+0B6Ts+qk6b39rORlRa8y+eFKAcpFOGIBmxMT1G2RcI0WSGXO+Ed/k+n3bwJUU42iVj2k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Kkx7YKU3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: add CPE
 variables
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Neal Frager <neal.frager@amd.com>

> cpe:2.3:a:gnu:gcc is a valid CPE identifier for this package:

>  https://nvd.nist.gov/products/cpe/detail/A30F1DE7-139B-4296-AA87-A516462A1A81

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> package/gcc-bare-metal/gcc-bare-metal.mk | 2 ++
> 1 file changed, 2 insertions(+)

> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> index f391f094fe..0dfc8d7a5c 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -11,6 +11,8 @@ HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
 
> HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
> HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
> +HOST_GCC_BARE_METAL_CPE_ID_VENDOR = gnu
> +HOST_GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
> HOST_GCC_BARE_METAL_DEPENDENCIES = \
> 	host-binutils-bare-metal \
> -- 
> 2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
