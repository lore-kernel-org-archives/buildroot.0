Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78649C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC1D83005;
	Thu, 24 Feb 2022 08:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XN-RAXwumg3c; Thu, 24 Feb 2022 08:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB5E82F99;
	Thu, 24 Feb 2022 08:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3591BF45A
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6893882F99
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlxXlsvc_p98 for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 08:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D426F82F80
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 08:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6SJrrUAknpJe/wKL3bQ7im9uOqiLDidcb3ARQs6eIuUwIsBd4I7xVNTIODPZkEPxxO8ge47fMDOkUTy/coEGlGsjcCjtmuhq+IXQR0UWdZPZ6+v5OGZj5vE1iqo0JbANpNfCHnPmiOO/iJYFM8hbEpcByHUsEoeSLgqWHhSe5saKXLv2metISQ5WZYoPkODQHWPjicMWbusZnlbhKG0yg6RG6QtCK4wmIG9tlkgzl5Nt8WnSlNU72rZO+P6B3MXzDxk/N1UNGm3dRAuiBgZKSjcfow50zBUFBDCC1WNvUyKmH8qcnkvT7SEdWMqwRVOW9J8S6vaNv1D8Htx8NMxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5srtYoE1PzX+ccVROvy+C5Zj8jP/+VTteeg/N6S17w=;
 b=FI4TuuvGmHwN9ZNfnm05iENrU/BzJ8oNYKaNO5x4++6bBhu0qTyjTCA9wA5/WSVhqCW2XJ4su22wvuQD32JtIAKhn/wgkgJCMWMryxqOtNOsfroaizce4HxxTcbaG5OowMLOLAIJhwCeF/sft9OwNo+eoW8tPsH8xCJF+MxVwE8jBS7kR8swRrDKKIu9pq9BfL1/sCmONZ5O06koZLzr9pLNWL830Ms8ZvztMqLWs49IuixH8NsXx9tRtg8byC0adBjPgT7/eXs9B+AFB8Thxfa5WVQzjPhlH3vIFqZCQP1A39pGocCvyVc5k4mTnFcqSz0Rog9owPwX8iYzS1/J/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5srtYoE1PzX+ccVROvy+C5Zj8jP/+VTteeg/N6S17w=;
 b=T7/uGg1k9horwkWFefKZnpEYMFWV0TIpNqA5g1J3D854BiFSJ3mZwFVij0w98wHeYu6DPv2sOq8xUmG90bqW1nMl0osTCIPm6ruvU57jwdoaWbEljdgbXQJX4+Vu96yI5gH49ZstsMoZEmTcQ6eAi4OulwI0ju2ye7YtjWUGGdM=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4076.namprd02.prod.outlook.com (2603:10b6:5:9d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 08:55:32 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 08:55:31 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKN+2jZNwNumen0au9fXDLnTh26yhkARNgAC0LDCAAAxaZYAAFV6A
Date: Thu, 24 Feb 2022 08:55:31 +0000
Message-ID: <SJ0PR02MB77587DFB75ABDA3B8716DE5ED73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
 <87wnhl4ab4.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <87sfs84sz5.fsf@dell.be.48ers.dk>
In-Reply-To: <87sfs84sz5.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d57a3a-2c4b-4478-50b1-08d9f77369c7
x-ms-traffictypediagnostic: DM6PR02MB4076:EE_
x-microsoft-antispam-prvs: <DM6PR02MB40769704BB8373647AE6E07AD73D9@DM6PR02MB4076.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5KDlt2roSzdrbNrzAZMxPCgWn3nWeew+NmhUaM2Kty8TzxDiMZ7vkRqs/K9X5Lpx6F1YEDB4YsUvmDVyo13TCCyxIZnLtkcNXHWv9j0qeJqxtfZpqN/fh4wg97Qg6q+P4uim+5giIcJpYJmioddUyrJzVRu5HFujyzbY3ASRKjTIavJyIEZkCST1Pfc9h7Lt4lQUl18uFVLN0oTUTZDG1V6VNtImLJ4PIP1BwfcQX88rneSC/rcRFNy3+WclYYSi4aFUlYD6+FkOA/wWXaTe2JsY2gkfnjvVucsHbA5MDxtr5GSa7u1k4z2xlhV6pHgh0G8A8jd3yWKg2vp4en5uXRp6aVbss2cuJveqtIeRc9NNCNZK98+4dnR7mQFe36Cs1SYv+D0pEdRS37LzDFo2+ythh0HymeneKPbNlK/PXkvlda3T27H2Wuc6NAa3juXcg8IVPod/Z34b0pGfQtsMBwHHyCG+V1psgg9YnFHpcl4VljOSuWtjAVefHghzkvKejx3OrBs6UykPEw9SUWOgbNHYFE1BUxQnfSSFep4I/VbJTkmnLuOI7VCCkWzS2aMhpOJhV9NKBIExOAQSDHjIwZ2OIpONWuSGdAgDKi0LNKve+G9+EWHpdZBSXozzW14UkArOnl3v9mAlq83KbkPpPCY77cL2jfRq6+e1MEDSZsnz0DTRPn4E5CJLUY1I5AmATh9uIQhBdJV+JefZk5wlmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(66446008)(107886003)(76116006)(66946007)(4326008)(64756008)(66476007)(8676002)(66556008)(54906003)(26005)(71200400001)(38070700005)(6506007)(186003)(7696005)(83380400001)(55016003)(2906002)(9686003)(52536014)(38100700002)(5660300002)(508600001)(86362001)(316002)(6916009)(8936002)(4744005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GCwlvwDxjqf9tkXfXS++MRwVrsrgrnvCq0GyFJkKfOLPQSMrxVtngs8EzAPx?=
 =?us-ascii?Q?n4uvWhljMvL1AR8ucrMwsbw5qogEfw3X51VM58IuBclPJko+P+1qbfbDC90p?=
 =?us-ascii?Q?eKvAH+FxN0lvS6cFGlaOcRWRdsUhFEN8y96a4dDhQDSyndZp/o0thQkpItIS?=
 =?us-ascii?Q?pxVXroLFKwGjR/zWpKhHYCv8w/G6q5d5B56XYwLf1IlDJc22DbCGKzdUsFvP?=
 =?us-ascii?Q?mtSZBIyXyRwxvVHKTKxm+1UJJ1JrCixe59sex8+A5jTcAgKUEJk3MCu30Y+h?=
 =?us-ascii?Q?HU/dnY/TJJ6U7tYrdUfPoGWTICeUyr8Zsny8/E94rfr4y2mwOgqgNE1QTUsk?=
 =?us-ascii?Q?nOvSXUIFJnvuDQsCh8K6S6DTK+B5SZMFidzRk3WfWq0akspa/n+ZSoy7UlEl?=
 =?us-ascii?Q?/6p97qeJ6xd1U7vzKrX8m/+g7vbVF+zOAt4Tp2aYCY1zsRWFa9iIcNYj8ual?=
 =?us-ascii?Q?p5AYqcMidT2a+zRbMXGmMU437yk/pyybRsBBgex6p7/1iIe8YAkLRdXOBQiJ?=
 =?us-ascii?Q?Vg9LqK0TR+ABYsW6QllR3mXEh8tYKrQWp/P5mH9DiEFm2rKouGmgTD0au+XS?=
 =?us-ascii?Q?WQeGBUgOYnDWjT8iV9BNVjBltx4VTiem7LVQl3uTLAO5nkJcRVTLnX51PJCC?=
 =?us-ascii?Q?8blIv0le5uwJTAF99lhgg6zcJKYGx7FTckIgu91o2IPe18I9oE9YK9a2yqFA?=
 =?us-ascii?Q?jSrMhjdngR/5SZoEfIE8/TzvZhvuk/Qdoeyx95DlcNxbv7pAr7hE5Icrobnr?=
 =?us-ascii?Q?ZnW1soratHxadxs+ttw2Rp02qYXfOvZLuLH1iRvFtXaKXphnZUOY/xDWC87V?=
 =?us-ascii?Q?lbYhMEtb3qisNXBC/F2XuZd8vGEhPWrmcZH6e4Gx98TTNWnZR0y7Ja5c23w5?=
 =?us-ascii?Q?xr5IYhRQgUutNW+vBK8MyDnSh71L8mAaJmjPxYHqpD4vVKM3JhkNGKAGuCa7?=
 =?us-ascii?Q?tE4tmqMHd6SHpIBf0sOkvjUz3lUlXO1x94M0MpT+HaT/jKl9fj1CwNer60fA?=
 =?us-ascii?Q?yTgcTAHnvdxSGKpDMuT6mW8QkjSgaIU3dWmwyJ1f0JMyf0KVjGhjVodHvq9G?=
 =?us-ascii?Q?CQObTXrDNOHu4idcy/H9i7jrHZru9KGtCeR5P7MNGq8MoT/+GoDcx4BfWp3d?=
 =?us-ascii?Q?mtzJUsQYInTahFncJaGWzB17KxpBNx/2XH4zdy1gXJYiXK+3BDT8FPue8AW/?=
 =?us-ascii?Q?TTOyN7nwtBwbOip6w7XyXoucD63rMQFyW6FfHconNep8XhP0V4/P6OmnIn27?=
 =?us-ascii?Q?mV8VjAzcKlzCpBkupMR/8jBQfuv9UpiXjIa9hVS+YvUJcIeMCXWbuFlIOBrL?=
 =?us-ascii?Q?UYbFNd6rgkA4gyTvfCF8VBWm+AJ/AyJnuu4b1BZ0IeiCajXR8Jkk1L9fQE0/?=
 =?us-ascii?Q?i+xMERHoh/I/ur7IPSr3SMJmQIXq4vtwbD+AFmYi9j/5xVwuR3FrQuKVSzlm?=
 =?us-ascii?Q?G3B3KPPuCc8gGlOjDwNa6KZYgdhw0JvTHjKVtJlfvApwPZahiKc5xkM15yCy?=
 =?us-ascii?Q?WVqdvsCHAftxTjV88+ay759OQE/WhepBIHSaLxTS9QsrUfnWd41RcU5rIytx?=
 =?us-ascii?Q?5FiS7ChbubtU+l42oAmudtBziLUTuKOgx1BOuIJxpwyq4EnfKua8jWp5GOwr?=
 =?us-ascii?Q?oJacch16jqIg9MAijanTogo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d57a3a-2c4b-4478-50b1-08d9f77369c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 08:55:31.5418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0i6NMDkIdZOt2piYURnEUslLG4WW9FAML34BX11f6unrkrj4Izls7HqiEwZJHGAZLbB7qsCqqLgYEM8o7iesnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4076
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Yes, I was successfully able to build and boot it (without the kernel
> bump) here.

I will hold off on my next version bump patch until Xilinx releases version 2022.1 in April.
The next bump will move from sha repos to the 2022.1 tag repos for U-Boot, ATF and Linux.

Thanks for confirming that we at least have a working version in buildroot now!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
