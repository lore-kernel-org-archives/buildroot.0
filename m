Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C79C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 18:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990DB41933;
	Thu,  6 Jun 2024 18:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Pp85u3zPBfA; Thu,  6 Jun 2024 18:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31DDE41928
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31DDE41928;
	Thu,  6 Jun 2024 18:34:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1A51BF592
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B0134257D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C871j9fsR96H for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 18:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7468424EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7468424EF
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7468424EF
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 18:34:49 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 456FmWeW014997; Thu, 6 Jun 2024 18:34:45 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ykg33aksu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2024 18:34:45 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 456IYh0J001070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2024 18:34:43 GMT
Received: from UUSALE2C.utcmail.com (uusale2c.utcmail.com [10.220.63.38])
 by xusxph005rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 456IYh6k029007
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2024 18:34:43 GMT
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE2C.utcmail.com
 (10.220.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 14:34:43 -0400
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 14:34:43 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.182)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 6 Jun 2024 14:34:43 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1733.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 18:34:41 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 18:34:41 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Neal Frager <neal.frager@amd.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH v1 1/3]
 configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
Thread-Index: AQHauCXEniiaNmxqskGoPxDxvAfX87G7CQcAgAACSHA=
Date: Thu, 6 Jun 2024 18:34:41 +0000
Message-ID: <BN0P110MB16733D666EED3DBDBFFC8B64EBFAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240603115212.184529-1-neal.frager@amd.com>
 <ZmHU1-EPxRFiHZDl@landeda> <13f2f3fb-31ed-4a20-a0c8-304f359da64d@mind.be>
In-Reply-To: <13f2f3fb-31ed-4a20-a0c8-304f359da64d@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1733:EE_
x-ms-office365-filtering-correlation-id: 995ed192-0537-4215-a4fd-08dc86575490
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|38070700009|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?utf-8?B?WWdPMitxRjZJMGRXMml6Q053YjZUM3BMdTR0bUE1cFVsa0lEbDRmV1pWampo?=
 =?utf-8?B?MDFNdm9QdmJvVGMwQkliNC9TWEFSa1lCb1YyVE5ROWZ1d3laTFdobUNhaFJJ?=
 =?utf-8?B?ZHMwdXFhZ3FtSGlOUlQrVUw3WWJ3MkVvRFRiUW9YbVhhV0x3WFM1Mi9Cdngz?=
 =?utf-8?B?NXl1YWRENGpzcmNWKzlkTVJsRVViLzBwMUxvZVNXS21QdjFIMnNsbDc4RGZ2?=
 =?utf-8?B?YkpwMmRGWnc0TFFXTXpQa0VKZVo4bU1vWDBSY0tvdGhqVmh2bUo1RmRid0pO?=
 =?utf-8?B?Y2NTUlRVRS9yYWJyWDlIVThQN0txTE55VjBObzhEZkRFMk9DR0xTRC9pdVJ2?=
 =?utf-8?B?SmNkUWJsMGpMK1NhckF1L1VVSEZpUVlwa0V0VlQ0Zy9RM3RVeU5YVFdkYzdI?=
 =?utf-8?B?c2RRVkZTYStYRU1iSFVhWXFzLzBYTjRnR2w3akdvUUhrSW14RHoxMnI3dDNL?=
 =?utf-8?B?UDMxNjgyQ3ZaUVJENENJQ1JneXNZdllHbEV3NitrMElhT1pZZGpQOEZ0N3BQ?=
 =?utf-8?B?ZGxISUV1bldDeU05MklpQkZkclZadTVNb0ZkZDdWYWxqWFgzRzJLTG9DNU9s?=
 =?utf-8?B?QTRZZU1qSDZRd29heEF1R3Z5MUxLSnBIMGJ0UiszUitQUVlqMTZnSUZtVzNl?=
 =?utf-8?B?d2I5TE9keVNxRU9zMDlCb3ZTak5VdFpybVR0RHhFVFJqR2pHVGFBVkJqWkZH?=
 =?utf-8?B?a3ZuUU9hbE1nUWJVb3FBZ1QvUzNHb2xoM3BPUC9MYUhSOXMrbDNiMGZUd2pJ?=
 =?utf-8?B?OHQ0ekNJV1l6anZMVmlwT1NOK1czc1FaaytsY2YrR2kwM3JPelJMU1lUaksw?=
 =?utf-8?B?VnBhU2ZMMXN0cmFlZXhObmlqSUJkTERwdS91VGJnNVdReU9teUxLU3ZUWjNV?=
 =?utf-8?B?WGFKVFJDbmwvTUhLWmFDTTJmeGtpdUtjVWdBNHhUMTFZelJJU2Zic0twemRB?=
 =?utf-8?B?YzhKRjgxRmdQU05LVzFSV1lxSTUwMHpPbC9tSE9DdEt6UWJvR1JFS3huN0Ft?=
 =?utf-8?B?NVhBNjNUTFIzK3NJd2NMQ3RRRFgyaDdoZHl1Y05Ua0h5L0FFUzBWbHQ0ZUMv?=
 =?utf-8?B?akhZanFuaC8zdlN2bCs4UTBLQ29kSW9XVkt2elVWVnhpek5xaFl3WjM3L3dL?=
 =?utf-8?B?RFovaU9oaHdlTkpoR1BzdkZSN2FlVU51OENCcFdxaTdjMUhETktDSFA1R3cw?=
 =?utf-8?B?VE51R0RUVjMrbGo4eXA0Ny9yWDJTaWtkLy9LVjdrU3pqMjVKMlZyQklCZ1d3?=
 =?utf-8?B?K0Y0ajF0UFlZZDR4czJ2UDRsd2szU0dJU0ZYbjdXdFRJb0htQndNVStXQlkr?=
 =?utf-8?B?OFBwR0FjaHJBVmJrYXc5TlovanZhTWg0U0VHUUc0VGhCdXg5VGdmUkxnWW5x?=
 =?utf-8?B?VzExSFMxNEtVeWo1eVByOGtFMWNsMDhwdmhhU0diWDYxb3dTNS9lUEovYkZv?=
 =?utf-8?B?Q0hNa2pXNFNHMDlnSFJoSFdxUTlEWEN5dnVjbmpCc05ESTU5VUJLbFpPb2ND?=
 =?utf-8?B?eVFjQ29mZHNCeC9KNkV6bEtkek5aOXNFYVlraytJZGozbng2ZHpmNEt5MVFP?=
 =?utf-8?B?aURObGdiblpGRC9pOERIeU1CQWhvQXovajdPNjYwQWdKT09pKzA3NTNWRVVD?=
 =?utf-8?B?M3A3N1MzTXVpbWxWaDNuZzF4cGNYWG1sK1dMTHdLREJZdkc1b1BmbnM4TDNY?=
 =?utf-8?B?RlNSUXBEcXJkOUtFSzEvR1Q5U1J5WEwyd01zMFJSdEhGcWg2L1g1d2RZTFNT?=
 =?utf-8?B?MTJNbHI5aTEwWUhMQXpEV2lLSk9LY2xCSTgyVjJHenZIU3RCZFRONWx4WDVm?=
 =?utf-8?B?eG9CYkdrMEJJaTdkOFMyZU1QQ09CMjl1R0pudXBJRVdHRU5pSkdoa29sQlNT?=
 =?utf-8?Q?NNg0marRTy+3z?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkdTOGg0N25odUxId093MExMUHhHamFqYk5KdHpYeEZtRGdma1A1aVVKVDVs?=
 =?utf-8?B?MStMWDY1NjA4OVpMQ25OS2pJRC9vejloV3hET0E3L0VoVVZ3MXpFaFo5VzR0?=
 =?utf-8?B?bGpQaFlYSi82Mi8xRFBVdnpZWTl2MWt1RDN2OG4yMExvL24vZlYxVDJmbWlO?=
 =?utf-8?B?REFiZVdza2NLNGc2QTNwR2VKUG9BT0ZYQXoxVmtVR0lGSkRRV0UrZzllMm1L?=
 =?utf-8?B?SElUMTRJTmx3QUhhZWVLdUtwQmh3eWhHbCttWUtvZ3ZmdVVPczFhVWFnUllP?=
 =?utf-8?B?b2FDd0hKM0tVVURKQUd0ZTdhMVBRTCtvVHg2Z3VaQk1JU3I5Mk1kUi9pYmNn?=
 =?utf-8?B?RUxJbWFMWEFzVEkvekhaZE01WXF0N3JIbXJ0a21kUDN6TzA3SXNRMDhRWkRu?=
 =?utf-8?B?S0lVV1d3M3hldS9FamhDdW80NEpsWTNsZUIwV1ZJS3h2UmdHTDE2MTQ4bnRo?=
 =?utf-8?B?dm1INlYrMmZFZXdlS3ljelRtWWxSeGRub0lvSDVZRHJxTkdhL3BYWnU4YWhU?=
 =?utf-8?B?RVlBR0Nkczh6bnEwdnVzbDMrRW9GRG1KMjVhR1JCZVIyV1Y5RnNycktDeDBs?=
 =?utf-8?B?L2ZQUG80aFVSSTVLd0dYUDJaV3o4blhnbGRBRHBxa0lYU3I1aEZqeVFGalAy?=
 =?utf-8?B?VEpRdFhpVXUzL3c0ZVA5c3NSN3lSM2VTTXl4ckdWR3U1MURqb1Y2c3hxS0xt?=
 =?utf-8?B?ZnFvNnpVeVdlVXNJY2hYamVVMGlyNFFzVmlxL2pUb0pQL0pRc2VMMUdzcjJ2?=
 =?utf-8?B?WjlJRGRUWHBNQ24ycVMzUDRHK240ay9wcUEwL0szcEp4VjRacTZYVEZONEtB?=
 =?utf-8?B?QXpIZ2ZoOXJhQW9tbzk4WmJta3l2aSt1WUhtNEE1VHFZUmNIWm9NTFcyWTBq?=
 =?utf-8?B?RU5GeVU1bzM0aXF1L2R0eU04TmFGTEVibUZvZ00xcXhRT3gwNmtxd3ZNdG11?=
 =?utf-8?B?RGFUeDd5eVZtQ0dSOUhvV0MrY0J5bDBTcXZWUmFCQ0o3dXI0NitPQkhmeTJl?=
 =?utf-8?B?KzA1blphQ1puRmVHakYyNTRsQTNaUFV0YmEzb0g1eGR5UWtoYXV5TkVsL0hk?=
 =?utf-8?B?UlZ4UzlseGFpcVBrUWlHQjhBNDhYZWtHdXRITUlOeDREVEdWUTRNNmJIK1BQ?=
 =?utf-8?B?TjZnUTl2eFAzSzBkelhCc1dlMGx1aG4rYlhkc3oxQm5MSGNXUmNCMnNxTnMz?=
 =?utf-8?B?RjA5eVUzZG5PajAvdTgvaTJxUzFrSlZGRzFod0ZkN01VQkw2QjVKazhWUnhx?=
 =?utf-8?B?QzF2SUZBM2VudkJvQTF1a01ibXNzU0NUcy9XTnFsVGx6bG9udTJNdTE0TEVI?=
 =?utf-8?B?T1VjL2lGR2U1Z2Q5UVExVW9HNUpwc3M1Z1YzU1QrUUVpMWFSdjVJckJrcFJ6?=
 =?utf-8?B?b2FZeWluWkRBNlFodU5tT0R4VENJRXlsaGY0cGtVV2lMb1lpaFJkNTlseitv?=
 =?utf-8?B?WXBjVGlsR0F3RjdGR0o5UUFZQ0hQRnVDendDNjNya0VGbFJrNVBTRmZIdEJ2?=
 =?utf-8?B?cnY1a3FjL2ZqdFMvMDVuN1pHRC83WjBjSlVoV0I3ZmZQUjdWV0R6MFlzTklI?=
 =?utf-8?B?bTZLNURTbmtacXlqN3drMDNEcVRvQUxUalBscHV4UllGOGdQdklwWXpBaVhE?=
 =?utf-8?B?L2s2dmxxTnlDT0UwSWw5aUwxc0N6MUVZTlNkZ2RTZGdvQkFleURPTE0yQUNy?=
 =?utf-8?B?VXArcFhVbEVielRIZTFTa1JJUVh5QTQvL0tKWVhmTlAzMERVbno1Z0pYNFZI?=
 =?utf-8?B?WTBRVUM0OXdxdm92cjdkNURyQWh2dVVVcTVMYkRyb0hsVVluUnpGMXBMeXNh?=
 =?utf-8?B?SDNZTDU2QjVBVEpWYTdJV2FOeFNGelVYcUZDZGJCWWtFOUJHQS9jNTFyeENv?=
 =?utf-8?B?V2tQTlNDbzQraEp5d0U5T2VFWmR6RkVaSUhnYkRlQm5wdHNZQnExZ3pFaTlS?=
 =?utf-8?B?MU9wVmY1R094Rms1R3NST1R3Nm9aWXJMZjROSGdsajdnU0FsME9wa0FObzA4?=
 =?utf-8?Q?4/AK0ZB5vO40Lu5V9P6h+n8SGzB3ZA=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=xtywbzHC+l8qcOe4QnrYs7nhJVn1Hv4jdwTrcNnNQBjb1Hds+7ggOxiDkRLo6/lqWamCimNd4qupnqlYn4dS9i55c+LVDpSCh8Um2uqdm/mojtBvidJZeWpHvTcioiKxnKBannyS4YYs4fZUnS8+Y48xw0o3ovnwi5oryM+0IdPuuwsUr5ayqfCOHvPzgYGzDJ9gVnDQ3gucXo7Ro7nVAr/Vpm+YYeJtEuHxGguwFW3chRo9bY/K3DxEUKbIckpZN6VVXf9lzf4Z207OtU2RMemq3tQjJZ2YTnIsSKIw7QfWHGzCDxAQKBreF1sQMxDnWF7Z6inZYVcrLRRsMWbjOw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iaUT6bf7PbmWv5BUmSHr38sRzH8AlVJQi1/+FfYgVo=;
 b=tvkPPV9v/BA5CgNL2o/axYMdaenwwnuJxmgYm9mVh4kXa0hHYCWXePr7eXyBy4GBEporboNl5+j25Nohjm55IpF1QRnVDKmtRUtdUJYBxH3oVgOoG8ikeufPLM4gP4g2UBfLIDMU1JcyAejSgBiCxhDGTFYKmxXcxxcSjvYllCz61w/yHuGcVn7mT424+O4t4kGlhEI2KZWE2AGIiIw43OUxEEUz4bOk1bmV+jjcspXnourDTCB7HepFzwzRiKSpHXigpc4uYRTpMlPZzZukZ+bruYfVSbjjr+qMLb27RVTXfxxxxe0eLYARJ3eU21Yq4Vy7M72WhabRQCe/GpHGsQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: /38G9D7AKyODZgj5MEueFJFQMu0xvAPHQh9Dkgv3Coi0hIHW0NcvkWQTeE04RSY6PFb6B9VvcazCBJk73qwhN0su8t2Nx6s0Qoo+dSU12vd603RYDHqlsJYZxHOxIJfKUk3UF2gMFkTonHm0F4D76LKxZO6L7vY9KxOqE2CBr6W3AiCqjH+2m0Wh3ngkU5V9WHZtj6UoRqz/V9ZIQQWWCgdHqfeLLseRjiQCKpoEhdknQ1/l7DQe3MrUdFtAJi3wEpOaK3j1JHiEhXdTvOI4oB51B61xhRuDPj0UOM+O2/0GTq1kj4dsbQaB48xjHJTfwEZYrQsOkSZB2BMtOG3xz52Df+/OAWItINu9vMYDfATjeEbmLFjr6qA7LtYEHN7tXJenVifbCLbX1ERB/mAa3W9hb1eRuXQJhKFevCdexUjCDqOaZvZGOsPV6qpClA5nzeePbrhRGVxXail3xjH25G3a4mRA/ByrDiYU18NvUS2PJAQETFNz8JzIJlhVhAEHTJKMcseKyW9bcieO93ABJZadmSR+NSE+U9fXOYDFlVeVGPf4MOD6t/Yn3HB115xR8qaKUaUgTdG1rdIbmhKlJ47Yr6AfNTy5lxm3V8DA4bQ=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 995ed192-0537-4215-a4fd-08dc86575490
x-ms-exchange-crosstenant-originalarrivaltime: 06 Jun 2024 18:34:41.8269 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1733
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=994 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060129
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060129
X-Proofpoint-GUID: GSyPJjpEkHe_ZhJtuUs8_zmkGiT5AJTw
X-Proofpoint-ORIG-GUID: GSyPJjpEkHe_ZhJtuUs8_zmkGiT5AJTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406060129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=to/9lW8ARUIS9rxCFuW+6N7RThNKqanCXat3WOrEMLY=;
 b=ktbfKQp8Q03dh45jpLBc0yVp1I9VRPqQ9fdViOsPqNwPAqanooLmB8disPII/5bNdy1k
 o64sTEi1cv6html9meFWxdJ7tBbZlmJqXSPTsf05dEg24t/gFVjHbWuZhBuC0pkAkxh1
 fkp6g9HCBgJPOX7r/ZtTdmasLrVUHnxjx8+1HewuGkyEZGN2iHSQvuCE3vJUG8tsZLrj
 W9f4WcL0tg7U1Tnj3c55PFG0w6zHKOM6FPW9pF+F6OV12E4rjAw+PhWgsXno1/YiPyck
 yTciaLaX83EJES7VDfk/QeqviCWI6PooPY0wdENbVlvIeguDSUrMvYtsHv8mutDfnQII mw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iaUT6bf7PbmWv5BUmSHr38sRzH8AlVJQi1/+FfYgVo=;
 b=Bgwrp8mHjfUbdW+W0PAveSMKlKCjZSCsVv7Z3WgQ/zr9rlknnbW4olG4Rkzpi5PLcIIkZNMilBnAbowErlQ/P61vd8/RZ848FlzqiEj0OFmvwXhT0GFMMqXUbb5vjSLK95w92Xu+2QMwFSOdWkJUoXhVxI+GrkEc5InCjoS8xgc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=ktbfKQp8; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=Bgwrp8mH
Subject: Re: [Buildroot] [External] Re: [PATCH v1 1/3]
 configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Thursday, June 6, 2024 1:09 PM
> To: Yann E. MORIN <yann.morin.1998@free.fr>; Neal Frager
> <neal.frager@amd.com>
> Cc: ibai.erkiaga-elorza@amd.com; luca.ceresoli@bootlin.com; Maier, Brandon L
> Collins <Brandon.Maier@collins.com>; thomas.petazzoni@bootlin.com;
> buildroot@buildroot.org; michal.simek@amd.com
> Subject: [External] Re: [Buildroot] [PATCH v1 1/3]
> configs/zynqmp_zcu102_defconfig: bump to xilinx-v2024.1
>
>
>
> On 06/06/2024 17:25, Yann E. MORIN wrote:
> > However, while applying, I noticed that those boards do not have
> > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y (so my post-apply hooks
> triggered).
> >
> > I wanted to add that and point to the newly introduced
> > board/xilinx/patches, but that will not be possible.
> >
> > Indeed, those defconfig use BR2_TARGET_UBOOT_ZYNQMP_PMUFW, and that
> is
> > added to the extra downloads, and we would need a hash for that file.
> >
> > But the filename is unversioned, which means that we can't differentiate
> > between pmufw.elf from yesterday, the one from today, and the one from
> > tomorrow.
> >
> > So, when arbitrary downloads of unversioned files are done in a
> > defconfig (or in a package enabled by tht defconfig), we will not be
> > able to force checking the hashes...
>
>   We could re-introduce the "none" hash method... But that is perhaps going in
> circles...

What about the Yocto approach of appending the hash to the URI? E.g.

BR2_TARGET_UBOOT_ZYNQMP_PMUFW=" https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf;sha256=1234..."

Then pulling the hash off during download. That could also allow for checking other custom download types like applying the Linux RT_PREEMPT patches with LINUX_PATCHES.

>
>   Regards,
>   Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
