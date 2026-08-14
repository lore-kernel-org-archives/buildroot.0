Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E6C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CD480A9B;
	Fri, 14 Aug 2026 10:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ugIZuHn5gob; Fri, 14 Aug 2026 10:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40E580963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786704549;
	bh=pA07/qJmuMygY8PYZvDTERdeGWwblp3Ux1vXAaybmDA=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mLXvMQJ23wmZCTRP+H3l7yHGnKQB8U0sFnHFcGsp1ep3ma7ufo3e0+CJn/7BkTnL5
	 YKGR6ME+0vK0ObDm0+JLRC/xsIik/NLTCzgq3b7EQ69kJyb84H/QoCyKG28A/IeMdf
	 4nJ0JTapefkD3rWNebw/wmhq/CJRQ8vpQ5ds6+KiAv0C+5wouffEX9X7PBI+i/gAoJ
	 8YuoQpDqTX1N5KsOdvoTZkjTb+ly4KutQGoobJf/rvgM4yZTJsceOnqYVAr/cA/WSi
	 Aa7OEtvxM2I+Gx7iLhY7qDNEhTeYL/lBKS40WAud9MkGnR9YKoS0QQjEd1AhOJRRAi
	 0/Ny8X561ecYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E40E580963;
	Fri, 14 Aug 2026 10:49:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9FAA23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 10:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9369180FFD
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 10:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1dLIidoiGdK for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 10:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::5;
 helo=ch5pr02cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2827B80FF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2827B80FF3
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2827B80FF3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 10:49:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkmdZzv1WRe4Lom0HQjHir1MglG4IIBMkpJgu/enX6x6m7yRG2AcqUQWQuYrEJldSicKSiE+GjwJRwX08nSmBm0nNVStU0Q/SfkyRh+TuTaOj4qJKVUfByycf4g0/VyyfG3HAaFpO2eg1PPQWR2eUkwgnpVW+Zb4gAvJpRJ1MO/blNszUG3+YP0uDSUhBSdXIf6S2t8xLz0XrGa/AxTdW23OkwvF3TfxkEAwFjHl/wb7VMHdhMoS58sfRmXnpa5Xn/zdFoXbs7bP1srx/Lx0n4vH98cjsk66z1glurVKW8BDbnZVt+wusMiRYkZC0WufxcY1kbftC8ikeNcos8KyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5HmPso41k7jYbruE6dAoq+ErkfkJ5Xw/FM8RssShr0=;
 b=nKKY28FfsPvYfLPMHeau+zGxC6RJqaWlcOOKg5WtEK9mYZiRIbdQlEwEpAp9OtSM2Fz/PHT0oVjkvpZKKs0x1uzDW0AeJFwKZ2DJsT/eXCoNkxmzJUnh8y+dFhgfHfhrXs7M/eJbQALqIFKck9M6k3Mw2/WD4ieCmpwPLxaZRYAvmUm/Mg4ygNwdk7DPFMApkhHWqBHXTRCRMx6wCSCcXlb9lvrD23nQnGWNwyNEt8eqaZVLJuoUJjH0K7gRW0ZWEm+K6FfKoBbnaRvDyTXs4XbWVpnrdU2FrGUzEqgw6F/3A3twI3WIuWdczX+zIWixUjm70U597SWdsx3tpqr+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 10:49:00 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:49:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>
Thread-Topic: [PATCH v1 1/1] board/qemu/microblazeel-mmu: fix run command for
 qemu 11.0.0
Thread-Index: AQHdK7tjPTpMeE0LJU2SajZjpDnEyLadW+rg
Date: Fri, 14 Aug 2026 10:49:00 +0000
Message-ID: <BL1PR12MB5032DF56C47A91F9916F47A6F0DA2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260814070557.245945-1-neal.frager@amd.com>
In-Reply-To: <20260814070557.245945-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-14T10:43:06.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB8539:EE_
x-ms-office365-filtering-correlation-id: 963cad15-9f53-4582-828e-08def9f1a657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|56012099006|3023799007|11063799006|38070700021|10067099003|41080700001;
x-microsoft-antispam-message-info: /WIV9HCV+h9uwaujo6gHN2SjFn3YOGztdi2SvFFhiq4vRoqtEeElynNrpxanJMwgu6AJdITGDkZ4u9MDDMEHq8XiZg7mUBdsbiuP3M26tBAI1DCWQX+zDgWP5if2reuEba4KiqGN1xXgHT1CmJoiXswF3RbhMddCemBNAFSIGm+NRynV8MIrw+LyZKz6IsrwPtOlMXuaRC+8lmhwZuHsZYuj8IomzsjrcLfN9BI0KxhPmZmx0rpNm58+9Z3ROBmdsq4A1KKnAcdegiX1KAY45j4Q+QDlR+0lWhb8gvQCHVnYNkM6Oy9xhFsjLBuhFBwolU7xXn2kn3LFSOr4eg9tqQ7e6XGg6fD1oKysbXbJzp/txXqqvbsiq2Y7fFcjzAMRyNrea8cYiCN1IY8gRhPRxq/PbAmocbvb3ifCJNivRq7nSbOza1qK+p73Ks1TmnDT9MklnC4wMCcja4WldJRsoGo41A8MzCWN0dWdz3o484OOMPHn32JZZg2a8WDb627zmh1DcRZdeg0+XsNInU/ivQpqfuxiychDtElWGKNVVHeM+06IIQbDR/tbsqwjmjOvCTS0Hb0a+kD+K2msiAzRYW116afz3ByCpbBdi2UY4OY9/0ILUpXLdWtQZNA3GiaschO2aJvT86JK8IkC6pxqTMoAh5Cinzcccjas6KQK7UiWPPbBZg671SndzrG4yL1njSh30gJTsErsBdHC7lYMJRBcw8PYTXpB9bS5vogBiZnnNFlMYgMjreMuNg43q0D+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(38070700021)(10067099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uGCVZSq+Te7KfMOkQlhaB3l5aFdePEp6LPe3OrwexCv7Lv1rNDTi9SWrUJm9?=
 =?us-ascii?Q?L74LWO5meAUY6YSYmz9yUbCKJ9yhZpRMOHOtaZVeCXDnQJAZFGmtmVsrXNr7?=
 =?us-ascii?Q?EqeB3RSfM6kBSrZXpfUI8fuzfJKly3cSSSNMGYDAcEyLjSHd/Em6BRRiEc/Y?=
 =?us-ascii?Q?m92dNZymAOQTJYqpXfg+Qmkl/g12VqjYAcFkjGT6J9iOTWF/prEoaPiFlFR2?=
 =?us-ascii?Q?1keVssI0UWYDmv/sBlQYOt+MurSIawvhgR5H+VzsRs8+6dE4l5uuvlvFW1wi?=
 =?us-ascii?Q?mqDdMpT2oD8F7DT59SfmI87e8Y16RoGAxOBys1T7z8zbPKWfyNv8Rlgyyz3X?=
 =?us-ascii?Q?+x3IKWaFA3y7eN+OI3u3t0eU4vPzk1OScssrQ1HX3nsR2/Eb68FZJUnDV3yi?=
 =?us-ascii?Q?GJR7SttiHFfGqyZOS6DuxOUDxR4dC03P8wYzvNPGWdZ7Ij1ACdyUDW0WFl5l?=
 =?us-ascii?Q?u+t+olpqoDkJAK4Ecmqk1no6Hjjx1uXZP90id8Er7JH78vZ/QMNRpB6T52Ww?=
 =?us-ascii?Q?/78tHayn5+Iu85SDGBEZP18LPuJ1y0r/r2mcZqd0YjvDOERrSfbZQQTTz7wR?=
 =?us-ascii?Q?NkAcqnx6IoVBdmsl8OLwTppsHS5lRL0jVKOFG3eiY85crvzunakvRky6aBtP?=
 =?us-ascii?Q?N2eOf4W9PrLe6zwGrLEDttg8lUuF0laMBCF2pPitQB0p7T8GNdckU/vVs+PE?=
 =?us-ascii?Q?nX1ZBUewD4cSKVm5zqYj0G441scoA0YvaXuqY0kA+R5oxagwh90lAq6QoKgx?=
 =?us-ascii?Q?M5jZJZsj1lt2AL3TXPs5zaJugQU2UHjFQsEzvvB61+tMFjV/cmaWxQdVrZAW?=
 =?us-ascii?Q?RZgvirl2Lmkc3x2N5YNTf+81Zd65F31Zhg33zCRNKvF6BfkUWfqRii2Wi1Ao?=
 =?us-ascii?Q?GfXmNjaXYwRPaxeY3JCl20eIJ8gY37zq9teYVuz/WJlclWfD/ZHEB3xNBORS?=
 =?us-ascii?Q?iyIBw7NDyBKgVj4sFFYUG5QZwaYGS0FmJnY4KlIZHgg86yNUMHbdo6YGG7J/?=
 =?us-ascii?Q?1ZZXtOrLNyGa8DQJpvJFflX9vbgFKWKDbGgILUJjHbrid8ePqYIg1sPANI+h?=
 =?us-ascii?Q?COK5nv5h7Xmwb8kzaBYGXT5C2Bd1Pk+gv8OXztE2KLcnu77dXI+qStYWFFvM?=
 =?us-ascii?Q?sLF6wq1U9q6a3TNjZCCynsZkfLxE+KgAcOkZuVT1O+3Ucu5epgGd8E4ZBi5z?=
 =?us-ascii?Q?hhlxVWNdx9Z7uABTlhQv8OFs0BVyMZ7L26UXMpReXcZOa9gg/On4QheasuQ3?=
 =?us-ascii?Q?MiHZgdEcIiThckx7Zn3J48d1lqhmtnSiIAEWz2CtcBnhT2wiIZteKsw58qd9?=
 =?us-ascii?Q?Jef36z5rgRMbQn+MKU3HSq4n5pZJWCfycYQHgS2TnbhS7Otm0yRpa3W3G8K2?=
 =?us-ascii?Q?+IqSBa3M+QdkNKxJBlN3CE8e6fRkzHEvZRaGQm2g3ajsU2+iVJjCJu4S6Sl4?=
 =?us-ascii?Q?wrT1q/y7J0is8qZ/YVvdkHOSI8AnP6uoSvLXjyWsIfAL6LE+vKMlzEr0/ZE7?=
 =?us-ascii?Q?NeD+/i+1iKcmObRGdQstIMO7irMX8MF47tEi9tcyBONguMNFJxOp6CbC9dYj?=
 =?us-ascii?Q?8Mk7B2Chmlrwevv/aEE12fcxInWhIB9YoZZpl75PdXgLCJvB1YTKjpQz04aG?=
 =?us-ascii?Q?3dD6AerSOk9Y02DJWRnbrPfMsQ8txWIb8cp+gs8tVuOCfBAbY+btHA2Om67b?=
 =?us-ascii?Q?1q/4rgQmWQdslOm7acZN8etv6GzUUzJFgzSPfJG+hrSJn4wb?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963cad15-9f53-4582-828e-08def9f1a657
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 10:49:00.6230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZEDcRX1QKrLcNu8lfweL4q8pRcjbe36Sl4ACG79hOD1l7rtkofmtM2aHpQ68VMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539
Subject: Re: [Buildroot] [PATCH v1 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "joseph@anodize.com" <joseph@anodize.com>,
 Sam Price <thesamprice@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi everyone,

> With qemu version 11.0.0, support for microblazeel has been folded into the
> microblaze target. This means that the run command for microblazeel-mmu needs
> to be changed to reflect this.

> See the notes in the qemu bump commit to 11.0.0 for more details:
> https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f702bacde690c41a

> Run command for qemu versions prior to 11.0.0:
> qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

> New run command since qemu version 11.0.0:
> qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> board/qemu/microblazeel-mmu/readme.txt | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
> index 20fa0072ed..a9f832e91e 100644
> --- a/board/qemu/microblazeel-mmu/readme.txt
> +++ b/board/qemu/microblazeel-mmu/readme.txt
> @@ -1,5 +1,5 @@
> Run the emulation with:

> - qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
> + qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig

> The login prompt will appear in the terminal that started Qemu.
> --
> 2.43.0

Unfortunately, the qemu_microblazeel_mmu_defconfig seems to be completely
broken since the qemu 11.0.0 version bump.

While the qemu release notes claim that qemu-system-microblaze supports
both endian types, it does not seem to start properly when I build for little
endian.

For me, it hangs here:

$ output/images/start-qemu.sh
VNC server running on 127.0.0.1:5900

Running the same build with the qemu_microblazebe_mmu_defconfig works fine.

Any ideas?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
