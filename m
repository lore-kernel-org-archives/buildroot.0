Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C564CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 12:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E014026D;
	Mon,  7 Feb 2022 12:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jj_H4iBlCixe; Mon,  7 Feb 2022 12:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F4140267;
	Mon,  7 Feb 2022 12:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87FB81BF321
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 12:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F8A40267
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 12:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wZzSXA_azZX for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 12:50:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A42B40248
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 12:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRpK2fBo3e1QUpozBI8aR4Tw4uik5kPuBERDYBYfgHzwccmYgoYV/0CZI0Q1hgcLhsNUIINIx9kGxGdl2rRmai9TVQUZyn+4brfmegIaDf4DOGQaF5fHgmL1k2dhtQ/qAV+0bKX8eewdsUeBFHOdeuSuJxyLqWRdjPUmZCqk0iMhndZB9kvHhyxg5xYBSlGkb9+VLxw4AowlBUwk5ml9y/TLn7gde/04/LImbG3MFMegfU4a6dwnEa4WRUcCQ19upNkVuerLk2oDIZQqV4lIql9/iqJSoYBstOiBmEpAF1whdO1fogySDIMekHCiG3aUo0AqNSQlwl2a9d6FlGrdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9RYxewQBpS3WTkKs5lydH4u6uU3+1c4JPamiXejhWg=;
 b=kKfn+njy/AyqmZiOTOUq/rNtZKSAngOlK5MBNfdjGXVarN1iiPI11YcH7n9FYAUqy8h4ZFMwsLwgBJHmaLS5lheASmFQzDeeoN5f/fsP8qFp+F4wSfnSfoD468+oJxuOq5IaH/UwJ6zhDGMkdPCwrWO1FAEKtmbnuBXh3S28NqdR2Jnu2oUMcahZzDkQ9U/3/TAxsQJ1dudUtFDVm3lzT4SmSvDmtqY400y6i8kcUWKuWc6rkNOofYl0sFoypp5zRMTttAb/uz9C8MKls33q/70HQ8GuvqT3viFAa35so9oupUXTRqR6DXDIioUYCprj90qOxN4RS74DAuN+3jHNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9RYxewQBpS3WTkKs5lydH4u6uU3+1c4JPamiXejhWg=;
 b=fShPnPqorYowkfL16VwSQEudru+NOTS5/QjOFzqC4hwjbAXTxKQBoiGRFwbOXfQu0q4srUu1ndXQfNXmh+M4b5cBG3TcG5nDdgMRIm8NZ/ewMBA2rrxJvHcYhqQHJUyMI20yleFJXMwPgr8JJ5lHYu4HybFhgwUou1pwQ+2wJiw=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CY4PR02MB2438.namprd02.prod.outlook.com (2603:10b6:903:6d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 12:50:55 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:50:54 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9Rdw
Date: Mon, 7 Feb 2022 12:50:54 +0000
Message-ID: <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
In-Reply-To: <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b026ffd6-493a-4989-c430-08d9ea387ad3
x-ms-traffictypediagnostic: CY4PR02MB2438:EE_
x-microsoft-antispam-prvs: <CY4PR02MB243850A34423119BB6F659E1D72C9@CY4PR02MB2438.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VuKGjGTKOvaX4maL8USVSZy43ByZJERgyvDpNwSdb5g9jk7oYjH3Z6sGUXnjEYoQ0nno/AgfUKeoduj3RuxGyn6ZyA2jecQ0ayHRebfKS+ARp6emt5CubzTfEPc7e8n4Mg9ziRPNlBiQB9NCC40XhapNjVxdMtmSGmm1ceqJGaIBQyM+A6OwGCyw++pt12Bb5t/6z2trm09b2cASQ+PplXnQEKwuxhP0nrowCChTOvsG9HHei9RQ06VPPqVsuAQaHDYHTJPOw5i+36osaOQd7Bicfk/p2TPHoa86TkppAcR4E/zpTQMtc3Wv6yYAR0jl4ICYstcq35dtFMn5XNxtwj3OA67/ZhVSYWDByC0Jy5jXpobRhm9Mr2VRjhjre+L4IbkIdDzar9ZshLOHs/5OWXBe9WNb30zv9f872QMm8i2MCn9w9o4DWNE2NhWqmx2oIIOx1ZLIrFnCWSK3G2G8b2pSYyPUrLs2CMPmnL4SDXkvi3GyytL85J4KoTtbTghvBrhGgG4595IGKZZcyGwDv+oyIew22/jmqf7Ez2ZOmptg8KcIutS5o+3cKVJ8JGTqB1UGHaS8BtD84wZnNgjURaVYRXlOX6WRM5zVt2gDVVaFqzqO1aSpCbcdlYjUKhy/J6AqI1+dIIw855wcaSUJykW/E4jpANhVry7TXocjYGkcpqT/dOXYEq7etI7+YuYqszjS6ilA98VnNVlC6ImqmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(966005)(55016003)(52536014)(33656002)(122000001)(508600001)(83380400001)(8676002)(8936002)(66946007)(76116006)(9686003)(38070700005)(6506007)(7696005)(71200400001)(26005)(316002)(186003)(86362001)(38100700002)(66476007)(110136005)(4326008)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUg5VjArRTFUTkh1cGFBZHFKd0NmZk5iM0ZUajNnNWFtZkFtT2d6SG41T2hO?=
 =?utf-8?B?bkJDcjBSMEU4SEFyaDF4eUFDUnpjWjBUY0J2ZGNrN21SSDQ0UHhGYm94eWg3?=
 =?utf-8?B?VWFSdVRGZFdaNVQxcG5PL0pIcjdScW41VHRPTFFvQzYwVk9EUTg5R0VPY3RY?=
 =?utf-8?B?b3AwdjBlUjMwLzBSU1FOZkNsSEpzVkZZOCsrSUM5ZG0yK1VYNjNMRW9TdWdh?=
 =?utf-8?B?M3o3bytmZ3JkTGhYT242OTV4SW1Oalhud2liU3pwTGFkTXZRcy96bGZhSElG?=
 =?utf-8?B?VTIvdjEwdE5iSGVKNDZZNWRoalRQczM2TEJwVVZ0ajFxdjVzUTExMEt5ZXNJ?=
 =?utf-8?B?QWU0cjRHYUs5T2pqS1ZqdFA4aGJDbWlHbjYxUmF6dHFQR3JhWlcxN2lEYjFS?=
 =?utf-8?B?MTRFTm15MW1hYVM4di9iZW1qcFJzdVRiNUZNbDROR3p0bUphbjFKWkQ2OWxP?=
 =?utf-8?B?dk9XMG9nc2RENld4bzNnSDE5UVZSZlZnaXFYb0I2Zkw5Nm5xaDZ4UGNOdy91?=
 =?utf-8?B?ZEdlUjlNSlVjcjFXeURTMjJ3NWlaWUR2NkJOMDFvVk1kZWtqTXhBZy9sMThI?=
 =?utf-8?B?U0U3OFFEenRHZmlNTnpkdTdzdURxemNqa0pSMnRqZXROK2xadW1VcDE5SENI?=
 =?utf-8?B?b3pRVENQQzgrMk14M0grRXNXU1VjZVFuamg2VC9NZENERkR6Yjc1aW9CNnIy?=
 =?utf-8?B?ZUVLQ1ZYTExFZDkzK3NLNlhtWGZEdWF3ai9ZQjVTQmI2QTBCVldzZHRxelo2?=
 =?utf-8?B?YzFzOWYydkhoOENnM0kvT25HRWxMaTVZSmVTZHJSUklJZCtqM3MrcThrWm16?=
 =?utf-8?B?bUNlQ0ZjR3RYMDVzVGZ0WEZuY1JRS3NQQkFWWnBxck1VNjB5b3c0OXdUY1FS?=
 =?utf-8?B?ZEZWZDBsb2ZvaTl2SUJnWEtVSXJrbTBkUlRmNENnYzgrcnpDVTk2ZXB4T2Fz?=
 =?utf-8?B?Yk5kZWZjRkJiMHBBYXNvMmNCWUd2VUtiZGZ5SHZPWHBadGkvSlI3RlEwRFlR?=
 =?utf-8?B?Nk81UG5FSnNyWHd0RkdsWFB0YjVoWSs1TEp3c0JhU3Y3UTRod0RuZ0FaZFFL?=
 =?utf-8?B?cnNRb3U4cDYzMTJWeDVEamU3MDB1ZDU1N3JpTnY2TlBNMms5em9iYnNoWFY0?=
 =?utf-8?B?K0ZLaG5DaU1OUGc0UmU1ZDNtVWxIb2NyclhrTWJEby9uNmJJNytLS2laNnlG?=
 =?utf-8?B?cW84STJ2a2ZobkJXNG50dmFRS2NtM0VSY3cxZ25rRkFWQTdZNTArbHo4U0dZ?=
 =?utf-8?B?cUUvSWRkazgyQjJKN0wrSnRoU2Q4RExrT25SdkFua3dtUUdKVXVNTlcxV3d5?=
 =?utf-8?B?WXJXQ3BpUy9kS3FTVzAwSHRzTjNXaXh4UGhPR09lK3Y5N2I5NmZDQzZSbm9N?=
 =?utf-8?B?d1J4ZlJydXJ0eEdhb1J3eFdlZGRhZFJEb1RDaXozK2FkamJ0UXFENmlwVlUv?=
 =?utf-8?B?aWYxaDRIVTRweGVqQ2RyMVpxTlNLRytEeWpLWWczLzVXQ2NnNDBZRkU4a3J0?=
 =?utf-8?B?a2xZOUtPYmt3TFpsdXNGc2dVbVZMcFN6cHh6aHVuOGJyV09pazdFb1EwTmwv?=
 =?utf-8?B?V1FzWVE4SGxoVzQwd1FaS1Vsd0RVcWN6dWV0cWtZcmxzazFMa1R3Y2dSdHlM?=
 =?utf-8?B?OGxITnRUOEFsNGJsTHRuc1Y5eGs0U01mUmo5VXBCTXBZaXVlNGpRUCs3SUNC?=
 =?utf-8?B?aTJoRGZNemRxeXpYUzg2OXBpcDFNdHFHYzNZMmNBUjBuY0xjc3ZYOXkwdUlB?=
 =?utf-8?B?WDkzQVF5SlJ6dHMra3lnbGFMZWlqMGJWSnZQUGt5MElFQStrQWN2L041NWtI?=
 =?utf-8?B?LzJqc1hTM3VlTTB1S2FQL1V3T1dob0RQckIvMXJFRFl2TzVBYXR6K0s1Y2l2?=
 =?utf-8?B?UloyZlRZV0ZMWmpoYzl5YWFxa1BHbjUwSGdDTVFiMjdVT0lXeXVhL0R6TWZl?=
 =?utf-8?B?N0NIWC9vTlNLa2dGc3E0cFljdjlvbEFCcyswbks3djFpd3dZNEl0b3cyNGl4?=
 =?utf-8?B?dzZQcEdjWE50ZG5rdmdZRUsvTVVMK2FyYVZ3OC9EWWNxSHdEcEdPSFdiblMz?=
 =?utf-8?B?RTJoWnVhdGdkeDY5Q09Yclo5bE5jUG5hWlNLeXQzYlNvd1E5QVExVExCRlpn?=
 =?utf-8?B?UHc3QXdQdDFVK1RDVXViR2NxWDdsdUt6dVl0aWNNcFRYUkdXZ05neXpscExV?=
 =?utf-8?B?THc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b026ffd6-493a-4989-c430-08d9ea387ad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 12:50:54.8152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDpyZD2B0pfhxZq5Sr2x/uYgrurCOD/NcQyuj/FljufsVVb37iD+ZgsPhOOuUoEuLtWc1760/js/KdxkQydLuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2438
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

I tried this method, but I am getting the error below.  Do you have any ideas?

cp /buildroot/output/images/bl31.bin /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/
/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py "board/zynqmp/pm_cfg_obj.c" "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/pm_cfg_obj.bin"
package/pkg-generic.mk:289: recipe for target '/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built' failed
Traceback (most recent call last):
  File "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py", line 293, in <module>
    code, flags=re.DOTALL).group(1)
AttributeError: 'NoneType' object has no attribute 'group'
make: *** [/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built] Error 1

Thank you for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
