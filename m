Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDBCCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 10:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68C04400FE;
	Wed, 18 Oct 2023 10:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C04400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlgXgO45kMUp; Wed, 18 Oct 2023 10:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69C7D401CA;
	Wed, 18 Oct 2023 10:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69C7D401CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06EBF1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A41918224A
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41918224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMJuH-xpzkkl for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 10:08:16 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B71C82244
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B71C82244
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ+equMhKtubA67s18Xb5+Bd/nyjpyAmbmsfnLipMwnVUNib+dZGUgZ6km1/H8Bw4ukJnrX9OwTiSf/zuWC+PW8APj0GrsT77KlXr7W37d2LGfYMLYAzrB+mBQ09N5qWIjUAvY1ST8rJyylDeDkVn/O2ZYaQ+90hAHQzasmPYBiuwZ8rn2CZLsz9aa3D+VKiRvgYjrRR9n0+i0u5z0V/SzM8/A3BhvJL63GML8qrszBOI404WTixwrL6ybdewcfMGmreCmg2S9LHlCJRU6G07Js3bX2DHtj3ApCmd2q5zm9B9LP5mfnW7zsZCoBWG9KbR7O+3llH2pt3KXSLw+2GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfUE6QhASeqIIXw+IZhHkCsZspaxKvBBbr2dMGIzfWo=;
 b=bOnk2xGBRBvVxrNLqRtjZGG2cbH/B7RtfzJ18lfqwfr9kN03r4RHmr5svTkV1uRHU6ttU3k43F2MZ/1iXxSRnt2JUCxZOk4XfwfIBKkpIQlMexccRgVNRl2zdmxsOcd6ST165Pw1wSSXmTAYyd0X2m05ae822f4YhPE4v/lAlIPogfWVgtvyTa9TjzF3jpwS2AiJ9l5uhljpa4gisbU7LonbYc8YNHjgvEfNwExIzrxX2IA/NM2vKAEowvSD3oYVvuX8RzrspWhXx2+46ULC8aWZETyRUTwe6xGc3s6TEsX5S+2F9eOOLKn/ccumpa4OJzxLl1TQVNttoxFKS1pTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 10:08:13 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 10:08:12 +0000
To: Peter Korsgaard <peter@korsgaard.com>, "Simek, Michal"
 <michal.simek@amd.com>
Thread-Topic: [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to xilinx-v2023.2
Thread-Index: AQHaAaLs43FKgLQKdUev5BO+lw+rQLBPS0ORgAAGXVA=
Date: Wed, 18 Oct 2023 10:08:12 +0000
Message-ID: <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com> <87h6motghr.fsf@48ers.dk>
In-Reply-To: <87h6motghr.fsf@48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: michal.simek@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6162:EE_
x-ms-office365-filtering-correlation-id: 5aff9c89-aaea-420a-902a-08dbcfc22379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19gnDkl/4rmd5sbawIERo/OjtWJvah3WSI3KRMPN0hkbseuGKemAWA9PlNLCYNp9L0U0Rmgbq0v51OeRvwHdLYvCo1FEzEOga3DayNAWuNSU/eJuq0dPZdd2JFT4AfSNnNbSGKSRmdjrw2yxpSn+lXwG5XMRWU+EyLvyS91Oszafas2u0c/ifRf9mdfsqExx5cbWG4zfFW4HoRaLr5Tkn2yBNUKqfxfXnJPXDkUCax3xPqeYmESxX+9va9pThhOrMVnvvQznd4WOrOwTK/MkbFK+UvGs5WJ5s3wV1zJBxMD9vrsFrQg065AyCANKPNB3G7qm/iYy8YZTM75b28DrO4oUH6xE87AzViu0vel51xtTjZVJNMwG7BRh2k5obS2HdrQgacVPkfBGpmSEuXGKhhkFZ+c4/a1owHdJI2DsTp1UviZa/icsqwduxxTAfEOtCg4j9Hv/xSom9NnBgf3xYGpl/AEZLLj3JtLLfazaxqxFDdxhdVMtwL+GL2l+2zcSsshYWNQeIPHlCPHJ/Hx87UrMqzCUM82m684i1XgEflAmxNpiXMbNf/yknTcSc52KO6FVCVKQOX05mU3zRUYg5E9ESjdBbiWkCfbZjIcz6jaQfb9/g8wuCrjJDzSJ1Aaj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(110136005)(66946007)(2906002)(86362001)(478600001)(41300700001)(54906003)(64756008)(66476007)(66556008)(76116006)(66446008)(9686003)(316002)(7696005)(6506007)(6636002)(38070700005)(8676002)(55016003)(52536014)(26005)(122000001)(83380400001)(4326008)(71200400001)(33656002)(8936002)(5660300002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yNDxak2LVrNzYXFSIAtzNud04rm5xJuQkRFc5nwV1HsJnE7Hrgow7HMY3FHl?=
 =?us-ascii?Q?WUIMgLSeBdZcJ4by6tgNnzuKUxfeXpKXDtluXPQXFY9G4h3qn8BTtnbSCPYQ?=
 =?us-ascii?Q?kTDcXo0qRuNXGETLDyuHfQny4ftP8SLHI1aYnm7/j/1gdkTTx/+8yzu3TtWF?=
 =?us-ascii?Q?1/qRzNFRwJh5F1aE92ChsghkA71AIfYyDE3it/znpHx9S9Y1K/4wdGyv5Zo3?=
 =?us-ascii?Q?XWQkjzIdWvCQz1krLsweEBlceJ4dZ7wiPz0kBAt76dFcm2/XchrA2hKE8oID?=
 =?us-ascii?Q?jiiX8Ujfol6lvjd7OWvT//uk0H36fLnBcHGdNdriNRyxRcGh2G9bpoidxUHm?=
 =?us-ascii?Q?AIGW+Aj2IdbBc+FXCGZPHgaBiFM884XaUvaRhdLhptmJ7c34hRn1Nu03wXEj?=
 =?us-ascii?Q?7RBx4pFkhHVof6l1MXHN4Vl/3+pNON1H/ZtKZSRjSCKjOaphWoyJYXQeIfw2?=
 =?us-ascii?Q?+Q2NRe+JFbf6/dIii+gdzqwGEQvCeyIxWeKq6GGqc7iNJl4IwjqaB72etzBC?=
 =?us-ascii?Q?uA2mttMUyiowWGjeCn+xKVsv34fAFsSA/R9FtGkxee03ytraDpdVTSQWQx6n?=
 =?us-ascii?Q?vPFpxSzsJ8lnAdrMlnr23pIqpK3BVPeWNARKOU8adBbWwNGBt8jV6R+SJSMF?=
 =?us-ascii?Q?WuLDdadOwYvWM2QMbZ7kkFL9DhhLwt4IRw2ZoMf2Bp3ocu0ymmC1wutoHqA4?=
 =?us-ascii?Q?cfZnacZyXF5KKWZU43sIncfBg6E5/ijC4eOz2k3/unHFFpCLyUiufchYoJmk?=
 =?us-ascii?Q?Ystxxyd7ZmaONNMCa00sHuOe4VAW12R/vfXE9sx/ntaGcMoArsFwKP7kzun+?=
 =?us-ascii?Q?14XgesRfD0td2a1BNwzj7KdgdWSJfpYV7utpizxQUlx36xcG8BnLQann9d8h?=
 =?us-ascii?Q?xhYf2SDu8HfLea2WNLfhclBkfdSdHBHwkYzEUihKn8WXYoo3hb1F13OQhrVe?=
 =?us-ascii?Q?aQwYp/VwHIp+wv7VGalZXQ0VdIkbHPQ4xLQM6iivslcIapaJAqMKcvllkdST?=
 =?us-ascii?Q?nEcoWmBh4rkbvxBbpYuOAOKn5L/voTX9oSh7vaByAqKBVXqIBID6Y9Lex4OM?=
 =?us-ascii?Q?L7QgFYd7iFEfpOJ4Fev1lHG7uw3yh9Emz+EsoFBbSHnhVdohSaDWYBZvj0Q6?=
 =?us-ascii?Q?1ZBqoQqt2WVN1qmOPmPvuqPkq7Tw/IxuygPxtZZGUWLsDzVOmF9ptY4k9csq?=
 =?us-ascii?Q?NygAK2H6aQJyPS4KcZyvx0/NY3lEjEQMwz6txymFEBZil6hhOEaXrypjEKUp?=
 =?us-ascii?Q?PDxmWcHaYq/X5IcwqkHZGpRjE4QdDlt47Wr8r+w6OWq9i66V9D+EwfoKQTlS?=
 =?us-ascii?Q?BTQylrgaCJsVxGgf/u+uW8s+PhYttkqA9P73MGJLCrS3tpUBrVvEQQA6Eamx?=
 =?us-ascii?Q?pWL7kLY3cNfN8kixoUQTNDKy5mjFoiwUdkjNpvE3unMUjiH7xQO/jcrMkZJl?=
 =?us-ascii?Q?6Dyts7TVlM9CLQ2QJ3ENx8MmbqJli6WFat2pR86Q2nFvxpBwKgTPzVoSOLI9?=
 =?us-ascii?Q?upPPhWwTCkUHEwQ5wrjs3IvcmQCIouApueUB7ZOep3fweiIF0Qtg5+sS7DBe?=
 =?us-ascii?Q?F4Jc+Fh29I+jurZF2BM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff9c89-aaea-420a-902a-08dbcfc22379
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:08:12.8217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dA+Wde2lgPc8thSIrlCTTMsu/niI+FoeM7poySkpMKpCPWHqxuf5V+UKlOxS+zW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfUE6QhASeqIIXw+IZhHkCsZspaxKvBBbr2dMGIzfWo=;
 b=HlKXDCqSXqJfdV4PDXKT55BULsWXPVjugkgtqNb6b8LYJYJC/C+nHWyX9UIKDf3Ni2/TT7tZy8Zr931tLE4ZYBExH9czQJCn3T0nIqFIQ+CfnKYtEEqfyZ2XtHk8RvT86YPaN4+FtO6JPjS7JdgbksBpZuiEHkK0Mi0jMYyMQQw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HlKXDCqS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 > This patch bumps the zynq_zed_defconfig to xilinx-v2023.2 which includes  > the following updates:

 > - Linux v6.1.30

> Out of interest, how come this was "only" based on 6.1.30, when there were already rebases of 2023.1 based on 6.1.40 and 6.1.50?

> commit ae6daa717cb4cd4d8234e6f91b99af68ef438252 (tag: xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.40)
> Merge: 9299ac26ca51 75389113731b
> Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Date:   Wed Aug 2 13:28:10 2023 +0530

>    Merge tag 'v6.1.40' into xlnx_rebase_v6.1_LTS_2023.1_update

> commit 496752408d031f93159fcf1aba2831c807a389a3 (tag: xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50, xlnx/xlnx_rebase_v6.1_LTS_2023.1_update)
> Merge: 0f7f048016e0 a2943d2d9a00
> Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Date:   Wed Sep 20 17:50:18 2023 +0530

>    Merge tag 'v6.1.50' into xlnx_rebase_v6.1_LTS_2023.1_update

> - U-Boot v2023.01 with additional bug fixes

I noticed that and I actually have the same question.

@Simek, Michal, perhaps you can shed some light on this?

In addition to Peter's question, should we be bumping the Linux kernel release tag we use with buildroot each time we merge with another set of 10 upstream patches?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
