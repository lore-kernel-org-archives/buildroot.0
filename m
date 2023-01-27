Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B79C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783E3828AA;
	Fri, 27 Jan 2023 08:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783E3828AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbviLUlK9Kdv; Fri, 27 Jan 2023 08:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDD482893;
	Fri, 27 Jan 2023 08:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEDD482893
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01DC11BF349
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8D74016D
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF8D74016D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE3ptECYrOTI for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89BEC40128
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89BEC40128
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq9JGDoQilnHqGFkh4FVPNDZB3XT7iA/yHznq8SRNU6ddKeaOIBWEJyWOmYMvDw/0550rkQN6yMiCMORJ9oCBgemt6PPO6QNuKmU+pkiuMG/jjMP6sMO4me4EJPm2PuxkXbHXaB2sLVZHEbCRIJicfpBn6HwhN1Z8lAxyQrbivczOwv+TplkXoJFvlHYXq8tnCOowlH9B45WtwM4guqWLYyXMmIBtrmbTSizfdztf84E6mh33quh9dcdXzxmMezIyWxry0V6mfTh16VpvCf0nhnyWvyTc8wLakDMz9NWviSOWaMHzsDzqAu+SQ9sUFqOV4QJY+tJAg76j7WaM37h+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHUtvJtFbtLl0GNxogxUlxAsqBebM2nZ/o5svl+7dy8=;
 b=hFBX76+7C68thcJHb0z1gkGbkLf6NpJ/HSetUMSoKQnTU1KAY9n2Xc3yeuB7PQ1FMtC4sjbOV2BtyTyg0lQN9vt2zq/QeCaQEujNThxA6IOqVMSYPf25pcvIbFeLi7X+wZtrpk0C9v0PUumuq/iqpa0VZpOGMhatLHF4rtPrrLn70GMIiGBDx1xB2+XsWIv43bOc0CfnH9EZ9dBM6asA18QfnelzJGpr8K2uW4t2r/HFv4wO25WVBcqJXF2xuSLt8zOT6CcUDJ8HLsivb1mtpg/bJ4KgHcgZ0TThxmPjtyeLzwZ9MY/I2VFuW+Z9I7jbjWKfmTBMu+djmgASpuj55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB6908.namprd12.prod.outlook.com (2603:10b6:510:1ba::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 08:51:32 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%6]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 08:51:32 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
Thread-Index: AQHZEHcDhq4lw+QqUUKN7Nocob5DeK6teAsAgAAAxtCABLbhgIAACDkA
Date: Fri, 27 Jan 2023 08:51:32 +0000
Message-ID: <CH2PR12MB50049CDF836F6FAE527C5563F0CC9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221215111831.11956-1-neal.frager@amd.com>
 <20230124091850.0cabaa3e@booty>
 <CH2PR12MB500452D43450E31376BC6472F0C99@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230127092111.76a3d867@booty>
In-Reply-To: <20230127092111.76a3d867@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB6908:EE_
x-ms-office365-filtering-correlation-id: 3d66f8a9-c56a-4b0f-e448-08db0043b024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6nSa8TxeuidrgDkkea2MqOhwVinpZdjqUGOEfqXDvbbjNqtFNoAOAPAVFEKiCiuj/yD2PpGPV7ByHgIXrfA8jSPPgkvhh1pW8GyMdq5apESCfIDs8Qi6BOp9z6vfBHvHL/+jpAlTN0wtmU1jzbam9315BLjf5N3QfHi5OVzHgpF7NmELJgZAibGev587ld0kMTnakiI8Jw15XD8EObFW4DztOIgIua6mDyY0XbygubYohEGCWNwAnH5tPQi6jbub58Oem2domxlwh9AHpuVlR+cqDtwPrPuhs3fPAgL6LlNkt9MGclQN/9o9XOY3F6fnQHP1nCzN2hP+qMWI1FB7eHNIqF6CagTLWVrmqMw5dowiCGpR1D57jiOa8SiU0ZfgdlR5Fw/oOlpLy/rQlJhrow+FEE/rgdVLbDG2dKNG7od9i7LndN4apRtHcwChhmQq507gloUO5sRslQ7Qr3pV0YAAf1q1tRu/+05m4sS2vilQb1lsrJg2hhtnE9ynVjSzOP3lecyKKToVb3aL93LVyXvI+Y7fuZ9+ZYjdx5CpzAwK/SkFVu8VLQT5enn0IS9MvMFQChEXtYdBro390K6+h1G/ZhirM0lAoZEA4xS0ftbyWHusueNwoQAWtNZ81y0q/04aaQz1+qTHgIHPUgImmhnjqMo1WVFhAmL1n9tZWSy2HbIeXBXHZtmlpSgk1p4Q0/UCkdIB9LvfdMQhPyM2Bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(41300700001)(52536014)(8936002)(86362001)(66556008)(316002)(76116006)(33656002)(55016003)(83380400001)(38070700005)(122000001)(71200400001)(54906003)(4326008)(38100700002)(64756008)(66946007)(6916009)(7696005)(8676002)(66446008)(66476007)(9686003)(478600001)(186003)(6506007)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fY9XuPc7TKIdqbuRyfjXSvHk2lGOJbFaWHofCYyMPD/SDnVgpwBQo2Lydqv5?=
 =?us-ascii?Q?MYGfPaj5gdERvjIj/tCRwum2o0SElQrOW5DKSkctRihzECLbncaslB0jfpZI?=
 =?us-ascii?Q?K/gPFx9CE6Um8mS1DkO4lyeS1RzX9WKruXFevUEMOXCyqgRFRXf7Tf36j1la?=
 =?us-ascii?Q?mDPBtTgHfeC6XpXHekLOChrKjhP8ipwfnU/VY2ofL2IJqq3FypIDGeS1B830?=
 =?us-ascii?Q?TXmnPjhlkYAFLfduSKjvpfkBDdomPVzaTq9PU8ciLss63OdDoaTxAOossVA3?=
 =?us-ascii?Q?ohYcIpPTHsJVEUnIunqmUJv1IRta+ekJZWp696ED6MetO1hWqEMeDa4PiuMc?=
 =?us-ascii?Q?0puBLIMshGhfJLgjpM7Pt1Ek5QPqotZL0a2GnMVFxxp2eDRhwZkqZ/Dn3xBx?=
 =?us-ascii?Q?5Mhe4Q5v8flxSLTn2+v32ILRENVU7UzarqaqxESvfD2tODevqsBbVY6ujuoE?=
 =?us-ascii?Q?3rDNzfaPm5JNzbMQn7nbKbBWiAmivyjNCmlR0q5X0oBYL9PZWujg2foko4fH?=
 =?us-ascii?Q?IbyNGKyZYR6HOKnJ46ZDn4fEu4WtuT4hKeTuKgCnsQv292jLp2YF9k2+2C7f?=
 =?us-ascii?Q?p8zT+rqtxg1wbE0PVEtDJJOx7EXICnJ+ZYJVcfNn9ULAf1EzPlibNx1Sad4f?=
 =?us-ascii?Q?Y3e5HwBxyY9nk81fTs163460orFxKA+POvVekB8zWY4mrM0Udzeg6l2ynrPZ?=
 =?us-ascii?Q?0BxpfXwO4e5nK8leUtM2DYRqRHiMxXAv5vwtZTz4Az7TSUpYtW2IUvu4sPjc?=
 =?us-ascii?Q?55dq7tg/51oJ9NkTrGUW3COJJeuF7pu1K01hsa20owrbJRN5jHpzS8i0G+rG?=
 =?us-ascii?Q?4rMpuGXq/onBm9McoXtD474gmGLHZ9l4GghriaKsfdjpTVvutWlMkaXu+Dwx?=
 =?us-ascii?Q?vTWaABDrWieQF02Vf2RTpRAxnieC1djfxFcWHWO8kzTb8l2qh/qjlEB0OnpG?=
 =?us-ascii?Q?47k4eLWsiUHV0oqeXaR2OvTe2iGpJEH9bAE8Qxo5Eg6QKnu7iz4juZmZDAkT?=
 =?us-ascii?Q?BD7oC6JqQrRsD3arU4kMoXAvWcxFfaOrdwg78OAFPRpRDGkYnR8jAHhgo6h/?=
 =?us-ascii?Q?ztgqbhEUBm3s87oCbAdMT+uu/QO2EEtYj4U+815YAqhBJp9A4zgwTyc+c3Nv?=
 =?us-ascii?Q?Ulu7L7YRu4YESYotFKu2eCkF3/RBCVHtiJkUnFpQvI+S/GAptJzYu9Dj9IPZ?=
 =?us-ascii?Q?/M5SyKr+6ub3oDX2wfWdpem9OigHJzKvanBVQA9c21hOHenTZ53yAzXtiqsP?=
 =?us-ascii?Q?k98MGovoXgwnCRlVS0k7oemtuLHfZWQqUPG0/+VtDB611L1vKZJcr3lBPxTJ?=
 =?us-ascii?Q?5TIii1oJ1DFmqKHsfN1aADAMoQ+TQc8/3Y9E9ULdPt+gCD0Csox0LZbkZTwR?=
 =?us-ascii?Q?JEFzlwREGURBdNn6taZ/vwxixjc3pOlZJ2ElUiy2jzoeQZmFCodHqRJI8tef?=
 =?us-ascii?Q?JhUCsZUKLFfJfRBodnbNJl89oOGV6cL2CoK2QvEhBq1nTjQzfwJp8QUFaiSF?=
 =?us-ascii?Q?U3afVVtoqK3kdAwFny7Qo/SlHtc+rXId/4p1fn/QJ95Z+LbvEmbhzvDtq+D0?=
 =?us-ascii?Q?5KTCW4IoZfZqHLLTiTcCYwSF9i7epSoG80vBvf301NDn8Vk5NmvsByPuEktM?=
 =?us-ascii?Q?11W6p8jZsot+z5t4BnoKRbw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d66f8a9-c56a-4b0f-e448-08db0043b024
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 08:51:32.0918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ea1Y1gutH5s6ftJFXNylswrB2ALUYQOcJs26AUBvWhs7qEypleUaySpNTbLtGNqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHUtvJtFbtLl0GNxogxUlxAsqBebM2nZ/o5svl+7dy8=;
 b=fNNWWfc09/B52FzcG/A37tqD5vsTyRreuPRvlkF1lAR8cooMmG/X04zPtYtvDphVvnstRTxx03FsNFidLKOiKUzSLfCZ8fgZZWUaRQHCt/+4JXAQOg4dUeGZxqYQOIG4cazOjD2++5gv11aixrBVoPz00vMutD3UbJmjmlhRDQY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fNNWWfc0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Luca,
> 
> > Reduce the configs in the kria/uboot.fragment to only what is necessary.
> > 
> > This patch has been build and run tested on a kria kv260 starter kit.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> 
> > Apologies for the delay. I was hoping to test this patch, but I'm not yet there, so for the moment I have a question below.  
> 
> No problem.
> 
> > ---
> > V1->V2:
> >   - CONFIG_DTB_RESELECT is no longer removed
> > ---
> >  board/zynqmp/kria/uboot.fragment | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/board/zynqmp/kria/uboot.fragment
> > b/board/zynqmp/kria/uboot.fragment
> > index 9e32edfb36..a6a262a562 100644
> > --- a/board/zynqmp/kria/uboot.fragment
> > +++ b/board/zynqmp/kria/uboot.fragment
> > @@ -6,9 +6,5 @@ CONFIG_PHY=y
> >  CONFIG_PHY_XILINX_ZYNQMP=y
> >  CONFIG_PINCTRL=y
> >  CONFIG_PINCONF=y
> > -CONFIG_POWER_DOMAIN=y
> > -CONFIG_ZYNQMP_POWER_DOMAIN=y
> > -CONFIG_DM_RESET=y
> > -CONFIG_RESET_ZYNQMP=y
> 
> > Does this prevent the 'reset' command in U-Boot from working?  
> 
> This patch actually has zero effect on functionality.  These 4 u-boot configs are already included in the xilinx_zynqmp_virt_defconfig.

> I see, so the patch is fine. I would add the above line to the commit message to make it clear. You can send a v3 unless some maintainers is willing to do it while applying.

> With that added:

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks.  I have created a v3 with a more explicit commit message for your review.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
