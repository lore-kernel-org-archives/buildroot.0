Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E6CEB48F3
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 10:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D386A60710;
	Thu, 12 Feb 2026 10:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LaJU934Al4h; Thu, 12 Feb 2026 10:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5C16079F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770892157;
	bh=TL/eUru8/zFc/A32kssGLE3GrK8F0MqYzNlGQAnK2E8=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZSRpRc2ZFde2IyUWNt5U6eEELG0SqY7HuoGhxm63N/BwdroVXjZ352wi/0BPApFuy
	 hGCskNzbdjtU7z6yDykXqG3yJCuSgUr6Mg3P1fbhGLUlfIyziGGAfR/jI5ejePzVbR
	 jfKZHwhLa/3F52c5LzhXMiiMJBxqT8LE4yMIf+qICg4lzf+12aHzBD5zJGL7vQrd7+
	 9hoW8QDhZO+ezI8q3zJd0UJiRAArA/WXADmvqTjanH8qRJrXPnrvGbr1+C+cQB2iOT
	 /BBampm1824+/7SQO/mA5bN4M1Nx+/u9eRFNJOfP/b9soULhkOYPYpEY2MsCLNmZjt
	 /qlJpjhRneMvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5C16079F;
	Thu, 12 Feb 2026 10:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE89BE
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C161E812D0
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ue_NyntnUgcN for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 10:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1B4080660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B4080660
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1B4080660
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4Qksq3Zt4MoeHBIMGQcGhOO+aUImmRzjdUtSerjfpijIHPOSgWx11WEFZSGsrM6lc3yns8y2yiBo55isPGPGBDNF3a7eYOmrbarefwizH0kSqFg1htuGhdVZmZ6+5oeooNkHexI9P6DoY6SobxVwYhM+yvxUFqmnVAsSKah3sHha95njWgEIk8Gd0yKN5llwdwGzsFZjuT8UEky8cOZlmr8Z9elYQlx7QTzSbCGwjJHor8rRspxSu+BEegO7NDt5F/0KAXH4SoN2xWRWyfEzvf5UelEJ3MPgB13PMwXDuqjCnNk7AH2DGQjCLm4H/zaIrgri4RqDlVIx1deTl9zWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lYruajlEDpu25PMSSBbBzt27+k+TAvZvxoGybEoBo4=;
 b=dWnJ2DDtFatyiDDg2VvHtuqTgZIg36tbhulzQqlBOzZMe2zjHj1gILabQuyQkNeuAELlUv5O+UzZxtdE6u9qRz7a1hXctwY4MR8uO3Y8kr+33oT5MMbZi14MvdjvNNKZuGaYZLHIG2DwpjGJICY4RPOyo/BOLPxXIYsm0Ql/nhoCFHo79WuzgL4iBOLFHw7+vt8v35S8J5GUSzw+Fp5lUD2AGbpgPQvQdCO9qYQcYsWX1iQtqqVlmP0/RBAGl69yKOlcnKMG228h3o4kIG5ARhX0T4xDHHJiByC1VfvuSUUJGuJxfYeXBPC+pHo9UewEB51CXb9RzToOgHy3QitHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by VI1PR09MB3598.eurprd09.prod.outlook.com (2603:10a6:803:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 10:29:08 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 10:29:08 +0000
To: Andreas Ziegler <br025@umbiko.net>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Guenther Harrasser
 <Guenther.Harrasser@mobileye.com>, Chris Packham <judge.packham@gmail.com>,
 Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Thread-Topic: [PATCH v2 1/1] package/coremark: port for mips-i6500
Thread-Index: AQHcmcbmUYidrUQjC0KdKsVTtUptjLV7k0oAgANHZ/4=
Date: Thu, 12 Feb 2026 10:29:08 +0000
Message-ID: <DB9PR09MB4987F9E9C75715514F9DA9A2F660A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260202155535.3412990-1-jimmy.wesolowski@mobileye.com>
 <20260209132034.3298699-1-jimmy.wesolowski@mobileye.com>
 <a16c18964c63e254812e4baa5cd57b84@umbiko.net>
In-Reply-To: <a16c18964c63e254812e4baa5cd57b84@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|VI1PR09MB3598:EE_
x-ms-office365-filtering-correlation-id: f48f3ec6-c86d-42f6-4391-08de6a218e2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?WhJ2rfVrBxPGVXkY9573ga8UGJQRPfilXIqNrbJATyOAWKgz2SqJ9xvH5o?=
 =?iso-8859-1?Q?9pN44toQ0TxozCccmYB9bBxgVD8+Nk432IE5ysfs6xlbDsyac58q1dXdE+?=
 =?iso-8859-1?Q?ZwYAN1OqbDTK0O91xmKxCWcvN5AyrIAijKg8KjlH0tciIPYe4mMViL4SZo?=
 =?iso-8859-1?Q?KpvZl+s5JJjfHBXKnQAmQJlAM0wUul8PvjCL3ZiXz9siRDQcXiDwre14ZW?=
 =?iso-8859-1?Q?eZO/fdu03lrYi8Yhop0OVhBm1lEBmHvgX+zd2ySRm4t38E0/50CXAH6Uw+?=
 =?iso-8859-1?Q?QJGy7DipJItf6LRwVCnbk77e2w2hAyBFuUaH8SJTVh1MSfCbJmr33MDHlt?=
 =?iso-8859-1?Q?Jr/vTGCO5vm8OQpxoMeVr76oUJ4x8os2t+27K7JRg0ROHZHvyaxq5ORzlo?=
 =?iso-8859-1?Q?M4xrUH22iSnSZNpoLOeVR0jAok7tqPOfjOx+vkK7oci/c0Kbc9bYUW+nHU?=
 =?iso-8859-1?Q?av+Medu++knFf9qcNBvxkRotE4zYisIPApCOLy3VTfDk+28oh1qmRLT7pj?=
 =?iso-8859-1?Q?FyLWSPSOu6fHKwV1VWLtYy2bYKSzMZlQ/hVjPcBIPZuXrAaeMrarsMFSY4?=
 =?iso-8859-1?Q?/eAq5ujI+H7Y2aHw3O2a3+FeFxWaqMKC7HyH9oR0O+OzVMyxTnMrDkuhEx?=
 =?iso-8859-1?Q?+NN0GrG38XkYimWZgksp3G26c5eIUlzHIN4zh6DiUDgIz6NYAM3Pf/8gHH?=
 =?iso-8859-1?Q?AgC0r4mgMoECfuEQ2X1+jkkcWevLKgYWNFoKdrpLUOOvsN2cGrlJQLcHXR?=
 =?iso-8859-1?Q?3mGZZOpviUyxCyqpNRJVOczyPkCdBkejbXArHvuyc88GcBUa7CfMKJ9AA8?=
 =?iso-8859-1?Q?hgpuJP+jFwpdXZPLoWqdPYMlYGD75DsT6punD59CPTY+MKBsBtgIPdml0u?=
 =?iso-8859-1?Q?BPUupTNIH7BQpACytBCZlP7vFCbvrldTOf0G4u1BZ4nXG8ffVom6AAPxfL?=
 =?iso-8859-1?Q?Dv0YlXq0p1ViBlIV/0Zebtm53guhRU/NYpKSaOKi7OILQ2KEH+kH6/BqmV?=
 =?iso-8859-1?Q?kvYwuVFi7HOL7Kz6hk/cYV6dryPUFglMsI77csLvzNyq6wFO4H9/lQz3Uu?=
 =?iso-8859-1?Q?OES4rI8BZWU3LBkNbIcZdmpTmWuOj1FBVw432km4T8B4vGbFZD2Ppr8iY/?=
 =?iso-8859-1?Q?mQuEWVio42uyKZeuQ2dj3trmFBm8MrBB4vIHqAXIKj267XWJANbt6mb7i7?=
 =?iso-8859-1?Q?O6Ts4Oeq5zoWWs+ryfbEzjL6a8ukbU/8YjY/bjKpNRzP/FJKBUwKJ5wQja?=
 =?iso-8859-1?Q?mftEhl/lW/cCWsAUX3Ut0m1t9TP4akrTBStXkaTtf7NlcEjFwuI8GZKWGn?=
 =?iso-8859-1?Q?5IgoiIRFyZg9a0ACd4xzE47AiZZdfuMHiyLSU9mJ/AA531ull+OOVMu9k+?=
 =?iso-8859-1?Q?B0TCOafmV4JAM7ereEBuZK37MZtsEbxlmYbF/eruFul2/kKHbzq2TsQ0RU?=
 =?iso-8859-1?Q?EaD6EkTIS3ylglIWA05nObwxR+WNLhZqGUk1tJWCUXHSwPZcSCd09KC6ur?=
 =?iso-8859-1?Q?kPd8Ne3gWGJTNQvg0m/TzRnyyoGhStwh+feOgM4wUPZGG94FleZtsPQ45P?=
 =?iso-8859-1?Q?rZTzBHYmFONeUEQKP1oOQAzYeh4zyAYqKKcHjEiG7q42tjpb0KpSRolLM6?=
 =?iso-8859-1?Q?AAuS8Z7x9UG3j4ffW/l1MDLNuwCjdkQ5s6sixaF9VxPqrDdmrp5Akdskp3?=
 =?iso-8859-1?Q?G6Wu6GxSkf/klXkMvdU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qOBFGCVbcRr/amwiLqf31k6/NWQw8F+4itz0aOPCbadSMEIU8tlRVP/PKX?=
 =?iso-8859-1?Q?OjSRBpM5UtrJ9u1IRb3d7R3Rbwpq8o8ZPtcCQh0s+P+49hEkidyfsSzf2e?=
 =?iso-8859-1?Q?iw2bIKpu5DzR7byuhg/9ebDlXdRM/Khb1yG6uWgIX21HQoDjFWkpji4VIo?=
 =?iso-8859-1?Q?fC9jGe+PzQf31E/48lrTHC2eRM50Y4vypEw5DEpYXBCifdG3lDfoprkNUk?=
 =?iso-8859-1?Q?UtLAoAd5wfD2PjpyOt+GmM32tjj++GQ5UaRbdHricZI1oKz6GWt3TNkaud?=
 =?iso-8859-1?Q?591aYQa6Jk8uGfnpRHnrtpPjbCag54t1Bm4JR1ro88hDojXIjwQe/n4F8w?=
 =?iso-8859-1?Q?g6pylgHuFHD+TSWzBM/qnjjVWzzZFPWbOZeG2Eo2IpQPpvPLao+DhUTIDu?=
 =?iso-8859-1?Q?nT97FIWGQVmtMAr4DuzM5rGTTQbGyx0+Qf/4ut4/X5fW6bCrRbAOZE8wOP?=
 =?iso-8859-1?Q?BAaw71BbOiKaJyaI7nHh/5HYqbvJsZz4NjDiu5qbDi/6qvdldgGP+Lr6lf?=
 =?iso-8859-1?Q?Z/bdrO/UMJf7zcMGcIzl394Z1Q0KkpAVIBbgbscDnOtJ0w9MjLBrnX2LMc?=
 =?iso-8859-1?Q?5kSRJb1MrBeNzP/RXW7VDf90QiEbWbbQEx4ySIptETcI+MeGupNJjbrMku?=
 =?iso-8859-1?Q?t2NgTnTQaFqG74MaT2JGxaz1dktiyxYiLw4ioF4oSbikfoaugc8o/owfpl?=
 =?iso-8859-1?Q?Aw5WrTRYyVKzDZR0DdKk+Ro8Pi0+DxIf8Ehga91iTBs/Xo7BNzQQIVCu7O?=
 =?iso-8859-1?Q?Z68qIq1vvAs7ZBR634CdxD7UYZZvhbJh6WTtSjB4oUUy+yUGKuKKeAlifQ?=
 =?iso-8859-1?Q?tOOQedzfAqhz7XTiRuB3cPM4af/SohaCZ3H/2lkIcU6vYHMYdDZL+Lx602?=
 =?iso-8859-1?Q?fWPAk4t/9xU6yLgKcrHUagRA2T4N1RCOWjKKN1Fd3Jqx2BpcfMG1lMfB5w?=
 =?iso-8859-1?Q?3kXf7dkNgUke0FiAdkRPjVkNQAS8njIGgUG1FJi6GT+HWSzGDXWgAJLphc?=
 =?iso-8859-1?Q?digGnUiD+gd+XVsh2jsORRZ9VRVDQlBS0b82QiT9n0Qk8WHGw48+CYwmA9?=
 =?iso-8859-1?Q?SjFJGLCYlxqQCepfrXYFF7Le76Px/TivwY4yDvKaTPqFF4EgjHVbFjsupY?=
 =?iso-8859-1?Q?0y7AvSts474Ef8yS0JDY+0Of15LN3TEcG6lkWnhGgHHVKCq+zbaFXQOiog?=
 =?iso-8859-1?Q?40SYgvPcX0H34XYrXib827NxoVFE/Ep2UPA4NK3pZt6ncNUwbmn1M8lc7z?=
 =?iso-8859-1?Q?uKTBJSbpWL3vG9B2n870C5BXtDm6KjZdDc5Svc29hBaw37MKISyJTAXgYp?=
 =?iso-8859-1?Q?DFOPfLb7U4Bppbugg3rcLHGaAkhHh1y74lMcCS9s5ePmlSMV2NWncKkzmX?=
 =?iso-8859-1?Q?60YkVcEWFEA+uWkuEAXC1WmxRBWG9zFv0TKsmAWbtcBczomGZh/nTQA0Ui?=
 =?iso-8859-1?Q?LeiHz9gNKvneGAq+HIgacGv/CgHvQaJOiy70uyz2m6x0+9lSwpFJ9wVY5P?=
 =?iso-8859-1?Q?ZO+RFVQtrbbz0Mo3ERuKFmGXGj6zOcgTUkw5XX2qzAS55Q9IQbdxXL4cQq?=
 =?iso-8859-1?Q?0GgcNzFETKSpbMjkNoGevKpB6KgJ2AFoYhiuqr9mlm321lcKO2EEN7UsjC?=
 =?iso-8859-1?Q?54t2Nfy8WqKuypg8P7oUx9YU+dwve5wRF1vF7RnaK88SPOupSfM2ub7CUi?=
 =?iso-8859-1?Q?SHZq06r17v1iY7PszkwDb1y43XFn3A4UylDxKOUo9lvWd1qRwOFPA1XhFa?=
 =?iso-8859-1?Q?ybEvQWkGZyv7Tkt0PS2nnrCfT+5OV/eNiZgscRStXP8Q44?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48f3ec6-c86d-42f6-4391-08de6a218e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 10:29:08.4263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMa0sO1avjDbWmNdHsjS+Dzl+Nvx0SbBFpEWOvPYYie+e37qeTIbb28PNBSLk4uZsOArp92O3/TLUK5LYPtbDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB3598
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lYruajlEDpu25PMSSBbBzt27+k+TAvZvxoGybEoBo4=;
 b=qVSImo4q/vbESw7gkIqmcwpRcXBc5MZ6c8zwxYrDuCIZTdQ5mzZj//8D2227QTDf+Yu0eYgWzzWXHzRn+G3ZkDJ3XqQRLU7gisVD1oUgkTumU/b02TCfBtJbP6wUNdlcZtpsX0Br5C+sM9fp6Wp0eDApilc3lie39hzQhdB9dY4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=qVSImo4q
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/coremark: port for mips-i6500
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Andreas,


Thank you very much for the feedback.
I can only assume that the mips-i6500 files where different, and were
later reworked.
I will update accordingly.


Best regards,
________________________________________
From: Andreas Ziegler <br025@umbiko.net>
Sent: 10 February 2026 09:01
To: Jimmy Wesolowski
Cc: buildroot@buildroot.org; Guenther Harrasser; Chris Packham; Vladimir Kondratiev
Subject: Re: [PATCH v2 1/1] package/coremark: port for mips-i6500

EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.

Hi Jimmy, Vladimir, all

thank you for the update, technical remarks below.

Most important: You do not need the extra files in the mips-i6500
directory. They are identical to the ones in linux64, except for white
space and the copyright inserted in the file headers.

This would reduce your patch to the addition of EXTRA_CFLAGS, which is
probably what most people use when adapting this package. It also covers
my current customization.

Please also check the output of utils/checkpackage package/coremark/*

On 2026-02-09 13:20, Jimmy Durand Wesolowski wrote:
> From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
>
> Compile for MIPS I6500 CPU 64-bit, with all compiler flags as
> recommended by MIPS
>
> One missing flag -s "-Tmsym32.ld" since linker script
> "msym32.ld" does not exist in the MIPS toolchain

Since the actual flags are part of the configuration (EXTRA_CFLAGS), you
might choose a more appropriate commit message.

>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
>
> ---
> Changes v1 -> v2:
>   - do not add mips-i6500 through a patch, but copy it through rsync
>     in POST_EXTRACT_HOOKS (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>   - allow specifying a port directory to use through kconfig, such as
>     mips-i6500. The default stays linux for 32-bits architecture,
>     linux64 for 64.
>   - allow passing extra PORT_CFLAGS through kconfig  (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  package/coremark/Config.in                  |  19 ++
>  package/coremark/coremark.mk                |  23 +-
>  package/coremark/mips-i6500/core_portme.c   | 336 ++++++++++++++++++++
>  package/coremark/mips-i6500/core_portme.h   | 291 +++++++++++++++++
>  package/coremark/mips-i6500/core_portme.mak | 140 ++++++++
>  5 files changed, 805 insertions(+), 4 deletions(-)
>  create mode 100755 package/coremark/mips-i6500/core_portme.c
>  create mode 100755 package/coremark/mips-i6500/core_portme.h
>  create mode 100755 package/coremark/mips-i6500/core_portme.mak

The mips-i6500 files are unnecessary.

> diff --git a/package/coremark/Config.in b/package/coremark/Config.in
> index f0e13eda63..bb29a8093f 100644
> --- a/package/coremark/Config.in
> +++ b/package/coremark/Config.in
> @@ -6,3 +6,22 @@ config BR2_PACKAGE_COREMARK
>         used in embedded systems
>
>         https://www.eembc.org/coremark/
> +
> +if BR2_PACKAGE_COREMARK
> +config BR2_PACKAGE_COREMARK_PORT
> +        string "coremark port directory"
> +        default "linux" if !BR2_ARCH_IS_64
> +     default "linux64" if BR2_ARCH_IS_64
> +        help
> +          Path to the platform specific port directory.
> +       This allow using a different platform specific port than the
> +       default indicated if the support is available in CoreMark.
> +

This block is not necessary.

> +config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
> +     string "coremark port extra CFLAGS"
> +     default ""
> +     help
> +       Additional CFLAGS to pass to CoreMark platform specific port.
> +       Any additional flags indicated here will be added to the
> +       CFLAGS_PORT variable.
> +endif
> diff --git a/package/coremark/coremark.mk
> b/package/coremark/coremark.mk
> index 9ea8693e71..3c367ff90b 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -9,14 +9,29 @@ COREMARK_SITE = $(call
> github,eembc,coremark,v$(COREMARK_VERSION))
>  COREMARK_LICENSE = Apache-2.0
>  COREMARK_LICENSE_FILES = LICENSE.md
>
> +COREMARK_CFLAGS = \
> +        $(TARGET_CFLAGS) \
> +     $(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_CFLAGS += -DUSE_PTHREAD
> +endif # BR2_TOOLCHAIN_HAS_THREADS=y
> +
> +define COREMARK_MIPS_I6500
> +     rsync --archive --update \
> +             $(COREMARK_PKGDIR)/mips-i6500/ $(@D)/mips-i6500/
> +endef # COREMARK_MIPS_I6500
> +
> +COREMARK_POST_EXTRACT_HOOKS += $(if
> $(BR2_MIPS_NABI64),COREMARK_MIPS_I6500)

The POST_EXTRACT_HOOK is not needed.

> +
>  define COREMARK_BUILD_CMDS
>       $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> -             PORT_CFLAGS="$(TARGET_CFLAGS)" \
> -             PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
> -endef

PORT_DIR should stay as is. But you need to specify COREMARK_CFLAGS
instead of TARGET_CFLAGS.

> +             PORT_CFLAGS="$(COREMARK_CFLAGS)" \
> +             PORT_DIR=$(BR2_PACKAGE_COREMARK_PORT) EXE= link
> +endef # COREMARK_BUILD_CMDS
>
>  define COREMARK_INSTALL_TARGET_CMDS
>       $(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
> -endef
> +endef # COREMARK_INSTALL_TARGET_CMDS
>
>  $(eval $(generic-package))

<...>

Kind regards,
Andreas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
