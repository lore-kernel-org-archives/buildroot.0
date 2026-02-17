Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95942E63F2B
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 07:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F4660EBB;
	Tue, 17 Feb 2026 07:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqtEZ8x_lk0h; Tue, 17 Feb 2026 07:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF4960B6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771314599;
	bh=w5Vr21zUQzN0HARvM3h1OXnDL4PLuHywGaxXCN4S89k=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AoFqzGlvrdIRgroA0sTPA6uCPCEhH8sylu4WxJ2V9GgiJPju3VCJaZm99DHDYEdOl
	 LiI/3+3O0HHQlPXlrvKnOJb74GOGtL8IxcEj4KyFZoELYB3xuuUhS78VN8dNAuibmL
	 0uFiTrH0cLCvbcM9VhvieRvRsgpcozvQVC8mMKf49nTiWwakcdVzEQmZDFbSo5GExq
	 6aa5sEk8QRdZn13zseS1du1iqnaRSrZSb5C89TR6qphBkES6lRdI8TRgGQGK7dso+L
	 ANnf1TtmygqcEA7CpJeoN9ZVSR2WJ5zVvqdzGc46dfvfZEkPD4D/aZuwWhB5MI5wnC
	 RbLkx9dBJIbhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF4960B6D;
	Tue, 17 Feb 2026 07:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D50CE270
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D9240247
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hu8hJCr3q4Vv for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 07:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c214::1;
 helo=gvap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB6D5401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6D5401CA
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c214::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB6D5401CA
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 07:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJZLqiPZwrsbebtO/gY0D3SkU8bHJMv82cG4wXG3POFKAzxGZmePgYcQGuNft7sN7EHwmKng+FSuR7P0m5ikXQjN5xmabXTDhHn14m/6CBumUqZK1mXlMp5wZTAyPBeuaeCixXQpqULTyDPKA2GEbADQS6lp4kxEelXV65tFes2aSpfl4ya25AOKhTRohKrcz18LmeDD5UM+eowWJpZmLMnBku9adkVsqxWEh7sJ3tLGTII9D+zJ62fkHKznvgDwzxrSQ+ZLKCc/7DVgG2vhT4Lo98WnWEMFD9iLNJ4qlvPLKrfQCWVPqb2yUcgwNSysmyNDODSgfVbWOizVYBQ/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Si3wSTy08f3XDXJYgcrVn6czr4tIqm6DwxDYGtG0TY=;
 b=wvWWdZ42op56/RyKmhCJugVliZVnXBnD23CriSVnWfoe0qaf+rpuYcnvcbJ8VWZQVjOuN+WDBfeeOLw7NKxUPmkXwk4y/Wlk2DMjueG4HjZKiUBK9F/LVMpYmHfFK5grO2gkHdcBk0Fa5Tfrd5znsuuZDVrFHPDVxFVHORmCsK4oQdYtWzDSyg6O6eP+HHCSZHgpXVX4YPNwy1l6Iu0UGBicZOBvnB3ruxqxzvkQAQOIzvCWuijWuWs+hrG7B3CayUqnDtcDfW9MIPgKPunBvx2U3iDmuc0pSru5WE0FHsF+LpfEqYUsD3UyChvfQ6hcD0sBN4do1y3jkp0vOBbLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR2PPFA75685D0A.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2e6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Tue, 17 Feb 2026 07:49:50 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 07:49:50 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/util-linux: correct missing comma in
 license
Thread-Index: AQHcn+H+sAdxz4tjykO2fnEmnrWBoA==
Date: Tue, 17 Feb 2026 07:49:50 +0000
Message-ID: <ZR0P278MB08694E5A8B50C3217342254E8B6DA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
References: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=d6f9109a-f2c3-4f0c-9153-3facf0efd1f5;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-02-16T07:53:35Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR2PPFA75685D0A:EE_
x-ms-office365-filtering-correlation-id: 5cf07efb-c641-4d78-2052-08de6df92165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oCrwGh8ItoW4/UUlbh9TXOclTkpKWoOhjDr+TLbdhlrKcGeCjjHsf2XLC32l?=
 =?us-ascii?Q?kQpjTYe9GEQSdAuFy4TJjA+FRx4yffive8GkHPJjNPec8XHsqzEMbHGUjrHA?=
 =?us-ascii?Q?FuvznJ8l6MvQ3wcOMD4l28fB639yY4RdjINSFSLR1/00Ut2N3JluKsUx9Yty?=
 =?us-ascii?Q?waglceQkLKXmxREuyTA39wTqcPLfYU7Zfg7ELfGbHZBii2cHMdYoJ1psUf7D?=
 =?us-ascii?Q?XzRwpKBuYkkhcnKFJkNLYw0WnqU6jjLA3e00ltNFASB4clZ6ac4e7TGyT5MW?=
 =?us-ascii?Q?5jkH6eeLQFad20vpqqYtJv3K0UscwkFSEdToLfQ2B22bnWQUkx5Nim16QKhR?=
 =?us-ascii?Q?TmaaGxyZitlkR3jyhbLhRMIqCqdpHJ8pPwUpjb5dvOVjyo3+BwNxKpbe5m3K?=
 =?us-ascii?Q?FW8VxNJtyJOV6qZST2NR0UbqRaOPchkIyQ2czcVbwWgn3Muuwro5WsQXRqUG?=
 =?us-ascii?Q?/qcZw04lSTU9y/iQ39t2tBjOMFFUFDJ4eqycwFXRJojmKOo8PWbJN+7yEdU4?=
 =?us-ascii?Q?Qawf79os/CstzMK7qOBg5W/Ryd+mnHBicvQd//kny+CGpO0Gek02UVZjOyvY?=
 =?us-ascii?Q?BxLNvZONbnegegG8B+odlv6vifi9WhnBUpG1HpBY/PemH0PKnAqyuD1/K+gO?=
 =?us-ascii?Q?HLgPrVWScH7R1K6A9K7lEeKZKfBxhDLxW4mn5IFWAgunTvmK9yTfkAIvoceO?=
 =?us-ascii?Q?VSod3FnyVRZgIlXUKVPOcYUFuqqzL+9oMw3zGrXLQlCHW8hvsVMOTIECRTu7?=
 =?us-ascii?Q?yF7scDyedWpRa9gbsyvmVdtkecKEqKk7+mZbt5RpFGAo5CipjuzeWGGzGkiL?=
 =?us-ascii?Q?ODNXmoWzX0W/gqhcQiW9qf/WPr1a6OSYQriyi9nS4FDvgrewnAX1pht5BpwL?=
 =?us-ascii?Q?xFx8roUMbWiFVtJkkipjNmMHCf8qYPaI6fNoTdyBbg6RkRUFf3UNsexYyDUH?=
 =?us-ascii?Q?iFbk66rZzvpfAiz5teUbZfxEGed0IStbiq96VahxGqkGIw3UAC1QOsjpOH3K?=
 =?us-ascii?Q?BtWhwzhxBFaWQ5NX2HzICdM6mfi/FqscbAWYS+sPtoV25z7oCI1oNJlJAFdn?=
 =?us-ascii?Q?hyadTp+Y2qEW8sZxaEVgFJGfM5buUAenYUNgAGdi8gSRr0ErXh23HyQfUCOX?=
 =?us-ascii?Q?fXbaQn+9E1+yiAzfq4SZdBXwHhXdmDAo8e45zkirnX97QuALlmSZqzB7q6GD?=
 =?us-ascii?Q?SIUK5GoOgi/am66i314ydr81DRiKPMBkA4PZpwCQbAx0buqx+ipr+5SDLSnk?=
 =?us-ascii?Q?086nzeEvpKo9ZkiJGOWQb5tPyYTrA5T5tfx2lO/AGsgI0e/f3BGNm3bORYpV?=
 =?us-ascii?Q?BuhYPeWyFp4WcKGq4yvbsRe0GPCzXUq9dUnVa554cicdMKVeGPqdQ2irHr77?=
 =?us-ascii?Q?by8Tu31ya2tQRsYiZvnxATMsedBqpf6JBay6VV8yLywDy2dkD4esegx90jjv?=
 =?us-ascii?Q?RL2VCLmF1Eys0DTlRm02yqQVr3i2ICTWKoQakFkyj0hSrBPmkGLKsHSFd9H7?=
 =?us-ascii?Q?SW3u+QuhXkRFHW6cV4+C+CoZG/V7LAom6WIxLUIBckkBUFhAOzVr/AC1R8QD?=
 =?us-ascii?Q?C6RW7BrGGzdWUOa4rgfG63bmQCKKsz8J4O32Zw63S2f3GN2RopENE4orW+G7?=
 =?us-ascii?Q?cxLgPhrRXwmGECtP9ye7Zi0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BU9V/+iU+AU/hkJ3rHyYCgNUOlcdVbb4cpyyznW+QO0LhE7UbQu0w5vLY27y?=
 =?us-ascii?Q?/K9t8Cbh2L8TfC9+arjJMMZdoKsginrwE3lWAYMnDwyuo3FOPiLk5sEMz8G0?=
 =?us-ascii?Q?Qr2aMhp4SweN8HN9kmRWOGYhMC2mmaN2begkxvND5Vk8Kko0eYgoSvmeLN5H?=
 =?us-ascii?Q?pcAb/qytXqblyvQr/8bXMlLRD3njwZ3CmHRMENTMNBmu0lYhgW5KY/qTZcMK?=
 =?us-ascii?Q?P2SsDMtS6m3Sx5m7htGCieQ6jyP26BT+0tYvdOceXpmWhJt4nPNwTx+sKtrQ?=
 =?us-ascii?Q?KsXTKBFe/gUF1A+h2XGmXLg6Bxbize+p7H+Y8BtPDYYHJTvp56EyOgWaqrkw?=
 =?us-ascii?Q?+drNvOqhZEtIT+unpDGjHimTzPS5rQ2xHxW8saD+BSJXJ/cb/yFAeuznFRKd?=
 =?us-ascii?Q?+bxKAKgntgI4xa1LldNA/KBGvRr3HPWGo5PkhDD+HE8e5El82N6yGdroakV4?=
 =?us-ascii?Q?VHkFHbMk+FFK3gQXE+nQHyGnu+A+JklxfGyfFIp744Vi1/2HbyGmHig3Ay70?=
 =?us-ascii?Q?jRN924/4K1eubfu7C8vpgOIlCFkTqD/cUbJT2yGEw2DGFKH/Q/686Zn8colY?=
 =?us-ascii?Q?8H65PYThWLmCdB7GUrYzp1vpDL6U2I6gXdkDo04s7s/75fBXvYaU+xuiUi0r?=
 =?us-ascii?Q?DP3Xeb+r91eF9Ra/N03EHhj77xacIrNjP89Hh2LX73qMi9tHgXKUgenUsEd1?=
 =?us-ascii?Q?D3Yu+qmpji1v1duQTIWHo+vnCNlKMCalahumodHgrEswdxnZmXKLrYriw+i+?=
 =?us-ascii?Q?mzgEyvocoMyMfWVGvHkBitTuW2mDik8LYNbPmTwn6TneyVaJdCNohHFiKGHq?=
 =?us-ascii?Q?ydIEh7RKPjYQXAUvFVLC8fpPMhTNb0uu7KqVOBGrEuTeNwUgDllLTFwNm2RJ?=
 =?us-ascii?Q?wHSL0NEmyc1a10godWDlds8nQgWdKzlWOkDeJHo6KFPNZSpEKI7py9SMeNPf?=
 =?us-ascii?Q?cRQcU/dWJTjOw782OH5O72QIFzZADYIJZPK618s0KXDwJBXgMV/dM5oVKgXv?=
 =?us-ascii?Q?tkbT4O9jHN9n1Mm/KX+fEvuHVJv+/tZcH1zbLTRUPPoxXY099sIFhM4AmVAX?=
 =?us-ascii?Q?wp536CUi0K13/+2VWDr55tAWoufA6nHQH3NsHKlLF+gdvBxSbfzdXXvoin4I?=
 =?us-ascii?Q?r88tUt5aJm0L5GlBwfPORpMX7gTOcCgSSjhdjkZLbDmUuZLhmWVf5Pl8BzO8?=
 =?us-ascii?Q?1K4UWyndV6vM+57VF0TgCdDol/d37Mw/cJGA2+7Y2Z4o4/p3uaRi/gkLIZjm?=
 =?us-ascii?Q?axz8kp7b0gpSQZjwzbUX70yEczXM22mJydRkxaKxYqc8ZMxizFgXeSsbJSld?=
 =?us-ascii?Q?t7rBckwxRqysuhdD1C1m/yeQV/nBGXiGOLBX7TnpV2i6cZ+KmAPtQsqPqdOp?=
 =?us-ascii?Q?tlW52Sp43Fc1l+U5mkVp86IRdh3v8aZSMr2ImJXutaWcQyQaJ1GauHUU9IOO?=
 =?us-ascii?Q?bqvI/TZmcx1FYNtyIJp/GSmQWRQCCwoR/RAmY+8+IrOsQQ7YtK0wvbPwwsAX?=
 =?us-ascii?Q?iZGMDwEjz9PS4wNNgdyXQM4yBSgnywIO8d6mK4V14WysPoityloKFH6RqY5U?=
 =?us-ascii?Q?klp5KrLn/B4ZOUDA3iXFZfUBKQzPaztGnCuR1SyGcMTJ3ZamvkOPFaFV1iIo?=
 =?us-ascii?Q?fgZF4h9pKCZI6XlPbjFxA8C8raOUsRGAjce7YV/gcBfOkvZRasO8YXD0WsIX?=
 =?us-ascii?Q?IP9pdt3+r0xgiRXHbcZw1WILeclBROLgAjCxtv2n2NgH/wjke27gobffACZQ?=
 =?us-ascii?Q?lCQCIscy3v0kWDBrNaTHo+KSFySw+FZfdJ7iLVd0f3bPlsSqezNaULskIPgP?=
x-ms-exchange-antispam-messagedata-1: fxosMtbfl/aTMSofELgyhYvS6L4QfXzH6BA=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf07efb-c641-4d78-2052-08de6df92165
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 07:49:50.7544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JxL7qK+125kq6SSOyBeNwt2X4V35+wyN5cd7Kw3FbgqrNxOG2SDgqwERavpfyxfHX7jr8kERksEeBH0zyabBYFgU4MiWOjLsaST0p3oGgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPFA75685D0A
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Si3wSTy08f3XDXJYgcrVn6czr4tIqm6DwxDYGtG0TY=;
 b=iGYQ+KEgcv8MoiX5857ILRVGCHYLCaijRYh29c8sYTut6e8PG3FpfMO0SUVGzkdLCc6fvxEZs7tVSidbHR7DmIIAsA73Jr5+xubKz165Bq1GGMn5urRn0GjbQuFQF3+quanIQw0ux5f5sk03kdLe77ipT3BTGrnxGCZ4OXQNLRo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=iGYQ+KEg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH v2 1/1] package/util-linux: correct missing
 comma in license
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index af6044af32..7617041a46 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
 	LGPL-2.1+ (libblkid, libfdisk, libmount), \
 	BSD-3-Clause (libuuid), \
 	BSD-2-Clause (xxhash), \
-	ISC (rfkill) \
+	ISC (rfkill), \
 	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-2-Clause \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
