Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDBDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 09:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3ED40921;
	Fri, 11 Feb 2022 09:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAVaoQT6BOsu; Fri, 11 Feb 2022 09:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A70408E9;
	Fri, 11 Feb 2022 09:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F10541BF3CE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED5A860AEB
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGbX4UZSI5lv for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 09:36:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6581760806
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 09:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbHKL5hqgIlsbGX3AVzzsRbTw8kWB+Q8Rfi4j8fMpgfcTh6+nRn7lDzxri0alFD5GmR5TUhNMn5kWMS9fvMuo9iJ6EE/PsWO7A1SjGTucxyKeyoNn6iDwM+ogDEv/yu6dNmcdzzly0PNIXf/e7NP+2/aiOFj8kboRiqyix/sBGCWjGYJWAq6i+Hka9oeULxOqCESFiZxS1WFbAPp+bfPhfk8H0X8SSY0ji2aSEnX274cWg45/zO4n/ByA9Okh2z0aFw/auvdWhGp4L6DBwVigtiRRLUkxWubZ/EnEpxVSuuzG3PQRPb2yQMyYDpptPP/FC/31EI06ifHZWiPYJ2jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2tGwdoOBtTIAt/ZxWWOT2Aj+p44F39f7Mwg3kShq78=;
 b=ONrhlC+VlPXxtFNPvk3baP9bw+uv+VoIQK8rvDBRb+19ulMRxQ8t19tfxvvfWvcxYq9KHHr3rSBcgoXRTGYifVltKkY5p9fd3Ho1JlQUtaCBpx0er8K4YvA2QvgTq5k6OVmgF9fKEcgx1bd88jPmF/jbq6pVKZIkDVc89/gcoMA1DUws7m5LBRzCEhVXEMcGe0rTLkm/XoDvfF4OeoUvZN8C0D9vVvV+V0a/yhbkWQ/fOhsEm21ohLnIBrSzD7p8MlR6Y+96vjiaJmly7uijzRTC3mGzcoA0TYxRjRZh7z/mEQXo82Ggx9fC+PPTgZHQlf9zcytFjD1cRI+FZ6boNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2tGwdoOBtTIAt/ZxWWOT2Aj+p44F39f7Mwg3kShq78=;
 b=Hwl3+4WXHRAXo9QdeGnzsE6oftnQIk8TjNzt+jMZsiQzNwFPoQZz52BrCkKBrwOHOTOHVGDZm53EDcJ8EP58wA0nHtzNa85Yad8U4sm50RFI5cZi/u0Cm8nYG3sI7Yg5D0HOk/91VbcU9oU20BDENZq9FQaY1DqOThNTw9fphuk=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN6PR02MB2817.namprd02.prod.outlook.com (2603:10b6:404:fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 09:36:48 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 09:36:47 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYHlb4de7brA6b0kCBjRQUdI9Sf6yNTofQgADJf2A=
Date: Fri, 11 Feb 2022 09:36:47 +0000
Message-ID: <SJ0PR02MB7758DF865E3C2C65C58AC2C0D7309@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220210081932.3114763-1-neal.frager@xilinx.com>
 <874k56wgqs.fsf@dell.be.48ers.dk>
In-Reply-To: <874k56wgqs.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23e544c6-3689-4435-54f7-08d9ed420638
x-ms-traffictypediagnostic: BN6PR02MB2817:EE_
x-microsoft-antispam-prvs: <BN6PR02MB28179B92678BBCAB22EF9370D7309@BN6PR02MB2817.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02nXI4apVDdLInVjtgHLCRBNymaa8zPALcccZkgpWAKFM+G/iDmGlpTskQxj2Ya7s2/KLKTszcxDkyl9jf1uMb5UOMkUS+zKVP/IqMoYYsdrWCGIG9DpXJoPoJNpblABrr9N53f7bduUtC7BJSZJJqiTjV37qhBOFIVpFtzTUkYiXFKOvfIcF18ziXtyFs+VKlz1SfM2+T1ZvZmgbGVExZLHsKXINsSvEKbiA9BA6xXWgYioke3fWtiVIm1b5OyOW2ej5ZbnQaRf0o/leTd7ddPB7IvV77K6IAfxfwp/6nazxq76VMUYuLo+ogOx3l1htOS5NLw9pPC2V7T5b7J1nW5invWe8bjEsdLqyJ0GUwZfjHV4Ufg7nnigiSc7eqf5LQk909DBOyazGsBE6quLUC0i9CaOdQWz+9IIrfJucWzwQcvDB8PlQUG6ZUpTGj/fajH3i8sGkoB/iVqc4PhoYWPiEUoymDNFDO0cuDZ1GnGXLn1lXRiKL9bXM4Fj7W/tFiVB8FMU3ydBjTjG9zMuD65YppCYCIo4gG4wQIk8bw5EaWNv0s8/cIEfN5mYOFZLR99ei+EsmdiQJaD/UkomCvOsFUHWpgr47mQxJ+eoUPPfNfAbzNovNlAL2MCyasKXjHsIOJ0xdzV8B8oxw4No2ALe62J60iq2OJ8Iv+SJ9GXDC4UfATvd0CuOTE80ztH4XEFYOyy2WWEawLEWk468kQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(508600001)(26005)(107886003)(76116006)(2906002)(52536014)(186003)(33656002)(66946007)(5660300002)(38070700005)(9686003)(7696005)(6506007)(316002)(71200400001)(54906003)(86362001)(6916009)(8936002)(4326008)(66556008)(66476007)(38100700002)(66446008)(8676002)(64756008)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6+tHdDa5h7XimGWRelWgYBlX7LSpJU4NzpSPn/5kzAECKC8UunPgNtGnsUtf?=
 =?us-ascii?Q?86ak4boLlSJUGo3BN+whifFdOydtgvpvYLbnYP82stmMoZOYd5MxTtCHCRwJ?=
 =?us-ascii?Q?4Z/WntjAZ/rCqJ1gB8IemDhpUHC6xhDWnlOG0dqZcWluaM72C9o0O1cVeFIb?=
 =?us-ascii?Q?WVxzFNpCcf+i4mPO4o9vmzJE08NK18iHBM5e55rd5yaRHEM+uKdJpE411Mm4?=
 =?us-ascii?Q?APZWtIkTIw8MnjQmi3D4lzd2GKQgitNKBtR3eNYM3xRk6IapkdqPprEJ43oj?=
 =?us-ascii?Q?kY+qfW9r1ZuQ3iwZhlH4j5Erqu14YCXYg69f3whBk880RfMhwpcoqfQsNFLf?=
 =?us-ascii?Q?NRHSRNSrLWRc2U43VxQZfbxxrB8zx1xorHmqsK7uZp0bM9qqAE8QyRAILjZz?=
 =?us-ascii?Q?X6LGISXrQu1PqacwCMfl8XJa5SKiS32xuliCQ4p/VxG1+VRJz8SH9tl40Ahw?=
 =?us-ascii?Q?GsOmeiCzxplxl6CIwt09kfDb1a4fd2nNjlKzcDWpJMau5AKNF9Wi04JoEYqF?=
 =?us-ascii?Q?PDa/BI7cjwRImviqbvWvSA0hfMNAED6t4ZdriiGmv80oVeTGLVRMFEcU9GBO?=
 =?us-ascii?Q?bRNHdq9GyodBUQIGHyd51h0O/ZCPzgUMZ/f/7uE+RZ+nBAWpOIsrLCEAUG8s?=
 =?us-ascii?Q?ezfCa+imry0+pYytYFHc45iFD3Y1cd0W2B2lCogCrJgwNP+40ZmBg4jX/cUY?=
 =?us-ascii?Q?mWDU+rFfqd2earBMjL0ah+nFX2p4osbCZOhajKBluiqf8LSUa/jZeEpxKrZR?=
 =?us-ascii?Q?KX+irOKVaEsWc/B62fZB6isZtc3ZW8xLWAw23BOgg82xbWO8Des9vvcFZHW8?=
 =?us-ascii?Q?1vHnui7g3R8sHEDKIknzWiAaos0+USYQqMRGG559Yk3abB2vMHBmFPXcr8fH?=
 =?us-ascii?Q?MYcLO6wOu43i4A2/X+xF0xBpwkWNcjzcZhjZFFyiUqWxiuR8ReR/LfnPTCVq?=
 =?us-ascii?Q?E0uVZBxX2prnXdx2zHw0Bj540LtctWiLFHSRXLj+LqPTQ4NhJiNbP59xhphx?=
 =?us-ascii?Q?4zubQSVOBzCMV+OGnSHwpyXiARkTaIjQoyd6ogNt4PPT8lE1GBi9c6GwCyXE?=
 =?us-ascii?Q?yFDj6xX7d6imi1qsKMGo3ngnyW8ZIrGfe7sZrq+VD7ltGJ2gE0GwcTUIUzHL?=
 =?us-ascii?Q?L4e9Mx94KeREHDp5dgjfSNYAayxXyaaLCIQ8XKse7l252bLz1HAZQAXwLQQw?=
 =?us-ascii?Q?COpDUQroZh20BG/I2TsUCrrgcmc0R2/0h4v2cJ3obgc5FFRob+t6eLuSNepA?=
 =?us-ascii?Q?hoePfaWKro+AaiEOSj/vmIO5e4aA3DbZCI3Oggvcb+UHM3iEfTCrhZB1mS7h?=
 =?us-ascii?Q?FIOAL9A3i3YTwJb9EGQt9nd3UcoCFd+G1v0vtZjlzIuh5Ir+UPfnjlVrOHnk?=
 =?us-ascii?Q?5ysFJ3jcFSscBIKUtlWcVVn5tXu0na7SiVIZZlO6+mgdPsk7+zBh6UtLveTc?=
 =?us-ascii?Q?8weXNXAl5jiNfnvZN8ifMqs6l5mehiv76dR4GA7Ji388FyeRQ6swNMJ8tjMD?=
 =?us-ascii?Q?kC2ugmBlY3I9sev9S5WYQUjh0qUatOJykDS+lLie7kEjtox5GZQhobSCaS+/?=
 =?us-ascii?Q?wpst5gV06aYrGRZM6GmHapM4OLJedbqwKuJig0g39pWKg+1sIQLDzeuReQcV?=
 =?us-ascii?Q?QA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e544c6-3689-4435-54f7-08d9ed420638
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 09:36:47.6365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9h/7a3w7xgs3L4BHssz6fvhaZUywu/PGUJhykM10ShtTnTurPlukZkd/WjxJ250+WLUW58GD44WVKZ6CQJZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2817
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> +++ b/configs/zynqmp_zcu106_defconfig  > @@ -1,34 +1,39 @@  >  BR2_aarch64=y  > -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15"

> xlnx_rebase_v5.15 is a branch. A git version should point to a tag og a
> sha1 so the build is reproducible.

Ok.  I will correct this for ATF, U-Boot and Linux.

> I think I earlier asked you not to change the URL when it is not needed, please leave the existing /xilinx/ URL.

Yes, we did discuss this earlier.  But after thinking about it, don't you think the defconfigs will look cleaner if the URL is the same format for ATF, U-Boot and the Linux kernel?
It is strictly a cosmetic thing.  My preference would be for all 3 to be either "Xilinx" or "xilinx".  Do you prefer uppercase or lowercase?

Thank for your review and support.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
