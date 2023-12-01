Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1937C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 14:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D6F784868;
	Fri,  1 Dec 2023 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6F784868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvOLz9c2_GTP; Fri,  1 Dec 2023 14:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6711B84864;
	Fri,  1 Dec 2023 14:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6711B84864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97A991BF5E9
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 14:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7D6403D6
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 14:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7D6403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bt4-dQ_aHxoV for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 14:03:01 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::70c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 591EC400B9
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 14:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 591EC400B9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6WpPLyG/1z/SkMaxCVMag48AMwzn1YsdvdTabj4OnXau63fiRPadKu1lytwXnZu09ojMjXMoM7GSJPcwrDJKA6HhMKqw1WilRGb+IRMHXY2qJuADoICYikIGcWTR3QxYWM2fQFAMbWOohSi0jSTtVk+EzGeX84JZTqECwiEFVIF36Sotqpw3RyOcBgXgTG47cDxZYv8GJJLcOzySPxUqmHXz1NG2p/JxvoSxXKUFbDflNZ68AyvFp2F2R0lTtBucL8In2RQueoEVvwLHOlToRLe5Zsbr0n0Y5rFdinr9k5XKttYs2XB2dqSEUtiSFW45lJLXXwmj49Chz+sFq4z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StTC7vukhhFkbmUR7Jc1tAroBnkKHAwjYbkMRqrgRrI=;
 b=c/MShmii4uNLZh0Uv8RGqsJu1HELURGXZZhDNahM+DMnRmjr86AnXD8aXOgGUBKZTZyg/A5jiqVTqXy88aWVRGUplhuavRw+spnJ8jjG8kAsF9wUZc9LtCB/k+2uh8TNByNXar9G+zmCuY8uFSLkm3ExhbcaiwoAyNbhfeeD5aE2Uco2CIDNuZDaBXJkffl2MZMpCczUnYx0/TJB1X+APT4POne32cB9zMzuHVBzRNBhwtOcbbMralk+XVfBb2U59WksvTkZrMU+bzNBLtcw+hfqy7SwGrR2B9aaGzUl9lHr+B/n6M8hK3XDKAyLbXngZOxpHYvikRPUNJh0zVMUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by PH7PR10MB6274.namprd10.prod.outlook.com (2603:10b6:510:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 14:02:56 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 14:02:56 +0000
Date: Fri, 1 Dec 2023 08:02:53 -0600
From: Colin Foster <colin.foster@in-advantage.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZWnnjW5sekoYb2Bw@colin-ia-desktop>
References: <20231024214108.1602700-1-colin.foster@in-advantage.com>
 <20231101231019.4e297333@windsurf>
Content-Disposition: inline
In-Reply-To: <20231101231019.4e297333@windsurf>
X-ClientProxiedBy: CH0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:610:b2::18) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|PH7PR10MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: a32a4a54-3823-444d-c5d5-08dbf27637a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 880OGCpU+M9ux3Sjz6up2SHtO/MpeJNHyxGzDqnQRI9a2jQ2VL7FDEGhKLAO9i5hb8rfTGenwCAMnwnm4T/wZCveehKBeA7uskJfzuny7jZJFRf8Fkogz9nCXgufhDZSDx874NzTDN6CPGN+TI4JQvBXaYsyEP6WM1PMpK8cvoUeLOL4c1IPi779WlfXjyjyzr5EW5DD8U4/VSyJFr684Htg337Q+IaRbmXnMF4wpPqjEfHoGxWY64aKvqyRdcBXBaxk6Cx5F73Jk46ly34bqVv3GGGX988JCO0Hu4IyIB6ZJ6EewxIWp2xxzk7p/UpApgXK0AzAQg53iTk+TvXIAiJwyJFYPx1zCFCPvxnefXR+q25E8tk0o2XnqL2k/T+T8+k01cwbuwvsomCqFlGD8qEc+KINrtcvK5JelyRpD8J6B9Iw0/gqABVuhYelAPP3NlBQNOVj/W4QBGq0xfe7iNF7+MJXVIhFSUqhku4J5lj23hbQwlrHFJuYe7pbdaXTc6ntq5qDvM4KdE7wA5Ba7OLBXpd+ldJxASgbpVAJAzyzgZoAzh/CmmjsfYF1seIF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(39840400004)(376002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(38100700002)(2906002)(33716001)(41300700001)(86362001)(8676002)(478600001)(8936002)(4326008)(26005)(6512007)(9686003)(6486002)(54906003)(316002)(66556008)(66946007)(6916009)(66476007)(44832011)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FClST8666aisqVAhoR8+Rs1ZSSKIasEbfw9nw5Wsu9VH0DgcwulImquDwEzS?=
 =?us-ascii?Q?FPMVyE3Ou34WUQryIcK9qGpCtQzJ/HQbnBCoNkObEfd6zgL8qitK1Jopf02J?=
 =?us-ascii?Q?cGzYVkfmf4o0YbI0Y/drr7UdQETdUcvgffl3ebTaJteicasx3Og+cvV0ob33?=
 =?us-ascii?Q?wn3W3MtorF2ifu8I5WN3cUbw1BD33fl1ycKX1JYK+djb5KVYzmf1C23QRJC7?=
 =?us-ascii?Q?8NV5pCHF6+Qgj1qDCg74YjnPu3cG75Ts3+D+F1Y/IqFtPqhXPoP3Szn1RueI?=
 =?us-ascii?Q?lLHqxYGdjVU2A/zjYgC1a5gtjl28iWv6y4DXq3eVg1qLhrORXRn3M/qJUbPa?=
 =?us-ascii?Q?D//YNCXtl1if/i3VHhvdsGqde8oV6AFwV2t29zV8/O0WyKJZj6jgeYg0yJch?=
 =?us-ascii?Q?rnVdlWyB9E0yYDh98vK3KxiYqdqnYcezmOdXO3BEYcy8/xpB256KR4OvHnTP?=
 =?us-ascii?Q?4UaCFVxNtQR0ITkx4rAaIYC26s7tEMBNVogsxja2vFFdzkPxlS40tJyHF+EA?=
 =?us-ascii?Q?Tqi55SPw4IK7cjmILbeaZD8mCk9hZ/Jxf5kEW/wZPyUzpef4jvOc+r2roW92?=
 =?us-ascii?Q?Gp4V/0PemyF9WGeTnB2IpPIF9k7DICN2y7n9V/hW4Rag7r7Fgv9ap6nq9S5s?=
 =?us-ascii?Q?nsN6MDAIt69KuEqSeE6SZcxR40YwSAqAIbTEUSNpBYiAXNmH3tGKdEcNs5q6?=
 =?us-ascii?Q?zx5PZmhFBrdhsq/ZBULxRrSu9e1bA7cTuq8CnZTYjQvSevapeoGTBbH4Y2G6?=
 =?us-ascii?Q?3JGvxSfW2BnkngDBXxjSbtvzg6N5AiX4mBgSssKsicmeFYkzYylja2Gd1uyV?=
 =?us-ascii?Q?Rt6rjXSl2ipnl9hf6sZFUa7gfNdS6D4HS/ig69wo6PdU0mVrweReKQ8K2LqE?=
 =?us-ascii?Q?cgODS9d7m9YOY6F/33IVk5tV8nD3vuvhA5uO0JCxu0OnlJHzviWkMziRntN0?=
 =?us-ascii?Q?TZ8ngGgwIsucRpDe5uAf8Sy/qfUzTNQJoMHW1UBH/+t/KPYMcOm/C0DLG3j7?=
 =?us-ascii?Q?QlrnUVpRkmLY3rNdW3qvVY+QYO2oiADbRtjU7gimLLwegE+abKwWRs+wJNaY?=
 =?us-ascii?Q?7HfBGa1mqiT8kZHUxUAlmfEpwuMs6wyO72lvmxIng4EYIp0Ibak5RvMjOiJi?=
 =?us-ascii?Q?lj/rs9al5GqBvkNhmqrHUqhCf40fK1SkZ6FinLPSTE5Jx3I3d+Qx5H1Fkpgb?=
 =?us-ascii?Q?En5i8BQYG+ri+Mh/YwDV5/Q9a7b5XL+LnMlY2zyFMbuRip/T7H765flAcgPr?=
 =?us-ascii?Q?j5dQeOOxXHyJVLaqHwno2I77cgSlGnkPArlaqMxmPLRL8l453FHa9DjuNFd7?=
 =?us-ascii?Q?7Q4xFjDjdykzVRyrdydz/qeR9UwTNT/zICIQ09wvEC++f08zq26Tbv5NUZ3O?=
 =?us-ascii?Q?ywf9elSll7yNw+wNi6ODzD8EqOlocEbj8ZD7cCqJq7oLSt3vf12DZphpDdK2?=
 =?us-ascii?Q?3KsYp9ZjEqOcFKnAzE9ji9+yQ2yRSt0fA0Vst+ab5uGA0YHv/P07lqme3X4h?=
 =?us-ascii?Q?j7p9T1uYYO7kXCpe8VPbp3DbgYXmfznqJC5NtX/DrAzmAJ2BhI4yplb/7X90?=
 =?us-ascii?Q?PluM/P87+XAaOWcYgDrgOgMMXTF6t20O4c8nZvhZYRu8FjDZIrnJnM2ZZctK?=
 =?us-ascii?Q?mM9q3bwnb5JJDcbU1X0pCNw=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32a4a54-3823-444d-c5d5-08dbf27637a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 14:02:55.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbDr5gYKKs7XOUTYogypncpbyH4AkqI4DNiaFCUpv2mB1dRWdd4lrC1eIQmXN0tZwZJIvTzZ0+cnTHSHQih82mRcK3p86TJYPFpbEMkuZzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StTC7vukhhFkbmUR7Jc1tAroBnkKHAwjYbkMRqrgRrI=;
 b=qZte2zoOBCl4BJ4oGQic3Mbqy6S2tOTxq0I/pdigp6q4B/vplP8hQJ/usnLARMIn8na655qUyQxJW/TdOU8I57i88L/YdUsrjxYAyfYRiFK6TFVcbiYY742DiiY4HNnHVBrLzedc9gVVdQTBK6kfP7HCqtUsGv8YvXQ/2rGoZK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=qZte2zoO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH] package: python-tftpy: add python-tftpy
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wed, Nov 01, 2023 at 11:10:19PM +0100, Thomas Petazzoni wrote:
> Hello Colin,
> 
> On Tue, 24 Oct 2023 16:41:08 -0500
> Colin Foster <colin.foster@in-advantage.com> wrote:
> 
> > tftpy is described as a pure Python impelemtation of the Trivial FTP
> > protocol. Add support for this package.
> > 
> > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> 
> Thanks for your contribution, which I have applied, after doing a few
> changes (see below). 
> 
> One thing that would be really good to add is a small test case for
> this package, in support/testing/. You can have a look at all the
> support/testing/tests/package/test_python* tests for some examples on
> how to do this.

Thanks for this! It turns out I need to re-test my email filter, as this
response got lumped in with all the rest of the Buildroot emails I get.
The real responses can sneak by.

> Entry in the DEVELOPERS file was missing.
> I switched to using the github macro instead:

I anticipate spending more time in Buildroot in the future, so hopefully
these fixups you need to make become fewer and fewer.


Colin Foster
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
