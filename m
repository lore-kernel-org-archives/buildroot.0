Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883CAE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 10:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174C960768;
	Sat,  4 Jan 2025 10:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h20pYfxiuxkT; Sat,  4 Jan 2025 10:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC204606EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC204606EF;
	Sat,  4 Jan 2025 10:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F046CE0F
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 10:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC55E80561
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 10:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61IkaIog78Mq for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 10:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::62c;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E31E804BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E31E804BA
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E31E804BA
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 10:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpz7DuXUBmz3/gxTC+K1+v5bh1MhhUNiYjXJmKqXiS8y+bpEjDQ9DleNMsFh6njWbPshaL0DU/kf1mtMj5GIVesS1/uV4tQlfJ45u23NJG9XZRV56FDX3nzRJkJW6Vd3FBqAo7LrRvDgHsEMgTk3GugM8TTTT8/tlLC7lqhmyD2nT+VW+sgGpgJOeqZXlDscfzaKtzic16/5pJH+HIL0PKtZuS38LWZwZuoY3q0OmtQumm/XfIZaJX0Fes4JYaOxm83655IMrRvJNEtSY3QV15yHv+62F/OlPgq6EUWrW/YeBm/7WD47n41Ej2IYPSQMCBnTP1fkOA0PuEgaZCSetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08zsQiYe5KyLQ9RmiS2JrNEArTuKZrur0fGh+t/6AXM=;
 b=Sz0oVFfmWT/itu6pMASqsLtgxYlw6M4MxPBuka1t2uEcRAtnov5t9Lq1f68aSpFlY6tj1XqtU47eAM4CaPlig/xp7k4YEjTUr1nsbYfjBD48cemvCtmQ05kASGZb7Y2K8sR+58lSwzNSAEZm7E+gy+X8uk52L0fa9Hbd0qFIJza49SocyAxgwgUCQLix+TBXNN/Nc3gWxZxFey1oKN3H/psU60e1SP0TgFSMQMm4ajtNoIsPmPWSwDEi+TmZy1DOVnw1uVr67DZ7o1qcoHqffS9DHYeyBnfss6GeiOQVDO2XdOCJls+Bk5O9qYtHCVTTteyQjVnTXpe4wozdWUAiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Sat, 4 Jan
 2025 10:12:33 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.015; Sat, 4 Jan 2025
 10:12:32 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/2] package/newlib-bare-metal: bump to newlib 4.5.0
Thread-Index: AQHbXQCefVnKVtXNyEaTwLvmanhcebMDqSwAgAACVTCAAAjaAIACsxPg
Date: Sat, 4 Jan 2025 10:12:32 +0000
Message-ID: <CH2PR12MB50045AF050C6584A7889892BF0162@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20250102102500.1420512-1-neal.frager@amd.com>
 <20250102171550.0fd6908f@booty>
 <CH2PR12MB50046D8C2D6E66801E9E3905F0142@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20250102175552.4ab20524@booty>
In-Reply-To: <20250102175552.4ab20524@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB6777:EE_
x-ms-office365-filtering-correlation-id: a538efc1-c054-480b-8137-08dd2ca84dc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AfjcYvWJrWPUREHrir1hkNP8Y0s52pa0I3k0pBwf2GUQkF96O9mIKk2NZXuW?=
 =?us-ascii?Q?fksITki0SinzUk76DtgZAM0KUKSvjQ2vkKu+rrJbE63oQYSJMq3zSJQlwkPP?=
 =?us-ascii?Q?o4u9bet9crRueFE4Tu8qW95yeU4Giu13Nqi+rXI/KOpMrinSCDWwqJshVONb?=
 =?us-ascii?Q?SBECH2RM0WlsnT5Q57TJ9NEbLqP0RNoqG50QbHjqn8A78qDZYZvhfV3IBUvj?=
 =?us-ascii?Q?ncCxq2ksq5zDHl2VZf3kzlKevC6K8vV2Jnod78IdMejwBlcLxIYzVxHqEHDk?=
 =?us-ascii?Q?B9YohYtmVH5caOhVqm4/LMLVtHHZh+7Hu66sed8KL2EAnuIB87YmPmgnGhmU?=
 =?us-ascii?Q?hxx4k/szLN+sk+boJA2HIy+Z8YDa3uV2ld2xIfH+wPfKW4sBLu2PY3D4qxh6?=
 =?us-ascii?Q?iV74AxysYvKzkqPxpYorariBotz+lYD1XQB+gMb0muFcbQG79kHeIlrD9VlE?=
 =?us-ascii?Q?WOQmAHcVfbdX5TbXHjZ1kBNpvlzFQKwmZWw/cR47yuGp4pFhqEQ5YEF3zoQe?=
 =?us-ascii?Q?snqxwvDLtRTd3t2XHOc5cfAaVTdhtXnk3svETJ5LqJu/6nG2d7SItyEPimHN?=
 =?us-ascii?Q?pRI6Aho1xf30SuCuEqioxaFH0ea52xyhNlGqCO5LKWjsMF1slpjtHI1L3z48?=
 =?us-ascii?Q?Jr4JXNpzQVP0mIH07z8bq3Cnm42l3dHtkfvA3heeSpCsdEz3BrhoqXFvhfnC?=
 =?us-ascii?Q?+RFUrW55IdwfGEgGSS3c5HZ+mohF/VyWQvDpZo8XGsDvtcM0KU9nw5jeGi8O?=
 =?us-ascii?Q?ajvHmdSYuiUVWIRZwB2BkYeyi+Eq0CQXfs6PqQc9KDP3NxNSgkpIs9I+Ed9M?=
 =?us-ascii?Q?gxhurqWBRQh5MAd/+c6vqLJjNMdM2svzKgdCs3BR6PYkb+kFR5tCI7kOei/E?=
 =?us-ascii?Q?R77PUVef2uhDxVq1sFxGj/xkO4nHOvR8U1YQWoaIs32v6e62Uj9JiH3o2bou?=
 =?us-ascii?Q?LbkFn4yN2pKbndajGlixZjmDBJ8fZxQF8cK2s7lD2YVRN1PguspFA+r58IFy?=
 =?us-ascii?Q?DEMJ+M+XAUT+3hBtSzxQO1/+38ZAu11kusYPoSLD0blR96lH0kXMg/1c1WKI?=
 =?us-ascii?Q?cxYtWbJgasffapDYfFIynxXTyeMFxxs+9J1iSJ3wrFPiB8sOfttMn3dS47Xi?=
 =?us-ascii?Q?uFE5N1SGcMqc1tyyXd/KFhliWY0b/sC/XutNdYCDeWCQSaVpYWqia7/VI8YC?=
 =?us-ascii?Q?Wnymviwa9Wfgk1rM6DIFV+yhi/nSHzjSP+KTUeVcN4EUPH1kXs39vBHrHdj+?=
 =?us-ascii?Q?ezzy4DC/DPiJSc4gwCyQxKtlGR75GcCTtKdNhXiMnVw1GTRT2YaqSPCVp8R7?=
 =?us-ascii?Q?eE5O9IGbGOSRXY2cuNam9lToOBKkP9WZeYwJX3HwqbU7iJ+k4hGmPlfTYnET?=
 =?us-ascii?Q?dWuTEYsXcoxpEtEyfoLA4NLQbyGspNhP74zVg6Jr1YWTefc+MkK1CG70Sk64?=
 =?us-ascii?Q?L03N5xpY02s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VdaVXVCIdnGUrYd3py7SMymu1jnaJSeVo8M41WFmpmaZf9Q1sw1O7NWwujyR?=
 =?us-ascii?Q?91Qr1Mqar4dVsk1gSuXH1w1AfbLC/ZiF69H0/xjPvLa5NhJI6vB2hVgHNyME?=
 =?us-ascii?Q?SYwnBLI7yis1dd2IBrZNv4Cie+20ErxnaNP5vOAQF3+f1H9N1BHipLjPjHkD?=
 =?us-ascii?Q?oadFHzLq8RqLNbRqxe09sZdLxzIp6ZzS8FYDH26BEDIP2o/HV3/aGJwubcxO?=
 =?us-ascii?Q?+bhR0w+kYY0R8yF4Xy8Kf/zwFhxSVRFFwWhAETyya0c1zHp+H0rumkSpTnpw?=
 =?us-ascii?Q?IAWC6nfTK1X5gW8BWzuzo7uVYjNuHKr/xuZ9oeeZ4seUV7phDmpwEJlR8LAO?=
 =?us-ascii?Q?YXUV8Pe/B7IFzbT8DJL3Hhtk+gf1177ZC974MhZsiJivTe4Q7JoojXnPTQ1x?=
 =?us-ascii?Q?jBWwwrP9rFcu9t6IH04/UnUO9NuPqveGX1OFGsgS9hlwnM8G1zkb5o0iLTrJ?=
 =?us-ascii?Q?ZqO01p6S7TqQxNninsHT8zzpQnxsGLrjg9mezG4PTCf64LRWjjP2kKM1uwUO?=
 =?us-ascii?Q?K3r27brEoJ0WZG4Sy0Y1gLlDxpY7DXjNkdLzQpeNgrsf0eLTndcyGDiqU7Z9?=
 =?us-ascii?Q?Tako0/6tsHLEHu2qk1/m7u8Hktb5bvObBRQugMao5gu0Lnf6xmvvUTM7/PNM?=
 =?us-ascii?Q?2b13f07YvEZ3lgn2iWpNjJUW3vP7kiG0NrZQdVAL9xq1m3lF8ptxg8/RLp1A?=
 =?us-ascii?Q?L8v8yzs65E2Ni2l32lkwxsRfKPywE0NgiDhh/v0QZeUINs1y3pmNLWzWmGZo?=
 =?us-ascii?Q?JhL2Qw59cFHZNgpriIUe4/wcv9CO6DUPMSGfoEOnkTphgweaK7ljjuDQ4TIB?=
 =?us-ascii?Q?io1BRY0aL+QQwZU/OcVbV1JMkoICRp5Fu6BmOsiESgvuoQtRM5uZ646XExAF?=
 =?us-ascii?Q?9V8gZhODTFKbCV5HoIw/EyjcKxPAvwky2Nq4FoCZDMk19fiSIYXtggZFqdqC?=
 =?us-ascii?Q?W5dg3dt2MYjCbdtbqG/tLjDOF9azcVGO0bumv26w8s/b7Tl+EgD05Y5LyEBi?=
 =?us-ascii?Q?g3ooR42GJfmveNUzLWCBeT8knhJfYf6tXUnhmlD5UWwVL03Ue5897xF2Grcm?=
 =?us-ascii?Q?ESslQ/liGtxrbAN4meDIzaNS+72hmAPQa/dCkE67PmVSCCMS+BsxfQOP5cmT?=
 =?us-ascii?Q?GXfvDFuAmbCPsMKNP+EvWXq/wRWzVnCN0fRYJd00ndxMf880QfwSgmb98FRm?=
 =?us-ascii?Q?swlfhejKIdywgBE79oLGqTCj1tvjTnUBIgYx3+6CafbOuZ+Kl/KpuzBBAuIL?=
 =?us-ascii?Q?y4dJUhvHUUEC7Zbd1yVYwSFIJ11L0PZwhNHlvcRC+pb7X52HqXAKL0hIXHlU?=
 =?us-ascii?Q?7JEkZQ49NPqkgX7ypLjk3xhDrSnoo/WQxxdeHz5Ri/TS5a1K0ovCSW8qkTdT?=
 =?us-ascii?Q?rlzkF4Boo6wMOCBnJWeoXetFROVrupIAKRUaZDX0jVGKOnnJmLdCzQ+f1Oka?=
 =?us-ascii?Q?9zn0x5UF5XpWwgP0hoJuLRnjgIeWONqRv0pnXWOejmzc+2n4YuARzZFbxY55?=
 =?us-ascii?Q?c++QoFKv78Vwr5M693sDI7lPvwFzBPI5olb0mle8mcgKIydz4zz2DBLiSZE0?=
 =?us-ascii?Q?XYoVRhw2PO6+LDTk2rg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a538efc1-c054-480b-8137-08dd2ca84dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2025 10:12:32.7179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sI6G+U6qD4BdUtr//qBTJJqBn8htq6+ndC3c6W5+g35k3RvBq9h6fOCoyWH0//8F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08zsQiYe5KyLQ9RmiS2JrNEArTuKZrur0fGh+t/6AXM=;
 b=ke9SRTPyqLJoT6PgsPvoXXiksxtcZ9Y5JsPnPX1jk4BHRoHLcesAms0BeePGRwWvFdiojrY6+ZCe5KqU/oh0rf1/ltGLEQdLMYby1r+sYGWHqfUflKaECGUaCEeJ1Qbfv5owidix1hAHCU10fOgJcmeNeIYCpHu8QmRxUrPua3c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ke9SRTPy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,


> Hi Luca,
> 
> > This patch bumps newlib-bare-metal to version 4.5.0.20241231.
> > 
> > The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
> > needed since it is now included with version 4.5.0.20241231.  For this reason,
> > the patch can be removed from buildroot.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> > I also tried to test this series, but then I realized the
> > zynqmp-firmware patches have not been merged yet. You latest series is
> > v12, June 2024, and does not apply to current master.  
> 
> > That means the bare metal toolchain has no users in upstream Buildroot.  
> 
> > Any reason for stopping after v12?  
> 
> > I think it would be good if you could rebase on current master, apply
> > the changes requested by Yann in his v12 reviews and send a new
> > iteration.  
> 
> After creating the xilinx-prebuilt package which combined zynqmp and versal
> prebuilts into a single package, I thought it would be better to create a
> xilinx-source package.  
> 
> This is why I migrated to the following patch set:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=413161

> Ah, right, I had totally forgot about that. My best excuse is that it
> is also from June 2024. O:-)

> The main thing I do not like about it is the versal pdi file.  The only way to
> build a versal pdi file is with Vivado, so even though the same microblaze
> compiler for the zynqmp pmufw can be used for the versal plm and psmfw
> applications, the pdi file needs to be a prebuilt binary.
> 
> Because of this difference, it may make sense to create separate packages for
> zynqmp and versal.
> 
> Perhaps the following concept would be best?
> 
> For Versal: (two packages with a dependency to force using both together)
> boot/versal-firmware: builds versal plm and psmfw applications
> boot/versal-pdi: downloads a prebuilt versal pdi
> 
> For Zynqmp:
> boot/zynqmp-firmware: builds zynqmp pmufw application
> 
> For either of these cases, enabling the firmware application should be an
> exclusive or with the xilinx-prebuilt package.
> 
> What do you think of this concept?

> I know pretty much nothing about Versal, however if it needs a prebuilt
> binary then I think it makes sense to keep the various packages split
> as you suggested, so what is prebuilt and what is compiled by Buildroot
> is clearly differentiated.

> In the meantime, for testing the newlib, you just need to add the following
> lines to any zynqmp or versal defconfig:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> 
> This is all that is needed to verify that the toolchain and newlib are
> built correctly.

> I tried that and it worked. I also applied the v12 zynqmp-firmware
> series, but it had various conflicts to fix, and at the end I got a
> binary firmware that does not boot. It might be just my quick conflict
> resolution that screwed up things however.

> Luca

I have a new idea for building the zynqmp pmufw as well as the versal plm and
psmfw applications.

To be absolutely clear about what we are building with buildroot, what if we
name the package boot/xilinx-embeddedsw after the Xilinx/embeddedsw github
repo?  This way, it is clear that the package is building from this repo,
and we can make individual config options for each application we wish to
build.

Such as:
BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW

An added bonus of this is that we would have a single package which could
easily be expanded in the future to cover other applications in the repo.

For example, now that bootgen is part of buildroot, we may even have users
which would be interested in building the fsbl.  This could be done by
adding more configs to the package.

BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQ_FSBL
BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_FSBL

Or even the following applications for Kria:

BR2_TARGET_XILINX_EMBEDDEDSW_IMGSEL
BR2_TARGET_XILINX_EMBEDDEDSW_IMG_RCVRY (BIRT)

We could also expand this package for future applications such as the
Versal Gen 2 Application Security Unit (ASU).

BR2_TARGET_XILINX_EMBEDDEDSW_ASUFW
 
Essentially every application in the lib/sw_apps directory of the embeddedsw
repo could potentially be one day added, should there be a need.
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps

Of course, before getting ahead of ourselves, I would start small by
implementing only the zynqmp_pmufw in the first release.

What do you think of this idea?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
