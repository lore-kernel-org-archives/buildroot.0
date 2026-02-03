Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE8E7FDFA
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 12:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C8F81268;
	Tue,  3 Feb 2026 12:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8C-FNJAhrtY; Tue,  3 Feb 2026 12:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0726C81221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770120260;
	bh=caMCHhFLGmFmhOVwMg8s2avauGZda0CTrjtzNp1umkk=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2jjfqAGJW4zcZ3vj5PctemOH8EL/oP/Kx+wDbBpiJb8zno1exHQgszm0whEqfQ/u
	 dT0Zu1Tq9t2lqVOW6E3Sjft6kavf9VVo8FEnkrSE5rKH9rSqQTtEmopngjN0M4FVrp
	 GwkLzZ6MMJ9hiuXslye9Kmvwquwr0mSrw7gNH9nSraJ8bX0JZJ/HNPTDF0LwtSmU+j
	 OygHOVb6jLmtuZhfv7OBhd6VcXBvIAQTQHzneEgTad6ZoiOBf3i3ATtiSv2FEx3XlS
	 Zhizp1bd2zdQgP3oW1dtfhDK0EDoVpV83Mogk6UFxrci1+/Qnzc53qm1s1ZHN894p0
	 Wtx0PFBEeGJ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0726C81221;
	Tue,  3 Feb 2026 12:04:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29C701A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DA94043F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSDbyVj8asK6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 12:04:17 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::60a;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8AFD40257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8AFD40257
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8AFD40257
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 12:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=kbe35ekuJzwNeK9GnyQfmKqZwhHaHGJBN4sjNLyZud59atpxmCtn0TqjN9TR8Z7aagdoM7/YnSK2bp9xIgWWqGIBqIJRja1OQNbdBVdSOqoVUWVyto311uUU6mDFWVXJNb/PBModkqywsdrmo7V9KOmlfNszBJONFSC5LuE8mTebdf7RDfeJ/7L+/5THqve8WVF/YVtokDFi9qFwfn3Bi2gEf5/W3o3PNG507ncHIfs5HcsH+YwpJRqI2zVTPTyCyi3tdKRCfx/VxxavE4pRfIiNfBcWNMMHCAsIu75fWSULeG7Px5nZvErXwV1GK3v2KgybetSHwuCIUsfoncTgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9Uwr6c68m0uH2/ctgqZltjC3JgsFYTdFhMOD174mqg=;
 b=kfmhfgqlRA03I/3kr2b/A6svKEmqgSv7YxWeUByBoyKxt9nr4Xw6wVX4T4pYD462bMAJeU5BBVpTc8/68KiR1OLOzI4cxszv/57RSad1+U/226mZS1HIQqK5QkxugzXb+Fy9bvx2WsaNFhAmDHAXn4CssVjE41YGk1mqlnaVBdq+zrhkKwTRapZ4Kta/8OiDeSw2MBArvAiD5VfJCCy+1pq7sLRAGftjiqleJPpnK4cleW8iobmhRvhk0SKqETcBRibrJfWJFEPdaUte4HaD7JBhYLo3pSy9VGpY0I5U5pR/7CUZfcbtFnlVcaZ/JR/DkrR8n2Lol7XAhb1V/0QNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2251.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:199::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 12:04:11 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 12:04:10 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
CC: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, Romain Naour
 <romain.naour@smile.fr>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] package/python-pybind:
 install headers into host directory
Thread-Index: AQHcfamh/IflkaUvv0SVQP+snSa0G7VxAwzQ
Date: Tue, 3 Feb 2026 12:04:10 +0000
Message-ID: <PH1P110MB16031EE97EF70A7F79F5B8079F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260101134901.882436-1-bernd@kuhls.net>
 <CADvTj4omtKN31WgG0cP=Gr9EBEqW1-Q1guBOKwgMB1gUCxe3gA@mail.gmail.com>
In-Reply-To: <CADvTj4omtKN31WgG0cP=Gr9EBEqW1-Q1guBOKwgMB1gUCxe3gA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB2251:EE_
x-ms-office365-filtering-correlation-id: ec222070-5bc9-4fe0-46e9-08de631c5735
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M3UzaG1BTHN0ZnlHRm8xZHZRdGpjMktuUXMvTDJJK2k2aTh5cUdES3pmT25w?=
 =?utf-8?B?TXZNVjdPcnlvSkpBSXExREptQTJZSEoxQWVsb0ltZkE1aEhxRHp2cnpTeVYv?=
 =?utf-8?B?ZGM4VXZ3MXFaZUNvekp3OGtrbHA1UHdOSndocmd0RVRkRlhGZGpja3pZU3dl?=
 =?utf-8?B?aGtYR3dkYUlzUFFDdzU5MU1xUEg2dWlmVmtWVEZsMHdXOGI0TWkwUGd3ekhM?=
 =?utf-8?B?bGJ0ZVcxeXF0Yk5lMkZEWG5oYW90UndUZHJvdExNdFJuREVUZXhCRTdWaWFC?=
 =?utf-8?B?N0NaaGlTTUJSbmNnbG5mTkFHUnBDaSsxNk9xSnFLWmcvWU0vTllyMnJ5Q0dt?=
 =?utf-8?B?dkVwaHN1UVUxMWkwaEN3eVpOeHhsSGRPRHlEVnpQbGRCb2g2TVpyaExDZTNH?=
 =?utf-8?B?VUVoMXduS29Xc3MyclprOXhSd0VGWC9HMUd3YnJ0cjcyck5kbDR2cFl4UEp3?=
 =?utf-8?B?ekZJOWUxRzZFeUlMQzdzenhSNUZMRHo0Mkd3ZGY5WDRxNFlkaHJYNFdUNmY3?=
 =?utf-8?B?cnZXYlhsLy9yang4VHNrQTZuNmthVzA4cklBb1kzc2NLSnk4S2VkQ0hzRm05?=
 =?utf-8?B?VklYUVJ0S0s2aGlmNE5xcE5tMzBUdWNNdDVuOTJyQ1I2R3c5QThqcEtQS1g5?=
 =?utf-8?B?TWU5NmsrQTY5ZlYzUjRtbFNxZzFPNmtDWlovZ0dHUEVuYnJaSUNLMUxoUEYr?=
 =?utf-8?B?V0tESHBGMmpzWnZ4TkhVWW16c1cxNzJMMFk2WEsxcEJ6WHk3NjBMQW16V1c1?=
 =?utf-8?B?K3ZtaHVrUEJOYW4yQlJ0QTJMYXAvTWpUNVk1RytLK1VMYkM3YlI0blRaVUVR?=
 =?utf-8?B?Q2ZBTWg2QkFRbzliZ0JZSVIvc2IydWRCQ0NHZVEvRG40YWFDdXk1VlF0S0Rq?=
 =?utf-8?B?YXYvTThYZ1Q0WDl6cWdPRE9QSEdXdC9KYTc0a1VLUjBLSGlqUERsNUFubGxP?=
 =?utf-8?B?L0ZhY1JjTDdXTnEzUmgrNmVneGcwaTZLbmRWSHR3a1B0N3dMeFdOZVZ3andt?=
 =?utf-8?B?UE5rdWZjSnZmOEtka3ZtUktVV2RhU2dBY0tXYUtaS01DNDZzeHpkQ0VoTzVR?=
 =?utf-8?B?TWVaS0llRDg5NGlFdUNvYmo3TjR1R21CQ1VobUpRV2lCRTQ2TVlXRm9PdFdQ?=
 =?utf-8?B?UkJ6ZnErN1ZWeG1pdzBrOHFFRC9URUI3T1hrdXVMakxjSWhqdzhiL2dLL3FZ?=
 =?utf-8?B?aDVzbVpkVUZkK3dFUDZwbVZuNS9mWDFPUExTRzFmYzBZOXBTcHNLcTRzMlYy?=
 =?utf-8?B?K0hBck4xTlpyVVhJZEtGOVZNeFhBREQ3WG9OeCs2T0I4T3dWL20wd3k1TjF4?=
 =?utf-8?B?RDNPN0JRbzgrSytSbWdBeTFJZG9sRXZvZlF5S0VQTXh4Z1ZTOE9LWWtJOW9L?=
 =?utf-8?B?NTlpNjZxUmFGamxWeXQ4cDM4QjQwc0IxTDdqZXVNa1lGUTlQMFdqMTVtWkhp?=
 =?utf-8?B?Q2VnYzN2eElkdTI0NTNwcVNLOGc5MXNJdURmaEJpeG5SQi9DbmkvbHlXckRa?=
 =?utf-8?B?RDkybm5uMCtjWjN1aUEvUlB1RG5lLy9TclhqUy9wMmFxek1hRWFGRzNCVmdm?=
 =?utf-8?B?bGJSdVVPVC9zUlgwUXNuWVcrWDNuMllEczJLaDlNOUIxZkc5K2h1dzZTc1Fx?=
 =?utf-8?B?dENLVXg3UGNNVStOZysyQnFOQWZaWkQvMFgzaUJ5cW9mNE1UTE1hd3U2SzJU?=
 =?utf-8?B?T0xzRmZFOGFFL0kwTTZBZDhlWUV4Smw1Y1Fxd3NxUlVtRUgrcEhFWW5ZeWlM?=
 =?utf-8?B?aUNvZjRQckVLenEzcEZiUVpFdC9qSE9MZE1RbFBWQXdRQ3UvVTNWSTBsdjB5?=
 =?utf-8?B?anpjLzNKMmlVRHgra3NYSGFrSVk3WnQ5OTFjTU5CUnpLb0E3R09ibzd1dW9o?=
 =?utf-8?B?aWV1c0hnOTVlaTQ5bklVMHQvVjlmeTlhNmQyRU9LbUI1UjNSZjU3TjNzaVNa?=
 =?utf-8?B?MmdwczVydUxFVGpTNEZlQkRBUVQweGNYZGs1OElmYk90aitCTWVPMjhGY0Ro?=
 =?utf-8?B?K1dsSWxMSU1uQk93NmZLWmxMUVRITFd0YVFnRnEzL0pVSmJVaEhYNlhHbWQ5?=
 =?utf-8?B?dmJHaDFMYWx4dmRVdDhnRVBqQWhIODBONUkvNEhTL3YrMWJXWlJDQ3ZJOW9T?=
 =?utf-8?Q?LYqcilog8rU/1g91f3bixvMo3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVVSTm5raVNCNnFpeEFlaTRsRnNySjJUK3BmVmtyckxPYjNsQU13Q242dWto?=
 =?utf-8?B?Zk96bzBxOC9Wb1Vha1prRHlRbDg0TzAwQUlFQkxxMGQyQnUxUlZQWlhBMkVq?=
 =?utf-8?B?TjFjcEFIQmdDeGhqTEd0Q0p5UkM4S1lYSE1tdmU2eW94Q3Qvb1htLzdCcGpY?=
 =?utf-8?B?MnhBMm1uaWp4cWNmaDNHdHRpdzhNY0EycmxlRGFUVUlhRVFURWsxZkREcnU5?=
 =?utf-8?B?S1hiRFJWbHFibWs3aEhaR0t0ek11cXVLRlllR0xTV2lqRUFsRGlZSzczRUhQ?=
 =?utf-8?B?cDBzYWJEMk1abUFRNW5jUm5rdGRsSGlscDY3QktYTk02TWtnU01ZREFpa3Q1?=
 =?utf-8?B?NTh2K1F2OXpmcFBIWithcVRsczZnMWlMOThJZlZZcU5ZOHNDaFRKaTZJOWZn?=
 =?utf-8?B?eitIR1FwdTh5d3RUa1M2UmVPWkhEUlNUMWxuMXZTWlRCNjVuY0RXQ05qWHk5?=
 =?utf-8?B?YjVFNTZMZ2h1akxLRHh1THhPdG5RM0hWcllzeXFvZjBOanpKbWpnWFR2UVE0?=
 =?utf-8?B?YW43Z3dLYzBEblJUN1UrZnFRcjdtMjJPSWE4WVdvZ3ZsSVdndDZ2NUFudUJ1?=
 =?utf-8?B?bWZBc0U3cVZhZmkxSVBKQjNtcTdFUTBhb2xlakFZR2hoMHBVait3VmZsNEN2?=
 =?utf-8?B?eGhVZ3MrdEdpeWozam9ocndLZWNnbGw5akVxL2hTeUFKT1MxU3Y5bVF5N1lu?=
 =?utf-8?B?ZGxGNFlxdGVkMURBcUUvN3pQYkxTZUJ1cEhlRW9WbXNUNXZZT3l6eVV3Q3N0?=
 =?utf-8?B?clZWWFRUbWh3VHFFbmd3QTlHdUsyeGZPQlFoOWdqdTliTjAwNFhVQzBNSWUy?=
 =?utf-8?B?ZThLWWtlK1YxdFpxeGExbVk3a3dhKzM1OTFFdzVRbEIveGwwaTArTWZGTFpS?=
 =?utf-8?B?azNyTjlSV0ZpSGVLNDhpNVlyS09WRzJ4dWRtRjM4MXZuYVdLaDRVZHQ4UzNE?=
 =?utf-8?B?bXhYRTJvcHUzc3UrMlExbEpNbGZrdGtyVW5EWkR3TzlYNUJlM2hxVGhNYm9G?=
 =?utf-8?B?cWNEQXVIMDhhV01iNG1vb0dkZ2Z6R1daMmxldFNyVGc1RUdmdldJQ1dGSU5X?=
 =?utf-8?B?K1VRNE4rNjJkZHZLWit0WVd2U0QzWiszaGM5ZXhBU3ZtQ0c3OXcrRVVpa3NW?=
 =?utf-8?B?QS9wWXdVcldHL2EwUFFpY0k5eFlkU05NV1QwNlJGbzM3WkhSK0FGeUFiMkpM?=
 =?utf-8?B?TnhlZmVPWVhKQW9iQnl5bHBBelVGVEIzcnJ0SXllWVFMR1czaEVtTlQzUGVP?=
 =?utf-8?B?bllxVkRaUzFYM0RpaGwrTGNjZVpWNmN2RFJ5NFhTT0FBRXh4Y0FoekoxT2h4?=
 =?utf-8?B?LzlHZUpnRnRoS0dEYllaVTlUMmZvYlI2aURQSVBidFdBS1dVT25rSjg2LzAv?=
 =?utf-8?B?VWVsYk8zWkx1WE9rWlNiZEpYc0FXKyt0S3lsMHdSNUNSVnhVUFcrVnhvaTN4?=
 =?utf-8?B?YkFIdDRKWXpleDNLNGNXMStxNktmVFJJdVRoMDU2NTB1akgyRjJuY1RGazdD?=
 =?utf-8?B?eGUzMmZOV2RPTUxkTzkyQWdrcW1vQ0IyWE1EWkFSbHFaczFLYXFFRzRzbW9F?=
 =?utf-8?B?cTdmSUJOS1Fqczc2WVF6MjdUb0F6bnh2VytQcVdlL3FaZzVPK3N2MkY0SjJT?=
 =?utf-8?B?d2xITm1hVDZxZ2trMHlsOUZVWTQvVEl5a2RsaDFZTGpoRVZ5UmovYVR4WVFj?=
 =?utf-8?B?SE1QMDl4ZWVIVEZZbTRQdndjVEhpOG5ZNzR4ZzJ4WVpPaDdteVhkb0FGRkpE?=
 =?utf-8?B?c0pYZmRmdzhVd2M1ZzZSMEROREtJTEYzK0ZnN2J4UURBbU0rV1gwM01hL21E?=
 =?utf-8?B?T1hQMmJhSENCbXVoSStQY2lBWk1VVCs1UWVxYi9zMkl0NlpnVHh1S2pCdEZu?=
 =?utf-8?B?ZEpRY0NxS0c4YTRjNlFTQzlzTEV6MFIzQkNlbXdBYUhvN1l5c3ErSjJNUlhF?=
 =?utf-8?B?dVRQaUd2QzVtOUUvQlVRUnN2SWoyM2paNlB5UEYwQWgzWjF5SkVaOEErZVds?=
 =?utf-8?Q?Z8MBVxcyFC8qdRLO1NURrzBe9OM8VA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec222070-5bc9-4fe0-46e9-08de631c5735
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 12:04:10.6383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2251
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9Uwr6c68m0uH2/ctgqZltjC3JgsFYTdFhMOD174mqg=;
 b=cOCWOdhApK2L9Z3Ba0Li0rt/JFqIikGBmXaus3Nx8lxT1n68gBjb/NPDR+6VgYEsTr2jYMitoHiMSOzanKu5qcwOICoF58hHGzfoROHc+yBdWE5MsKtgQKEPSqGEWYWs29MK7eef7YoV/HwL1SrfMAcFthUidNaYfu6lYwZoyddfcqj1CL8vg7f4/N/OXqC0hNjPfXxWS03qOM/BZz+twtEPJdhJPzRYRpkqPSfdZBCP6oFl20TYKi6iVvcQTLTzGP4Wdwk8liij2cbTWBF58HOlU22MMI0DWLduQIgelx/awwuMSQcDGmfNv/38yisHmHMnf1KLHUcUL/qcCBXAHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=cOCWOdhA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] package/python-pybind:
 install headers into host directory
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

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBidWlsZHJvb3QgPGJ1
aWxkcm9vdC1ib3VuY2VzQGJ1aWxkcm9vdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW1lcw0KPiBIaWxs
aWFyZA0KPiBTZW50OiBTdW5kYXksIEphbnVhcnkgNCwgMjAyNiAxMjo0MCBQTQ0KPiBUbzogQmVy
bmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4NCj4gQ2M6IEd1aWxsYXVtZSBXaWxsaWFtIEJycyA8
Z3VpbGxhdW1lLmJyZXNzYWl4QGdtYWlsLmNvbT47DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
DQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBSZTogW0J1aWxkcm9vdF0gW1BBVENIIDEvMV0gcGFj
a2FnZS9weXRob24tcHliaW5kOg0KPiBpbnN0YWxsIGhlYWRlcnMgaW50byBob3N0IGRpcmVjdG9y
eQ0KPiANCj4gT24gVGh1LCBKYW4gMSwgMjAyNiBhdCA2OjQ54oCvQU0gQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD4gd3JvdGU6DQo+ID4NCj4gPiBGaXhlcyBidWlsZCBlcnJvciB3aXRoIHB5
dGhvbi1waWxsb3cgc2luY2UgaXRzIHZlcnNpb24gYnVtcCB0byAxMi4wLjANCj4gPiB3aGljaCBp
bnRyb2R1Y2VkIGEgZGVwZW5kZW5jeSB0byBweWJpbmQgd2l0aCBidWlsZHJvb3QgY29tbWl0DQo+
ID4gNWY0NDZhOGQ2ZGQ4NzE1Mzg1ZDZlMmRmMjcxNGYwNjRiZjI2MjQzZDoNCj4gPg0KPiA+IEZp
bGVOb3RGb3VuZEVycm9yOiBbRXJybm8gMl0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeToNCj4g
PiAgJy9ob21lL2Jlcm5kL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvcHl0aG9uMy4xMy9zaXRl
LQ0KPiBwYWNrYWdlcy9pbmNsdWRlL3B5YmluZDExL2RldGFpbC9jb21tb24uaCcNCj4gPg0KPiA+
IHdpdGggdGhpcyBkZWZjb25maWc6DQo+ID4NCj4gPiBCUjJfeDg2XzY0PXkNCj4gPiBCUjJfeDg2
X2NvcmVpNz15DQo+ID4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15DQo+ID4NCj4gQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOX1g4Nl82NF9DT1JFX0k3X0dMSUJDX0JMRUVESU5HXw0KPiBF
REdFPXkNCj4gPiBCUjJfUEFDS0FHRV9QWVRIT04zPXkNCj4gPiBCUjJfUEFDS0FHRV9QWVRIT05f
UElMTE9XPXkNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+DQo+IFRlc3RlZC1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+DQoNClRoZSB1cHN0cmVhbSBzZGlzdCBpbmNsdWRlcyB0aGUgYyBoZWFkZXJzIGluIGFu
IGluY2x1ZGUgZGlyZWN0b3J5IGxpa2UgdGhpcyBwYXRjaCwgc28gdGhpcyBzZWVtcyByZWFzb25h
YmxlLg0KDQpTaW5jZSB3ZSdyZSBidWlsZGluZyB0aGUgcHliaW5kIHBhY2thZ2UgZnJvbSB0aGUg
Z2l0aHViIHNvdXJjZXMgYXQgYSBrbm93biByZXZpc2lvbiwgaXQgY291bGQgYmUgYXJndWVkIHRo
YXQgd2UgY291bGQganVzdCBjb21wbGV0ZWx5IG92ZXJ3cml0ZSBgX3ZlcnNpb24ucHlgIHdpdGgg
dGhlIHZlcnNpb24gaW5mb3JtYXRpb24gaW5zdGVhZCBvZiBjb3B5aW5nIHRoZSBoZWFkZXJzIGFu
ZCByZWx5aW5nIG9uIHRoZSBzb3VyY2VzIHBhcnNpbmcgYSBDIGhlYWRlciB0byBkZXRlcm1pbmUg
dGhlIHZlcnNpb24uDQoNClRoZSB3aGVlbCBidWlsZCBvZiB0aGUgcHliaW5kIHBhY2thZ2UgZG9l
cyB0aGlzIGh0dHBzOi8vZ2l0aHViLmNvbS9weWJpbmQvcHliaW5kMTEvYmxvYi84ZjY4ZWNkMzJj
OGUxOGQzYjA2NGRiZjBlYTVmYzMxYTZjYjM3ZTlhL3B5cHJvamVjdC50b21sI0w5Mw0KDQpJdCBk
b2VzIGFsc28gY29weSB0aGUgaGVhZGVycyBpbnRvIHRoZSBtb2R1bGVzIGluc3RhbGxhdGlvbiwg
c28sIGVpdGhlciB3YXksIHRoaXMgaXMgcHJvYmFibHkgInNhZmVzdCIuDQoNCj4gPiAtLS0NCj4g
PiAgcGFja2FnZS9weXRob24tcHliaW5kL3B5dGhvbi1weWJpbmQubWsgfCA4ICsrKysrLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHliaW5kL3B5dGhvbi1weWJpbmQubWsg
Yi9wYWNrYWdlL3B5dGhvbi0NCj4gcHliaW5kL3B5dGhvbi1weWJpbmQubWsNCj4gPiBpbmRleCA3
MjgyYzA1OGY2Li5iN2U1Y2I2NTk2IDEwMDY0NA0KPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5
YmluZC9weXRob24tcHliaW5kLm1rDQo+ID4gKysrIGIvcGFja2FnZS9weXRob24tcHliaW5kL3B5
dGhvbi1weWJpbmQubWsNCj4gPiBAQCAtMTcsMTEgKzE3LDEzIEBAIFBZVEhPTl9QWUJJTkRfQ09O
Rl9PUFRTID0gXA0KPiA+ICAgICAgICAgLURQWUJJTkQxMV9URVNUPU9GRiBcDQo+ID4gICAgICAg
ICAtRFBZQklORDExX05PUFlUSE9OPU9ODQo+ID4NCj4gPiAtUFlUSE9OX1BZQklORF9JTlNUQUxM
X1BBVEggPQ0KPiAkKEhPU1RfRElSKS9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1Ip
L3NpdGUtDQo+IHBhY2thZ2VzL3B5YmluZDExDQo+ID4gK1BZVEhPTl9QWUJJTkRfSU5TVEFMTF9Q
QVRIID0NCj4gJChIT1NUX0RJUikvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS9z
aXRlLXBhY2thZ2VzDQo+ID4NCj4gPiAgZGVmaW5lIFBZVEhPTl9QWUJJTkRfSU5TVEFMTF9NT0RV
TEUNCj4gPiAtICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgpDQo+
ID4gLSAgICAgICBjcCAtZHBmICQoQEQpL3B5YmluZDExLyoucHkgJChQWVRIT05fUFlCSU5EX0lO
U1RBTExfUEFUSCkNCj4gPiArICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZQklORF9JTlNUQUxM
X1BBVEgpL2luY2x1ZGUvcHliaW5kMTENCj4gPiArICAgICAgIG1rZGlyIC1wICQoUFlUSE9OX1BZ
QklORF9JTlNUQUxMX1BBVEgpL3B5YmluZDExDQo+ID4gKyAgICAgICBjcCAtZHBmciAkKEBEKS9p
bmNsdWRlL3B5YmluZDExLyoNCj4gJChQWVRIT05fUFlCSU5EX0lOU1RBTExfUEFUSCkvaW5jbHVk
ZS9weWJpbmQxMQ0KPiA+ICsgICAgICAgY3AgLWRwZiAkKEBEKS9weWJpbmQxMS8qLnB5DQo+ICQo
UFlUSE9OX1BZQklORF9JTlNUQUxMX1BBVEgpL3B5YmluZDExDQo+ID4gIGVuZGVmDQo+ID4gIFBZ
VEhPTl9QWUJJTkRfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0NCj4gUFlUSE9OX1BZQklO
RF9JTlNUQUxMX01PRFVMRQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjQ3LjMNCj4gPg0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0KPiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljaw0KPiBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlDQo+IGNvbnRlbnQgaXMgc2FmZS4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
