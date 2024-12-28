Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C6E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 14:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058D780A60;
	Sat, 28 Dec 2024 14:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3Cl7y-7jbAs; Sat, 28 Dec 2024 14:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8777E80A5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8777E80A5F;
	Sat, 28 Dec 2024 14:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6F4E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C080403BB
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zf-kLsAm8z6f for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 14:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::613;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58F5B403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F5B403B8
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::613])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58F5B403B8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 14:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j84zqtONiv8qXxlwAGSA9qtH6OpbEkgZMhlqm7bUdsp1HUslqwOUtF71UgXCzBwD2/O7qZDahqOM+Avx4zfYy+LxC0Ajio1utoNlt8YvlekS8SOOk4Dykg5pH3g/YpjiACd+SoT1nS9Ur3ThiVqDxIMlyagYYmOPfMo0s9CaPn5I2bLHZbqNXc28Q/SdBTLeOzL7L9IWedAI+gp6VL6hCtdp6sKGtPN2Tgtr3X1l7ooQJqv31V3/2W7r3x3ugMnuYNmKXT7SuOLv/8oIaf9comVEL/eZd0R6/2T16JQ30TgDmyNiC740lgwOjDToy/l6s8GNZLddBJyB3MrGnCyo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJRU5bI0v1iVwiioZ1YGYhaccE+ksqc2jZNqYAnXMco=;
 b=oQHiiFfk3xzY2dDPuC7I/0B5SGSTrgptkQ/z/atQLmClDneoFA8/00eQ2pjuHjhYubN+dqh4Z1ErQaCXtdbA8I7jPPqwz3puXqiX0A+8NiWhE5Vk0p1CBAUGhCbVZyY4+5UPJN84ET98hAymJYFZKzW8EdNR96/Fx8giYx7BwD6Xumnc1hquKYyp0G2klcXOQy85us2mdNhFYKq4If4YFy71CEhH9Nq8H9D74yoIEei07s1ax11UNaH407BM5UyVFoGYAVI2jW9MnmYdvty7QvNZlgbVaO9SZX0pOKOWUPHFgaJUigStq+q6REVHWyxJ4eHuPVGdLFUeaPEb+rzAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Sat, 28 Dec
 2024 14:10:48 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 14:10:48 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 6/7] board/zynqmp: add new qspi.bin binary to images
Thread-Index: AQHbUsr0Dr7PDGJmR0WOI523dEb3ybL1dOiAgAZJ5TA=
Date: Sat, 28 Dec 2024 14:10:47 +0000
Message-ID: <CH2PR12MB5004080E8484A3744AEE994CF00F2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241220103523.2301721-1-neal.frager@amd.com>
 <20241220103523.2301721-6-neal.frager@amd.com>
 <20241224150803.5813f481@booty>
In-Reply-To: <20241224150803.5813f481@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ1PR12MB6074:EE_
x-ms-office365-filtering-correlation-id: df2a1ca0-d9d1-4760-1c73-08dd27496d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Hzf1S33fYeeyRqhTe1X54jyUdksXt76TanJq/xDF8bVooyRg6VQa6MMitzKc?=
 =?us-ascii?Q?J3B6vS+re/TcLLli4i0KL7rlEpgB/lpNoO2qD/LoMv+IfIU3u+/ETx3DPkiD?=
 =?us-ascii?Q?iIa0UUGlnfV3QqwewSgikT48Erd8K8P0+4l4pAfGLJooMKnjIBh0gBxyqrrK?=
 =?us-ascii?Q?nHYM+qp92LcQvsLHQVpnfG98Nbu1xjwyLSTDdRJUceU9OguQoxjl9QZiPbD8?=
 =?us-ascii?Q?6ntnyX6ab+UywP8Q0g2ydnrhgFU2F3b3XSfZNoWv0fhsyRKKiPpW3k9Gh1kk?=
 =?us-ascii?Q?QfCse7huIXs/0/7Sge8iWybDOfNGb855ImDKgFFcLWZda0eRm0gKceune0c9?=
 =?us-ascii?Q?4CCFThSXwUHPhqt6UNjVQoREXlKLEFEpeucVPgyiJCjCRWKjBOrzKVerPcW7?=
 =?us-ascii?Q?aVaAY2BIzYrmzVOoiBEEu1/YQ1jNouvOQwTxU8wHRJit2tWCIdUyD1v14KeI?=
 =?us-ascii?Q?clK5oP+HnG3eneQl2zmmibNgMOJWdLXmJrH+7zCNkHt6NjqsCVPlBMAbpefz?=
 =?us-ascii?Q?3Ml/DXWoX2j4mlQPvO08PWXLoPxd2+i5eFwZtTIBwublmvHWPGeA/nlBUsh3?=
 =?us-ascii?Q?6qkE+NUgWotvF5r4TLznVvDucNZwaxqVNpos4Z5sK6klTyD/q1s6MmYDhgQY?=
 =?us-ascii?Q?Tzh+CCtE5ny0BoWxTHbHB5tYWsHL/RFEB8gCaxKin+ySEs8Jd70hTe0zv2hZ?=
 =?us-ascii?Q?wqmaBT03e1tRfhktz2oLVkRbGCEZFUZLViocJ6iDc/vsJ240TfHEM6RX41bx?=
 =?us-ascii?Q?YAx2KXeSJRdpvXiv+0fGRqriejJGB5u+LvXtNGfFwgCoKIaxwEtFRWE4sbEg?=
 =?us-ascii?Q?Rew+E0gdIBLpGebPePGW/f1QHSD6GE77vWqw1l6KPPk2mD8sDFgnO2DDJe6m?=
 =?us-ascii?Q?1cmgGGe3eTxUdELIaVoHsOLhZ6ZZT1lZoFuPTUQs1powTOEBv0aoz0plo+ER?=
 =?us-ascii?Q?xKxPmFxMzs5QozgeDu3JWvVqvO2NbNgCeeiLUYSPdxrnxjAUCYbb1SxJki09?=
 =?us-ascii?Q?ONzL2punAzcb5xWo/tNOknDTkMaliIR5Jve6YwUTL+ZViVfwtyM/QQzTs6mQ?=
 =?us-ascii?Q?8CMbb3iNz5H4detqQwpfEqziNDyMwkMACsz9GD2IT+kCTl+A+Pvrq3VWxq/0?=
 =?us-ascii?Q?WfRbvKfOhIpojjm+CFzt1xxvr0Y1PpDbRff18o0zi+DGCthw36EokXEvyHA6?=
 =?us-ascii?Q?s9zV/BpcvaYzQtZwThRqza7MHmiwsSHIQ1QKqBlfdQ6NCkqfjh0aZkN1heXU?=
 =?us-ascii?Q?g4uJ5e8xk94nOQO9xI0vPoM+D64vqf2UyApyma5tLmPIcTU2qR/nZOQPFye3?=
 =?us-ascii?Q?Amq0RMkluobynUJEPAWQz8TvJcAnrkcf3G3iFMJ50wf867wwg4dPZtSy5iC4?=
 =?us-ascii?Q?KkLEFWfxTWkacMQlGYTHnlIlVqBmF9dZyhL9VV6Ac5chVbxppa/amIfBgWeQ?=
 =?us-ascii?Q?sSmLAOcbwDVxv72uK15f4t+fSnXojN8RSUiLNuBvBblJ5ub7O9XgaQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fxM7DmLYvggjWjUfiDEyleS6/LFY/EywFI+5JWjNcl1S+Chf54HnRwPAcGCA?=
 =?us-ascii?Q?2aApA8XSvuMIbZanVnC7QhvijEYUQR33RH64POMdBzLvxT59E2Z+joxQJCMF?=
 =?us-ascii?Q?PglGU50snoMmfMqXk2mvUh+LzQ0veIsrMGUwXhjt9bMOhVHDow0ogTBcLLP/?=
 =?us-ascii?Q?jRoiYBFUm1Vss6vemU2hntAvjXV/zeMUyjLh/KnoJS0qJcTML6WIMdH3GCOk?=
 =?us-ascii?Q?Y9Niw41GxcrQGhOWI/3NnEjV2x4SlAyZCRzeevHB5dMtK7SGvoyWvUqLsdYy?=
 =?us-ascii?Q?w5Jc450L/5hMqKfM/gLpl/lx4CNHRVTQRI/07g5NFvO6A3yXCC57zJxe907o?=
 =?us-ascii?Q?kJ7k+/YTrqHC7lTFqr39QLriidx6NO9VCdRCghTKr7abhUD8mgHq4WQNSb8p?=
 =?us-ascii?Q?pnVt4zlfrLbtiUT9Zw1ak7VjTEOX/C3+6JPnPPXEgfLyDxJGzjT1oQKIKrHj?=
 =?us-ascii?Q?Ni4VEhSIdRQ9nnkO7cRc4N6KyWceDYLfEZS2P1twliALFOLWUgUP1SE0vlgE?=
 =?us-ascii?Q?VV8OO0blYnq4NTEHw2zu7XDklNbr9VHleAk0s6z0Q4/cmj5JhBWN6ji5hGJA?=
 =?us-ascii?Q?pU7TH7t+UcVNx596phnSzB8EHQusDfP4aQd3/1z6yNnKw0jfYtS7Gm/ULVQn?=
 =?us-ascii?Q?9Fhtufw3xu3Z71BWv46DXjyuSBsgxZWYu0Cmjnbq0mz3wdCQBWFRtbw5gaQM?=
 =?us-ascii?Q?+wtwDLGIh4opQfrq1rtg5xeT9p7y/ZBE2MrQ4+Cb0RzF8mRzlr03gjZu76Wc?=
 =?us-ascii?Q?0vdYzZY9qmFOmrA1j1KhMkUcjOqR/VTfc9a1j3pVYbge5LGvvVsBxm8Kenjg?=
 =?us-ascii?Q?p9GR8maLmzEyZeBGF3sReEydSDk3honoawPKeqVYVZfYvg9HQk39WFjiCs5v?=
 =?us-ascii?Q?rpy+j7CiqjHJECEMD/YRUqOo8K32qDP4fG7oxlTiJzZCxLW3iJihVpkOIbQ7?=
 =?us-ascii?Q?uPk4/2bl9k6azNfEfy8TNjNPmW+YWq/KRRmHMJU1zOnRn8YTZuA51YzFv8g6?=
 =?us-ascii?Q?SM2sqA/vn6DiQ4lw4DMqwls91Jh6m+QEKVmAAVvX5fNLZ94WBEKS3dKPuzr6?=
 =?us-ascii?Q?npYF+4vROaP8bKqhFNchneHU9p0HNDN56VcUF79IswXADgPN5OtRk3OWZSvd?=
 =?us-ascii?Q?wbRIXuUmb9XJWcghnQZUqm97sfrvJGIo9+stBEnnhzpaVvMITroP8fn2e+QI?=
 =?us-ascii?Q?kH8nREUFgiF2aVuMMvcxizQ5CHGkqR1pF8HYcm7lWcl957Mvx/FgxW4rSrqb?=
 =?us-ascii?Q?uYeoE1mrC/LgeDhLujD/4iExJPHX+gGv87PjWAtYNGU/McHFvHDplTnbhfK9?=
 =?us-ascii?Q?iQQc1zxSGwxaeR19zkYHzJQ3AN5du47KyB45QL1XNxKQ8wB+roaPDyRhS9ra?=
 =?us-ascii?Q?gDFJCMVrVVCd/6Rchi9cd4zznhf4R7gIvMPmP5OOYzsjErfs+dDjx7K+1FI8?=
 =?us-ascii?Q?WNXPjhNENtHsSbFcspcqakWCz7U4CAu5nrQuVFRjjG0NZlScdLIbn4fn9q/u?=
 =?us-ascii?Q?V6mJbOWGVlBnI/ZDAJ0xyuX5+NWaIpPu9TAAeRSJaK2cPUCw7hwOT2Rc32l4?=
 =?us-ascii?Q?6RwTOlfhlZaILExZl6g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2a1ca0-d9d1-4760-1c73-08dd27496d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2024 14:10:47.9797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoi6yGOMjvT14XCAntdwUxuJ5fc3CJnAN+gf3MWkNwIkirj90JRQgZh9NPyCN/Qi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJRU5bI0v1iVwiioZ1YGYhaccE+ksqc2jZNqYAnXMco=;
 b=i2Lqs8kr04zxiZXtRGmI44D0E0PJ4bWYMqz1o4qlHhQ2w4PszJNqvwyszf2uH38yD926uv8Z9aXbGtT4bkQB6HBVdK/29e7bIqUPZdrjYtA8DBo7cLvDiuC745NZROulJR+Aio1pqk7j0XL5/TJk2r292v0pEIukfLi+fS19pnU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=i2Lqs8kr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 6/7] board/zynqmp: add new qspi.bin
 binary to images
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch adds the new qspi.bin file to the zynqmp sdcard.img.
> 
> For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
> For QSPI booting, only the qspi.bin file needs to be written to the flash.
> 
> This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin

> s/BIRT/SBIRT/?

> With that fixed:

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Do you see the tool called "SBIRT" anywhere?  It appears our official name is
indeed BIRT (Boot Image Recovery Tool) as described on all the wiki links.  Do
you see the name SBIRT somewhere online?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
