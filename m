Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A20BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 15:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF48C61071;
	Thu,  2 Jun 2022 15:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLWA3fRNkDJI; Thu,  2 Jun 2022 15:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5BC60FB7;
	Thu,  2 Jun 2022 15:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2D541BF401
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 15:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1FB960FB7
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 15:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqJZNZ8EdvKk for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 15:31:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67D3A60B15
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 15:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LywxkZcv+PB1vZaEmhQJEQx3aHxj+VP8QzgdTkAxuxR3SmedPOtXFhzYY6oWoTU3d8jyRUoqR++BjatbGr+Sa9gXv+FgPDqZ0iddRnf2Di4IEo0dqolwSjHtBVxdELG/g5BaeOnv1RhAoIa8dOX0ZgxpUkMITJAptkyp4MfOI/2guuEmA/sAs0qr7il9tAPlA0B1qIhdPY+cKNtDJBdNYUc5XMEKd2mdor7fI9udwBvGWYUGULLuANQ0pGqGE/fkwf5mcfnZXvDT0tE5Kb3d00pD7v6/vVSl4+7V7kIMG8U0TDZj2+eDVC1h1bLlkZQ7lbWuXT9ds+lnyIsmfL5thA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUQMzhec2Pqmt2v4sp4/3IFDKAoMHYuNzjBzMThvqY8=;
 b=Mjz872xJOyWuohnwu7DSOZ+fs9VAdR/6G23K12Mu9p2wGxr4i+i/5rDYwN/WFBLc8cnIDWfZYNlvEpsGRLq4nhu5wWQpW/H0lOT6xBgyJIfdA2y1BWQPj/oXTFOT9KTyyC0pUV6ZBpjpBjncsOAk7sby4Q5igrDqIANgQTFZPYK4gfy2ENM+kH/Mg2Isa5tBBa3lSBACkIv1IuPwmhktk/GsoBiM7pmOQ/L/OoBT1Pxo/PTO3JGlRO+1Y0vqM6HPqD9nt9LS3yLPvf45b5oUUxpHn6jKYkG6R1WE9K40Sn02RNceAjn/cen+VYKQKVOrmDupgmRyrR1EO23j6AVFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUQMzhec2Pqmt2v4sp4/3IFDKAoMHYuNzjBzMThvqY8=;
 b=jcHDRrmIJgcSZ1E0bgbn98ZIFIHbxMDAMKw6gM5j6npVv0tur+SjI+7XMzV52Xp+Yi1PUEcZN4x7ujwwgTlz6LWjn70TabIoQwDdhIkWl/RoJBhp30YiGJLpF41douEnLLQqnCSEl5HXZkPeo+0tQV7Z53TLbVZHnJHmNXgKZVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by AS8P251MB0354.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:405::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 15:31:09 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47%5]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 15:31:09 +0000
Message-ID: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Thu, 02 Jun 2022 17:31:08 +0200
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO4P265CA0163.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::7) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e1f181-011b-4f51-c46e-08da44aceb00
X-MS-TrafficTypeDiagnostic: AS8P251MB0354:EE_
X-Microsoft-Antispam-PRVS: <AS8P251MB03548D8EC94919576DE8C12884DE9@AS8P251MB0354.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYAXuPGN/ksBFgfh1lDiLuqE4LR6MdtOkoA3i1Hx02/pyqSGOAPL/o5gAdHZZWN453NXDdjbLASblrYBrLrUnC8KucEYbs4J6i4amq2qb78s4WT+6vzLP2sAEWIz2WDxHn/AT+A8Kt9RuX1uhHA725GQi6u+RE1eXa/Prxae2+//a8lpxHl52id1mha6kSFvO/QzcW2MAy4Gz+kgACyN6Ze4DmAKYtgTbzXj88fpH1K31oYXLjr9dSK5/kJ6tE4TswZ+g2S+zv3EO6k9y4Hp7rQ6EJQ4XpabI1UCt4mkncWcFqRw7Q4RkDiR2c7RdBmliruZWtKtesaoM5qwPBFOfTCZ851v3P7naL4jpDQ1YyFw/IS9NMeujrhdaFTQA7OyzGPnp/qoXEuTHCUPnpgXnzjwNaPxGuunsOI0I3fn2+07v3qiBIH6rARprg8wS2muEw2dtQY+F+ouRquxqBh+neGrsNAwc2IjEb2ttRtaR+mFa28dBuzrpFA02qQdItHlC0pM3tabbE/8gDKbX5NUtti7WvoILcDuem3vog5AyBTBtIQb7hFSNcYO/hBo3rr/keEtE/dL0lCe4OpYWMVolBv1T6OIHmaDI1E4IZlTXOw8/3LBaMKEpHtypvK8CtTrjXr4/l3VOkpTCatKhqggKJjafemHgDIapiQwqYogOkLyKE2Exxv9oSVzQNUBZ8b0/bW+DZAYmKYhRPe9XBnEiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(66476007)(8676002)(54906003)(4326008)(66946007)(2616005)(316002)(66556008)(38100700002)(6512007)(6486002)(52116002)(86362001)(36756003)(186003)(107886003)(6506007)(5660300002)(44832011)(2906002)(508600001)(83380400001)(8936002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amxWNk43Z3BGTmVzS0pBQ1JUZ2hJQzhEVElFMGN2UFV4ZmNzVDRGMnh2QThN?=
 =?utf-8?B?ZnV1VmVENE1EcnhIb1pVaS9oc3ZlOXBFa0Rab2NNaEVldE9YY1RmTkdkRm82?=
 =?utf-8?B?OVBKcDJTeHlXbmo1aGM4UDdWdHdVU2d5Nm9FQlVXcUo0aENkc0VDTFJUaUpE?=
 =?utf-8?B?aUFwTnhsYTE1WkxvaUFVMTlLZHV0WGMyTWFsd0NJcUlKUDFCN28xc3BsZUNi?=
 =?utf-8?B?Vk50Mng2MVRQM3FsSGVmbmlORUdJODUzZFFQcVJOSDFqT3NZbktseVdjNTdZ?=
 =?utf-8?B?MFl4dXA2YThXYjJSUm9DRzI0TmxLekdHYjRTdU1ETUZCUlI0TktaRVlGQlEz?=
 =?utf-8?B?VE9ZQVFqM1pKTFhORHQ1NUJHdkdVdmxPbFNVU1BldEU3eGFhOUQrT0F2NXZS?=
 =?utf-8?B?YkUyT1pVNXJ0Z1JxcGNuQ1VGTEhKU2F4M3N2V0NLOFdSSkhBV3JWRWxWTUpk?=
 =?utf-8?B?RXVsdlZsSGNNN1ovVXIvTzBFNDFzaTFLekU2REc5b0l5VjhKb3dLOGNabE53?=
 =?utf-8?B?eXZoVm5NMy93RFVJQnRJVzJBSWViM0hXcUFQYVo3dTJYR3U1c1V6VDQycUVy?=
 =?utf-8?B?T256Q2tZUURxOWE5OSt5OVFmczEraUt1dHNyeEM2Rzh6NW9FYXdqbmNpNlY2?=
 =?utf-8?B?U3NwcVc5eWlMM2RGdHZORmZlRGNBWGJ6YmZzTnJRU1QwVWE2VkF6R2NNcFRn?=
 =?utf-8?B?STlYUWVHa09sbXZtbVNlS1J0VURDTjByTGFPMHpqUXVEUEdUSnB1bFVlQlRE?=
 =?utf-8?B?N0RHUTFVT1ExMlVudHE1eDFhSllVYmgycUd2ODRmdFpjTzRpVWRSQ1R3ZmRF?=
 =?utf-8?B?UlY0Wml2VXNDeEE1NWs2ZmJqUVh6TW5nZjUrM3V4RjFrYmxFK0JrcnZHYmdV?=
 =?utf-8?B?VE5OdnJIWFp0V1dJTnhyRmZONVp6VE05RU1ISlQzWjlMTG1zbCswU0g2SmJS?=
 =?utf-8?B?Rkg1d0NNVGVMR3pKQ3NoaGQ4N3JvdnZWSUdCREpCL2s4VXI0UGFQbEpiQXg2?=
 =?utf-8?B?VjZGLytFOTFTTmpuU0syb2RnUTVGYklNcG41OHByQTdRYlZGa0hydWFLcUk3?=
 =?utf-8?B?YTNib2RvdGlVcEpjVDRjNWNHdDFmS21STnZUNUFTNVdJblBXL21QOTRpWmVQ?=
 =?utf-8?B?cENYS283OEhoaGlqOTFQMTBrcTJVYTJvYVAvV0FmTkFHRWFUc2lhTUhuWkF3?=
 =?utf-8?B?V0Z3TmxIQ0ZodjdxOGpXdVNzY05GM2tZM1gvOUZ2bmpIS3VHbGhNUUw1eWpS?=
 =?utf-8?B?eEVMRktaYmh4bEsvdDZDZVBlczNrLzFOUlh1N0VFMExlSDZQZVNNeTFFYmF0?=
 =?utf-8?B?QjNXZS9ZcHNLM0V2TGgyWDU3K29Hc1J1djQxYjFpNFFidmhnK1p3NTBSQnJM?=
 =?utf-8?B?dnRvOWJPamJuSHhyNTB3ZmgvTzZ4WDlMME15WkNodEh0TGFGZGcwbzREVnk4?=
 =?utf-8?B?aVZCSHFkQVFXeFdXRUNSQzd4YVQrbWFLcDcySEptdTlFSEc5YUwybWNIa3hi?=
 =?utf-8?B?QzVnNXZVREZZc3lHVm1sbW9PTUlNL215Y1FYV0FpY0MwbW1ITDFTbVlMcUpm?=
 =?utf-8?B?L1BJTENJbXRYbXA2WDQwdnpPbFJ1MnpObjBxRmU4eGdYV2E5TlZFYUxWVGNO?=
 =?utf-8?B?RmVPT0FvSjlTdHlVTHZ3bTM0MnJWaUk4Q0pHYTNMNzROVTlsZ1pPS041NFdi?=
 =?utf-8?B?cjdPRzRRSFhoR2QwaDRtRm9SU2Y1WXlwYTF6UWIrOGZpam1rYXNnR0hjYzRa?=
 =?utf-8?B?UUc4N3A1dm96OUliRnJlWnJsdmg2dWg2d3N1ZGloc042ZnpjYjNCQ1A2QUpG?=
 =?utf-8?B?RW9kWHdTWlVsR2VOQ1dqUkc1UCsyNFlGcWZBTERSckx0aytrZVlYay9VR0ND?=
 =?utf-8?B?NzlBR1k2Q2k3cmp2aEwrNjc0NnpCditIdmhJdVlsK1VxL3NkREhQSDdyTWdr?=
 =?utf-8?B?WCttNlpBdzdDQktiZndjUW1nYVE3RHJ1aUxYRjJ0YWdYZUk5blIzTnlIZmww?=
 =?utf-8?B?cXFqcFBGQ3ZIM3lUekRmSmpDVXE2blFNRGtUaTcxQnpCSWxnbWdlKzlZYnRJ?=
 =?utf-8?B?ZjdKak12WEhSTkdYTmNkVDJMOWpNb2FyVkdrNHJRNzJZcStRaHFacmVrc1hM?=
 =?utf-8?B?UU1yQTM0YlBxK01McU10VlZtUzBHNUhnOTVhZjdvOEFPNFBhNFY0UHZWcVYr?=
 =?utf-8?B?MTF2bXN4SkcvamNxaU82UDNFdnBwQ1BHQmpqWEhmU0NvM1Uvc21kQXFnV3Ew?=
 =?utf-8?B?cUhDbC9zVnRoRm9Pb1c4OE9Xa3g0SENKM25mcDJJcC9lZVZiL2FoK2dPL1U0?=
 =?utf-8?B?ajk4VEpDRkMzdWhRZS8rb0NZbUx5d2dpc3pvcWdmQUFjei9pSGxyMktpb0Mz?=
 =?utf-8?Q?Al3s2b2xj7Im7kDT3oFLGi/NcRXqVSfn9aSYGqIuM0ung?=
X-MS-Exchange-AntiSpam-MessageData-1: SoDoOZErajTO/HE0cAoa5178tbj5f066s9I=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e1f181-011b-4f51-c46e-08da44aceb00
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 15:31:09.4886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0SLFU3Fmt1ANHB1d9hs/aZOADErxCbIaqLL4ndykNzDGpb3Vh1hA+mGELyBI0eZuUGqed9x+pqddx83U9TTujimzT5OOHiUy+kjlPhuNEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0354
Subject: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

When using the following minimal config:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_SSP_ALL=y
BR2_FORTIFY_SOURCE_2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_INIT_SYSTEMD=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_ULOG=y

the build will fail when trying to build ulog with the following error message:

[...]
xxx C++: libulog <= libulog/ulog.cpp
xxx C: libulog <= libulog/ulog_read.c
xxx C: libulog <= libulog/ulog_write.c
xxx C: libulog <= libulog/ulog_write_android.c
xxx C: libulog <= libulog/ulog_write_bin.c
xxx C: libulog <= libulog/ulog_write_raw.c
SharedLib: libulog => alchemy-out/build/libulog/libulog.so
/home/ncarrier/workspace/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-
gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: cannot find /lib/libpthread.so.0
/home/ncarrier/workspace/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-
gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: cannot find /usr/lib/libpthread_nonshared.a
collect2: error: ld returned 1 exit status
make[1]: Leaving directory '/home/ncarrier/workspace/buildroot/output/build/ulog-
0389d243352255f6182326dccdae3d56dadc078f'
make[1]: ***
[/home/ncarrier/workspace/buildroot/output/host/opt/alchemy/classes/LIBRARY/rules.mk:25: alchemy-
out/build/libulog/libulog.so] Error 1
make: *** [package/pkg-generic.mk:293: /home/ncarrier/workspace/buildroot/output/build/ulog-
0389d243352255f6182326dccdae3d56dadc078f/.stamp_built] Error 2

From this traces, it looks like it is trying to link with /lib/libpthread.so.0, which can't work
since it's the pthread library of the system.


One thing to note is that, when BR2_INIT_SYSTEMD=y is removed from the config above, the build will
succeed.
So it looks like systemd or one of its dependencies, is enabling something which breaks ulog's
build.

Does anyone have an idea of what could possibly go wrong and maybe, of a workaround?
My host machine is a debian 11 amd64.

Thank you by advance :)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
