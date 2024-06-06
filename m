Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E900C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 13:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B767A6061D;
	Thu,  6 Jun 2024 13:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7rHkhiNZLPu; Thu,  6 Jun 2024 13:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BDB0607AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDB0607AD;
	Thu,  6 Jun 2024 13:59:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6D71BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4823D8106A
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 13:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYk_9LKshSH4 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 13:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2009::624;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F85E80EAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F85E80EAA
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::624])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F85E80EAA
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 13:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjbdPL/jqnEPUPIAA8VgVCYSmLp8Aaj/glB44Kh9u/7FDPg9924LkwUuuRE45d6n8+BZT7e+QWDqQkKLaVAi8IA4pc7ESgFONrg459s5bV3T85DuqWzaM4uiGOoPIYcrJE7VSYX/y9dA97cLBSMgm4izOknCKWEEvX1ickyLICB2nPZx/dyh+zMIHMa4ypJZiIu2LV8bb6tyeLHxvzLYm6n6mph6cyFReTgUTWMrwdoaH1WpN5wnG+qQDuRAiiC5w+YMAAh1sBYiPbwPRbdJyclM/yaDuioQ2scS56iSucVIc59ImleDkqGVDDeKFvJFGRMRz6R85gqJb6WPER/LsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLyO39aIMMCZkmnfPU5nfKeDeu/iS5ryZcSt5/PeO6Y=;
 b=KYWANFGVcjt5JWpkrvOluZ5jljnsvKjV3jCBvrvkJfMdvJEWXWZ5NA2Y7qCKwjvtlQnaC9T7TGx/LCUPWCTlW19IqldngXsWVpHPsxodexdwjgKf7+2tzvV/E3pEZjBJaxL4+Julb/OM948Ghz9qXMWelL8orl4eksesrnIZdzY9StUpqR0Pe7GxsUP+l0C4JxWD5esdI/N4iIXeC9CNQ6u4GM4+F1nD2gqryFmMLI8at2cMfi7k3beeDcTg5QGeNdOoPG9RjuPmlfyHck5nJonCUmWEYo0p4IHlWmsZwYDEanM4dIk2gf1/6ryc9AVCzFjtX3Anqt5rjF5XsO9cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 13:59:17 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 13:59:17 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG2OC2AgASPZIA=
Date: Thu, 6 Jun 2024 13:59:17 +0000
Message-ID: <CH2PR12MB5004D40A85AC875721C77A42F0FA2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <20240603181909.50291720@booty>
In-Reply-To: <20240603181909.50291720@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB7795:EE_
x-ms-office365-filtering-correlation-id: 6549276a-20fe-419b-b3d3-08dc8630db4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|376005|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3bzya0QHzAdVwHNSPkBS221VCFWBe6bJiOA6Aa6e1cm63ml0IGJNbaQXaUaf?=
 =?us-ascii?Q?qtKQDLlHTFg3m7NXGgBP8EUXgXHNePZMnOeXNnIR80dtHXYESVVpX3VmmcWD?=
 =?us-ascii?Q?VInb8xQ4IebrC6C+9w7IjTBl9hy/nJ3BuCPzU9z909jj7yxjn+tecrRrK54x?=
 =?us-ascii?Q?S5MgX8dh+uH/UH5XI9E5IMJTBok1IdELJtktc4ApzyiZwkylRxUZdvkBg/zR?=
 =?us-ascii?Q?Cq09CoH6ZVr/9TTEzs3eB2F4bM1OYUp9th1l8619v/EHu/p/V6VWhpEJUF6G?=
 =?us-ascii?Q?NIplKgTa6qmV676TryOaJq7YNi/HsgOYuZ9ha8l0jAFktfy0/VE0lFns+kQA?=
 =?us-ascii?Q?fUPD7IJ3167LcLyUEBOwUQYOWnB7KuIJ2Gssh1oSbqtj2O/OKskdH+rpWtL9?=
 =?us-ascii?Q?8egmYXFT9bzLAA30acQa7ieAdiwYI/2kQ18tiM1FIPrltUOnGMAf6qcsxvvZ?=
 =?us-ascii?Q?yyANzkAWnDzMMCPqlRkt2XRR8BnQUMRyLw1GQ54p7Xyrcll3BAL6J+yHNiRJ?=
 =?us-ascii?Q?J9bM39GvArL8JqqottkrbRFCuUV1rB037DJwuB2z2kGY+GF1WJRDA043qUfr?=
 =?us-ascii?Q?aI1nB7kheU0KQmkeXo/NxzTF72wZNk0T/h+afFDOzBS+c0bkQsW+/ezn8qcB?=
 =?us-ascii?Q?cD+VYHdN5K+JzkvWI3xtMISqhTjIJXJtL+HKP63bqi3lVO25q5Iv//2UB6CH?=
 =?us-ascii?Q?f7xC8bwYZ1pgkI579WMQdMcbpRUiTPsGQir9las5QmUKbN9JpE8PewuSfxU3?=
 =?us-ascii?Q?Srjr62SrPxjsWiEpY+lDxx4CY1WSx4Y96DZBdamtdyt/smgi+JChfgSGLUG9?=
 =?us-ascii?Q?cBIznDhOenzC7/v+Z79LUg5UJr2uFK0Oy1IOU6WwIfzhFUMch3Z3TKGvx+SE?=
 =?us-ascii?Q?tL8pVufbTVTzfWbAq5kAd8lsVkF29d/xbPRSXRHrpLCpO+UQAVfAmyRMQEsh?=
 =?us-ascii?Q?6VEc74YQKgxb4wFi9VUHWzLkzt+qG0quae7TSgtOOIBslXrOkbpiUGbBm+5s?=
 =?us-ascii?Q?4yoUOhGEZo2G82eb4HSt7MX/FdDcRSFGRE0BS1uNkRot9AQii0KmQ2DZItTM?=
 =?us-ascii?Q?k8RolnEXcQlpUYESBZSkOOsVmH/U96It65ykbGMyqZl6Cktmzv73V1FcV3kG?=
 =?us-ascii?Q?IThlYU9tC34BIyUcZZ+QeSzeL3ysz5/i6W1oifvwQebRtfzELqZRi8InO+k9?=
 =?us-ascii?Q?rh03Hw+z+ZqWd8SwwVvhJ99qVJHtvHvQeHDbD3ZfwsZDzhez8nH9K1DiVwdS?=
 =?us-ascii?Q?DF889ptoz2fRkst+uWmmMso/ydO7sAn5Y2OZMWyCsVecAVA+SAUjpIV2f0Dl?=
 =?us-ascii?Q?Mx6E/pbTaU3z4RiK2BOcHE/+7n6EOJ8DsUMyOhbc5MRVF0i3TRnzZY3KWXQA?=
 =?us-ascii?Q?1acCmxEAL7iFtHkrLd/3NwbsMSnlFrKV1rNk9Z1nbsrtz0/0YA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?or6sEQCBDEbRAWSKf9pmjI784YE0hRmv6Hxew0trb5C0swOb+qnYkRGY0AoS?=
 =?us-ascii?Q?Qcb4XHynw19kOqYPCQDqQ6IEY5wjviRhKnxXjvz68s0qrUv3lPDYyisFVDMh?=
 =?us-ascii?Q?wbmjUZnGT5eqHa6DkewjPxEQL/hgEpxJX40RCSH1BdYiJolkHvwVAXApbDZ7?=
 =?us-ascii?Q?YpxBCYtyBFCzLbQbSFfyr189LOvaTlLIa1lBVQ1AaOAONdwnuEDWsg9ZQpdO?=
 =?us-ascii?Q?T4HEg+r7MSBz/2tRaHbnNdUZzzpQDUOHiObIboBAsiLGQS5ZIepYLLGxPto9?=
 =?us-ascii?Q?ldkkb0j5b203UrOg/ssrn1c8u+FBLp07xYNNXf+r9mXoso0x19vnZNO/vY/d?=
 =?us-ascii?Q?0Lplnd2Sc+NWqPNUkMsbMg1RDtejtL/BZCQ5diGzDV8yj9Ja0v2hZx1Qhpi/?=
 =?us-ascii?Q?NHQTJHihWyE32b1N6ciQlYnH/NwC3LvIObhWN3Qcmv5v4htmjEp7B23m7OcU?=
 =?us-ascii?Q?MVtebLQIMeOjTvZ4Cw/9UZb1qUP2LKhnLU6zcA53V/XYTb4EwQdOuYmSJYH2?=
 =?us-ascii?Q?Af7NtZFqfu/lB7HTexx93ZTR6pVFeCLLs8NV4ASbpOWRheCMulJfEFwjDk8t?=
 =?us-ascii?Q?xUBye+yeO067YvbW69t4dmPJiFAq9iU1oO9UM+zg6WXDx3xB09huTLTahavX?=
 =?us-ascii?Q?yJVI/xnHWY/Gt8y1XqCzUo5ILiNY/wPrZPb/zUMPjIgNR3SLtXG8BUi2N5ng?=
 =?us-ascii?Q?bN/8RCs7bFivA3jgTp7CKi6MKq3LthaGt9eR4xjGLchwGfB072HVFKMJp4T1?=
 =?us-ascii?Q?mkRdOmSqiwtr+ukQYYsEgMFu48kNLhGJL8eCAbagaFwZphfkY0ncG2t8JBIx?=
 =?us-ascii?Q?I/uy+5s92X6XGZVvh3KiCyKqJWzrkaSjuI7JDsBZJOKIpunVjfQvEYg9eY8X?=
 =?us-ascii?Q?hJxV9CBPrPbUJ4PcE0lIPkffYpN6OkGAzfIKiRbsFZFly1WEN/Xgi9wB9ioJ?=
 =?us-ascii?Q?rXDHRfSGSh1Qq6nE+taZ7o7EX1lRv//9iJlkNVumNAyZfDUWZMygana0CxHY?=
 =?us-ascii?Q?d1Xgz+Y1SSKexDcVvz1DosJuSQ8s3IngmxqQauVgXXE9Ozn6U5kxReU1+Z+3?=
 =?us-ascii?Q?B6UE/fiBZwDACq2gDC/7iA5d65X57Ybzsn7ZWmU4fN2E8SqAy8gcML/h+qv3?=
 =?us-ascii?Q?RjtXZAj8cjbsqSCK340lrTMoaKa2iJeBmCIWtMDa04GbuHlVUdzdpm5RHxv2?=
 =?us-ascii?Q?OYQb4iyCdEEDm4T/haAyFerbs2NSoZPwDjeTJQIwpd0GO4XBh24jKlKCL/m0?=
 =?us-ascii?Q?EdcU/bdMyHxfidhhpZiS1pvRwJGVQNjR5ADpF16dM50vtqZDxTJ2li6OCj9E?=
 =?us-ascii?Q?xOj/1hUgVCXjfOp+5B+YOxvPx8V6YDt1jvhM20oTDL56l+oiDLeSA7AShM6e?=
 =?us-ascii?Q?HP2z1V/P5tfyGzNSls6bDrnY4Xg0K8ZqT5Ci6qTKfvwJv/1sOTLh8uyBHl5S?=
 =?us-ascii?Q?RGLKCU8TERvPtJpdb3cm4M0rpCoIBrBwv8TUh3+oyAGVA6J9iGphgEGo2ylN?=
 =?us-ascii?Q?cutm5fklGBVqdbTFSp1yYKkde7reDP4ZkGHHehiMIeI/K6miqror3w3ZJBXA?=
 =?us-ascii?Q?HtRzxuy4nbjot8oU/GEsoiF2ycsi/wJO8meita6sTNtfpC4agstDX8e6/wJa?=
 =?us-ascii?Q?rst5tKEfoLe7PelWOCp/NUs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6549276a-20fe-419b-b3d3-08dc8630db4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 13:59:17.4917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3behM1jGzkUFuRR6tb8U/jF5zEaG73Sxlt2iiH+49Ts8ZjzksW38XKOuKJH9h7K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLyO39aIMMCZkmnfPU5nfKeDeu/iS5ryZcSt5/PeO6Y=;
 b=3Ix5KrAdZiiQE/8aFKgebFyllNigRWD/9T++StzFru1rdV/ZHzu2++MKCx23vvt6vSA0WuCQOTChJyOQEkEg6Zo4rc9tKxgfroJuT6G9Jsd/3QcVMluw9yIC+4akJC24BMtQlXO44hMP5MgpFKz72VGE4CsKmiXnirwwBNjR4G4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3Ix5KrAd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"

Since you are processing so many patches today, would you mind applying this
set to the next branch as well?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
