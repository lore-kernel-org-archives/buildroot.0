Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D4EC433FE
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 17:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E50860E78
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 17:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E50860E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iml.fraunhofer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0A9403C1;
	Mon, 11 Oct 2021 17:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wP4yDvnhOj4A; Mon, 11 Oct 2021 17:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A30C40370;
	Mon, 11 Oct 2021 17:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 505611BF326
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 17:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B5E040298
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 17:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_u3wwkoxXxG for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 17:29:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx-relay13-hz1.antispameurope.com
 (mx-relay13-hz1.antispameurope.com [94.100.132.213])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0A64400C1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 17:29:30 +0000 (UTC)
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28]) by
 mx-relay13-hz1.antispameurope.com; Mon, 11 Oct 2021 19:29:27 +0200
IronPort-SDR: RVhR+GKzs8c7J7vonVMR/fkAoe4bKPq7X+G2J+KqLNn5/pPNU3QrifINGboN543SVvxxc6L3bH
 LyCJQyg7gTwMVUbU83pl4KK38Sn3jKplElyzZUigxk0yQHUax+RW36hzwuvrW9+lWcbIGjhyO4
 fvkpiroZAJF9W0xyZ0eRmViSHaL4bBZ2pNDS8/h0ERdgyAHEmo9gATWorZ7LmkMltRJIxjdRiD
 UFugmzNcTqLTxLANzYtkIecZe7PoU3/+Ozrde8AgFQpVZHj0fSeoeO4w0NYi9PsntwUs5boucQ
 JMQMbdndqG3W6G42tfA36UZl
IronPort-PHdr: =?us-ascii?q?A9a23=3A0Bb9zRX9STBlyODXiNJEck33fjvV8K0cAWYlg?=
 =?us-ascii?q?6HPw5pBd7Tl+Zn+bwTT5vRo2VnOW4iTq/dJkPHfvK2oX2scqY2Av3YPfN0pN?=
 =?us-ascii?q?VcFhMwakhZmDJuDDkv2f/Hvf2o8EdgRHFNg9muwZE5SHsu2blbOo3q0uDgVH?=
 =?us-ascii?q?Bi3NQd8KunvXIDIiMHi1uW2vZPJahhOhD2zbKk0IBjlxTg=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3AqKURxauip5xeioKivqG8z8xnYefnVNNfMUV32?=
 =?us-ascii?q?f8akzHdYApBsoF/qtZmKWCGbq6MY2Cne4onat+x8UIEvcTSxoQ1SQNkqXphE?=
 =?us-ascii?q?H4XgMeUXt7xwmUckM+xwm0vdK/shiknQoGowBkcQiCOqxGzHKLmqHUgh6iES?=
 =?us-ascii?q?qClV7zFPyQ3SxVtVSEhjhxugag1j9cw09S+BgqMv/L0otHeYQP0hWQrbzhMs?=
 =?us-ascii?q?6/T+glyuPnSuS8DugBsb/58ulKDxWIeC4gSJP3sInakEIlZGum2G7TKwL2jp?=
 =?us-ascii?q?D6L+hAnC9eo1LvreU1MTKTbIA6OjXRbQe6uj0Ea9CA11686MtsaaFtW0mnYw?=
 =?us-ascii?q?YoulY8V7ZHgGx00OqDsmfgGV0UKGS9JO6AbqqTMJmKysJDOwkCaIWHgxe5iU?=
 =?us-ascii?q?BM/MYECobwlWDwVsK1HbWlSMFXd3aSoxfSwDOd2j9klLM7lMZlZtnw5lWPVC?=
 =?us-ascii?q?vMvQJbiRaTW5IYEjWlq2Z0URa7TN5gDdD5iTBXceBkTaF0ZP5QzwbWzjX7lf?=
 =?us-ascii?q?jwE9V+YqMLbOYQIIDdZjf69bbI5RvTQHZ8Mxx7B/zqcl4jEKkhy2OK3mWLtH?=
 =?us-ascii?q?k2E27encRPTAOr+JZXgnhJYqAT7Kl87UHX6YWCGTcyR0SZSbT7/x3s8oULCp?=
 =?us-ascii?q?YBqnKCio0KUsxeQ+BZotTZEMzZc/nFT1e2D9kbUy17x6mksSzlLadgr8sImT?=
 =?us-ascii?q?jxs2EWAgtXpAjJiqvuZRBpx9J/N8Gj0aHdTdDBcI3FeJecGy4GLTIUblQ7CQ?=
 =?us-ascii?q?N9lVrG8isH4AxnxxjTMojI3mrMTisAGzeO38Dgrhhry98eQF15vuW07WUr/t?=
 =?us-ascii?q?18oPtP7D2Cy0nDD9rBaIZ6eVEWps30U3c6T8IgmB4yMkCCXR+IRNLu05vKJK?=
 =?us-ascii?q?jrbnRhoBZZJytgH0xZPZqgJvWo7dRgsa5laPGGzJlHW/wgX6oVaIX2qaqF6e?=
 =?us-ascii?q?cS9BqwXIWHbPYyNfpjpghBmPvCdrDO6wRw=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AHJ6fvasZUW1qkXQubw6+9xNK7skC2oMji2?=
 =?us-ascii?q?hC6mlwRA09TyXGra+TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKdkrNhQYtKOz?=
 =?us-ascii?q?OW9ldATbsSorcKpgePJ8SQzJ8l6U4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zE?=
 =?us-ascii?q?nAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYaDsgPav0ADQHkj/AP7LZE?=
 =?us-ascii?q?UtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzUH11yjCoo?=
 =?us-ascii?q?mzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0i?=
 =?us-ascii?q?dvrDD+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uW?=
 =?us-ascii?q?seSGqC16NohqAM7Itbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0VbW?=
 =?us-ascii?q?IyUs4ZkWUkxjIcLH7AJlOO1Kk3VO11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA?=
 =?us-ascii?q?2PTEQOstGcl2E+pgE182IIgMgE2nsQ/pM0TJdJo+zCL6RzjblLCssbd7h0Cu?=
 =?us-ascii?q?sNSda+TmbNXRXPOmSPJkmPLtBMB1vd75rspLkl7uCjf5IFiJM0hZTaSVtd8X?=
 =?us-ascii?q?U/fkr/YPf+qqGjMiq9N1lVeA6dhv22y6IJyYEUdYCbRRFrEmpe4/dIi89vcP?=
 =?us-ascii?q?HmZw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DICQDAc2Rh/z6wYZlagQkJgyFRB0y?=
 =?us-ascii?q?BAwEmQ4gOA4U5hWeCJzgBmjaCUwNUCwEDAQEBAQEIAQQ6AQIEAQGEfgKCRwI?=
 =?us-ascii?q?mOBMBAgQBAQESAQEFAQEBAgEGBIERE4VoDYZDAQEBAgESKAYBARQjAQ8CARY?=
 =?us-ascii?q?oEDIHHgEBBA4NGoUlAw4gAqBtAYE6AosXgTOBAYIIAQEGBASFChiCNQkJAYE?=
 =?us-ascii?q?wgwOLCIINQ4EVQ4MlgQWDQoNNgi6NAIFxCGW+SAMEA4IEgSyfCRSVZ5Ewu2w?=
 =?us-ascii?q?CBAIEBQIOAQEGgXgkK4EucYM4URkPjiwWg1CKXkIBMTgCBgsBAQMJhUcBAY5?=
 =?us-ascii?q?MAQE?=
X-IronPort-AV: E=Sophos;i="5.85,365,1624312800"; d="scan'208";a="69711827"
Received: from 153-97-176-62.vm.c.fraunhofer.de (HELO
 mobile.exch.fraunhofer.de) ([153.97.176.62])
 by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 19:29:21 +0200
Received: from XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 11 Oct 2021 19:29:21 +0200
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (10.225.8.37) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15
 via Frontend Transport; Mon, 11 Oct 2021 19:29:20 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Asmp9+45vox6o1s5Toqtn7AQW+LGMWREU7rkuGfaq7KsVyPua71PPkf8ticLblAFSXMmQCPnbnOJ7zhF86AODl/FvgK8vKw0ZoWbK70jWlIUs9Wi9f88J/Rme6KSCg7oCoXkgDlLwb6wOS4jvYNZjjrRVCJ2wuCcD/z4lz59R6fMRQg/7rKLPf0OBR4twg7u6UW3lueMPj1EJPeTrd2vgyxLX4/40CZbWFIhNPvmyTY2Ys/pfuabF7QS2wOjtYGpe6gUVDJ6Ss5KPpCzL9cWsBrtClH0zNIqyamfPSzox+i5W0nto+fWMLvVjYnbIFLOqnBZuwymEOL0OuyO1S5W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSYoFt1cbw9Ka2YpM72aEE0vc+cHJqU8MQH4U/nAU80=;
 b=DDsH1eNqYI2rSzNvEb6d1uGe0Ns7634cWgcFRib1nEj8N09unsZB7v+8zEDUiv3sC5qtCwKjQpd9fzJrtyaGTr6x3CB8NpxDQ2eLJfOZrtlDJ/M0TP//7hbfApy9PZhAWFxXCxwKL4PYYdwC4MSfYNBD70PTI02kYgk+koEJMlH5HIra5UK45b16uFR+0bg0m7u1ADCIOI8H1rgVdHa6YiBi77CrLRNl6dJWV+xyR46nAlncb5YzOZFj8Uw7habbThx45rJxPcWQCBSKboCWklRATrIcBD/RoHucU6OFXjYAvHw1F8xVWnv2LjqzaxiaxDgPjzkldse016+aQy/TEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSYoFt1cbw9Ka2YpM72aEE0vc+cHJqU8MQH4U/nAU80=;
 b=k+cRFtjFIjMus6Yk/0hStXwRbOZuG2+JsbZ29RjJpfK0LPI34jxaqiqShtq/r0HKad9VyaaqquX76OVh6sTck3qPZM+u6r98mH4tvAsejnmB/wrMnrSHdKDy/ev/pAObjQ9upVpI3m8lKddKbdLNW/vXc4GnTVcJWX2Ewki8G+I=
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:4:c5::16) by
 DB8P194MB0696.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:15f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Mon, 11 Oct 2021 17:29:19 +0000
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a]) by DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 17:29:19 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
Thread-Index: Ade7uZXHP7nGx63eQL+BAdw+WW1TNQAC7xCAACJQTnAABr5hgACJCEnQAA2810A=
Date: Mon, 11 Oct 2021 17:29:19 +0000
Message-ID: <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=iml.fraunhofer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa52ae03-e358-4a2f-674e-08d98cdca845
x-ms-traffictypediagnostic: DB8P194MB0696:
x-microsoft-antispam-prvs: <DB8P194MB0696876E324D65A125D5DA5BB7B59@DB8P194MB0696.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lgePxCRy8NKeihJt77UbudcI+FQuT2wQTL4Mtwtfkc6E/+RAdFqFJYhWFnfmI+tRTMQ4K11tMSGr7MDWe3l1e0GM9E5dGr1ZyVgMyx78yW63iaJNum+kZwnfGwOZIkdbk05yXA9j1mc2OpaQDuKn1w8ThCQk3YIDBbTZl9QN6NqT93W5aEneRrEkaD9FpbB523m8dgeQIEeU/I11gJMGraRdqXJIzpLxNWSsM26D7TsKu2483jahHOiP6U39Ln4p3K5nHL5KVbXsFsoVu1y5/oNFP0JdyZ6dzUkqZDMZdadT9RftuRHPi4dvuyFLC5PuK5fU3448TRwRVC2M1n2LDt+h5zc4dW8ENFeVsrT4AFgUCEuWK3wAEIr2zmOU1p1CqYKoVdnIwDq3ZUXrQaEmpa1kxJuJp/kZBms1bGEj4bVaBAETYT9l2PsdNZsolTPY29Y9W85IlH3AtZvh/Pgr7B9tPXHktWfrvJ5SvRxWZrmxGZcvjMVNnkdJ94BxZH4qOtzrgytcYaWOSQXq/f96KFFS7TmeXZ4tzBEDP13ADc+nvibrn7Ef6WnE3Szlre8Ti81TnSlc1M/2sJe1nBVGjm7cOrFM24/JiIgP6hfaeF2yVMzLj+jbiSXYaqVoOTOZW860rWj7Ap42JvR4DfZGPZcNBsUHbq0OicmdbK9KgEj59XJ8aOcy6Oj5jhbcT4C2Z1YMjWqkcC0fqrQlbDyR+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P194MB0022.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(71200400001)(508600001)(316002)(7696005)(186003)(33656002)(2906002)(26005)(55016002)(6506007)(9686003)(8676002)(38100700002)(66946007)(86362001)(8936002)(76116006)(6916009)(38070700005)(122000001)(2940100002)(52536014)(4326008)(66556008)(83380400001)(66476007)(64756008)(66446008)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dR2NesFH/TIP71IwVSDTQx7U2rSGA/Tzq31kzUkqC7gTDo2UpybWE5yf3oX2?=
 =?us-ascii?Q?ZZ8II4o+/M9F31OORsJPV/IYZP1WqErV3M5we+MuPCxkR6UZg+eQjiT6jkKm?=
 =?us-ascii?Q?hbtgDE0/prMNn7bt6QK36/N0T5vMALVQ5vUU1eymg8RhJIBJz77GgBwJkMHe?=
 =?us-ascii?Q?n1/qOzviApUNWMwFE64Syxrif37kSWGC5mxpnK003i/qTHypEi1z4IrdSVCM?=
 =?us-ascii?Q?st1/Wf+Fe5drHunh2PXSV0i3ujhzk5AlBsgrmr3UBpvrKWVfV4FADtel50Xj?=
 =?us-ascii?Q?gXKZURpsa1YRh1t4T2NDr+PPFNGRzL55XXmw9915z01W0T+H1BESXTL9G+PI?=
 =?us-ascii?Q?V4OLcFqWdpSVxyCzNcnjq4v9+Zqbyv+cuNf+VoZIlQSNX7WVo4XOOxF1U1P6?=
 =?us-ascii?Q?9PQMGjs0VgCmr2tPRKDbeu8A3ISobAhj2iEG1kndhs8zYRLpjvQeK1rYV8BL?=
 =?us-ascii?Q?MZJPMSs3sv8/BS6IZlSfxWU2xzBb2/yns8SvJoZg3LzT+qaEXO5i6bhWI+fF?=
 =?us-ascii?Q?qHsBL0oa4kK48wDrjeqxK6wF7oFEbjCjS5g4QB/YLOLv0dqlmRiD6JgabFcz?=
 =?us-ascii?Q?wkq3xjMHclxtr/rZqrRAglliyx8JUWVkPNKLyb9eqmAqbh0HQyKso6xDd0Vf?=
 =?us-ascii?Q?YJmiehYugwDb8l1cFwXtcsieQ96FfEROx36wYHlkDvft0g+/mSP5eBjUhRB/?=
 =?us-ascii?Q?Vp5qAWB87mlTUYPmjyAlD6sRBWBsDT7dEBDSEYrAae+z+LRRHnB0yUJciAxb?=
 =?us-ascii?Q?2eqyyK5R0W/8j/2a0ZXQzYhiTAELlnifEW0hTRk9Bnehpw+Y5xVGz8EoZ6IG?=
 =?us-ascii?Q?TB2We5lLwPdGWtwk/5uAoX5HPtZZotATsCoRQ1pjh/yTnQSP2fWtB2g9LA7J?=
 =?us-ascii?Q?Wm8HSV9CvnFfCL+igZb20qhhYDtY2LwwsHF0LsamsD4oV96BuHnL38Uk2QqN?=
 =?us-ascii?Q?tPnHPBFdvIC3seJ8b7yrxXRwlvskV6mpQE/nAxzvA3Vlej5Fz0+7M20M/iyt?=
 =?us-ascii?Q?JKebyKmynjOXNScPCHa7lAGHzSHecw3fVqSb7E4IJAcY5MkflNYfYbidWscJ?=
 =?us-ascii?Q?4y3ZDDH4oUPUsxHHka1ygQ1qC0XRlFArzoIWij7tPp/U4Qf8bU9XNzAJucL+?=
 =?us-ascii?Q?TSYG7mMGbPaExrQ4ePYTS2jLCNqZp5/TI043OwVQ13/ksiMC1FyIVrpSeWnP?=
 =?us-ascii?Q?TW0CANR9zniwM3HLFqpqio7AoVBbH8Wq1JHclo0wmr8bOQaZVuOazziw1H2P?=
 =?us-ascii?Q?KuTYJzhn1Uxbyza+3XH1OTluOobZ0+0ZZLaHAg50vvhzyYna4//H3qZce66D?=
 =?us-ascii?Q?zY3qHzcLvogHAwzQxb9p2IMz?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa52ae03-e358-4a2f-674e-08d98cdca845
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 17:29:19.3020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIMKON5/24x5h+3nsvIw90XMI9SNUNQPBPoheUx+Rj2IVmzjk7SDsr3JhVWOYsKLrnvc7rVHUiNuqqo+/KbLINR22jRt8iTHtNRzEgFdLIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P194MB0696
X-OriginatorOrg: iml.fraunhofer.de
X-cloud-security-sender: stefan.walter@iml.fraunhofer.de
X-cloud-security-recipient: buildroot@buildroot.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay13-hz1.antispameurope.com with B4D763023EC
X-cloud-security-connect: mail-mtaka28.fraunhofer.de[153.96.1.28], TLS=1,
 IP=153.96.1.28
X-cloud-security-Digest: e43ed4c1171bc0c764e68912cab5b974
X-cloud-security: scantime:1.484
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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

Hi,

> > Maybe try to 'bisect' the problem as you mentioned it worked before
> > 2021.02.1 (did you test 2021.02.0?), not much grub related patches in
> > between...
> 
> Buildroot 2021.02(.0) does boot, the following releases on the 2021.02.x
> branch don't. I just tested 2021.08 with the same configuration file, and it
> doesn't boot, either.
> 
> I haven't actually bisected, yet, but looking at the commit log, ...
> 
> >   e840f2d469 boot/grub2: Backport 2021/03/02 securify fixes
> 
> ...this looks like the most likely culprit, because it's the only commit to
> boot/grub2 I see that makes any changes to the GRUB sources between
> 2021.02 and 2021.02.1.

I can now confirm that this is the commit that introduced the problem. What baffles me is that you say you have a working configuration using GRUB and i386. Could you send it to me or try mine for comparison?

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
