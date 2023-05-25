Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA60C77B7E
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 15:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8D5142BCE;
	Thu, 25 May 2023 15:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D5142BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb42JYec8HbL; Thu, 25 May 2023 15:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F0641CC5;
	Thu, 25 May 2023 15:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F0641CC5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 189401BF2AF
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 15:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3AF04273D
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 15:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3AF04273D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxyN8E2G7M1r for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 15:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C9742747
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::72d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C9742747
 for <buildroot@buildroot.org>; Thu, 25 May 2023 15:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8qZZMRLpJ8xnFCupK5Dj9ULVTLEJ/b30DP2OlH21gJfQDnDtZNNA+ncViFj9vgS9IQ1RAwJnzGYyPy9Ovvi7dP37l7+ZpxYd/Y6gAUNbFYoL/fqJaUWK/yv7UgquvRPEHZyZ6UpCw9EtOZJm4GSlKQjFxypAO1UhZPx95ixZuFeDoP+JnIozI0dErcT9DAhhOi7dVqrxZAA71tOTDYOJ6aJqIxttO+Bkvx9WCKF8DLTFGmc1bGT7eRdRlXgBBGUTTJwvosHct8j4615y6hohcgfgYHf9l5XpDiSMD7Yrv4cFmdipK8+f0trZuFsOyQ+H1I5WaMCS963I0Xl0x92Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vai2LfJ6Lbg4shO8mMZRXGfpOjLHDCS9V9FBz32SFLE=;
 b=BjzsC/SpP/EkxmOxDpzbSyFqV/B7RMchgezqMtBCEk0wdfpYBi7O/n7eZP7ppyxkslXOvr32r4kYByG9pP7HOn5m7ZmGp+7wAUPngvL61di1ewgOESvFDNEkWNg+FcCAUEXJ+D4wdcWbvm/oW1J9FFsrnbChj/hwLrLzyb6M3uDmQFCgAZczmjdaVecEyNHBamLIF4acl4xATtPj1vlP1qvJ9CvIlx33Gd5jcPT5xYAorL8Y8oAhk79d00tQ2TbWXdobuUEd5dgfYvehZ5CMw9ouOxph9us5/0CpvDf/UzRX3ax8dhpk6xBHZZkYJnH9WpcW1vzTmbGLSSPRv6WIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CH2PR10MB4325.namprd10.prod.outlook.com
 (2603:10b6:610:aa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 15:31:21 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 15:31:20 +0000
Date: Thu, 25 May 2023 08:31:17 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZG9/RYUwb1V2ht4Y@colin-ia-desktop>
References: <20230523172120.1948573-1-colin.foster@in-advantage.com>
 <20230523172120.1948573-3-colin.foster@in-advantage.com>
 <20230523211851.GL621937@scaer> <ZG5QRpfWU6SQGKqD@colin-ia-desktop>
Content-Disposition: inline
In-Reply-To: <ZG5QRpfWU6SQGKqD@colin-ia-desktop>
X-ClientProxiedBy: MW4PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:303:8c::34) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|CH2PR10MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be31023-bc28-4fea-6546-08db5d351701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKe5yYFQX2CTQvU2TscPMePr6F9eLKk0XPdROYkfmoIAa62AG0Dt9XWh05evMKI2WFhfiikixQgFAr6e9/fCm4uxprrwJ2h5j389VTK/5LNUeDo78WR7f3W+dbUY1cl405219Y31ePvIWyVDpcj/797QWhG430nVvNqE5pDOQd2kYjShxHaDvK3A62ftZlL0rEearN7A8a+0NfbbkwPzZ3Oz6Mx54BI5LT0svHQNvVJ1F/KA5H3eGBl/x7REhHyNfoYZeO/pbLGSwb/eULGgTCXkFDQbJKudfIe7zvhAiAxdt1HoOhgNEdAD7xC2/hZruPp5w3J5RAfAyXr4OzB8Hh5gvMor0Ec7W03PaMD3FrLdCgKb2h7DLCuuNXi8SJOHdSLAQK0FyQJyNocSU4eiX3j4+D9+iiAvGZjedlQI/9CZWeBPwNRmMZ99oljg64tMY8a+5VrMY7F15Kyk/IN0aE/7/tHVwm3Z5sTMEtNva0FrDcdej5aNCip06aKoOZGOFk5Y3GAz15mUBumpDZ5rg1uT+Hj3UAI/ERwpP0eZHcW+nvVIaiZA4zhZ8J7BsmkPrjTCDwfIlRe6xm1id5PjpdqB6K+iCAugaFCOv0FAizlJltOFDHO02qV5qRq1ue3n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(396003)(39830400003)(376002)(346002)(451199021)(316002)(9686003)(6506007)(6512007)(38100700002)(26005)(5660300002)(4326008)(186003)(8676002)(44832011)(8936002)(6666004)(33716001)(2906002)(6916009)(66476007)(66946007)(86362001)(66556008)(478600001)(41300700001)(6486002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFkEEmioMyGegnTnbkQrtgNGGOojOHypNG8tMpVkJMC5Rp8RtlzyOJSQtrZ3?=
 =?us-ascii?Q?d1NxTPA6k/NHLQJuFtxo3iDY/ZqmFHyTLPTmmTuRjhsxsKpFKJCbpYhAOuyn?=
 =?us-ascii?Q?/rFqizqfHSFAh+IeCeGhcfVkaewVkA5ZkpwuRUqML730/Odw7+13HFAnd9tN?=
 =?us-ascii?Q?JrzvJCI8GexXnGhdanpvqAmXJYG3h3+P1WE2YPEbFdTvYFQbzbd5oYy7cgtg?=
 =?us-ascii?Q?uwRfiqtWzI33hiBMNwmQCxkhkN0vyAKjxvMQx4VXDO03k98jKL3uxosqjEPp?=
 =?us-ascii?Q?XQxqedMJQIcJ+/uvq8U5TA03Fq317vK2fw+d7Ln90SjrUmn6BwePO+mZZYj9?=
 =?us-ascii?Q?UKpd4vtkRep51rKN4jJ9ThJpLMz4qEl+ri1zfMi8KWO0fLFqVgR9sH/bqhdD?=
 =?us-ascii?Q?VT/Oxlj9DBgwWfpHPQ0Br6Sn9J3l2IZE5J23/ELVJhvbNcNlHnAhYa3aDDIa?=
 =?us-ascii?Q?Iawd8iruflANsLTnbX6I0nq65IG+po/pkF7DDNTvunAF/8W2Hx+n9+D5PDMp?=
 =?us-ascii?Q?NZ6M/oFSmPwS1pPyBIqhhO1mtB2xH8euFN0hxUA3JR7gIxBWFnoH2my9Lctd?=
 =?us-ascii?Q?4x7vAcR6Qt9r2m4GTFjFZ4Xtx/JToIeT+62tpKYhpa5Flcm4PEfDkFrYTeMm?=
 =?us-ascii?Q?13YHrfU63axDjg+tgM83qOL6TU7kPTsV+3W6VmVCAIxkJN4X4MQQfhLUGq+j?=
 =?us-ascii?Q?zC3CNmwIOrxDvW0GM/vUgitaqxEg4gJsbTGsyDZ+0TKokh4ZebeZOdDPH5uJ?=
 =?us-ascii?Q?eyMkBpq51P4brm2jiLX9F1aRGMOHXfCShgeRYwTn3g99s2VtPY6rQwMD9QhZ?=
 =?us-ascii?Q?rmZPKfA8AUIFBiI2/1dqMsaexP+XzSVpTQDc3yQhpHuv/fwcaZG5kATH1kxu?=
 =?us-ascii?Q?CAgvqUB633DA+asj2nZKbo05+jkVB4nAw7C/uG1pVgxr0McrGewvLmGkr21k?=
 =?us-ascii?Q?SFaTg22uzxkA5Rf9Wr1P3kDUxfZavbwUau9IJaXAgeB3mdzuI7FYdtZPDDb6?=
 =?us-ascii?Q?GKYqGLf99ZubS/bWWDMNgpjbi5DqOXmvxgT3ovcpkNBOytFB70rdhc1lrt5V?=
 =?us-ascii?Q?XHfoi1GUlOI9nkoOmKSAF5BX8XSnYBIx9Tu3ToOpDc5xml7kuYiGmtAJMh+B?=
 =?us-ascii?Q?cUNyAyxLFHe+C2HlHkCVfCCqWOVyQXpFtJcwIne92ljH3C+F3hOjppTfx6Dq?=
 =?us-ascii?Q?XWZuwuqjTIXdBO9HvtP7Z+Z53M6sU8Kgtqs6ePx+dq1hJyVLWDlWUNBASIOD?=
 =?us-ascii?Q?JRQNOlfYoNIkeLlRBV4+v8Q/Cd9JC6F7eV5eA7D5dka+72C2hbT+FD95ip2N?=
 =?us-ascii?Q?DYcnwd7NE2ahuPumslEW/iNUGXCCUpBBxYxo3WzY0eFaPIUjMEKrOuThHnOm?=
 =?us-ascii?Q?kgshU11uh/JlG7TlBAZPIP7ZmHmm1YJCwCVzkbJNxcFMiq+G2dgfp1/XNivm?=
 =?us-ascii?Q?vFXlD9gMAt/M4Z6bjFgM9K1hooRHktV115oPgJv6ujcEG7d2poklH7tsXlI7?=
 =?us-ascii?Q?m7CKt+D8itakAmGjrS+OQzMQiJwQf21GKlUC5DxPeo23s9FZ7qwoEssA5Qlb?=
 =?us-ascii?Q?dGmEzwbIEXsoq3DVZrnIrRfwwywxWedPAtX370URbKIxM8igrO2JHYW1e6SZ?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be31023-bc28-4fea-6546-08db5d351701
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:31:20.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOyQL2sUZAME09bJympwz24dbuA/LWG9+r/2thM2CvORHJMdfI11CIi+Xr3qJb4CgkxiiEDpxt6d88NFQAtBpl6A+MqmPKTPu686MEIdNug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4325
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vai2LfJ6Lbg4shO8mMZRXGfpOjLHDCS9V9FBz32SFLE=;
 b=dTZ+FdHWgf7yrJA0H0wHaLhv+5k+y8+gLkk0D6n99zrLlRkxGbl0xriueG909yRCVkjIOMXYgndIdics1j3Ld1buoGvYA/2ctgv/VHYpvcku2jlwXgJX3R970PI5LBn8qbTZm7/ImQkxTc1Gqgv+vkthkIBmqIuWjo6Z2BZ8Qxk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=dTZ+FdHW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [v1 2/2] bootpc: add dhcp-like configuration ability
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 24, 2023 at 10:58:30AM -0700, Colin Foster wrote:
> Hi Yann,
> 
> On Tue, May 23, 2023 at 11:18:51PM +0200, Yann E. MORIN wrote:
> > Colin, All,
> > 
> > On 2023-05-23 10:21 -0700, Colin Foster spake thusly:
> > > bootpc only works on interfaces that are up. If BOOTP is desired to get
> > > an IP address to a running kernel, bootpc won't work.
> > > 
> > > This scenario was brought up as a bug in Debian forums [1] in 2007. The
> > > response was to run the attached script to bring up the network without
> > > an IP address. Sure enough, it still works!
> > > 
> > > Implement this bootpc script to allow IP configuration by way of
> > > "iface eth0 inet bootp" in /etc/network/interfaces.
> > 
> > Can't one just use a pre-up command ?
> > 
> >     iface eth0 inet bootp
> >         pre-up ip l set dev eth0 up
> >         pre-up ip r add default dev eth0
> >         post-up ip r del default dev eth0
> > 
> > Not sure that would work, but maybe worth a try?
> 
> I'll give it a shot. I tried a bunch of pre-up / post-up commands before
> I found the script, but can't say I tried exactly this. I fully agree
> though, if the script + rename implementation isn't needed, it should be
> avoided.
> 

I'll elaborate on this. Yes, the pre-up and post-up scripts definitely
do cause bootpc to run at boot! Unfortunately I still need the `mktemp`
operation to apply the output of bootpc to the actual interface,
switching it to use "ip addr" instead of "ifconfig", because I think use
of the latter is frowned upon.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
