Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1480DC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 945AD40190;
	Mon, 27 Mar 2023 13:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 945AD40190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4SWD-ydeWZv; Mon, 27 Mar 2023 13:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8AC401AF;
	Mon, 27 Mar 2023 13:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8AC401AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65E151BF34A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 357F040190
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357F040190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeFCU19RdNAS for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 13:03:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 395F4401AF
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 395F4401AF
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 13:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byvI47gRpRg8DH+3ncLVKm86agxBpbmZ6lkhupqqy+kY47SEfJ3pzps25CD4E061V6IfOernhWcUeJmt7nKFGjUmv78C1petngVz3Ncv8LmomXU+A3lzEExapWIr77f9XfyrEh9K/LBo7aHwTTJFvkp7D2dcBcEAD+R6dBXDZQgCG9s4KwQEOpmsVWUHROGi3zpzP/2HBvLDC8CkI1Lb6SL9pDjZCMIRuDpGeN4BQTmJiPWPpb0xA1CMUtVodFefyrmErQair5GLJ0drLIuzQPQCaMVqyYHrdjWDe1yctK+w+MLUrwYymrfgoYy1z4dAV3GhUqYFqRbYZnU3hvxbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DOnYRzlSYPA1GBbkLOaaDtG4S/1bqV4wzemoCzoNqA=;
 b=Wldqbph4bjMCl1nc3rO3ke3mI8ebvWmK3GU9UPO0/uzDBADNd9k0DTg0hBUzn7eaX1agNUz1GET8GimV0ddtoPAv+gJPAeQKcWaEPG/HEG5xpWRQaRLhJAPgpxnIs5AuatX8ClguW7vwfZhCrI5c7A2MfcMcq/tfUv7/HtS+W3gP7G2rWTPweWm8LRzaZ7i2LVb36/NR7MzbZzdnZPdtIcESQTjSgKbSxxDlCuoavsU6nhFbuiN22yC7ZupGNTLd43q9O6KNkua70j1UU9YIwugsmuRXqh/MoLIbgJou4L6AAZ39LmUAdNQMh5MyYJ2Ym8SK1jab7Z/K97OT+Yz2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CY8PR12MB7123.namprd12.prod.outlook.com (2603:10b6:930:60::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 13:03:22 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 13:03:21 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgAEO8lCAAAOhAIAAA/SAgAAENQCAAAFTwA==
Date: Mon, 27 Mar 2023 13:03:21 +0000
Message-ID: <CH2PR12MB5004E92B8F7B317F00643322F08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230326140949.11262-1-neal.frager@amd.com>
 <20230326220543.057f381d@windsurf>
 <CH2PR12MB50044744141F901308BAAF8AF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60041E824606160DF5277406A08B9@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4F2E8E3C96893712B8DF08B9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230327145740.3888d7d5@windsurf>
In-Reply-To: <20230327145740.3888d7d5@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CY8PR12MB7123:EE_
x-ms-office365-filtering-correlation-id: 5a220af7-b03d-4de9-ae14-08db2ec3a4a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZN3bdFJD5rTShemkAAaVmrkGy3aJlmXJBRhVF9RBzaoqEKL8X6kSRPQc/nuVwXQM62hsKI3i03WIi/XRS/EBQd5zLbNkl9/9YxAqEGPh89pBHtymbdus32Vgk2YSZ7vZD2WMMMECED6JA+r8hkH6wfnI2NAu+v9FUdIc7MjyUg3ejMbsWt3cj18RRG6mep43QjyaBSh3SSV+y/e9zq1vYabu/blKuPJRSxJ25GQgXJcA0xVM6rDJgrBT1R/toJ1621fK7QkVDjjMHI0zoVXJZPIAaPS80ixwc8gEtHNUSxzVT7v/CqOijlNlCAHE25yAdWISKGVtltWr/8+t1LGJWLf6UkCo7DEEYlwWNjybibsqBS3IshVkYgHVEB0zcdb9xOp5unPQmVw/lMbkKlUmPOyCayLwV4EuAzI3vfANdm4x5Dihr+Yf2rCbHYr5yET2Yckq42Rmdtok2ZmvS4dwK5VviRNjU1UD7K+Wkp5innS0BPsGUhPEjn4XKAP0icy5yuTZRIGyeUW8U+1DCGfNQVR3ULzqY/xFj3GEmgIFhRHzG5jOqmmB+LYDVdDAXgjtT1aRWCUVTco8m/jwfXCJoH/fUUiLWO0SY+kCJnlvsu5f1BA12CI9WbqWfcK5f/WU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199021)(55016003)(83380400001)(38070700005)(66446008)(64756008)(316002)(66556008)(66476007)(66946007)(76116006)(6916009)(8676002)(71200400001)(7696005)(54906003)(33656002)(478600001)(122000001)(52536014)(8936002)(5660300002)(86362001)(2906002)(4744005)(41300700001)(4326008)(38100700002)(9686003)(186003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tphxJAb4IevI/DeDY/t2re6eB74u2j1zYI/ESwTd+GmyjDym6/xpzjDwKV65?=
 =?us-ascii?Q?L3y9YTyG/pyr78bU69yIHdrkdwqktp5LYVAqdB+BOZiE9hR9CaFIFmWO3aU5?=
 =?us-ascii?Q?Pn38LNSzwPHj55oHBfvp5Yg4ITwMYtH6UEs7sw8WsPs3SUe6wb/KWDRRZUy2?=
 =?us-ascii?Q?u1PakZOX+V5mOylTMn92Bn7w5VJkcqQxg77ITx5XNbR38KTwdWviNSuljv7D?=
 =?us-ascii?Q?7AT9Zkv0FwSIyML0LZ+LrP/hDJ1+acUxZLA2cUkF5jI7p+1u/OA1ghxEubHm?=
 =?us-ascii?Q?Lk//uFqoE3BvJuiHcNQJI877CkSfU7iyT3OD3U7gnHG+1TXKcbIRTxK/u89X?=
 =?us-ascii?Q?YrMPdy+lPpTzNKkGa6xKW5rQvAnzwo5e++vfZGqdfBLQ+lGCndQNUF8r7+3S?=
 =?us-ascii?Q?zBIUCYhdwU/IH2CKTD+3ETDo+MO/MijzvL+yPTMb4smUTxZgeCcDD4XGT4E6?=
 =?us-ascii?Q?0QUB7PrR/MjCtxkhS3T0S2P7PjMk3MqO8MrFr+rEq+gL/souOOXMag0EKD4w?=
 =?us-ascii?Q?2pDPvAyyrknn5OQo2UEqChIb901IamYCwHUNJY+lbMaiZfBZrQyhQIwL9k2o?=
 =?us-ascii?Q?JQWVAE/1Rl1uTKHOMgfLCHO1dFeBmIKNphEcG4l77yQaKA4yLm+KSZn+/Pq6?=
 =?us-ascii?Q?UWkzgsHj/T2BB6UVv590F8sBV8aYFRDm2/mm7l634Myxb3sPKPxqGx0p7wJr?=
 =?us-ascii?Q?ZKTEqSmp81AkjvPvWOX4odThnK7C/Va8SrJ3BRsyPEaJKQgtP36/aTOKjiLo?=
 =?us-ascii?Q?VOdDLs4bZGLxySsqEbl9ccBiui/tog+d6jBKsxlw8lgAHf5oz7ysMuqo1fDf?=
 =?us-ascii?Q?xc/Lqf8urcghImplmXp70HQgrYpGF2oImjDM5l9JxYw4upFMuEiJZVnr8jKv?=
 =?us-ascii?Q?9F/StpYUSs2OQwlrd5JsNnwRYKmnDqnu4uK0qGnlYz2VKOUzTmyFfohBrKyZ?=
 =?us-ascii?Q?LkKfTMPLOEqlNTTqYLq4HU1C7Pag/ecAhhlOFGYtBmH4CDJ3jX5uwc1IsxLl?=
 =?us-ascii?Q?qAO/ZULZFIjYA/2dNNcKWdHG3HJyfzAk4WJm8v3IFUCsbVWg8Pi9P3n9lZDd?=
 =?us-ascii?Q?MB4XoYy6jc/UHBsBjiY/V05craX2s6bDPCbEI7iKEJUriRQ8dI8JRGB09C34?=
 =?us-ascii?Q?c2Tqp+Z/Kh60rhc/KbH30Za9FG+KUDWv9apf3vQV0kHKHb2D0CD2Dsyf7z+V?=
 =?us-ascii?Q?UOcP9u8UQlbHRtyyphia4wmJoZrnXhPdyO8FbfVR9cbDQXL2fqUbhldwDPzd?=
 =?us-ascii?Q?vhy5HPncFKQ3AM0apS8xhE60Ewqk04X1p4nBjK4aMZH3ng3FQycBsubHAWN1?=
 =?us-ascii?Q?omPTV6/5HK3b+vMfi1UO/YluWHc7gMbmaAtnzJR+fSuXibL5uj5bADUzL4Gk?=
 =?us-ascii?Q?XWG6PAt41dZfl05xryVYAlgGLtFKOu8C2Is/V/azZdk7dH8L764TggqnqmwD?=
 =?us-ascii?Q?T+8HtY2E0mAbd0j/qfqbhDbn8Zvr97L1FQ25uUD7+6hFTJJOkPsGNCiQVpkL?=
 =?us-ascii?Q?5GmzR9efxkYVxItMPGNK3pJ7ZhTmmZW/rsnO4AryM97ecpj7OoWlVtT+sxX2?=
 =?us-ascii?Q?dM8zopuiGM8V34PLA3V63eGnsDM8jhYKRLrrpSDrRkJHDfAkZH++D9HWO+nW?=
 =?us-ascii?Q?09Iy3eVfq9zz4wjlEbxp+jE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a220af7-b03d-4de9-ae14-08db2ec3a4a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 13:03:21.8438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M7AtQEtXQhVJMhGHzl37RB6vyiB07ZUb6fuwvJ/uNf97gVqCBx/lpUNn4dynkHEq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DOnYRzlSYPA1GBbkLOaaDtG4S/1bqV4wzemoCzoNqA=;
 b=dI/jRYFOtDAUahufQAP1HpFVMP22+PfbW2Rw34l1W2chCTY/DJynBhdgB9KUx860+WQ4Bw6FSgYgSamBNGtA+SwbE0jGTWq6hdh5JTUg1wf2DJd64qP9QNcF0rKQVl4ouLuBCBJGiL2KnvwRvlj0NvKFP2R7qvHYSemEZAeAXtY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dI/jRYFO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> It fails just with replacing "make" with "$(MAKE)".  Do you have an idea already about what would need to be fixed?

> Use $(MAKE1) instead of $(MAKE) then. It smells like Xilinx Makefiles do not handle well parallel build.

Thank you!  I confirm that $(MAKE1) fixes the problem.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
