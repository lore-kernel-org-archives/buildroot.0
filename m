Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DFCC48BF6
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 01:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A11D60902;
	Tue,  5 Mar 2024 01:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqOju55WTMaF; Tue,  5 Mar 2024 01:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD7D60907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD7D60907;
	Tue,  5 Mar 2024 01:32:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF7A1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C4960902
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpWwZFKlHFqr for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 01:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=787b0bca0=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 766F360A3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 766F360A3A
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 766F360A3A
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 01:32:25 +0000 (UTC)
X-CSE-ConnectionGUID: pJEyy7aNRGScq3z7D1RPNg==
X-CSE-MsgGUID: XttYu2NXRvygaVF+h38Ksg==
X-IronPort-AV: E=Sophos;i="6.06,205,1705334400"; d="scan'208";a="11393742"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hgst.iphmx.com with ESMTP; 05 Mar 2024 09:32:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRfc1XnPadaPLmZ0+w6jD0vMynbp/k5l/ZN6lBv5FM0fN1/zuo9d6Rb0Afj8HcFKYtbrvCQrIL63foVxvVhVWRY8YdDOMs/fiwEwCmYXXH0max58krLTEEk126ZVgEJph8x9SoZfonqKqhU91iUQ0avW2XiGGxNcfPauOkvFuQKk6OoYI+RD5Z8IC+uvSvoWA/8idjm6zvXaAD+uZWRk9KZZ40jCx+sUfDwopnL/0tzCqBJmq5DSeuCdD1VsIZt5o6x/jIaS3CWUsfwu0wh7EwjiGyLR/kjhCKwqLhT8ioGqWkCvAdAX+4NzK3CS0XhNetN6bGTRTLP9HVlBMW6/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJBr1OvY16dEpqGl4CRs9BELPnlLvB3FjEmWd7/iEw0=;
 b=E6PsgWAxrv9toR/XW0O/rOdCvLb5zJ3i4UV8O9DZT8TTQbqyKcY1GurYHC4wKvsKWtc/rP2b6gAltJESqyGc5A5F13Ow5uy453NjZWawSzrwJJ0Mi8m9WlIuXRNtnYZz/KQGQpKHrkPj8bVc9DDQwwG8LFhf4O5aU/ER5HugoCtYs+qdnZpTRY/0qp24W5Sqz2Cpn2C1izE4ruAYHkOZmfr4EhJRTDYJ30rkUij+KyOqgGSMPc6ieqtAYMSel3NL1ijmmjT0hlvXFNoNaHZY4rQ/WMPeq+ecyauhLpnAezIKZOsyxHrLsR3HZHtbDLM4pUULIBd2ZXrsS3500JmWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by SA1PR04MB8519.namprd04.prod.outlook.com (2603:10b6:806:330::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 01:32:01 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 01:32:01 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/libspdm: bump version to 3.2.0
Thread-Index: AQHaaD+2vDG8fuDNPEq51dLaXEsqFbEoaVWA
Date: Tue, 5 Mar 2024 01:32:01 +0000
Message-ID: <7f330fcecfac46906c24546fd9155515a1af1c20.camel@wdc.com>
References: <20240225230903.22005-2-wilfred.mallawa@wdc.com>
In-Reply-To: <20240225230903.22005-2-wilfred.mallawa@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|SA1PR04MB8519:EE_
x-ms-office365-filtering-correlation-id: 2d663344-4c32-4eca-1567-08dc3cb40e7b
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JM1RSyRP9zrz4b3kIrZYxC3bcrJ7YMelREko26zcQAAoM1vwMwLszSHCLzKRJxnbJIXDZgzpgRzWiogrQNOnKZ7fpc/SLMyd6sSTioe/uIKFYgxqR0YHblMA/hWfgDpnvSxXrjkT534ZycNThp/dteKpEZCVYFPcpWEEg5TG5r3lgDBA4UCdwcljBTpCTgLPpVMfztP+e/36K2RfOuRroz3B52BFtD+22Oanp4mtYId5uOoV0RLkma67opD/9aR6QiwShzxGBMkuCSlFsRP4Es7Oe7FPNp9pqZU+w45rJtzV6Fo+iiwb9cSh/fCb+JBN/7h0M70vgXyLEasyq95sjGBlI2i30J4pTM59eycRl4Z+3Ln8PyXWCZ4xt86GSOKdSU+Z6RqY/CX1zFfWo4wGTS4yuILoJTWUYjYFEy9AgSEk/PlyA4y/oRXFsUwRurviEaZBNXn+jsXs1Y2ThC2dGlPxaCh8kMdp/GQ2CsQ6okIP/68rygwDviM8N1kb1Ml9IcIifdLExf/Xq1G7wtYmR4APwEUVRxsWRp1HOmEkF+NtoXyVaBm1TzFd+jDPmXBnEQi8uI2/JPaUz6qFrkSQXx9FcQVvYG6sSFJschHnEpjg5WvWT/joTmnLL5jUSWLyh2c5doW+B5g93SeVq7jpo7HQ2XCE/PZY7GRiEBPnG+g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlFWZStSNWlVN2UyVWUxc0ZZbnhNd1diYjlVenBpekdpQ29xYlJmbS9MbThP?=
 =?utf-8?B?QnRVdEpidDdOUUNqdGpLQmIxZ29uYy8zUUlMNVMwaXdzY2lrS25rdlA3eGk0?=
 =?utf-8?B?Q3cyeERySnYvenhXbGJneWFHN20yK1F0cUU3Q0liWndjc0h3ZDgxZGhTRzI5?=
 =?utf-8?B?alB5NExMOS8waFJOZkN6SFdrTVZFQlRURUFIVm1jNkkwT2c0NXgrV0d5dUtW?=
 =?utf-8?B?NldJRnIxcWcraFJkdVFkb3g4VG9ycXlVQzcyUVY2ZEhSM3IwbjFQTTdhSCtQ?=
 =?utf-8?B?TE1nZkFqMmx1VzJUYmg4ZWFmN3kwQWZXVTBZTWZpcUFsb2RwcFd4Q0Y1ZU9P?=
 =?utf-8?B?bWI3bUU5OGtvOHdqVmkxSm5rLy9YUnhNcE9mSVgySVlhRVQvSDhsNXpWQ2pl?=
 =?utf-8?B?eVdIdEQyQ084bTNKUk5lU1RJUUQ2c0tHWTJUQXEzNFJZaHhmVy9PVk1MSWQw?=
 =?utf-8?B?Z2RtemlhU2hiRWlrK2wyem1MMWxRYWxrQm9RUGJNYmR6ZkRNTStiaS9LUVho?=
 =?utf-8?B?ekF4dW5HWnVEVXduLzMyaFdUN0tvT3NwNGRwYjFEM3NqRGNreTNqMXhTYU1k?=
 =?utf-8?B?NG5XUmRPbm5pOU4vSG9SSzczdWQ3MUJDcHdZVUxlSWRGOGtvd3g5VStpemRK?=
 =?utf-8?B?ODhMVVQ1dWpXNzFIUCt3bkFMbGtqUVJqRE11TzgrM29jNW9FRlR4Sm9NMEw0?=
 =?utf-8?B?bS9SNmRKZXBNeVYwQ1VsUzIyc05DV0VmZll6ZGRqRWw0d1dqcHRTMnR0Rnhk?=
 =?utf-8?B?MDlBRHVBWjBuODd1RmpQMnV3UTY3L3RiTm0za1gwUEJxMXFHU3EzYkdBRFVU?=
 =?utf-8?B?TEVTMThyZUU1S1JBWlZBc0lTcjV5cFBxS1pobGZocnVKK1BsTE9jREs3bk5m?=
 =?utf-8?B?aG54K0VHWG5wOVRxcUNPQzQ4eUt2NVo5dVNXNGdLY2l1SEszMzArOEdYZjhO?=
 =?utf-8?B?MmFpd2dpbktycU1ad3V4YVdZN2phRHdONEpPZmsxcjN4WmQzY1RSUWtnU1Fm?=
 =?utf-8?B?TGtmRHBqZTg5ZmEvei9uY0JNOVNYWjNkdk5vNGVrU21tSnp4ekwyakpYaVEz?=
 =?utf-8?B?QmE4OWhVU0RYMXpMNjIydGZ2WURMdG9NTHRsUmYxZnJuZmdlaGg0TUc4cys2?=
 =?utf-8?B?M3pybjFVU0pGUzlVYnpwemVjdzV2UjcwSjhtK0F4NlBPczFIeUNXWG4vVGZP?=
 =?utf-8?B?TjdJUDRCNncrSVdIWi9YVHJQUng4UXdqRFpFVTFPY015clFkSTltTzF2akh4?=
 =?utf-8?B?VG5pVU1oWm1RRlMvL2VRQTUrQUZKUktrejZSMjJlamJrdjVLM2Q3aXRxMFdj?=
 =?utf-8?B?L3JNbUZRTVhmTUIvUjBuZm1EbTlTdU9hMTVnbVpCWHdNN1VkWEdiK25aYkgr?=
 =?utf-8?B?VkxUYyt4aG5hc09MejlDMHAzSlB1RFMwVlVsVm9KTUZXa05JSnN4RFdQWE1X?=
 =?utf-8?B?aHNuYlhkd1RoUHQ2REVUb2ZoSnJQb3pDZ3lpclliN0V4V09lMnZTbmN1OU9Z?=
 =?utf-8?B?Y2hPMFdWakttUjNCbi80cnc2NEpaOFZnM2grb1pYSWV1N2Y3OVpSMUxEZ3R2?=
 =?utf-8?B?TkNxeUZnbUtIeG9oRERhdURyeDhGc2Zuc1gveFMzRitHV3psTDJNTTY5MzUv?=
 =?utf-8?B?ai82T3pSdHNRT1RqdVdsN1g1UlU0VzVmM2pJTjd6SFM2OFVnQW9aS25aVGNx?=
 =?utf-8?B?YkZSQ25VQXZwR1p5aWQ4Z3dnOEM2SjhHT2tzOVlnbENwdk1JeFJOQVhlZ1lN?=
 =?utf-8?B?NUF3ZjdYcHBhcXoyNjgrRU9lNWNoeGxWKzhwSWUveFpGMUd1d0xQRFNmNDVi?=
 =?utf-8?B?UUdjQ3FvK1VIc21yNlAxcTVnWU51amhPSzd3dkhpc0ZpSWpWSVJaNFk1V25C?=
 =?utf-8?B?QlRsaklMNEZoYzNDK2pnSzFEY1E2eXRVcmh2ZzBZd3NXZUtEb0NwaW9hbUNr?=
 =?utf-8?B?RFF3aDBwYmg1WFdSTTdMWU9NZHEzZWRUUFpCV04xcEs3Q05PMVpzdEFiUHZR?=
 =?utf-8?B?UHgzT3ZvQkt6SDhpYWhDTDIrenFPNHo3N0dVT0RwNmNMUHZKZEc1NE1CUGtQ?=
 =?utf-8?B?ZGNrdHNlNjhodS9lZStJMG1lU3JwWFRkcTRwOU9lbi8xbGlWT1VqVHlQaXBm?=
 =?utf-8?B?c3JmTDVPWW5XdFl0NEJYdUlKdlJNYW5BYVIvYlhvdkxxNndRc1loaG1RZ1lw?=
 =?utf-8?B?WlE9PQ==?=
Content-ID: <1C088BEBB129FF49B5E7F87718CAAF2F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yJI/aRN80rKhC1usfyi6qfQDCFZ7HPE3skGYwj009NzJ4rzukLQwHztFTVhkbToWng6kqu7RfRQPLtc9dUmcVXeezEYqWbVW3dEytw7fBwEAkFFaL+iFSecsRIs3D7Vq4nQsy4qPda4j3ZRL98alYe0tmvcl6EeS9TotnfJk8ndpIXiJ4BdLGpYd/pPYX+kMEdGHpKyb+T0X8PY1Sgqes57pktv3EBbwI/MNiYJpE3vXhFVM+xpVRRYf+PYyPgQoC1NdDbVo2o1E7VZhnCcdNfVxKfMg1sbmdNh3XLGGLxOAsdxB1r5peSSyUjLdXvbmdYBjIohTuRhvZ4HZIilVNKSRoZLXvybqhLNVL3ThVkt33/oWWhvzqIYwv6ShEUxVH9PuKTWAbppJ1jFCrwqVR/K/MjPQItHOMZA1e9HDQm1Q+HEQGltb3TPooqKkt6irktbc4Zn8VmuBFWug7R2d7TZP9LYDow21Eds0DANNvdbuXkI30XRoBH1i19fAeMb3Zq7g5sZ9LNDnUXvYykgA41yQVOZQgjEZ9wWweedx07mXIwhBnKUoxgbFsyObU96iACAwV3Zoc5LVZRMZo57HPVlKQGmrpjzmh2NPiO+tpWFlevKmU6ujL3N0u2771aIe
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d663344-4c32-4eca-1567-08dc3cb40e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 01:32:01.4389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SN7vus+MO6I20QsGsSfLZmoP8XQ33axhmmm7QAvfLhsU204tKStn+7k73ZjRefL8ZeaBRnNUJKSaE75Ahh4NvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB8519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1709602345; x=1741138345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=cJBr1OvY16dEpqGl4CRs9BELPnlLvB3FjEmWd7/iEw0=;
 b=DRX+l3GdFLUkfFL6ncGG+oVKcXGY+T/nqJePbWnZcA6MaeHWZIJoW8Cs
 lvpEiKMCu8VzJ8VuCikaaghL1kIRWOr6MYV39MW0jaINj91H65kXjqg4S
 QgEwf5YyMb3rxNbegS5LPH0HTm4MaJR6FknIH5TfONRmOJxNjYsyDw1oN
 hLDmTTdyhZW+89UWBfe1FiKpGKvVWL9DwJ8pNNq7r9WUWtKbu7pRdigns
 gV3Mns9u+XNFqZ8Ta3gLFbXE0/BNn5QDjV3h5qUV6mX5aunx15eFHnJT6
 yEaNU8m+0bvpmASvoAXayhpIHqdww9Uexy1LFA7H4ZKplgYkDm3cV/J28
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJBr1OvY16dEpqGl4CRs9BELPnlLvB3FjEmWd7/iEw0=;
 b=tj7fZdJrscUMbufMzd6laMbDQFMcxDoINhUrz56j2ENZlDF/N21fEIiyuftBEeWLjzN4fSLBs+jWnmDoOMchYaAOIgnsIyGxvnqHqt1/5BUz/r6KJruT6ydQ8TTfeE9IKR58fF6p5HbPSEnkGxIzm/fS+25n8zghGtvpq4+Nbx0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=DRX+l3Gd; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=tj7fZdJr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libspdm: bump version to
 3.2.0
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGluZyA6KQ0KDQpPbiBNb24sIDIwMjQtMDItMjYgYXQgMDk6MDkgKzEwMDAsIFdpbGZyZWQgTWFs
bGF3YSB3cm90ZToNCj4gQWRkaXRpb25hbGx5LCBhZGQgYW4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBm
aXhlcyB0aGUgY29uZmlndXJhdGlvbiBmb3INCj4gIk5PTkUiIHRvb2xjaGFpbiB2YXJpYW50IGlu
IGxpYnNwZG0uIFRoYXQgaXMsIHdoZXJlIHRoZSBidWlsZA0KPiBlbnZpcm9ubWVudCBwcm92aWRl
cyBjb21waWxlL2xpbmsgb3B0aW9ucy4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbGlzdGFpciBGcmFu
Y2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFdpbGZyZWQg
TWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIFYy
Og0KPiAJLSBBZGRlZCBtaXNzaW5nICJVcHN0cmVhbSIgVVJMIHRvIGxpYnNwZG0gcGF0Y2gNCj4g
LS0tDQo+IMKgLi4uZUxpc3RzLXJlbW92ZS1maXhlZC1vcHRpb25zLWZvci1OT05FLnBhdGNoIHwg
NTINCj4gKysrKysrKysrKysrKysrKysrKw0KPiDCoHBhY2thZ2UvbGlic3BkbS9saWJzcGRtLmhh
c2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+IMKgcGFja2Fn
ZS9saWJzcGRtL2xpYnNwZG0ubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJzcGRtLzAwMDEtQ01h
a2VMaXN0cy1yZW1vdmUtZml4ZWQtDQo+IG9wdGlvbnMtZm9yLU5PTkUucGF0Y2gNCj4gDQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNwZG0vMDAwMS1DTWFrZUxpc3RzLXJlbW92ZS1maXhlZC1v
cHRpb25zLQ0KPiBmb3ItTk9ORS5wYXRjaCBiL3BhY2thZ2UvbGlic3BkbS8wMDAxLUNNYWtlTGlz
dHMtcmVtb3ZlLWZpeGVkLQ0KPiBvcHRpb25zLWZvci1OT05FLnBhdGNoDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjBkZTBhZDAwNzkNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9wYWNrYWdlL2xpYnNwZG0vMDAwMS1DTWFrZUxpc3RzLXJlbW92ZS1maXhlZC1v
cHRpb25zLWZvci0NCj4gTk9ORS5wYXRjaA0KPiBAQCAtMCwwICsxLDUyIEBADQo+ICtGcm9tIGQ0
ZDZiMTM4ZDcyN2U0ODRmYTlkMGZlZjQ3NmNhMTgxNjgxZDA2OTUgTW9uIFNlcCAxNyAwMDowMDow
MA0KPiAyMDAxDQo+ICtGcm9tOiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMu
Y29tPg0KPiArRGF0ZTogTW9uLCAxOSBGZWIgMjAyNCAwOTo1NjoxNCArMTAwMA0KPiArU3ViamVj
dDogW1BBVENIXSBDTWFrZUxpc3RzOiByZW1vdmUgZml4ZWQgb3B0aW9ucyBmb3IgTk9ORQ0KPiAr
DQo+ICtUaGUgdXNlIG9mIHRoZSBOT05FIHRvb2xjaGFpbiBvcHRpb24gaXMgc3VjaCB0aGF0IHdl
IGNhbiBwcm92aWRlIGF0DQo+IHRoZQ0KPiArYnVpbGQgcHJvamVjdCBsZXZlbCAoYnVpbGRyb290
IGV0Yy4uLikuIEhvd2V2ZXIsIHRoZSBjaGFuZ2VzDQo+IGludHJvZHVjZWQNCj4gK2luIDgxMWYy
YjU5NmRlZjA0YjNhMzYzNjhjZjIwOTg1NDZkNzkwNzc2N2Ygc2V0IGNlcnRhaW4NCj4gY29tcGls
ZXIvbGlua2VyDQo+ICtvcHRpb24gdGhhdCBkb2VzIG5vdCBjb21wbHkgd2l0aCB0aGUgZGVmaW5p
dGlvbiBvZiB0aGUgb3B0aW9ucyBhcw0KPiArc3BlY2lmaWVkIGluIFsxXS4gVGhpcyBjaGFuZ2Ug
cmVtb3ZlcyB0aG9zZSBvcHRpb25zLg0KPiArDQo+ICtbMV0NCj4gaHR0cHM6Ly9naXRodWIuY29t
L0RNVEYvbGlic3BkbS9ibG9iL21haW4vZG9jL2J1aWxkLm1kI2xpbnV4LWJ1aWxkcy1pbnNpZGUt
YnVpbGQtZW52aXJvbm1lbnRzDQo+ICsNCj4gK1Vwc3RyZWFtOg0KPiBodHRwczovL2dpdGh1Yi5j
b20vRE1URi9saWJzcGRtL2NvbW1pdC9kNGQ2YjEzOGQ3MjdlNDg0ZmE5ZDBmZWY0NzZjYTE4MTY4
MWQwNjk1DQo+ICtTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3
YUB3ZGMuY29tPg0KPiArLS0tDQo+ICsgQ01ha2VMaXN0cy50eHQgfCAxOSAtLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICsgMSBmaWxlIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZm
IC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dA0KPiAraW5kZXggOWMzMDBj
YzgxNy4uZjZjZjE3ZDI2OSAxMDA2NDQNCj4gKy0tLSBhL0NNYWtlTGlzdHMudHh0DQo+ICsrKysg
Yi9DTWFrZUxpc3RzLnR4dA0KPiArQEAgLTYxOCwyNSArNjE4LDYgQEAgaWYoQ01BS0VfU1lTVEVN
X05BTUUgTUFUQ0hFUyAiTGludXgiKQ0KPiArwqDCoMKgwqDCoMKgwqDCoCBTRVQoQ01BS0VfRVhF
X0xJTktFUl9GTEFHUyAiIikNCj4gKyANCj4gK8KgwqDCoMKgwqDCoMKgwqAgU0VUKENNQUtFX0Nf
TElOS19FWEVDVVRBQkxFICIiKQ0KPiArLQ0KPiArLcKgwqDCoCBlbHNlaWYoVE9PTENIQUlOIFNU
UkVRVUFMICJOT05FIikNCj4gKy3CoMKgwqDCoMKgwqDCoCBBRERfQ09NUElMRV9PUFRJT05TKC1m
c2hvcnQtd2NoYXIgLWZuby1zdHJpY3QtYWxpYXNpbmcgLQ0KPiBXYWxsIC1XZXJyb3IgLVduby1h
cnJheS1ib3VuZHMgLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMgLQ0KPiBmbm8t
Y29tbW9uIC1Xbm8tYWRkcmVzcyAtZnBpZSAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVz
IC1mbHRvIC0NCj4gRFVTSU5HX0xUT8KgIC1Xbm8tbWF5YmUtdW5pbml0aWFsaXplZCAtV25vLXVu
aW5pdGlhbGl6ZWTCoCAtV25vLQ0KPiBidWlsdGluLWRlY2xhcmF0aW9uLW1pc21hdGNoIC1Xbm8t
bm9ubnVsbC1jb21wYXJlIC1XZXJyb3ItaW1wbGljaXQtDQo+IGZ1bmN0aW9uLWRlY2xhcmF0aW9u
KQ0KPiArLcKgwqDCoMKgwqDCoMKgIGlmKENNQUtFX0JVSUxEX1RZUEUgU1RSRVFVQUwgIkRlYnVn
IikNCj4gKy3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFERF9DT01QSUxFX09QVElPTlMoLWcpDQo+
ICstwqDCoMKgwqDCoMKgwqAgZW5kaWYoKQ0KPiArLcKgwqDCoMKgwqDCoMKgIGlmKEdDT1YgU1RS
RVFVQUwgIk9OIikNCj4gKy3CoMKgwqDCoMKgwqDCoCBBRERfQ09NUElMRV9PUFRJT05TKC0tY292
ZXJhZ2UgLWZwcm9maWxlLWFyY3MgLWZ0ZXN0LQ0KPiBjb3ZlcmFnZSkNCj4gKy3CoMKgwqDCoMKg
wqDCoCBlbmRpZigpDQo+ICstwqDCoMKgwqDCoMKgwqAgU0VUKE9QRU5TU0xfRkxBR1MgLWluY2x1
ZGUgYmFzZS5oIC1Xbm8tZXJyb3I9bWF5YmUtDQo+IHVuaW5pdGlhbGl6ZWQgLVduby1lcnJvcj1m
b3JtYXQgLVduby1mb3JtYXQgLVduby1lcnJvcj11bnVzZWQtYnV0LQ0KPiBzZXQtdmFyaWFibGUg
LVduby1jYXN0LXF1YWwgLVduby1lcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbikN
Cj4gKy3CoMKgwqDCoMKgwqDCoCBTRVQoQ01PQ0tBX0ZMQUdTIC1zdGQ9Z251OTkgLVdwZWRhbnRp
YyAtV2FsbCAtV3NoYWRvdyAtDQo+IFdtaXNzaW5nLXByb3RvdHlwZXMgLVdjYXN0LWFsaWduIC1X
ZXJyb3I9YWRkcmVzcyAtV3N0cmljdC1wcm90b3R5cGVzDQo+IC1XZXJyb3I9c3RyaWN0LXByb3Rv
dHlwZXMgLVd3cml0ZS1zdHJpbmdzIC1XZXJyb3I9d3JpdGUtc3RyaW5ncyAtDQo+IFdlcnJvci1p
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV3BvaW50ZXItYXJpdGggLVdlcnJvcj1wb2lu
dGVyLQ0KPiBhcml0aCAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV2Vycm9yPWRlY2xh
cmF0aW9uLWFmdGVyLQ0KPiBzdGF0ZW1lbnQgLVdyZXR1cm4tdHlwZSAtV2Vycm9yPXJldHVybi10
eXBlIC1XdW5pbml0aWFsaXplZCAtDQo+IFdlcnJvcj11bmluaXRpYWxpemVkIC1XZXJyb3I9c3Ry
aWN0LW92ZXJmbG93IC1Xc3RyaWN0LW92ZXJmbG93PTIgLQ0KPiBXbm8tZm9ybWF0LXplcm8tbGVu
Z3RoIC1XbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnMgLVdmb3JtYXQtc2VjdXJpdHkNCj4gLVdl
cnJvcj1mb3JtYXQtc2VjdXJpdHkgLWZuby1jb21tb24gLVdmb3JtYXQgLWZuby1jb21tb24gLWZz
dGFjay0NCj4gcHJvdGVjdG9yLXN0cm9uZyAtV25vLWNhc3QtcXVhbCkNCj4gKy0NCj4gKy3CoMKg
wqDCoMKgwqDCoCBTRVQoQ01BS0VfTElOS0VSICR7Q01BS0VfQ19DT01QSUxFUn0pDQo+ICstwqDC
oMKgwqDCoMKgwqAgU0VUKENNQUtFX0VYRV9MSU5LRVJfRkxBR1MgIi1mbHRvIC1Xbm8tZXJyb3Ig
LW5vLXBpZSIgKQ0KPiArLcKgwqDCoMKgwqDCoMKgIGlmKEdDT1YgU1RSRVFVQUwgIk9OIikNCj4g
Ky3CoMKgwqDCoMKgwqDCoCBTRVQoQ01BS0VfRVhFX0xJTktFUl9GTEFHUyAiJHtDTUFLRV9FWEVf
TElOS0VSX0ZMQUdTfcKgIC0tDQo+IGNvdmVyYWdlIC1sZ2NvdiAtZnByb2ZpbGUtYXJjcyAtZnRl
c3QtY292ZXJhZ2UiKQ0KPiArLcKgwqDCoMKgwqDCoMKgIGVuZGlmKCkNCj4gKy3CoMKgwqDCoMKg
wqDCoCBTRVQoQ01BS0VfQ19MSU5LX0VYRUNVVEFCTEUgIjxDTUFLRV9MSU5LRVI+DQo+IDxDTUFL
RV9DX0xJTktfRkxBR1M+IDxMSU5LX0ZMQUdTPiA8T0JKRUNUUz4gLW8gPFRBUkdFVD4gLVdsLC0t
c3RhcnQtDQo+IGdyb3VwIDxMSU5LX0xJQlJBUklFUz4gLVdsLC0tZW5kLWdyb3VwIikNCj4gKy0N
Cj4gK8KgwqDCoMKgIGVuZGlmKCkNCj4gKyANCj4gK8KgwqDCoMKgIGlmKE5PVCBUT09MQ0hBSU4g
U1RSRVFVQUwgIk5JT1MyX0dDQyIpDQo+ICstLSANCj4gKzIuNDMuMg0KPiArDQo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5oYXNoDQo+IGIvcGFja2FnZS9saWJzcGRtL2xp
YnNwZG0uaGFzaA0KPiBpbmRleCAyM2ZhYmExYzRiLi4zMjQxNWJjZmNlIDEwMDY0NA0KPiAtLS0g
YS9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5oYXNoDQo+ICsrKyBiL3BhY2thZ2UvbGlic3BkbS9s
aWJzcGRtLmhhc2gNCj4gQEAgLTEsMyArMSwzIEBADQo+IMKgIyBMb2NhbGx5IGNhbGN1bGF0ZWQN
Cj4gLXNoYTI1NsKgDQo+IDg0ZDRhNzU1ZjU3YjE3Nzc1YzYzYjVjOGJlNjQ2ZDUxOGNlMzRkNWQx
Yjg1OTk0YjYxNTBlYmNlOWQzMWIxODPCoA0KPiBsaWJzcGRtLTMuMS4xLnRhci5neg0KPiArc2hh
MjU2wqANCj4gMGVlNDYwYzBjZTVjNGQxMjZjYTY1ZjljNGJkYWJkNTcyNWI4N2NlYzcxNjBiMmQw
NjcyMTE2OWRmNThmM2E5NcKgDQo+IGxpYnNwZG0tMy4yLjAudGFyLmd6DQo+IMKgc2hhMjU2wqAN
Cj4gN2RjMDcyYmZmMTYzZGYzOTIwOWJiYjYzZTA5MTZmNDY2N2MyYTg0Y2YzYzM2Y2NjODRlYzc0
MjViYzNlNDc3OcKgDQo+IExJQ0VOU0UubWQNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic3Bk
bS9saWJzcGRtLm1rIGIvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsNCj4gaW5kZXggMzRkYmI0
NTdjNC4uMmVjMzViZTBhYyAxMDA2NDQNCj4gLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0u
bWsNCj4gKysrIGIvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsNCj4gQEAgLTQsNyArNCw3IEBA
DQo+IMKgIw0KPiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjIyMjIyMjIyMjIw0KPiDCoA0KPiAtTElCU1BE
TV9WRVJTSU9OID0gMy4xLjENCj4gK0xJQlNQRE1fVkVSU0lPTiA9IDMuMi4wDQo+IMKgTElCU1BE
TV9TSVRFID0gJChjYWxsIGdpdGh1YixETVRGLGxpYnNwZG0sJChMSUJTUERNX1ZFUlNJT04pKQ0K
PiDCoExJQlNQRE1fTElDRU5TRSA9IEJTRC0zLUNsYXVzZQ0KPiDCoExJQlNQRE1fTElDRU5TRV9G
SUxFUyA9IExJQ0VOU0UubWQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
