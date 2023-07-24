Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A61CC0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 08:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EFD81CE7;
	Mon, 24 Jul 2023 08:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77EFD81CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIINZOPgi9Vd; Mon, 24 Jul 2023 08:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F8C81BD9;
	Mon, 24 Jul 2023 08:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F8C81BD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A54F81BF3A9
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 660EC60BCB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 08:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660EC60BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmSNhddCGegL for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 08:54:29 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E8EC60AFC
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 08:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E8EC60AFC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+UToiRbuzWo28Ul36po3njwg2Ex+Taem/Y/ZVM5iwcbJQEcjdwKde5M6e5HuK0ndmh0dgov2P9Ql64dql9nHIwIXlHX+bguwylurylLYOWIHz/pH7If2AExK7WpSq9GLUrvhOXyox/WWyDVvIoNyTNOV4YN9TVewkBlrZqxyUuH5Y7J9vs4ZJuBdrypEH9szTQyJ279ouq2v8gz4etpPF3lTLe4v17feH1kHu9awwkURKTvi4+sVcoaGCOqPCh1eYbTMjwJgVCWwjauOqdbIDWm//MFcXckg0HyskFndz8PqUQj9rV403p31DORTzwvpKrqNKtgMvQFn48EYqbwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pvW+srlD4F+fIMygNdvmZB7OwKcEIN6umsu/D6cag8=;
 b=b7x/MZyW+Dxs26oaoY+rw3AW/lyBjXiRbMqDYjF7cAkIfee8sL71CzqDuTBW28X+XmLdWuDPheE2gt+MgaunABsTOFhWXMBgm1uwQp5w+NNqTV90HA+PQyewYZ+RClWl0kE9KMORJrCM/Zm94h3ml1h6blMWXyV42fwS4EX8+Iws+HIELPcF13ksVRs8wWSuCbn6twM/GUXoFCfjwMo5+xMMUmnlf+lMc3TdFkfK6jdLuDm1mGq4gPy0+qvBDlIN+sLnZnU6B3/FM+TypW8b/IPTzjRUvy3s2XbDHZxX1OKGShQ8+c3lDsJrHSa2eQS+Y9WZPcTF/Rs/HIa5/GirlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.29; Mon, 24 Jul
 2023 08:54:25 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:54:25 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>
Thread-Topic: [PATCH v2 1/1] board/zynq: merge post scripts
Thread-Index: AQHZmQCb7/Cdga10O0qlNncn9zJfIq9+6kOAgEn8doA=
Date: Mon, 24 Jul 2023 08:54:25 +0000
Message-ID: <CH2PR12MB5004B85581CBCF677503DE30F002A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230607052616.533411-1-neal.frager@amd.com>
 <20230607090317.259195a6@booty>
In-Reply-To: <20230607090317.259195a6@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB8458:EE_
x-ms-office365-filtering-correlation-id: c08f44eb-5cb3-496b-fd96-08db8c2394cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ClY6jM62S7uekgLb29yzHgn1MCjQnAMOr31LpbPDqY2XOA9HD7LLX1ric4xwL/DfCKUpUp+zx38255gRcQ6kZaD/ojVE8ejrUGgQLWc3dvQ3Sa8seCDqH/ZaWsw3UlmIIw+FHGGHEbBDEtEGUTWCiBoaVQJKqRJD+k49hdTlwlie27nGK0rt+i/mE3/pVk8x8o5Y1QtvrGk6kCsAldlKCnMdbRKXWJVNRCmpdxnMM2BWyK5u21EPrLNzvPmLJVekzIar1aUpIzsCJKEVfmL8G7sLVQZLwQQ4wIwKmZBAofU9WqQ7/yuRHxbglbq4abUgmKNFzT3HiRo5I6VtxqdAhLJPW5UBTi/MPDeKzoiUwusmtdepMaHxxmzI8PtrVjz6rmWX9tnvEDXmWxss3jTL2rzEO8uECxYMOHSW66M4dRbHRDPkYvp7VW7n9FqgKXji/z8PTFxIueoe4Mhf2Ado+nOyXxj/pI4NfcyK0iauD/zK2/MdkHZIeF81XFESYCEH/NDMcX0e0xWVKiK8Y/wwNpjHWJn1nZEr4+TTMfTowPCOnUj6Svko5+vghVl8C9wua7jvB1Hei5/L6aZ2qB87ycIckORMXoCPL6lAeK3N7VklBiiS3pytgq5+7PT1a9z3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(7696005)(54906003)(110136005)(478600001)(9686003)(71200400001)(83380400001)(38070700005)(86362001)(558084003)(33656002)(55016003)(2906002)(186003)(6506007)(38100700002)(64756008)(66476007)(76116006)(66946007)(66446008)(4326008)(5660300002)(41300700001)(8936002)(52536014)(8676002)(66556008)(316002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Av659O735aWuHZk/ifxIe/dosveL77AwFZXae5yJDl//XDPkwMZ6p4DsXzGS?=
 =?us-ascii?Q?e3P76ZYUS6ljHVA71c4lvsUE/vDb7M/w5BYl3KJuzHsmVSKwPMU9PAdWe+yT?=
 =?us-ascii?Q?QLpflDZka5Tansfv8JHTyuFZ3X5jDLsrUDLEH3u5u+w5KH8tZZehoKCvolxV?=
 =?us-ascii?Q?Sjp9HSHXAGoXHN/kUwpPWxKauKR/E7slDuy9ZySe2ugKjfZpaacu/yBJeDuX?=
 =?us-ascii?Q?sUZcgobcXew6kGgeokyqStiaC3NTx20uqSzaSQEjVxgkU0pd1vhGLXjrzxIK?=
 =?us-ascii?Q?tU+MvMVAjVvGFHbENS6NycyTlhE0VDWGnwSlU8JKVsczBPL9ZgvimUbv7nbP?=
 =?us-ascii?Q?yP82fcKxOZTPhUqB+SgFqTSNwqLbAw2xFUQFRY0HeqkZxuRGkgRZiHiaYBaH?=
 =?us-ascii?Q?FkvgYV66Xgxs5xfDboSJAXfcq7HLhz24rDrmmj5H0eoYk8QjCRgz5vGHORPi?=
 =?us-ascii?Q?2gqhcti/RlVjB5PTolMw7Oo3a2PFXYr/GDJhDFWbf0pzmtQo6yR+9UTtKMlb?=
 =?us-ascii?Q?De6lqbTIdEnIIMOdbzRRacA7Ni7k4g3jfK6oc0PJjL8J/d505ZsKWWnglvcd?=
 =?us-ascii?Q?ZLnc6GQnPb0RFYGSX68cGF13ovxGcX3iOjxX0gIBlltiQv6sehHiPZJXfdqm?=
 =?us-ascii?Q?L/rCdnR0z4z8H1LAAAwggH7C2NgJCaoNwyvYZZQONmYZtWj4FBxQOewL+Rwd?=
 =?us-ascii?Q?5MJB1nvL4X368cATNQ6XAtCL3GwzkM+wCaLnGILXkhY1qz+bQA+4NJAzywfR?=
 =?us-ascii?Q?WIBdQQ8B0nlOt4qAMrWpJdy7eYqtw3T8kIBBuYFGGMuQDrIdKCKkOilEtig1?=
 =?us-ascii?Q?6hYtcQJOOQUAY/uXIFj1qVWouzEPBBTFpBZqV55hmYZb7htkDWNx6+rrreQZ?=
 =?us-ascii?Q?HweqQSX6bJaHbghQcRE0eXtLpVUyIYdCaKp7tpPENpSvkDN1ClloT5fYmRfs?=
 =?us-ascii?Q?UXjjtowfPXepehb+g+M5rrF/DdnpZANUAj3/yEPDa1oZR9UTO6vM+gBdijyb?=
 =?us-ascii?Q?DYyQJaVLo3PwJHl/0N3sNChbWhXSTNEWbnU0Ff0tEjvlpVvQsD1W2iOYaT4l?=
 =?us-ascii?Q?iH+SZ6gd3ij9iiLUWV658BrWI3tY21VFugWOaesC+GlwV/5dH4q8AThGoxV+?=
 =?us-ascii?Q?sIuuzZ0UnmYl430JUDOgaa7bOydpWPHrgGAvoW9CX6TJHRIozsfFhcUuP7ZV?=
 =?us-ascii?Q?MI9Lgoj8bdTmP2D9z2hSCjtP/gcMEd97tzLkCDsjGyb20iy4DCbowi+rd3GT?=
 =?us-ascii?Q?cd7TDcBKEi1Y4x4Ncxs8G85JSKX/cjosu/qL5IFGqM3V0tJ07AtxE5yKb2YS?=
 =?us-ascii?Q?1ir7Xkqq1WdsI9GXbJmdn743LL88ICQhD5DMXOQqzoPPi6NWd8BJTNpUHkPd?=
 =?us-ascii?Q?u8AaaBIBmvwzRah+yJ0/6CvGn7PxnKL8pRCo5sdcDdZaPjccdwzxSpp2PW4N?=
 =?us-ascii?Q?ccQVyWCLXHlCPUcXJ0M/axrx0I3z1g5x9M/vYYfoCjLi8jf07wPnnxJZVzqn?=
 =?us-ascii?Q?O4kUAWcCrWFDTdkvbr19L0ES6gxJC8ygr4stjw9IhAlbc9xNU3jfcNMFe28r?=
 =?us-ascii?Q?u2ZAMtT/pAM5wnCaYc4S7ODWNbSTnxbQVY1roQ7B8ERg89uc/Bm+iUoAnhv0?=
 =?us-ascii?Q?PrXlW0NnPVeq1dVjkdOuMJ0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08f44eb-5cb3-496b-fd96-08db8c2394cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 08:54:25.0735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pzGcTJh+dnXIFtWSPiw02INPuXzL7gfhoi27+4TBbIXl0bgBfR7glY61DTCFftX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pvW+srlD4F+fIMygNdvmZB7OwKcEIN6umsu/D6cag8=;
 b=BNU1RkYIUS7HWb1PNx6sxJIMs13PPD9THKgE8CgBGWggYerW1UfhD4Xd7pbDZGR7EHtmyGYXXZXO3saGE52qhzGk+LSQPd9gw9kF9lpzNumICnDUQmW0IgpQlUOrDNAz8ulTnIl1bEK+lo1NwlYE0chYXE49Yj+LfXnlVIsXoE4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BNU1RkYI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynq: merge post scripts
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

Hello everyone,

> This patch merges the zynq post scripts as only one script is needed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This is just a friendly reminder regarding this patch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
