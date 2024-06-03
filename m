Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F20C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 098DE400EA;
	Mon,  3 Jun 2024 09:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGjjOT0NwGbO; Mon,  3 Jun 2024 09:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1392840109
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1392840109;
	Mon,  3 Jun 2024 09:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 968521BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D3581EE2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vocR0I-v2LEb for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::627;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70E9381EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70E9381EDC
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E9381EDC
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHdEXZfex3CtyIQuF2n453aaVbqcMIz5LovJ2T5Oz8pCCa1kRihO9xsqeIT5okLUOuaiLMBODIOFHW+R4Whtpwa0NyiNFgn1ruSU+3bKMXKY360OVrNGgH9kddWTgPMcAolsFAWIGaCrPkCZZJ5Mj05GdVZ+9QdzgW8Fr2Z9E3n7YbAKTkFKdR28Wtc2vt7E7CmXylqd62ZnL1k/0IQA4zkCRp+1Xl4HjEPr77CBUSmUrHYfMafzNP57ydlukQTGlp9e3xs1Lzj6A9Y0reF2LlFeiLsqNp4TgOGrn80UvpVyzzPuX/pEmy0E4DZlostLa06nEoLaPe7wI/8oBjUqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyCK1EN9by2AGSIadLvCoSg9DWn7m2qhbUcGjRWWFJ8=;
 b=a9raokBi/FgG3VNenB2b0/89KLacXAOeNq3sXlTs2t7eBAb5W2e4tk8eqJMLpftvvBbHhUJCLUi2q0R7ZrzTSZl/dT4Eh1mHLDYyGP6D3IRvSNBXLZ3yag2nK9hCTcC1XIfTIsJUC6qih0blzKuJuf6cYCPqMqHrVdnbKY6lPIsLr36rWa4Bih5gs2kBIejP4JqtDfHbKdSjPBcMpz6cmA6Rtq78DmENBW/vG12YnmK/6fiN85B4QxjasOgUtBN2zqqTciLH5z5G7k0aG9pbiQo+whqKBq9/SuIn4MAtuYQ8UcaMOpz2ANCtyuNBqfgGUR0vZnLpw2vTnmqZxIcntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 09:44:25 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 09:44:24 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, 'Peter Korsgaard' <peter@korsgaard.com>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMGoz5QfJpYlEmY1g6km7tPO7Gk+GOwgAAOzACAANFXcIAPtOwwgABNe6A=
Date: Mon, 3 Jun 2024 09:44:24 +0000
Message-ID: <CH2PR12MB5004E338086FC3DF5D1A8EC8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA3PR12MB8804:EE_
x-ms-office365-filtering-correlation-id: cb6b9aae-58d0-4e38-1d66-08dc83b1c0db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?JO9LduUvDA0RoQxIT2I2vj0fNIvOtit8PlfAXsyhghweIkJvUoZacXJs/tza?=
 =?us-ascii?Q?FR1Z1f7aFhqthbJ05T1CQAHvyAZiBZGuq2ZDRwjwpSMPyNftQhf1bFlVCieL?=
 =?us-ascii?Q?/HmZCRvcmTPMvBQRrPS/1v69XuWLJfpcq1sLuPqs3Bzp0S/r50KPbVIqU6Fx?=
 =?us-ascii?Q?X4KfecPBdOUikrvMwt8WUe5CCLd6M2B056NeJic5rX/1pFbelbP3jCyP8JD8?=
 =?us-ascii?Q?ctSr9OcsqFlF0qtr3jfwGVqpotMbFy1nI66rOCESGHYOz2u4TJ62hJlbEYuJ?=
 =?us-ascii?Q?JncDxsZl9YRiLok+uWCNXhTdjyEqctgeXRbkM3fVrWDIQvwnfO5qfjzbeIJF?=
 =?us-ascii?Q?2Re6RyI6wKGrdr8TO/pWVjda+EBDcNNQxz+sn9M4QG/N/z3X94r0shueuaDP?=
 =?us-ascii?Q?Gfb7Ts/cgrLwgKbXVYKmjAcziwdR8g4DbChyt1rBlOyPkH2Vnms1X6f2TG2Z?=
 =?us-ascii?Q?1vN4x7NHJA5iaw5ainu6ndsZhjW9CFur5PsayoumrAeHhFewnVI3E4xm4GsL?=
 =?us-ascii?Q?NU1Pnr9mSV1Z56KLqmiejGVAURtExKhxdVs4Cv8YQgkEKtGutlNOiKjnfo2z?=
 =?us-ascii?Q?k+uBDs55eMWYqkJw++fQpypvgvzukYsj/2RARTEHCdjlYmZBwBNfwm9EJLJa?=
 =?us-ascii?Q?ejrtad7HQqPZ/l5MXettjvy0z+vApSJqSLUHgMIfG9K9NA6x7CFnBJt3QgGz?=
 =?us-ascii?Q?9exAs4y5Lo2n4JQHKiWQsUQn6Oc1Gisp+rPd+tpiSipkG5Qn11/1DfNdUMcw?=
 =?us-ascii?Q?W2xCJELBw0vhDDTZFX3uOeDdpbTMArEBzc5neWAZVOHGDP0C0MFB64KTXjiU?=
 =?us-ascii?Q?IFKcJPuyAawzGEVKSk8s7SiAkEjviZopT8GAYgPe4p7D1RA2jwF/UZ2WRgQ/?=
 =?us-ascii?Q?HRk0/wbK1CJAMoEegEMXBBIW7oW1iPw8+lpg5zpb8xNG5He3FB7rprtpB8tK?=
 =?us-ascii?Q?MTsvwe4ljf31Nfs4Zd8IrRHX+zK0/XudhEqX5eJ0X+QMxIkh/qJGMZ7aFV1v?=
 =?us-ascii?Q?VQYDR+A2Q9LbxScSQUAnhJKumdTU5TlAnr23mJhujoekLE7wQOR+2FkExNgI?=
 =?us-ascii?Q?yPjEvMWuwsdw/1Z0vPdS8K264/fxs3DRGwTr53C19YotAQGTXo/Czxn27jkq?=
 =?us-ascii?Q?g0F6frazx9URDwaUdREtDERrzS25kPHtLjrMuap5b6x4/K70SXyxLLTGtxc4?=
 =?us-ascii?Q?JcBywl8QJ+wm4FjUxE7cTEoG4m8vSZGpRTjcqaXVMhdZ7feJNs8DDMUOx7bP?=
 =?us-ascii?Q?HFl9sZkidaFpSrtbOskoEgQ+BsnFs6LG2YgQoYnYKChpqup3Bfb0vwtIRwEt?=
 =?us-ascii?Q?UXf3YcqKGJi3EtVKqjWXhKAe0gnXHspTDZRL667mYPmGBg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5cXhE56p+vmKZ/HXXloY9ailYe7frJp69mEwsYjUj54IgLtv++PsBRN2fn/s?=
 =?us-ascii?Q?JxdA8EX9maNWYDoKH0fCIwWJG1GJWk1KG8U6iHbPtb+BkbIOQpubI6P6HRpN?=
 =?us-ascii?Q?PAwtMvv0uSjBN1TmbP9BTpPn6XIPzwv2HJBFgvTZYAExs6IX0NKKUvjxmNkY?=
 =?us-ascii?Q?T5jB5/2UDHqSxjh72BejfvGBqIaCTCgAbikaJt/NCAG96EIn5oVRI4dS1kja?=
 =?us-ascii?Q?lwaSdfdu96qk78fMDpzha+e+JlOD14kDOP4eaagH1zUyUY4Atku28UaAiHYK?=
 =?us-ascii?Q?wNVokKsksfMSUp8YVGWGBUOrLLu26OV9A/ZpGqPQzUZl9XYQkdP58/R3nEC8?=
 =?us-ascii?Q?hqDlc9AbuOYWg976lCANnP1vMCx1H5uIBxMjPMYcR87msnNVb18C+PiKR4Zi?=
 =?us-ascii?Q?Zar0mSQ1FPrJvitkFwPOI34B457PsD/tmUFiHx5NQeIpkYHVbQZNcLA7q2S9?=
 =?us-ascii?Q?S1mGiDDz2O3UtKRWTzvhHad3RTc3Ld47yAGmC3SHhzD0SjlNCPh+apN9rp4K?=
 =?us-ascii?Q?pouWA63eKbi3AzFFLH5QEg6DN5M2e78W3mnOGHCUP2BAPs8GitkUsyU7l5t8?=
 =?us-ascii?Q?C9zEz5E1g1BgXLJ34sVjYBsZnJX1bdONhGqEk9Niz+ZJYEZD/pfFdQ5iagr9?=
 =?us-ascii?Q?Q1U/DltYZ8Wsn5Ap15Go+8ogJtYKTm7wxqwcQtnRihJPs4JahYJv3vKjOY96?=
 =?us-ascii?Q?lIJV86BjXjsvtfvODyX7sPz5PDO+zF75/9mmwFINPDElpoEGAg7m2+YN2sEZ?=
 =?us-ascii?Q?zNDgrU8Pm/1VGdWNE2lKhaBUYitA57FqCN96pYsQpkmTxE85jAUJy/Pk8K0+?=
 =?us-ascii?Q?AJWxVC17qT3bpu8zANSZ9pp/MoUwpWG/mkeMFyG0ll0OeExDbAB5uVssB+Z1?=
 =?us-ascii?Q?9tsSFejMao+zcG0eS9YA4o7lZCDivFqgcU3fJQrrsMiqaqStR5DFEdAysKPZ?=
 =?us-ascii?Q?ocyXysERdJr4n2VmG4PNPe7aiJ3XnUZV9Ecbo7iaVMsLSyDJlwG8kEqcSStQ?=
 =?us-ascii?Q?taI9cleprZuFJR4LhP4dP6yMcbEeREn1Hl8VEQeVR7S7lLvXCrobHTNOr7Gc?=
 =?us-ascii?Q?f2d79tbA1ppeeRQaTpMtel/pzuNf+N8xVCGhsjmKP3LtlE9Ow+Jj6GutuXKm?=
 =?us-ascii?Q?k+wDZNTsLcQR6OzXBaV9hhg7in0L5GnhOjo6FHOF1hXXDv6Y329yjqktXVLH?=
 =?us-ascii?Q?slnF+XViMvHn8XkazrISnfJw74HR9uXy4SG2P2/yVnoQbyc5mPPos6CWd8lv?=
 =?us-ascii?Q?bYTC7HphU3goXREBLx67rVY940WglJInQwx4YfLu7bk2BCH+M9fOte+EUO0N?=
 =?us-ascii?Q?3TfESd5y9DdsaydJDw8WRGUmTWGfQVzY8hf3o/saCJrJ7N4yvz8C55mEtRd6?=
 =?us-ascii?Q?Z82a49my754yG3ve/ZpRC+iKK1cV8OZ/q4AGXjzvLmiAYKdf159W9rB+TIjp?=
 =?us-ascii?Q?sAD1QRPKvf37kpNh4nCbB4B1Wopv/Vl99+Q9cNK8gP9kC7yy1tO7/LofSe3p?=
 =?us-ascii?Q?tjh7Cbo0QeD9hZ5N+ioQfx9z2872pFCrRo107azmRyBQofPSA3ZVMVMBHvQu?=
 =?us-ascii?Q?gkQvZ0todzd5+HcGtKWpT2P5sBi9Xpy4TJFjsS/fKwFjmO/9hxBJoZlgKPLM?=
 =?us-ascii?Q?RPREK2O/OuYgQ+3+ihbdVOI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6b9aae-58d0-4e38-1d66-08dc83b1c0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 09:44:24.7367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htdnEdQMwMx404Bzb4I0NJiQv83dYHCtjjlwiefWT8/9DBigEtCGv+vJTsYLtNdi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyCK1EN9by2AGSIadLvCoSg9DWn7m2qhbUcGjRWWFJ8=;
 b=y3Ov8HyYhXsjF7bLyvWrQMLcQcH2xtiBrOIxj6g3pYgkddXoH1hoNpK72KHRVl8A+GCvBHgYiOfVpsC1aeJrBIK4LaLTHb3GH06OP39RH9gAeUzNOcH8iQd/E88mOzuXV0tP7RK0uIbQb/aA+zxD8G+95yfeLa8e0MBmod1CRCE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=y3Ov8HyY
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

Hello Brandon, Peter,

> My only concern is that this patch conflicts with the following patch set which is still waiting for additional review.  The patch set below changes the versal-firmware package from one that downloads pre-built binaries to a version which builds the binaries from source.  If the patch set below gets applied first, then the hash for the versal-firmware-xilinx_v2023.2.tar.gz
file will be wrong.
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=397588
>
> Could we apply this patch set first, and then go through and add all the correct hashes for the zynq, zynqmp and versal defconfigs?

> I'm for that approach, I will decline this patch. Please CC me when the zynqmp-firmware series is applied, and I will spin hashes for the Xilinx boards.

> I was hoping that the zynqmp-firmware and versal-firmware patches would be
> accepted before the Xilinx 2024.1 release, but that does not appear to be the
> case.

> I will be submitting patches to bump the zynqmp and versal defconfigs to the
> Xilinx 2024.1 release this week.  If you want, you can add the hashes right
> after.

> I will then update the zynqmp-firmware and versal-firmware patch set to be
> applied on top of the 2024.1 defconfigs with the hash check.

> Ok for you?

I have another thought on the subject of the hashes.  All of the Xilinx hashes
will be the same regardless of whether it is a zynq, zynqmp or versal board.

However, sometimes, we may have actual patches that only apply to a single
family, like the ATF v2.8 patches currently in the tree.

In order to avoid duplicating the same .hash files 3 times, what do you think
about creating a board/xilinx/patches directory for the hash files?  This way
all the hashes can be common for zynq, zynqmp and versal and they can each
still have their own board/<family>/patches directory for family specific
patches.

Assuming you are ok with this, would you like to already submit a patch to
migrate the zynq board hashes to the board/xilinx/patches directory?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
