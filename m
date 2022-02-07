Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2889C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 13:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7742E4038D;
	Mon,  7 Feb 2022 13:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arK7HyjxMVq7; Mon,  7 Feb 2022 13:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3559040153;
	Mon,  7 Feb 2022 13:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6C61BF29D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D938781916
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HH_KGXwDk9wA for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 13:27:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B53D7813FA
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 13:27:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBDjtNQabp4i+Tl/nGd9unX9RoOqawOLKDr5ZocER0sQCLGXG/zdovwoVMXSSGZk6rAt+FD4bgOY+xBnl0Fe57oKglyfxrenl4odkF5dDWoxvSIsW8QlqfbDr+kUAlJ0Xp99cE42DXN9o6TsV1Pc3BlikWXp4RJM3ImhhUm7l6X3+8Lgk7m/FvniEN1T27ccyhFLQheMNJ62H+vmPBaJdN7oLny/8PvmD6ViLKTi9mCFoPk3P2TLM2m8jTXOYKIB3PmGbqoumLAJ2WFjx1S41LG0Gjz/ivy28lLA10faDytZrUDHnmTx/JFHlMbkcPey8zFBpA8qjb1hUCSAOZNEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qyc+Np5dP5Qfs/UtMw6LBaV2rPcbswQgBbSXxVXJa4=;
 b=ciA3bqUK0DedyAg6Sda3Kq4zk1ofMF0eVmsUcNGWo7d/wxliO5fEgsvjrhj20yAyvCeeLeiR4b4K1OxiqP8La9L7UZyptP+F9RbCxgvov2oY2iNi6nIIaSA6c/SVHjrCA+1Pisd+3RCKOURcv0qy7I+1O7a3BAl3/c95TkdUMpMHByslELL9gBRcZGdRZ1otY61FBbL5O5+bqcwROAlEDCKYrBdiM799QpAOM1l+4jyfevAeTX89mIKsr3GhZqvF5ncOjQtNHk+Q+qOzRGG/bfeoe3YMub+fO9ryHPGYFmy0rEVNSgMLCIm2G3nEo/QYOf1aiUUrcC2msy7Y0ZHMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qyc+Np5dP5Qfs/UtMw6LBaV2rPcbswQgBbSXxVXJa4=;
 b=cu+/WDn+r5keWvF5sGnZTC8t9Hs9iAzF81FDh7kU7gR0wKota89DZ1tiXcT28cU1n+z5O9ATAj8cdqNgoEXULjoljK9LRAkoHFbsydJzDHfO08fN60oCsyv/U/UvP1QGkELe2vVhs+DWghraDQCcGy4pyX5Aita5in+0ESq40+E=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BY5PR02MB6722.namprd02.prod.outlook.com (2603:10b6:a03:209::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 13:27:03 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 13:27:03 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9RdwAABtZwAAALcScAAANsmw
Date: Mon, 7 Feb 2022 13:27:03 +0000
Message-ID: <SJ0PR02MB7758B7B6B17FB3EBDE845707D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB77583693DE78A399C95E5395D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB77583693DE78A399C95E5395D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b23644a-55cd-41c9-3774-08d9ea3d8742
x-ms-traffictypediagnostic: BY5PR02MB6722:EE_
x-microsoft-antispam-prvs: <BY5PR02MB6722806CC938655B8392B705D72C9@BY5PR02MB6722.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 00Typ5vEzZgBnZNUD4gZAxDoFwueo82eRBgfmwHRJPcQ1p2oD2mR/kurVjqYG2y0iASwVuN+ByMLRAUrOHIvtjUA8/wNwnC6mj5hmEh4KM80HPVJ37GrcVsZVwwqhqEqzX6Wm1QHV1ilG6lB+y2iV08KmYXLN8/+EPVBvpBDY8Yi2fn9zvTvphNOBsM/IMysEQgCJyN1/hBV9biveWuAtJozxqef+3pwaNQCDIMI9P+hNzN0gTyhP1wsD+wHY2jxaC7/srGA85XfF72a5D0nz4211vQf+sizGVI7KcsGZW4rfVKLr9olbvZPaOMeMaDyfBF1A5mUtew//Yv9X6edL3r2UR32I9vU4N3UtmBZ+RETNJpUkFGp5ewQ94m3FOnXOXQtb6rmL8LrhQK0RiyrrJOAY3gAfz/IYFp1C/IUMpNjTBiyvJhktblBbSV2Zg3IMBUwj5Q+T8PQVk7nAqzH8M1KfJep9Ub+zt+bhGPjqzgrEPqn12d0EkW7HRFAxAOxCI24jmHK1wOvp4I9bfs9Yrov2qpBSTii5YUfzB0NhRP+leWaUm9dEkV4C9W3CpEgErvmFND+ER7CTwLf4OifVzJMWkMrGEvOBp4G39YUf7VaX4dftJqFgU/ms4ygGIa4o4yz4lSReoxv+A+SI3oJUupvyJLMGfUmb8NxD3ZmkKHV0jWaFKHSUlPGmpInLk67aRy4NqKJpYVBiVuyNqYxYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(122000001)(66946007)(64756008)(66446008)(66556008)(5660300002)(66476007)(52536014)(186003)(26005)(2906002)(38100700002)(33656002)(6636002)(38070700005)(966005)(6506007)(9686003)(110136005)(55016003)(71200400001)(4326008)(316002)(7696005)(86362001)(8676002)(8936002)(76116006)(2940100002)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk4vUHFyWHpyRzZ4cGNRcVlHK2lBcm1Wc3BTVlJkN2dPNFN6TDQ0cURyRVlz?=
 =?utf-8?B?SEJKaGNYSjdXYldkRE9XdFFXM3JmYjU4d3dMQmhuU25DMFU5UjBvbFB6UFNP?=
 =?utf-8?B?RE5BbXR1VFIvNU84c25LZFdPWUc1VG1kL1gyNU5OS0RtSmhHVjdHd3FqenV5?=
 =?utf-8?B?cHZoMWpaSjBseTVWdEZPVlM4RnNZOXNwcVQ4QllRQ3ZiMTRlTnpkdUoxSG5T?=
 =?utf-8?B?aDI3S2dmcnRLS0FYRCtSdFJFSzFvYlE0R1c1Y0grb3g4RHhJaFpTU0hZZWcr?=
 =?utf-8?B?SGptWkxkQmpzOXNxUkxUaTZDRi9UdUI1R2hjVjhsNUovWkdtQXlrZkxxMVJj?=
 =?utf-8?B?MWFsMDNkWE1RODNuYW9ha0hHSEtGT1cweHlRbWZzSjh1RWxDTFI4OExmQU1Q?=
 =?utf-8?B?V0hDVnNqUXhGTVVFUGxNcUdlajU0dEU0dHFEVkx4ZkRtR2YxSHJ2MThYNU9y?=
 =?utf-8?B?OVdwVjZydlJPWElpdVhva2tNSTdiVmhIQ0RrTVliRHpIaTZrYTBCVk94eWxM?=
 =?utf-8?B?SEptQy9icEpjQkFybTAra01iYUxMNmlLWG9DdGtOUlBubmVuMkwwSXVDZ1F5?=
 =?utf-8?B?aGxWOGdDd0tZOGJjRStKZWJ3QTBqVjBXOW15MUUvdXl6ZW4vU0ZPOFhGU0tU?=
 =?utf-8?B?azQwUkF4MTl6SzlVZk8ySHRKRUVoamQreEZDcU1mMHhtbEd0a05YRWtvSTF0?=
 =?utf-8?B?REl6UkJ6NldaZjVtRlpUb29paXZrSGRBbnYyMEF3NUttQnZXOVUxTFNlMk9u?=
 =?utf-8?B?bTN2VW4vUHliMkdtOGJDUkpIMGR2aGUxL05nQ3VUUXNyV2NiMU4wSnpOQ01y?=
 =?utf-8?B?SGpYajZUN3drUHJyNFhuamFFNGZjYlZaNDlhSmNMYVlxSzg3RHNBZHFsL3NV?=
 =?utf-8?B?ZEV1Rlo2SEtiOU4zTEw1aWZ0aC9FcGNCbTZZWFRWbGpOdlBNSGVYL2ZpRnky?=
 =?utf-8?B?Ym01TlBPZWMwdVc2Qmx6S0dNVGN2NTNFNWI5aTduNjRMWWpucmxJYTFBK0w1?=
 =?utf-8?B?TlFqcENMM3V3TWI4TEZGQ2hOb3lQTjZ6Y2JpNzBWTVE1YWxuNVhFV3EySzdo?=
 =?utf-8?B?bU1rK0JDdVNwQ2RDTW9vN2YwZ2QvQmpqdFBudkU1Rmg1QnJkY0xGWlpqYzdY?=
 =?utf-8?B?NHpaSHNFUlNZK2NmSjVpQlRVWDdrM09JNGQ0L3NNSW0rYnltM0V3WDZoMzdO?=
 =?utf-8?B?S0srZ1l1MTRjQXJvZzg0QTJTWjdneWpZS2RSN1B0Tm5xYjZBdTk4ZUtEN0JB?=
 =?utf-8?B?M3lGbktQNytpa1kyN25DakllcmtCbU1tWThtVU8wZmdDLzZxMXFvbUt3c0JE?=
 =?utf-8?B?N1FLbU1zRlRYYVN2VGY1Mm5lL2pwSWdUaU9jZVhzQkt6RmFNWnFYbXpOTWUz?=
 =?utf-8?B?dzBpWUN3eXhRVk40WnRmVFhPMzdGK3BCY0dUd2NoVEJhUUZ3M3pmNVpnMzhl?=
 =?utf-8?B?VG5jTUplampOMHhTVERHNWI0THBaL1dXQ2V3MGtFMjkxdm03NzlpNG1NTGNI?=
 =?utf-8?B?ejJzTXZDWUZWSk90UDYrR1hkRXcyN29OQlk5MHlQdzNONDUxN2NNV1FFeUFp?=
 =?utf-8?B?ZCsvZ3pHTFkyZXNibkliMlBkWllLZzlMZ0FlcCtHM3h5WUwyckc5UWpQRnNZ?=
 =?utf-8?B?a3pNUVV5SU4vTjhDenU5TUJGV0ErYm52YmI0OEtNVHJKL09lS2pqNyt0VjBx?=
 =?utf-8?B?UzFZSEpBb0hUTmgyT2Vkaldpd2l1a3VnWjV6SzBONVlpY1pGZnpMTjFOeDBP?=
 =?utf-8?B?d0RydDdoNEZKcEZTZ2dlN1VwSFNuaXN2eEpES2RYcFNjdlYyWTl5WGVHMUZw?=
 =?utf-8?B?dE9INGg4ekpRaHRlMi8rWW1aQXFCWExBNDFnQ0VkaFFmN3BlTUErMHZtSjVU?=
 =?utf-8?B?c2xEMFlyWUQzNmE5WVdUOFVxYjhWRnhiSVF3NVlBYkNwTTkzQ0prVjloRXdT?=
 =?utf-8?B?czgyYjFKbDZIWGlySEJMS2gvU0lEeG81Ly9JeFd3d3FlODdpaFVKZGNlR2hE?=
 =?utf-8?B?QTBxbS83ZExQdVJ4NzExeEc2czlwUVM1bmZzWDlueHU1T1phcDBHak1nSzI1?=
 =?utf-8?B?UmVkNi8wcU93SGVEWS9tRVM2V08yeG9RSGFyeTA0NFNCZ1FoSE02TWRrYnlN?=
 =?utf-8?B?ZlMraDN2WnpWQU5hM0VHVEl6MjBTcXNnL2hqeDdGM1FIS2hXZEhIWklXK3Rh?=
 =?utf-8?B?MkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b23644a-55cd-41c9-3774-08d9ea3d8742
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:27:03.1866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /uoq5jvaR6iq4enMmsvNJvfPMlaYomkuj8TYzK7BcJ+JzhdLKobaiVpY7rhJjqTP766BNeA2bb38vIPo1Nd8Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6722
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

>The zcu106 defconfig currently in Buildroot uses a pmufw that has a hard-coded pm_cfg_obj for zcu106 in its default Vivado configuration. It is an old and unflexible hack that required a different pmufw binary for each zynqmp hardware _and_ peripheral configuration (or other solutions like a "wildcard" configuration).

> Nowadays pmufw images do not contain a pm_cfg_obj anymore, as it gets passed from U-Boot SPL at runtime [0]. This allows to use the same pmufw binary for all zynqmp designs.

> This means you should provide a pm_cfg_obj.c file in boards/ and put the path to that file in BR2_TARGET_UBOOT_ZYNQMP_PM_CFG. It will be built in U-Boot SPL, which will pass it at runtime to the PMUFW.

> Note that you could handle similarly the psu_init_gpl.c: provide one in boards/ and put its path in BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE. But since U-Boot has a builtin psu_init_gpl for the ZCU106 (and 102 too) then you should not need do anything. It's for other boards not supported in U-Boot.

> [0] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/

> I tried this method, but I am getting the error below.  Do you have any ideas?  Attached you can find the pm_cfg_obj.c source file that comes with Xilinx 2021.2.

> cp /buildroot/output/images/bl31.bin /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/
> /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py "board/zynqmp/pm_cfg_obj.c" "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/pm_cfg_obj.bin"
> package/pkg-generic.mk:289: recipe for target '/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built' failed Traceback (most recent call last):
>  File "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py", line 293, in <module>
    code, flags=re.DOTALL).group(1)
> AttributeError: 'NoneType' object has no attribute 'group'
> make: *** [/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built] Error 1

I figured out the root cause.  Our newer software tools provide support for the IAR compiler for customers using IAR and not Linux / gcc.  This causes an issue for your script as it does not catch that there are two places now where the XPm_ConfigObject is defined, one for the gcc compiler and another for the IAR compiler.  I can work around this for my current patch, but could you work on an updated zynqmp_pm_cfg_obj_convert.py which can handle the new pm_cfg_obj.c file with the IAR compiler support?

It would be great if you could make a new version of this and push it into U-Boot mainline.  Thanks for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
