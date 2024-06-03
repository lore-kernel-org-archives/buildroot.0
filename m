Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0CBC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 05:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF5940162;
	Mon,  3 Jun 2024 05:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 638lY0UQVso8; Mon,  3 Jun 2024 05:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1EC84022E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1EC84022E;
	Mon,  3 Jun 2024 05:02:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD96E1BF3D7
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 05:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2F52607B3
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 05:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6-BDHLmvIHd for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 05:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7ea9::621;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BD9B6077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD9B6077B
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BD9B6077B
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 05:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPWzDcSh+78BVUuRfU38t9UEHFEryP1n/6pGgC/zeOBaObsBWUOmWkF4+3xXHfrxRdLySAMRrg2w225pVevxMZDlWjURrZGmngqX5BXl1Kn9s1JOKIOX0B4GzM1b7S7xHdfED/U29HsafmPXTc7b2UgfJzjwszvQviZftojghuGj04FmRa25WCV2ygIhCrNhpPgU/l8ZWrZLgxSvrww3PzViKYUA9DJr8WETicNk/ht7zE/qS1L5HaDxxLLTKTrEozs5xZrD9YAsvpuRH9Ii/4iEWCttzzTml+oVkoy8YRWEk9kb7G9DryLBqh26ZGTxfFHrk1HqC35H55CB8JnL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gxh5t5QpkvVfdEFrtJvdFPtC8PXXqoS5NAFN5c5Yh0=;
 b=nlj2S74uow7C3F3miqlGSn2wVn/IVs3X+elKrARKr52R56bbGwyALYv37rZfYYVO12F76cmr1JBxlkK6xsCJeJCJGIlI4takL7JHbZEMQAPVmItstbEednFFloh2B62mP975uiYQmj9qBk4F8gKtP2/HNf9dvoAF1mXf7yNK+KPAOp/MERi8cRBHR0xl4zBhbq0xKBp5f+icDS7sdfE56pO/XZRbGbfNUVJ8DuZhjhN/jhKPnVQomgyUU7EXvZDlvjY/YiDIPh/sMsZJloTsonC81OiscAHtpJJ3PMMHV7n2d3k/B5x31WE8LQ/1riCiGpRDj6qQ+yMYVsPTc+yz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 3 Jun
 2024 05:02:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 05:02:27 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMGoz5QfJpYlEmY1g6km7tPO7Gk+GOwgAAOzACAANFXcIAPtOww
Date: Mon, 3 Jun 2024 05:02:27 +0000
Message-ID: <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL1PR12MB5924:EE_
x-ms-office365-filtering-correlation-id: 10b85707-98f9-41a9-0700-08dc838a5d79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?4nGWvFd8NpFut95KkL/1WD3+H8NOYO6TDCa9aEVju+blTtYyFdNo5dvDAtIH?=
 =?us-ascii?Q?XmsSGLZMyZmkOflrXrf6+XYQAaVU1reVAeJsnAnOoxZ5MrlNLiJevQlXej4Z?=
 =?us-ascii?Q?RdLMpR7eRI7UvRXVv9rcFiKyNA0Y7sNPN4vPif4YpGINPrxj8OQYZ5XTDmFs?=
 =?us-ascii?Q?ZR/LRZIBXUaoAM04IEnsLKpDUkXt8bXLSnyr2R0/ZCaFBjUl5bU/Z16WenPR?=
 =?us-ascii?Q?t2yq6wnkxJYTb4FduChzO9dl/9gwgaZzozhPtkT0fv9/I2PXexBVV6sLUdZo?=
 =?us-ascii?Q?/Z9VVBR+VrWmUo5Bz/27rzv9tmtSVOS3uIeOmIzAjAa0L1NBQY8UBAkwDxiW?=
 =?us-ascii?Q?a5SYAvhrqLItMbAeiURTQdpPWR+CadTRRAcopci3ZQ6aJJ/pFcBB6ugfKuGj?=
 =?us-ascii?Q?9nobkpln5PC7ELRqp9xe4OCh7CQG96E/j6EDiaLQ8/7/kS9jS7qh3hDcBEGy?=
 =?us-ascii?Q?Ip6cP5gKOlVyXSbCRZtwN2HW+GaRBQmPy1IvHmSlfSsOG23aJ2OLgj3kVW/A?=
 =?us-ascii?Q?CTkWEJ0HLl8b5Sj1cJ9tnIbLHwWLN7+vH42HnbPMXPuYF/jSzQhZUYnshLgS?=
 =?us-ascii?Q?8l5i0wxGavZ7bkvlWqHSNk5qIOSbaxvZ84WLo4sm0B/DaRVxMUf5InIEDkHt?=
 =?us-ascii?Q?s61yDArKmOiI2m6qPWIQBZz6LuDf1w0VVGm3n+iuVklqzWN3+aT8noulAXfW?=
 =?us-ascii?Q?dsZr/oOMCCA1F7I5dKFmY0cobuIUC60vBfREx+df8KuOctqS4S69YBpysG3e?=
 =?us-ascii?Q?qNvye/iPTps0wRGrOm6d20ZqlFHdWq926StUXLlAwbQ6fz6bTO1yzYy+tcR7?=
 =?us-ascii?Q?CXRsQxAxM9Ir6RbXanCgODxbwPHPXSXFkvsw32x68rNISU+DKQIqapijHZRm?=
 =?us-ascii?Q?mjvCq/UVD0nymAZwOCENyuZVdXSuaXComAgeofGtMKjHUaXQBgtL+XVrH0pa?=
 =?us-ascii?Q?19SeXi5NMcUGJP1dSYONDx6vKlmykKbD1+kWIJzBK2WRWh7S20kM3v8Ks/S3?=
 =?us-ascii?Q?tnG5EZpZitg1rCgFrQTziwvHXF8BlmzqDK2qFUsdE+nyeV+KnwsITyTzVQpA?=
 =?us-ascii?Q?EqpRqRnrobYzVAnf9objaaHjvHI0ZqgeCPVB+pGRLTekdsUmvzWeFlovUem3?=
 =?us-ascii?Q?ARzu6EhHnDTlI0rAreV0PSdFsj+pB/Suucz+LpGJSkWIYrYPWBjiwAOcuK5q?=
 =?us-ascii?Q?HtgOMJfEuWkFcT6Cs4bJOdPjelWgT8LKQZlPdILmMkDDB2MfZEVXFWgo07ff?=
 =?us-ascii?Q?OCHeG7gBCCbLHUBOKvHZGuA8YSePibEX7GmY4lJXxw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1g2r6sKsG4Ia5uo3tntsVHiVZrlGi+WS9XmXTwC2No80CWGrzGGbsEZ2/MXq?=
 =?us-ascii?Q?Boba7zTJuxFDljI3EA2C8haz2qLtC6VwvczPxHmGDEXO64FCxrEY/PLAX4mY?=
 =?us-ascii?Q?Osf1IJFNlVHuiF+29TqaVZLh9GB2+LISa0z2zgpbkfNev6XLInP0NBUl5q00?=
 =?us-ascii?Q?MHUUr9kB3q55NEVI8SqejDlcy8WiK8qWhpGzMTvu4EIoUxvw29CmA4TUdpaq?=
 =?us-ascii?Q?m/jGGmxBIxf80jdxq7GwAz192FdUPzuvRpgciA6JNcuK8c9T8NuhjNn1OK4p?=
 =?us-ascii?Q?D8ET8TUTbX6E3nT8F9FmI3FMGa4E0QS4Dnbq9PY22KQQhbCVVAz/yDXU0jr/?=
 =?us-ascii?Q?XWsPEAXTmBZd3EsNAVWZHw1ZI9M/Nh7dEQiYvzkBZCCaAbXHZjCZiMhHwU+a?=
 =?us-ascii?Q?pBthrbUVfTWSu2O4JmUu4PljhpaTJo6vEEDW8cG2LwxWsGlKbxCsS4fS/osz?=
 =?us-ascii?Q?+GaGM6vvquxepMl5QgO5Lw4cZb3IkSj0IBuV8Ebn9r3zUWrOms/oqD+7Mwh9?=
 =?us-ascii?Q?mImj4i2cholXpGusCjYqUfn7Bhw5zEqedSyZQjGkwDvRynapY97TJ5+a6X9H?=
 =?us-ascii?Q?PKis7gfyYFn81d92Lat//3qNmXLHkAt87dj+KFLhUF+yAxQ895x6Bb5dCT5p?=
 =?us-ascii?Q?ePVyqB0LSf39q4Iwh5mfTTsTwGUapoeUbWYEHbsgV6QWoqhkEIVf1SHupbhl?=
 =?us-ascii?Q?iaLnZrDOYJKn+xcrK9Z+TnU7bNuydb8QnTDQC2AXN/o5dyV3EQUaqGdOQk4S?=
 =?us-ascii?Q?ePUAE37grJ7GAKi9R9PdwfqHpiEtVjp9cekzL4uVz5zMRrOwhBoEVHllQr7i?=
 =?us-ascii?Q?QLri/YJfReQkmQchuVSuBPukK+JJ6uYxyUwYjrlGdy3cOrLbM/Dn0WESE3CW?=
 =?us-ascii?Q?06MBeQqrpdTfsqzfjxlS1GEAC+MYFPZiGMTgeXf/yt4lSuQ/+QGO8iKSpUbF?=
 =?us-ascii?Q?x3KHdfgQaSQ3ruTxJyP17sLXxXvV/6UOex8IiXJN9IJUjloUiItgVcnbdzsQ?=
 =?us-ascii?Q?ZkOfqObdc21TmgxezPAm0uIycbuQODS/xiGxULTcXlYQds54H5dG5TXhaqCG?=
 =?us-ascii?Q?anPTuct6f1Ta0MfCw9NAL9+1OXFHCjpEYFEoNoMPgBwmBU0UKe0op0zRbxKK?=
 =?us-ascii?Q?sHr9MNBwWvNEprXXOkOv5HCFYBd4KouMEvawuqKa7xX0NYqAu+VjIrgWxkmQ?=
 =?us-ascii?Q?kN4AS9pJaQyRPD3gDvPecpeoqqTtx3EznIhhWvHPam+JjeobwbuA9daOSGn4?=
 =?us-ascii?Q?N8nT8I9QWv5j489uXmJFm802qGl9of6zb06mM1ooC+QUL/bTN0TozIH5wp3B?=
 =?us-ascii?Q?f1w5o0FXNQzbmnqmBJkfq7xiNYocp7bnmhpQDu8pvU2Z00Wx10t+s5BsVSh1?=
 =?us-ascii?Q?T1k4//s8Y5d+jnA3cghoAkgYDVGaONo4mJ4dzsHh+mwWqX1j1b1BwGKwr4JO?=
 =?us-ascii?Q?2t0uvajEQZb1dQLS3XK+3A77cARvtV0PdOIHs3VZiftGKU+F6xPpG4KjpDh4?=
 =?us-ascii?Q?F8qPnRxFMJeoX/cQiPnmcqJQcCgUD1aZ/jYD8I5ty3IyRqDVX3489A9k7EPo?=
 =?us-ascii?Q?IhLsZUxlTvNWMunbxWcY56z7Jf3VV7i6a8aHcRSPzK4sQHIyhDQ/YUda8XHM?=
 =?us-ascii?Q?3ESlaGXqvaUTjRtzPlX5Glc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b85707-98f9-41a9-0700-08dc838a5d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 05:02:27.6322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBKY4uy9lvTIz9+3QTECimOj/TSk+q+e6VUsafa/x0TG6NhBFBWYaD5k8aNqkOGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gxh5t5QpkvVfdEFrtJvdFPtC8PXXqoS5NAFN5c5Yh0=;
 b=fqexGpEANAlr+5YCp411hbrx6KovudiWRKCJuGVy23sDNSW8qY5EuJkmHQP1Zg7uBIAyyUYpSH7571DaDCoRBVd/iEyzjbpdejAm97alGIuAaI4BCdMS+J8ylcla41K4hAbVRfVOmbr7yz8XZqgXXUd6kE1qhQWk7a+XHfcI3cs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fqexGpEA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

> My only concern is that this patch conflicts with the following patch set which is still waiting for additional review.  The patch set below changes the versal-firmware package from one that downloads pre-built binaries to a version which builds the binaries from source.  If the patch set below gets applied first, then the hash for the versal-firmware-xilinx_v2023.2.tar.gz
file will be wrong.
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=397588
>
> Could we apply this patch set first, and then go through and add all the correct hashes for the zynq, zynqmp and versal defconfigs?

> I'm for that approach, I will decline this patch. Please CC me when the zynqmp-firmware series is applied, and I will spin hashes for the Xilinx boards.

I was hoping that the zynqmp-firmware and versal-firmware patches would be
accepted before the Xilinx 2024.1 release, but that does not appear to be the
case.

I will be submitting patches to bump the zynqmp and versal defconfigs to the
Xilinx 2024.1 release this week.  If you want, you can add the hashes right
after.

I will then update the zynqmp-firmware and versal-firmware patch set to be
applied on top of the 2024.1 defconfigs with the hash check.

Ok for you?

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
