Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E857CC55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC7E4055D;
	Mon,  3 Aug 2026 07:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcXhLVKdxlgr; Mon,  3 Aug 2026 07:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AFB40561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785743996;
	bh=hu20M0OXWwmics+qad4a7ZZIfxezzb/KoHNh2wkrBbA=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=bwxQYN+gfr3KYJHqgGMQ08Gof/UKAqr+CUWm7F4wPex1SVKhIFarA0BzMDzchMN4y
	 8BMxO+oLijmJVw8QcJapamUsVQw+F7zza+UUld+GrMlEjWQVpBisYKkyQwocLQyGNK
	 aCZhbP3JiFmIVbTwIds2wYQ20zyX4tB6QLv4QBxp1RlWfIr2uR2Tn7+NELWQCawkVj
	 qViDdeOnPaYGsOmMBpYP31Vlz8h1c5RoBgP8mrnCl92iyMn+vXrghu+haZLQPXkVeW
	 DmicpL1ypvc3Vzl6RqyPdS1JBD7cqDmlAPS0xAzH7aubbnd2Si9dUFuEttLu9FyPQD
	 M2sIttVE5OQpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AFB40561;
	Mon,  3 Aug 2026 07:59:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C021218
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DEE9400A2
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzPBM1XkjCyg for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 07:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c005::5;
 helo=co1pr03cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34F0A40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F0A40024
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F0A40024
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 07:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bn0A8bMjhGS2vPVwx9iyjDKEeQ0kkk5hLyWulkW3BznUx/+wQKbaIq+dvpjOAcguPT3VcTz1VqDsHCwcn5lb/CD3XDJPEBayi8v+VeB03dfgLzhR93h47PReD8l1FD0UagveHL7w2I00Aa/tFiHaBv5Sn5a6r0jaJwzJRLfRPGtHT3EiwNFcoC4QQ3sP9r23swmU/TLdLbc8d/ElIcKTnOjFsq2fgJbU4QH6tM1lR3ui1zox2+t59R2hEwEHfqGRL5UFuSqpVIYFNHXCU/qWu6XDnOY0cBC4Iy8K14trlIVLMnekEljBQHA5snbyINR5MQ/izjq+z86ViG1xxCYAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/FIX/2cjajfM3EvLiWDaIc7BXC2zzeu9NK1n/t74N0=;
 b=foTYIK0FkQp/+nJsM8FeS/6rrLLrl6KSy7AdYZLBHP1eCJpSnfBPcjCo/OANs184hGeX1sTf9X82oxIMKNBfEKwPEdbceR8iyw8aHCdOYUzqsggw9lrJFG/3xNHH1D/x5l/c3o1GNhAlsk7atDvD72rirvlDsdx+9AOEYgr76S9Z6kAvnyl7wxpY4EnSVxUI2/PgDULfpXNWQX5Uv3BPK9RdYEKQowBF8gqJB5F6fL9UG1wg6czxaCgNlvJ+IzaazvWp2kwMDSCwBnhtaE3TOyShqtuOi+NuDuVyZBEJ8KVvj9omJHaTZnk7R51XOSXIFcqPEgf0CegI0T++qSceSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by DM4PR12MB5914.namprd12.prod.outlook.com (2603:10b6:8:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:59:46 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 07:59:46 +0000
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
Thread-Index: AQHdIxtNsy3RyB59RkiN0NHWqZaw5raL9IWQ
Date: Mon, 3 Aug 2026 07:59:46 +0000
Message-ID: <BL1PR12MB5032DC299BB78F4850D1C44CF0D52@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260803073948.3631110-1-neal.frager@amd.com>
In-Reply-To: <20260803073948.3631110-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-03T07:54:52.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|DM4PR12MB5914:EE_
x-ms-office365-filtering-correlation-id: c66f47b6-664c-4cd1-ac71-08def1352f7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|11063799006|38070700021|6133799003|10067099003|56012099006|41080700001;
x-microsoft-antispam-message-info: XKf7USiXMDSPVY1rAqBLGPt8uBBrYrRr63tnxnJ1PRRU2C0ICAGmhelW1U/H/7/TA9ajExOZzFMwXVPGwrdFV12gv5Yf7oq//2k15wtJUZFyF2GbOYtVcWsoAuHmbWmxdYx7w+j4ecwqujkYULnBkohek3V26N5BtAy5DxyTWcRPLLFxg8EXT7SjWST9QiSxuMgidrr78wchO05RCqyTYhY9xW95OXb4Ll9hwstuiQHOqeXl71SNEAewQFjE73gT1RWZRHczWRO0JrhxQ5Z2gzu/Prg7jY6SM1++59dNBxMOoZritEO/4NiNKJurC+06PrPujjZNszd1jfi5UZfSbQ4fH36+9Q/JgHgaOkmm4cfC3qzvfTBFxG4gwxjRCNIg4uCrw1gRQBuR4DWQ1pFFX05FHJiPV2L+4P9ogfjrdcVh+9nCLdDq0/VK02GaG2VMogjNIjlr501JFYweSUgZwf1GWS7SB2/A5AZ+yJjinphLmTW47PCv7yVlr1re2VTLW7NwrQlIvutdhdafyT0QGsP/Ua4ll44DB9q0AqtBJ30SFdBjSs7wMrY6jyPCVIpuaC2tiIud0eyfNQeWxpe+xoz6JZGZr6307itCUT6s/fqg39g4ZzQjaHszZhEF3+vd6rb8QEMRhuwk/m8Pn4Z01Xild4WvW5hViMTtQWN51WzNZ2lqawUOzSbbpr5c3Git5I04/BNTimO7XO3t0n0wujnzY+PBbZMX3YnGeEuF58ZhQD9t8tiKnug6HgEbybW+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(11063799006)(38070700021)(6133799003)(10067099003)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Y0BV3FKm2pceRhNVpHFxhiMXg0KPZUbo2ql54HEiarI/M5Pgv4bGwbQF4O5?=
 =?us-ascii?Q?kCMY8IDWR2KBst7GQn1xL0Ecb1R5CrojBl42j/I+P4K5DUIJHbHfIde6wxmM?=
 =?us-ascii?Q?F5wykeoWxgYOMOb0I3AA6Oz6JNNETMv/MYw6BEvVBPH+8Zw3TTiGjl3ML4N7?=
 =?us-ascii?Q?q2L6+A8IJz+JzXvduRMQyO6+1DVzo6uIjM5m1LYk9z7bPjqzVr8/gERlJIsg?=
 =?us-ascii?Q?yZv81GwayvQp5iNVZFSCK++C7TN75UwqGiNWtkepTqCKxHxcEUwZpPZNwRQY?=
 =?us-ascii?Q?fNCPK6mhzKmvvrCByJOtu3ftYXVoueLPOAm+nVsAlNlyJW029jJFk0mYh4d8?=
 =?us-ascii?Q?9fYaO94TaBlOHLPkD1QKreNP4uvV1xajxdfx7L/+Cif/mEIK0HiectcIna21?=
 =?us-ascii?Q?uj2gtSWmIyMOkTLI2Tuni7+xsbNFn8khK31uEgDJUNQQoJejHU5vuPzzL/MM?=
 =?us-ascii?Q?5DOt2v4xdhboLiJgsjFOi8NI5/JXShJ3JR60tCpXJITyMtlBu9eyWnsQ1xD1?=
 =?us-ascii?Q?zE9RbaEu/UlCb6xBk6e6Kv2jY9XZRpo0Df7+QavrRSYYjrXKvbPKV+4Rs50e?=
 =?us-ascii?Q?Av1M42+jnKsp2rnnoT1U0qL6IcoSz2YyuhMhlpPUaoZhJLv/JAuPCYgXWpqV?=
 =?us-ascii?Q?aHg5VuKG8QFLOkXKHbx2YwYJhoXFucrGmN+p8kUUcO1742pp9HsmR84Z71Wg?=
 =?us-ascii?Q?0f7XgScNM/+tqmFD/TbsDRmDko6LPGXJOLTuxdD1A+8DZxfZdYTIf4gZIDzQ?=
 =?us-ascii?Q?jonZuixlJyg71WGRLprm+PQul+H3KywuU0KNkMoC3aaukPv4dpEIBWCwZdVl?=
 =?us-ascii?Q?Z74sJK18Nf7UEPZlYb1HyNmbjDeXMoRAN6O6ASQfvr5az7kBhgeeuj+8pvxA?=
 =?us-ascii?Q?56iGy8ClJH9C8KgjTg8ubAW/1TZZyGey2S1GH8SmmtOMD2BiZfuxrQpwTFiA?=
 =?us-ascii?Q?P2wHrmkbyl+XcqTeD4SQGDqq36Gk/s2BmE3oOwtF8PsFTiaxS/ld2FKBHr5y?=
 =?us-ascii?Q?labhQ6jbe0lxboxhKu7ZM0an1jpGnj1RZjvvXrOFB0+GpPW3droO/3yphNDs?=
 =?us-ascii?Q?J3fLZWBC8uTy+aD4MkvhgjERgeFiv5XwkXx+axw7dzpvjmIZPbgZ5Uey16kW?=
 =?us-ascii?Q?O5iJ5LTBs/ysiH5INDwaD0TIIetsE/aEaRw/7rcEOr3OsXrhnpZDSCP25C94?=
 =?us-ascii?Q?u5vcsAyP76eX5FhHp7x1HjoC3C7a4zo+ajJqCRkPVTCmlCv+WCYj0RGwa/6/?=
 =?us-ascii?Q?wNqVI9k5f4qNadWTqv0SMai2JfmWwnAD/mZRZ3mKDMjQts0nu/oNM96gVo0i?=
 =?us-ascii?Q?v3ZQo5YkeTRliw62ihBbBH6YzSyGgn0hOEl1mXSSlvaoX939twZzn3EWKoCm?=
 =?us-ascii?Q?gVrrXmEcSJm8icoR1DQsSI8g1ED0veIX767Bc4qcCjK0lR8OYfdszat0ftqg?=
 =?us-ascii?Q?xm+XzFpTjYXn7oOMwJC7uP5GadqMTyzNefRIt7gLP9BfuHFMM8Gp7VvMACku?=
 =?us-ascii?Q?gqG389T5VZak74G+64o6h7w5iablB4ZPoXJyz9Sc8jBLSalK2QA720hOa7fS?=
 =?us-ascii?Q?oMrrzpUIzkosmleFNjUnE0X5i8eb86E/Sp6dLlCi09fCDJdMUpCX2o7Wf5Yq?=
 =?us-ascii?Q?FgN2vG+NHrOIAg4/etmpHfNvVcI3QUcR20kjr7fgXFydo+lkTeRK5ufKnTQ+?=
 =?us-ascii?Q?UuStrNi2nvdGhGZlpejsIfjnMm89+oTmU+QDqcIdxzyRP6cy?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66f47b6-664c-4cd1-ac71-08def1352f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 07:59:46.5027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +liGtV7/1MY+4pP3V1IlyD4iRy4ts6si4lqqJIHBjxaEtwX+maG/F299SQFyZy2A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/FIX/2cjajfM3EvLiWDaIc7BXC2zzeu9NK1n/t74N0=;
 b=33vjlU07ysK1F3dKEyydZ8HwDzxJjV2IgE3MABYQmaS9cLqW15A6TbA7j4pGizGVxomRmr36oMTnm5DuA3tsQkrWG/K3HZgogEFRSM0ZYe5ybvSOMyn1FpG3JjTkIAC9m+Mn5YognKPwYXRMEkGLWlvUDveBiO6dFzF5h/vYndk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=33vjlU07
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Saleab,
 Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "john.ernberg@actia.se" <john.ernberg@actia.se>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi all,

Please disregard as I thought of a better solution.

Instead of changing the xen dependencies, we can correct the
0002-Update-linker-flags.patch by moving this portion of the patch to the
qemu-xen package where it belongs.

diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
index 6bcc83ba..2590904e 100644
--- a/tools/qemu-xen/include/hw/xen/xen_native.h
+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
@@ -2,7 +2,7 @@
 #define QEMU_HW_XEN_NATIVE_H

 #ifdef __XEN_INTERFACE_VERSION__
-#error In Xen native files, include xen_native.h before other Xen headers
+#warning In Xen native files, include xen_native.h before other Xen headers
 #endif

 /*
--

I will send a v2 shortly.

Best regards,
Neal Frager
AMD


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
