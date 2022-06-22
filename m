Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EDCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 04:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6215640650;
	Wed, 22 Jun 2022 04:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6215640650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovpmIhXa5QOq; Wed, 22 Jun 2022 04:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 650B4403FB;
	Wed, 22 Jun 2022 04:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 650B4403FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 113961BF41B
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 04:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA5BF41C7C
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 04:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5BF41C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4pBpYLCxI_O for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 04:14:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485A741C33
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 485A741C33
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 04:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuLTlxNDh2+9JXjazgjwbD8tqvi4ZE3tJpQd78twb6KdUfQ6GSSAl/Gce4xsuMo3xnDr2N7ykWiFkU6FYH5fooWIeTqPKsxjxUn6biHcZxOEblbhP6SrxVS5gav+G5Hf0ltTk8+46M7tNgZxM2+RU6yzwVAh6PcQrAwTRbIP0GBcyzlJUfST5rUe+jgwjX4KXAKG5jIsO5bkDbc32MCaU9bXlxkr86fgHIMFkKxs3UW5fb4GH504drZ4P56zPgOgN13qTnZ+pYOhq5okM5aneM+QZ2YNoc9CPID/qXQ6Woq5m3mDlm9mf236qbfV3Gldu806TcgTtYeLoRtp5mH7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtMvu8g5RsnYNkX6RFxbZuDKsnKelAbHMxzACX3FlHY=;
 b=XrnOF6bTQY89Wz+EW5FViQ1us3YYVE2xYCSQmv9BIo0YpwvTLsHVpDltEEt3DfhwxxemagtAro3hK8Sm+Cf9R0XdjIjpW6fja1VWpJcywCwDztJTE9kOSSzBAhZkg6zrJaLS81osc55Yi3kNmetdVEOiM6QNvCyyEYH6X6+hLpIh4cazkR1EkTzj9ckydKgMsO0c493pHFmLPTIb38EsE8+7cspuoywzqFE+2WVv0JQImc8Ilep9j7JSMt9DTa7k4jm+3ceJjAP9Z6qeXe3YllM44HJHXX2QV+kqnQ3hrsKZzDfisz3Hp+Lvu9NLtOxxW2kPvkAKGqwpyFJ+E/a3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB2969.namprd12.prod.outlook.com (2603:10b6:5:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 04:14:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 04:14:30 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Simek, Michal"
 <michal.simek@amd.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig: fix to
 u-boot.itb generation
Thread-Index: AQHYhJYgvaao7zZfoUagcxB3uE+/+q1Z8eGAgADgxhA=
Date: Wed, 22 Jun 2022 04:14:30 +0000
Message-ID: <CH2PR12MB50047D6CE9868FB849CF7B4EF0B29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220620110843.35930-1-neal.frager@xilinx.com>
 <20220621164519.3d81885b@booty>
In-Reply-To: <20220621164519.3d81885b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb40613a-64ee-48c3-6272-08da5405b482
x-ms-traffictypediagnostic: DM6PR12MB2969:EE_
x-microsoft-antispam-prvs: <DM6PR12MB2969BE3AFFB9B613F23365E0F0B29@DM6PR12MB2969.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXfzkXUKJUEgu/SEbIUOU+1aDX0upd2jQAqMQJjxvz71QD8RPBjJUTf+jWUjl6JTWyTpNEHNuRZjPX2UxVCnKOxBLrgjWq3/VQ5oT6nEwa5dCIW1zxFElR+UqD0ycUzOEuyOz59z3BpPQx8EgeyRMxg1BLTLUtEnZsqx/E3m1qMkzsSpCwGN7U2MnytHGoqaiPxHys68t8Xa8t6gkir56R/k1WHgmYT/hxk48DmYkTPkeRPsHamVrNnbtz17AY9JEDGq9KPbpZhPApUDxRnu/KTSuH3KhoKw12D/3N4aNxCh0y1wyR7jumC7IcX9g8NL33/DRSIgTxU8+7I2/e0pudB06474+NRHO99Z2SEJnvcfpg8/79hnddGgGJFoMdqeJXWoRgAKgXOcDfAwrJYxY/ITPkgcXnuLynhYVutDN0t/UdAYvzID3iJrhl8sy3UYn/AYi4XuNYGJ8EMGyw70aP2k+mWuMtRgYQTo4N+TQczVh2MhFsrTaka/9nzjCylds6512O8PyLIeXq5NIS3+Yctk8rSLPwLjVz2tP6pntsGCFZ3Adizeyhj4F/fS4uSwci7db+OU7OMf5SiEPfQzYwQDF0cHZiKfYd4P+RQ3EgrKoreZY7J4Zd1ML3YiLVz143jZCXqfHOvKloWxFmS3HY50uOAym13g/KDAGLPllyd8xQ3sOFv4401U1pTzIkVuRe6Lh4ij5Fuewz8XOhkEvU0CXh4vHH3NgBp783x2AXc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(66476007)(478600001)(316002)(66446008)(8676002)(71200400001)(186003)(86362001)(76116006)(6636002)(66556008)(54906003)(66946007)(41300700001)(64756008)(52536014)(8936002)(33656002)(9686003)(6506007)(4326008)(55016003)(122000001)(38100700002)(7696005)(26005)(38070700005)(4744005)(5660300002)(2906002)(110136005)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8aeILeiaIO3vcZp4HM3M8wiT2YkHGUfMvw5sGTRwdUi119LVNt5UsiIv+dSM?=
 =?us-ascii?Q?veiJOCsa3fB9NjMOtHlbtoREOvMBoqsyuDy9KMG//E6BJZaH/IP050JTYz9I?=
 =?us-ascii?Q?ELQ1CCAb4nUSARu3o1Sgu9MZ7HyyH6aZg63mK7UvUWttSivPI2XXyAoJaqrq?=
 =?us-ascii?Q?Y8DfknPFXzlLNf/L892XlAqcwJ3kv7GnlwjcoOMhEAdNtE7Ssz4KjhgsiHpb?=
 =?us-ascii?Q?xGvk6u30TdebWb+M52E/TXFvP35AOevnGyzUJ1sBD99jNQmRXASFoHd40Sm3?=
 =?us-ascii?Q?95AWH3z3AnU9cL2J7q08RJkUN5Q1jFzTOFde3kEGLd1AyaeNUa0PmZrzgTik?=
 =?us-ascii?Q?NwaOe0HJbnuQNSp6W9gphPsKjmRQMH9pEbW2b8XvYIple6k5wQETMRv4q/Qy?=
 =?us-ascii?Q?DRo0O02qKcF3qgfnAxZqZHohokj3i9+hpWGRHsDQgEq1FLarsZsosc1djS9P?=
 =?us-ascii?Q?0JrLwi6hmqRSdsay5ho8ToH4x/LfK7pb9xK69ZQpsUP37fSNUZpRWsAIyKn2?=
 =?us-ascii?Q?tq9IYB5mPob4SDQgGffZK1P75WecNzUIUrVRzhZiOLqdg5LhPMvI1NcJgmM9?=
 =?us-ascii?Q?PbidhQSMweTuPlmgSdU+Au/LfQEZuH1T+OFaIPVe+Lb50UWCmjwwqzp7+mft?=
 =?us-ascii?Q?5cOeCEObTu+iNMvU6vCprHXs99bIkU3owW6kHFRgHJxS4kzpvbdXFSxIqosQ?=
 =?us-ascii?Q?qtWlBVvH9wvlI39t6iZ/JV9ClWKlLZrhGRFLRbg24otBcgHeRuGESxWhwN9A?=
 =?us-ascii?Q?JfZ6jueSmWJl5nUMnqu4dxWROpTszn3axn3f0vnltyKsDq6sfX5su5ns9XEP?=
 =?us-ascii?Q?UVdm2yuf6pPdyRJeVpSkLYvNxuNw5SY/e8DnkWVawkB7rrLmLb4JAbGJIsEF?=
 =?us-ascii?Q?ahSvtDm8wW12DbmpnP6/J5cLcQAjv2usoht9e12pskTdpIxn2h5PyCc+sB6Z?=
 =?us-ascii?Q?6/h0PnCtQWVpxnGYLaOZK2KTzKOvJr3/BbcN9q+pFtr68lTD0TQpRWdeix0O?=
 =?us-ascii?Q?w/bNIuvBnJGNxDqos2pb+psM8zzeQYGPKqCO7iR18aKPE+NZQd/emoBOJ5u5?=
 =?us-ascii?Q?pHqtrZi5gzINhpkF9cGxG2LRHLKLxNdpXjqxM1jDmNqGVRAhaU/NgIslbo5O?=
 =?us-ascii?Q?Zyhkn+pRIpzpCCSZa3ix+tj3uz93jzzvQgG4jBLUy+TXskNxmPiKmz64i7N9?=
 =?us-ascii?Q?0DYZI/ORlsHBYwwX2UTi6zxzfHCxHPO58bbB13CqegaILod99YaP47lC3zvm?=
 =?us-ascii?Q?3Ca+G63i/hUJUJ9NtKlEFrTEx35CEsiWdzY2JJjXWwWBr0sn/18/0p7CgiSW?=
 =?us-ascii?Q?iwOO3BCGjtPTKQtC+ZHsYbS/Du08RD5Uc5+UsPZI5Zxkn4kfOuEOPPjaKUvJ?=
 =?us-ascii?Q?Ojg1n64MSXi9D02XotlpIJqQ0qYBzbcC9OmKgyTCjDHdL6OrlmEMu8fjYG+8?=
 =?us-ascii?Q?PgWskiDbpzFlYTvZN5ejpe3g6f+/6GA22MHhnwfbJEvIS0fiOZcuFmjmUbEU?=
 =?us-ascii?Q?gOwKCMoEHmOTV6Re5vNSfU3UogpuHbmp3I2a2Fu2juC1n0MGQAutb087pXjU?=
 =?us-ascii?Q?e6t3FmxvV5pJzbDUYVpolj4zmicvU593mmwyaqMiKOAuTPW1H4XaUFeD9cR+?=
 =?us-ascii?Q?GQMfz2jfV7QXp3Fb3a7M5UChChHRbBiZJd96c9q8RvDy1+XOUtjErttkbVaC?=
 =?us-ascii?Q?XivoqJ9J5/aSCmKn4SFMGuBtwrtUeykRT9sZsiqtR5CWP5Ky?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb40613a-64ee-48c3-6272-08da5405b482
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 04:14:30.5735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDiihvDDxoYRC9dIx6ptt/Z7TYmKQIEqcXew1nSEDJ2W9i48+XRJ/32WzsvcrpB0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtMvu8g5RsnYNkX6RFxbZuDKsnKelAbHMxzACX3FlHY=;
 b=rwHStZT3FtlL5svLDYKPWk7vpaer/IwAAXV230EPDunPNbsf5rkgo9IdqX4Gqli65prS0FH2tM1lUY6Pr/niOKB1s03Zxx/J70NtFiFyqj9dLyg55AadvH/uOIL9Mk47lMP05vkYGGhfbh4eLZCRUgvBUkV4Qioxkj+ExMOgD74=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rwHStZT3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix to u-boot.itb generation
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> This patch is a temporary fix for the kv260 u-boot.itb generation 
> until a proper fix has been implemented within u-boot.
>
> This patch will be removed from buildroot once u-boot can build a 
> correct u-boot.itb for the kria kv260 starter kit.
>
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

> Can you provide a brief explanation of what the problem is and a link to any page documenting what effort (if any) is ongoing to fix it at its root?

> Other than that, looks good.

Could you comment on any effort to add the various kria starter kit carrier board overlays to be included natively in the u-boot.itb build, 
so no post-build steps are required?

@Luca, I will add more comments documenting the problem in v2 of the patch.  Thank you for the review.

Best regards,
Neal Frager
AMD


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
