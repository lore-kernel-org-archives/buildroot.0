Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE7CC43217
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 07:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E299408C4;
	Tue, 15 Nov 2022 07:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E299408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iz1h_yXBDw1w; Tue, 15 Nov 2022 07:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A78C408AD;
	Tue, 15 Nov 2022 07:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A78C408AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51061BF293
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 07:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0FD404AF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 07:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0FD404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkR2Vr2ktpGQ for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 07:21:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34EE404A0
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::602])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C34EE404A0
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 07:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmqbW+z/9qhX1pD284GhxTrWogEH7WFw+4V1lblBCHYFwcx6SB41L56kMvjxA5J+o8s0DTwSH1TEb8KqI0qz7nHqTZnfDy3j0m1vZpIeTP6kAlldHANE7EdGAsaqWI6u/RaTd3manW+uu0svRlMnrTw/Dejz58dR+op/TscugFLRVP9NT9QUc3UXnl87CWmcT63xSfR4911UBH61kwQ3bdapbkLb6HsuApeGsRM91U3tGfDHt5ESbjtIAWMvbdqyFBqTrEa/wuJMQUil5UJvvZAkaLoDau9A31+HiwD4aILEDzPUJFNYU49xt/YvH4G/KMHN3nGScCuTyXdoSL73+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyd5099EXeRnqE/OTAGFq77//QTd1c0fEehZjNUT4cc=;
 b=AcBHz68rnmEKNO8XUxwV9pqy4sDdpFJH4q6y5SJFn0fdjMQwhX3GcyanGDNz2atm/szsx8gm1Snxc40qVqUX5h9XXSteSFcgzywLT0ewQAY3Yd0czpzNdZG4/9ewoNcQ3O3E/U9IrAgx9zC5h4/BOUTvX4OmG8fLTOmY2lPCuN6aEI5cSQjQSHDBZMag87M6hKBF97Xqwi8qNy84OUabbSa0+vqjfDsgU2VQxTJd0ld7IeXrpwmuKMtONEfZ1YOH42fV+gDq2My4xAhEqDdh36IhSisUCUr3iVTUkSrusoIFqMS82KUEUp8/j9BlrSHT98MEfEsRuWBbZmjWgKFnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 07:21:04 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::30b6:bfb2:7464:18d5]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::30b6:bfb2:7464:18d5%4]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 07:21:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: BR2_DL_DIR permissions
Thread-Index: AQHY+MK61Qd9vLC+W06jUq9eBdwRsA==
Date: Tue, 15 Nov 2022 07:21:04 +0000
Message-ID: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|DU0PR08MB8953:EE_
x-ms-office365-filtering-correlation-id: 6ea15a5c-c6c5-480a-3d49-08dac6d9f504
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VoefleThPv13R3+ArrYvfivEBzg8GnPaOYCLE29pHj25KBM1A2AIkBP7c9bSfNjzCGlB4l7ZN0kYUoH/5hw+U/m9ZSLhidh7gtTJsb5/8QPfFhVqfdU7BVbx7Gq1WKKDkoxmCT72Di4qc5CBDb9utpdwbHZbO/H/Dknes9cqnhvsI5JQ0Zbp3pDk3j+sPT+O6yOIlnsiED7eH5aOelPB5MEbPaHeJNfzYmmy/opysrJXdSruf5rStc2xizWQu6y//iuJGTPuymqK2OKo9p+ZVVwCzYmUFCr9F5IYH1kFIPrX4EgDmQXbZv+AvZ2/e8aePa/jQgGGshlpziezzrSAC7Y69E33nBOq7qdHlKqgR+k9ow7J5EpkB/pIqIFYtQZpU/sRAIkVcGXRAEFuUXWkJgMsaYT7ahF2n3ApYaW43kCGfZlJOFmFMNe9sBdIUG2rlY/ETRBv9aHY4JlSh6/WTTS5WXNf2+UXK9St4W1/f3nzdd/ew93WozJw+8WZhAuVo6aB9h69VE9B2i1gjSz8RXRNCouMNwugPPnXIBZdeXDy7k7tewmq6ngLH7yu9WA93pCdm9XB2DI7WcMJIm7eWMG7XiGclQ9kg9m/2Fuczx547u5RQAcTmh70L5iR48wevoDEcucXcCuT/9tlh06WSWvKvOVBqNM0t7VoYNQ0rcvAZX9oH/xdUFV8j2MoiQHA0MdwMygr3q8RuFlrHp/HjNiAdbes0dTy3uZ4Qg2qEklWXjFXJn0Gs0VJdMA6CnN6auA14VtTYRsEA8ZFp14hOhjG9qYu0KHUHJI70gRQs/U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(451199015)(66446008)(66556008)(66946007)(91956017)(76116006)(66476007)(64756008)(122000001)(38100700002)(38070700005)(52536014)(2906002)(8936002)(8676002)(7116003)(5660300002)(41300700001)(83380400001)(71200400001)(478600001)(6506007)(33656002)(7696005)(9686003)(26005)(55016003)(186003)(6916009)(316002)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wxZGHhLeRplE5BeH9wvUhWyUHDyOsFdkLb7ftE0Zt6p992rKDjc+HyDva4?=
 =?iso-8859-1?Q?8IV24Pa4Mv5YVMUiER/7v0oPiwEYelJGqDrumSO/7Bl92HjWGA44Gq4zvj?=
 =?iso-8859-1?Q?2zZjBLJoHlnpbdrdvwYo9dngstl1QY3MbPA2mqV277mN+5eb1a9UeaXq3Q?=
 =?iso-8859-1?Q?qPA4RJdLlzG4BXs7Fjp1sIrn/A7emm3+wqtZmUJFxcQA33+eRPds6XQrK/?=
 =?iso-8859-1?Q?6Q6hio+zrMQbrACxHYbJzWV//mC3mvonrOVhUWM27UcdQd9GWpNMjRkS30?=
 =?iso-8859-1?Q?wZXImNUI4FOf+NznbshIxNaJtgsDXb/gA5OWtIDUuAn7BsFiLTi0E1yymi?=
 =?iso-8859-1?Q?Y14vXeAxyXRi00Ay0ggVlFUMYmO+OesHT/MiuNo4Xa58jBPrCFlkEXmCAr?=
 =?iso-8859-1?Q?3RS/fi8f5FbDlKz0FuuCjbzlRYzi/qbBaJissSiCCsgjUqhnMwpFDTrTTU?=
 =?iso-8859-1?Q?s8dln3Q66YHVsYRuz6CZf2kVX5m+8MJaH7xhQ94LENGAECXlFAZT95bwIz?=
 =?iso-8859-1?Q?e7iWl/fvOyq+y/Cw3RR9ZRLJs04+eGU0IM/EBduFWob2t71q8feMP9tsYH?=
 =?iso-8859-1?Q?hVg6EPj/jBhC5YGHsiNF5P5NlD1z2Yq3AZZS3XHxSvuD+xcwsGFNXjzXOS?=
 =?iso-8859-1?Q?PxWY5d+bBFZHYqaQA0AeBdEj6pS3JQvUz1zZuRf767vvBnENWm9QmKgPpV?=
 =?iso-8859-1?Q?nQKPO4Bl4GaJBwfC5pcH38pWGPLoRxsMOFfA7Dm2cMIkJRrWO7+Fa4oK7k?=
 =?iso-8859-1?Q?fveh4DZY5TgRsYxVq3n2OxSToHRAvuncOz9fLOV8ah2jXWdHIgUyqEGxqh?=
 =?iso-8859-1?Q?I97BRpAE3vSY3mtwvH8imRX++3myn42rfHY02dUHe9s5X0GSKAkrIHDsqi?=
 =?iso-8859-1?Q?4huqJCS2xySY0QqSRQ3tAkA25w8trcVi4Pv3EmEv9znNhxAsnj2vEE19Mb?=
 =?iso-8859-1?Q?AzJGorI2d191wzSlwncO1TOlyS/ZegrBHN5KhKlw6i8yrmii+0aBSsG/RI?=
 =?iso-8859-1?Q?gjG21BUTPDHMNEPtWb20Tj7icYo11BHE7QoiAmPB1ispf4cER09ijkn5Zc?=
 =?iso-8859-1?Q?VaGL0zJl7UFPsqz96j3v5znKXyUa1ckYISG7/GDUqODgH+meQp7Py8at9b?=
 =?iso-8859-1?Q?qZXa5P8zZbIUPhrKypPS+8Qnd6KbzhWOtt799v0x+oKbh9dRkJO8wS+4ar?=
 =?iso-8859-1?Q?DnfS9+iq+EVa0M/F/+wB+VvPH9SdLIKHkLCwxzuXPVymeXhRkfBOx9Amdt?=
 =?iso-8859-1?Q?gPsknBGX0cIG5edbtR96lXQrYk616kNbbWoOaEfgTVCUAtU8gfwgSThQm8?=
 =?iso-8859-1?Q?0eyyzzMKfjDKDvOsJiU3Cs+YU3vvGACGuzqEEPZzICg2FstPHnFFceZ4uw?=
 =?iso-8859-1?Q?niguGO/WgrSkEs3ko/LbZ7viBZqNMHSALloaOVWaamyNHy/gn1GKx4RPSI?=
 =?iso-8859-1?Q?STCRhKsXkchdW6hAIP39RPOAoKNhHyaV7SNGz4HkPX7y0OoDco+Bjqpmwf?=
 =?iso-8859-1?Q?GbLcbko2xz4Di5iGm+J8iAfsaWrmglZm2PKJf3SM381i2rgJRbXMk0oUNY?=
 =?iso-8859-1?Q?k9IRQULXGAGnY+/XkXBHAO8s6MQ0/OwcCgo91Lz0p6q9dfjzhTpR89xmKY?=
 =?iso-8859-1?Q?r8wSXGURB7qsuh0vZneCoAmfuhBL2lCO7p?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea15a5c-c6c5-480a-3d49-08dac6d9f504
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 07:21:04.6932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIRq8WCDPzF22ulzEQhrEhfB4NZyHMS+U/7R/Ny0aEMh3qzeBmZXcdJ9dj1tBwaRmFCtcLvrZxKc9OcoyJQp9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyd5099EXeRnqE/OTAGFq77//QTd1c0fEehZjNUT4cc=;
 b=PKasw/3HmyTcbnLnXIary9A3nL+RVH9NO1DH/rgCGEDH3kMeVSNILVKMlxja5pHVYv2vcrnIUD/EP70Ag2OqTQBXl1HBloibQOUAjMi3D7DKmdA+F3sVSFVKYcX9n4qtO+yHNdZfxXcdK6gxcerFIvgzrDMUfRsIR2nDLkmAXxM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=PKasw/3H
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] BR2_DL_DIR permissions
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,
    it seems that it is not possible to setup a rw BR2_DL_DIR location shared
among users of the same group on a host machine (e.g. a build server used by many
users, all belonging to a certain "developers" group).

Buildroot's root Makefile imposes 'umask 0022' (REQ_UMASK = 0022), which means
that every file/folder created by BR will have no write perm for the group, including
the per-package download directories under BR2_DL_DIR (which will have drwxr-xr-x perms).
These are writeable just for the owner - the user that issued the first build
that populated the per-package dl dir for the first time (say user A).
Thus, if a BR package changes its version (e.g. for buildroot update), and
another user (say user B, in the same group of A) starts a build, BR fails the
creation of package-xxx.tar.gz inside the dl dir, because user B has no write
permissions on that path.

A possible solution would be to chmod 775 the dl dir inside dl-wrapper script,
after the actual download, like it already does for the tmpf file (output file
of the download backend).
A more radical solution would be to change that global REQ_UMASK value to 0002,
or to change the root Makefile logic in order to set umask only if the system
one is more restrictive than 0022 (it seems to me that the default umask on
moderm distros is 0002, so keeping it intact, without resetting it, would suffice).

I am not really aware of BR's internals on file permissions management, so any
thought or comment on this would be highly appreciated.

Thanks and regards,
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
