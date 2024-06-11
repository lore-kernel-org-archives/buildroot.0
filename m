Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E09C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98EFC605C7;
	Tue, 11 Jun 2024 18:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFopnqIVkk4E; Tue, 11 Jun 2024 18:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A11CE60896
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11CE60896;
	Tue, 11 Jun 2024 18:07:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76FC31BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B0B81FEA
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DX04IieOpzjA for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::624;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A81781FE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A81781FE7
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::624])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A81781FE7
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfLHlLP30IlMplYuuikkXpfVkE2WriMY9raLoGWaJWFJw2JviMR3OIJJU12crAS3QDtUfoCQruqmvX51lYutsT9nVk7WtPEorYsIVocJAMX4dxhczqOkdgW6I5oWAlEq0QLI4x9wcK6C4ql5lf+dK9eAR9/jXWG6ZVg+RAAMROQVShm8NE3qQmO7U39RXmCn2I5qZjNbnbCcmrzfMSsHSRbucIPWGp3+tqAOMH85pJXQLXapVCIyuDbGIorYnLEdOH4djAMDSK6s56b7NxOxLq0k+gX6d2wb4erJKrVOppJQ6oO77brUAYO3806MSJEmKzVkrmun8bWGUn+bMQLkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/fQ5clfAhPfmeusjBbu5sXiWRsu+I7/wr/sCNB0kCM=;
 b=W7mp3xmMVHVr9JAEY7PCuFssL+LFJlIMif6I6WeXZlxR3MQ4tOKLfPgDY7kGEz29VQ9JMUfsqyC27KyqLaoDggGKuDI66QthE2ZLanQESrGd2YM7tODg/FTGtKoiL14/0lksjfs6RgS9IAy84iC0y072TjPKapSlvN72VDwGNFT+yigMKfHrUbpZNQKfs8Nabm9SPXlrcaoJP1Pr84FyTVMfi6yxaNKe9Lc2a+HsUko3G7s0xR4Yq1CMMbjWnLQPHffDg/Z9vWfYFcGRxTQ12LLFQJlssS/kIp0Yy29eMGTIzCXp3CBlJ04+2uvYVQmKyro8605M6F6eFZLLUdwE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 18:06:59 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 18:06:58 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>
Thread-Topic: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump
 to xilinx-v2024.1
Thread-Index: AQHatax9g559kmzXMUmo4Ts21YO5tLG64BiAgAfW7gCAADBmQA==
Date: Tue, 11 Jun 2024 18:06:58 +0000
Message-ID: <CH2PR12MB5004916705391418697DA44AF0C72@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda> <20240611170816.5a412e67@booty>
In-Reply-To: <20240611170816.5a412e67@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB7305:EE_
x-ms-office365-filtering-correlation-id: b40e5c51-c57f-4016-5bdb-08dc8a414959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230032|376006|366008|1800799016|38070700010|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vjSnASm4ShoSDXTtByXGwtG89+8hboJ5xS0ygJ1Rc22jjE9Jni4/fbtAXcA8?=
 =?us-ascii?Q?4uRXU02Irpt5VFdZcEfJi3mZ7FnL8wU124amb/ywj3URYov2NOL9/VnW0V8f?=
 =?us-ascii?Q?4z6PQU1sTx5htJOBmYVjGh3v6lfz5Nzk9LRrMrv1k9CI/A0GuqXIyMYkrNVp?=
 =?us-ascii?Q?hWtQIQYj3thT+A7EUDMxH+o0fQCZ2gbg7elb9amk7aWKXv2TjxrZ8baWE2L/?=
 =?us-ascii?Q?Fz1DSR7MRSI9rWN18EzUTckFq7345Oxa+nK9mWdedLu1XeAMfxI0qdUhIyto?=
 =?us-ascii?Q?HxgfL/6kQzZdP4DQ2BWf2mVgkqx+tuf7CT0PAjpQy60JMNvYW5rch/118zpu?=
 =?us-ascii?Q?UMIqArICWT0q2AI5XGNpgdjEAebE6Z2IgOtNqe3K5PLdpo9y0mvbl2DaNaPS?=
 =?us-ascii?Q?oqe0z3eGEGPKyLhKl5qgKp5gFV61wTJyFYHsUU4GFG9NdgkxU5RR2T+UhMxf?=
 =?us-ascii?Q?pBruvAs2EMhs7350VSC4hjb+TsH8J6bqVNfUUwF+W64YOejvgFti/+/OH4zF?=
 =?us-ascii?Q?VYPRCyWNwxXoNO14lZL4Ej6CPDSV68BEGHkol9rkbieYflRAajDUsTG5HtMx?=
 =?us-ascii?Q?npveMuZ00PBYU+A6+hPbzvMZmFc7gJas24WCOO9fQpb3ut3KRTPv5cEtWvAu?=
 =?us-ascii?Q?d78Tr6yz5xx2ADDoRQQG+x1QMDONP7zmb4of8r17gdEmQ2y8nkS6VmP6s+qW?=
 =?us-ascii?Q?ZEyZl1Xy+CdlHyMlTSNO8jUX6gGMCweX1fxb0/j+XN1p4tyWl8DBh93ie1m7?=
 =?us-ascii?Q?A2kjdijwU2q8kNUnAY5HCMfE8fA3H3iD/eM28KMW/UBftGZe1X7CoizATS12?=
 =?us-ascii?Q?lHD8VkJ/USEK98iLMyZt/99xRo9cWq3bv61mEiWcnt3M7vXMEZWs/g4TCawO?=
 =?us-ascii?Q?+wCNZ8NtA1RMBKHJAJEqZ7cFEYIwn5ukVKU4tF+L1A1WEVcNKyhxxf0mHpT7?=
 =?us-ascii?Q?Vu6HSMwn8pfmL2RzOOQPM8xH44NHVML0c7XtJXF1rSCpnLMhwmDT2NRUs5m0?=
 =?us-ascii?Q?MmjJRWwxsGaQ4plmm8YbS7HeZRJQC9XSfpsySaSm9w8t57rAQRqzOR4Ap4z3?=
 =?us-ascii?Q?bdab9Q49pT8xx63THjQACpCnZoesgGGN6lC7NIKfBVKukTGDwbb5+kbkY/dK?=
 =?us-ascii?Q?f+Z1a2qW5UAIit8cxVNWcmryU+rzsVjFFY73SkoCWd0vMkxnbw/xBPz2TdE+?=
 =?us-ascii?Q?U0rKpk1yjAdS/PPzJ5q1tJvPpS566LEgIkMWgDockCb16bBcLNKc+seaCUNk?=
 =?us-ascii?Q?3jZJaA2iha9Y780ce8RwPdkm6SViZIvD5ulfoz4GcYj7hLuO3q4iasVqZuKG?=
 =?us-ascii?Q?PS+JbbehEQcCjotg0K3GViQPEAxW765E5Ut3IeXbggb2yA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016)(38070700010)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cNk1rC9IMKu2SVsL/LFXw2CWM/CrMoVF/f+Xvf3/aTLhqzJNrrdlOlID3mnU?=
 =?us-ascii?Q?ufgFg5WIvfo1jm1kBAh0vIp/QnBTw1JE3/VGNy8iHTwUMPKh3O+4U4pXE5m8?=
 =?us-ascii?Q?VwkyV2/S2nt4GdEg9KGRrDMDy9qhffMj4YDrWtQMlFWYN6EsW+jIZjjUGERR?=
 =?us-ascii?Q?/kPipymE1hdGc8NcszY0Ssk71dxzReHXbCUfkz1dvg8FaARBHg7+rU2peBoL?=
 =?us-ascii?Q?AfvYXY/iyD6WDD+9tLZsqQ+Lp7vT+b5vV4x6xctDUC5Bd6arO5q5dcbZNKY/?=
 =?us-ascii?Q?bkgJcer5LcLqkJ0c6/ozkkjg1eaFDt9WEBTir0R7T4OrlNW0V3yqp/lhwDzX?=
 =?us-ascii?Q?wDVrWiF4kiCvUY/e5ZyX8mMr+Dw6TdIG61hxAHGPv0mq2RKVTtT+3SAWcJ0/?=
 =?us-ascii?Q?v1f+rCfTtQocaytlCV7EXd2LOzbs2A6lJFSc8SY1uH7PEY2o9IXgPZ2XfUHE?=
 =?us-ascii?Q?PphtqYwhI/+aU8Oq7MzDoP2dzqqKb2dwUvhia/TDp84QS3RCoS5aAJDW05vX?=
 =?us-ascii?Q?5h7B6bGDxC2VaQvvEHKwNVE09rVASdmcBKQchf3lNJB6yogC0IeGKmf1jOXn?=
 =?us-ascii?Q?ia9qDPOojygh1rhi+mw2qMzdh2WT/psZaxq7UKZgLA/eRH2xu/rjYIvJPwtp?=
 =?us-ascii?Q?oe33ItMPUwmsfex5ViZVOgrECpsDatj82WFixOr+hRk1Nz19phSlEE5AIPnu?=
 =?us-ascii?Q?tgC+dUWX9NaHNCRleLK+9mVvV0tkfxZ4dqJX/qaCbDrS7JUIm+6V22uIh7Z9?=
 =?us-ascii?Q?JwhlQA8QrOKz2i90hjx6E/TRBnLCOV0Fd/dZwLLrkl73PgYrZ+YI+vVkelvp?=
 =?us-ascii?Q?nArtFI3Io+w1DYYXzQiT0LXS/ncKxZE/soNCQR1AZnbW1lldQFLaSqYiy4y1?=
 =?us-ascii?Q?k0fCbxiaUjU/Bt3Yk4kNFdageKMrkyMqVatj2eamI4tddbAXU55Yxw3KjDZI?=
 =?us-ascii?Q?ntl+isqoWbVGwGOal2pv7q1FDB8wCnqs+8VsTMWi9OMqi1Mj+JWixfHyC0sE?=
 =?us-ascii?Q?VNvcGsjwK3kaaMg0SdFPwYC0uhYNlXX5ox0je7hWHC9LLqxWrvRdH18IbaFK?=
 =?us-ascii?Q?FNwa/bQ75aIY3qhYJElTRHI5U/3ksB0E9lXytKgMd7i8lhVJ8KNo6628wFVF?=
 =?us-ascii?Q?MZUHVQDyCNEG/2a8zpnmh2SfyilbqiS6Jfy0QoLB0bmG6N+1CwEI4ekQoBFd?=
 =?us-ascii?Q?d5+nIiPr48j77mCz9gmXwg2EwhsLrW89hgUtWe6zyzZBxxH91h78xoEhZ4VI?=
 =?us-ascii?Q?9iMslGRNmLlRK0DxfGVxkaJf0lgmN29p5ga4pp+KIFEigcDc11iVyjhX+SXr?=
 =?us-ascii?Q?tKtU/eYr7HliwA97mZkSmksO3xF5wAgqR4KyQnW/xtrkoR3H6RNoECdiiWtn?=
 =?us-ascii?Q?QcuKps3fgr2CJ7WQv/CMRUPdWPU7unOqBMQUztdC4xwVqyfj4kcx6p8o58c8?=
 =?us-ascii?Q?MoXnamwcKONc2EXWMZsXKWrIcnIxCXblua6OoYjLZUOJswmG5OJZWTjC63/r?=
 =?us-ascii?Q?H61KYgUsc7VS4vQQ1n0m+bjCGO28HGZBIbJ3o4ivU8lfjHY5M/iNaPxJeLUq?=
 =?us-ascii?Q?0yEZS+IBGIwmxkyj8v8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40e5c51-c57f-4016-5bdb-08dc8a414959
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 18:06:58.7447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16BL4KYhV6uzLyugGar1JCf5fP+HLf6vEexWZNEXbp8kScjvEZpYB2Ht9u3TlJm9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/fQ5clfAhPfmeusjBbu5sXiWRsu+I7/wr/sCNB0kCM=;
 b=kDSM76xHbGpSkiBBw0/pmwFYMIJfhI0ZuqpBM/3jN5rvLqYfnj3wyLsxQD4kQwZrxajM5Fhqpy6IVq9f6rkizVPUln8sqVXieJHCUnT6yhGenql8B9mP9BuQ7MAO+pTmmMHS3E6sAHhhA1taYtg+4UQTx43J60QikZs3Fm3IBNE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kDSM76xH
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
Cc: "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Luca, Brandon,

> Still, for this case, I wonder if that would not be better to intriduce
> a new package (e.g. boot/xilinx-soc-prebuilt-firmware/ ) which would be
> properly versioned, and on which uboot would depend when
> BR2_TARGET_UBOOT_ZYNQMP=y.
> 
> Luca, do you remember the details why a package was not introduced bacj
> when you added the ZYNQMP PMU support?

> Apologies for the delay.

> I think the answer is just "it didn't look like necessary at that
> time"... :-/

> But if you ask me now, I think introducing a package would be a good
> idea.

> Building the pmufw within Buildroot using Neal's patches is a very good
> option, but I suspect build would have a relevant increase, so keeping
> the option to download a prebuilt binary would be good.

I have an idea for solving the hashing issue for both zynqmp and versal.  I
will put together a new patch set for submission in the next day or two.

In the meantime, it would help me a lot to get the following patch reviewed
and committed, so all the defconfigs are on 2024.1.  The patch for the kd240
has been committed to u-boot now, so it only needs to remain for 2024.1 and it
will be gone for 2024.2.

https://patchwork.ozlabs.org/project/buildroot/patch/20240604085325.2073913-1-neal.frager@amd.com/

Committed to u-boot:
https://patchwork.ozlabs.org/project/uboot/patch/20240604083854.2033917-1-neal.frager@amd.com/

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
