Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B5CA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F07D4119A;
	Fri, 30 Aug 2024 12:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgZeyPfauQwb; Fri, 30 Aug 2024 12:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6D8C4115F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D8C4115F;
	Fri, 30 Aug 2024 12:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBD61BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A0CB4115F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb6dxHVvz9M7 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:27:35 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Aug 2024 12:27:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AC7A41187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC7A41187
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AC7A41187
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:27:35 +0000 (UTC)
X-CSE-ConnectionGUID: TdFM5UjURrWwdjw20JZMpw==
X-CSE-MsgGUID: n5/82cnXRNOsqXvKNzXsbw==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25572866"
Received: from mail-southcentralusazlp17012048.outbound.protection.outlook.com
 (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.14.48])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 20:20:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApmFQP6OUjLa5ywgBn7iNgngjUx+NIWd766j9NGxcq+oAAlU9RcDxvwyZXraDwlMhyd0EYuzy+tsbPxRYSl+kBxw+uCmwCgWG99/lDp0OEhGpZLk/xCO1wk6bL2jzqxF/ZdCjABY0EMWxR1I4sTocBsbfGC5fI9RTOMSvxARfJ7NJMc4kqEsEPIPkbXbSwNQfUKBBgCSNSQv5tsaBbl2/7Rp8UfQz5LTk384aK+SS1uZK2S9plgDL9jgMgxW8jHUst9MLARq25a9L5q19iCK0PDd90sp+FSIx+oYZL3dUpCacw8YBNMYA5yIat3VSF15edASqKA7NiAGnd+BcYa0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLB4ZkrBGiCm2ORg1ho9+jZSYs9er9Y+YS/3jI9aGl0=;
 b=SVeyJCtjaMEdlyiDuHOxjIy9oW/RHJpSoWi6Dx50bCFiI1NwZiIqVVkse55f7ATb9k887K8yp/IHjRuS9eUeik/gMF9t4B9E+DzQSBQhWOYOwcrSKp1eCQx8oMctqkry+bIE9hRqel6iMT0e7UXzCJXXXy4hDghMzw2v7ykF8OB5yjgvy/zaIlCF/34GyScFOnm3nsuGGPXQeTkEGOynM4qW6krJPfxfPn3A6zevQZ5STSPSKD4qIaFhf9ODFgpM1sUx4vyQ4UDKXKO60yApyhOz44lHbLMZ2bw00teI1afF74RsYQTBxAWdoMSxLkfydgGxhoLa7iPS9AJDbIeY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM8PR04MB7832.namprd04.prod.outlook.com (2603:10b6:8:37::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 12:20:24 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 12:20:23 +0000
To: Michael Walle <michael@walle.cc>
Thread-Topic: [Buildroot] [PATCH] linux: add support for device tree overlays
Thread-Index: AQHaXpV70EqfD6awCkCqT32Oti+4grJA8M6A
Date: Fri, 30 Aug 2024 12:20:23 +0000
Message-ID: <ZtG5B5gprpGaHeWY@ryzen.lan>
References: <20240213154847.914068-1-michael@walle.cc>
In-Reply-To: <20240213154847.914068-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM8PR04MB7832:EE_
x-ms-office365-filtering-correlation-id: 2478bd2b-132c-4ddc-727d-08dcc8ee1fab
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2xXU2ZZbDE4eHRqejBOcUdDTHF0aTl1QmQwZkxiam5zNWY4b3NPRUphWXU3?=
 =?utf-8?B?RCtaT24xVzY2a1UyVHU1V0V3c2hjTUVKbS9SZmRhMVd5bDlCYkNHTDhyU0p5?=
 =?utf-8?B?WnVNWXRyOWxwNDNxT01XMGYzeStJTFFDZ3dZMHh6VFMzVnZTN25wQlRwTHJS?=
 =?utf-8?B?QXBERWx0ODIxQ2gyMjhCUVhTR25vY0xROSs0eTlTNXJkckErSWE3SzhHVndU?=
 =?utf-8?B?bytUWVRiKytPRlBaVm9TUXFuMFl3QkZNSkcwVncwbk9nS1pldjZHTTJQbzdN?=
 =?utf-8?B?Y0cyb1duU0VGTWdWRXVqRFhEbmNrSjhsK01XVjQ2anZUb1JpR1RUMHlES1pi?=
 =?utf-8?B?ZUNBOFlaK3JDcHF1RE5aSTE2ZlFzRklmT284TEV4dy9MS0wyV0dIR2QxU3pF?=
 =?utf-8?B?Zmh5ME8rZWxLcVEwcVVCQXRoMTFoMWJBaXNKTlRtSVRRU2dNTDBDWm8rZEVY?=
 =?utf-8?B?dm15MFA2RUtpOTI2RlVDaEQzallCVWFsK3RiN3FMcU5KV2ZjK1JHTzB5c1o3?=
 =?utf-8?B?NXY1K1N6WHdyZlFGYnRQNlZjSlU5RCtmSHFMcGhmMHkyWHlZZE4zcFBoZnhy?=
 =?utf-8?B?ZzR2ZXRGWW9wclViZjFZMDBlQXY5UWJDaFQvY1dPbHRMaFB5OUE2LzM3TG1w?=
 =?utf-8?B?QnJLbWV2cjhMcHQxaCtOb0VDMTJ2ZEoyOTZ6K0YrYm5WVlhIdUVkWXpQRmxl?=
 =?utf-8?B?eEZ5TS9KY1dMYWlYTTBpQVRtU1h1SUhuclZBUkM5OXo2c3Y1MlhtckQvRUxt?=
 =?utf-8?B?SlFjT3l3VmE3eDVCeWYxQi92Zlg0MFo2V2ExVWx1eEg5aGxwZTJpMTVDWmNV?=
 =?utf-8?B?V1NUSDlwY2Q2aWZBejZza0Y4TXo0Qlk2SERBVWVzM2M1UkdMRU5weGsrTFlB?=
 =?utf-8?B?R1BlMTlWTDBLendIT3ZuUW5RbVk0RGVXakZVMFFyOTlzcllQQ2JmaE96dGxw?=
 =?utf-8?B?OFhZS3dkc2xTcUhIZlMvclpDemt5UkZJVFFJTmNBQ3ZHNHRNcFJaeGVJbzRJ?=
 =?utf-8?B?OElWY09IYVE2NXlLOE5pcE1sZGVDVmFHU3BIVzRTY3VVUkVHVzQyNnJraEJy?=
 =?utf-8?B?djU0ZGZJWnBRU0pyVzd6M3FMWTRvWE9LaVVUa0FrTnVFSFMwUFZ4NU9LTnlG?=
 =?utf-8?B?RHY1NnJGKzdaSkJTb2gwVlhraFJrTGZBUkxLOG5xZ0VrU21zQWJ4ZXQwZnlV?=
 =?utf-8?B?QkxKS04zZXB5YXMrcmhWU1lmMzJ2RFprektRMlZaSmIycStNcHA4cHgraFc3?=
 =?utf-8?B?OUx4YVJBUGlnYXJwakNHSHJQUkFObENPM1FtT08zMFg2SUR5ZkZuYVNhaXd4?=
 =?utf-8?B?SzMzMkY0ZzlLZU5kNkxZdDM3bUlpQnIzQmMrMGpmejQ3eEdyOHpSVStnM1pu?=
 =?utf-8?B?b2gxZDY3cGluMXhzdkM5dWdPejgxdGpIYTBHRzZpcUt6eW41WnNPaDRaZkRk?=
 =?utf-8?B?Q2VJc2hycU9MSEZYMUpwaTV4cXFxUm1GVkU3SFI4UnVZTkhWdTF1anEwV2hD?=
 =?utf-8?B?eEx6eWlwN2E3WnBteXUxbzhzVWZEcVY4Tk9ma3o5cHc1dms5UGRwdlNZMXFR?=
 =?utf-8?B?aUNpbEFFTzFkS3VPNVI3WGRRK0tJTDBxQ2pyajJ1elJkWW9rVUNDRU0yTmM5?=
 =?utf-8?B?T281T1JDL0wrU1I1bUY0NnNDbU1CcnM2S21BdXFwejdSSHBkaXVQSVRmWkRL?=
 =?utf-8?B?dUJtVnlRb21Gb2RERFl2dDFiRWhVWCtwODVoSnFVb3paVzROOEIySllPTXR3?=
 =?utf-8?B?NzVBK0NQR3hNK29wWW9ob3FwdTl2Qm50OU4zVDB0RmM2OFhmUmNLY0FESU9G?=
 =?utf-8?Q?6hUa8t/msAQsQ/Gt7GorTUtIOVop8LtFOPcRQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aERwRDdSNndtSU1mZ3BQNVZNTVpQTEs5cGN1Q0lCSFZjU2dXZXc0MStJcWdY?=
 =?utf-8?B?dnR3UXRiMmo3VklWWmRvRURxajZ5MzRSVlppamx4aXlra1RVc2luVm94cnhz?=
 =?utf-8?B?eU9Rd1NoWTRERDc5WjBoNUtVT2Z3WnROK3p4QTZlV1VocHE4SFVRLzdsdzJ1?=
 =?utf-8?B?aEJpS2crbXRES0JuTlFJOUVkMUJ6UlFET1o1b3FlSjRyYzFESWxuRElaalBB?=
 =?utf-8?B?MjFCK04vd25WY0NwKzBlREVqeElQNStVQzlCWXRjVVlFYUV1a0V4bXhQcE43?=
 =?utf-8?B?SGFkTjBIVkhiNHBVNytTci83Y2Evb29nVjhJSTNyQ0twQUNNbmg0MU5IeXp1?=
 =?utf-8?B?bk9iTDdJQ2E1RktIQTZURjRFYUFKR0xhelNEYVROMFJ0VFhIdG1JQWVIc3dD?=
 =?utf-8?B?R3BlQTB5dlpYSW5Cc3hiQjMvSzJCQVIrVklyQ2dQRXl4eWY2d3UzdTRTNThI?=
 =?utf-8?B?b2pLTm84VDM2SEo4Ymdkc2xIeVVpYlcwRzk3RExkbWhwVXZzN1NHazhwOEk4?=
 =?utf-8?B?VEF4aUF1SHIyaTNkWVMwb0JHNEhYVmFrOHVrL044TnNFaTVtMEVHY29XQmRC?=
 =?utf-8?B?S0hHNU5pVGprd0JBRFc0b09lUFJVT0VuZDBzczlVZ0dqYXJCbzhvVG9TRldL?=
 =?utf-8?B?MDZDWkVHR1NRQVAvdnV0NVgxVGFmQXMwajJnRDVjYmd6QmtHU283a2FicklC?=
 =?utf-8?B?d0kwNlNzMjRMVmpsM2lYaXgzYzFBUU5aZS9iejEwNC9TUUFPck5qME9rdkdH?=
 =?utf-8?B?S3ZlWUdvcVU1RkMrWk9LbUdEWk00dW9lWlc3VDFwV3ROclZRVnpIaDBmREdy?=
 =?utf-8?B?SVdaRHM2cWUzTWExOWo4VkhVdDUxMGM2eC8xL3c0VE1ReHFZc0JZeHJTazJk?=
 =?utf-8?B?eldYZVFGTWthWUJLeGFncDN0YjIrSGlNQzdHbGROd0I4Vk40N3ZydllPU3hJ?=
 =?utf-8?B?M0pJVVQ1enVmc09ENzgyam5ZK1RzcStjbU9HZUVNd0tnZXpzMTdPMndCWHJW?=
 =?utf-8?B?RXV5bVZyMEoxajdEd092NnJKQTBoakFRNENuNHdqUmZKM0NZcUFiSytKb2Uv?=
 =?utf-8?B?eXFsVWUxajZMcGdUanFnMzJrK25tb0t6dEE2VXdKT1o2WjRnZmliVzFEdHE2?=
 =?utf-8?B?aFQvNjRmdE9WaFNnSTY1ZWkyb3B3aUdua1VuRGZwU1lrUFpOaHFUVkNkbFdD?=
 =?utf-8?B?NWwrQ0FHUWVSZkNXeGVsQ2dkRjdVN2p4Nmpnc3p1Zks2TGlrUEVHVGE1V1Fn?=
 =?utf-8?B?MVVnY0JUeU5kKzF1RTdDN3RLOVBrUFFrOFNBRDJZTWZtVjQrVkVLbjJCS1oz?=
 =?utf-8?B?SEV0YWJ3eDNYSWUyQUhYZWIycy91OGxrbFdsRVNTOVNmb2hTVGRyaDE0SXor?=
 =?utf-8?B?N3hmUC85UEdXREVuZTgrRWFPb2liVDhOalpISHd3dHFIQXIyTEN3ZEh3SG1F?=
 =?utf-8?B?TmovOHZJRUc0WFhEd0ZyQWhFOWVmVjNKenVJc2NIYkZHMHI4L0pDZFZNUzR0?=
 =?utf-8?B?RU1SYnVjUEUyUHorVTVYMTc5eFVGK3ZNYVlVMW5KdVF6aEJmeDAzSmpiN2t1?=
 =?utf-8?B?ZWdCR0JUQ1pGVUZWZnMyR01zdk43VUlpWDlIdVQ0YmpjazRYOWNWL24rWVhy?=
 =?utf-8?B?OWNUK0lqZGEvUWFsNkJiV3BOVWdCUWJ5Yy8yelRIem9GWDhCbjF5dXNRVEpH?=
 =?utf-8?B?d0pOWm5qblhpM0J3WWE4R1hMOTVQY1Q0M20rM1RYNzk3VXlsOGIvbmVGRlJJ?=
 =?utf-8?B?ZWtNSFdDTTRKRTdSdE1yTExmNlR6WkQ5c1o1dGZNRFUxWU5HT3VoM1RYME9N?=
 =?utf-8?B?YWpja084SllPOWlycVY4MEl6QmZTY2hqTVphUWdtakJ2MzV3K29wRFJob3di?=
 =?utf-8?B?WWtVWERMa0drQWgrc3V3dnJoZWxJcTk5UGVOUk94Z3N2bHNWUjdqZDRkWU5n?=
 =?utf-8?B?dUU3LzZjV2oyeXNHdUU1akd0TWpWKytEWGFRN0V0cTk2cVhIVCttUHFGcFZG?=
 =?utf-8?B?NndvSExheFFtSjlRQXhkc3NUdmV6SjZWQTlZWXh5RkdaSzlybzVQV2dSSnMw?=
 =?utf-8?B?ZVpzdXVqOHN5ZERrTzl3bm5ycnJ0NjR3M0t5dnloS0h3cXZrbkg5ZW11N3RZ?=
 =?utf-8?B?ZXFZNmgzOUZRMDkrWmlZMkpURzBBTENzbVB1SENXeXo1V2hmTjFpRTljUlRM?=
 =?utf-8?B?VWc9PQ==?=
Content-ID: <BAB10B8D7DC5C1449C9F6EA6F6E97411@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tCzSzSjV25qGoqvPJ9li3dZ1tMkQky20p8lXXosrqLhPUBuLxEAftS3jFVhZHtcpqe/s4SiSujeXDgdhxld8zdljJPJwiBCIZdLwupHlhsMHCZkdNlyR4fkWmzFryVy/fbQFyJ26VpWQS3wP1p4OJ22TD1I8J8Je9vqpG60kW58o3HdCXsQfpxtH2fKLImmHKyhCsgoti2zbptXUd5dQU+qyqSHaRj59Lbys9n6O0ZFCu0Q0MbBsUJb6OG1n+twe7d+iP7ALDcw3lKNEPGaJOgV7ixwOwRQJCLQJD3YY7vJUA2+Ch6tP9TuyeIBmABmmRRN3pGVzD7K8d1Z19FjVQaLELH9r9/Hidp8CEMN+CZOCHa3ix5Mvzj5zbR8Yi7cA8+SGrz9Rx0U4LFE3vQGp1VgKeDq3gc/44B+YAGDWGMRaPK6jrH94OdS6yAVLx2HWL3X3DLJvyOHNSSOPYJUKBpS/YS6EmBJzRv9OJs4wsKtt5EFa+J3PKbNrY42TxM+jEmldRoSGQDx0lYw8dw+d2yGwcoEOSgwW39xIUQDRaAWCKDv7tzRI/6ZbnKEl27WT1bd5Ohmqe1XSzEtRSqAH24V2Z/2Ut+NgNbJFJsntWrW6adjwL0qFdJ8lqUsJuXUV
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478bd2b-132c-4ddc-727d-08dcc8ee1fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 12:20:23.8658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XITZJCzzmCyyfZMKyWo53uOV5t1ZbX1PBGdtb29pOY22doAnDI04xEwpJLYk6ELmwRGyxjVjzvlatAbYzbB7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7832
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725020855; x=1756556855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=rLB4ZkrBGiCm2ORg1ho9+jZSYs9er9Y+YS/3jI9aGl0=;
 b=oKURvU16ixmBUQjpXI+l81fdBQJPWbhmuCJH4Ksx0d00DZasCoez7OpV
 dY0z2EnCSA5HGCnExKLvYTY+G+/NhJ4gw50zNIEonAwx4deBLxB/VoVZf
 TaVSdzFPqOddpbx+7O/9W/hAbv7ac0zEBPykzznT3Amv5DC+YPyAkTHOM
 9Ih6aelXBZOPcjWvbEmmczdWwauM3rBXhouL9XesOlKcajkjKNmtthpoZ
 oC2r7IBmzC3P63CNmAEN3KM2xlYI43/m1Cyo3dq2pnSs+HdnIVEQtmBuj
 IuQV0Q6zOLAYpUwdCIiTQRhHh2I3kt534p6SAN06zMftJXotGZxkv2xL8
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLB4ZkrBGiCm2ORg1ho9+jZSYs9er9Y+YS/3jI9aGl0=;
 b=hulx4cXy7IWSBmit1hwBP791S2qBDEo9iPOzR3R0xQx0jyHpj0g/SLFpqd5nuVV/RpA7Jnr04A7DqWbXe+aIJMkapRM77Gw8bMBxffKdWVEcQ3xehuJsgzelmQZvUA+R/zWrzx8ZSFotpRkPubfOTGCanduFkGdqby0e9jfMKHA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=oKURvU16; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=hulx4cXy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] linux: add support for device tree overlays
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 =?utf-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@rtone.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWljaGFlbCwNCg0KT24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMDQ6NDg6NDdQTSArMDEw
MCwgTWljaGFlbCBXYWxsZSB2aWEgYnVpbGRyb290IHdyb3RlOg0KPiBUaGUgbGludXgga2VybmVs
IGNhbiBidWlsZCBkZXZpY2UgdHJlZSBvdmVybGF5cyAoLmR0Ym8pIGl0c2VsZi4gQWRkDQo+IHN1
cHBvcnQgdG8gYnVpbGQgYW5kIGNvcHkgdGhlbSBhbG9uZyB3aXRoIHRoZSBhY3R1YWwgZGV2aWNl
IHRyZWVzLg0KPiBUaGVzZSBjYW4gZWl0aGVyIGJlIGluLXRyZWUgZGV2aWNlIHRyZWUgb3Zlcmxh
eXMNCj4gKEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUQk9TKSBvciB0aGV5IGNhbiBiZSBwcm92
aWRlZCBvdXRzaWRlIG9mIHRoZQ0KPiBrZXJuZWwgKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RU
U19QQVRIKS4gSW4gdGhlIGxhdHRlciBjYXNlLCB0aGUNCj4gb3ZlcmxheSBzb3VyY2UgZmlsZXMg
d2lsbCBiZSBjb3BpZWQgaW50byB0aGUga2VybmVsIHRyZWUgZmlyc3QuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPg0KPiANCj4gLS0tDQo+IEFs
dGVybmF0aXZlbHksIG9uZSBjb3VsZCBtYWtlIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19O
QU1FIHNpbWlsYXINCj4gdG8gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggYW5kIHBy
b3ZpZGUgYSBsaXN0IG9mIGR0cyBhbmQgZHRzbw0KPiBmaWxlcy4gQnV0IHRoYXQgd291bGQgbWVh
biBkZXByZWNhdGluZyBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRQ0KPiBhbmQgdG91
Y2ggYWxsIGRlZmNvbmZpZ3MgdG8gcmVuYW1lIHRoYXQgb3B0aW9uIGFuZCBhcHBlbmQgdGhlICIu
ZHRzIg0KPiBzdWZmaXguIEknbSBub3Qgc3VyZSB3aGF0J3MgYmV0dGVyIGhlcmUuDQo+IC0tLQ0K
PiAgbGludXgvQ29uZmlnLmluIHwgMTQgKysrKysrKysrKystLS0NCj4gIGxpbnV4L2xpbnV4Lm1r
ICB8ICA4ICsrKysrKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGludXgvQ29uZmlnLmluIGIvbGludXgv
Q29uZmlnLmluDQo+IGluZGV4IDc3M2NiNGZiYjUuLjQ4NmEyMTQ0ZTMgMTAwNjQ0DQo+IC0tLSBh
L2xpbnV4L0NvbmZpZy5pbg0KPiArKysgYi9saW51eC9Db25maWcuaW4NCj4gQEAgLTQxMSwxMiAr
NDExLDIwIEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRQ0KPiAgCSAg
dGhlIHRyYWlsaW5nIC5kdHMuIFlvdSBjYW4gcHJvdmlkZSBhIGxpc3Qgb2YNCj4gIAkgIGR0cyBm
aWxlcyB0byBidWlsZCwgc2VwYXJhdGVkIGJ5IHNwYWNlcy4NCj4gIA0KPiArY29uZmlnIEJSMl9M
SU5VWF9LRVJORUxfSU5UUkVFX0RUQk9TDQo+ICsJc3RyaW5nICJJbi10cmVlIERldmljZSBUcmVl
IE92ZXJsYXkgZmlsZSBuYW1lcyINCj4gKwloZWxwDQo+ICsJICBOYW1lcyBvZiBpbi10cmVlIGRl
dmljZSB0cmVlIG92ZXJsYXkgZmlsZXMgKC5kdGJvKSB3aGljaA0KPiArCSAgc2hvdWxkIGJlIGJ1
aWx0IGFuZCBpbnN0YWxsZWQgaW50byB0aGUgdGFyZ2V0IHN5c3RlbSwNCj4gKwkgIHNlcGFyYXRl
ZCBieSBzcGFjZXMuDQo+ICsNCj4gIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNf
UEFUSA0KPiAgCXN0cmluZyAiT3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUgU291cmNlIGZpbGUgcGF0
aHMiDQo+ICAJaGVscA0KPiAtCSAgUGF0aHMgdG8gb3V0LW9mLXRyZWUgRGV2aWNlIFRyZWUgU291
cmNlICguZHRzKSBhbmQgRGV2aWNlIFRyZWUNCj4gLQkgIFNvdXJjZSBJbmNsdWRlICguZHRzaSkg
ZmlsZXMsIHNlcGFyYXRlZCBieSBzcGFjZXMuIFRoZXNlIGZpbGVzDQo+IC0JICB3aWxsIGJlIGNv
cGllZCB0byB0aGUga2VybmVsIHNvdXJjZXMgYW5kIHRoZSAuZHRzIGZpbGVzIHdpbGwNCj4gKwkg
IFBhdGhzIHRvIG91dC1vZi10cmVlIERldmljZSBUcmVlIFNvdXJjZSAoLmR0cyksIERldmljZSBU
cmVlDQo+ICsJICBTb3VyY2UgSW5jbHVkZSAoLmR0c2kpIGFuZCBEZXZpY2UgVHJlZSBPdmVybGF5
IFNvdXJjZSAoLmR0c28pDQo+ICsJICBmaWxlcywgc2VwYXJhdGVkIGJ5IHNwYWNlcy4gVGhlc2Ug
ZmlsZXMgd2lsbCBiZSBjb3BpZWQgdG8gdGhlDQo+ICsJICBrZXJuZWwgc291cmNlcyBhbmQgdGhl
IC5kdHMgZmlsZXMgd2lsbA0KPiAgCSAgYmUgY29tcGlsZWQgZnJvbSB0aGVyZS4NCj4gIA0KPiAg
Y29uZmlnIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBfRElSTkFNRQ0KPiBkaWZmIC0tZ2l0IGEv
bGludXgvbGludXgubWsgYi9saW51eC9saW51eC5taw0KPiBpbmRleCA1M2UyYWQ2ZDQ4Li5kZTZj
NWJkNjAyIDEwMDY0NA0KPiAtLS0gYS9saW51eC9saW51eC5taw0KPiArKysgYi9saW51eC9saW51
eC5taw0KPiBAQCAtMTkwLDE0ICsxOTAsMTggQEAgZW5kaWYNCj4gIExJTlVYX1ZFUlNJT05fUFJP
QkVEID0gYE1BS0VGTEFHUz0nJChmaWx0ZXItb3V0IHcsJChNQUtFRkxBR1MpKScgJChCUjJfTUFL
RSkgJChMSU5VWF9NQUtFX0ZMQUdTKSAtQyAkKExJTlVYX0RJUikgLS1uby1wcmludC1kaXJlY3Rv
cnkgLXMga2VybmVscmVsZWFzZSAyPi9kZXYvbnVsbGANCj4gIA0KPiAgTElOVVhfRFRTX05BTUUg
Kz0gJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FKSkNCj4g
K0xJTlVYX0RUQk9TICs9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9E
VEJPUykpDQo+ICANCj4gICMgV2Uga2VlcCBvbmx5IHRoZSAuZHRzIGZpbGVzLCBzbyB0aGF0IHRo
ZSB1c2VyIGNhbiBzcGVjaWZ5IGJvdGggLmR0cw0KPiAgIyBhbmQgLmR0c2kgZmlsZXMgaW4gQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEguIEJvdGggd2lsbCBiZQ0KPiAgIyBjb3BpZWQg
dG8gYXJjaC88YXJjaD4vYm9vdC9kdHMsIGJ1dCBvbmx5IHRoZSAuZHRzIGZpbGVzIHdpbGwNCj4g
ICMgYWN0dWFsbHkgYmUgZ2VuZXJhdGVkIGFzIC5kdGIuDQo+IC1MSU5VWF9EVFNfTkFNRSArPSAk
KGJhc2VuYW1lICQoZmlsdGVyICUuZHRzLCQobm90ZGlyICQoY2FsbCBxc3RyaXAsJChCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCkpKSkpDQo+ICtMSU5VWF9DVVNUT01fRFRTX1BBVEgg
PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKQ0KPiAr
TElOVVhfRFRTX05BTUUgKz0gJChiYXNlbmFtZSAkKGZpbHRlciAlLmR0cywkKG5vdGRpciAkKExJ
TlVYX0NVU1RPTV9EVFNfUEFUSCkpKSkNCj4gK0xJTlVYX0RUQk9TICs9ICQoYWRkc3VmZml4IC5k
dGJvLCQoYmFzZW5hbWUgJChmaWx0ZXIgJS5kdHNvLCQobm90ZGlyICQoTElOVVhfQ1VTVE9NX0RU
U19QQVRIKSkpKSkNCj4gKyQoZXJyb3IgJChMSU5VWF9DVVNUT01fRFRTX1BBVEgpKQ0KDQpIZXJl
IHlvdSBzZWVtIHRvIGNhbGwgZXJyb3IgdW5jb25kaXRpb25hbGx5Lg0KWW91ciBwYXRjaCBkb2Vz
IG5vdCB3b3JrIHVubGVzcyBJIHJlbW92ZSB0aGlzIGxpbmUuDQpXYXMgdGhpcyBwZXJoYXBzIGEg
ZGVidWcgbGluZSB0aGF0IHlvdSBmb3Jnb3QgdG8gcmVtb3ZlPw0KDQoNCkFkZGl0aW9uYWxseSB3
aGVuIHNwZWNpZnlpbmcgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRCT1MNCkkgbmVlZCB0byBz
cGVjaWZ5IGluY2x1ZGUgdGhlIC5kdGJvIHN1ZmZpeC4NClRoaXMgc2VlbSB0byBiZSBpbmNvbnNp
c3RlbnQgd2l0aCBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRQ0Kd2hlcmUgeW91IHNo
b3VsZCBub3QgaW5jbHVkZSB0aGUgLmR0cyBzdWZmaXguDQoNCklmIHlvdSByZWFsbHkgd2FudCB0
byBrZWVwIHRoaXMgaW5jb25zaXN0ZW5jeSwgSSB0aGluayB0aGF0IHlvdSBzaG91bGQNCmF0IGxl
YXN0IGNsZWFybHkgc3RhdGUgaW4gdGhlIGhlbHAgdGV4dCB0aGF0IHRoZSBmaWxlcyBtdXN0IGlu
Y2x1ZGUgdGhlDQp0cmFpbGluZyAuZHRiby4NCg0KDQpBbHNvIHNlZSB0aGlzIG90aGVyIHByb3Bv
c2FsIGZyb20gR2HDq2wgUG9ydGF5Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjQwNDEyMTQwOTQ1LjE2MjY1NzktMi1nYWVsLnBvcnRheUBydG9uZS5mci8NCg0KDQpLaW5k
IHJlZ2FyZHMsDQpOaWtsYXMNCg0KPiAgDQo+IC1MSU5VWF9EVEJTID0gJChhZGRzdWZmaXggLmR0
YiwkKExJTlVYX0RUU19OQU1FKSkNCj4gK0xJTlVYX0RUQlMgPSAkKGFkZHN1ZmZpeCAuZHRiLCQo
TElOVVhfRFRTX05BTUUpKSAkKExJTlVYX0RUQk9TKQ0KPiAgDQo+ICBpZmVxICgkKEJSMl9MSU5V
WF9LRVJORUxfSU1BR0VfVEFSR0VUX0NVU1RPTSkseSkNCj4gIExJTlVYX0lNQUdFX05BTUUgPSAk
KGNhbGwgcXN0cmlwLCQoQlIyX0xJTlVYX0tFUk5FTF9JTUFHRV9OQU1FKSkNCj4gLS0gDQo+IDIu
MzkuMg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0KPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0K
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
