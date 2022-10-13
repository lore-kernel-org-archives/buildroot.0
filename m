Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DD4C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 06:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC7FD4031F;
	Thu, 13 Oct 2022 06:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC7FD4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QR7IdvAcGX-Z; Thu, 13 Oct 2022 06:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9D1D40283;
	Thu, 13 Oct 2022 06:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D1D40283
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 729151BF86D
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A138419A5
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 06:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A138419A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XQmIzGynscy for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 06:41:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9531408DD
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9531408DD
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rzc5uZxKWSsIfWQ1JCmmOrPPqS2V0GpCYtc3O/MrUb/R//bkPRgdKUKykhBBDV422Hy3FP67dstOqaRnCTHtgNvJblSZQN8tdbzwIlmEHgJxP5lAjS6sLwpiSIQ8eDGZL9PdK2JDgt/b0WNJHNZQ1DOoI8q/PtRFGMdyiZulY0zs9H9I7ImTVkRxe8s904hMq1Wx8yk7O7E8rqEY/HxOHzYX/OvyBW583QKCbhYh96sQZzRCKfITAYyH1rdakzAGPcofOyxWFm+94mqY1y6f6gF6mkBvdviYpcR1bLNrT6xmCDpPhg5L4r2AkV7tvrcuAW5hd6cMouqLRYmpQPasvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZceLQoXAfi7kWmDvt49wz6UNkKXaJjbHynnN1aOibA=;
 b=QBHF+fhg2EZkcbmwurTgGriK5mea9F6EaNwbEQLGbXA9U07sQeEVXEAENPm342M7ZPO+/QfdTuK477ZyWnQj5/7l1Pso48ACtYgdL9rpf/C9NcQ99AdkQX5/yihWemJEcOrTcPqbX+uL954DK0QKvscdYEuVEI0gYL5++3MnNAbBKA2YNmvXyKmgIKBph2pcJkRo3g7XM2acumn2xQ5g+Y9be3DReGcJJqcH85nHQKTf/oucdR8gzCW83iQftZMN91AWH0k/MM9QtFUtV5WqbxCrlAX6+Walkf21YZGzZckC4REJzisbHq0B2h9NNuJWs/3l5++3aIHdvt5Xr2sbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 06:41:46 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::eda2:578d:ad49:a8df%4]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 06:41:44 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
Thread-Index: AQHY3mO/5f6jErhqgU2i36HVqPyNE64LNu6AgACcO6CAAAz+AIAAAKWg
Date: Thu, 13 Oct 2022 06:41:44 +0000
Message-ID: <CH2PR12MB50048D0E5A45520ABCFA4678F0259@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221012175426.32367-1-neal.frager@amd.com>
 <20221012223315.68f43720@windsurf>
 <DM6PR12MB50075AD3D83E1AF519324C86F0259@DM6PR12MB5007.namprd12.prod.outlook.com>
 <20221013083856.4624e7c6@windsurf>
In-Reply-To: <20221013083856.4624e7c6@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH8PR12MB7447:EE_
x-ms-office365-filtering-correlation-id: 228da7b1-07de-49c3-6a82-08daace5fe67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Va5MDf9l0ThfbT28k5mgZELT5qoGDPf1yx77ryeiRbotxvPGJhJHr3x/oCVuWuyQ4z+nLydjPGFb2m2nFO1DGpqBC/0G5kMxTzGNwI7ypn/joZa/GXJIvLXuNWobzfO7x5IBCexzxSYHZD5QQ2rvYzsjZJW/DNNYQpgV4q2LJ8TmqEx40DNGVqHHET8Gg+oiWQ8a3O1GdufIIWsuzpTqM0eG3XJ1lrQ+hNBbsyUQMU9dbgcicdQfwutSzwIINIqYG/qakkNVMck79XiFDRcYni/c+/hKzaabppBkDG7NlpyQmMoMRSEmWnAiUNHXOu2dMUvdG88iGfk9TGEnAypaWzcHXYRHqdKAXyEN45p7dqJDbw/jWbzrtFxisxyH6gEKhU9rszqD+0MQb3wTV+vLB6G1OVw9IQXblZhWcNmwniXFw3A7bOh+ESsplh2C1WLt+V9MAQd7FoPFO8BxL+TYoc1kwx/FRCr9Qvs9A8SDPc3ctQZrx//CKhT3gAPgw04p892xfg+lRC10ppvCGO2OucaeddMxRSqLA6KQqQ11AVY1lpNcpLhvNMMmvFzpo9KoYPRTXjE/WyS1yXimJ6Zug5z8IOlInsZrjTKX+dWeb4fT49kraqWHrDRDCx3cy523R+LyWgpFj7ydE1yEzagDPpKm0TFFlKvwSzmfSoNpJVBa3fVD8Qjh0+uxGi5Q2IXJJCCeONxCBH/runhKuZnFIl2YqM0A6603rCGrsgw57qhog0p+m2PYJFr50xgDX97gwHUAUIjzQXw72t12g2DTuoLhGM190YTV0ZXGNF4Gmow=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(54906003)(71200400001)(76116006)(66946007)(38070700005)(38100700002)(4744005)(2906002)(5660300002)(66476007)(64756008)(41300700001)(8936002)(122000001)(66556008)(66446008)(8676002)(4326008)(52536014)(26005)(9686003)(186003)(6506007)(478600001)(7696005)(316002)(6916009)(33656002)(55016003)(86362001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JNMqsOU64JYMur+5TMMwbpOVG3SdRDHVEEiIZKb9xDOUHRBA83Q/PVQnr/XD?=
 =?us-ascii?Q?AddlYt9DmFd9Cy95s/64MAfK/9joLEWUCooCKjCZ2jGdaOKLMA7oS1EyrEhP?=
 =?us-ascii?Q?UkxqiykondWxCwuOx777wYttiPInVqfy83E3qmUZvArH918xxlx2yw8pw6PB?=
 =?us-ascii?Q?Vzi2MM9NJSL512+lz80qDVwI9d+42RkRFqyzP/JileUeXJzceeKO5+1JG4vb?=
 =?us-ascii?Q?t4X6xsXtgZQw5ClE8+myu7xWuACJ6/DhPEO2i5e1eHiIcLrLUOv3AlJYibgq?=
 =?us-ascii?Q?t6BP8bEhbKCGVx4rxIW21opsZFv7xqm+G0YLJcC8/2ZJl5TqaU1gVMQan2V6?=
 =?us-ascii?Q?MK84tVgPKMPI2MhUAsotKyEKIOGO8ML0bdEoCeSspgMJg6mNZ/b0L89hIG0E?=
 =?us-ascii?Q?H/7VqIhsBmX3Fm8AS9hXL+Ai1A5CbxMsGGXD5XmwA+umQ7Zh1laInWDyTUAl?=
 =?us-ascii?Q?rdRrIg3uQOpFNPW5EO86ypEweiESTcMf+yTBDBgWHivb2F5KnqC/aNhonD3l?=
 =?us-ascii?Q?cYpANlNTA113CcrWAmHrqXcW8svzPp29uM/FOyuQ4xN0XWqIALgmpKQeNGC6?=
 =?us-ascii?Q?dO6//zZGmEaWfQiN66JCCG3AdVK2C+Eo1IHT9I649/zsY0K5l3wus12MJ3Z1?=
 =?us-ascii?Q?QArgzRw6Y7o09SqlgVEb7R8cixZarwJlxSdBL+MyqWYS7I9DeRrEAjXROGwD?=
 =?us-ascii?Q?5UPxF6L4QWqVcF0v6pWW6HuF2wWiUOCoU4I3jdhbzrhGr+fZ3uZrbkcO+JL2?=
 =?us-ascii?Q?A7chaX/DsbndAIhQdP+vpJm0Yi3eVsH0sDrCovikN9mfu4RQNbakWT7nNay4?=
 =?us-ascii?Q?VvfFJ3DVfrtdrJIwWFItXhDIWpV3vbqm7RVyyTai2kRGZ+SWDqPWhP2SlyCw?=
 =?us-ascii?Q?pbxvDf3eI9FY2u8B4vRUYO/FvdVuI2GtL4dzb7rvLMZQUvigrVMSiSTik9JQ?=
 =?us-ascii?Q?0pAe6RcY266Fqzv+LZ0nfOBTqzJNU6qf7SgqIma3Xr+9k+PfrMvNx46MDw1F?=
 =?us-ascii?Q?bVqCNCuoltAR12cfR6rPNw6MM/KIMX2yHqQqX1m43ECfcY8+bQsgYXSMO5W+?=
 =?us-ascii?Q?s2eugmRfo8yFMMa22oXUxYvpRcYHacpCjt/Z6W7knhlSBALg0i8LfQi0A1dj?=
 =?us-ascii?Q?7bGhPQvPOVgvFeXzQPUYl7PObw1i+wvySmhB1LCg7XeJZkwul1uSBHSRDuwQ?=
 =?us-ascii?Q?t9iYLEDATMr03MSyUIB0kn5PqYEXHUmu0W7+qcs82VKfr68fnoxn3l2GtxNN?=
 =?us-ascii?Q?euqrr/yLvykH6CqoIG1fOSTUDayUL35/VP4culhbkT3TVndK2geNER0YhT6V?=
 =?us-ascii?Q?wpYggZw63TA4234VENSwNsyESqPmRbfoc5Z/HnWOXMCvNfbQle+ftxoyjNKp?=
 =?us-ascii?Q?iwEBQNLv6IYydWp++OHez23C7SFN3xv2kS7mupTCYtpP3jySr5OMlfuAJfJ0?=
 =?us-ascii?Q?pI3fc+pwLREkM5vNUsYovUj2IpzJJxispHqQI8TYmiILrXXhTRnqvB1IK+Lr?=
 =?us-ascii?Q?hFn6EFGGdp/G9memVJikVlCBjI0u6HkNRAihDyVAxRi/f/Okp36Ku2yhcahX?=
 =?us-ascii?Q?cidrr+otXg+xz9RqpJs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228da7b1-07de-49c3-6a82-08daace5fe67
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 06:41:44.1712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KllnjS+C6r0dP7Q+GDCbtFleaCq7duMIvSG2wmb09DDtuNt6clxgnklZLBKrag4Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZceLQoXAfi7kWmDvt49wz6UNkKXaJjbHynnN1aOibA=;
 b=ZEMfu+iwnwbww01xOFuO2+IFbp8+yYbM7Qb09LHfHmjuXtN4xCqQtHNGIihOUfNqvFTPj0i0gQA+3GxoJ3/3k9SJFyAjvEuW3WmOkGFMDOLKdCSvMQQ4YWa0phtgpif03uwsrTvFp2o8GZR57TX08yToa4quP5cWObwpnnPmEcw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZEMfu+iw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>, "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> > +UBOOT_ZYNQMP_PMUFW_BASENAME=$(basename $(UBOOT_ZYNQMP_PMUFW_PATH)) 
> > +UBOOT_ZYNQMP_PMUFW_SUFFIX=$(suffix $(UBOOT_ZYNQMP_PMUFW_PATH))
> 
> > Spaces around = sign.  
> 
> I will take out the unnecessary spaces.

> It is the opposite: you need to add spaces around the = signs.

Thank you for clarifying.  I will fix that.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
