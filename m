Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF06C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 09:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C336E40278;
	Mon,  7 Feb 2022 09:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2GFXsZ_gH7z; Mon,  7 Feb 2022 09:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E8E040240;
	Mon,  7 Feb 2022 09:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84B7D1BF389
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 09:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6976640240
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 09:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZ1kfXpfRNsw for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 09:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7697E40104
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 09:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+lgz6QHFiFCNKCcFLBm6ayiOSCA/P70tDWMbz4XKU+yEWQi75ZulgHQQc0EGpZCseeTqR8DeFz1zvotmiJUpCY6oo3sVJlD/HVNr7tHE8CbhfvUp0fwcLyA7p9vtieldKQ0R173OBW9pthBuaNAEI0u1ra6k53IsZhyLb/Qh8pHvNTDOQZsRKO9v/KxxUvbL7yDHmsmdavLjnG/Y5kB5leR02Cy0MlPkhRYIrc47yusCKplqj+nT6kGWWEtU1ppyz2oCSsj+AkdY0Ma6DMiNgAidX2IUFg4+lH+DLkJPrkR3DT2qrPUM4wJLh0/+WIABPegbJW2Zq931ed+EIsHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqx+JybAViVg0ArGFAsd3/FmOwLYlow7JTuyBK65bzg=;
 b=DpVbY1joxKmuAB64TmRAXQx1CYHj1yUGub45YjB78tKED0CLo/61LOFRabK7DWyOPoa6M0LsfgN2LvO4TFJVqzh25DTo4uCKtK5oYoBbwAVW6sUooDRmJcmWmLhetePkRcWyppxMjlUgfTSWxpl0wfNV8dG6g6eIDn64Jp2YhTgz2kzjbDkPFF+oofMbw0Q3h/6SevA4jVUE+tTaKghu7UEispMJ1JSZNqCgun/KpS9g4M0KZmCuH3Ekb7tdRT06HM4wR8gi28bk6QquqDYNIV/izDdkEpVVHJsU9BZM4XckoVw/ZV/z273ZCsia/E03WN4Tzob8H4EDbxl/scvfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqx+JybAViVg0ArGFAsd3/FmOwLYlow7JTuyBK65bzg=;
 b=WhDduE4A+AUGRZnKHh0fumgr4PxwAVHf09pKeFRiMbhl8n3UF8bRCdvPm8BioZSxZYrnM2nejuyxmgGiYA/weV0lOVXwwbWJUKAul2BKa5zGOYU9tRQ7r4wbKSqPhxV1vXqU/A73PB62sgyHQrheBXG0NTR/QWqzn/CREBv/haM=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 09:34:32 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:34:32 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Thread-Topic: Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAAAykJoA==
Date: Mon, 7 Feb 2022 09:34:31 +0000
Message-ID: <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
In-Reply-To: <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 172f8c09-ebe1-437d-24c5-08d9ea1d0bb1
x-ms-traffictypediagnostic: MW4PR02MB7186:EE_
x-microsoft-antispam-prvs: <MW4PR02MB718637BF13612A551E48F436D72C9@MW4PR02MB7186.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twG3TURj3ya60/7WFv7ReT/zPsDMZUaPlcYuOTGjmR2Cit7J6Vc6aEjfO6uazXJ4IOvTMEMoK/t2JpUrw2Lgj7Ifds9JnPF3sIvsSi7iTvesVpb+4d6v9fEq+92pmFwWEbvJ6f/5V9ENU/HMMLYQaF+qIvtG6c3nH+hSOwJObVmYeDgQTgkcWx7cHcWxmnlGMispyN/bpZMMPGX0EATxnZeotPA4NY9LBX5cDn9LWP0IwGahADpwAIhxw2U+I1E2WatwdO+CPGY8pyu8C4OVLikxO1gds7wPXiag1+lcCnGfKnKwFHru3YBw6pc14mjYmQGIbCCnzmf9BllFrYU2KY2VdqhyAq76phhm0uIy1vRZGZMlJM3l8+0+wOkh9vmUuzhlmodF/g7rwhy2AgObDpx+bLYQ2y24gfwEVubqeYpB6xWsSY1LwsRwXFYQE7cdjuiIUpT/GSEffGpNAshZB7Om3LDmgzsSCc/fkhl+ty4SbTA2H0AUn+rpMCOtLqp1uGnhFEuGyc01mKiM9T6MwdWywNjn3x8+MtCyOPB6Ef2GcTuB8ly3eFnXccjZFDa0PxrYdu+cjmrfm+L1WOI3HSoHpymO6fVjGRsH0/HsArIGq9DsMoSXDGMLis5JvqPHnfMNrU1qaYEq9/6RxXm9qPKgH1gRAhYtc0Ts5rsAL+c3OdxjS2nGL2i/ByjkUiYBy6JDIGEzawg+KoE6sKNI6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6506007)(7696005)(2906002)(53546011)(9686003)(8936002)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002)(110136005)(122000001)(52536014)(508600001)(38070700005)(5660300002)(55016003)(4326008)(186003)(26005)(83380400001)(86362001)(33656002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjVBblZNS1Q5anM1cktMQnFPa3lSZXk5WStTUTZwMkNEelcvVHhscHAvUjk3?=
 =?utf-8?B?N1dZWjdFSFhiMzlZSTNER0NMb1M4Y2xoakNrWU1QeEx1NHB3aVJLbVhaeTFq?=
 =?utf-8?B?Zm44aVdzVGNPVFgvWFBrNFdqSHI3ZXlyV20wdXYvTWxLb3dYZUVLMUV3Rzho?=
 =?utf-8?B?UWduRkVETE9RUTluOExadzZvRDEyODVYcFIzVFAyQ3hYK280Y1czZ0xMQTR6?=
 =?utf-8?B?MnRDYWU2TjVvMmtXSnMxRHZnOTU3Um9pLzJWTXdUZ0s3MzZ6a3VuTnNFUnBB?=
 =?utf-8?B?aGs2bUwyMlFZb1FBdWxIeVhTZGxYVkR1cEVrRXZYdnVva2V4bWVtekQ3ZS9O?=
 =?utf-8?B?ZTRJSDMxS09XMmNXOW9xTWxzS3lVc0t2eHFMUlQ5djVEWm9TdCttQkdxWWo0?=
 =?utf-8?B?YVlDS1JWUWpoRjhkWk5yUDR3cVdKYmhKUWdPL1ZqeVYxY1p1WXNRNmsxMVB2?=
 =?utf-8?B?UEh2WkNLaHBNY0VwNTFNNjNwQm45My82d3UrclAzeTBueGtvWEpidG9nK0Ur?=
 =?utf-8?B?YXdxdG9qMU1TSGdPSDlsdkc0M2JkSEVreWowTG9EN3BtMHBBb2IxMnlSbmpn?=
 =?utf-8?B?MUJSdWJBRkpBOHR5N1ZEcXAyeUpvMHBKeFphM0xvc2tiMnVaM3RHT1lvSjZJ?=
 =?utf-8?B?dGlySFRWQ1VFL3JtcFJtZ28zamV0d0lCTHVyblZOclFjQ2o1SEhQekxRSlNQ?=
 =?utf-8?B?Q2VEdE9TUW1xMS83aSthbHRyUitaejlOZXFVb1pTUlFlckwxUGhDeHhhS2hk?=
 =?utf-8?B?WjZUTmlicXorZVE2b3FaQnpuZ1NGRXpGT2oxbHc2MVYyZkovWm43L3planBN?=
 =?utf-8?B?VlpxZXp3aU9pejg3S05TMUFtaEJRR2VTb3QyQTNyWEp6c3RsK2QzUVE2cE9R?=
 =?utf-8?B?NEJPV09ZRWpINm9iUXdvTFhNWkhGWWVZWDBoUmhuKy9FNk5MRnY3UVVEMVFh?=
 =?utf-8?B?dE5CMmc4eWFkbk0vN2lMcjk1cW5JbmFkcTBadms0WUN2S25aRW1OM0xOemdu?=
 =?utf-8?B?ODdtRWxFZWl6d3p4dGl2MWNvdU5qV3RXZzFTakVhb3RpTXNseEt3V1d5WkVx?=
 =?utf-8?B?REcydVdEY0t6eXM1QXU4OU1UY2JtTkVIOGxXeWNocGh3ZUJnZmxhRW1NOUph?=
 =?utf-8?B?ZDhKb3lrWnpCL1dZT3ZsR0k5eWs2S3Z1bnZiVUtLaG12RmtCTmx1UC9qV2ZF?=
 =?utf-8?B?aEZ1Y1ZIc2NCUDN1M1lqT1hORVN1QnlJTUlDNHFSbml1dm1kaEk5QmtFSnAv?=
 =?utf-8?B?WmZmVU9ybXByUklVcE8wczN4TC9kZ2tMK1FqR2hidTV0cGI1NTBJOWhSN2pK?=
 =?utf-8?B?aHA4RCsyQU5lejRvT1BLUXVSRGtPc3NJVTBTdUErU1kzOUFVYk9WREh0WXk1?=
 =?utf-8?B?cnBaNHYvdnJWOFVsUWY1KytEaHlIbzNwdkJGTTN3cWNIUzJWTEVTcUROT1FG?=
 =?utf-8?B?bmZieWZxWEpSaE5HU0l4VGJpOUVodUl0VEU1Zlh0RHMzU25JMTBvbStEbnVW?=
 =?utf-8?B?REJST3J3eEpiNDBDdmJVUlVyYmdFRFpmeWl6c0JWbDJySXNYVTlqWEV3RUcy?=
 =?utf-8?B?V2JQOG9Vci92Ums1dDVRRXUrcE9wQitJWUl1eWJSYy9RR2RCT1U2aHc4TlN1?=
 =?utf-8?B?RFNPbTdsYUVuWDJNRFRHUVlwTFJoVSttYVUrYzJ3eG9xSzh5UU9ySXdVd1lM?=
 =?utf-8?B?WHROa1VhVmVqSzNKMVJlU2daVmhtZktSTUdHWUJBTTRzSGFDM0VOYUhzczJP?=
 =?utf-8?B?dGtlNFJqTTVRdGt3MjJBSnNsRHI0eFkxZ25QRUxyaVFBYVBaSElBVm5YZDB2?=
 =?utf-8?B?NUNab21XRHYrbkVxb1o4eTFiRW1JMVpnNDgzRFN4LzBKSHErVlNFSHZHMnhX?=
 =?utf-8?B?OERLTUNmcVZ4amlwa3ZweUtsMnNWTGNKVUFMa0orNm9pcFRZaE9aWG1ZL1Ew?=
 =?utf-8?B?WlNtSFhRNHowc1JCbVVNTjdmNkNhMGxFNXNKNGhZdThXQ0FHQk0vcWNvbXBq?=
 =?utf-8?B?a3FTdjdMbFh5eEs3dXJJVUVXRlFQaTAvSFNWK2xMa1NtclhuakVkS1QxajlO?=
 =?utf-8?B?NFowdjRvYnBtdmo2S2RHQVU0Rm15Q2lTRDhGYmJOanFqK3kvaGI3SDhLYzZw?=
 =?utf-8?B?QTNETVo5NTVsbzA3NWx4bmFueW9SRVZwZFVjVXZveSs4eDFjZmwzN3R3RUR3?=
 =?utf-8?B?Vmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172f8c09-ebe1-437d-24c5-08d9ea1d0bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 09:34:31.8089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86j+Zv72jxbWbSEt66Udi6gV0FDEVRZPAgsacu/dNT1qo4pIcpwaTxkcrjUkc82v3iD/mAxBZ1K+4O020IrbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7186
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding buildroot ML on copy of discussion:

Hi Neal, Giulio,

Neal, it's better to send technical discussion e-mail on the Buildroot mailing list: you'll get more replies, less latency and other people can benefit from the discussion (now and in the future).

On 06/02/22 23:20, Giulio Benetti wrote:
> Hi Neal,
>
> On 06/02/22 20:27, Neal Frager wrote:
>> Hi Giulio, Luca,
>>
>> I now have a version of the defconfigs which will at least build 
>> cleanly with buildroot without requiring any manual steps.  However, 
>> in order to get Linux to boot and login to the rootfs, I am still 
>> doing two manual things to make this happen.  If our goal is to make 
>> defconfigs that just boot, then we need to find a solution to make 
>> these two manual things included with the buildroot build automation.
>>
>> 1. PMU firmware configuration object.  Without configuring the 
>> following U-Boot .config option, the PMU firmware does not appear to 
>> be working properly.  I have been fixing this manually by adding this 
>> configuration, rebuilding U-Boot, and then copying the results into 
>> the output/images directory.  While this works, it is not a clean out 
>> of box experience for new users.
>>
>> CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE
>>
>> Is there a buildroot config option like BR2_TARGET_UBOOT_ZYNQMP_PMUFW 
>> available that can be used for configuring this with the automated 
>> build process?
>
> There is a better option I think:
> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES

Even better, use BR2_TARGET_UBOOT_ZYNQMP_PM_CFG Buildroot option (Bootloaders -> U-Boot -> Boot on the Xilinx ZynqMP SoCs). It is specifically done for that purpose.

--
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
