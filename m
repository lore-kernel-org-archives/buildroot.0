Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52896C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 09:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA66260E80;
	Tue, 10 May 2022 09:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QFzio8bKZT3; Tue, 10 May 2022 09:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB20660E30;
	Tue, 10 May 2022 09:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86BF51BF2B6
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 09:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8351C81CDC
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 09:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIocNlyQrshP for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 09:15:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46C0181CA3
 for <buildroot@buildroot.org>; Tue, 10 May 2022 09:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxmgzaq95cxWysEvq3uTFB8WdfhKn9obEedfyXnMwLeoDX5Z6AbyEzhFeh7kaWR/GxyVCRi/Mwbaf0pRlBM4pIGX+xA8EuLL5Uq0ZIaYp3xZBfEygoD+u19oz62dtSE4dlOo/FjB674ljJxMyCSyV3ZweH7msM/kXK+yx8OPn9b2lccT/tKM60VROXa0z7dIVcoFU1PjLjGZLVRJ+we/CIdIxdwbjj3AGP+9SwZipJe6E9s/1AMamNDge/QG0Ec4izX4EcsZSMQ/Yp/ViM8bOLGQxOD5QlktsRZHNr8oXB6ua9oqnON7OOU5J+1FzjZxY22gJAzJtV6rw/dwcsDe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIHDhzAwH3lRLwv9FuccVMTPU1UG/5i8nlNTMoLo1hk=;
 b=j0UlQdPeCHF9UqimJN73sL9fwdVUumF2ykpjjIrXl0/gHLgfLDFtYlc13saO2qk9lTv7ROHgcNGvDLPjgHeUFg1ny49TAGwciEWp14m3CA735y7FsOw5qe9nUB1/nNQo5ibDWYDiImg4Gtlp+3/b1jIiw9w9UAc+5G5KZ5a1zlWoBmJUMWAb0j23PUMutU5g3dTVtMTzpWmZ+2/7ZOoJIOi3R6ayiryJLMNVzIRTMBQvabAEwZA21+JEcV6cMYJm8q6lQf35I7GobG9hFa8f9248KG0g+iwVFGrNBlI/nbq/TL0S1KLKMygxw01dYaKeIr0Jvf2TpeOsF3ocWlyQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIHDhzAwH3lRLwv9FuccVMTPU1UG/5i8nlNTMoLo1hk=;
 b=VSk8DJMjW51WQWKwUNAUr91opHOYQQft6Hy+70BSOKObcd5DPs5cie4Jzhlu41YuJ3JXXCEuxvTdp2+sM7EqBBWwz/jzNmTMasEHkPF9R297okehanf/3aWXr41UaaETJ8/WulRDBDgMTtFdg8KzOF4ivMP6uZFtNsykl8aNyuE=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM5PR02MB2330.namprd02.prod.outlook.com (2603:10b6:3:50::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 09:15:11 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:15:11 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/2] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0SPCfngAC5bCKAAPSDvoAAo232gAAm552AAyYFAA==
Date: Tue, 10 May 2022 09:15:10 +0000
Message-ID: <SJ0PR02MB7758389150DD2C8184A456FAD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <87pmkqzcsf.fsf@dell.be.48ers.dk>
 <BE2A1487-0690-4BE3-BFEA-AC439B98FD3D@xilinx.com>
 <87czgpys46.fsf@dell.be.48ers.dk>
 <8555E21D-3D7E-4C1B-8738-150AB664F8B8@xilinx.com>
 <874k20z95o.fsf@dell.be.48ers.dk>
In-Reply-To: <874k20z95o.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6165d992-0058-4d1f-e844-08da326595a2
x-ms-traffictypediagnostic: DM5PR02MB2330:EE_
x-microsoft-antispam-prvs: <DM5PR02MB23308CF66A2064AAAB1BD8A6D7C99@DM5PR02MB2330.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iyasRoAO/KyOqUA45r2Ev8XPD68LWvIgLckfnQME/dt0ZrDPrdIjjtdprcgQwIgJ6kiqfF2IqKDuxjnAqRXRurtrBbmhXVLTrsJtMRqFh3iLeDX9YCa/NC/msZUITQnyaeqTn+QNdpNU3gaEcc0/QiXMfkn6heKfNdC3C3QhzcaN2v8tYG2bmCSXhLx37EWhGFWqRIBafu8P82/bHYhSdI+DQPuiSYHNQoA9DKJLQkgdwO416jDsWOaZ7Jl2na27fsy/JGToKGVnWlf89yKMKYWWh/rNuR5DPA6wek2gh6JcU1T/2rFBcu8e6/b/9Mb4nLe6ynALXyHLpqOM/JiRLBlIohfGd5txsz3XO8v/aBzjySdS5yOT1LBEbm7yG3bIpVLgqS+eDr/39pPOfctJ0nW58NGF/TtwtzoGzPo82eBvrC5SwtrQy7gsL4pP7lDDgQP5whmg3Q0E3xy7QlWcZGySKeE1E2C9WBP2zB8zllaV5LBJHwO00rK6w+F1gMuYoZSJOMsfz2M2NjjmoHs5SFVQ2d8JbGj6xrx+gU8i8ty/pTq6FeF9P61ec4twDP2Qj5g23ZhHaYymML4nj5Kv7ngsM2ZTStNu2vFG2jDFAXTv+R2B2sNiONm4O6Xh1YnH+UFrv0NxnIcIiztTTqwwnqq1/eS9x0MxmhHO0undSLjWxub45DtjU90jbo4DRmW2kFntYJgA05hCqTzQWEM8dQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(186003)(83380400001)(33656002)(26005)(4744005)(2906002)(55016003)(9686003)(8936002)(38070700005)(508600001)(38100700002)(86362001)(5660300002)(71200400001)(122000001)(76116006)(66946007)(6916009)(54906003)(66476007)(64756008)(66556008)(66446008)(8676002)(4326008)(52536014)(6506007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?App4Cy+MvANbblEZNv21Z31Q6mnan0LDQ6Imrdpj+A26G6FWxcuVGR6RIGJI?=
 =?us-ascii?Q?jg9m4CWudL6vC1CIb/70hm2tbU+srnaHXjyg6ett1BpwCMt2+23ThXDVzRDQ?=
 =?us-ascii?Q?we22o/xkleXECTWbQv99CByCCnOa0I/hgdMzHJF2Qo9Ve5fAUNtFdjJjb8IF?=
 =?us-ascii?Q?PS6HvKHhe6H5n8amuxjMi4HweGIBffwbY2mQ8LKBFWDZPAob/F/M2XKIqj9K?=
 =?us-ascii?Q?w+7q/uEjIIeot0VE9SXrujYRC4YzmpElnlK+gs0u6/SGZJqq4DyV8yB2nhYw?=
 =?us-ascii?Q?1dNVjbAznpOOLQ+sYnc5FsXoXqQPLcj19zlgJP5CEYkzAeA77wOzoI4DtsXD?=
 =?us-ascii?Q?l0EpnzB7EIy1qp4ODyJWUdVgs+yXL6RRyMepl/IVg7COq8X51abc1U2/SDVp?=
 =?us-ascii?Q?4obFkYostxBogANyRCWvi9H/9MbpS6Xg7EpfWd9gTr9MWcupi7GmDazywnx6?=
 =?us-ascii?Q?MaSdg//MhPeILQIr0Dx19/MrSdGEDvs7X7NJiDdvbsOnYhbLqFqapVtKR3Ij?=
 =?us-ascii?Q?rFRnbAOiCvpyoJQjDs8eD2mhDzF3Fp96xR5e/B9rduS//2sNNXhC/wZR6Guj?=
 =?us-ascii?Q?zIlfGldUODJRkpgZHLqLAwzseet//nMnRGC1Qej9xGm1/atzWnloT9SoshuI?=
 =?us-ascii?Q?/qe9jehCoi/XiHuVwa0n2AB13izHajIXWKyUohzKaMkvFkCSkpzpwfFVineY?=
 =?us-ascii?Q?zegITMObZhAq5XHLt14o8/v5VQBfuyESXir/YdY93JTjm6UsEcNC+sP6Imzl?=
 =?us-ascii?Q?xHD4RAytUjA7tSSGlmvf01dHYYz4Mz36gkkPl9SnBcxTfIaS6is5VsJC1OjI?=
 =?us-ascii?Q?X5gyTCf3+tZvpKP2+FXIs6UXNVlj3jI5QuoQpvYqnCo/N96VHaUSeFx9XkGB?=
 =?us-ascii?Q?ncZb32S9DDuiR8ZZQJPPx3cbms6TZ0Ml1Zh67TsZsGz2xlPCdEep4uN+PQWt?=
 =?us-ascii?Q?RJ8Dtc66U2+gQwbhFpGD71TGShStIAen0huHqUKiRGLoO17DIqHogi2G0Na2?=
 =?us-ascii?Q?8pxqmVhcHc3uFQz4niKuzUPPT+BteysVacOkb4kUG0VgcO/++M2zHrKw7sef?=
 =?us-ascii?Q?7Pgx0nnb7vvgfVw34mMXtXgN9rW1C0JfbuQEpJS4sN4vNDyvF3JqqrEInfJ5?=
 =?us-ascii?Q?IL6Ya/sTkT5BMkwBcHPA8aTBbNcpSMUZKAtl2JCTYjDbuXxPiy9ybXcjjnGb?=
 =?us-ascii?Q?7OAHUiGtEjvZ9ZHtScRuScdTrqhWn3y6dxVwfbaiFeil/2g7QoCbQ8wdMmRP?=
 =?us-ascii?Q?oJ3tFw/BQwsOaNTRZ+uNIVZJrf1XyAnoeSj6Hd0q4qQvjxi6NTaNSoT6X88U?=
 =?us-ascii?Q?WNti02wmuya64C/adNtYMtAFVvexprs/c4a9EfvL5rmcmJNDE5vRjZ+eaMI3?=
 =?us-ascii?Q?Nrj0ZJ42zoqEwzT5bNbGa+nkmO5DOgnGRbh2dbqRtzu1xPQ6TUuI6ar9q0KD?=
 =?us-ascii?Q?rriEXH7VGUAQc360sFKNY/JzTrX45qTci2RhK5xF2x3/pRRI/4avdvh/HCE9?=
 =?us-ascii?Q?FCrxrDLp6xJtJPDPr/7mcQAotvdRRBVRaM1+7qCLoqtVQ8iNokwI+LeX+zEP?=
 =?us-ascii?Q?NkJVac3cU7dGp4LkhuJuVlVTdRPdjuGhQ83cuppoU7O7A6D/dGGC6ZOrCk2D?=
 =?us-ascii?Q?O3dkqNRLdj4DM5IP7mfEE18mwGm0QXSjInNSmTbMTiDD0Dj//KfrRxk3d3Rz?=
 =?us-ascii?Q?ICYWr6IMv1DdPgPt1x3esv98YFvVX2VpXP5MXuT35LoDnoNWPjV0JRZUr07M?=
 =?us-ascii?Q?7j1iPG1FiQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6165d992-0058-4d1f-e844-08da326595a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 09:15:10.9289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Scs8VgUA/Fwiws2vyc5HbvjDK6zaJNDc8bde57UpLsTN0wQnBf+wHWAb2wXU5GOt1kZm0i6+6cQunOxm2/D4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2330
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

 > Thank you for this idea.  Do you have a solution for the SD card file system as well?

 > The Kria Starter kits use mmc1 instead of mmc0 for the SD card, so  > this is also different in the extllinux.conf files.

> I believe you can use $devnum for that. Have a look at distro_bootcmd.

Just a note about this.  I have not forgotten the plan to clean up the zynqmp directory structure and possibly combine 
zynqmp and kria post-build.sh scripts and extlinux.conf files.  

I was just focused on fixing the functional issues first.

Now that the functional issues are resolved, my next step will be working on cleaning up the directory structure.
However, it may be a few days before I can get to this, as I have some business travel coming up.

Thanks!
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
