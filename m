Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83650E7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA51607AA;
	Mon,  2 Feb 2026 18:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUtFahArKyzq; Mon,  2 Feb 2026 18:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7249260692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056087;
	bh=WiyEFGqFzISrxktWmda0SXYMlvvhcEz+z3icKPcJt34=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKPwBG+XrC/PkA+a0C84JTlNrA+vaUH3uivhbNGqedqk6Dhidt/hRRuNZgNCQLO4p
	 QHPZyvfAwCNoykedntJQKbP9QkeWHZNb7AxEboEirRjHNVjkCgSj+3AR8TFVBKfkv+
	 p49PI8qBWd7wv8uwqrjWGU6aQr4t+kVV+yLZUi0y1nRKMSzDnh+QYOVSWVta9jD468
	 liazWx5ZqB0xmxqYAJlpeGEkOuHafqycsmiLJb+t/SgZVy8ECAg8MqqvjByTDJVH1V
	 aKWS80+urOgDJMo1XEwbwYNScxfvzYx8GAw7VX710eGFnH77ALMPYh6v2DbE+BCRU1
	 hbOPmkb7eA00A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7249260692;
	Mon,  2 Feb 2026 18:14:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 278B9F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D46880B39
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmsGlCAR7qQ3 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:14:45 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::62e;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED4DE80B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED4DE80B21
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on062e.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED4DE80B21
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=a2P7pzeiVgZLITGWS6VtP2XJAgtROse2xQS7hywnpasCnmcW7hMktool/BZWv6ec33WG/e5tB24V7fT2sDOF9EakpCRw7uSnPwtMKAGuzQSs0RvpR2hf4K/kmnRvJglGDCwXZOiaSNpdXL1hqEvgwk59VrYpipGR7azL/HjCh1/X3GB19GeDyjIw7Q+Jqfi3p3+XqEdfdcXE/8Kwoq/tdCJ08TFM4Tea8NNhbWWcHCX9saEZByfjcPZ4X/pS6ktl3Ii/EzB5LzX3ZxOyTj4l06aWw+QG7kA8inC78Xb7N+P+Od+5F33J7EWCYNYKQvHZwwVUY+UJaOpNguZggRFLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3kUEWLQe1rYS1JJ/PdaGjlScSStS5HnFdnGeLEDtLs=;
 b=VhKuUkox1did4+VifUQj2BBUIYxHCiTdWfpI4fj/g4z5IQ97lc8IlzuV/7wXaF1oNtKRCm6mBFhb61tJrLBBoTD4cAm/LP8PXxu5sQznpqHOARIo67KZ7NZxMvL8PEHlB7WHZgSr6Feh3rgTH//RzJSha9ImNSXxwM6m9zFacZRdQtNpaa/8ILVFAfNBhSeXxiodvkui6uDzz2HKBUKtOVJpUBUTDRlkJy7JSn20aLRmcgv3JJ3G7J/qXbGsHo13EPYtnJnv5JLaHnPgSG68zd2JXeYQ9+LRIZjesgT+KKFp4Ljk8Zibwsp61+XgVij26VCSrCZtV9Lw7VV23eJpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1042.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 18:14:39 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 18:14:39 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@smile.fr>, Buildroot Notifications
 <buildroot.notifications@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Thread-Topic: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
Thread-Index: AQHclG/Lwuw0C1HuT0OtWZa294z58w==
Date: Mon, 2 Feb 2026 18:14:39 +0000
Message-ID: <PH1P110MB16030E8CAE99250F185385D09F9AA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
 <41a35fa0-0c72-44cd-8f47-c9eb4727a098@smile.fr>
In-Reply-To: <41a35fa0-0c72-44cd-8f47-c9eb4727a098@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1042:EE_
x-ms-office365-filtering-correlation-id: bf6b5ce2-441a-492c-eeeb-08de6286ee17
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700021|41080700001|15866825006;
x-microsoft-antispam-message-info: =?utf-8?B?Q1VEMG0xNzUvMW1ZK2hyL3F5ZkVYMm5Nd2xpTVBBTGZrcStIejliQVg1RG1h?=
 =?utf-8?B?WlpNazFKYlNxeFZON29paVB1S3N6K29uYWdBa3FrSmxKL3kxOS9Vc2xXaEww?=
 =?utf-8?B?RzNucWVYMXFBdGwrNURDYVlwcW1xbGFkUzgva2FiUUd3c2krLzBybm9VcVE3?=
 =?utf-8?B?NHZ3L0plUFU5bWd4dkRNNndhemR0UVNZKzRpMHJtamIwMHVvTjNPbGdwa0N3?=
 =?utf-8?B?d1ptUHVXOFV4NW9wcThUSDBuKzFsalF1ditaWUxidlB4SlFRbStDNkpOT0JV?=
 =?utf-8?B?Si9oOXpWSmlnWHlPd09IcG1OZ0NycWtvZDFXYnk3SmJ0SVJpTTgyNUpGUFhM?=
 =?utf-8?B?ckdCY05zbldRT3k0MmxFY3JvRkZBWm9sSmZBeDA2eXlGVk13VmZ3NVZsWEZW?=
 =?utf-8?B?UTN6bTcrVHVJRndLSjFQUUEzZVVoTkJsY2JQVUlobE41eXUzR2xTMnYxOVBr?=
 =?utf-8?B?cGxLaGRDaTN0SHluS1FNUDFMVm9IOVBhd2p4UjM3bHBod0lBaE5sTzNRcHUw?=
 =?utf-8?B?K0Nvb2V6c3FVaXZjTjRheEFDRy9DSnVIMHJYWENNRXp5ckVkdWtUOGdsbWx6?=
 =?utf-8?B?MXovK2hJYmNLMEVLbTZHc1ZteEM3TXJiWmwyVVJuMHM2KzB5OCtEOXF5Z2JD?=
 =?utf-8?B?Z3h0d2xsempCdzZTK3pHTTRHd0hrQUNIY1hrZDhLdXJLUUhMc2RwRkJwZWhV?=
 =?utf-8?B?SmJmWTZnbUkzMW1NMEVOQ0FsSlgwcDVqOStkTXViak0wNkVqa1ZZaVdxZlpO?=
 =?utf-8?B?enUwUjhUVkFtZjhXWWI1QzhUNzBCbGZlSkp3WnV2RW5CQzFYdEpSUlVFSCtZ?=
 =?utf-8?B?bFlGbHZJVGFQSGd2YXZZVXBNcjB0SmU2b1RLQlYvWGsxckhWQWQrdmJZemVu?=
 =?utf-8?B?dlVKSE5ZMnU4UWZ0WUM2aHd1ei8rQ3h3QVVmSlFXSFNqTDNkRDhUTDJydkVY?=
 =?utf-8?B?VFhYV21pQmcxczBlZ1Boam9xWUtlVEpiNGsyYmx5bGJzenVGVjZndnJTQklO?=
 =?utf-8?B?VmdGR3g3VG9mTUs3V3MySWZDODlBVDlRc1BUcUpsOVNVQUtnYSt5cHBLMUR6?=
 =?utf-8?B?SXNDcDE2WmVidXFVZGNnaXpjQVo2dXV1azFoV0wrZGFZRldMTVB1dStsL2RW?=
 =?utf-8?B?WGZEeVF0RWhpWi9yVHh4TStSRlVYZTVxSTI1Y2hXb1VRVTRxUTYrT0xDQzcz?=
 =?utf-8?B?OTFQT3VJVkE4L2puTFBBK1ZBRWFkLzJ1VlZITHpWNmR5NE1PZ3dlZ0c4M29t?=
 =?utf-8?B?MkxJNVJPQXlURVFJMm9LVHNaSktEeC9qZm42eUJRMnNKWnU5L2VLYkdLL3dO?=
 =?utf-8?B?d3o4OEhqcWtudk01TFd2QjZCTVBWQVNJYmVXa0dZbEJ6KzhMTGVadm9Hd1RS?=
 =?utf-8?B?OWpnejZhYzFxZnZjQVJSdjlHRklUT0FmdXlEK09KSkJQUlBhMU1rUFQyY0Vv?=
 =?utf-8?B?dWtOTXJQMmxpQUUyb1l2VDFPdnFoT2lRT0xvVjA0RTc5RWpoU1owbjFUNzBk?=
 =?utf-8?B?UmVQWlhGUlpMcHhIbEVRdGZUZmlPYVFwSldrS3ZmUVNDWXZWL3hvMnY5dENi?=
 =?utf-8?B?SStkZElleUgyb2VBa0xtTFZuUGEvRm13aUVJdk1Id2Vaako1S1VtUUtaU2pu?=
 =?utf-8?B?dmYxcVNrTWZ0RlNDbThUaXVpbUpqWVBncjNtTm44cWtnSDdWVGZzdjhDYjF4?=
 =?utf-8?B?TDB4UC9rZlpLUGtPNnFDTmN3djdwZVFCN2Vxd2loR3A1TlRwMVVrSmp1Kzdw?=
 =?utf-8?B?RlMxaXNhNTJNdnEzdS9naW5LZXV6ck9uKy8vNmxvc3NvL09HNnpYbnRQOEFk?=
 =?utf-8?B?enl2YnZCR3RKdTV1YWhUcXV5bWdKUmNkV3k2OC9vQVhENlEvL2pjNjRTVjg1?=
 =?utf-8?B?SFRobzcwS2pYbzlxbWpWK2Zzc2F4UkZuamxzS0lQTS9Kdy9HQUpNZnMxZU1E?=
 =?utf-8?B?bUQrVDNHcmhKa010Tnhtc1AvQUxQYmc5UlhxSDgvYWZGTm03bzY2ZzAyZjVH?=
 =?utf-8?B?Y2wya2RvbkNpdDhTZ1lLbkZoZkhDcWxZUml3YUZBb2wyeWhjUjB1YnBwcmlq?=
 =?utf-8?B?ZElSZXQ2dW5xaXZHMThiNVd1VWl1dkdtQmgrbnFaZndIT0N0Y3F0Wk1sQUl0?=
 =?utf-8?B?ZWtxMG04czdRak14aHY2SFBnekxVdm00MHh5V3FnK2tmbDlVZnIrK1MvaHNY?=
 =?utf-8?B?STdKVklXTDFrOUlRcHhUK21nWHVOOUtYU1c3NENmMzhwVWZ4Z3ZiamFMK1Vk?=
 =?utf-8?Q?iCFLk6wCfRGf83CokRTG6aGblmu3dHqqkqFpfOr7dw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700021)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXZMdGhsellCa09iSVpBNWJIZEpvMHphWkhsQStodkx5UVdsMWZDV1VJYVMv?=
 =?utf-8?B?bFZZOHNYdWNSS3RLWmY4MmZOL2lSZHllKzVCem4xSlIvNjV2dG8vcEtSdDF5?=
 =?utf-8?B?YTE2WlQzRWxnbmtHZjRrUDVxZnFCZy8wNTcrMlNxdGJLMlZDWU9SM1o4NzNO?=
 =?utf-8?B?WEdrWmZMMkxWMjZ5LzZzMkJRWFJIWitUTGlNd05JNlB5YWpJWUpXNnh3cWN3?=
 =?utf-8?B?bFVMSnhScmpaZFdnSnMvODdqNXZiQWRTQ0ZSVGFjQkQvejlCL2hnVVVYOVhw?=
 =?utf-8?B?THBmUElDSUxBTDYvaWFhRzQ0VTdqNFBlVHFLWnkwTURXS1hVcFMzMDJ3ejJ0?=
 =?utf-8?B?WlJORnpSTkczYVhSejJ2aTZpMGZKVVB5bTVxMktUV1oyRWp2eVVHanFYSDh2?=
 =?utf-8?B?ajJLN1ZmMVQrbmhUODRkd2dMOUdFNmhKYnBFaFFYOGxxTnJtSHJHMXJzb3RY?=
 =?utf-8?B?S0R3QVFEN3hEdURLYURPTUFJUHkrTC8rWWgrK2RLZDZaOEhQWjQyOVZNaGQy?=
 =?utf-8?B?YWxQZGRsQXdOaklzb3pNNHR6WkxjYkpvVlVMQklpS1MrbVY3akF1RytuWThj?=
 =?utf-8?B?cUZDcXkrQTk3Q28zK3djVHptd2tQaEhaMnE5Y3hVeEJtdFJlcXZBU2lycW5Z?=
 =?utf-8?B?ei9NanhlTlFNY3Z2MUd2NmVMeVFLVUozNUNUNkl6aGJ6WDhSUzBGS3pTTkZS?=
 =?utf-8?B?UXBGTlBURlFNTVlERTdpMHFzaU4vVWtwdHlLSzdoRG0vK2hMay9WZDJCeVlT?=
 =?utf-8?B?YVZyQkk3a1F4dXpOTnVwMWFvaU5lMnBlM0kybEVSZldxamVaK2NiSklMUXE4?=
 =?utf-8?B?NXdoTDFSWllRazJYUVlPc0g2NGNZZmh1dmVUMVZ0T2RDTGNsUzl2dGNBc3J1?=
 =?utf-8?B?Z21mcXl2NnIxa1RnWXVHVnNoL3pTMk5YWE1WMi9zTnJHTnVKdjgyOGFUdG82?=
 =?utf-8?B?S1k2eXpxclJVbGdwM1p1TGJOSW56dFRkNkltQU5ZY0xPbUNtRTdlN0poVjRN?=
 =?utf-8?B?UjBWbXpUd3h2M2ZTNlRscVFRV3M2T1J6anFDM3VQOHYrT3dFbHRTNGgrK3NF?=
 =?utf-8?B?b1BMVDQvSXJmM1Y1QVhBWHBBM3RaOG5jRTJscDVjT3VNM2RFc0F5blVSSm05?=
 =?utf-8?B?NTZkRXlBNWpHRzJMT0dya1VTalJUWUp3UE1RSXE4V1UyYitGQ3dZVlJPTCtt?=
 =?utf-8?B?c2d4SVQ3TzIvQ2ZWc1U5U3VSTkdseGdaVzh4SmJkMEtwczVOdVF3L0ZZQitN?=
 =?utf-8?B?MGtQU21zZmI4ZWh5ZVhQZmZKN3hodmNGSDZ6SVZ6RlZKdnJMalNodTFBRTBW?=
 =?utf-8?B?SGJGcGM2SDBpTlc3UG05bnh2blNyU0VWc0dadEExUGNsZUNYRnVnSUFiV0dJ?=
 =?utf-8?B?UHJ3dFR0WVVWMGZucTU2WWV4L0paTmFLSHZaa3JqcFFvbkduWTdkYzhYSnBv?=
 =?utf-8?B?L1hKUkFvMHNQdnhkNUFZc2Q3UDc0N0UwcXlRdDEvMHNFdTFmQ1lXSW4wVzdr?=
 =?utf-8?B?YkRmVlY0bE8wL1ljMStvZERQNnRIc3RPR1dia2FQKytiZU1WbDVIS2V0Y2ZL?=
 =?utf-8?B?Q2I4Nk9UVmJtekJCSFN2K3paZCtwS2tpV1ZwZFN2bW5EN3dQdU5iZmQzeGpM?=
 =?utf-8?B?ZjVDMUVvWFFPcms1UWREVUNNcWt0d1dxRzZ2cUI2NGc1SE1hQ1J6eDhiTkFU?=
 =?utf-8?B?ZTBtT0V1cnJuWW03R3RGa1VFZlZ2OTVhNERuQ2QrUnBRUWRDNWdDOG5ScEVk?=
 =?utf-8?B?YTJoSm8xcFVES2xOaVltUkVxMXRHSi8ydGU0UUxPTWVUakZkVFA4UnNDYjZB?=
 =?utf-8?B?NUUrSVlYRzVBU1ZTbkIwek9DelhNWTYwcUNpQzRMT1BMenRVQ1dHYlorRXlp?=
 =?utf-8?B?T2hCOGh2L3YyRUM2NnUzLzFBdFUxM09tSURQazE1MitUcjVOL3BDM25UNmVu?=
 =?utf-8?B?NVZ4NmlscWdjU3JNcHp4NTlHSkJBWVRTanordWZNZ1lhRnVQVkZ2QmwwTXlD?=
 =?utf-8?Q?DnqcfdY+NikRBaVfykSmT3OuDXmaXA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b5ce2-441a-492c-eeeb-08de6286ee17
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 18:14:39.2662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1042
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3kUEWLQe1rYS1JJ/PdaGjlScSStS5HnFdnGeLEDtLs=;
 b=6HTPZYFx98fgji9YAXq6D5H1Mrqww0/s+Mh+1XyRQ9/I7x3HLsFiFZ30+3gdnJ3/NfrRKUdhEgIq+eOZWGCvF68gwOIDAbdSNSm+UvWgdCz8wIofP+TDkt/iRjV9Kx0GVPFGBiY5b9ZtP2w375jLnIkT1Z9M/BM+u9Bm0oB2tZmkG+sowaPP7ZbXAXY8radpcaJ2On7HsBCHQHGcZMxzi4G0T4vWAoLZJNXP4huj5TAQV//N6+g+bAup6WMwUQIRsrMNp12iX+Kx9GHAxZ/dHUcZ7DT4mDeHD7UCQoSEg0lvush4l2r+ci/4wOyiSC+rgc9oxfSxTthjVYhGDhPG/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=6HTPZYFx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYnVpbGRyb290IDxidWls
ZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9tYWluDQo+IE5hb3Vy
IHZpYSBidWlsZHJvb3QNCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyLCAyMDI2IDExOjAzIEFN
DQo+IFRvOiBCdWlsZHJvb3QgTm90aWZpY2F0aW9ucyA8YnVpbGRyb290Lm5vdGlmaWNhdGlvbnNA
Z21haWwuY29tPjsNCj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gQ2M6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPjsgSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4NCj4gU3ViamVjdDogW0V4dGVybmFsXSAtIFJlOiBbQnVpbGRyb290XSBbYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmddIERhaWx5IHJlc3VsdHMgZm9yDQo+IDIwMjYtMDEtMjcNCj4gDQo+IEhl
bGxvIEp1bGllbiwgSmFtZXMsIEFsbCwNCj4gDQo+IExlIDI4LzAxLzIwMjYgw6AgMDU6MTcsIEJ1
aWxkcm9vdCBOb3RpZmljYXRpb25zIGEgw6ljcml0IDoNCj4gPiBIZWxsbywNCj4gPg0KPiANCj4g
Li4uDQo+IA0KPiA+DQo+ID4gR2l0bGFiIENJIHJlc3VsdHMgZm9yIDIwMjYtMDEtMjcNCj4gPiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+DQo+ID4gRGV0YWlsIG9mIHJ1bnRp
bWUtdGVzdCBmYWlsdXJlcyBmb3IgbWFzdGVyDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAgICAgICAgICAgICAgcnVudGltZS10ZXN0IHwg
ICAgICAgICAgICAgICAgICAgICAgICBsaW5rIHRvIHRoZSBqb2IgICAgICAgICAgICAgICAgICAg
ICAgICB8IG9ycGg/DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICst
LS0tLS0NCj4gPiAgICAgICAgICBUZXN0UHl0aG9uUHliaW5kIHwgaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0NCj4gL2pvYnMvMTI4NTc0MTM5NjUgfA0KPiA+IC4u
LlB5dGhvblB5M01hZ2ljV29ybWhvbGUgfA0KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyODU3NDEzOTQxIHwNCj4gVGhlIHRlc3QgVGVzdFB5dGhv
blB5M01hZ2ljV29ybWhvbGUgc2VlbXMgdG8gaGFuZyBzaW5jZSB0aGUgcHl0aG9uIDMuMTQNCj4g
dmVyc2lvbg0KPiBidW1wLiBXb3JtaG9sZSByZWxhdGVkIHBhY2thZ2VzIHNlZW1zIHVwIHRvIGRh
dGUuDQo+IA0KPiBKYW1lcywgY2FuIHlvdSBoYXZlIGEgbG9vaz8NCj4gDQoNCldvcm1ob2xlIGlz
IGJlaW5nIGltcGxpY2F0ZWQsIGJ1dCB0aGUgcXVpcmsgbWF5IGFjdHVhbGx5IGJlIHppcHN0cmVh
bS1uZzoNCg0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KICBGaWxlICIvdXNy
L2Jpbi93b3JtaG9sZSIsIGxpbmUgOCwgaW4gPG1vZHVsZT4NCiAgICBzeXMuZXhpdCh3b3JtaG9s
ZSgpKQ0KICAgICAgICAgICAgIH5+fn5+fn5+Xl4NCiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4x
NC9zaXRlLXBhY2thZ2VzL2NsaWNrL2NvcmUucHkiLCBsaW5lIDE0ODUsIGluIF9fY2FsbF9fDQog
IEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTQvc2l0ZS1wYWNrYWdlcy9jbGljay9jb3JlLnB5Iiwg
bGluZSAxNDA2LCBpbiBtYWluDQogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTQvc2l0ZS1wYWNr
YWdlcy9jbGljay9jb3JlLnB5IiwgbGluZSAxODczLCBpbiBpbnZva2UNCiAgRmlsZSAiL3Vzci9s
aWIvcHl0aG9uMy4xNC9zaXRlLXBhY2thZ2VzL2NsaWNrL2NvcmUucHkiLCBsaW5lIDEyNjksIGlu
IGludm9rZQ0KICBGaWxlICIvdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvY2xpY2sv
Y29yZS5weSIsIGxpbmUgODI0LCBpbiBpbnZva2UNCiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4x
NC9zaXRlLXBhY2thZ2VzL2NsaWNrL2RlY29yYXRvcnMucHkiLCBsaW5lIDQ2LCBpbiBuZXdfZnVu
Yw0KICBGaWxlICIvdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvd29ybWhvbGUvY2xp
L2NsaS5weSIsIGxpbmUgMjkxLCBpbiBzZW5kDQogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTQv
c2l0ZS1wYWNrYWdlcy93b3JtaG9sZS9jbGkvY21kX3NlbmQucHkiLCBsaW5lIDI0LCBpbiA8bW9k
dWxlPg0KICBGaWxlICIvdXNyL2xpYi9weXRob24zLjE0L3NpdGUtcGFja2FnZXMvemlwc3RyZWFt
L19faW5pdF9fLnB5IiwgbGluZSA0LCBpbiA8bW9kdWxlPg0KICBGaWxlICIvdXNyL2xpYi9weXRo
b24zLjE0L3NpdGUtcGFja2FnZXMvemlwc3RyZWFtL25nLnB5IiwgbGluZSA2MiwgaW4gPG1vZHVs
ZT4NCiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xNC9jb21wcmVzc2lvbi96c3RkL19faW5pdF9f
LnB5IiwgbGluZSAyOSwgaW4gPG1vZHVsZT4NCk1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVs
ZSBuYW1lZCAnX3pzdGQnDQoNCkltcG9ydGluZyB6aXBzdHJlYW0tbmcgYXNzdW1lcyB0aGF0IG5l
d2VyIHZlcnNpb25zIG9mIHB5dGhvbiBoYXZlIHp0c2Qgc3VwcG9ydC4NCg0KU291bmRzIGxpa2Ug
YSBmaXggaXMgdW5kZXJ3YXkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
