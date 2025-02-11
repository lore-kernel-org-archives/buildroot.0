Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45649C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 17:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDCF8230A;
	Tue, 11 Feb 2025 17:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQwEEVtycPUD; Tue, 11 Feb 2025 17:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15AC82261
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15AC82261;
	Tue, 11 Feb 2025 17:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C44194
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AFF04127B
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAj8kddhSvsL for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 17:12:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::62b;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C046406BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C046406BC
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C046406BC
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 17:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsqRsylGjaeaPz3L1PtO1hRRc60qnWBdYGIWC/0anH7REgfmJjv983+cl9xzo5yMoUtpLNdLMTy0kdZ7/pBQdxJBXaQOrA4os3f3gzGKIaFRm1iLhatZwpwDsLcwLp2/bDOVaq6c4owMsY4xuTP2axnzMgDXKOyc3/txIXwIFrZawUtra/1UTkgXKWdUtW/NeSIptSbzD9P0OlH/dtJMcNp3TxQkm7yjZO5MJoBwC/LgnMLbH/doxuF34W+sYYvbcevuYNRmCLeceabDuYP/ZQ84dlTt+yJBdK6hRnQqpLMPaly6puXSuI117yN0IjiDBaJwLxCEJpV/EjDKb2Qfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAESQ5KD3CPoy7JpPNUSlIDMqVVZdiGMVsSEj73g26M=;
 b=fSecg1UpbwwKw0qLu1Dp8mjviBU0anR2Jg0tIo4Wu9qd7+lM6OjCb069ZCPa1N1dON5O5MQbQj1L7tuK7028zrHhMmbSzF9n3hclt1+qDhKigAqU7yGyBqCAVTfcGI0tNs7IsDBYSUXgu91EEWOLvNFZ5ykU9pPu3nIGcK7p3hyOsQEF/jyzPzFqF/rgkPDL8B3nRNGQkpYjtEtbfdknfIk5zv8UHJfhZu4CFU2HmntXsGqRqZEtIt4uu8M5UgJTMPvk7cIoRPEmuJ1ycnqEQ2tW75QoZ3Lge/xbYXDRczC3MXIajSNsmswLvMXVSu7bGD8PjXu7ecAUMyFLCjb6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 17:12:08 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%6]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 17:12:08 +0000
To: <buildroot@buildroot.org>, <romain.naour@smile.fr>
CC: <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>,
 <Conor.Dooley@microchip.com>, <thomas.petazzoni@bootlin.com>,
 <Valentina.FernandezAlanis@microchip.com>
Thread-Topic: [Buildroot] [PATCH v2 3/3] board/beagleboard/beaglev_fire:
 cleanup gatewate update
Thread-Index: AQHba+M3fWrL2WfCNkWFuE6684lPt7NCcc0AgAAHhYA=
Date: Tue, 11 Feb 2025 17:12:08 +0000
Message-ID: <59efab474319bc56b2b9c446fe72537132ae5564.camel@microchip.com>
References: <20250121090513.3375533-1-jamie.gibbons@microchip.com>
 <20250121090513.3375533-4-jamie.gibbons@microchip.com>
 <4991bef1-27ec-4594-a239-9694ca2a6993@smile.fr>
In-Reply-To: <4991bef1-27ec-4594-a239-9694ca2a6993@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|MW6PR11MB8412:EE_
x-ms-office365-filtering-correlation-id: 1d347858-65a8-480c-0fb7-08dd4abf375f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?bkxQaUkrcSs1d3k2eHpKK01SbzZ6Rk5IZGlHckEvQ3NyWGhjck5HL0dvdEY4?=
 =?utf-8?B?azVGcUtqRC9ST0I0U0dqVWVzemZkV0RlUGRzM2ZIUHpqQks2RGhKYkNENkp6?=
 =?utf-8?B?VzE0Y3VMZEpSK0dUR2VobEhYUW8zZEJTc1ZnRm8rWEhUcjVMQVFFQ3ZobWgv?=
 =?utf-8?B?NEs1TXprVGg2Y0FRUDJKUnFyUUtBbE1kQU9mVmFQd0xHcHFrTFJWWHRpbjN0?=
 =?utf-8?B?eUtmMjg2KzkzcTE4Ui9HWmtRRTZpa0xwZTA1N2d6V1lwekdEWnNVTytGNitJ?=
 =?utf-8?B?SGk2S1pDWXNERHNmSjRBc2RpVmRmTDhaekk0WmEyTjA3RkRmemtEdlhVbFNq?=
 =?utf-8?B?MjlwRFZERlhmV3NuanpIamdOYlNvRFhmOUVJdi9tcEVkK1l1YW1URnhQTTQx?=
 =?utf-8?B?LzFtWHJjYzNFSloydHlFaFpOUURMUjNYNks5OG9sT3c0bndSQ053UkZjLzZ2?=
 =?utf-8?B?eWFna1FaMXpRS0JteEJOS1o3S1o2QjkxSk4rbkZKYjhIRDM2Rlc1N0U1TWdv?=
 =?utf-8?B?a3YyRUQxVzh4cHFGcVFRVGtjdTIyVEFUKytmZU54Y3dnNVlwY0N6TFQ0T0pL?=
 =?utf-8?B?Tkhmb1JhZHJlTWlZdEdueVJvQXZFS0J5akZId2hyTktMMmVRbEhWRnpUc1Yw?=
 =?utf-8?B?MzNiemkyd0VOUEtRVWdMTUZUZVFhNHpUS01JaDkvaGxheFNOdWg4V2dES09Q?=
 =?utf-8?B?a0xZdVdjZDBPTm1WQzJsZnpmeDRpakpDcDVYNzdhSWFsTkowSTZyMUxCNFVq?=
 =?utf-8?B?UkJIMHNSalh1SGpMT21sSFdXeDVPNDhSR1llbUdVdGhLN0E3TzhydklBai9h?=
 =?utf-8?B?dGt2MHNvMUVvL1NFUFlBOVhRcEpPQkhRcXFHUStYUGVQQ3dhbkpPc01seHFs?=
 =?utf-8?B?emdXbkhVZDUrYWhMTElZS29meElhMHh5OEZLY2pONUc1NkdOV1NTK0VLWGFV?=
 =?utf-8?B?TDVRc3FNL1RycGNNVTI1VWlCbk5UT0ZHazdpd29iS21uQUhUdHFvb1lUSUx6?=
 =?utf-8?B?UlFCeCs5ZEdrdnFrZzFRMS9EdDJiN1hMNkJobjRqeDlidkxCTWZydlpCMFNv?=
 =?utf-8?B?L0JSdGlsY1VWN1JHc2o4Z3R6SWlyOVpsdVdRM1lRaWE2alJPMWYvdzBQb210?=
 =?utf-8?B?U3lsNk5SUkk0czVLMFZPczMvb0dFUmxZU1lzWFRWa0tRWTdJTFowSkhUTXBB?=
 =?utf-8?B?T1U3MXM3M1k0V1VkbSt1Qncza3QzMjJOVVRmR21qRG5GblJwWExwdjcyS1R3?=
 =?utf-8?B?ZlFXcU5vRWFMZmVQYVVHZnBHcThYZ2FCUTFTQk9CM0FnWE0xaWFDbmRKZEE4?=
 =?utf-8?B?UUtjRXgyYmNYZWt5WTFxNy83aXA5a0FBUGNzc1dReWN4SkNXdFA4TjFHOFRm?=
 =?utf-8?B?Y3NnQW5ValN4QytuZ1FndWdpTXAxaS9NakFuRTdpL1JDWWhFcUt4N1E5T2Jl?=
 =?utf-8?B?aEt0YW9HNDZpZnpPM0JPeEZLUWFHdmxlL1hIa2c1YUJkUDRvR3c5TXNsYW5J?=
 =?utf-8?B?ek1uMVljbThwd1RFRk94a09lSXBCV2FVdnhsTEZiakhKeEJHcldWWDF4MEFK?=
 =?utf-8?B?cUtMVHI5bFFLcC91dTNuNGVPZEwxa2lQMGpCdGFQSGZXS0xZUDRaQ0g1TFNK?=
 =?utf-8?B?dVhkNnRnZHFnbHU3VDJTWnJSdHJFY1ZmYkJlUVRmb09RZ3ltckFwaXNFcGpt?=
 =?utf-8?B?cU9INUJoTzE5ZVVPcyt4TVlGaXo0R3dLKzRKUjZwNG9kbzhTaTdjTWtGVWJJ?=
 =?utf-8?B?YnQ2L2oybWhTWUQvaWR5dW1MRVBQdCtrUXdSVmJSWDM4NHA0VWtQZU9PYXRH?=
 =?utf-8?B?UXBqSTlueG53U3VaOTRkN0ppbFhzcXpEYmlsUmhSVnI0NzdPTDYzR0pXSG50?=
 =?utf-8?Q?hlJNwTstlxkKS?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFphdmdsNnViK2VldzRxclUxVXUwNGcwVFZCUmxhb2VxUkhxTHFEcDB6Wkt2?=
 =?utf-8?B?eFJMekIyZmFNRDgybHczbng3THJiTnhHbTZZZTBGUElaUmJ4dXhMMTNiZ25s?=
 =?utf-8?B?Z2t0QVJ6eVAvYzZVeEtHZmpGSFhDN3l1dTlRREJzS1I3NnZxaVZKV0RZSEk5?=
 =?utf-8?B?M3F1YVVpUDNIOEZiQzdjd2xlUFNHblVNTUhLNmFxc3BBMnR0L2dQV0RTVUR6?=
 =?utf-8?B?aDFxdmRJK3BuYTI0VlZLRWdGOFVkZXgrb0N6Wk15SG9OdldjeWZrN0tMRGMv?=
 =?utf-8?B?cnZMVlh3VGxGZC94ZW5qNWYrNkZacEVKK2FqSGZEMFdLU0gzWkhlNHpkME1E?=
 =?utf-8?B?M2Y3U2dnaGoraHdzdk9zZi9EcXViUm9KNXAvOE40d3VNaUN1UVN0NldCYnV0?=
 =?utf-8?B?T0FmelNnOUcyY0dFRWJFNmpRUGU3QXQ1Vi9LalZtanlrN0hlUGp4VXd1Q3VE?=
 =?utf-8?B?NzFKQ042bDBZZGtRQU84cFdNeTErR2x1QUJRTVNQK3hPbDdRVElNMXc5bXU3?=
 =?utf-8?B?QXdnOTdTMS9vaHlsZ2hoL2pMTnVsT0xLR1A0bnMzMk1IWGJYa3Y3L0MvMVlL?=
 =?utf-8?B?VmZNdHd3RGFPYU9GOHR2UHpQcHVjck1RYkRZR0dRSldWaURtSjZpR3NkU2F1?=
 =?utf-8?B?bnd3MURmRWNpbHF0dHZWRWNHVFNUaDlQZVRLbEtaMzJ6N2o4cGlVRGJpamtK?=
 =?utf-8?B?UnpsbmtXdHEvVmpmV0JPa2hxcXI1eXBoeHN6NnljQlZhNjVScDdMZlRRRWlZ?=
 =?utf-8?B?K3pqQnpPcTVUUWcxbWZCajBvU3Nkd1h1N0xTd0RuSWR3NU9sUDZhWlFnV1ly?=
 =?utf-8?B?RU9IYjlIUlNjU2tPcVNEYzBKNHk5clFZc0ZYOVB6eXVTZjZuaDVLU1YrQWNT?=
 =?utf-8?B?dkZtb0RNQXRBdHdNd0hlWm5QT09xdnYrRmgzS29vK1ovOXBjVDVZVS9MVHFj?=
 =?utf-8?B?YmwvK2xkQ1FxSmxJd2xHU2xmWjV5TTVZK2hxUkdHMVJqVWxsKzJFbE05V2xi?=
 =?utf-8?B?aDRtdlJuOHkwbjNabDlsYUtoQ2UwMERsdE9FZnZLdjdlQUFxSUk4NTQwbi9Z?=
 =?utf-8?B?UWZ4R2g2OVpMOWpuZS9FR2YzOGFYZjVwdHZVYkIwT3k4enlIYlV4d0xlcFNB?=
 =?utf-8?B?dXFnbzRqN3VDc3FFNHFDU3V1SmhPZjk1eEVFTmtrUi9URm50YS96ZlZhcGE4?=
 =?utf-8?B?ai9qVlFmMFMwWi9XQ3A4OXkwQ09Jc2V2c3ovRXNxM0g1cy9NbWJLNW9yaFl4?=
 =?utf-8?B?TVdIUm9XdDdHN0l4aE9nTmxVR0Yza2ZCWmVMVnBWN3drTDk5UzZza09HQi9U?=
 =?utf-8?B?Q2xKM1dOcmptaVNTc0JCTm1kbkNVT0UwQmhNYnhPbEw1bzdzMExnTFAzbFU1?=
 =?utf-8?B?ZU95N28zb2VGZTdCaTkrZkt4Rkw4anJwdEx5QUpVcjNYejhMRDJ6ZS9vWVZs?=
 =?utf-8?B?eGd2TFZNOXhOcTNQcGJTdEdkdnVaMi84cmtWSHZKVjl3akk2ZTJuVnB5b21s?=
 =?utf-8?B?M2s1cEM4djVWUlJTM1JWM2UwN1pmTDFRS2hGSFgxazdYT3lRYmRRZ3FJdUIw?=
 =?utf-8?B?ZWRwOWYzQndwNTczdlRiM29JaHVtcTYxS1pLejU0WnFaSlIzNVBUakZYQnlY?=
 =?utf-8?B?SHA0N0hIc3NnWFF3eVZEeGhvZEM5TVNQRnhxZmNNRkt2U0V0Qkd2bzZBaVdL?=
 =?utf-8?B?dllzY01wb25GejdIMVhzZE4vVUtOOC9ZSEd1LzlqSWdpNzNNMHdXS2R1S2p2?=
 =?utf-8?B?UnlYSWxZaDVIU0VJTndKT2FRV204NHBpMFpKNG01SHV5RUxLY2ZleFFycFh2?=
 =?utf-8?B?N0dyYkQyMmNEOXFCaXVwUUtPUWxYSkVwZnNsMkVMN0pPck5aaHBiZzVKR0Yz?=
 =?utf-8?B?c3Fia1VJMk9iaGtIcnVpSE1sc3hxUFJ4Vk5rSE5vcWNmU1d4WDFkL1UxRkcz?=
 =?utf-8?B?Y2ZWdHNQMmU2WkZtOVp4SUVieFRmbXpxU1FxOGtnN1JtUWF6Unl4OUt6RExw?=
 =?utf-8?B?czZ2NUYyR3hOSlIrT1V5V3kzMWxZRm5RaWNQYjhPS29uL3NZSXhIMVVpczlK?=
 =?utf-8?B?bFNKS2VrZ2gvcVEzRU8xM2k4NFdBdWt0Umxuc0t3WFhXdGJIK090dTZob1RQ?=
 =?utf-8?B?YXlyTGplVnVtZ3BZaXFJS2V0akFGNmNIU0tYZS90TlRxejNTWUlaRTFoVEVL?=
 =?utf-8?B?S0E9PQ==?=
Content-ID: <E7D7645E08AA3341A97D4077E9BE7088@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d347858-65a8-480c-0fb7-08dd4abf375f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 17:12:08.4100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fuBb59adogTDAMNu9RKjlQQmJtQ2aUzdBH+Egm2Y0vrx3iw1ZsReYpG+AeQ5jYc4orMym94H8/B+uKOB3kXMLd6aFrogo6WgQA/P9hrvm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAESQ5KD3CPoy7JpPNUSlIDMqVVZdiGMVsSEj73g26M=;
 b=G1Nbfd1jm2j8QUTGMwbAj6207FK3wc0UhJeAnMjwaGWt5hbvoNf+zZAS283Ib6ff8pKsRD4qXjC8Nnq7glaDakhiTzCdJ0TY4nyCBrsOjl2jsuQZ5GKwrS39fvLcWOv1KwjrRcYPEE1YzY5lDADqsF0H4PowH1LGZC0cBZbvjxKFPuNZ9kLCBugGm0UIVBRI6qTtrZ0nlv28d2Au4zqA0ARHUUO343gaZ4RnPZb1Lk5OxRlB7rpKnnYKqsIqN/R8TE8mgr45J48kv7kqgCKAXtpWmOJSb/ymyHEOE/lrPwhtjBdUt3UOtl+5sZuzomTbpx9eNwTIGp2XHEyoDfxP7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=G1Nbfd1j
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v2 3/3] board/beagleboard/beaglev_fire:
 cleanup gatewate update
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLA0KDQpPbiBUdWUsIDIwMjUtMDItMTEgYXQgMTc6NDggKzAxMDAsIFJvbWFpbiBO
YW91ciB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0K
PiBIZWxsbyBKYW1pZSwNCj4gDQo+IExlIDIxLzAxLzIwMjUgw6AgMTA6MDUsIEphbWllIEdpYmJv
bnMgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdCA6DQo+ID4gVXBkYXRlIHRoZSBSRUFETUUgZm9sbG93
aW5nIHRoZSB1cGRhdGUgZ2F0ZXdhcmUgZml4IGFuZCBvcHRpbWlzZQ0KPiA+IHRoZQ0KPiA+IHNj
cmlwdCwgbWFraW5nIGl0IGVhc2llciBmb3IgdGhlIHVzZXIgdG8gdXNlLg0KPiA+IA0KPiA+IFJl
dmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEphbWllIEdpYmJvbnMgPGphbWllLmdpYmJvbnNAbWljcm9jaGlwLmNv
bT4NCj4gPiAtLS0NCj4gPiDCoGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9SRUFETUUu
dHh0wqDCoMKgwqAgfCAxMyArKystLS0tLS0tDQo+ID4gwqAuLi4vdXNyL3NoYXJlL21pY3JvY2hp
cC91cGRhdGUtZ2F0ZXdhcmUuc2jCoMKgwqAgfCAyNCArKysrKysrKysrKystLS0NCj4gPiAtLS0t
DQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygt
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUv
UkVBRE1FLnR4dA0KPiA+IGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL1JFQURNRS50
eHQNCj4gPiBpbmRleCBjOWE4MjRiNjdmLi42NDg0Y2NhOGUxIDEwMDY0NA0KPiA+IC0tLSBhL2Jv
YXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9SRUFETUUudHh0DQo+ID4gKysrIGIvYm9hcmQv
YmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJlL1JFQURNRS50eHQNCj4gPiBAQCAtMTEzLDcgKzExMyw3
IEBADQo+ID4gaHR0cHM6Ly9kb2NzLmJlYWdsZWJvYXJkLm9yZy9sYXRlc3QvYm9hcmRzL2JlYWds
ZXYvZmlyZS9kZW1vcy1hbmQtdHV0b3JpYWxzL2dhdGUNCj4gPiDCoMKgIE9uIHlvdXIgTGludXgg
aG9zdCBkZXZlbG9wbWVudCBjb21wdXRlciwgY29weSB0aGUgYml0c3RyZWFtIHRvDQo+ID4gQmVh
Z2xlVi1GaXJlDQo+ID4gwqDCoCBib2FyZCwgcmVwbGFjaW5nIDwvcGF0aC90by95b3VyLz4gd2l0
aCB0aGUgcGF0aCB0byB5b3VyIEJlYWdsZVYtDQo+ID4gRmlyZSByb290IGZpbGUNCj4gPiDCoMKg
IHN5c3RlbS4NCj4gPiAtwqDCoMKgICdjcCAtciAuL0xpbnV4UHJvZ3JhbW1pbmcNCj4gPiAvcGF0
aC90by95b3VyL2J1aWxkcm9vdC9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2ZpcmUvcm9vdGZz
LQ0KPiA+IG92ZXJsYXkvZXRjLycNCj4gPiArwqDCoMKgICdjcCAtciAuL0xpbnV4UHJvZ3JhbW1p
bmcNCj4gPiAvcGF0aC90by95b3VyL2J1aWxkcm9vdC9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2
X2ZpcmUvcm9vdGZzLQ0KPiA+IG92ZXJsYXkvbGliL2Zpcm13YXJlLycNCj4gDQo+IEhlcmUsIHRo
ZSBMaW51eFByb2dyYW1taW5nIGRpcmVjdG9yeSBpcyBjb3BpZWQgdG8gcm9vdGZzLQ0KPiBvdmVy
bGF5L2xpYi9maXJtd2FyZS8NCj4gDQo+ID4gDQo+ID4gwqDCoCBUbyBhcHBseSB0aGVzZSBjaGFu
Z2VzIHRvIHlvdXIgaW1hZ2UsIG1ha2Ugc3VyZSB0byByZS1idWlsZCBpdA0KPiA+IHdpdGg6DQo+
ID4gwqDCoMKgwqAgYG1ha2VgDQo+ID4gQEAgLTEyMSwxNCArMTIxLDcgQEANCj4gPiBodHRwczov
L2RvY3MuYmVhZ2xlYm9hcmQub3JnL2xhdGVzdC9ib2FyZHMvYmVhZ2xldi9maXJlL2RlbW9zLWFu
ZC10dXRvcmlhbHMvZ2F0ZQ0KPiA+IMKgwqAgVGhlbiwgcmUtZmxhc2ggeW91ciBpbWFnZSAtIHRv
IGVuc3VyZSB5b3UgaGF2ZSB0aGUgbmVjZXNzYXJ5DQo+ID4gZmlybXdhcmUgZmlsZXMgLSBieQ0K
PiA+IMKgwqAgZm9sbG93aW5nIHRoZSBhYm92ZSBzZWN0aW9uICJGbGFzaGluZyB0aGUgaW1hZ2Ug
dG8geW91ciBlTU1DIi4NCj4gPiANCj4gPiAtwqAgT24gQmVhZ2xlVi1GaXJlLA0KPiA+IC3CoMKg
wqAgMS4gTWFrZSB5b3VyIHVwZGF0ZSBnYXRld2FyZSBzY3JpcHQgZXhlY3V0YWJsZQ0KPiA+IC3C
oMKgwqDCoMKgICdjaG1vZCAreCAvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUu
c2gnDQo+ID4gLcKgwqDCoCAyLiBDcmVhdGUgYSBmaXJtd2FyZSBkaXJlY3RvcnkNCj4gPiAtwqDC
oMKgwqDCoCAnbWtkaXIgL2xpYi9maXJtd2FyZScNCj4gPiAtwqDCoMKgIDMuIENoYW5nZSB0byB0
aGUgZGlyZWN0b3J5IG9mIHlvdXIgZ2F0ZXdhcmUgc2NyaXB0DQo+ID4gLcKgwqDCoMKgwqAgYGNk
IC91c3Ivc2hhcmUvbWljcm9jaGlwL2ANCj4gPiAtwqDCoMKgIDMuIGluaXRpYXRlIHRoZSByZXBy
b2dyYW1taW5nIG9mIHRoZSBGUEdBIHdpdGggeW91ciBnYXRld2FyZQ0KPiA+IGJpdHN0cmVhbToN
Cj4gPiAtwqDCoMKgwqDCoCAnLi91cGRhdGUtZ2F0ZXdhcmUuc2ggL2V0Yy9MaW51eFByb2dyYW1t
aW5nLycNCj4gPiArwqAgT24gQmVhZ2xlVi1GaXJlIGluaXRpYXRlIHRoZSByZXByb2dyYW1taW5n
IG9mIHRoZSBGUEdBIHdpdGggeW91cg0KPiA+IGdhdGV3YXJlIGJpdHN0cmVhbToNCj4gPiArwqDC
oMKgIGAvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdhcmUuc2hgDQo+IA0KPiBJdCBz
ZWVtcyB5b3UgaGF2ZSBzdGlsbCB0byBwcm92aWRlIHRoZSBHYXRld2FyZSBsb2NhdGlvbiBwYXRo
Og0KPiANCj4gwqAgL3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNoDQo+IC9s
aWIvZmlybXdhcmUvTGludXhQcm9ncmFtbWluZw0KPiANCj4gPiANCj4gPiDCoMKgIFdhaXQgZm9y
IGEgY291cGxlIG9mIG1pbnV0ZXMgZm9yIHRoZSBCZWFnbGVWLUZpcmUgdG8gcmVwcm9ncmFtDQo+
ID4gaXRzZWxmLg0KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9iZWFnbGVib2FyZC9iZWFnbGV2X2Zp
cmUvcm9vdGZzLQ0KPiA+IG92ZXJsYXkvdXNyL3NoYXJlL21pY3JvY2hpcC91cGRhdGUtZ2F0ZXdh
cmUuc2gNCj4gPiBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZS9yb290ZnMtDQo+ID4g
b3ZlcmxheS91c3Ivc2hhcmUvbWljcm9jaGlwL3VwZGF0ZS1nYXRld2FyZS5zaA0KPiA+IGluZGV4
IDI0OWM1YmQyNjAuLjdlMDVkNGI3ZWIgMTAwNzU1DQo+ID4gLS0tIGEvYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xldl9maXJlL3Jvb3Rmcy0NCj4gPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAv
dXBkYXRlLWdhdGV3YXJlLnNoDQo+ID4gKysrIGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9m
aXJlL3Jvb3Rmcy0NCj4gPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3
YXJlLnNoDQo+ID4gQEAgLTEsMTcgKzEsMjUgQEANCj4gPiDCoCMhL2Jpbi9zaA0KPiA+IA0KPiA+
IC1pZiBbICEgLWUgIiQxIi9tcGZzX2JpdHN0cmVhbS5zcGkgXTsgdGhlbg0KPiA+ICtpZiBbICQj
IC1lcSAwIF07IHRoZW4NCj4gPiArwqDCoMKgIGVjaG8gIk5vIGdhdGV3YXJlIGxvY2F0aW9uIHBy
b3ZpZGVkLiBDaGVja2luZyBkZWZhdWx0DQo+ID4gbG9jYXRpb24uIg0KPiANCj4gT3RoZXJ3aXNl
IHRoZSBuZXcgZ2F0ZXdhcmUgZmlsZSBpcyBsb2NhdGVkIHRvDQo+IMKgIC9saWIvZmlybXdhcmUv
TGludXhQcm9ncmFtbWluZy9tcGZzX2JpdHN0cmVhbS5zcGkNCj4gDQo+IEFuZCB0aGlzIHNjcmlw
dCBvbmx5IGNoZWNrIGlmIHRoZXJlIGlzIGFuIGV4aXN0aW5nIGdhcmV3YXJlIGZpbGU6DQo+IA0K
PiA+ICvCoMKgwqAgaWYgWyAhIC1lIC9saWIvZmlybXdhcmUvbXBmc19iaXRzdHJlYW0uc3BpIF07
IHRoZW4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gIk5vIGdhdGV3YXJlIGZpbGUgZm91bmQu
Ig0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgZXhpdCAxDQo+ID4gK8KgwqDCoCBmaQ0KPiANCj4gQ2Fu
IHlvdSBkb3VibGUgY2hlY2sgdGhpcyBwYXJ0Pw0KQWggeWVzLCBpdCBzZWVtcyB0aGUgUkVBRE1F
IGluc3RydWN0aW9ucyBuZWVkIGEgZnVydGhlciB1cGRhdGUgdG8gZml4DQp0aGUgcGF0aHMuIFRo
YW5rcyBmb3Igbm90aWNpbmcsIEkgd2lsbCB1cGRhdGUgaW4gdjMhDQoNClRoYW5rcywNCkphbWll
Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBSb21haW4NCj4gDQo+IA0KPiA+ICtlbHNlDQo+ID4g
K8KgwqDCoCBlY2hvICJHYXRld2FyZSBsb2NhdGlvbiBwcm92aWRlZDogJDEiDQo+ID4gK8KgwqDC
oCBpZiBbICEgLWUgIiQxIi9tcGZzX2JpdHN0cmVhbS5zcGkgXTsgdGhlbg0KPiA+ICvCoMKgwqDC
oMKgwqDCoCBlY2hvICJObyBnYXRld2FyZSBmaWxlIGZvdW5kLiINCj4gPiArwqDCoMKgwqDCoMKg
wqAgZXhpdCAxDQo+ID4gK8KgwqDCoCBlbHNlDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIFsgISAt
ZCAvbGliL2Zpcm13YXJlIF07IHRoZW4NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBta2Rp
ciAvbGliL2Zpcm13YXJlDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGZpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgIGNwICIkMSIvbXBmc19kdGJvLnNwaSAvbGliL2Zpcm13YXJlL21wZnNfZHRiby5zcGkNCj4g
PiArwqDCoMKgwqDCoMKgwqAgY3AgIiQxIi9tcGZzX2JpdHN0cmVhbS5zcGkNCj4gPiAvbGliL2Zp
cm13YXJlL21wZnNfYml0c3RyZWFtLnNwaQ0KPiA+ICvCoMKgwqAgZmkNCj4gPiDCoGZpDQo+ID4g
DQo+ID4gLWlmIFsgISAtZCAvbGliL2Zpcm13YXJlIF0NCj4gPiAtdGhlbg0KPiA+IC3CoMKgwqAg
bWtkaXIgL2xpYi9maXJtd2FyZQ0KPiA+IC1maQ0KPiA+IC0NCj4gPiAtY3AgIiQxIi9tcGZzX2R0
Ym8uc3BpIC9saWIvZmlybXdhcmUvbXBmc19kdGJvLnNwaQ0KPiA+IC1jcCAiJDEiL21wZnNfYml0
c3RyZWFtLnNwaSAvbGliL2Zpcm13YXJlL21wZnNfYml0c3RyZWFtLnNwaQ0KPiA+IA0KPiA+IMKg
IyBUcmFzaCBleGlzdGluZyBkZXZpY2UgdHJlZSBvdmVybGF5IGluIGNhc2UgdGhlIHJlc3Qgb2Yg
dGhlDQo+ID4gcHJvY2VzcyBmYWlsczoNCj4gPiDCoGZsYXNoX2VyYXNlIC9kZXYvbXRkMCAwIDE2
DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
