Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B796C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 08:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD66A8305A;
	Thu, 24 Feb 2022 08:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lN7jlA_dRz6T; Thu, 24 Feb 2022 08:56:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1CF383005;
	Thu, 24 Feb 2022 08:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15C031BF45A
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 049FE60B45
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdDW8dEEuQ_V for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 08:56:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::603])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AAD360773
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 08:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXUOsTFA/TOy5yiKQ5bntKWEa/8rcI43o7EXOicVe2N6cCR2DHcgyzcL2ovIe3g4rdiuRKjocvMzSnkAFmuSknmV48qXI5/2F3zBTtPhmqJa+S2yHGx5eq+4C7cKdlSN5bZHePsogocaMMLjYD5UoqzuVogSljL3AgBJrshV/jFjfxmZq2E4iW9DUtLiBjhS6XAcuzKhUzeaLzsWP53atcyvihXyeDAQ96lO9QtFu7WN1dBBM6hiKxYPryVGXr3Va87uLcu9SDZrGdHAqxC1fKkWqsVa2nw4p9zv83Udijjmea9vRYjvmhCA/duWPSjsNXwmTZ1GmLCGN5MHHgTjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUGeIZpeo4z+W4gok6l6dC/dcupc0pIrKuQL8Cqp7D4=;
 b=RDuZPZjiuMAf9Girpg1rIV+lZ7/4B7FBprFB5I4hexEOEJov2R1VBBk8r6C5SJyydERwFP399+nd98mg44dZBfCgQnEdUC6x2pN56Tdu2/1FSpt0pE3BB15zYdQzO08EMRG3FVHxOMlY47zRv6tM7YyfWccd4iuWcwLIpVHj1TPHF9MgXAcIL2nYD9USxjB9S1h3/tO/iO7GVQWkppkKE2Qa5nhs/eMZXgZoZUpKMID8kZR5ex0TXRB+4fBNZwKyPYGlt6rqQUup7SImp9Tbc70O+TfzsLJgnSl6uNDr/vtNgwozaUb27vv48cHAzMgIsaDUvwfX0a9HgjSLoPcbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUGeIZpeo4z+W4gok6l6dC/dcupc0pIrKuQL8Cqp7D4=;
 b=JbUrbndD4MKs3oxkzuXOwGYEjYDFRAkt0nsVrDR5Z3lpCHGEOgX77nDJhAtTWHIvsnPq/LHTGgW/fQJgaq5PWqQJvj03PcJ6jU+uhOM1J84uAPMnrh9MZdS4cQotcCfLYLGd9N1tuRTttxaBaQ8USxqaXqabXRq8Hisf0sHdHEc=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4076.namprd02.prod.outlook.com (2603:10b6:5:9d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 08:56:40 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 08:56:40 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKN+2jZNwNumen0au9fXDLnTh26yhkARNgAC0LDCAAAxaZYAAB44AgAAOwCA=
Date: Thu, 24 Feb 2022 08:56:40 +0000
Message-ID: <SJ0PR02MB77585A2E6C6EF8948EFD36CDD73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
 <87wnhl4ab4.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <87sfs84sz5.fsf@dell.be.48ers.dk>
 <158816b4-5b1e-1fe6-0e7b-6b289dd42c15@lucaceresoli.net>
In-Reply-To: <158816b4-5b1e-1fe6-0e7b-6b289dd42c15@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a96a555e-9515-4bf4-80aa-08d9f77392aa
x-ms-traffictypediagnostic: DM6PR02MB4076:EE_
x-microsoft-antispam-prvs: <DM6PR02MB407697B7E6AE3A1B5552BDFAD73D9@DM6PR02MB4076.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: weAqQC+QwrrZxUGlFPkFXpcd5kldc2KZj1NEsSIXyq6skEnzQLyni3VU48QvER7VCO1YJEH9H/Iq7IAjc3ZogXmY3TBDpF4J2WwMCcCVkDisg7iOFUe3wvYJIDHGvCgognl4Mf3IzaF1YFbT6LYjoUUnavfyaKMQpy7QaexVTWLCVJVR5WaIwMRFf0Ht3UOt+3DpLinyk90pBb9ddq4RNyCJpXZENHekxLEBEVL38NELFpTWaQi9kecnj6kVp1APHqXOI8z2DO6FWfbropZ8eboEEkNG2sXxczURWirqPolGpWcqgztQVZdGsMUT8Do0r4ye5gMBsZ5aqgUkuDaP1xrdyXbOswxvsHBjdiSaKjw/DGzCriHW1E8StB0lUHAQGza6aYjDnyaERVMAqT3LJJgIIKT3NqO/jm2NYenwvaoP6VKRwLJC2Ow4wLTqgmrGgw4AJ3+RafsmY34tNZmTMBlYbkeW9qtQUZbD9DM4M3LKprqpM6Ds++NkZAQUOMwN3dNVKW8+VhJyRGIRqNpgEqkNh3l5pPUYxCLgz0diJ2DugOV1bNZG7qac+vrigMzcr1fVB4+frX4biA4PadWN0n6ND8a6IT0e17jUd0kfI5hOlKJ3nscMrhUh8Up70N94QQf+Pm86EjPMu4rZ6K3C3pPPip9JvDSiSdW1jNMyOJznBv4LWP5kEquCafuN/5PcZI8QEsshm6qPudr/Wea/MA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(66446008)(107886003)(76116006)(66946007)(4326008)(64756008)(66476007)(8676002)(66556008)(54906003)(110136005)(26005)(71200400001)(38070700005)(6506007)(186003)(7696005)(55016003)(2906002)(9686003)(558084003)(52536014)(38100700002)(5660300002)(508600001)(86362001)(316002)(8936002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWdQRkVHaEU0am5DZ3Y2aHVMZSsvUGkvcnN6R05Zb3VlZUZiMTIxRitTb3gx?=
 =?utf-8?B?d3JydjJSbU9kZWxJUGlSVmxFRUxJTmhKYmtGSUowbTVzaFhXTXRtaXFWQVJr?=
 =?utf-8?B?RE4zWFFEay9nendGSG1jSWZPcFlId0tWemU2L2RZTlJ0T1ZQTEtYSk8vd1dw?=
 =?utf-8?B?RXBGM3hqTHBtOG9qM29EbDB3amlUR1MwUDhPMlpFN3lhUGZzdml0SHZvb0pE?=
 =?utf-8?B?bkVUV2pGVmllZ2MraFp0YlVhRjJFUlNBVEhFeUlsV3kzUTBvcGxXUVRDR0s5?=
 =?utf-8?B?UEMyVk55QUdDVXAzWFZicVUyaUJTNkxwbWhHcDdtTTRvcEpqUFM0Mi9uTS82?=
 =?utf-8?B?cGJnWVplVit4YzloMldKMVd4ZzFERFMybU1HL0pNdG1PNzVZVE84eWFPeVJh?=
 =?utf-8?B?dzBTV0dBUDdCQkxFbzNXY0ptVkhMc2FPSzFnOHpyWklkYXhuSXBkVmVSRmF5?=
 =?utf-8?B?eUFyeThFWXVWTjRCbUFsQ1NLSi9hUVBqblFYdmRubzRoREo2NmN0R0xLNjhK?=
 =?utf-8?B?RUVGWEVheUExMFJCTkdiTDFnb2xzOTVGL2pMR2xEREluNUx0U2ljNGttVzFZ?=
 =?utf-8?B?emxBZ2NPNEIrczIwQ1RwSXdGQ0JtaGJ6SGd2UzFMd012ZWhYNlhSd1JLK3dx?=
 =?utf-8?B?UWNJT1hmSWJGOEZxTGgyOWtnc0d1TDN2Z1ArUDVYb3VHV3g3L3RyZENGd0JP?=
 =?utf-8?B?QS9FWlFuQmZ3S0xsNndEbmNieHNtdWpVZHZhVU4vYnVhb3B3WGNRU2hzODdt?=
 =?utf-8?B?RUpJV3VOUFUyOFJnd0piTExWeUVSU1o1NnFJbXRsZUsrRGlRMTBVNzhzWjJD?=
 =?utf-8?B?cGZjbW1HMEw0dXJhRnFreXpkK1pQb3MyZFM2YTAya1V5ckcxZ2pNQm5HczlR?=
 =?utf-8?B?RXhITHNnS0JtR3cxdzhFdnJOSWIza0pEcGtBQlpVUFlzQlNIbjR4M0dpckFi?=
 =?utf-8?B?RlcxL1BER0dkUFNhZ29BWVNNS2g0OHRnT1ZZMXVMU2Jyc2tOUlAwMWtSZ01N?=
 =?utf-8?B?SmVkSkw5MGwvN3hxc29YWFV0MUJHbXVndGwrRGhJaG5VRmJjRWk1akhNUEl3?=
 =?utf-8?B?MzNrejNpOHpuTFp0d1l4Q2g5ZzVjRHBWeTdFRjhQdTkzQkRqdUhJd3RDQmtq?=
 =?utf-8?B?eGdJUEZpOU5uNTF4ektBdkZoY2xjVzVJNkd3Q0lYTnhVYlljRDRKOWdJWita?=
 =?utf-8?B?cWR4Y2ZQdm1oUHNycmNRS1dJRUU2VWRjbHNya2FoNkVSSERCMnJremE2ZHdk?=
 =?utf-8?B?VnFlcGl0T0U0UmtVSGk2N3o3WXpvcisyUXR1U1ZnK29lTXpyRGxzZERTMmtB?=
 =?utf-8?B?RHNpQXovdTBsdjVUNGhPYk9kUXB1UERNa05kaDM5UmRyZUp4S0MrckZMblJm?=
 =?utf-8?B?YnUwWGkzKzNlL3dFRW0ya1pZcS9JbDVRMk8xUHBpRFVHb1hBVG5YQ3dKajE0?=
 =?utf-8?B?SERKbDFiK2EwdVdmd1VQOC82L1JicTNXdFZFVXFSbXNxbmRjR2lrbWNPWXlT?=
 =?utf-8?B?Yy9JSjhVdkY4THNvZEZ0SnAybVZKUmk0UFdJcEIvajVBcXV1R3YyR2EvaUdW?=
 =?utf-8?B?UmVzdXUybzRadHgzbGNYVCt3UURNNDZGRUFRVUxDQ00wdU5CQXhSeTluY2RW?=
 =?utf-8?B?aTJ4OXArdHphTkhSSGJNdXhtWFdPL1dEc0lkb0p1d1NQc0xESHJZSU54SWZZ?=
 =?utf-8?B?T3Y1d2U2OGVONFFMRWdGalJPVGIvc2FtU0huNUVDQnc2amFON045ZnUzcW1J?=
 =?utf-8?B?V29uVGxNaDg0VzVjRDJVTnVOcXMxcDRhUDJiNGdDamJRNEVLQlRNdFlxL2tv?=
 =?utf-8?B?dXBhQXJrbUs4SGZ4b3N2Q05QUzBHY2FjTkR0UTNXRkVpa1ByY2toNnphdjVy?=
 =?utf-8?B?UU1UQ0Y3QnlWM25SZThCNkh1SUErbEt3V1BMNjFERTBZRU9DbDliWmVZNTdr?=
 =?utf-8?B?Q2w4c1IyeVVuZ0t4ZHQvUUtLTC9EcDgwY2ZIcUpBeWRqTFdHbnpRdjJiZDN6?=
 =?utf-8?B?bGM0T21GemMvSGpPZXBnQi9US3hrQWphaFV3RXpYcDFyajZEbHFKa0lkQmRl?=
 =?utf-8?B?NHdjZEtaQi9wN3orcm1ueXUyVVNPZnh6VlZZMGtoU0hYbWdmSFBWSXpNRW83?=
 =?utf-8?B?eElRcDlDZ2VUU0dJRnZqMFM3ekJpSXJseThhOUo5NHJjZThtNGNFTGZXcDV2?=
 =?utf-8?Q?82NW2thYCIR6+63K77g5DUA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96a555e-9515-4bf4-80aa-08d9f77392aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 08:56:40.2645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hE9pxmhxzpPj+DjU6HK8WZIsqLMhwZlVr1dSnvYJsUs5gnLgGyEqZhCoYVeKnUCgNKPbDl1Tjnstcsa6l9BvKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4076
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> ...and here too.

> Thank you both!

I am glad to hear that your pre-production ZCU106 board works with the latest software.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
