Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF73C87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6390C611C7;
	Sun, 27 Jul 2025 15:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI1SRjGIeITT; Sun, 27 Jul 2025 15:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F39C608C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F39C608C1;
	Sun, 27 Jul 2025 15:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FB04DA
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 15:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 763C1402DC
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 15:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oogskGYAUFKR for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 15:05:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::606;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99D4740077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D4740077
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99D4740077
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 15:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzk+LsdZdyx/qwgez9Ox4QOtQl2N3NbJyjF5KzsZ6JT038RPczOxRVgB63hJAli7XzfH66NN1Lu9tJ4Yr3HaNVoml6MaE4i13SBWA+9jJhCNUknSo/pJwy8B/+MsaRayFa3wSTgLlMV9igGG3G4ATOhLxbvcge5dCkVMyLIESr/C0mrieen2wC0WfrSUVBTQ+ha6RXeFiMWacZfRLpL3VPO1ldz9jfnvY0JL5TUEhmTqVP402wGjkt5/m6fUyACMUW5MCg2Vp4L7irm7Jvkjy1V+TrgfppByUpsOb0S8cWcS0AHFcGymrEUZxDH6WUJIehj/k+px6Mm9T1+cOZhRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Zp2JyvapFVQH6333UVeGfBG8itZJuS7LqXwhXgVyo=;
 b=AbHXEhhIsF6DwiQOcwiC8JODXYCI8ykepcaOwlSB+aVCMD3q9WhIKvLzr3PJ/4yuK/WgL7RzsY0lLcA3B9JabuzNPABlxbnC+jO4RWwkyibzgCAu0ViDIIKWj8Pp9QwTo8Hs56fcKiaYbfb3JSRLvaBwkeE6PIa1PRY9G5Fa1nUGYYG9qePQJ8G0qa4/bm5yeXhIyYUdl1Mhan6xCThzXuKvmh/x9simaUmcD2bATZmu2PtYaAEJKiLtD+0haTdE9i/bpPhk9+oAzguWDGnwYk6dJWQC4C6w1X0L9/H6dDWoGEp36lKIMH46Q3PPkGMN8ySFkX1LGVU+k28vv5+tQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 15:05:15 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8964.024; Sun, 27 Jul 2025
 15:05:15 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Thread-Topic: [RFC PATCH 1/2] package/Makefile.in: microblaze: enable
 -mxl-barrel-shift as default
Thread-Index: AQHb6mrHqZXApv5TBEa3iGrLWKjyubQdDLCAgCksirA=
Date: Sun, 27 Jul 2025 15:05:15 +0000
Message-ID: <SA1PR12MB5615F5AC2535BD1E0193D90FF05BA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250701093020.371352-1-neal.frager@amd.com>
 <20250701121317.7792bf97@windsurf>
In-Reply-To: <20250701121317.7792bf97@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-27T14:59:19.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|BL1PR12MB5731:EE_
x-ms-office365-filtering-correlation-id: 3bcbe04a-4b2e-45ea-f8bf-08ddcd1efe5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?z8mRK8sz5KMUze+UdmBW8fEAi9xHCo9IAPE1MtxKjxknpA3rz0cpm0qTUb6x?=
 =?us-ascii?Q?Qmcvv2Cu5TrTX7+79RWHmFNnu137CwN2fjpfg9ULJTUtXib8TTs7YnKnGz+7?=
 =?us-ascii?Q?gXEX4d1rJfVFfFkSm1JoJo5M+Y2HsASMmURPH0CYy6DKNh9wyNOtvgsDdl3R?=
 =?us-ascii?Q?TMwVmjw+QqTmK05BJAPrw6ThqH2v69/6enCyodw4SxuDbVmdp+c1FSPidpXZ?=
 =?us-ascii?Q?RJsaSqkqs4VDmtrMhecp4TawPvb1GN8GXrJAg0lafDjzANcA3FtKknZBq3dk?=
 =?us-ascii?Q?yyBb14KWL+Cglkxz4vZAuwkQynw8S75BWNZVPBmA4B1Et+WOq/hiiAOafZCT?=
 =?us-ascii?Q?/WOxdypi7RnqbfZzkzdVnW7Cmn+dWxgUxE5znzv7nWufGOe3CqubLYYQ/4xp?=
 =?us-ascii?Q?kj5BTxsrmKtS7gBuTJFMnlV42q6cNZ2cOQQ1xJYfIkmwCCwbZHqfWOw0uPex?=
 =?us-ascii?Q?BS6ijgaCpSMz8uNQ+RJDRBv1HCEGqYviCApFVgMnXl3OBSGKJJ3wqtBSyqxd?=
 =?us-ascii?Q?P00l9kAtqilUNDg/Ly7zRV9wJJ3Z+fNntM38OEkHfuBcy36Hi6BEhEWgkMj3?=
 =?us-ascii?Q?HQd0y97QSzDWPS2SjqgsYvPm2YSoYX+vUYB/ZUAyedmcKkfcqe0Ioz1QhF6M?=
 =?us-ascii?Q?t4zVdEXpU63fVfCyubdt/2gDBXD/gVNaeLpiIF7/LF6ORp+rIw/MaYwXATa5?=
 =?us-ascii?Q?acK59qoNOqxnTKsnxqZxknFt0oTYb1o+13xpdh4MBXzNJFBdW/rm5C4mKqTe?=
 =?us-ascii?Q?5hUd5t9/aeMLl1J9PbZvDLUN2ZPdNXaSmYiOBYsIZZWJCoRXuLdp8lWSvK6a?=
 =?us-ascii?Q?XdXLE1YY1HplM2GTKhcIU0zE4zzbnG+ESy0wE39iFznpeZm/Uh0lGwa5plp+?=
 =?us-ascii?Q?Dm6UASY0O8ohaawNz7P/g6WZ2OqWCLBgjS9psTvyybq32L1pIhYYpmn+TMov?=
 =?us-ascii?Q?1AagHQkbFAoq7Rhe19sjz6Y1OwiizbUQIC209tMCP9wWwpDp0mae0Pr4lvpy?=
 =?us-ascii?Q?hCxfTKbdOQRMKBog2OP6PqfLmjxnamWAl46icGfyOHynkNlr5jukD41IviZp?=
 =?us-ascii?Q?WLL/nbF7CGlAV9FqQrBChU2299Bx5rfRxOjndHLLcZIUqaLgJwgpOuPcujGC?=
 =?us-ascii?Q?LxQqcUkbvkjnsEYW/e5LlTcJ1Yn2IPnIM8tktIqYOQdl49bYtZom6nSjLZRR?=
 =?us-ascii?Q?dvPCSK2UAWxepUhjmS25+x+UhiYDJDBLV+x882YN/aXloLlx/SCvBcehvvum?=
 =?us-ascii?Q?lG/6960F0yZW4vwSOOLmnMAvYlG1lezCrOx2noyGHgJXZSocaYeld2CHP5yw?=
 =?us-ascii?Q?WZRhP9c6tJio4MHdNWk9WdcpaomDMJWqQ9QHkQGv6fyZ92Q19CMYTAMPs0V8?=
 =?us-ascii?Q?UnWq3noh60Xn7uWj3sqtUWU+gMKtvzmBJV2GHyb4QkcJHIEuvU/FzWUH4PQ3?=
 =?us-ascii?Q?ynuMU9fR3f7nMjI9nALn6qLKZHskoo4xBzh0bK/IXkOJo2P5Rgy8AnV333mF?=
 =?us-ascii?Q?oCEJRKQVk2i59NE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r2LMyqkFeP64MTn16MoQIu5FlrHheaOOzaQAChGMzBSOINjK3p+hnHYnI35J?=
 =?us-ascii?Q?YNI9PIJMGlhUHtV1553DD5HVKCqmNYBk3nqI/J35Szz9noZZZgGOP5yQUR7B?=
 =?us-ascii?Q?BaoiUCNcU9qUQ0qsE6+HzXOs7sWW7oA2bFeCJsSxWPUX3IKNC3lNwVfzdGc4?=
 =?us-ascii?Q?z/4lsexzHnHdvgTl+gDPTWtQkolxGCL9W7ySDi+eSE5TmfivhG7JmLtDdiEq?=
 =?us-ascii?Q?djUrWk1Xf7M1xq1gKxTp+yYAp83b1I7A7KF2n3rMn5wylUKA+zS6ieF8IOr2?=
 =?us-ascii?Q?jg7VdyDtiOWSFS8R9ExBCEATpD7bULzoudReDZgpDu0DrCwFr80alP/4EYNU?=
 =?us-ascii?Q?6WK7vgBC6YVhzWiMQqyDWfceEup6oCVXXdKE/CAoW0hWCOJXtVgAxbgU2ZrU?=
 =?us-ascii?Q?HBxD+j3hUdYhsA2ZJffMlPDVWT24wCDpWFSL6JHWIZxmRJoizIb1KSobj2vc?=
 =?us-ascii?Q?8jScmPXxP+V9F+ccaAPMute6+4aD1fp66ILR0y346KizckW/0ZlsDxO10hbD?=
 =?us-ascii?Q?hKgwU8ivkMTVEK9/aYXe3+Pc3N741OkNGrdTS554IMs4PF+HNVakjfnzN684?=
 =?us-ascii?Q?8jdlEGwARGFx8IrxJAu9MaeF1cu/YEWhv9HbyBj7T+b7dXz/CAdyYnTxj3oH?=
 =?us-ascii?Q?WmKXFc232M7wcByV63btrERkImQ4Ep3Zh81TSMOYLNjx7caQzLzhaSbswlf1?=
 =?us-ascii?Q?jWhZTclyVM9RHJvXGSVF03d/UdMbjTmAr/DyUqJnWjl8Kv3Gya6JOlaaDQi7?=
 =?us-ascii?Q?WTrCL6l8j0Ssi+dPva2kIX+HFgyEK734nJviikcWvYRB1idBZw5q6kEtFPPS?=
 =?us-ascii?Q?I2gCFoqwJaVuAgZ8aLf8E4zZnuj1C6BE0iOsaVfaOMKZt+sQoWxMCezXRFyR?=
 =?us-ascii?Q?ed8yuGmRMc3grkgAvFH72/RZFWdFbrnO5iGcItGpQDNCOFAP56hJ5j6Io8n5?=
 =?us-ascii?Q?w1dYNYaz6FXbxRW616yixTqvvWXRfRMcszE/vIpL/9gol9uxCZKo8KAzdENp?=
 =?us-ascii?Q?oErZHo5dRiciPIxRB/aJQ/hoSfwvlJ0mgHHCQFqtJ5y4bGlJ0+Tj2H1Dgm0N?=
 =?us-ascii?Q?U5G9GbMm7vgnbBaKPimyS6HRhUKCRWufWsXyq29kMHKp8lXOSWaXvLZiCPfA?=
 =?us-ascii?Q?4EUSlJk0TTTfTuGVNPAsw/e0IDJ1o7yFwdU24GGRqEWGofrUXgmT1ZQgOjjr?=
 =?us-ascii?Q?zs2dU9IqqydHAU5KZvKYYpFsPccl6ngu3BpGtt+f3QHhXqhfi/ISArnReCtp?=
 =?us-ascii?Q?1Eh1ey/XPE1RPOuREa/FdPG7M6veR0rf6fDjGyOsqvdHiYE/RuxToftCkmPw?=
 =?us-ascii?Q?ebWjkdC0kWxxSR8us0k1wm8tUchCUGwuQYQ8mvmPQb5cINPYVEODK8QClX+o?=
 =?us-ascii?Q?ogvZKPyuAq52fQhcFFp3EaB34Ue67vfYGcoQa1aiPfHnG/tCajj6/h7Cmr/C?=
 =?us-ascii?Q?Sp4xp7Fau/pg2+FeCo0y+T+YnRCCrZKHblMEsJkYNGDFiCkkJK8fwOnphBAy?=
 =?us-ascii?Q?It/k1CDZfRxdgrARLKCY0S4tr60KqJwbvC4IExIvIYHpOiQJctzgk65hYdXH?=
 =?us-ascii?Q?Ah59LE+tF4Xa/Du8I9s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcbe04a-4b2e-45ea-f8bf-08ddcd1efe5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2025 15:05:15.6492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYEHEKSwbMldpJRYFLEONZ8NdOxVrBIFKVnSXklabR/gF36EivF1IVU/5VEvJDsy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Zp2JyvapFVQH6333UVeGfBG8itZJuS7LqXwhXgVyo=;
 b=r2jZrCd4AwWlvyVbkk2Rb4H801NaVKL7o8qI0tNZoPLdiBBhpJ0+QzV/jx+k9lAUahCe/xDZLF7wwgCvgiwEglni5siTlnpX4/qiBRRzAxx26Ff2Y8fwsosle4xm6748lilRnEhhBHTi/MUMNGJ6YopOL5qcUGOS8/8hK7GIyIs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r2jZrCd4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [RFC PATCH 1/2] package/Makefile.in: microblaze:
 enable -mxl-barrel-shift as default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Thomas,

> Thanks for working on this topic!

I am happy to!

> +# microblaze arch atomic extensions require barrel shift
> +# instructions to be enabled, so make it default
> +ifeq ($(BR2_microblaze),y)
> +TARGET_CFLAGS += -mxl-barrel-shift
> +endif

> Since this is a really important compiler flag for things to work
> correctly, I believe we should add it to ARCH_TOOLCHAIN_WRAPPER_OPTS
> instead of TARGET_CFLAGS, so that it gets encoded into the toolchain
> wrapper, like we do in arch/arch.mk.arc to add -matomic on certain ARC
> targets.

I am in the process of testing the following solution:
https://patchwork.ozlabs.org/project/gcc/list/?series=466193

Assuming it works, I believe it will be better than mine as it does not
require the hardware barrel shift instructions to work.

I think we should cancel patch 1 of this series, since it does not appear to
be required after all.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
