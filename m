Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB78C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 10:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0459640B62;
	Thu,  3 Nov 2022 10:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0459640B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lp9iVPMcDJgg; Thu,  3 Nov 2022 10:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 481E840497;
	Thu,  3 Nov 2022 10:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 481E840497
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41EA21BF317
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 255A940497
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255A940497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBO-BefOXYVq for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 10:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6DC44039D
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6DC44039D
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 10:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xp++TZpdUrzE5MyZ0JMGOwJ6Zgs+QWBSS/TI5mWEZ00BOzZWSRUecSVN2+b5/0AxcX1Tx81Pmatt2OCG4in0PMZwBgNjyxoZVfBBOkrc6Z1kuVS5Xh/xXGktLm0sQ3FLQd1y49UdOOiVzN0U+StDPRS6t/atLSHvYxKNKdcnTZP5U89HIw9SOzdASsERckKeDrp6i3093+HaxkGngfshOMlzFlQ2XnvQ3jgDlLNniPlMuWCEKx4TJ67ndE8tHnqtGQCyZcC2Zn8dieU/5f79e/EsYLzL88qH7dwlXpUoIaYetDa5/T+0DEO896bM/AMhBsuhPAd6fJZz0bQOwT1jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kG7SxtOAbO7nYjFXjqR6c06+cdFkIaBLQGyA6d1knE=;
 b=V13Z23H6eWAA1xenZ0Ms6p0GMYx9yiLerKWobqmmvTUITbzOqDPJDG8fdJ6XbVm2HE+whhvh8Vyn7LNMR8mjdHLvUC1pIhDS5Z+JB9LygBZdO607slN5h7OxswS4w1UnGsPgcJAX+jpJchXe8Uc8zpjmOImyFe4sYSTInBD0ZLm9Xo3BnoCro0K1YcBsFisTbmzlpUQgyqjB7t2t//vSYjIbiVR2Hn6NpUIhA2W3O5BDdhVJiZKXAA3bVsk7p4u7ABIEtrVSWMjCbEMtEbvHQf03sJoD07oKbbixs5iQnvKbqngZGLnh/qXmYBu1E7xrtUAiv/OisCyehRjVVB8Bsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 3 Nov
 2022 10:52:50 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 10:52:50 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: add bootgen host package
Thread-Index: AQHY5fBFjF3/rZnGs0aTgw7K/nN9ma4aIAlDgAACg0CAAAl5uYAS7KEw
Date: Thu, 3 Nov 2022 10:52:50 +0000
Message-ID: <CH2PR12MB5004B0C65D7D73B65F0143CEF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
 <87a65o443y.fsf@dell.be.48ers.dk>
 <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
 <875ygc424e.fsf@dell.be.48ers.dk>
In-Reply-To: <875ygc424e.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|LV2PR12MB5773:EE_
x-ms-office365-filtering-correlation-id: a1a21324-8a9c-4b70-cc6d-08dabd898d53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6aXRf5leDcIM919tKSG26OAuqu0nBLgQBzepNUYLIS6FOofoeFaoiu8QgWH6A93ZG6TLqZ0nJk2/+LUauEuiCNOkIzXiavurOpMyIwH9jCDnCaLKNu7OgAXEFiXd/YR9IZt080oltUMINdYye30C44I7mb+P19P/d6a8Sy79bTUddsKFS0ar3oppOYaaRYnDhm1TcVnnUM1j9Xnvflear3sVjIVWqBZzhbpoAKFMR6bEtCaA+TwUCPJlKVQAGhnD4sB0y+VndozcrUZV7ANvu1nSk4J5fsFJ3y4lTdwVZ8gaaRZqccbbAFEicwY+rNfRAFkePql88QsxvKfWgvuIYizS91SC6j9r2t2jA2Zlx5NcamvvoAdqOadirnwLs9FRScs83nGMRH7nHiPltByf/zmNAmLDyCmWAYNC/iWzvHZ7vFT0SoB25Pu1yM4927BKQEyHzwY/53VfA2mR1TaoHjChWRx3PNfA/0sP11bhchp48c1EIQlgNhAZ8qJsVQS/qw8fAWfIQZSAu1RYEdA/V0KKrFO1ZDNAVNqaKEljA7JFkgPYz/vvbHMwxn8Z0f8SEywWu3+kbCY2hXwHRz/XBJPyT+LnjC87fq7mKVTKsrqgT7I41QsJc/tgBgrXb8DdHy0haLH0a9DcUDF4/oYu2Pskerrq9TLNCuPpeUgFlo7P84d4n8h2Wuvrkya3yELun+GK0y9ffLgZ06Cx5WSFyoag8y/uJUNQ32EBKgTUGvjq+Y+Glgfv5DNArtm1BIWJvDD2oG8snwKfWbHtUhFJRisrhBeDso0Npf0qq49XUQsJGo1qN9C/GnWC8LjlN2E/xg+AU+kmC8IVRMq99dHkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199015)(122000001)(8936002)(54906003)(38070700005)(33656002)(316002)(86362001)(2906002)(4326008)(64756008)(5660300002)(4744005)(38100700002)(66476007)(8676002)(478600001)(7696005)(52536014)(66556008)(66446008)(6506007)(41300700001)(76116006)(6916009)(71200400001)(186003)(55016003)(66946007)(966005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8R3qOO1mRdaTrxoW4rM39b/o1ZtJfqadx42Qd9Dmucoq+cUTixpGXQUN1xyv?=
 =?us-ascii?Q?7FF2jC7zWngJj9Q459oxw/bsuDbTfr21ScJjo8oOK9jSDvgoTC8f2vuxRU1U?=
 =?us-ascii?Q?F8hm5SPqFi/DHtdIaiEmxUW4OhjUZG80ApHNlHBx0UufpLMG2+mKanWEDo+k?=
 =?us-ascii?Q?XXf/ZT64iqX06ZGYK0h/5a6LXOteGDT2qsdGeyLhLPgbcUDM/2jFlzvrUZRQ?=
 =?us-ascii?Q?Z1UE0HJamS32x6HFzbIB+x5Guxk9lL9ANpVtYzYyPvaMfo4w5BFEKzVeSPKB?=
 =?us-ascii?Q?fVXrSMciypwKPquVZGd09dXOoz8jUaGHhF34x2AEIArWg0iTftU7g6k788kG?=
 =?us-ascii?Q?nqPm21vIdgZTuvVKbIwgGKnu9kIZobdDpKXAuOgLLgxgopGTRAthBed7lyXF?=
 =?us-ascii?Q?RYu+t5ERCzxy6BZWdviLSX8yEwCKx62QHCY5BeGmLNMGtpAYDMiX5dcm474u?=
 =?us-ascii?Q?TbbvygKSq2i5dRy1U9prIBVgx1vAYjHe3eZrbR9nf8VVMSZZvyPRLZ51wm99?=
 =?us-ascii?Q?Uw2xxXCGUu2v5lG8DP4fMNBmf+RG+nDiif65jCwm9GTnE3p0h1QrFSCq2v9d?=
 =?us-ascii?Q?gXiFWS/a49L1T0lKCPlwKA2GFlQfudg2tcFMBhXcx2jOSC7bMQ3BbqPvtzSM?=
 =?us-ascii?Q?mczzXQOXhqT9di68sHoDs5uuHNg7EJwttnbENCKDIO6/rn/chZOpM4jPAAhS?=
 =?us-ascii?Q?bEZtUr68+gjmej3zGyxmDXn4IDegsBZQazM3AkRz6+FROwJRoL5k1jqbmKYL?=
 =?us-ascii?Q?Pwf8+CAeM7rlNCdqw8RbCnNVdFGV8XSeD+cuJduqY6a3xMQe5Zz/pgO4emoF?=
 =?us-ascii?Q?UqnigLCwLDpy3j7andMBZQTx5NPLenBpXAd7vndVuPxbVY8yreFOF83dT3fa?=
 =?us-ascii?Q?u6CKK+Mq1BOKEKytHHsqp247khb1T+KXTsVaj8GP3uczQAztGPdG4M6TcOH2?=
 =?us-ascii?Q?7S/O8uITcnIETq3eVymFLW1D9BB7dYI7k0hPJc3A5pnRMDMCr2NKIf5z13rz?=
 =?us-ascii?Q?nerJpcRPeScvhj+TTu++Li3Sf6uhbadMjB9hKwS0QUDFrDDx2D25x99ORHc/?=
 =?us-ascii?Q?UpriJe8SOmPp+TWR4iwIPkBMBqP1rmvaFGsoNEyPon6NiwRIM8YYu4Og2Zrg?=
 =?us-ascii?Q?dgiwMu1LmrxtQcuOVn6BfBNryy5g/GKIz48v6XvaiJRGKW5T0qdowEwCDFjD?=
 =?us-ascii?Q?VO4iTfy0n0X3cdeFMoazI0i54VXNSeDWTLV2u1xxmB3gA5svX7Vre/w4FDFA?=
 =?us-ascii?Q?JhVByolFSEst91ZtpQD7sWbfHsx2Ejc0N+Sxkmtw/ScqZryse6Suzsu479nh?=
 =?us-ascii?Q?RX2h4oPZ0IZG+6oNUD45f0ZdDRwxB3W4Np9005s87nvua2WB4c7ZRUknO37x?=
 =?us-ascii?Q?TIpbfi9wFAgQwZjQ42Mjb5aI4TeOV/50tsDMQ6UvvLWrw9TqHIXus5Wy82OP?=
 =?us-ascii?Q?6zC1nfXlI8ahkBPkB51iPasmW0d4BiZGl35DqgMt2MFbQzH5hGA27OZkhyNb?=
 =?us-ascii?Q?f2HqatD67uu9d/HCDjROMCB/EV04vZTMrM+GbkOZNfYMWtJ5oYCqGci/DA2H?=
 =?us-ascii?Q?pAcJhcv7UNK1/aqH7iNIqe1VMwpksQG30kUbergEhcxI6DG3LL+I/Xwz/4K7?=
 =?us-ascii?Q?cMrBvzvUDqRxcufQWHh4u0g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a21324-8a9c-4b70-cc6d-08dabd898d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 10:52:50.5126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJ8KrACCs0KADBucnNkMQ2R4fwMl6Vs/i2AyUjGDFsLJdvtaAzm9bGARFCEIHJVE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kG7SxtOAbO7nYjFXjqR6c06+cdFkIaBLQGyA6d1knE=;
 b=4i/iZtqSHxrnTZOxC//KrA/qe+iKqAemJ5T8jhsP+dh2YYscdx36usgSqWOvcqtb/qgBP19I1BhA53gkzCbcWKfmTXN35gYlNkmeVlyQsiREbAryu39Ms4MQflCT3gW9xsIxhDHwtWiR5kiLLPOaV5Ea4nUJLTMFWjwWpajJo94=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4i/iZtqS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

>> I also had issues with linking with the embedded copy of flex if the  >> build host has the flex development package installed unless I add  >> the following patch, which unfortunately is still not merged:

 >> https://github.com/Xilinx/bootgen/pull/20

 > Thank you for sharing.  I will push this internally to see if we can get this prioritized.

https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed

Committed, thanks.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
