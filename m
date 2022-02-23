Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743E3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F3F80CF2;
	Wed, 23 Feb 2022 17:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7tb8JPKKwbf; Wed, 23 Feb 2022 17:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6820980C1B;
	Wed, 23 Feb 2022 17:43:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFEC1BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A1E40124
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sa35qm52R854 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66D24400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHULoU5gJD/qoqrQI3gEFa67vIdDI1T1kWnpEuaTtTJ0xUOtiU0StfLpOzZmpAvXQbQw5opeqjw74kANayMTlU9khJPeqvSXPik7cdWId86pCy0fHu0hxXHhq+ZkpUxVilDsbABKX6NGD2gsgfx88zW4VioipNmk/y0lOvi6NooiFCoqQodeu/xdoBCjyuWhBL7ATeQKtGAgi0e9OHcX4BJ/Wjxz8UvNSUN9bctUjTaFcHsNwAEKr9KOADs9Z2uq8LAy7JRC2mskoqINWY7WBn/Yte7ojlD8Lb6I5zKx629/8jkvgmHStCTPfdvSiJ0EE+mA7wMmrv9OsPFAgyeoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPG2HUSSebCxwUGdwUUn0XsdBXfcKZYmxkYoE+xawNA=;
 b=lw+Ekg75C2cvseOqOhFz/o2m79a6mP8M8RHQEzDUAGVWdndySU+kDLW9Q5LQAiRPXk0BRdNHi5JtsQXUSUT9sG3feELvzXkezQI8GaxwCmRuSgpl5tJYLEgShnXcJ4PORU8DkDUdBF0W3oLRdPD+y65B1oThnUDH+21Y2sau59pt16AZB6jFHKX5aqTRPihPLKxu3fEW7+rGI68r0ibl9vMf07da3YWIJfVxCUtkSPDEdqCyRKVf4tUuLZy8hXBbB+TZGi8kySdmKqvcor0y4kqlPgeGDTetvxMFQFnL55Ddty2VJt+ridg5+dQJH1sPSIXYMFqrsyi1yOJsDRtEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPG2HUSSebCxwUGdwUUn0XsdBXfcKZYmxkYoE+xawNA=;
 b=DUtwLwmPdg2mRoDa3VfSPcUZ1P6fJzSpr4S3HFEd49imafxFKlp42F76S14erNN2vni/gquvC1dWBmumR5zJA4yIg8gGYj4NP1/mbGcpk1w+B/9lbd5hG5hh/roX4k+X+6lm5Jv67IuJUVqZPnyUOqoDFaA/XlUhBKyBd5JfkMU=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN6PR02MB3298.namprd02.prod.outlook.com (2603:10b6:405:6c::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 17:43:49 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 17:43:49 +0000
From: Neal Frager <nealf@xilinx.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKNxzGiRMZ6pRX0KYg0mwc1V7QqyhZ4HQ
Date: Wed, 23 Feb 2022 17:43:48 +0000
Message-ID: <SJ0PR02MB7758A32966F115F4E2E85D2ED73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223173938.3307529-1-neal.frager@xilinx.com>
In-Reply-To: <20220223173938.3307529-1-neal.frager@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6320bedc-aff3-4243-236a-08d9f6f40c6b
x-ms-traffictypediagnostic: BN6PR02MB3298:EE_
x-microsoft-antispam-prvs: <BN6PR02MB3298BE1F91994B4D516C33AED73C9@BN6PR02MB3298.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: knlaet7lavbaO/O/fDfsG5shyA4mDhVAFbQag7F8RaI2p5SvVVBhnDHnA7P7lcIO3tHVaeKpWQzxd4DwuK8DpOPJ8MSare+Ch7W4VB/2LQaW03SbCnwfTAZVQwaDf8tfBrMjEj8c4kP+ADHyMmXOLbGVP633q0Dp+oaxWQ8KJyff4ACJ8BVseX2g0dcJuZNTe7PSdFBYuyr6dGUAkoaECt438fNkUVzuqqXuYexoAcj2ILh5czEyYoEA26VIWXXeq6H3PaE0JhN95GswaWA1+4upGRTH8/xGBJyardD3wm9EFiTet6F6aMCLTwxHVsimhnV+1YzCY8ArTkmSUnMQILF68v0gwfp/b1ONos3NfxNOnEWUwD+Cy+b9st770aPsQfB67eBCIq7Vt599syJdOkJN7EM63TyQc8gwYAscbmgTf5EIX6ERA0+wZ2tCrC0sgL3whjcGn638jDcnR/TywcXTHBiOTRs7Ny7/K5Xm188YpR+yUcOwpOkTA3nVSGwSsGrAKon/b/JvFuNoJklqTK+5SDFK8L6qqi/hR28QDsE0s9mj1+HKkPgpmRI3JEZwLSZlQdJf5VYj03JzaUK9o+Zh5UhC7erNBbEeeII+3wkluIYtLWhef1IiQc8tRzqP2YPlqc43P8lK1j/0gLt4z1XS7M7O+nXnYaDyXN3LMEUsR4rL1caEwekuR56B7tAmB4gVkZFieu6cWKvE4y1/TA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(316002)(6916009)(71200400001)(26005)(38100700002)(55016003)(54906003)(122000001)(186003)(2906002)(33656002)(66946007)(8936002)(8676002)(558084003)(66556008)(66476007)(7696005)(66446008)(64756008)(86362001)(4326008)(9686003)(508600001)(52536014)(83380400001)(5660300002)(6506007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CB6aUzUDyHyFLn2oIHtc8D5Hmq3JXhz/Lb9V784et70scomVvYhSKYZJDWoY?=
 =?us-ascii?Q?uXHfN/moC7AJhzvxPpQH26NrbhkjusqRUsAFvGO9Va4sIMB+2rFAojM/S2d3?=
 =?us-ascii?Q?O2ly+WnjRTvZcV3o9ActJymV386D7zQcnUfwLOIIegcMuPv2kiAMdW1xSMcV?=
 =?us-ascii?Q?0VAoeqnwJuXfwXe4aaQ4yEcIcciuycqZEmHew2F9SNufgOpd/8rJwAImXN/B?=
 =?us-ascii?Q?08i9UjTh3bFQvcQqEtpWf1p4QdgK6jY0pSwImUwf7JBjf6MVZ4OJFNP0cBVW?=
 =?us-ascii?Q?jJzRdvtD24zLy4kCl+otxfztmCQVlhh6/+GGoZkb4ove1MXTCms9R0+VftMQ?=
 =?us-ascii?Q?xwZhUv1l7TzsFK8Qc/1+llkWXlHIjPJwm7CX8hvbjere9PwMNYr9T7cKRTne?=
 =?us-ascii?Q?iR0i/7wSxM/OuaJz7VzUTxib8wu+gk9Ic2J0w4QgR6NeWKhl/yqVLJFe/j2P?=
 =?us-ascii?Q?J8ykzpq0jtiMKIEKAJCcz2E3La5NT7mDPSf7EgEMqo5U9nhOzHuAIU6sNIxK?=
 =?us-ascii?Q?iShZM6l+tctqj6uxrT9ewZ0H+3Lg5JYCZYZuhHjLJkCuA8n9DRbluZfB+uPp?=
 =?us-ascii?Q?ZQr61AlZoBVtpUIOz/NZKkORV3QLBGF8YGlNaUVdhiE/1E7yWaM5ZrCqoXAf?=
 =?us-ascii?Q?6Gm0TV8Blz7DPgJKr+VVL2jvPc01zk8t7XX/SqoBWdMdrJGuc5aTiFUIlauf?=
 =?us-ascii?Q?dBIAbenrcK4fQR0QrniA3Gnbiv2NjWqVm2zEiE44gh6z1YuYAkG9IQI9L/tf?=
 =?us-ascii?Q?OPkcL8ptNnxnXAypfGikuQg5955Z8K+0LGP5zqz4BdHfN7mhuJQpoOKYTZDw?=
 =?us-ascii?Q?nHWcyVT8RRtPeQubjl10qtvalIRSdASGBdq6l1pyduOXj9SpUTbulgRAzKmv?=
 =?us-ascii?Q?pfSlNaA7OuGF9d3+L/t9a/p2p8RQniQdwkOvNVs7j1k1O6JVtX8c/bIdyEzB?=
 =?us-ascii?Q?5zfuRzIOKqg1qYVrggbGuXFG9p7tizLn8Oo8PgFwMp/5NQ+X2c3paxbxTKql?=
 =?us-ascii?Q?TABAUmQ08hLPC9HqzJhjgLMzh1HO0UM8grDYi2ZVmhITOuJmMt1nJMV0tplc?=
 =?us-ascii?Q?NxyEf3inkVYcbmW91wISVYQg4YhysmpeyKRc6RhU9XYUqYE5+6AJIgQEx/Qr?=
 =?us-ascii?Q?Ph9cCm9j9tblPv7MRyujoHiLo847U2aHcvLwy1jSsa/rus8vx7GSLlYwyO/J?=
 =?us-ascii?Q?gKE7Ms06HnteM/bB5u7CiLoW/LY6SlEKec+4vyvo1uCL9BpTUs0GeYTjiveI?=
 =?us-ascii?Q?GiluM8hG57OwQM4ik2RDXtrAFuU0r09OfD2rY0OFE7ZbEXz2AtF23lzV8R+e?=
 =?us-ascii?Q?KJaALHd1B9ODiEuEYpeNlT7+SqLQ6g/dDmxui+5Mfpm4IqMRIgnivgGPyb6J?=
 =?us-ascii?Q?XsOsS7sLvAjok6p+kux7Q6F6yOwu0g3WPA5uxqJOEIF6bLgt+GSJJCfChkTS?=
 =?us-ascii?Q?eLd6n5FlWanRj1gs5M5dCX8G4FKJGwti/Jyn1v5i1lw0nnjf1zcNadl4WhIY?=
 =?us-ascii?Q?w+VjKZLM1VO6xXg/wjf9oGKjNzKlqJiYtdKWqkTB+4gYGC8hoQqUjfajTX9h?=
 =?us-ascii?Q?vl7GZD3nlkkVTFF5/PA1YmthYEaYUqRoDggIcxodCqkaRiKVAR4fapuUE/fp?=
 =?us-ascii?Q?Ag=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6320bedc-aff3-4243-236a-08d9f6f40c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 17:43:48.9499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywXf3I/GCJENd10OLLMAWKhIt7cmkBXKVt7V2M0YPNMwe824lqqhV5ZQTHF8RXraU9pbPAHKxlW1KQNSSqp8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3298
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I just noticed a typo on the zynqmp_zcu106_defconfig.  I will fix this with v3.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
