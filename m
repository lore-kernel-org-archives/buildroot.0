Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D9C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 09:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 529E081319;
	Tue, 25 Oct 2022 09:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 529E081319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51D9KIFEd0R2; Tue, 25 Oct 2022 09:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5078130D;
	Tue, 25 Oct 2022 09:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F5078130D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC571BF279
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A782812D9
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 09:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A782812D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys6f8MAAGLGp for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 09:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2C28130D
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C2C28130D
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 09:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVwfSmaHtat/8kLfJ1/LNMsYHK7acGhsXi4iWK9l4UFPUnHprkj1yzpxpZqmD7KRbZdiWXf02MXkcxIeOF44W0bg49cfFTVZgzrjWxHaRBWYonF5oOUdtAFCFCLL/4pxTs5UcWGdyM9t0244J34mXQh4+pDxCbCd9xwPMxcdgD4IbM1g5Nuy5cleIz0c9THkwINO5VfKVk/j5PH2EMRI+XiR58zyGlpgZZ9WxOW13KXtEVXPBDI3rA7qmaD06OngCgNPZ3JnQCxXSt9KWXNn2pqReIblEOBv20qlvb8xZ7b50++fCishOFWmxVjMNobP+sjiMcLVZ6toDJLB7YHXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEoMEvGQC9AzTgxT98NPKynds3/etcNrz2I3o6lnvBo=;
 b=DYUGBAqIsPCK0KF5+0BZrOURWBJztxqx2CzJv8/3MRDyZ85yFXpgsUYlvFP7yBjxU6rMvh3LpAiIcGjL2O96lfqkn10Ow80Wdsz0Tgov1w7wgyu8kcW7ZOJmLM+GQEVqJr8l9mB4hPusJgJkZPVDqw/ol6UVDVjfkk2wNhgUk/2EzxSMDz1Km+Kmgyp8ZWQvvtRfgrm5qUGMA3ZLzdtm/1OhF/2Yt7xXY5YSu9XrPqMxVFHcCmP4dv7r5OW+Le8Y22H64r7hZTqri+ql1/2dB6eZ3IRvcJmdDP9XbCKyIDvopMshAmDh1PQP6qtF1eBuJKaEW0hjPQ0impw5zPXrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 09:51:20 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::70d6:36f4:f253:d082%6]) with mapi id 15.20.5746.027; Tue, 25 Oct 2022
 09:51:20 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v2 1/1] package/bootgen: add bootgen host package
Thread-Index: AQHY5gigu7HSNaC8U0axTw1/ENi0hq4cPGjJgAKivVuAAAM0cA==
Date: Tue, 25 Oct 2022 09:51:19 +0000
Message-ID: <CH2PR12MB5004BF9277FAD496F67C1A00F0319@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221022112243.31889-1-neal.frager@amd.com>
 <871qqy4foa.fsf@dell.be.48ers.dk> <87eduw1bv9.fsf@dell.be.48ers.dk>
In-Reply-To: <87eduw1bv9.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB7500:EE_
x-ms-office365-filtering-correlation-id: 8053bdf9-df77-482c-3aa5-08dab66e77e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ArEIt7Pb+kN5QN3MeIsaDYzOxaL2mSnNxnMgc0M2K7jRAse3M4v93yiSNm12e2TwiBE1rXpfdVGrs2NB6EDj1Zs97o0wsHN7xRSJonFUkEHWDuRA8nIfkMLUJgSbznhwjy2SEeMDvRFcg8KEFh25gHQKZv+ksefUIMAS7f1pPhan0GrxhOpHqGGL0BqTDZEO2J/7aW/du/NsJp5xsKut/7G0/iN3lFHLLZgtTIJLuwEozpy/f0jUdVb52LMcRwfzlcm5vDg2U6F5UXpw7302JCC/BUklY0L7I49bB8qOKqbWrVm+8xR2rnJJmBl72h13fblXQl+ZJKnouxtLRvum5mfhHoLABSWHpzUZURhWBRz8i0SykCHQMJfKwxZ3F73A6L6fSvGs+rdU02lJ3mDzW2s8jUeVhn2JP/FaUkavDjOHenvBEyrSn4nX+r6LzloVFpEDDt6gCcAi2GkbGQ226TND1kjdZpml5RzPtPhNsSQTRvE5k5SNirtAGU6ovzrzH8xHmE4wWpybcLkpsTvQTLDH9epqYelDoeaROnp4irEiDa48qDdRPOADI6LHuGU1rtSVJ/v10vF4USgTvfe8QJb1S6pNdLZNzAGtyekTIvXdXsTSd2VNRts+fz0230KBg8mqjIrl3t9Apil94Wg4psm6fmaYhht/dZswZOC811xJf6aR9A+u/b39EqfHbrllGqykc4wnN2Oh7udYxL8vkkPkJxxOf2wUWqd72jJyE9LT5SHm05HqGGHRjPdOg1WIqGIMLRq3JyUMoaUqqXU6DD64K9B0aI8dw80xDYx9aY22CSPOt60KcHY17a+mzc6s5JgTlRQxi8JOpr19zXOEsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(64756008)(86362001)(76116006)(8676002)(4326008)(186003)(7696005)(66446008)(66946007)(478600001)(66476007)(966005)(66556008)(38100700002)(83380400001)(41300700001)(6506007)(33656002)(55016003)(2906002)(54906003)(6916009)(38070700005)(316002)(71200400001)(9686003)(66899015)(5660300002)(52536014)(122000001)(8936002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/1lT4Y6Lxok97ox0vKhx8TU9Xt+RA6iofmCLAScloIZZamyBnc4ZEqER1XL8?=
 =?us-ascii?Q?quaN0NJoB5dVZcxyjLV8ZSYmbmpsiw4/LP1cmLKR6VGyC0F0fiwN+pKgV60t?=
 =?us-ascii?Q?7fL/I+28hZqvLgGuwqt6p5OcHQy7eyqkp4xRNNNHIPIr8jOFobA7Xa55DtSD?=
 =?us-ascii?Q?HJ6JKKsOxt7jiBTfT1HUosFoUON1T22H3lQ4bIzf7XQgC1f2izqar4BGQspf?=
 =?us-ascii?Q?iK4dDH9Z4pjR47m5rpV95BbEbkjHTqcshxtY+P+xzhh9xTrAstUXu/EffHJR?=
 =?us-ascii?Q?mb8g01WbqZQzmwl9ic0jxYKzKoBRkOZUPHCGbIMv3lO1G40Y6PnzP4AFNP5x?=
 =?us-ascii?Q?2sXF/7C6iVwwfCy4ENCGi/RUCvP0PxzS6zlkuNWJPxTZheCjML5UWcggt2gE?=
 =?us-ascii?Q?qjZ06DjjHu1/fKIT5TH5/KqG7MyjXSvldxJ2lax1/Ey2P3C+5W6M80kinFC8?=
 =?us-ascii?Q?Ub50TVw+f7HbXNl2Ml36ubu8m0CCIFgmV4fE3EM3LJtJqNQW6MSSNizh5g0Z?=
 =?us-ascii?Q?7DJZfFvs6A4mbGtqczIQqZ6WGfvce8pe4yGkKlPYKMCaQBz3E5vcz0wzr5Ui?=
 =?us-ascii?Q?7BU3L8/lNhYgycnAajm3UnYQwQPLtIRWt2IOpfeWkoVV2XV82mSuxEKlzr14?=
 =?us-ascii?Q?eg2IOdpzCU2MfqJOZlIfxgqUth81l2K1C39bCBFcBWyepEHTnEUDKgWSB30V?=
 =?us-ascii?Q?58M4bezhMRroGuzxOGH+BUy0cXBDHzJbMbs/I/qHVgv8skgG/iCbJ9aeD4Nk?=
 =?us-ascii?Q?LpxpMYqNVMAffUadDh4tJAAG0Sr+S7gnTwQL20hUN5GfbbTAq9yTsa+L+/gT?=
 =?us-ascii?Q?h0aU4iCBTPZzTWNx+ZnVi7K2gMQ0Z25JPrtik6s0AhqXJ8YVOiL+3gHfBimL?=
 =?us-ascii?Q?B7MliAt076+IFzXySLgO2FgXMTs2a9oHKYzdzoVA05Fs6twIiQz3DsNt8WHG?=
 =?us-ascii?Q?Mq6Ny7bRDzXWIv9T1peM8bS16jxp9WTIwXXBurebv6OeofqY9XsyzSICc0v0?=
 =?us-ascii?Q?bOdN2z1VgURoo0pxOwyaSXt/R0Q+DHqziIXRGrxwGz7N6rOMXxwgkmmUXiFh?=
 =?us-ascii?Q?poSGBfDvgxzQM6NJ5smKlo7CVmjSO+Xo5eWx+kkod3YIBmRxoXN3Y38nL9Tg?=
 =?us-ascii?Q?L9SgRouW0KdRv8fwilM5hDcjJ7COZCW8Mqd6yrhC8tm5+LbyPM8DvKqojqd7?=
 =?us-ascii?Q?PvOTdgC6e477vVeq2etTgZomY4fM1OW2aLxZg1tOs/Y1yqjdAjngQcofQ+Z/?=
 =?us-ascii?Q?q7xECYaGHuiweXaYi30wu/DrE9lMV9Tyh9rX8Hy3cMXqXd+WaBS1b1tcAL2t?=
 =?us-ascii?Q?fTa2iXIVj3ky1Oqv6nFmfdg6+6hmS/mwtFXzWvVd2LKdLuIzF7vJ5kTrrck8?=
 =?us-ascii?Q?pTn9iXZs9JrrK3Ms69J1GZnW7bUfhZ4n93maSDaggRW1g1dVEvnN2M/N/1Gd?=
 =?us-ascii?Q?xMS8PqDz7OSMxKp4I8/SJTh2g007nbqxanBHTfXcKZcydfUbj8d6Gl4CCOz/?=
 =?us-ascii?Q?uQ1D1MRNgA5+Hech18Zv+RdP59soGWtm9ihh7ujufjuhHYTL4IwvSfgG/4dz?=
 =?us-ascii?Q?LmUL11jTF1R1JR6QxLemQUeSPeTTpSK5lSEO8LX/A52aN4UUKvMpda7nFnx0?=
 =?us-ascii?Q?qOrkxgf17H0jg0AIjbLd4cY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8053bdf9-df77-482c-3aa5-08dab66e77e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 09:51:20.0153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdIR0GD+vq+mPLBKzU21+s0sSbzi23tUKIfRynaMLGNI844R9DZ1yapfJnRCW/+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEoMEvGQC9AzTgxT98NPKynds3/etcNrz2I3o6lnvBo=;
 b=DkN6G5Op18kbn0HfRuT3q1I5hOpIPQI2H38YB4sOcZu9unaYbB+tZ4EAsxPVH4OpVNcYgCwDABOJdmXrcmF3lt62s0VNcZiTRkyJA0HJh6ftkDw3LYCb9wtQlIlOnPruBkEkekgYF+APRibltEwFk9s+3iMLRYQjE66ajuu82Eg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=DkN6G5Op
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: add bootgen host
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:
 >> This patch adds Xilinx bootgen as a host package to buildroot.
 >> bootgen is a required utility for generating a boot.bin for  >> Xilinx versal products.

 >> In addition, for developers who wish to use secure boot with  >> Xilinx SoC products such as zynq and zynqmp, bootgen has a  >> more complete offering in secure boot features than the u-boot  >> mkimage utility.

 >> https://github.com/Xilinx/bootgen

 >> Signed-off-by: Neal Frager <neal.frager@amd.com>  >> ---  V1-> V2:
 >> - improved build statement to support older hosts  >> - added bootgen.hash

 > Committed, thanks.

> As expected, this fails to build on setups with modern flex / configs where host-flex is built, so I've sent a patch with the fix from the PR:

> https://github.com/Xilinx/bootgen/pull/20

> --
> Bye, Peter Korsgaard

Thank you Peter.  I will confirm once this is committed in the bootgen master branch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
