Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDFBC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 11:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CB560FAC;
	Thu,  3 Nov 2022 11:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CB560FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3Rj-qKdy4R5; Thu,  3 Nov 2022 11:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6912D60FA4;
	Thu,  3 Nov 2022 11:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6912D60FA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C84DF1BF317
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CFF740B81
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CFF740B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Jwq0GRkcSbY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 11:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6877340B62
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6877340B62
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 11:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH6jlK5O86CMgi7TTiUY6CbsOm0NpqU0OlPSDnCrhDQe6lhL82wEpE85gaFTXA3F7hYN4vNUSjNoeeXK53qugPHtsfqiPrAqJhaFm+elOYUwxdry199efrHV4XyZzZhGI0KCwUB4hpfnbO6qe2X+GLq4Map8h6IpGkdYX8qugjmfoWtYByZgKRKmDfMdPqAB+7j9ACXeUclxZzEu5+L7o25gX8++Rta8zmoFXWZl1L10nwdNAGiTgxrc3L9c32EZ6YmQEftan7v2xZ8aO87m6yIJUUZe3Rd546JZHtLbhgd3IwAxpCElxgxRWpr8ym3Crnk4/ezO2bpudHVJUt7AMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4/juU9JeYiP+fEV9/MNjyBaG7X9GNE4J6Hu4sUPIg=;
 b=feA6Hl6fawZl9Rosn5ZO6DsYSDFTZ/C+5HXZHSID1dV1CV53aAN1NiCykHY8Q6NsQ6c6y0IBAIWWmSBK2q59ujy0/JyUflduDbISqlDdmLFO+kKCUlox14z7PQ/uJpOKnkOmFbtsVZuFtIm7dLd2n1aXcYKsDkrqtcyKF6FQNfgU4VmZB+KOfaZx4q520sgTu4iAuCr6RZRn1wEMxEFFvIevkEYAKKpcTU8TtQdd082J8JyMbcaq1++KikAAUR4kKo4YFmD8qrFH2MG3T0Nj0n31d4/gyEP4VBudrT1bw7nsFb5cybDdrAhvvhiAWPc83gGfZZQixA7kVb7PsGhjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 11:03:59 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 11:03:59 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: add bootgen host package
Thread-Index: AQHY5fBFjF3/rZnGs0aTgw7K/nN9ma4aIAlDgAACg0CAAAl5uYAS7KEwgAAC9ZyAAABE4A==
Date: Thu, 3 Nov 2022 11:03:58 +0000
Message-ID: <CH2PR12MB5004CAFC526DD0C9A09CDF2EF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
 <87a65o443y.fsf@dell.be.48ers.dk>
 <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
 <875ygc424e.fsf@dell.be.48ers.dk>
 <CH2PR12MB5004B0C65D7D73B65F0143CEF0389@CH2PR12MB5004.namprd12.prod.outlook.com>
 <87bkpoqp1n.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkpoqp1n.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB5103:EE_
x-ms-office365-filtering-correlation-id: 4f14eef5-e585-4567-84ff-08dabd8b1bc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 77zxDlSM10wsDi7upzTDUy4uUUm2ASEfaORPKKYETGrsJ/E6lTtOZogCb7YvoTvgtJCzOzyEh1KY8g2wMjAukLCnDiTDPP8zT/68YDH9CnD9fQD3eu1kAYlnj1cn6ZriHMOnN67uPGsPUtH0VgEll/Nsh/5oaYMVS5BgXSKSXHPOkpzyK8nVJpjOv6UDZH2IbcFdYduTonGPTIHiksDRIswdC1+Z4ulTG0kj0qiLPPPXae8dk6FGpFel0kVwiu5KwFscWEGY5bs99EdJTSVg/KdU0k6zpCvvIMg4PCPZI7o+Hsq3TWL9nkO+8lu36JbmzR1sh1drgbMhFEm5n3m0K7RVQnkyRcTEwHViragSpzBEKl7BbdgdMHei3rX1Js40Oxd43LVOnLuZOty0O8UQjoXsoIf5h4aKfC7HGz1mH17Is4j0Xx03LFTLCF+dNmSTYd2FiX445lT+UueilsHggOn3tl1TdFLFAzNTLwarGsg6k+KGRHjgikPHSLFf+HeE3YVkQNtY64uRXUiVC7uDI3qlHXFssPPUpaTaYCHHgUzgpxPVdvrr+OmvcYn06L5gKd3MnahF6IBY/qkkRW2mNIoO01z0CaGAJ7dw2tbdmG9diV9+zGSzisnOMnYw9J1b0f3wiTh9rhjiJfAj23gfMfK8aKdenTDWSdnhBSPyBpS+IFiMkKqaSuSi/4Q2uDT4dWG0xQnWXjCwm4Sb/D2LIBqimH1a/No1UEcm1fRx0iM+E57/9p1jWA3644q8hbQS6f77GRMz7dFuJpsggT16MSvdZj8ZDyggDtX6ave3IE6L5U4+OiZXBDGomWR5P59ktDbNcRKqJ4zdpcUrXtF8sA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(71200400001)(41300700001)(38070700005)(478600001)(966005)(6916009)(54906003)(316002)(4326008)(76116006)(6506007)(38100700002)(33656002)(55016003)(8676002)(64756008)(66446008)(66556008)(86362001)(66476007)(8936002)(52536014)(7696005)(122000001)(66946007)(4744005)(5660300002)(186003)(9686003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?65slE/uNRi78jvOv/9RtjCUTRCLZoRYnbiqEH9s9WqOLLWF8W8vOLVMX8SqT?=
 =?us-ascii?Q?oIm5Y2iGsAsx6Yw6K/z/3BBuZbiaFzmZ3EA/jOrWBDGueknmhA+aNOpxdNV3?=
 =?us-ascii?Q?trEzhhyn9kYfywG8jNeG7vb3XxBbkkzXZh9ndkslzboE4lpyrBnks/lkAE0+?=
 =?us-ascii?Q?jeNdifcGlFiB81EuDZqf6p5Sp2uh9PT67vq2TX16mpB8oZIECbyjYw/R4NWn?=
 =?us-ascii?Q?n7H785RRPOTFLKxE1EqAaZRnQkSLfmtyL+tcvrnSaOV0e+AVTZ3m7Jmj39y/?=
 =?us-ascii?Q?aCDLPnHYoZI7+uXP+ezXU+CBsyeB3A1Ak7aCCPlMQLQ4oUi1i7TKKs6fAuf2?=
 =?us-ascii?Q?HwCvMIS7egZyYDXw79zYa+6Ey0Fkc2ja1hpSwkCXioqrvIRsPPHixfYDekZh?=
 =?us-ascii?Q?km7df9qtiJJmbOWwTn39UFoVMqD9ZbBtw3snDqa7BjcyFZEjATWqvNTWndy8?=
 =?us-ascii?Q?Em2b/QFB405vY2JaBz8UhgvYmPdKK8SXR7geokN1ipEizoo3+YjJbazX/sIM?=
 =?us-ascii?Q?QOjm8UbxyvRhLhEafIukDYeLCq9nlo3g7fvQHmpvLHQZFlDRzm+bQnAgY+3X?=
 =?us-ascii?Q?czmVAmqkLWJKI2XZ61100FS7S54251sFDDBHlSk/AlSaEoVY4OS1HXr2LoWM?=
 =?us-ascii?Q?M4VMRzuTLkVsjEmlgxE2q6iyQl+X9wJOCigbOhATT2H1Q8pnLjrpv/KUbWvl?=
 =?us-ascii?Q?ijrhuy8FCH4ka4yHd1Mwa1Fl6wKfVYIarbmna7PHiiqXgzYUItjfylwq4g10?=
 =?us-ascii?Q?D/uwkxhjhol4ALsGrYgAbgt62UkGWs5vmqPXW5e7V6issLyF2CFWuyXx0i8O?=
 =?us-ascii?Q?d/tuzakSUQThoyaB/HYw76+5j9QK/VMEWopt0/7/Su2e0x3MBE/7+rsQZ2tR?=
 =?us-ascii?Q?hdPF2JHsQBNLjz4eJPTXA7luYafIVdr3/giTe+AImGAQ0Je5UA2S6tCPyxzv?=
 =?us-ascii?Q?gglUO5ysm9OpnJJbln1OvayahCUsRDPkvyq+HSXjE4VoXSff1sptc4VbRTFp?=
 =?us-ascii?Q?oMUKgWJrHWKpt0woH+T6HUrwjT3JwgaxZKS2VOCLTXmcxnBiSE/T7hJyhfw5?=
 =?us-ascii?Q?xc+qY80/pOuz/Pj6u0uF4NlURwBteH71zbDdNyytJ3UBEf+5Fd3qF5l2YbQS?=
 =?us-ascii?Q?4VuOF0TlUmxtGf82eIj0G0mua5w7i4MqlAe5FkPjiPWn2jE828wRj8T9gt2E?=
 =?us-ascii?Q?RWKyoV4BVKlH4zD9+sGCtXz0MDheK0vjMyhQ1XOVUz4czTGZWdtHD+C8/p8E?=
 =?us-ascii?Q?XJ+uGJY7CYWKce4McvRvm76dp+EQ1ECK24dKT4sxBbbV3FtsA3KCQUKfzukb?=
 =?us-ascii?Q?5mkb3lsH6MSrOzXbJlyPXZpbWGlbxz0XU1IxabQnY11r0B0IaSo8QRpwQpkS?=
 =?us-ascii?Q?/KCHD3K5PihvFrtEpKNC3QldM1Pl+a74jTDrMT0I47VwToTYGS8Fhkm2KmvS?=
 =?us-ascii?Q?4XEH5CFR8/uG8eoJst0UTNt1oigB72ix8zq8ec9x3PYN3XWbNWwBd88GwCFS?=
 =?us-ascii?Q?iz/4k+/yM4kAPYYL4902b/gmz3FPvxLUr56Bf7EjrOISDM4p2VLl/igA9lOf?=
 =?us-ascii?Q?lV5pJGDAnBuQ1iMVOtAGrd2bM4ETucmA3Tt90+dzUVVeYO0geFFhedBl6nTL?=
 =?us-ascii?Q?mEK18KTaTs6Vc3jkmCRXQI8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f14eef5-e585-4567-84ff-08dabd8b1bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 11:03:58.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GdqwnoPuzwpldxXr7JbZGi/15Rp3aNFK9RNq8FC1yfM0wpzWSljiNsFfXM/4ux54
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H4/juU9JeYiP+fEV9/MNjyBaG7X9GNE4J6Hu4sUPIg=;
 b=plV10kVWd96eACBeejmehAs4Df9C/Y6NZK5ML9O4saBpHMHg3qQ5MZFXNZO51vKSRQ52j0+uQov8BbDpBkBFF34sWgQT9dy/AyNbNtAJG1oLlIcjIuX7xM8UzT/z6TqTF2sE3LzzzORa8F60i+sUj00UXtibIq1PXBXyvDZPeL8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=plV10kVW
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

>>> I also had issues with linking with the embedded copy of flex if  > the >> build host has the flex development package installed unless I  > add >> the following patch, which unfortunately is still not merged:

 >>> https://github.com/Xilinx/bootgen/pull/20

 >> Thank you for sharing.  I will push this internally to see if we can get this prioritized.

 > https://github.com/Xilinx/bootgen/commit/af4f7083ea92931a07e47995eb2bc2a348c577ed

 > Committed, thanks.

> Thanks! Is there any specific reason why the PR was not merged / my authorship was dropped?

I don't know.  I will ask and get back to you.

Best regards,
Neal Frager
AMD


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
