Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E0EC7EE26
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 17:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9AB56141F;
	Tue, 23 May 2023 17:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9AB56141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiV9WNazpE1l; Tue, 23 May 2023 17:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B132B6140C;
	Tue, 23 May 2023 17:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B132B6140C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5C911BF318
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EE1C41C5C
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 17:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE1C41C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaZkX1J-ghxO for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 17:21:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E3CC41C54
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::726])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E3CC41C54
 for <buildroot@buildroot.org>; Tue, 23 May 2023 17:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw7s2lSlVwNIRoh66vjA6lvk4q47OAGTa2PaRqqJUbq7KrmGSnFpd+D/m4ujJaf9/c7wOBhbk1Gc8clnqPssjJfH0I5NGBGLH1R/LlFxqe78vO6oHUGrd1OSrFAvoh6OhZgh0d6A2Ktu08CyCovbBeKuLkiEQRULESo9RAQpTcEsRtKARoh4UMIA8CtAiS+A72RwlgwQubF4QoQdIhVY6uhaIOI1PX0Vfz1h3k//3GetXJbFo2/2rcU2RdjcbmM5WsXsxHN7yL2udUkzQ7J5T0ZSuIGuI8eJUn9pux41JM07QtcxGGeErp5NDbH3bN1jo8USdInBMoJs464klY8NAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TE57RUiv1f2loqm45+qQdCpXhanPbAoWhrIJV7JzDU=;
 b=RvwxRczD3yYkHdtGyp0NCKgpMRb/c6C5oZOv0oyB4T7aAB4nmQFOpbJZnlM0rnhqtOqyMEH0rm/i+L8S8XgjLY6EsDciF8l91+1h9Gz5uiuAWIuN0p1zkMhZRZdmqcITjIeadqHAN0s1JBqRblWRu81SbMcbO742nNW+jqPEncmFNJpbmbfEFVF1plrY2uP/Hu0W5/d1Vh1CODGwfwudW2rg/5ijsL+h8QUXkXPUoEwIbq3qhYZEDEFmRDcDlP4czxeDv6iON5/+eH1y0m3OYhDEVoQfUUJcdZmtI5klD/6s68NbTIAEzd61O2T7h2/Do7UwgPt1Mj+xxYz9viASgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MW5PR10MB5739.namprd10.prod.outlook.com
 (2603:10b6:303:19c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 17:21:40 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::50f4:806b:a6be:98da%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 17:21:40 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 10:21:18 -0700
Message-Id: <20230523172120.1948573-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BY5PR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:a03:167::32) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|MW5PR10MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de792dd-449d-4c69-cf16-08db5bb22b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhTr1r1ljfwJyrTre8eafIO2IH0ZcmlrfOLXrhq0kSimkPTnTTPojfMDqEF0+kVEUfPs3wnAn3o0fRUhkenN9IW3P9I8HFaGtdbBPqjb65P5rhR+KIxwPF8eHJLf+JnBiXp2LzLLzRbxSl+eBU9SJK6UwjOJg8HceTuoKmUYfFMzCQRB+qeKVn6GD9voQWW4r6g5Bt8tWRr9RkydjrMInx6d1vlxwaFf2Rscq/3dP/YELDmvp+fbJhwWaHZRpyXkhW+sRRY4SOLfBEg5ue9Nwznb9wqXj1J8Kgd9B3/7r1cQJEpwCnwpvXJNRJlFxuEkwG2sVsLkxeJypv9QoI0qOEn7SLFta96S/5+TH1xxgRKGhzxqX1YC77s73bTbJXtDh8fwfwxR2LjR/K+dDFJynjPRN1NqjODf45g87/N5Eg/K8Zl34pTtPqQFPFbG4iHTNLQrHr6pOjmEtgHWUyXtYDWSy21vSStbW3a3D1gVpkPWRlRMeN2b6FDyAKQ5UZhmst6TREbIS1/pOsiK0wFmKy5/GGRMXnrYq0uYiTXPykErfRzOQ9ROZ1BGHgdCH8ccBwc4m2D63V5/cHXWhELo8y7wmyJhqC8P7vVCzHjfbnNRnfBerXPRS02Kf0haK44y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39840400004)(396003)(366004)(346002)(451199021)(2906002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(6666004)(478600001)(316002)(66946007)(66476007)(66556008)(6916009)(4326008)(36756003)(52116002)(6486002)(6506007)(6512007)(1076003)(38350700002)(38100700002)(2616005)(26005)(86362001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ql4IVtpK5x5GzqnPuG2oHz0KwVPV7iYaYvv5JP34PPuh2DQ3JSPxy5/bbwbk?=
 =?us-ascii?Q?gIB6zLmt1HrMjPgxN5pw8JUPobOoxQBfNzDZbS0D4tsexPDEBG6kkbBuVUMw?=
 =?us-ascii?Q?XMke5KqtCJFKgPeUfAVVMuTzX930exRRXJb6Gg9H6oqkx+jfGtZCsaYhAhAW?=
 =?us-ascii?Q?Q40uko7ngPX9/cUKM30KWAQImIWCHaWJTkYewBH+3jzh1SgbsVGFYNmAEGNE?=
 =?us-ascii?Q?42VMnkLEZ9ftk1UC482fnkiElo5gn5cSlPkacn1C1kui3VtIG8iJn1afC8BR?=
 =?us-ascii?Q?J0Xz4IaO8v6TdS3OQKXWAEapT2bEb7sHt5WmQWPTnNbBigFVS7tWC3Fv+4am?=
 =?us-ascii?Q?1brAD+5bzCspDWmXYkevEF7u568ZbL7613Nt2VKrHHeBHFSUR+XWEzbPYUfa?=
 =?us-ascii?Q?AhR8WW944u2HyGzQ91PDiRVgJaL6TsWjHXc3d03AKVTnJeG2lw3ixUd9e2Tm?=
 =?us-ascii?Q?yt8yZBr67IdTLtrJu8WGOZV3gV8GGvtTida5wgLq09FCNQ7CFVS8EocJFcQx?=
 =?us-ascii?Q?/jwX2pjcqemo8DZ8DJhrQR01DrQ/napH6VyQd8vkghFWMTnSE5WbMecQ+6zE?=
 =?us-ascii?Q?YAUOa5wg4bqv2U2EtJQvvpgOAcAwmqrAWhukoQICa8iGNemRZUv5nC61ZdCC?=
 =?us-ascii?Q?5/kz5u/saC23/pvbEL4bFODQL7khJwUCaBYdpqMNxEXs6BYd/O3gySbvIFWV?=
 =?us-ascii?Q?jALGk+6zdKm/Nd5mYYPTIgWK1HamK99Zu5Q1Y3Voll+s3INVecnGoCCy1L+G?=
 =?us-ascii?Q?BS+41l27FOeliT0XOhZsNc6S5cZDaw7I4dhXWPeHUU7mlMDdkqdqd2ZhPDhX?=
 =?us-ascii?Q?KzG8pJo63N/YRkSefZV5pwRG9/ZFAF+gJNvSp56PqyLGQT63cyIDou9hskSj?=
 =?us-ascii?Q?/RjdDA9u+EErIYIqNzrSG2OEldC6FmDGGQq4dRTgVviNi2KuhrL90TjoflT6?=
 =?us-ascii?Q?uIrA4t6qd0awjymWQ+zEwdrALRDjx6M/el51FWscpd2+ibp6QTYbKLlRD6hz?=
 =?us-ascii?Q?d+KnDju6wVfxyAJZ7i/a0GhfgHBMJmLpUpom/4xI4yabC8smRxawKBUk0ILB?=
 =?us-ascii?Q?3hUqvKIob+uZb7K/2857DwZRWXSAEMy/B53Yh9R2N3bbXLL+9fRo3IGaJLaY?=
 =?us-ascii?Q?9K+AwfLFkqmDf+JSJ21XDS9DYH+zEfDhAPhFggQ6ApvmuByzpoS8zKjhmwNp?=
 =?us-ascii?Q?67aWRPlyLLs4g6OonZXQbNm1y8QhtgFipEgae70xaWJHALHb8NReeh7fB0uN?=
 =?us-ascii?Q?uI5JyIM51NypNTFXGfwhuJE6/aAOHC/z68E1ndHb8BbhURGFUu0xObeHqBO8?=
 =?us-ascii?Q?MSZN9fyTzymnxh9J+RbDj58Oy3v9WEkx3uJYOZh6Kvbb7lNFM/dnlCuZTkPJ?=
 =?us-ascii?Q?h+iJaMsKVyjFfciGjXHPhlF7PXKbwK6PzWKKKgvHFaJSCmVxR6Fr1S7F82wW?=
 =?us-ascii?Q?SGX5SpkkYc22PL666UoGTQMWjYtxrmGtSumIpmSzGZCyg8rfH8ELe4oNlUIS?=
 =?us-ascii?Q?cFCVHszxKu8giW9E69kJTtPOaqNBKCk1wmbTH3l4H4AtrCyO29PPIFdC3l6Z?=
 =?us-ascii?Q?FhjONZaFBrXHcGv8ICdEoRxgkBvuz7H7/2M54RvGUfsb+ROzgu54sUxW6KVy?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de792dd-449d-4c69-cf16-08db5bb22b5a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 17:21:40.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjbDcRdOos0lmXnSiyz0NBJtDCK+bb1XmdwY/pVcmAQonCjk5PtxBaX+WJ9cB5KICBiqMdVdQEz4iK9uazz/X8vqx4fa2VFuo0iFw1CwDUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TE57RUiv1f2loqm45+qQdCpXhanPbAoWhrIJV7JzDU=;
 b=Ec6+6MoQ4J6jBvxJVS6txu6oxSzXPeda4P5KvwQlw/XFeKP0ly6MS5GdNHpCA2GDlVgTEd5CgKLg91HOzYiBbjMTln85XWcN9uhmoU487PpVZ3ly9wOb1H3bs8VqeCMyLabc5+aY8/d82vjhwRjTPU67tQK9Q8eB8CcP2D2xZbo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=Ec6+6MoQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [v1 0/2] add bootpc package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Believe it or not, there are use cases for running BOOTPC instead of
DHCP or static IP addressing.

The /etc/network/interfaces configuration file allows for the
configuration option

```
iface eth0 inet bootp
```

However, this relies on two things. The first is the existence of the
bootpc application, which is added in patch 1.

That doesn't solve all the problems, however. `bootpc` only works with
interfaces that are up, which leads to a chicken-or-egg problem. Patch 2
utilizes an ancient technique to temporarily bring up an interface
before running the actual bootpc application.

The end result is an interface with the above configuration that
successfully gets an IP address and netmask from a BOOTP server.


Colin Foster (2):
  package/bootpc: new package
  bootpc: add dhcp-like configuration ability

 package/Config.in                             |  1 +
 package/bootpc/0001-main-fix-build.patch      | 37 ++++++++
 ...Makefile-remove-strip-from-the-build.patch | 28 ++++++
 package/bootpc/Config.in                      | 20 +++++
 package/bootpc/bootpc.mk                      | 35 ++++++++
 package/bootpc/bootpc_dhcp_script             | 86 +++++++++++++++++++
 6 files changed, 207 insertions(+)
 create mode 100644 package/bootpc/0001-main-fix-build.patch
 create mode 100644 package/bootpc/0002-Makefile-remove-strip-from-the-build.patch
 create mode 100644 package/bootpc/Config.in
 create mode 100644 package/bootpc/bootpc.mk
 create mode 100644 package/bootpc/bootpc_dhcp_script

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
