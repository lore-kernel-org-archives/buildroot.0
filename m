Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA31C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0EA402B3;
	Sun,  6 Feb 2022 19:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0zyjfJboNxP; Sun,  6 Feb 2022 19:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B3F402AC;
	Sun,  6 Feb 2022 19:40:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A40F21BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A076F402AC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcwGMfAOv8PI for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:40:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02A284028E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644176402; x=1675712402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kM4wf5vXDKvSO9inq0grhpbP/AWzek7fBZ1AmZ+SBFg=;
 b=hNh4g40Rb8a8pVsJBMaLPW7yR01+Oc1B2IKtkD4is5Td2VwrJ9Ek9vGs
 cJqliYFDwXO6o5bfDmVPmRoy/Yg9eabmXYPpiKWnHtcDjIdhSDTifqYLM
 DIxMSkC4X+kZVPyfD2dmP8tAvZwSj1PxYiNxEbRSTbJz6dW1CtbgDChxT
 j9wm4r2cxEQNmEzLD8UPN/1wxVWujzViEQruhevvnJ1gdQ9vWtzeS35PN
 6LsEV/5yh2Rw0hlQLdUY8c3RWfjIRVBw3gPPVXkomET1RwM7/aClZwbep
 wp8qORAmk8QHu+cicmdvua8PPE+wZng+6bE3ZaIh2oV1RaATbHrvsT6y3 Q==;
IronPort-SDR: BhlUH+knVf+COuMXP8GYFBqo7Fd1XljW9OMQy6lNNOICVatBKnVIDat3OuTeQsV+xahM8hBY+X
 JI3JhQiaSw14hALIZLY1Ulx/O81hajVIP1kzQWKIsUDQMPY+D4UJb43TLfxDkrZEt51GrvTcIU
 fUIo7+UgBV5RDxgziPToP8LmtrsD66yxCMp1FoutvMW45jj+ugdnsFYBrja4JwBAiqyymROPQv
 4Gh+oqJJim5rU8nkDLgFDbYpzmkVGcRhqf9sg7TWZ5gsXrDABcAsjafNEPWBTNJaAm8EDoQd+z
 ZxbZ+XSsymlkPEHL4qtVmxZU
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; d="scan'208";a="152101187"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Feb 2022 12:40:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 6 Feb 2022 12:39:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 6 Feb 2022 12:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZLHUrCAAZHCODk3fGbkeukv3gjKzmxuRZvfEhzedoO0quXcs54+86NEl9VITB9EFGNGjhetNrJCmlkAXmm0sR70ee5PhpTL3HWG/V/Jv4+zVFkJ/0QJ8s37NeoyhKkd4nftaN30ym6W4tTECYiSDtDv8X519vvBNcs33hsSTDJ5uYd5D0bmpKCom4Z/kXKVHm3b/7cMBU/azWZebHMiuBCB5y24DU8H/NOFI1iJLx7t2rLzJ8uqYf1su4Ds5BBRD9LIcgiuQ6rec7wuz5SdZ6pyF+RF+JNWCy3r4zMt0KhvIf23t0J7Ek3ZD5UZiTbrAo3vc2URQF6RGNokOxa+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM4wf5vXDKvSO9inq0grhpbP/AWzek7fBZ1AmZ+SBFg=;
 b=KiAnCiUCewhZxXziQiBkucPTw4dAxUIhcugIc+gFOLXImHiFmxhoyye9+Jg+tsjgYVsSvvUAq2pP3CW7bXUPeE4hbpWgWHdhvH04f6PobTIPrJ7p6iTVCTHdgz3U6gZs1FTU3txOQAw6/M6GLF0xLlynyaKqo9/veiDsD0t7owNG1+NVzQ2db8Flvv/ZrsDfkKFi+yMsXve45sYW8dOZ6YslCHEpcFAsaWUZimYlaS5LA1fCWQSPccSnAQbewQmThE2IFqyLnimjXowiBNX5L6za1SnaEC9k77kq2ezolCsCeFsU4ElbhfUMl8Ucvqmy8z+kHLjvKp96Chx2VseZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM4wf5vXDKvSO9inq0grhpbP/AWzek7fBZ1AmZ+SBFg=;
 b=XLV30yXoZMumlXG6nE46Uy5LpnFO0ix0adS3XDpsuqORaEkwzc3nqYHXHQa40ztN3+lkE2Al2QakcSLIitiwD/kb68+V3F9/5XI6NK1SXl10nvOLQadcICHADjNkgLGAtRtMDlY7MCdbNIe3d099Ck/Bqf0YnyjJArpGlDe5MkM=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Sun, 6 Feb
 2022 19:39:48 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%6]) with mapi id 15.20.4951.018; Sun, 6 Feb 2022
 19:39:48 +0000
To: <giulio.benetti@benettiengineering.com>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v3 1/2] configs/microchip_sama7g5ek_mmc_defconfig: set
 custom linux version to 5.15.21 and add host openssl for linux
Thread-Index: AQHYG0xlPHryZVg9uEi3K64w4b9GS6yGcEQAgAAkAoCAAFe3gA==
Date: Sun, 6 Feb 2022 19:39:48 +0000
Message-ID: <0f8fcb54-806c-fb0b-27ea-38eb938a725f@microchip.com>
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
 <20220206131656.16e2c8a6@windsurf>
 <febd6a86-7b73-7263-ce66-2056fa102342@benettiengineering.com>
In-Reply-To: <febd6a86-7b73-7263-ce66-2056fa102342@benettiengineering.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24077c67-e2be-4201-c910-08d9e9a86f6a
x-ms-traffictypediagnostic: BL0PR11MB3282:EE_
x-microsoft-antispam-prvs: <BL0PR11MB328221E7B411AD2A538F7AC5E82B9@BL0PR11MB3282.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+HJjIPzilYRyNjSejjPcn01YLrlQE3wYbZwdFgxN0nvsYBYhEHXwRbu8YuhV/uZDF7l/uvvE/Vqt3CA9MbjIkbTIlwHmeclPlDE1xJ9Kaynz5/BwFCmDWsMM4qj1JKVErbEyHtrFMc/KKUaT/bsZ45Arm2NLBkddkzmuqDShFmbFftlXXe9vA8AmlpPc0d3lD6CPkcgveR8p2M4ww8Z+8NsLqSy/3uVGlk7cnKaCYKgwkXQg03bbozSJulrKdv10Lii92yp3fPi/qia+Vpqc8ETF0pXWMwvH+4ufFVaTHwHSwX4bQUjIp2LaqPiB9VOamPzV5BhVmvs3iJYoyhnaD4ULsCGbAXGmAb3Xt80uNe2tWu/gg8Lne2+URSFlf+cVS6TT/I6+kIQLLw56z040KJqRaGmyMUOAkPtKS1VO8Ts2O3mwA39BWISzn6ELnrkaz7MHTmzFGViCNMGDR3WQeNsnWRDwztDeggE/kHxHJ5mBpRIrU0hlk7AUma80kwQc5zZRDiltO1jINHezno+6oa1i4TPjVTyFn26CxXM87Xdhifi0Q/iB2hONNskzACdpbv9w3PBcEv/a5jBpOb2c+w2CkdBgmDL7ATJXNra+eOA0oRxHbm7so10R9m4yiFoDOIwSwhbQTDlkGWBwvLwo66IJ0ym70mc0zhj3znXjzqHdfYXxe+XTNPyu/4SAWy3AH9dMjfjYbJ3PgQ/hif6kAwOw0SvXIiRI6LOuODDPOTRnMI6/Nn8bNQDDoQCo+jWeBZrTx+HannlcVxqnDLteHv1XV7b1vGqkB8TgLe0mL2bTWU4Kes3l5WVfAWCZbfghGFCRxDnS6lucV/af5L0NMAUB9zxckERNAq6LgfclWE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(6512007)(966005)(122000001)(54906003)(2906002)(83380400001)(8936002)(316002)(36756003)(6486002)(508600001)(38100700002)(31686004)(91956017)(66556008)(4326008)(66946007)(71200400001)(107886003)(66446008)(6506007)(76116006)(64756008)(8676002)(66476007)(26005)(53546011)(5660300002)(86362001)(186003)(31696002)(38070700005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW1PbzZPL2VhTVgvcFZRUW1LMkNOamNkV1hEb1diL0h5emZiR2JPS2hWWGh3?=
 =?utf-8?B?TzN3bmJ3MEVnWjF4REhCU2pQZmNocHpCdGtPcHh1SXI2NkRhamc5bDM5Q3JI?=
 =?utf-8?B?NnlzV2pZaTN5aGltS0F1ZkVwQ1JNbFNYRnk2a1lCWlJtR3ZQZ3ZCSGZzNmlD?=
 =?utf-8?B?bHpQbGdYUHFFMFJ4UEtMNUg5VEtsNzhDcWlqU2hwcUdaVEhXUlJFY2VOU0Nt?=
 =?utf-8?B?QUFjaDF3ZjZlY3FGL2NMZGVNaXBjRTE4S3BVa1hrKytrS3FDZDRFY3N4U2ZU?=
 =?utf-8?B?dkdmOTJLTk8xa25wc0RGamdMRm9NT0paR3g5Z0owSko0bHhJaFBTazVBRDJ0?=
 =?utf-8?B?NTUwa0doMnFHNmdWWG92RmtSeUoyQlIwUHdqS09OWjJCMTF2SnROYURyZFMx?=
 =?utf-8?B?NGNoMWpzdCtoM1BTOUlZTExtZThLNmRGUU1xRkVncjF2WTNqM1l6ZFBhWmFn?=
 =?utf-8?B?eExTeDhRUzVEa1RyOFhLeEt1VEhpUkVRWUtDbjFSNjFyTitDWFY5cC9mZytC?=
 =?utf-8?B?N1hrMU1VZFhRUlVNNytEN05TZTZvZDY2ZCtxYVB5OXozaFFDYUxrQ3hJbXVT?=
 =?utf-8?B?enk4U3FyUGFVRTdYTW93bnpLSkpGZ0FkdjRsdnRPRVRFQldZM2dpcWdySW9y?=
 =?utf-8?B?a2xZYVpxMjhMWXFlaWsvVTZ5VEo3bFBLRGdadlpRaERFZVQ3WUJPYkRBamsw?=
 =?utf-8?B?dnVPV1ZIank2MCt4QTI0aVk3N0Z0UDhHZEd0TjA4WExMOTFreDhMclF5VHpa?=
 =?utf-8?B?aEkrTElRNmtFalp1aGdva0dXWW1GTUN1Wld6ZEhKaStDU2dyeHo2NkFMbjBq?=
 =?utf-8?B?TEJrZnRMbVcwNnRENXcza1MvcHJ2MmJORGZRVXRmU21BSjM5cTV2NExud01L?=
 =?utf-8?B?akNIeVFRTnVlblgxMWswZmtzcEExL1RQMlFyVDBtS1ZvMEFyUUNoVHArdDV0?=
 =?utf-8?B?T2NVcnNheERkcmJiSVJLZ2d4bW1TZjA4N2lHWDN3RmpCT1A4L3J3TVloY2pD?=
 =?utf-8?B?T2NNK1BhTHNFN2lyNDZyb2pSeGRLYldwcjRxdU9OQkhoL3ZDMU1VK2F1T1hm?=
 =?utf-8?B?cWE2NlFCWXpNMVpsTEgyWXlFbU1RRVRpYmRTeXo0T2dVdnVCbEJUVWRMYklC?=
 =?utf-8?B?WFJOb2ZoK3IrMWRXOTZheE9hZEJzK0pSazN1NFFGSXJrbzR3bXc1SkhwRWVW?=
 =?utf-8?B?cVdYeFpOTjJUK1NTaFJKaVprWUVubEJpOCtrdFBuR2I1NmtRZ25lQTlvcWl4?=
 =?utf-8?B?eEQvRkk3MGhuM3ozMDlSWDBnL0JQSTdnL0ZJYll0THdXSzVUcFJOb0R6L21F?=
 =?utf-8?B?SDErenIrRjhBcjF6eC80VWo4bEx0VmZOYm9ZbjFUYjRHWGpMU1pxN0JVeXFO?=
 =?utf-8?B?ekZyWCtjd3BVZnBwblJiajBmbEF6QWR5dDBaYVFEdWo3cU80T3hobFFrWFph?=
 =?utf-8?B?bG5ibDlYVkxpYjNLTmVLUHVVbVlvK1JYd1pPb0hzaGgzeE42Q3ppbmgwTXJT?=
 =?utf-8?B?SzBUZ1lNRkRGTmhIV1FDaXo3Q0N4bzBoZTltV2hvbTdWVmxBakcwNmRsK0ZX?=
 =?utf-8?B?QWpSWk9LREJkRXVtNHZTcEVnMlpQSGNwUzE5eERUWGJVZEZwdUJ5eHFzbGx2?=
 =?utf-8?B?VERHY0JubnR6SjBhOFEvQTlFblNoMWlpTmpDM0dUSXg5ODVZUDhLb0JiSUFU?=
 =?utf-8?B?MFhyT1hydGg1WUEyc3VWR1RSdDJRTFFhRFZIcTVOdG5naXBmMytOWXlCYkx0?=
 =?utf-8?B?cUwwcy9KWUJ3c2dHOGFPVHdaR05GcG5LcFZwWHliK0RkRnRWRUV0aER6QnBw?=
 =?utf-8?B?bEtiRERqTXNXMDFFZnlvdlduQkN1amEyTDB4UjlNZ1A4LzhYeEV4NEd4LzJW?=
 =?utf-8?B?K1g2QXRvODlQTHdoM3VkU1pic0VveFdtZjJxRDU4L3BKSzMzZ1NtU0R6K3B5?=
 =?utf-8?B?MlZ5UmxraHVUeE5aMWo2L3FTRFdLOFFWNXhuU21zdFZ6alEvY3RzSVV3VFVK?=
 =?utf-8?B?eGVLQXBHdVJwbC92KzdyOXZ5ZmMzODR3cEdOYkc0dktDdDhCTWZoM1ZwR3Q1?=
 =?utf-8?B?MGhNYlZIM1F1K1JJa1BiaHVMSktFSnpkeDdPV3hkVlJYUnJQeHJZUU1CWE9o?=
 =?utf-8?B?em0xMVMwa1g3aGRzMHNQeC95VG5tOVpvanVpM0RXWWU1b1BWZXMyTCtIOERj?=
 =?utf-8?B?UW1ZZlg0NHdqMWxkVGFKa2hkTjk0aXg0TkkybUF5UmRkRzRTMjZEcUFmc3pZ?=
 =?utf-8?B?aWZtWjJzaFhkM1NnN0g4WC9WV0FBPT0=?=
Content-ID: <2E60B9911080A04E82CE774503A0709B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24077c67-e2be-4201-c910-08d9e9a86f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2022 19:39:48.1745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3a89cyoj7uwXcPPXmSTvgpJWxAgVfsMFMaZXhyUvQQEhpMu+oSIwNI9SC6JYBGHUdHThvo1q/N8K5VE3tUsCNyOhE3ClOgJHX7rNv77g25I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3282
Subject: Re: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: Ludovic.Desroches@microchip.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi82LzIyIDQ6MjUgUE0sIEdpdWxpbyBCZW5ldHRpIHdyb3RlOg0KPiBIaSBUaG9tYXMsDQo+
IA0KPiBPbiAwNi8wMi8yMiAxMzoxNiwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToNCj4+IE9uIFN1
bizCoCA2IEZlYiAyMDIyIDEyOjI2OjE5ICswMTAwDQo+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6DQo+Pg0KPj4+IEZpeGVzOg0K
Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS95bW9yaW4vYnVpbGRyb290Ly0vam9icy8yMDM1ODIxMDk4
DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlA
YmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4NCj4+DQo+PiBEaWQgeW91IGFjdHVhbGx5IHRlc3Qgb24g
SFcgdGhhdCA1LjE1LjIxIHdhcyB3b3JraW5nPw0KPiANCj4gVW5mb3J0dW5hdGVseSBJIGRvbid0
IGhhdmUgYm9hcmQsIHNvIG5vLg0KPiANCj4+IFNob3VsZG4ndCB0aGlzIGJlDQo+PiBkb25lIGJ5
IHRoZSBvcmlnaW5hbCBzdWJtaXR0ZXIgb2YgdGhlIGRlZmNvbmZpZy4NCj4+DQo+PiBFdWdlbiwg
THVkb3ZpYz8NCg0KSSBjYW4gdGVzdCBpdC4gRG8geW91IGhhdmUgYSBidWlsdCBhbHJlYWR5IGRv
bmUgd2l0aCBpdCBvbiB0b3AgdGhhdCBJIA0KY291bGQgZG93bmxvYWQgPyAod291bGQgY2VydGFp
bmx5IHNwZWVkIHRoaW5ncyB1cCkNCg0KSSBkbyBub3QgcmVhbGx5IHVuZGVyc3RhbmQgd2h5IHdl
IG5lZWQgdG8gaGF2ZSBhIGZpeGVkIGtlcm5lbCB2ZXJzaW9uLg0KVGhpcyBib2FyZCB3b3JrcyB3
aXRoIGxhdGVzdCBMVFMgc3RhcnRpbmcgZnJvbSA1LjE1LiBDYW4ndCBidWlsZHJvb3QgDQpqdXN0
IHNlbGVjdCB0aGF0ID8NCg0KQW5kIHdoeSBqdXN0IGFkZGluZyB0aGUgbWlzc2luZyBkZXBlbmRl
bmN5IGRvZXMgbm90IGZpeCB0aGluZ3MuDQoNCihJIHJlbWVtYmVyIGJ1aWxkcm9vdCBoYWQgc29t
ZXRoaW5nIGxpa2Uga2VybmVsIGxhdGVzdCB2ZXJzaW9uIHRvIHBpY2sgdXAgKS4NCg0KRXVnZW4N
Cg0KPiANCj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBpdCB0ZXN0ZWQuIEJvdGgsIHRoaXMg
YW5kIHRoZQ0KPiBtaWNyb2NoaXBfc2FtYTdnNWVrX21tY19kZXZfZGVmY29uZmlnIHRvby4NCj4g
DQo+IEJlc3QgcmVnYXJkcw0KPiAtLSANCj4gR2l1bGlvIEJlbmV0dGkNCj4gQmVuZXR0aSBFbmdp
bmVlcmluZyBzYXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
