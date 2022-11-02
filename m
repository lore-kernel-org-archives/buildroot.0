Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4113C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 16:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 725CF60E63;
	Wed,  2 Nov 2022 16:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725CF60E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMhBbXBT-wnl; Wed,  2 Nov 2022 16:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9209260E5B;
	Wed,  2 Nov 2022 16:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9209260E5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 078571BF307
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C61F2416D4
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61F2416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4c7TtGgHVBT for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 16:56:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E34C416D0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E34C416D0
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 16:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S97d7y4Oio5OaIXj6S3aQp2CgRezFWl55I6+Gi/kG8lHe3ogBWBDXJAWwMfbF7qYbCsxcs1OMXsX+BTBvSx/aOFMN6KzH78Vm/i1B49fn3MkSR6tQyVkZkEkms/consvYoZE5amfioWWaYg+dbEh6FbxkkAwVVXRNHdoXgmViFk8seIWAdt1rykKgJe4klbi3Q7aK0BvUr/2ByHAQt0GG/RLqnIBbIZdTbYOG9lZX4p69YhddqpFd7nZiTvPQMdXBBJ6Ol4VjlrqgKt3NV2evd7J4HbPzLK1iSdLY3yTnC9LhBaiovGyNyvLSmM4V4kCi/mWJKr9325O1OCBYqZo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th0AYDgoxq6gCqgTBKgKJkxs/9JDs9gZcDtdYEG5qOs=;
 b=gmzVe2Pp4AzNga/j4rtNf3R6cQfMtT92FBDZMd6nD4xZK0hwgm/4paLhu3T5WrmdUKhufPKYuWTY7ELcXI5uQqcLI2c8UmGIexQ10WlOc7EHppXysZmPXYRgvsrEx+R78Tlh/K/+dvIEQWEz7wPuKrfL2+8LLtYVJS0seo3RGPKYSYcUy0Mq/UB+9p2wo5zZ1zxY1EViEa1HqpaCTy92B86YsyQQSRwnrYLmK4qdS+8VSg1hRZhNcYrqV1Hi7+PGhzEiTwK3ITsnI3TCNTbP3upZkMxxcdQMIKV0EYa7ubaBAcTmmSgtLIXKy0n1GEWS/yh2zfYKMdgxu3x7E8Mchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 16:56:26 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 16:56:26 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v1 2/3] add board/versal
Thread-Index: AQHY57QJFMeAQuZyl0SGBDmD8mbSS64r47mAgAAB0gA=
Date: Wed, 2 Nov 2022 16:56:26 +0000
Message-ID: <CH2PR12MB5004F823D9096B44855F0129F0399@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
 <20221024142216.31273-2-neal.frager@amd.com>
 <20221102173841.51cb9d06@windsurf>
In-Reply-To: <20221102173841.51cb9d06@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB6766:EE_
x-ms-office365-filtering-correlation-id: ff8f0d77-65d9-4aca-9d3e-08dabcf32e32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i6WbAamKtnjVwTfEVA5GG6/3GQ/r7cXjB5EHPK9rfGbDuwBTuwBXOfwg5CT8XmAKAzpFL0FQvrCbyLzRJydb27LRdf3gDoQv49IB22LRpDouHgTakxGXyGt9KqZZDgpW5odcRun+/WSwsJk9x2G5GvK5qlx8VPbFr6xiDnouxnLY7Vj8bCXrqmCWtXf8anp41jNcL9mKQZ55CkSNeY55MYOw58ktB6nfqjf6OoBhLlI6V3R059QEQ5/k/v7GZu8sGn5jc96w2zElCfE4KHLd/7d9IN3gWGDT4vJ9Fn7+moAJz/lzvKavyxgbe6hTkAIqBh3S8PTWyopOW7M1KIPFUATFUUuAnKYBIRXtrh6mz34g1xsoAw9cfulfRwXM08FLRjVGYHk0y0KKDeGi6DPUPTJiNvF69BFHqL+a4MS3IQq5wlXrVhNsJy4uZa4aziuv7mn4w9RxVHatOSqumcclf1olSGNe6mVu5FxSDo0b7TrDVN9nz6yPl99L6dT8MCn8PZO+kGOSftRj5cJgoJue9a9jIXiwF8j/P/YOyjOlEpqHGnyh1R72zl2XpTy2rVvBc6Eu+RBmDsqr6QpBLrfQYjT1ZE9hsreYDOvjdetyEeka5lHj5ymIn6//ua5YqjLthtWm7IzoTRdQtVAyYtv3/pMOCU/bTLif8lBunBduhiMA3tBAEiAiACXspvrVgiGrDmRCxQPqJQr9E/ui3MZrTtEnc5SA+dJvH9nXs5I/ansxu4Qn55bL0BrinCr2pRZ9IOit+j4C+3MYeUYVWXlXjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(2906002)(52536014)(71200400001)(6916009)(8936002)(478600001)(54906003)(41300700001)(7696005)(122000001)(6506007)(5660300002)(83380400001)(186003)(9686003)(316002)(38100700002)(38070700005)(33656002)(66556008)(66946007)(55016003)(8676002)(86362001)(66446008)(66476007)(76116006)(64756008)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DO98zNe81sa22m5m3R58fQDUApTpmshKPJi0b2hvXgzrg5xinSjBvN31NHDj?=
 =?us-ascii?Q?lsrMdqde6GUhUUvberagQehtLuZTpWYXFkGtxNwBw+lapkLy61Ggwht+lhUQ?=
 =?us-ascii?Q?wx3J9JrWXnMUKzzugzAmAHrnBft48Bho+SqgHE9SsRx8jvbcDoSLmuZb+GqI?=
 =?us-ascii?Q?1V14KzeDLyhw3wD9fmckEHb6z56ubv8aVNTPDmSUPX+7PPqogZdJ7JTksN41?=
 =?us-ascii?Q?/JqKg7AKeF4GcJZFbvIElPsHWteV+bTnSfs1a1N7isxyzauyXuWxV/9DcVYP?=
 =?us-ascii?Q?qBCNOUFrty84nDDO1sIqAM7qfCwUx07YzOqeyhmPocqRTOBt8EpbiJHv+68f?=
 =?us-ascii?Q?4qHv4/6xvp6OQAsoe7zllB/OoishCSkXtdbxr24QCAf/4vI0SFvTLKUzs0Je?=
 =?us-ascii?Q?Ti5SqfVjUXcP6s8FsOF4eio9cRK3NURqESe2YQSXC0tJ2SRSo3rU3zJsTkQ2?=
 =?us-ascii?Q?4viAnrMDgGVGoLHMo+Ilbiago44tMyYuqiZuQVPErlZwA0boSct24kY59tcX?=
 =?us-ascii?Q?UuBgm5JOTvP68dRazrMWBwaYuL/El4ESUSZuDUNJmw26rpUfd0/tftd29JC5?=
 =?us-ascii?Q?0p8XYvqOl9Y8zG6CnyaTNDsH95aOuN1deSsu83DW0dgyCfY3TvIa8nZIwh/P?=
 =?us-ascii?Q?MzK5/1KJgyV2uQ2KNga1lAPnyJMnaAeki/jAO85H+CXjtPaQZEjPO5Fslm6+?=
 =?us-ascii?Q?1oh3IXly5TcK4+RRK2rSPmpQdCeDCXcWjC5IJVKG9q8TjKP7bXkJeYc2pJcs?=
 =?us-ascii?Q?HxA7SCUwK5nyjU8Aj1KY6Mrtsq6SxBSMPsnZNFw+pXI62yg5ig1bVMaioGBS?=
 =?us-ascii?Q?KQ1tnGcMrIoU5gne0gpFukO4YXxmY5Cxo4L9nES+KFgahXRupzDvXar3nKwg?=
 =?us-ascii?Q?ehnCWhepHYlQQ+tNScynwgnjKvWuO149S5U2sr/02t7cfXLBDvsG7dhjQ2bS?=
 =?us-ascii?Q?dLl/BsZm5Ufw0hQToLSjuGRSDcXtmiCYrt4pqiXy4/g7P6XaWv0AsWxBURCb?=
 =?us-ascii?Q?JtMiyZA8AkeubwLoG/U9O3jnz2qli+0+FX8qNtXAPxTwyO5ds/GPWj7knAhw?=
 =?us-ascii?Q?att+xwtQCyFhJbf1Uy7rK4VDHeL/+UuqiYuXGE4zYCW5oKs3IDyzQw3I/rYH?=
 =?us-ascii?Q?m8vTxDjVmgufjnoyz+AA0zdld59CpvnmlaXN4qoehNGTdZALHps9AWdFucWK?=
 =?us-ascii?Q?LSK5L0VeBHiamXWDtgY7s589Ipro4Car9hh8R9fs6BUOZQhgUPvJxwFNucWH?=
 =?us-ascii?Q?Lg6/HYSADsEvJOp/9sZFsqt+0WtIh0rtbvlVYjo6EHn0EuUFwB9ltBBMtzEw?=
 =?us-ascii?Q?vJFZDImfhCoN3U8W2Y8fJaRSQ5bWplRojAclz3gQuZIh7DEnEcb4qLQc5R7Q?=
 =?us-ascii?Q?DDHqXsrVQthh9XWXnVorFTucDnXLaMopaL9Kc7Vmcw66KSdQCguCU8SH7woG?=
 =?us-ascii?Q?NXHIe/WcqcH2mD8qEb0dP2tVYGW++CLQafPHUDno9ueAwRsMXxFy2K9f3/Nj?=
 =?us-ascii?Q?GKDqPmeYUfWGyxdwyK8cycgpi6lcNIZxIoGxkzm3ho7xqZB2k12k1H2rVhze?=
 =?us-ascii?Q?ZWcExlWjbgw0iVz4pxcav7/xGndQ8ttHY2DcYrLMORUajy3ct2IbbHaiS9UN?=
 =?us-ascii?Q?eLy+CMd96JALyvCkTQszPNM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8f0d77-65d9-4aca-9d3e-08dabcf32e32
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 16:56:26.4177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIvZGRiVO7wpR389Y02W12PbgHlMjAtL+Vs7lvQXc8iCuO8Uqd3RyOpGH17WVO2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th0AYDgoxq6gCqgTBKgKJkxs/9JDs9gZcDtdYEG5qOs=;
 b=EvEM7NquBEyx/XAunXHPqS4A/NZGBN6h8Xw7KfDtostnsm8xisLhICI40RyomRqB1FWG6rnbg1EzJ4dKCeqWTXzxXaTqncLRrU1T1YdICrTOw/QZewuE47PNGRyOi7hqCQI7hvypD7hnKS4YmQHhwKdVUPZsBKRkza6KrLZ3sH8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EvEM7Nqu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] add board/versal
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Please note that this is not a full review. Just some comments.

> This PATCH 2/3 should be squashed with PATCH 3/3 into a single patch, whose commit title should be:

>	configs/versal_vck190: new defconfig

Ok, no problem.

> More comments below.


> diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh 
> new file mode 100755 index 0000000000..0713bd1b05
> --- /dev/null
> +++ b/board/versal/post-build.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +# genimage will need to find the extlinux.conf # in the binaries 
> +directory
> +
> +BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
> +	__HEADER_EOF

> Meeh, I don't know if I like being that smart. What about having an extlinux.conf file per board, and simplify this? Sometimes dumb is better than smart/complicated.

I understand, and usually agree. This post_build.sh actually already exists in buildroot in the board/zynqmp directory.
The reason why it was done this way was because the kria kv260 uses a different serial port and sd card device than the zynqmp zcu boards.
We could be super smart and have versal use the same board/zynqmp/post-build.sh, but mixing zynqmp and versal is probably not so clean.
I could also revert to dumb and easy, but that creates additional extlinux.conf files everywhere.

As I will be maintaining these zynqmp and versal board files, my preference is to keep both the same style.  
Either both dumb with an extlinux.conf file per board or both smart/complicated.

With this in mind, what is your preference?

> diff --git a/board/versal/vck190/uboot.fragment 
> b/board/versal/vck190/uboot.fragment
> new file mode 100644
> index 0000000000..961c4239bd
> --- /dev/null
> +++ b/board/versal/vck190/uboot.fragment
> @@ -0,0 +1 @@
> +CONFIG_DEFAULT_DEVICE_TREE="versal-vck190-rev1.1"

> This can be removed in favor of passing DEVICE_TREE=... in BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS.

Ok, should I update all of the zynq, zynqmp and kria defconfigs as well?

Thanks for your review!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
