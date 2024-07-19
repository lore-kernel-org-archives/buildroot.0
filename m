Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA5C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A748C60663;
	Fri, 19 Jul 2024 07:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYA67FDshEjk; Fri, 19 Jul 2024 07:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C68260E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C68260E85;
	Fri, 19 Jul 2024 07:11:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 949071BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8192B40413
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dVt7pg7G6dH for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:11:55 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Jul 2024 07:11:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 012FA4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012FA4022B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=923d17285=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012FA4022B
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:11:54 +0000 (UTC)
X-CSE-ConnectionGUID: +D1iJX9UQmq7uasdAZMS9A==
X-CSE-MsgGUID: hW77GKLXQcKEEA28NHZ4XQ==
X-IronPort-AV: E=Sophos;i="6.09,220,1716220800"; d="scan'208";a="22850427"
Received: from mail-westusazlp17012032.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([40.93.1.32])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2024 15:04:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N290ytUO4VHRrs/EiIm4DxLyw0/1niZvuQePkPzvpBP+4tTyH2r26KMSifOMKPGwjqLeauL67GlnhEr7HE0fPBDER4yRlW3+0x5xy+25xH8yfJph2NyBMTk5Pzz/vKuH5W3gsrGX3Vy1dwv019bwuD/Q+/3rXZAv8ftA9bxd3Ar9U/gvH5nJHY9SAkXowRTxo417CYo72mHMNJeEnZ7UfA6W11lag2xVXHVgCBPssEf83pTHOA8EmEii7hRCs9z3zv3iF+YutpbSsGCNDxewlzPdWnqTWP3HzZpqfa44eeo0BOYAvwm+SNAWPbMGl7o9sUwRuURhtOCbKcgyUUb7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hMaB3pgKLWeKw48+/sY01snBR7H0TMknzaoczAc+zw=;
 b=nwkeBEJVPHSeFk589KVpRTkeL90S7LDz6RMeHdgKQ7jIvlQsQJJ6eLkWskPu23IURY2rA36h3GqPFAZnqVRYL7t+aWv4W1IZFxGJO0YL2IoepbsMnJwuJSOmmArR4frbyeSPpbxarM2bQh4RdPKJQtJQ5bKfdOuRx4s1kAqXP6PjbAIuGrD61g13hygbkGCtTjEEHNFWNN23m2tbKoZVLSZZG65H+vG7O5PzEaThp4fs/vIdBKxP5mQO4HENtIhn0V0PakNZJYB4NU0GUwzAtO6kAEnLQu0qLXxxzw4PZeY2N+3gjw4UQPoSk3sfscuwFOXu2tbFxrI5ZZARK94cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by PH0PR04MB7319.namprd04.prod.outlook.com (2603:10b6:510:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 07:04:45 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 07:04:44 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
Thread-Index: AQHahLFKJA9MVUO4kEyJU6Zmju/7DrH0QtiAgAoHn4A=
Date: Fri, 19 Jul 2024 07:04:44 +0000
Message-ID: <84d8e2b1a0be113655ef7b8fff876a141128b42c.camel@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
 <20240712235449.766c2931@windsurf>
In-Reply-To: <20240712235449.766c2931@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|PH0PR04MB7319:EE_
x-ms-office365-filtering-correlation-id: 0d2b913c-a60f-4cb7-a47d-08dca7c11189
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?VlF6Z0hNd3hVWDd3ZFhjeWxtMVVwVHM4WWdnQThBQXZmSDJHQWxMa2xLd1F1?=
 =?utf-8?B?Q2I1Q05sODArUlo2QVBzeE5VS0F6Q3diUWJnM2c2dG5xN0xZSko4cHFCd0pY?=
 =?utf-8?B?WkY0L3hhZVRRZjJiQXFYRnRXYnZhVlhtNnQxR0lDbGxmVkZPZWpianQ3b0tC?=
 =?utf-8?B?Q0RlNllvTVZEcXBXMGovYitVL0d1RUd0Y1ByRExlR0R6RDBSOUFCVGlFcDdj?=
 =?utf-8?B?YXF6YW9IUGtUV3BNQUVpSjU1Wk55YVErNlJtbTBTeGZxYTZRWEZ5NWU0NzF5?=
 =?utf-8?B?QWFTQW5HNm9WKzJtRDFHTjVMNHNXN3llSUxPZ2I2S3lVbHZMV0k5MEk1Z3Zi?=
 =?utf-8?B?OWVVUEplc3d3WmRPTXNiNDhjMUkxTHQ3bzFHZkdDaVAwa1pjZllBK3pNRW03?=
 =?utf-8?B?ZXdSbmRxVmxzQysweC9xbCs5OGpOMHFndSszdEtSdkdyYjhBN2tWbGRSVGhG?=
 =?utf-8?B?WmlxYWs4VGRHMHR5ZjZPZHJGS1hPRjZva0RsNTl0eElxZkhHLzdhZFVYSWNW?=
 =?utf-8?B?YWlDbGFqckpiOGYzSzhOaFBIR1h2cllTOWdOWURWTThoK051TmhPMW0wS2Ur?=
 =?utf-8?B?Q1ZoOVRtYW1nQ1NTcFRMbmNkcnJjcm5TOUVqTHhBZ0NXWkx1aDJOVkhGcHR4?=
 =?utf-8?B?MDZrQnVlS2ljUUZBUjEvZllUT0lYTHQ3Sjk0R2kvM3VaT09xTDZicmZsckM5?=
 =?utf-8?B?cllHaTh5aVE5alQydmJtSEZjMUF6ZzJhT29iRUZnSml0ZGQxa29veUJaOC90?=
 =?utf-8?B?V2JCY3lITzJyLzRHOFMxUE1hcnZseW1tcXdaeUpqLzhSQ0NZMEVCWTVZYUhX?=
 =?utf-8?B?Q3JLd0ljMkVBWGxKUkVqUGhqaDVsMk45NU5VYTlpWTlNNHFqcVJDNXZZQ1Rt?=
 =?utf-8?B?SFdyUWFvZVZCWFUyYnVNcnlHRFNyM0VPS0F3UGlQb3VhSWNtU1kwNXlpZGdi?=
 =?utf-8?B?UEJ4WHZmdlA2cjYrR2NiMVZYbGEwcDdnK1JaZHR5Q2hGWmxLWHFYb3NtaFQv?=
 =?utf-8?B?N2RuMHBzYk1zUUZWTlV2QXFBclEwZFQxdEcrM3NsQ3ZjbmRLL090SEVRdWFo?=
 =?utf-8?B?V01kYnpZRnc1V1FXalQzUGsxeVY0QjdocXNuR0wxUzk1UGtiNlZISGJSTmZ4?=
 =?utf-8?B?MmtJTWphRlJCUEZDc2s4V2RlUkxrNzcyQkNHQzFzcVRUTFd0SlF1TkJlU0F4?=
 =?utf-8?B?SGRycGJCYUwzTjZlWmlnbEpIWm0xeDNPUzZVeXNkV2FaazdtblpubWthZ2ZO?=
 =?utf-8?B?RkJ2QW40TjZJaGd0SWF2MHJxdUM5ZzZ0cWFMQ0ovbEJhVFN6bFltMkJuMjBx?=
 =?utf-8?B?MXdhdmltWVZrbkJQSVp5L041VmVURVZBamR5amZRYzNpY1dzaXJmTXdKdEtx?=
 =?utf-8?B?VU9wOVNpSHhHaUtoNEZlZ2xyVU5sVkJZeTR4cEZGMURFUVBZMytmQzFhRExY?=
 =?utf-8?B?b0pXTXNIYW1zU01uVVM2R3gzQzN2dzNsU2NNSndoUTdWaktmSU92N1RIMkk1?=
 =?utf-8?B?Yk5rakNMWk4vZjFBcHdKVlBwOFUraWlkRHJCZHZGZ2RMK1JEZ2Uwb2xIZUlD?=
 =?utf-8?B?QU0yUW45aksyQlRGd25ua09pY2NURWJ2VDlQUE5Yc1Bxbk13ckY1cFNteWxZ?=
 =?utf-8?B?RTlPemUyOGFncSs3NG9LTlZhVEZnN2NCOUdweW9VM0dOWWhiSnBKY1VxMEdy?=
 =?utf-8?B?ODZqU2pSUUplR20zQklTSUQvQXp3ck5LZVNaSEhWY25wU29PTlJzKzlYeDRV?=
 =?utf-8?B?c092NU9uZ0NGc3JnOHErazUxSTg3VzF2RFdmRWxMZWw2d1JZL1o2TGNRZ2lF?=
 =?utf-8?B?UmZFS2xaZ0dVWW90MWRBK3VPZk1GbWt0UGEwaGZTRXErMEMwdklEMHZGNE02?=
 =?utf-8?Q?84KuNDXXp64iB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjUzb081T0kwL08wS2xsVWRzN3paQllOM0lqMUFuYWpzSUx0MlJHcy9tbVA1?=
 =?utf-8?B?R0ZMM3dEZXVqdmhVTUZjNGk4Yk1yaXl3bGhhRDRFek44OUxhazVwb2YzRUVV?=
 =?utf-8?B?TFRRbTNjaGt5SHRPUTc4L3pkVUhQT3B4UXliRmhuM3hUaUNZODdUYnQvdVdN?=
 =?utf-8?B?RXQyTXRXR3FlOC9wbkFTSG1Ic09wZTZ3eks4VEZRbmNpZHoydDNCVCsvRVk1?=
 =?utf-8?B?WG1TeG9WWklCMGkzRi8wV0FBWGlzNTREdjB1NEV4bWl1ZllvWHZKYzQ2ak1M?=
 =?utf-8?B?a1dBRlpPd2htVm9PVTBoTXBJWG5RaytSVklHZDFqaGNuRTBUVU1oSTA0b0xO?=
 =?utf-8?B?bGZnMEZjQ0ZsSnVJYVo0d2d6dHNkcHZMTkMvWDdFcGUrUzRJRnVORXBpd0h0?=
 =?utf-8?B?a3IyN29xZjViNnZCRUxoTmpKMWhUY09QMkNsOXBwWEFTbmkvV2hlRncySW5M?=
 =?utf-8?B?dzBDa3NveVJoRk5Kd0VUdE0vZTdkTVlueDhkWkFUNFB0d1N0Z1I5ME1aM2Zi?=
 =?utf-8?B?d1YzWU5oaDUzdzF5NkZsL3BIUzJwQ1p1bnhiNGIrUVk5UFh4K2Y4dXFRODNN?=
 =?utf-8?B?YkRrdVFmeGdIRDhIcXoraFZTUURrell2UVR0bW9tQnYyeVhMVjhvVEFSeUgw?=
 =?utf-8?B?bkRBckMxME12ajZudG9ZSHdYUkg4eE9ndlJmTGpXMDBYVXlOQXNXNmxiVVJV?=
 =?utf-8?B?ZW1FYmlIMVJTODl6NTM3cDFoa21tUjZ3SndiblVnUlc2TFhaMkRhb3d1ayt1?=
 =?utf-8?B?VU1PNTU3dFpuQUdQTG5OUE4xY2ZDejdBZVk3M0h0U3FTeHg4Rm9zWGVjbGFj?=
 =?utf-8?B?TGZGcHo0b05QeWdNRjJ4ZS80TnBJSGZ6RFo2QkNlek9xMmlsNUFJSURLMC9k?=
 =?utf-8?B?TGRlQVpQTWNGcTh1RElCSDEwQmE5Q3BJTEYyeG51M1VTbmR0MXpzWDlBR3RO?=
 =?utf-8?B?d1BVSk1Od1c4bjhkZ0JJdlNoOEtZdkIzMDgrMHdGVC9JY0Z4VkFyTWIySlNv?=
 =?utf-8?B?U3orcWdhdndVeFU4dm5PcVlLeHFrbTQxOFYwcTJxSFdEQjl6amlOR2I4Vkpl?=
 =?utf-8?B?Tm43VnZsZW1FZWFIVzJSMjlJMENOdFB3ZHdxTFM0a3V2QWlLbWlhMExqeXpB?=
 =?utf-8?B?dFJnME9wRDB3OVhLZzlGbkpvc2JvS1FrWnRzM2RDUjc2bFkrbXhmLzkvbGxi?=
 =?utf-8?B?OWttUU5LYWZ5N0hhZkpLMkMyU3N2Nys1V3F5d3FNbm41MWl6aEN2NFpnaDNN?=
 =?utf-8?B?VUtZUmRvZnZVT1VodXlKYWlzSHJYVy9XcThrSVRNQ25BV3NvWHJGV3NLRlNv?=
 =?utf-8?B?bmZYK1Y4QThMOUFSU2MzTmRhbjJjNE4yMndZRlRmNDRiZ1VSdndvRyt1Rzdw?=
 =?utf-8?B?Qk5uUk1KbVlDZVNQZ1plUjdHWEVjalArRi82OTVmYkVQdnZQanpHbEZMNjcr?=
 =?utf-8?B?R2ptU1lHZzJZOVRXZ2JkYUhZTnA1NTY1VTV4WXVmTXZzc2ljLzBzMTg0RGtk?=
 =?utf-8?B?cEF3N2dlSlUzbzFqKy9rdDVMK0hPa2dXTS9HeXY2RXRpc25UUWpURnZLdlR4?=
 =?utf-8?B?OFQ3UjlLdjlzTjU0Z3pWQjUvUWRHRzl0b05GS0VYKzV3a1NmNHBpQUd6UHpQ?=
 =?utf-8?B?d1NoUTd2aHdJNXJPMDdhY2JHTjkzYVFNdkgrUmhQMnpsRkNRMUlOcjNEM3hj?=
 =?utf-8?B?S2paWjhtRTBORyszZGRmZm9SZVpkUzJneERXOURNNWx5RzlkVFU4eFJLSWo1?=
 =?utf-8?B?TGRWcW9TcFRNOHkwSHYzcVBLL1RVYllocDZYTG1IZDhIbXdBNFRqU05ETFBu?=
 =?utf-8?B?NmIvVHJaVmF2YlBKOG02NW54cW5sVlRveThpVHVWK01JQ0NqcjRGczJOekti?=
 =?utf-8?B?WkwyME42RHl0S3QxY3NSWXI3TytHUEVvVU5yMVBZNjNiNEJNWlAwelpoVkkw?=
 =?utf-8?B?N2dTOUpiWHZLYm5JajcyYzNIOUlPcUNvVzBWSWpFS1V5dVoxVmpzNm9BV2dN?=
 =?utf-8?B?d1o5dzVDKzlEQ01Fb3N1VVNMRjMxRzZTYm40YXduMCtGSnNvRnF5UnVPZWwv?=
 =?utf-8?B?YjRFd0N5NDNON1RYQ3RjeHB6SjlRcTluOTJRUmFlcTJXT0Uwc1Ywa3h4QXk3?=
 =?utf-8?B?WmpSNXlWM2V0c0l1MFVUTkVoRERCZk1RZ29JU0JWdlJRS3JMaS83aXpiUGk5?=
 =?utf-8?B?L3c9PQ==?=
Content-ID: <AD181D5D93047F4F817EA0F3FD55AB12@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MMSKxOZblxBwZEr4/xbq2+PXrnksCJ2z+BJbJ3ptbvrCn2DIXO+EUhXf488+fg7yUrBkUDQFBfA6Wj2MH3g8PKb+zoJAcSKkfpx8RgT/Ku2lwm8yAsjlXwRnf6CWNn48E2cvCLNLt3ZTm7R1gPzV6gv1YWSNQctMi2tPfV8FEXdym6s09jFRfRrh4HSi+B1sr9g/YYVkz1Tpq8957+3Nc9Fec7RA7fxDoxSkdhXWeWpvZbd4dNYDKjRLicghQWcMTXTFblfkiDNlVoNuYlYiGB01VH6PZf/MeovVmMDFrXY54HdiWtSgj57BW+GV8iq18j6ICfBT6/MQ0iRsR9NH7ZxVvyvPf2pYSZdE2oUSP+kWMC3/CUzWsagfC89S81mfcyhSTT8ov9FNrRB89qEKFDbHG6DOXi8NxJaG6aSMX5XYwHcswzsi1V1dw23Oev7A8G0j5hKf2WC1nXYJuKbwLCUp3T9V9NEnfcoggebyJPQA6tKD+yMw5S8s54Z97odResIz0xM95a7bAJIC8yx8yYgGklks0DWSHa7nnzcYGJmsAKaC6kmZUJcday0rVGHr84u0PZHTgbdrwFYCM/2M9A9rtZC5hZ+PS3v/agrNwych38Vlf4rAaf/wa2Jplua2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2b913c-a60f-4cb7-a47d-08dca7c11189
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 07:04:44.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1s7RaxT4pgg92mTUjILj7gPdIA81mHTOYjRZQMQTYpalxVxS4aplYIdrvt8gpBhLucyRlcOaNBV2iMYqXWZn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7319
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1721373114; x=1752909114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=8hMaB3pgKLWeKw48+/sY01snBR7H0TMknzaoczAc+zw=;
 b=RIFFvbG2hgqLcAtb7PDdcIxKc8E0L11Wyr8fslTJgIBTOBBrg28Cn9MZ
 M2MWFRJi0pZqkMw4/b1oKJDMCLLkxIyJhCtwSUl3GiDEnLgy4KTp4DB/g
 POoc2dQ69TtnLoUctiAx0Hevn0xB4lrh5FtJK+qjPyV0l9P+T7lKHo6cu
 fqaHWn0zdriQIYDVHFe3RHV+2n0S63WAV/dGKU+VwR7zQULfI00z+GSqE
 g+0/ee9S9ktyuY2tJOmiv7AhWkZF+6ORCvvJAPnGyyS1B8evvitMyuS23
 lM+kKhHLRTE4jSSOYN772iK86E/6nSvw8UzXUCCY6GW/0fm7X1CW2Maqw
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hMaB3pgKLWeKw48+/sY01snBR7H0TMknzaoczAc+zw=;
 b=q58hdQPUWU/7zcOKSqo/MG3QcB6SvpM1ZvM9CNkHLhNh/y4Qc29gAQAlEdNG8wXwy/YWDmUNrbKjJLNPd7/zKmULPyVR51DJNzU5q25MJfbzdc/telDRMiZIvcAOiOqEamsX7OUw7r1VJYDgYpAT9BFj7vnJzhyNOFDixu/dSQU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=RIFFvbG2; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=q58hdQPU
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMDI0LTA3LTEyIGF0IDIzOjU0ICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QNCndyb3RlOg0KPiBIZWxsbyBXaWxmcmVkLA0KPiANCj4gSSB3YW50ZWQgdG8gbWVy
Z2UgdGhpcyBwYWNrYWdlLCBidXQgZ290IHNvbWUgYnVpbGQgaXNzdWVzLiBTZWUgYmVsb3cuDQo+
IA0KPiBPbiBUdWUswqAgMiBBcHIgMjAyNCAxMzo1MTo0MSArMTAwMA0KPiBXaWxmcmVkIE1hbGxh
d2EgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FA
d2RjLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIFYyOsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgDQo+ID4gwqDCoMKgwqDCoMKgwqAgLSBBZGRlZCByZXF1
aXJlZCBweXRob24zIGRlcGVuZGVuY2llcw0KPiA+IMKgwqDCoMKgwqDCoMKgIC0gTm93IGRlcGVu
ZHMgb24gYHVkZXZgIGluc3RlYWQgb2Ygc2VsZWN0aW5nIGBldWRldmANCj4gPiDCoMKgwqDCoMKg
wqDCoCAtIE5vdyBkZXBlbmRzIG9uIGBsaWJzcGRtYA0KPiA+IMKgwqDCoMKgwqDCoMKgIC0gSG9v
ayBkZWZpbmUgbW92ZWQgYmVsb3cgdGhlIGhvb2ssIHN0eWxpc3RpY2FsbHkgc2ltaWxhcg0KPiA+
IHRvDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvdGhlciBwYWNrYWdlcw0KPiA+IMKgwqDC
oMKgwqDCoMKgIC0gUmVtb3ZlZCBjYXJnbyBwYWNrYWdlIHJlLXZlbmRvcmluZyBhcyB3ZSBhcmVu
J3QgcGF0Y2hpbmcNCj4gPiDCoMKgwqDCoMKgwqDCoCAtIENoYW5nZWQgY2VydGlmaWNhdGUvbWFu
aWZlc3QgaW5zdGFsbGF0aW9uIHBhdGggdG8gYmUNCj4gPiBzeXN0ZW0gd2lkZS4NCj4gPiANCj4g
PiDCoHBhY2thZ2UvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMSArDQo+ID4gwqBwYWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluwqDCoMKgwqDCoMKgIHwg
MjQgKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0
aWxzLmhhc2ggfMKgIDIgKysNCj4gPiDCoHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLm1r
wqDCoCB8IDM2DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqA0IGZp
bGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMuaGFzaA0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLm1rDQo+IA0KPiBJbiBvcmRlciB0byB2YWxp
ZGF0ZSB0aGUgZGVwZW5kZW5jaWVzLCBJIHdlbnQgYmFjayB0byBhIHNpbXBsZXINCj4gcGFja2Fn
ZSwgbGlrZSB0aGlzOg0KPiANCj4gY29uZmlnIEJSMl9QQUNLQUdFX1NQRE1fVVRJTFMNCj4gCWJv
b2wgInNwZG0tdXRpbHMiDQo+IAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFS
R0VUX0FSQ0hfU1VQUE9SVFMNCj4gCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX1VERVYNCj4g
CXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDDQo+IAloZWxwDQo+IAnCoCBTUERNLVV0aWxz
IGlzIGEgTGludXggYXBwbGljYXRpb24gZGVzaWduZWQgdG8gc3VwcG9ydCwNCj4gCcKgIHRlc3Qg
YW5kIGRldmVsb3AgU1BETSByZXF1ZXN0ZXJzIGFuZCByZXNwb25kZXJzLg0KPiAJwqAgU1BETS1V
dGlscyB1c2VzIGxpYnNwZG0gYXMgdGhlIGJhY2tlbmQgdG8gcGVyZm9ybSBTUERNDQo+IAnCoCBj
b21tdW5pY2F0aW9uLiBTUERNLVV0aWxzIGN1cnJlbnRseSBzdXBwb3J0cyB0aGUNCj4gCcKgIFBD
SWUgRGF0YSBPYmplY3QgRXhjaGFuZ2UgKERPRSkgQ2FwYWJpbGl0eS4NCj4gDQo+IAnCoCBodHRw
czovL2dpdGh1Yi5jb20vd2VzdGVybmRpZ2l0YWxjb3Jwb3JhdGlvbi9zcGRtLXV0aWxzDQo+IA0K
PiBjb21tZW50ICJzcGRtLXV0aWxzIG5lZWRzIHVkZXYgL2RldiBtYW5hZ2VtZW50Ig0KPiAJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTDQo+IMKg
wqDCoMKgwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0hBU19VREVWDQo+IA0KPiBhbmQg
aW4gdGhlIC5tayBmaWxlLCByZWR1Y2VkIHRoZSBERVBFTkRFTkNJRVMgdmFyaWFibGUgdG86DQo+
IA0KPiBTUERNX1VUSUxTX0RFUEVOREVOQ0lFUyA9IHVkZXYNCj4gDQo+IEFuZCB3aXRoIHRoaXMs
IEkgZ2V0Og0KPiANCj4gwqAgVW5hYmxlIHRvIGZpbmQgbGliY2xhbmc6ICJjb3VsZG4ndCBmaW5k
IGFueSB2YWxpZCBzaGFyZWQgbGlicmFyaWVzDQo+IG1hdGNoaW5nOiBbJ2xpYmNsYW5nLnNvJywg
J2xpYmNsYW5nLSouc28nLCAnbGliY2xhbmcuc28uKicsDQo+ICdsaWJjbGFuZy0qLnNvLionXSwg
c2V0IHRoZSBgTElCQ0xBTkdfUEFUSGAgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gYQ0KPiBwYXRo
IHdoZXJlIG9uZSBvZiB0aGVzZSBmaWxlcyBjYW4gYmUgZm91bmQgKGludmFsaWQ6IFtdKSINCj4g
DQo+IEhvd2V2ZXIsIG5vbmUgb2YgeW91ciBkZXBlbmRlbmNpZXMgd2hlcmUgcmVsYXRlZCB0byBs
aWJjbGFuZywgc28gSQ0KPiBiZWxpZXZlIHNvbWV0aGluZyBpcyBwcm9iYWJseSBtaXNzaW5nIGlu
IHRlcm1zIG9mIGRlcGVuZGVuY2llcyBpbg0KPiB5b3VyDQo+IHN1Ym1pc3Npb24uIENvdWxkIHlv
dSBkb3VibGUgY2hlY2s/DQo+IA0KSGV5IFRob21hcywNCg0KYHNwZG0tdXRpbHNgIHVzZXMgdGhl
IGBiaW5kZ2VuYCBjcmF0ZSwgdGhhdCByZXF1aXJlZCBjbGFuZy4gV2hpY2ggSQ0KYmVsaWV2ZSBp
cyBsaWtlbHkgd2hlcmUgdGhpcyBpcyBjb21pbmcgZnJvbS4gSSBhZGRlZCBpdCBhcyBhIGRlcGVu
ZGVuY3kNCmluIFYzLiBXaGljaCBzaG91bGQgZml4IHRoaXMgaXNzdWUsIGhvd2V2ZXIsIEkgd2Fz
IG5vdCBhYmxlIHRvIGxvY2FsbHkNCnJlcHJvZHVjZSBpdC4gVW5zdXJlIHdoeSwgSSB0cmllZCBk
b2luZyBhIG1pbmltYWwgYnVpbGQgd2l0aCB0aGUgY29uZmlnDQp5b3Ugc3VnZ2VzdGVkLi4uIGl0
IHN0aWxsIHdvcmtlZCAob2RkISkuIFBlcmhhcHMgaXQgd2FzIHNvbWVob3cgYmVpbmcNCnB1bGxl
ZCBpbiBhcyBhIGRlcGVuZGVuY3kgdG8gYW5vdGhlciBwYWNrYWdlLiBMZXQgbWUga25vdyB5b3Vy
IHRob3VnaHRzDQpvbiB0aGUgVjMgY2hhbmdlcy4NCg0KWy4uLnNuaXBdDQo+IEFsc28sIHNlZSBi
ZWxvdyBzb21lIGNvbW1lbnRzLg0KPiANCj4gDQo+IEFsc28sIHdoeSBkbyB3ZSBpbnN0YWxsIHRo
b3NlIGZpbGVzIGluIC91c3IvbG9jYWwvID8NCj4gL3Vzci9sb2NhbC9zcGRtX2NlcnRzIGFuZCAv
dXNyL2xvY2FsL3NwZG1fbWFuaWZlc3Qgc2VlbSBsaWtlIHZlcnkNCj4gdW5jb252ZW50aW9uYWwg
cGF0aHMuIEkgd291bGQgcmF0aGVyIGV4cGVjdCB0aG9zZSBpbg0KPiAvdXNyL3NoYXJlL3NwZG0v
Y2VydHMvIGFuZCAvdXNyL3NoYXJlL3NwZG0vbWFuaWZlc3QvIG9yIHNvbWV0aGluZw0KPiBsaWtl
DQo+IHRoaXMuDQo+IA0KPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhvc2UgZGlmZmVyZW50
IHN1Z2dlc3Rpb25zLCBhbmQgY29tZSBiYWNrDQo+IHdpdGggYSB2MyBvZiB5b3VyIHN1Ym1pc3Np
b24/DQo+IA0KPiBUaGFua3MgYSBsb3QhDQpUaGFua3MgZm9yIGFsbCB0aGUgZGV0YWlsZWQgZmVl
ZGJhY2shIEkgdGhleSBzaG91bGQgYmUgYWRkcmVzc2VkIGluIFYzLg0KDQpSZWdhcmRzLA0KV2ls
ZnJlZA0KPiANCj4gVGhvbWFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
