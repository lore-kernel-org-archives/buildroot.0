Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E320C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 09:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39AB540570;
	Tue, 12 Apr 2022 09:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yD4gYbqbpQTU; Tue, 12 Apr 2022 09:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD6D40169;
	Tue, 12 Apr 2022 09:44:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 146BF1BF2A1
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 09:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8DEE60776
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 09:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cmurX2DDVqR for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 09:44:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::61b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B64CB60615
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 09:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ5LTheKKhFnbjmZQfZUjcXW/xtcWox5xqXtnvZ9+hQokXoenEbHWUtgvzeuVEl57YfrEDNYWkTBU9uRDYaGAyKZk+Dwq1uSR/IHdE47D4wQ2RIuFRNm7E2svkRHCtVUcdldXb6AK8F4tStk11Sny0FeHjNRvLRq0v9n1qRT1Hwm2eBraue3n9JpaTsgdM1ztbkz1l0rHlukaJPrzxZpkTO2wlGTYBlZAEKIVT4yUbkRkCgf616a/uCcjqKqh4MHYMsVJogSR9OPWHFCO1C2J17+H504WxshI7tvIq+K9HSodZd43WwpRwhrkhsW01LgB/6x5/+DT0oHatsXV4HA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scdcaNXVo1fSi6xFMgEdhJXg3SFxB1fsLccRlXIJPQs=;
 b=PHj+wMAjJBE3ErPQxXy5BWbwnfILX0JIVkFfis4zam7d8ZwklQfggrlowHTRK7XyMZhscu7nIDi7tjw1j0HYxZoB+Fybf0DUt1NeR78u5EvyGyultmkNn6LoJXpdYV57TJyildUIdBQ9dh2jK7v5GVa6LWN+yGS9t4kw5JzhqWIp9CIFVbijUipY9DJPdu4+SxVw16ykNX99z+AildMLLtNbpqM9UK1+Sy99B1ssHMttBGM9OmLLdHsAs5Po3UhspIZwkG/b4rQch5NCMt7MZv14P/2dMdZO3wjssTJ6UphfYa6J0lzllUJqonAIF3SBjfOkNhSyuCOiRYI+pHnsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scdcaNXVo1fSi6xFMgEdhJXg3SFxB1fsLccRlXIJPQs=;
 b=PPfkHgBFS8lHuACkVO4r0bIxdbbC/nYtJbTDv+nx0Wl5T/v1bRHahhVE9QY3NbmI20UdCkhVBeoDrQ1mcXMNtzRKBapc8MeP5tLhOQJ+5QZavr8JWHkSwcg8SaGsKnMenC5ni0rcMTRsQdk8lDVLPMtS0erc9B+n2v9yqU/HkUI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB4389.namprd02.prod.outlook.com (2603:10b6:a03:15::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 09:44:36 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%5]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 09:44:36 +0000
From: Neal Frager <nealf@xilinx.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Xilinx KV260 Support
Thread-Index: AdhOT7R9yeLH/m23RF2Ss8U5bJOKdw==
Date: Tue, 12 Apr 2022 09:44:36 +0000
Message-ID: <SJ0PR02MB77589C6E412691B171FB0527D7ED9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15ec6f47-5a2c-4838-b6bb-08da1c690e72
x-ms-traffictypediagnostic: BYAPR02MB4389:EE_
x-microsoft-antispam-prvs: <BYAPR02MB4389F00146A8103EAAC82C67D7ED9@BYAPR02MB4389.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IG18ZQ0UBV7ZdXD02HagOFu4TNCTlqwJ/LwacNeF8cAmLpqViglDmxJibqUA+v9RoP/1zaxRDFhOQHPKIQXso4qtGoFv/k4St9CA9bWjRr6MfkIDu1C1DqKzfPTUoFaYWgDOh/6d0JOwVc5G2/Z3KwvfMwNrs1C7mr1SyJg2oy6KXXONQVxhAGSWhqK1ET5rTnACx2lm+7YlI7aJ/LAIq9zcNTM+AovsvMn4hiQQ9TjAS9paN3A7nePva30uHh0jnIgIfRpIufYCkRlvMdJOP0nPwLDtFKIScDo8NVcoKx2+60JwSySg5rNjZ6PKGtU6405REa5HAyO3a3jeVDGybPBwwQvSeIOgdKJ6Zm4InnHzMsfm+h4Q9RzphDGzj2mqtLc6FiCiQUbH/S6QFnizK4q9wh8nIVbbag1lQFwCY0FEVabhkvbi9NOA6cBqfc2Ku9ftT4X+yc3v4Dcy3UTuNET/9Y0vPUzL9jU3iRq9u6J0JoT5GnpQweHL7j8rrjqmVg+2VRMsSOjTSJHm6i/y0GAfQBwJweuRKA1foFPLB0D8DHbDTFYmocqFT36YA3wW0P0V5d0tbMNNq0blOVpYn7YJaDRsoIzKkMnkU74NT3fQoG5MB1ZC/q+oinkr/KlVH+NQbxWS072BSHFGw5AfR1+U0DoirLgv/BkJQ10H822RDUCYsE5kP08HdWqzxzJhKruq2k4lfgAqE0DrFEOfG9EJiEhhHNR67mdTHbGjROI0mVijf1nBpbskLuUNhK1O+oUxxgYa94+i7l274IGPCoCV93OUKFDiQgGQYms/Cwg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(55016003)(52536014)(66556008)(86362001)(38100700002)(122000001)(508600001)(71200400001)(966005)(6506007)(5660300002)(38070700005)(76116006)(66946007)(7116003)(8676002)(316002)(64756008)(7696005)(66446008)(66476007)(186003)(83380400001)(6916009)(9686003)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IRqRSDgCDymCI/ntXfXSwSCDTHvM1cob2JCBxrt3bhnhuQgKnwHLad7yXxid?=
 =?us-ascii?Q?VMSDI+hiVjEzPcqr+Bl6g0jTx+7PJ8gAlBWSUd/1XjTGrjVU3F/6AsT8K+4d?=
 =?us-ascii?Q?cPc/Q9IK27kTute/0AR5w89iku4t8UtRXSEvBGlB3mS8fT9VDHBA0kpJaU1/?=
 =?us-ascii?Q?pifrlH0CdyktcEaKLjFxdfHGNDQwmwUv24jKZk+AGh6usl0vs7NaC8jb4lmy?=
 =?us-ascii?Q?LLv33JnCVVvvSPAUdDAUQJVHT+7BVfnEvy082kPaBVwdscmQ979raqowhlrn?=
 =?us-ascii?Q?rpjXA9f6zSm0fgGPc+4q5Dgg7EmpiYYR4xUg8jqmNbe72kgal0Em1njkvCQa?=
 =?us-ascii?Q?DMjMHrquMf0B2zMxA/l+n4QpoLFgpXaXxzHsolumx25Ahq0ySccnWCyP85eM?=
 =?us-ascii?Q?9N+7Ys63nVpZWyJNBD4Q+nYuPnsU415y3pht1h6G7detcyKykUmveZNJFMUh?=
 =?us-ascii?Q?YXn8VYv6nuz929HRWh+yE9RMojNjrYhw7oTVHRWm/ZSCWwRWd7aRPz9yU40g?=
 =?us-ascii?Q?U3THPgHEWBuNY6yuo8qG3eJnMv+G46Y5E8BNpkZmIVMN/eOBRaWLPYLvKhGH?=
 =?us-ascii?Q?hr2OxAAuTe9I3ZsvXejbhJJEwmtNDvI6DbQ4/8nXDs01MOez8H90C8+38Toj?=
 =?us-ascii?Q?D9HCBByoBDetBi9IJMZ/49Ci/nbHirKziaIZQJPV+LyDRBQF2zGiae+e7F7q?=
 =?us-ascii?Q?enHrt+AQePzBvkPecYX2fqYTqCue3J0S1AQMMWPJCmdZ7Jp3QP2YhhZQg3gE?=
 =?us-ascii?Q?lkwcPSbb+sz0PlvvBmc9GUUkNVVnfwmtIXeOoPzm+CkWydEpJbGwzqtHc2a6?=
 =?us-ascii?Q?kQ+VD3TSztD1TDOsjNj3rQOsqxd06OEbuBbB8vHCnRGVuzdgQfJIHLl+eG08?=
 =?us-ascii?Q?7Hecyzc7DPKI7O0NybWAmFLQCndSR4FF9BMoPFoCGgNW+SwMEj8docco3Fw3?=
 =?us-ascii?Q?k6kR3cRHmCEXz35D8ZYwKQpcBZeTa1qUcUwiJ9B8Cv2jm8jU5dBRW6VIesXQ?=
 =?us-ascii?Q?Qngn31Sm/fTCEDyDAJF1kBlY2XSi3Zkx0dd0BxdikIqPfEVVNBG4rAWkqNBJ?=
 =?us-ascii?Q?WIXMElX7OUxHvq8NYfbGk8NyAQDlia/pfiX8aJ04x010rw1XDPa9HydutYPV?=
 =?us-ascii?Q?Lbtt1XzIVTfwHIRxMGi38yRoA9B0QDOxRqLwTSfxhEsTRkjippxtbX5PqMtu?=
 =?us-ascii?Q?u/ptdKEEoIfbZp3JRT2fOqJPaFq1LXsz2eoeU/+Dl/CTCH4Zm+4SXLspS2nv?=
 =?us-ascii?Q?v9rEZ7JIkwL9mKDzRkaA+ztkeESr30FE9z7Ku9aryqe/qifqgdCzHVvl4MZB?=
 =?us-ascii?Q?Joanv4ubtGifDq62g38wZYfBaBQAoA3WwpCPtrzQ0GPtGdCgtylOXLqxERkz?=
 =?us-ascii?Q?ejPyEP048bOEIuHOWvf2ihAIxG9CdbsbDK3Br4RN3i2ul8UdtuXmxSq4W11C?=
 =?us-ascii?Q?AegyDhbuFXTJFLBdL8ftsWxmT6Otplet5JZQJy7IbVFzS5lBmaViQUxN0T9D?=
 =?us-ascii?Q?IqoSxWu271n7LnaDk8TthyjWYjUkvKQd2ztCrmeHWfwbUx/kOB00bwZVRzcK?=
 =?us-ascii?Q?2RTncxRWhnQbvfk9piw35uOhRtErt0DhFmCTdjtYYBqBBfG/UdYvpjVphiCb?=
 =?us-ascii?Q?utoNws8RNCLn9cZgqffESV1CpB1Eaw3/TnZYgWjHK9TA85sO1OFcTxYfJVKf?=
 =?us-ascii?Q?T/9ZlJ+9nOPVOLr+TwwV9INsc9wjy+4j+cdoKldzL3wGG1LmNDU6ukcEUFWg?=
 =?us-ascii?Q?OriyDZXZN0l0CprFo2Yc4anyMUKzWCXUHW5XIg0G1kEoiXzJEG0D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ec6f47-5a2c-4838-b6bb-08da1c690e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 09:44:36.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yi/fFz0vpMnUbzE9mBGvgbKYpiMUX0Kqy11+cQ3Q9gPVaPhos1WefAYqEowgR6Ul6AmFOMBSyKONSrURAPvMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4389
Subject: [Buildroot] Xilinx KV260 Support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear buildroot community,

I am working on adding a defconfig for the Xilinx KV260 Starter Kit.
It is a low cost zynqmp development kit showcasing the first Xilinx Kria K26 SOM module.
https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html

I have managed to get buildroot up and running on the hardware, but I currently need to implement some manual steps.

Here are the issues I need to solve.  Both are related to a device tree overlay.

1. Install the zynqmp-sck-kv-g-revB.dtbo to the output/images directory:
BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-sm-k26-revA xilinx/zynqmp-sck-kv-g-revB"
BR2_LINUX_KERNEL_DTB_OVERLAYS_SUPPORT=y

I need the build system to install the zynqmp-sm-k26-revA.dtb and the zynqmp-sck-kv-g-revB.dtbo files to the output/images directory.
I have tried the BR2_LINUX_KERNEL_DTB_OVERLAYS_SUPPORT option above, but I do not see how to get the zynqmp-sck-kv-g-revB.dtbo
Instead of the zynqmp-sck-kv-g-revB.dtb.

2. Apply the overlay to generate a system.dtb in the post-image.sh:

I am currently using the following command to generate the system.dtb that I need for booting:
fdtoverlay -o output/images/system.dtb -i output/images/zynqmp-sm-k26-revA.dtb output/images/zynqmp-sck-kv-g-revB.dtbo

Does anyone have a good idea for how I could implement this in a generic way in the post-image.sh script?

Perhaps someone can help me with a nice way to automate this, so that I can create a proper buildroot defconfig for the KV260?

Please let me know if you have any ideas or feedback.  Thanks for any support!

Best regards,

Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
