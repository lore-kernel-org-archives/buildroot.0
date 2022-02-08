Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094D8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 10:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7313660D57;
	Tue,  8 Feb 2022 10:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGeLaLUxdMc4; Tue,  8 Feb 2022 10:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08FE60ABB;
	Tue,  8 Feb 2022 10:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C85A21BF2FB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5ACF408C5
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yv4hDsvOJV0U for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 10:07:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD85B408C3
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 10:07:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpD4kwyjf+oGg1fENkeTadv0i0QDFcNSy4nUj1rHkVWKdrB44jVmZ1cN12n7YzD+7+JhjsPERbeVmhfJI+yp6uh1VT/wa3RoGE+dKMC6BMP0VTK3SiqZItTPo/TG5FOSXI8sM9hEoko0kwWvofcOfOP2Bjc/G/LER6E1QbrByRCa8dlplAMarztb6ibf6kuXL1tLJK1p/h8ZPTBxCfyCJVQygZeU6W0A1reaxEhlcQGav6T5I24rXfdXwu9s4wxsfUGiqIqfIbfrJjKGWchtHB2kbCELVorsjrXjkeQ3J3F6vj9c31dq8heox5eYrOrYAk+yjxlKCtwfNRb6tv6D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6qjbjYnHLesZ2qV7utPo0A05t8Kg4lNt+iuBHWu+Rs=;
 b=XHkEuvb/l18z3nnCYH0CQ+R6Xe7T/w2ZZ9Bv6xZ3+BHE4xPMvnk9xJ9SmRLQeBTZZ3Oeg+3lOk/yXGzCk0ra5H4QzPlfJ1T66/CNjAzEd4eiJ0OvY3ZDTVFal1HWAIwZU1Jfn4FslMOfzrK444gLYCpUgKsb9O1URWN67Kz0LXShSRxz7UnWcoD/PMgOFY+70qxRDcysh+jSxxK0kMSYIqMvxKWZ8qO+KnuExX2uKKZpU9oVzxdtbzLNl6MbvBu71Lk9g2K6ZCva0/nPeZ+3YL1PkEJzJbIZiq00CbuVN58o9XCt01oPjUej5Po0Nz5bX7XjOg0Xu/AvU3hMyY2RbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6qjbjYnHLesZ2qV7utPo0A05t8Kg4lNt+iuBHWu+Rs=;
 b=nDkdaeSyyc32b/RI/EX3bfg7MhmDfijTTvaLz3hIUMCuVDRtVMeqRMSAUDdkcO65rHzpvCkqcY0PGjdKSkAC4ESAimlFLBtDxh/gRN/QBExLeCuZKnYn10ZxtZgTiBPu005tjW5lrzWZrGI/KHE9g3eVc8AjSMZeDxk/w4U8a9U=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SA0PR02MB7353.namprd02.prod.outlook.com (2603:10b6:806:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Tue, 8 Feb
 2022 10:07:43 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:07:43 +0000
From: Neal Frager <nealf@xilinx.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] configs/zynqmp_zcu106: Bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQ
Date: Tue, 8 Feb 2022 10:07:43 +0000
Message-ID: <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
In-Reply-To: <20220208071559.2862411-1-neal.frager@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 222814b1-91ce-4974-0f1a-08d9eaead942
x-ms-traffictypediagnostic: SA0PR02MB7353:EE_
x-microsoft-antispam-prvs: <SA0PR02MB73530F263029AA5F3C825B6CD72D9@SA0PR02MB7353.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsD6FKFmCB60W53NhUCRi6/ezS+sh7+sz/x/3vZm99AO6b7n4zkEGgfJzyoVoZxYLHHlWFFgIDb/AsTaukHFsYKICqwqIHvwjeip9yOOR/pAteWSyhOix7sKlsG5yyPnfdJv8+PRi6yb17bB6X8kHo3tcqlrK+b2OVxUKtGLNjcR71/vbhhW25tLHmOCihnFhceHj8HLomkrgLZzz6SjVOHQcvnN0vJG4V9LHO/pjTtaTuNUONWoPsGoK16m2muzxPx/64sISwjVZGGpbKnvq5Mb1ijxp1FqXKHyxfnNJcFDAdSGGaePBdSGOXy7sITMB9Idpz+9n2swWFD0zqcsUtSZbbtTXx8NQzwwzh535OucrwAlUk0Im3TkbIAIcg+Ihmalvkk+/0spJcuwhtWZTG9vLOCtH3uFR1NL6SD7Rcb4ckn2NFFluylUmZFT25TfqQzPLCxOtBF1TAtjFnZR9LPOM/6QpLBXCQ4URa4g4R5gNBGArpBYYl4E95HQoLh4z0o+PaWi+kywDaqOBO/t8Mk3c+WjW86L8uFhOeJe2w3AbjZCSNRp2PfLAGcndSfkl/fRLXr/WErOEFfwO2ovQPuJPB0dutTAg1e/4HCHn/oOk8KnyufFfq4TVfL/33K4CtUvcjzQE02E9gz5gzgvdR9ZG74rfZ8TQwqzIfUOObzNGwzwo3Zj0kwDmyEpnpMA26RELC/lEQAVmP7OFJDNUS3e+MRmNly3QBVMCviF8KubxNweuwEtNI84t9IroXDtcwXU5onZ3da+AubVy8nRKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(55016003)(86362001)(66556008)(9686003)(83380400001)(8936002)(26005)(64756008)(186003)(508600001)(6916009)(107886003)(2906002)(316002)(122000001)(4744005)(66946007)(5660300002)(54906003)(38070700005)(71200400001)(38100700002)(6506007)(7696005)(52536014)(33656002)(66476007)(8676002)(4326008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m4UyADzVx8RgQVndliaM9bpSyPXAyXQWLLh6tlaflwHYBid5wBwdRX/LDpvB?=
 =?us-ascii?Q?6xjJKfSquxw/jl3+jEdM9SljJuPUzpuIkyr2hSStRn/HJiWUVPS5ot2IsI4L?=
 =?us-ascii?Q?VC31Bo0Mjg4nEQWQ2+JuUHXYVdfuDEF9M+BPZCmHrDYvxhYX12p90wuZkJlj?=
 =?us-ascii?Q?eRxdPyDNSMphMvJ8KluvM2jOXEASwKOyM9xfwjmi9oj8dgdWuvDyOfX7jr5t?=
 =?us-ascii?Q?5NPXVizN1xpaogvYmyZ/ipHRu2girNpZVyLc3Fq9xDlg5GgDP2L4IzGOQQkO?=
 =?us-ascii?Q?FICkdwMLbmtaT50I4q52bScOpPv8DRefggcQCW3mrmODQXB5SezSM0ZWp1VX?=
 =?us-ascii?Q?uSK6uGoN+UPWGXXRKqJeiE/jTlveKAILvwwKbWDR8x7nNVZMpfdEGBM4D944?=
 =?us-ascii?Q?wAufwkifqTOlXPk7a8+96MDo7jphU28p9iEMN1augCxqRpFScO0uycwiV+S4?=
 =?us-ascii?Q?s+NXbgKA5/smGRtYX0UkOsl+yu/nEs8VnCbpknFt2OxbycXG5YL8ns44iCc7?=
 =?us-ascii?Q?PdVswMvj0u9WERrzvnnc8PpM0J1YRF4rsGGJTPVHqSYJy5q3yAGhMYB/4+Rb?=
 =?us-ascii?Q?I/SriMVxuRiCK2WuXuOZ5/BGwnoTKaR1KtLFurEFpsd/luux6mZIS5i8oN8K?=
 =?us-ascii?Q?COSwAryZ2u0AmmqMIPkEk4XHHlBgT9rK04sheHa34r1nfkPeTNx7dG5p9H6P?=
 =?us-ascii?Q?YePQJkeeMw+KKjAI41ecBev8NX8bt9/MFEiX8Ht3TWqJO7wUvKIe56uSy1Er?=
 =?us-ascii?Q?aSHnf+U0iEaVbcAUM0WsYvWvEpOGCYqLqLc8zmaHDmg+LG3qNQDlHvBfhXYd?=
 =?us-ascii?Q?PVjhAACOOrhNoZUXwI8PLDJw/VrgL9MpBD4KEGlwEGolt16reZhe3A3YGhJ/?=
 =?us-ascii?Q?FXEM4baDRkNeRoXBelfdDdItLjTJHQxdOK7K47ObBibabVfzITzh/Yr+d2On?=
 =?us-ascii?Q?tbe3+xgsEVkiaps9v+/wPaXtnLS2Y3M9ubVIReMfJ9lo9TFofCaJxiNtJrP8?=
 =?us-ascii?Q?DquNEfghGkY4ceV4KE7Q6eRvFFcLn7Ayr0U1+YhMK7GshR7FS4ZMZl/tI0ol?=
 =?us-ascii?Q?LfKC3fv0iGcKHBC9ZhQjudLTGeI6s8Hps2lkhP9dPm+l04AVbBTdWah8MJPu?=
 =?us-ascii?Q?zr0Y176Ai1ryVSxLEk8ovcgpIXaJGNpagcWSTgbXZmNYA65ZAeTFA6Skx67+?=
 =?us-ascii?Q?4w1hEy6sBbCSxK4UtwLMGM6Uf32BxDwE70SxkCdpE18zTZnkU8C6W8sws5uz?=
 =?us-ascii?Q?5IPRXtaufBPhJ/9g+sDllozjXwCcq0o+Km81rZq3yMVQFZJUAWwFWd8e5jQk?=
 =?us-ascii?Q?F+AZAApOv+mJ3TspZTiD29o5Zo1SSgOKPYPyTHoIU9Oh0gk8F4dJwfVi3W/T?=
 =?us-ascii?Q?zbFcJCAHjs4tq/rseA0l8e4MkejOCOybQevlELqvmFAPX4AdDP8T6OXfrL5G?=
 =?us-ascii?Q?aeftk4TYJeI0mydXq3+E1V3KsxmYQWTKQXM6lA3g3r9sSBmzQR1M7fRVbxV9?=
 =?us-ascii?Q?FOGto1KsuJdI5s2MEDvPY8KzvOdxqX77WDaKqs/318wrMD/sTeHsZFNaft/0?=
 =?us-ascii?Q?XAxMg7czSbtwVCLD/f70NYrJn92hNXxiXCONwx6a8qT6s6Mg8UxTAHjQbeNL?=
 =?us-ascii?Q?/vMg9EpaI+jEh0l7y0+FeHI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222814b1-91ce-4974-0f1a-08d9eaead942
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:07:43.6774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf1y0rVjY2Q2YG/RKP7yOeOD7Bo263jxi5vtRxLeOwXzNIcgC8LUqdoUlAn5U25RbuzNHnYRWm0j4Srk3Hu92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7353
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
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
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

Please disregard this patch set for now.  I thought of a better way to handle the pm_cfg_obj.c file without adding it permanently to buildroot.  I will be sending an updated patch set shortly using the following configuration:

BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="https://raw.githubusercontent.com/Xilinx/embeddedsw/xlnx_rel_v2021.2/lib/sw_apps/zynqmp_fsbl/misc/pm_cfg_obj.c"

Everything else will remain the same.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
