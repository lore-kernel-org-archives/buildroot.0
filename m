Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 15:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE98F6100E;
	Thu,  3 Feb 2022 15:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mQwBKCeKgwo; Thu,  3 Feb 2022 15:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB406100B;
	Thu,  3 Feb 2022 15:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0E211BF3D7
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 15:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC2240443
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 15:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="FG0BkctH";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="U5cCYev6"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaNZdTljmdgR for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 15:45:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62392403B9
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 15:45:50 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56DE7C015E;
 Thu,  3 Feb 2022 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643903149; bh=rIECMPvaAHr5myw+rM2WWZqmeLM8NXa36oCEq3iaGlo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FG0BkctHGW3mImRonHerAVfo/Q6RDWdKDEkyv9r0eEPxb6tTstJhsg7S4d29bnaBh
 +V1/WmHEGFqOsbf2v+D3q3fchQ5yCmJT0tuKiEb0bRwHcdR6lCFy9SJADBsQlG3YdK
 RYentH0VsP8CTuns0cH7uv2v8505Rh2sdg/lnIEXrPa3d9jGH0ONQrC+T87SrYYQGP
 NSfFhgYp7PaEfkkhNF/3HEATzUipGWCjGcIIxnlzWCyaozRDBaDGc5PPM1DgtxxRv8
 7R4bh87COg+U0YVoQU5GdYPx4BfaoXJ2iTIB9MEytlvNTZvyaMQ8RLPwlm+x7DY5T/
 Ot6EZnG4bJrmA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5D277A0096;
 Thu,  3 Feb 2022 15:45:46 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 47176801F1;
 Thu,  3 Feb 2022 15:45:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="U5cCYev6";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBxcJUr9+9dc8nVqKHONQrJh+j5rTgezfuC53884YUSebWffXcTCfFvmavz1gOxinSVcPGsakIJ19JX1kZZpmquwHGMS5VmkvgKdGpT5vnSvP6NegpaWCKGq9Q5r2GVjg/8G+xNKMCkjCl7pOKxtofeTjHzImelpYkDgWyybJ0TVnSE8A2wlqxbllv83J4osE/nbVaptqKJ314kDK/OVIU34sXHfXFXlFMzoZbuTjarpSaO61Pws2C2fMRqXFu7AfycPyidVddhgRGAz3tq/JpG0rFqHG8KHulXUoHaeiHm2VKffIc1VF0WOEMsRYYe46y3bmsR8bjtnOVBTV0PtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIECMPvaAHr5myw+rM2WWZqmeLM8NXa36oCEq3iaGlo=;
 b=kPU5cgFpGK1tSnkFgRGoD5NNxxATgblX7cTofR4Y/PGit9mg/YToJrI3QXqMYVhGLH8n+h1YBTIKAm/K1wxWDAQSEpMXSj6x0nKkJU3p2GqFZcxIFDo/ytzRdSo9SZRuW30msnPgOGe6mmGfRBnBGVD/86e+CGBJeoycebHy9yMWi5/RfVkPZA9kIakrOlDJ5epvJrXLT5s/2R2hViABtLVuwnZQr28UcolAeSl2OnDkmNy63BdmFoCXTg8R6nFPrtKGlaJATIpFyFVol67UhPzbNXwHd1nPAOYDbXg+L7WmFxNARFfopwRrqg0VH5fB9gE1xZMGEAX5xJfC+7q41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIECMPvaAHr5myw+rM2WWZqmeLM8NXa36oCEq3iaGlo=;
 b=U5cCYev6fVnxi3xdQ8Rd5+0eAIPbaQVxb2w4S1wxAhp2+WI0mwLUSrnL1oGl3Hs8DfjgqOTxWg/eatdZUcdI1gl1NzxLkFFXtPJSYpnmnoqiytWiYMuB5Af8lQWgF1Tf624YxTuGyOg2FFllz+MjUbqPl3mwCgUZsRj/vd/+EN0=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by BN9PR12MB5340.namprd12.prod.outlook.com
 (2603:10b6:408:105::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:45:42 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 15:45:41 +0000
X-SNPS-Relay: synopsys.com
To: "yann.morin@orange.com" <yann.morin@orange.com>
Thread-Topic: [PATCHv2] package/glibc: allow runing on kernels older than used
 for the headers
Thread-Index: AQHYGDuZ5QO0C8Vs9EqwlFiJlujPqKyAeoTUgAEAVICAAH6y1A==
Date: Thu, 3 Feb 2022 15:45:41 +0000
Message-ID: <MWHPR1201MB023933DA53A56AB2AB3D5207A1289@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
 <MWHPR1201MB02399448DED9B92CC064520CA1279@MWHPR1201MB0239.namprd12.prod.outlook.com>
 <2371_1643875895_61FB8E37_2371_137_1_20220203081133.GA3479@tl-lnx-nyma7486>
In-Reply-To: <2371_1643875895_61FB8E37_2371_137_1_20220203081133.GA3479@tl-lnx-nyma7486>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14a1df2b-daea-4c48-9126-08d9e72c3bd5
x-ms-traffictypediagnostic: BN9PR12MB5340:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5340D843844839A7AEEDF34EA1289@BN9PR12MB5340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5Kbqz9r69DwwkYuRWnAYtVbcA5GZ6bgahbHoS/ybZE8xBj5F+IsCcpzQBqUn2WRos6o9b5fHcub2pQGAVxuwyOuCV4rxnpDO0da627qTZFlY08W4aNxGoZTPLPIIs/NIuRm8+e1xLV0X1Pz5qoyx6POPYzWCjdvZN5M0a3duuAIh1Lq6pbmlw4uKPr+QzcTS+/szCnPlQn3IjPD/uYiEzwyMDXLCDf+daMZ2jID3gemwz6/dj1WZAxswQ0wUfpEk4uwzzJKKqgeYz0FLy70ljVvQXC1AxNn3j53TRWhccixpqcH2QKywLPO1B7kiDcgsVjlrAlunpHKx16pRVvUzl7GlZiVch4QlbFLdpp2p1LV65+e1p6rCXlDZsMuGR3TecH8ms1idEPGim9Q+2eQKtBMYaOHyp91bIhLVVuzisbe9DUTpqUvyhMWBpziiRBUkX/D4qIBBQ9AFvLhYH83lHkRIJ1wENYF8L0XgstquU4r50k52BFXcUh6aebeIBBi1sIBKWWu3mpL59a6zitK1SSSpCvjKMulp3Na1W7Qtr0JccHkRXAVlv1bn2t1UqKwCydyy9DirKI+JmfSdl+rXVm2Cm1uln7hqZX2xi4yTSfSI5LfObvpwPTP1ghu4ekjsO5wS34vF9w7Qvxpef3Nd9K+vLv+GOtCOJ2BRasPY4PDroTuV8duoXUjGItkjuIQfI4+sEnNya1UttcNnGUnlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(54906003)(186003)(2906002)(122000001)(26005)(52536014)(316002)(508600001)(6916009)(86362001)(76116006)(38100700002)(8676002)(4326008)(33656002)(91956017)(9686003)(55016003)(6506007)(38070700005)(66946007)(66556008)(66446008)(7696005)(64756008)(71200400001)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?C/UOXYKhlxggkcOThm0JblKJ2rRtrfTXWZbCg5FNW/dn0JHzBQo2/Ds04/?=
 =?iso-8859-1?Q?2sxa9Q4NOM5aoyL9/k3tQCOfyilWlDQg2Zga4RqHTHQqTktfvylInOKdlV?=
 =?iso-8859-1?Q?FLHG9EkjeWvRB5zWCgNHTrcwxl+1XZuv/lISWAtHXlT9nsxd33PDYRdxyW?=
 =?iso-8859-1?Q?dFD0xuQDfvOngfGpVleOpW6mg2/X0JLV9iY1Lj2GKM2KiXyP9Ed7RPS9E8?=
 =?iso-8859-1?Q?fScApM/EHOzzURVaigaHIZfh8Xhg1aahWxR2Wu2MZqdq78koOXRrjDaEZ1?=
 =?iso-8859-1?Q?RooLazmWlRpyIw4GNgg9aG91I3q8wJnryEAMu6pIIm/W0ps9sK78jwcTiR?=
 =?iso-8859-1?Q?bbizh8LJs0DINyzbeR0KIgY8eWA/wdUxqD6mymK9CLOPLwBEaKhzvGrmhq?=
 =?iso-8859-1?Q?BigWrmgfVXyyZCiU4MYxdNj7q4HtXeefbBrEmEs1E2ttrfqV7dU3q6fn8a?=
 =?iso-8859-1?Q?KiQdvADk4DY1M3haAiP0Bpt4DtxW7jAvbR4QiWBixDJBJ0kTBcIMDh5hFS?=
 =?iso-8859-1?Q?fQym3wEuhkNd3opEouO4c0fn6DOYUBAJVhqQLWlmM4/AtAIhNgyrxX63Jh?=
 =?iso-8859-1?Q?7k+BpIhzCucu0SbhYVfgrNelInuV6qZA6rx4ywmPeJLj8JG98RZ1x/PNs0?=
 =?iso-8859-1?Q?TNMPilzwLxC6SRdEzmYsykKiWQNT4hxBQL7ikFykgukfz5Som0cdtzEEUU?=
 =?iso-8859-1?Q?JpZ3ewUZC5grVvjOWqiobcDLky5ws/jv3+Tk5SKA8BwEjCSrk7rjClmLo4?=
 =?iso-8859-1?Q?aCJMVkIc+3r4L3uSMs93hxo7oQu3VddK01t6s/cSrVd606eTp9aUYI0E7V?=
 =?iso-8859-1?Q?EJzadxnG4dsS5OA47rqZ8NwnfRa4y+2WztX+JKfiGPitzjJKN3vWkZtlFP?=
 =?iso-8859-1?Q?N4B6s+iBhMqXNujvki/u/ZwbpUo9aKPBw4Sump817CFVyCOJhfJacWqN+U?=
 =?iso-8859-1?Q?Gb66Z/+Wq/5MoUIEgPfIQPrzu1jlyOv32k5SHvRp3ZM6AkJexI7RYCJJ5H?=
 =?iso-8859-1?Q?ubJiOTw1ZBUckjnQC5yW93QWlg63u1oVMpCq9AjAa2FL1tEQZ6m1lwIDjE?=
 =?iso-8859-1?Q?V7BFhlYTCUx35UYoT0xt8C60XZRwhjrFHQQAfgwZjvLwHTQO96WFF4qh0X?=
 =?iso-8859-1?Q?OAsMzhePDQh51ZLTPOZIqYeXLRnYaDbWAoX+KKeHFRWotDX7/UQXZ/5Coz?=
 =?iso-8859-1?Q?sKTdCiC4azm56WHv+/w4qX7Bx/nY1+0myj3HEbIabpxJcfkY6Hhh6HqBht?=
 =?iso-8859-1?Q?Xd3PMj0Chff/lNsJ9Dvlxm/kIw3LJZbxKLTpz7dlOsO8bPAqXU5SjYwtIc?=
 =?iso-8859-1?Q?1NkdJAQTwMwOW8i2HC2ov3iPqHnASZmaOkFqLvg+EISI7sSG27PK6s3SN0?=
 =?iso-8859-1?Q?Q2NfXKMoUZ7t2jpiOX3+zQrqrZdWeV1qc0x/HD5xj1uPTHRmfj8jR+GGLv?=
 =?iso-8859-1?Q?87BFZ7YZ3tgGXDv9rvu10NZzo2MnQIetsEEj6LkCyp/ZUfsFKllgZaOdAm?=
 =?iso-8859-1?Q?cyVuNK8A0x1nshGTyYm5+FTyBjxIFlGb04vSVkVFCSaEEKc2s4FFpz9AQi?=
 =?iso-8859-1?Q?3rr9no8op0NeGT+MYKdMzwdaWL+VARHMpWKQ4sOnYUcmn9E2wqdj02HTE9?=
 =?iso-8859-1?Q?3447DKFMe+QbU3AAfzFMQfcwoWrfXXn4woFYHQAdhyd7K5OxPwEdUvnupg?=
 =?iso-8859-1?Q?y38dk7DVAOB5yIxdErY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a1df2b-daea-4c48-9126-08d9e72c3bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 15:45:41.7127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1VI80wreN/9ywcfDTkGKBgYKZFfjJyWHW/BJDeKQjzRj0X3IiLAIxJ72ITGnORiLLvQu/KcKP/azI/rLBByNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5340
Subject: Re: [Buildroot] [PATCHv2] package/glibc: allow runing on kernels
 older than used for the headers
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> On 2022-02-02 17:00 +0000, Alexey Brodkin spake thusly:
> > > We add an option to glibc to allow the user to enable compatibility
> > > shims. To simplify the case, when that option is enabled, we just let
> > > glibc enable as old compatibility shims as supported by the current
> > > architecture.
> > Looks reasonable to me. I mean to not have all the flexibility proposed
> > initially, instead adding an option to fall back to something much
> > older compared to used headers.
> >
> > If more options are needed later, we'll get to know it at some point ;)
> >
> > And thanks for doing that, as I meant to do something similar a while ago,
> > but never posted my local changes.
> 
> Will that be followed up by a reviewed-by or maybe a tested-by tag? ;-)

Indeed the following config 
----------------------->8---------------------
BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_5_15=y
BR2_BINUTILS_VERSION_2_37_X=y
BR2_GCC_VERSION_11_X=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.176"
BR2_LINUX_KERNEL_DEFCONFIG="haps_hs"
BR2_LINUX_KERNEL_VMLINUX=y
BR2_TARGET_ROOTFS_INITRAMFS=y
----------------------->8---------------------

fails to boot with:
----------------------->8---------------------
Run /init as init process
FATAL: kernel too old
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00 ]---
----------------------->8---------------------

But if we add newly introduced "BR2_PACKAGE_GLIBC_KERNEL_COMPAT=y" all boots
well. With that...

Tested-by: Alexey Brodkin <abrodkin@synopsys.com>

> Thanks for the feedback, by the way. 

That's my pleasure!

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
