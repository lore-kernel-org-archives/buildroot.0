Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DA7C77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8241E6154D;
	Mon,  8 May 2023 16:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8241E6154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFdyah6LEoAG; Mon,  8 May 2023 16:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997AE61557;
	Mon,  8 May 2023 16:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 997AE61557
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6231BF35B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8BD4429D0
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8BD4429D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsjdDOijbGtB for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:21:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8ADA41D17
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::603])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8ADA41D17
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8jOeX1ZMv22FfBlbDR05dh81jNRnHEXrLToKh8qtYef101zhGZVTV6VHhUCpdLpMNBI2veQqCx5rnWUx86jw/hQACvMDZWTbKrHaAOoW4Mm7fKdFMo6LQOPBotQwD4Dw0NkBNv+tij5LG8/7NPUWZhdLTLQS+VVixf2jIQPRXNqfBCAScoCoQoOcoE4uj+EGOLjjnaSgyDpBQijogud9ZGfUbzoHgxT55ZqMo/3dpqdiX7dgmRV6ozFVjYtRs25xOrgUzo4tZHUT308zzenrzntfbpe82kb1eouRWoKv9Kd6GPbrQ6WrIJ93Obl2GrfpXxVI4HSyiubLwfinrswQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMFz6uTOC8rkWhuttBqrTIbAMizaSbX/L6I+09Lw9RE=;
 b=A2/9dtUIu1MKTMQtk1BwsQ58VT8JxcvPTty/6lETrvQfdh843dxR2TEpGNqOY5hrZIbzI4VpwXLOHjamSU/FzLh947R9j7YD7MpAAn+1XrlL10H/wB688Sa+qeOcy1UHcbmP8wMz6LArv/BUTzurLwq/XYhUNhTtPSaoBivEoyK97oeePlUPBP2gKujLM7dbPU5K2kXRHUKZbZUPLG3Z6DyQAU5+NIgPtEj1mDujGQjm0YITmDSWzQ4E1x7DJ7uyd/x3c1VgWI2QXwdWHt5ZRaK0RVFcwXbNClkdTi+fN0RHB0M/gQsq5Ap5h7Z1XjJlZokE4VabXnqHER5JkzmeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4911.namprd12.prod.outlook.com (2603:10b6:5:20e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 16:21:02 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::28be:ba44:a0d6:a3ff]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::28be:ba44:a0d6:a3ff%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 16:21:02 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Thread-Topic: gcc-bare-metal package for microblaze cpu - help requested
Thread-Index: AdmBx5l1OwGPLaXLTPeChQYyGr1mjg==
Date: Mon, 8 May 2023 16:21:02 +0000
Message-ID: <CH2PR12MB50043FBD2A7DE5E4EE0DBE2FF0719@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM6PR12MB4911:EE_
x-ms-office365-filtering-correlation-id: 97d2096c-e0b9-4c4f-904d-08db4fe03736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GL/SjuFO7DPb0dsXYay/ehVKVHbKZrAXTsMo5Uwnz5idR9ngUjUKF4ALEtTOijvP/d/BPWiEKHXgdCgfc2OioI+BsO6GBb58T2p1xbgd3wKYN9QfDKqiZbrG4VU3RXM3JKBX/K/lzd56Dw8vreAyNWKUPUM2QqZDiyMTdgQl5Skp7EnZUN4B+7CzeK/TSJZPKJq7xCzUtTqqXwSToLcuUPwGo5KXNht8euFnEOZ0wIOumgMK1GTPlatwze6tJ8LsHlXuaR7EsFKro4p8ggjMxwx9zrkGk+yF8doaqjezLw80kMwDQpfjmWvOCIVv1Ynq19L7kwNgld4u3c+gUfKCnr3hkJrN7DWpF8VdjL3dJ+P6erFdcqne/TWpWVJsvg8hjxWLZpSyIuopPxDE1zzGguDP5lMku+07eeUaY62lvgsZztBATOg8xrF7FIM6FuO4wfu2Bg5WbEMaz/LyTVjUmT7Vks+UZXRi0a4vMlIaTq5RUGU+Mqnx4+lWuViZo0TpxMHKc7SFi5/88i4VK/IgOhR0o67GSQCXZAJXlt3G1W312w7l5CNAglbqJwIDXQsKX6T78cFpkJ7zl8mOo5QiXLrfmPP2l5I2VBEzgBV8zWfQvWS11VymDQ+0e9WO9TBV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(6506007)(9686003)(7696005)(83380400001)(55016003)(38100700002)(122000001)(86362001)(33656002)(38070700005)(186003)(41300700001)(2906002)(54906003)(8676002)(5660300002)(4326008)(64756008)(66476007)(6916009)(66556008)(66446008)(316002)(8936002)(478600001)(52536014)(76116006)(66946007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s3qcU8Z0brpXw/m4cgmotE7jUr+XIsQ1l4woPGz631csUiyyPrQaZSOjSfF2?=
 =?us-ascii?Q?nCPdLyPQI9CcZp35BbvesoWpuNbBeLBjvwBz48vbBYUMvoAGXqXve0ECaotr?=
 =?us-ascii?Q?dwTmSdqGLekED1JCSzpL960xGGOiLTo6kg+1Nqd3Za7zeo6xAfujceb5k1lI?=
 =?us-ascii?Q?mCRHDqNq/Fp08osTcJd1MOcaybm1D3MdFioqRFsw+JxJzWYAWCzm+58Jcn5O?=
 =?us-ascii?Q?2EpSGcNGk5eqalzuxGhX7rNCHco4bDw+LSPwneTr/k6WaCMXLD30Cm5SLQ3Q?=
 =?us-ascii?Q?NMTxEUhhxOdKT1nALUVA+AJTlzjuQ2F1sCabLPP/zLP2uVB7jcZ1vFBYJ/3v?=
 =?us-ascii?Q?qrjKPKxjEYKzayIRhz4lXDRGfAhsGXuiWrY5xcTdo6Y17U8+mjnjlAqNzAk9?=
 =?us-ascii?Q?J6G9x5+tR81K0KlWb0HgaJd0L59sFarRXT90YoPsh2dVn67eGVR6TpU0U7lm?=
 =?us-ascii?Q?V/au/AeKG7o71RQTACSkJ030YLD2CsBFwjSDNCh2ZEHf59QipNcEO0XU9G8t?=
 =?us-ascii?Q?28VvK0t+3gyjNneiWoaFm/v59Q/sPFQ29sUAKfpWpNo+fIiPAw6gjvDtocen?=
 =?us-ascii?Q?wJNl/b0fMV3giVWDD/4O4887J9RTYOw0o03ZVYj4cGKfxOrYLS9XaosYtcf/?=
 =?us-ascii?Q?ExMBvBs/goafZqTr7QMRNDadBTnD7vxBgIayKmU+LrJxdFhPXjtj/GHwDfgm?=
 =?us-ascii?Q?cbOattRyAcaTgLujRaAKcQo5RaNoLJR99/p2CQQoat4azUZfyJ6fTUeAHyWG?=
 =?us-ascii?Q?wnz2e3UFRDm6uOdMg5gYp3v/zprRRqx9/58s/oYUcwbL6kwlQ1KK/g0rjfLr?=
 =?us-ascii?Q?LZBsV3S3C0bDlHhJ4MPu9W9Zks8LFAeNlMmeKNhbNGu7UqwYCnL08lLvCOjK?=
 =?us-ascii?Q?SetyKOMSpPO28uXQzQFiN17t5XLI5vlXKBsKsDv8BiSDyfAGboYvoRHfk8o+?=
 =?us-ascii?Q?drHzRI66lgiUvXNP4ae9dX1tThQY8InrhFouCJ1t8CjSSgXcO6gDux02PKO/?=
 =?us-ascii?Q?NMBh9g2EkwXjO2QS3ibiSYLbvBP5jyoJECfrfWpBH6b0klqHIj92mVOXxTsd?=
 =?us-ascii?Q?d6hl1SfCVBPUECZI9bI8hfhRC3gqrypuhjD4sIBkSE45U8Z35s7bLq9bVnnz?=
 =?us-ascii?Q?kPmvoBYkRPiKVl9HD7xLTVJR4C0Bny5XN7eDcwnWPnJOAVeYsXvdwSWrD/7w?=
 =?us-ascii?Q?W5R4a34cQBTnMaET7z1BsSB7dAtu8prpYK8vwcaMG4VdMnDr0X5X2JmiNq3j?=
 =?us-ascii?Q?w09yBiCJ203tTKzFl3FEFhtvPTquUxXxzFcrdfoc4Glw0asQt0SrmXi3/pbU?=
 =?us-ascii?Q?hA8Ar2fVdxHjA6zUTIlOAGnvUqV5NrQBKbuqyo2JBQ7eqIiWyLD52/U6N2Rr?=
 =?us-ascii?Q?mU/g0bkZsJQglSbfkHTcC21yvSh+7AmsAmgPlrpZE4PAjBA+XW/OyMcKxBW8?=
 =?us-ascii?Q?aTbWFtCFuThFKjvLcFxrteaoA9a8BEvwmcSDtWZzzduRyqiJzL6BiqHZoNgA?=
 =?us-ascii?Q?q3xyO+reN8uMQVI7Hw5j0M6JbPjp7oz/OMVe+T33jyn+PT3DRRDqXD92LfAt?=
 =?us-ascii?Q?zpV2hqPn/RKGF4zsvR0LQIV5Hl9MfO09dLDZrnJpKLaM41GJULQergx0gWnE?=
 =?us-ascii?Q?38pTU0ECif/G85U6F0DLv0k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d2096c-e0b9-4c4f-904d-08db4fe03736
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 16:21:02.0141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpZR73YCGPy1MGngrGHbdNIdaJ7UJUlOsN2+hf3sDj+yWO79O4o7leEHl3kQizpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMFz6uTOC8rkWhuttBqrTIbAMizaSbX/L6I+09Lw9RE=;
 b=JLDwY8ho53/DfZukgF3PN7Sl3Nw7ZUlDoqjwaqnalJncYRSLaz0rRhBhb2eZhbjXcOarNiwjT0KBD5ktvcJ1KRpJHHgMp85OffQbu0GgUxOCaILWog/veT3VLec7aCmAbDGwYLuPd736VLKMNP6RHQsojGOrIwAoQGz5pAvxlao=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JLDwY8ho
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: [Buildroot] gcc-bare-metal package for microblaze cpu - help
 requested
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello buildroot community,

I am working on a gcc-bare-metal package for buildroot in order to fully 
support heterogeneous platforms like the xilinx zynqmp platform.

Essentially, the zynqmp platform has the arm cortex-a53 architecture as the 
main cpu cluster which is running linux.  There are already working examples 
for this platform in buildroot for the zcu102 and zcu106 evaluation boards.

In addition to the main arm based core, there is a microblaze co-processor
which is used for running the pmufw application.

The goal of adding a gcc-bare-metal package to buildroot is so that we can
build the bare metal pmufw application for the microblaze instead of just 
downloading a pre-built image, as is currently done today.

I have successfully created a binutils-bare-metal package which enables me
to have binutils executables for microblaze while the main compiler and 
binutils are built for arm64.

However, I am struggling to build a gcc-bare-metal package for microblaze when
the main buildroot arch is set to BR2_aarch64.

While I have done my best to fully copy the gcc configuration that is used by
buildroot for a microblaze based cpu, I am stuck with the following build
error: 

../../libiberty/objalloc.c:198:42: error: unknown type name 'PTR'  

Are there any gcc experts out there who could help me with this?

Thank you for any assistance.
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
