Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE104C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 08:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CE34035C;
	Thu, 11 Aug 2022 08:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CE34035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xj6bW5HE8Noz; Thu, 11 Aug 2022 08:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A9B40188;
	Thu, 11 Aug 2022 08:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A9B40188
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA2E1BF85D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B75882E95
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B75882E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHv3HkO_3csZ for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 08:04:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BC182AF8
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8BC182AF8
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 08:04:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="213457420"
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 16:04:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm1+N0hb8NlzZ9FqE5xq9N9m89GCiaDHBtWy6PBCYXyHRJpWI8uHJKh2IULIcpKyMsRD/zyvvZXnf6WFSxjIq03EjHIhlBY/vSgbp6UBDJ2gosQAsn5USHKBpdAPLfFUgZKmePl6qvfzC/Yw6vuq48kvNWit0MUqiExno14ipt1UBZXsLlL+gRikm/jpl8d1Hb/L4elWaQ9cIddCFwPlOn4QPa/1xbJknB06lA4MAfZ72OEH3hXB1Xw3SNZ9qiHqrzHukmx9Egm17xrzHVTtf2X0O3u9GBnKmTk8PH4XJom2ckISUWOma3b7TiuO5TfRHLk6FxtyigiSGusVO6/NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo3cLvHVHIsnIfyKkLwSagJEK8kryjgHiqLZZ1EwG/A=;
 b=X8q9bCt3PaaWMltr4eouheqCAdC/rwcN8dMgPadNSH4gbSUIabU+xXFItq8GhVopdNoEhXNnqjZKsW9pxGeHn0wf61nvp3c7W+jeonMyEEQhOY7leMgnxXG/ALYw2DQkG7wfaL+4WzCdXKYRf0hBh2J77hSV3cIhw8yhgeUxtVS2LyY0Vp5iBf0ul+iBMgCX9IBXqFuY43mOJDarJ6MqUVjYh9rQ/cE6+nC9Hx7YefoW9vkCGpdVyPUSrRKg4XZfC1LJc1VIhLSaCw0Pu8pxdRFhpNohPSnltPBkJWAQTYp5btVVGvBlCROdGF+3sTieRVDeMpJhTeD2CgMtI7PD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BY5PR04MB6852.namprd04.prod.outlook.com (2603:10b6:a03:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 08:04:24 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::90ce:52e5:88f9:9a6d]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::90ce:52e5:88f9:9a6d%5]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 08:04:23 +0000
To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Thread-Topic: [Buildroot] [PATCH 0/2] fix elf2flt on m68k
Thread-Index: AQHYrKFimhLf7KgFCUmxbgsKe/kQLa2oy1iAgACNUwA=
Date: Thu, 11 Aug 2022 08:04:23 +0000
Message-ID: <YvS4BqvVGdBTNqje@x1-carbon>
References: <20220810100959.3160670-1-niklas.cassel@wdc.com>
 <YvRBefZJhyhGU5ie@waldemar-brodkorb.de>
In-Reply-To: <YvRBefZJhyhGU5ie@waldemar-brodkorb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40d21aa4-e859-4e70-b4e5-08da7b701a8b
x-ms-traffictypediagnostic: BY5PR04MB6852:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TbbSE4iwO5td42YwMI+rfHSdZJSRUlx3w2FyzhhZMrYMhYwWMer7mjdjU7x9Sy7L1cygfIzqDH5EUITR0FV50n1Ht6F3qVYbCT8JKFr493/DxNcXhZ40fQvquQe4ltxmxs3rk56Ti16rfIM96QrGJH2TYlEJ+R3YFR3+6P2sUWfjrV5tj4v8izlMDhmUyHQEVG4gcGBMLSQjmpFHHFRwJpFHZq5TeoB6qS3lnZ5Plfc3R7VfeLb81MVpvrJpIgH44IDta/tJtZ78cWRNT8sXoQpmQhfbgCkepypo17upf320CaBULzesK9TH8v3OmRl3RuufG3e+6EChMlEg8fA/9cRnLJzjwt1JrQVSHieUC+kVvJDNgT+zurCUoQ67wUt3bxQl/yeiY5bXBaRKYCT+lE/Nnzk/1/mhMpQAdo+mK0ksDDIjaCheddGa96/wQ8qZ/G2ovikfYxqNvm/I8TMAAPvjMTyd//2F6xH/RJFMR+7U9OsVlNL1fKT7AwH4Fn68kYMzz5yMMbQHnl+WlOn0f8KSbCURfkUPLuctULk6LvUEZ6ZwBGqYi2ZrYmb7o4Qn9fl1rK8L7LlY1aqm5bwzRiyY/7aWv+m5xfQZW1NbglPnqitlHZwSi5aiSVCfwIMBaSjJuFk2X5hYn6bJr0fHuEc0euyKDiOKdZlaw0foj0JCJ76dHd516IZ/90WKSGBKTv+v8IJnyr0aVWhjwUsStHBq9eAy/T70nzM20/Q8if4IacyF7qaPiA+j8lMJ0rd4ejp0wlJa49daFM1nZz165y+ha82wsvSpKcyo/uko5VfclHd2jAE7kKflLHh1Zn6XsbiZEKu37e9PT5U413Bz6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(54906003)(6916009)(66556008)(316002)(66476007)(66446008)(76116006)(91956017)(4326008)(64756008)(66946007)(33716001)(8676002)(5660300002)(8936002)(2906002)(38100700002)(82960400001)(122000001)(86362001)(38070700005)(6486002)(966005)(6506007)(478600001)(41300700001)(71200400001)(83380400001)(26005)(6512007)(9686003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PfUVuEq8fV3ljCAeeNVyEshFoWdJfre21ED8c56JOpCmvAc2Hxt7sVwgON+l?=
 =?us-ascii?Q?reAN7QJLBH+HKJ9AZ0cvoLORpTNy07VY7ZIRvDJ2sk/3MU2h9UHz1rPLK9KJ?=
 =?us-ascii?Q?FbeFwdylSp1gksOEaC0spUJYv+S0Jvkxab97GBL7nbudRA154OpsQfc02BBh?=
 =?us-ascii?Q?U9CrDAN9RarW4h42fdF+p4hiJ6U28Xbl9XmqYZt7NQOZ/w7EvnLaNztLYjJO?=
 =?us-ascii?Q?ldsX2MKY6u3eVenr2Tk3ilgm36KZAsCaCNGprlydRhiznaAXes0Ga80XLPLC?=
 =?us-ascii?Q?HgUd6rq8zFxNx7Ia3LubKj4W6IWUfPonnFk5rlDqrlhRQj3XIENRmbwQ2M3T?=
 =?us-ascii?Q?76bBAOTGyh1EXAghTo8eVf8l3YayZu10r1DXSW8XKSOQzYSFhqtGCMk1U25S?=
 =?us-ascii?Q?Fit3NI+C8dhFJzcmsMPqNcuKZUp2WYpuk4ADRkkwXKwGrDItYKTtjBi7pQsI?=
 =?us-ascii?Q?IDqxuy9tUy2AwuwV/rE7zEQEwvE0BTnZbMtURpTxJBczkQks7Sgi017v+Q5w?=
 =?us-ascii?Q?hrqKPcB6BusEgqDR7itAbGe4W9cKYDeaQvUXWu1U2C+2XjIuJi2aaKywMi3G?=
 =?us-ascii?Q?w8rsDvXoOjzhFLFAF24XNB/itZIhcxwqtnD9Izfb2APETVLhumlbOADAC9w6?=
 =?us-ascii?Q?EX9gJnifrSid2bxOiMisxRXeMjdpkLBC/jnCyVHiUPM2nDJZyj3hQAkXAUFe?=
 =?us-ascii?Q?3K03EBkPV5+q2hCHdn7CteZ/P7LQMfSxpru5T6wBCz7k7g53+W/CIy+w8mTZ?=
 =?us-ascii?Q?HLc/rmyTbrXzBRkoA3Z1OpXB1joIl6WBWFnzXuWiPt8AZVkyd5mvYflGt9wW?=
 =?us-ascii?Q?6p7E1cDUeDTj4EKfoCubfW5j+rZW0Vwzj8nRXrSEoqLJ8msCDXwR2Ndcl6El?=
 =?us-ascii?Q?DgzxGnxI3IlAzshmATIwyQHUnyCP3lXFfLvNyDAu/3D+8572dS1wzhtLnv9y?=
 =?us-ascii?Q?ukqLqWPtKcTCfEHbNZKDAnOgBDQ6/xUnrNH08KYkrbg5gq87GurY6hVeMuiA?=
 =?us-ascii?Q?KrG5sKhfeUd8GL8CFJCo4mNfLzG+IcewtS6wB0jN+7/g5wSv4eOnqDf3ykrv?=
 =?us-ascii?Q?gKj3gv+zvgTihdcN84OmbHZOV/kqKhrl7/WXLpb3XE1dV61MjWgadyeh3EFJ?=
 =?us-ascii?Q?TTs6WHGKNqtduBjL0tdSLQtOknLqnnnyPnKyqzgEubjDM6jxX+lUEoAma5PQ?=
 =?us-ascii?Q?LVmZp8KrQXKoaeEh4n3xMvOvh7NyUM0p20uKK0TXexCG1v1A13p75b0BfyMr?=
 =?us-ascii?Q?MYxT2+RKxBa1rPuppG0kPasYadRz3Lc3ccOg2/9k+/MObVypbSqEKTGzz/a1?=
 =?us-ascii?Q?k90MdW1EvthoLnK/hc6SAOgb+kXOml+HLorhcX6WyDekW7PhuHRkMgtMohhQ?=
 =?us-ascii?Q?C7ndCfSiSnxDzyCdDzX1wG844Q5XENoTscT7ALnRpcHpnxYRSmRmKaDUkPK6?=
 =?us-ascii?Q?Vkz+iXaEaCSHYWSbwrAkWwv7wFL/vsSy98uNu82Z2EMTUVBYgtvnQcLLZFaG?=
 =?us-ascii?Q?ut7kM6cDRsJVS3e4e2dBt99uml/gyvLI4rzcC60wqZ0lnl5OY5y+6bkMeXMt?=
 =?us-ascii?Q?sdtzRtrXcixA5w3VsEWbgKBLGnDOXg5OphccdLGORMSa82tItT6gthRE3pPd?=
 =?us-ascii?Q?UQ=3D=3D?=
Content-ID: <0FDD5BFB82DE5C43BC333146F7BEDCDC@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2jD22pv3X3FGMOldETz6NYk0104tbPgFQSj5WnqBxlqV3atKOBeWIY76PxAeW6JLqN+TdzShwefWYLAQHMntxVUq/WHlIcQvNZtB/NTAMpeRNZz4TmJnDaGeLyQurrZDQvjUFEUrLfUSxNRIFDxcKoKwZhmAFhrSGSpU3SrfS5dUOdh7G8sScGFwn0HY25qdMcXvSw3jMmWKDZJEuaPbsZheZ0eyiBjVJmxlBf2XQVOVSWW5F1+BeE10IzbkzRP7QG36vpxMs3xZxQBwwj5nF3wYgkW/u7xw17ccNivNQlO4F48UjY25NftqUiV2uQtq2kHsCOHzfz7GUGaSbEJRTY97GcIkLvuhynK76ke4oFsv+M4SUiR0NWip8BBe0Mh4qUqpm09Y6yN+kqrTTRIEm+zBokeVFpVQ8Qqi5qT1XINsrvyl3RRnBxP6fkHg2HDm7jdocBVG3SPYFSqQfH3NtAJcGqs8U0KZgrJl4OH8/Bi/cyOFddg2njrCzU7GBR2xKpBEaQihjIJjlYnERZnkKVmmr/boSgyalUEpIwzoM69zqQrqeWYxuhlCICJK2RJaCM5sn26vEiRnS3Zzl7GIDuuzheQbSwT2yVfpUHVoSOFqyHulHGctbaKR1UbD6z+L9x/BZh8VxuoEBTEstiVDHFwgz9jryYgJXZK08TOv+JtRi+IXgbpbc9pRYyXzut5nOm0wLKcnYzSZM84xead7lvEijE4B9GNjHd7/0GTzkwdzuQ93mnBfuHdcisclyKJag5u4bpLNsS7a1GE/yDT48xly7v4XtYBk8AJVbN+6I6rurQWsY/J7snlss/+oB9/m0W5u4lEdtFYeEJuyrRO2ne3zQzzcgEa7qgIATKnFzvjbtg61UuLUX/u4+FyEgq1i
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d21aa4-e859-4e70-b4e5-08da7b701a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 08:04:23.7638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYsSkzEKS1n/iNiKLqtj5ThCzzsEEHJYbmkGdmztGC+XVq8TV83OQ+I4DjLrpGLriz9fWmAbZ2aD5u+nUhD9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660205066; x=1691741066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=wj0TbzWXKmbdUal/zLNbT83gKwrOywi+M6CX2Rds2XU=;
 b=ed7WWWn1EP+HIobGviRuC4vVsh4Qfnyvw19+CTso8+OB266mbULZwhKo
 sWHWs6siRVhGXAdsrBiYaHhUaP3BY2+YUhH5PRVI68nrQLl8XQGKMEZY2
 sC7QbotrHN6+HV8+e/gfjuoxfcMb5hbRh74XLiEaKNwYkL5cE34Dsbn25
 SFjl8q2XHKNoHFg0mMvJz1MaCjpmFT4JXuQIrsVkduc8HJVHxFvDSi7Z6
 /h7qQjdksxvkqtVMwNHFT0maVQpj4IcWQyvHj3JRO2jDf5xGcCmz4I3zK
 we7L2WZRWvSbrAYtN4cphP5MjCJeBNKP+ymnQV9MdxqcW9KZxyf4sv/Oa
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo3cLvHVHIsnIfyKkLwSagJEK8kryjgHiqLZZ1EwG/A=;
 b=lHy/4rBIyCrnAqz+vh0Ku4LRT6tIkohwqjpnP3R0ZUnIzMjoh1IjRnWyHo2Em0CkhP12YOKukwz3n/e802nXcxC3wSZy0n/XbGziC8d2YG3s17d1TFUatzJmoB/LqCV7gmle0FhuuPa2smtk8Hqos/vmEOybGCpfFL+kpdEex4E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=ed7WWWn1; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=lHy/4rBI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 0/2] fix elf2flt on m68k
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Aug 11, 2022 at 01:38:33AM +0200, Waldemar Brodkorb wrote:
> Hi Niklas,
> 
> it still fails for qemu_xtensa_lx60_nommu_defconfig with:
> /home/wbx/buildroot/output/host/xtensa-buildroot-uclinux-uclibc/bin/elf2flt:
> ERROR: text=0x69904 overlaps data=0x569a0 ?

This is because of the same bad upstream elf2flt commit
ba379d08bb78 ("elf2flt: fix for segfault on some ARM ELFs"),
which fixed segfaults on ARM, but seems to have introduced
segfaults on some previously working archs.

The solution is to also include xtensa in my patch:

+  if ((s->flags & (SEC_DATA | SEC_READONLY | SEC_RELOC)) ==
+      (SEC_DATA | SEC_READONLY | SEC_RELOC)) {
+#if defined(TARGET_m68k) || defined(TARGET_riscv64) || defined(TARGET_xtensa)
+    if (!strcmp(".eh_frame", s->name))
+      return false;
+#endif
+    return true;
+  }
+  return false;

Let me send a v2 with this shortly.

However, if we keep adding additional, then we might
eventually be able to change it into a:

+#if defined (TARGET_arm)
+#else
+#endif


Kind regards,
Niklas

> 
> best regards
>  Waldemar
> 
> Niklas Cassel via buildroot wrote,
> 
> > Hello buildroot folks,
> > 
> > This series fixes a segfault at link time on m68k.
> > 
> > With this series, we have bootable m68k and riscv64.
> > 
> > (riscv64 was booting with the previous patch, but we
> > were simply lucky that we didn't observe the same
> > segfault there as well.)
> > 
> > 
> > Kind regards,
> > Niklas
> > 
> > Niklas Cassel (2):
> >   package/elf2flt: remove broken patch
> >   package/elf2flt: add another .eh_frame section handling patch
> > 
> >  ...3-elf2flt-add-riscv-64-bits-support.patch} |  0
> >  ...f2flt-fix-.eh_frame-section-handling.patch | 73 ------------------
> >  ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
> >  ...l-error-regression-on-m68k-and-riscv.patch | 72 ++++++++++++++++++
> >  4 files changed, 148 insertions(+), 73 deletions(-)
> >  rename package/elf2flt/{0004-elf2flt-add-riscv-64-bits-support.patch => 0003-elf2flt-add-riscv-64-bits-support.patch} (100%)
> >  delete mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
> >  create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
> >  create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch
> > 
> > -- 
> > 2.37.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> > 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
