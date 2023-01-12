Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C24C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 15:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21C9E40004;
	Thu, 12 Jan 2023 15:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C9E40004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEjU1I9SXp0c; Thu, 12 Jan 2023 15:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0E91400F6;
	Thu, 12 Jan 2023 15:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E91400F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D442F1BF228
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7742581B04
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 15:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7742581B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc7TCD-DwtWd for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 15:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12C781990
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E12C781990
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 15:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wpe0pjimcKR4dyMv85rkkQuOL38q81Y8CcN/VRyFUYxksN+0s1bmJ89zat+rBHk7rjG37f1Mh4q83e2OcwRI8GzS8wSkY7RwuwXgOJJjZKap+BJ/9QnVXWdFC0E50JsElJSzwRHy4/Ufo8aG8iEqNuCiLOiZrl1BUjeOl3rzYzCtzDYPqp9grxZJ5Fjnrdh0ZVUL1/vI9djCHIg3WEpZC8W4KTJ6dZtOmGJvhveCmU6xEL//0y5cHwGQ7IrH+b+gQOmPGmO3rwg2uGU2CPzW0PjjcQetD+enmTgdTW2NioIc2rrx40fCPySfM1PRYFE6zCr1R9qkfOItPRxsdCGpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp2m3T7AfLZ3wtkusRA5MNC23BQd9dgGIlebZ13W7Oc=;
 b=XyqQkq2ZMUOFxkJ/Fp8By1dZzcjy+Pdx56Nt/1oXciw2+2DAOtQ6mx59d1kpC/+KR9RI9P/IW0hJMkM7x9u/l2NDwrwpS2a4bRFx108tUYOwI7SBfd8+lpu2eKI3+49JUht4bBV+RNdITPWqs1qK24PYBmhbkiicFG+sslnUjaZPxxONgwQbKh2PiFseIpPQ5aqJLzNeo2keAqxhE1XjMk5KYQO4LtwhVRFQ9ggyJgUYCOXRdOlT367fxwi+ykLjxIClk/8iYBWYes0zlxY/TqobIVWv0hc09RAAFOHsjLoXCouJF9LsdXqPgjWJf3uY7hns+55VvLGRnFjR7Ru+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DB9P251MB0738.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:37d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 15:46:14 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236%8]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:46:14 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Saving
Thread-Index: AQHZJp0AKDqn2CXwLUCcusXpbKBVSQ==
Date: Thu, 12 Jan 2023 15:46:14 +0000
Message-ID: <e8d2f77866056eea5e9e928ce07952d7cf5ac124.camel@orolia.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DB9P251MB0738:EE_
x-ms-office365-filtering-correlation-id: 6373b759-7d2f-46b7-2dec-08daf4b422f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOUP8PLhlftSWm/WIMrFe7X421khmqYFZMn/5ntpocY8EQ+wOctnhh23NaUy+efoDgQyIkr5dQBEisW1ZJ+7AKkBvOtM8HG8N2PqFBEgfvWagPM746xiAw0bys77eXqUskC+XMPqFCjBmY5+eanyUx2yy/a9yOBjRh1QuE76g7Za2yvk8hbZnxbRPol+wGId66aUtvn6uUocftMN35jcbqH0ZEx8xEKZK6jaNWe5jZCRugEJbxX4vXDADEC9RmT/ctKKqHIhSRrbwQUnvYbYpTIma2ajzEckteHIgeV7FYRuDopAGAvwO5+rQKPMAiwxo/arf0VnrBGFDIDuZgrI+D4OZgvwb7/0vlzkUmSFkDGp+shMGJXEBPadk/3KTLHeyRLcUbdVPrKlTyriVfPlqDr7vf+oTDhLU6CU8KMXrB7JS0ceTnEy6hufNrFe7FP+TzZrtaFb8HNvwEWQLOT9NkS54DSLCrh2r/YHUd67bOXJB8atOpqmYz7eZW0WoulEdWZEUE+qZQyHAdXsqmaDTvCQnhLCkacb4+ahd6y83PLrBZcrsoZya/g9hDrTBu7Y/W9gbnYciVeAOvjSUhps8e2IjsZbv1/udOvtGF0h2Q+4lzXM9YjF3nsO9Nv7g+J+UsZ/BXjR8hliAzEyKuDN0hS07KgSvW8BZ1BtG2xdunK7k2Starmnb9p5mBrfVPjJRLGb0It1JUmH2J5kngGZ5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(346002)(376002)(366004)(136003)(451199015)(7116003)(41300700001)(36756003)(8936002)(5660300002)(4744005)(6512007)(186003)(6486002)(478600001)(6506007)(2616005)(3480700007)(316002)(64756008)(38070700005)(66446008)(86362001)(6916009)(8676002)(66556008)(66946007)(76116006)(66476007)(91956017)(71200400001)(122000001)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0xmbXJiaHdDTzNDbmRXVm5tWlFMTExad0pkMUtwYUs5cVNzaWFUdzlZZWRZ?=
 =?utf-8?B?NTVSVytMMmlhVWlIcnZXMy9rU0srZkxGY3dnNkdsZVlnZnBGbTA0ZG9nRjFy?=
 =?utf-8?B?R0wvelpUelJ4bzdYTVZSemFrTzJ4eEgrbGFYUWxicTk1Snl5SjhuMGtUeW8y?=
 =?utf-8?B?U05jajZ2V2xWaEZ3ais1cG1TdG9EcmlXbzErUTl1aTFrMkdiOGdSZmJPa1pH?=
 =?utf-8?B?MEM5QURQR0tWT2dOaHVyNlpxK1p4R0QvelRFWm9zT3ZHUGpadjZxWmZyckNa?=
 =?utf-8?B?Z2p4VUdCQi9CNzlXRmFpcDBKSlRXTlhiU1hwUy9kOUh2dDFkaTJBTk1hcE13?=
 =?utf-8?B?eHJ1Q25XelpyNS9PZSttZVJsM0JZRGszTytiekZQUUw2OC90SEwzdWVhWHZZ?=
 =?utf-8?B?MnJGZ2dTa2hvUXZJK2s1NUZNeVdJWjdXYzNLbmRwaWd3T0Z6STcwcFV1RjVs?=
 =?utf-8?B?RlkvSWozeVBDUC9ORC9FbzZ0RUxXTGNvTkJ4aTQ2cVpEMVVHK3lueU5RRVpO?=
 =?utf-8?B?eUVQRTFXZklMRmxQZFBJMll5SG1KWG1lT2IrSkhiOWl3ME15aXFzK0Qwbm81?=
 =?utf-8?B?bkJoTFpxRlRkRk52T1g3WmZoT1UyMWZsL0c1RkJkb1FPYVlSK0xOQjExVnNR?=
 =?utf-8?B?YXV6MDNnWmdsK25wZzF5dklkd1FVdnFGeC9JbmJHeHNyR0ZiNjhKZjE4THFH?=
 =?utf-8?B?Vlk5ZmhLcm52cXNhaGlSQzM0QURXZUFmdng4T2xqVlNaR2t1WjBaUlFaTGJH?=
 =?utf-8?B?RWJBVFlwL21rMWIvNDEwOHJhUElURVUvSlpHSlkyQm85VGRkNGFnMlA2Wldu?=
 =?utf-8?B?ZHZEdnRhdDJqWjJxakR2clRSQjIwV0lKTDhHOXhMOW51TTR5RVo1bjNONjNH?=
 =?utf-8?B?a2RJOHpZdUErZ2FsaWxDd21hRUVwbHowQjFyN2d5NjhQU3o4RWVuVTd1U0NJ?=
 =?utf-8?B?YjVvUU9aQzA4d2IrdVduc2dpMGpyM25jQ1RRMEFCVnNSNTVmVnNPeDFzemV6?=
 =?utf-8?B?b2ZBei9ZTXdIcTFRelBUS3BqU1hTbFEzWDdEa3B6MSs4b0NkcnhoU3E5aVhn?=
 =?utf-8?B?WUI1U1hBZ1p6MVZtTy9kdTgxZG5OTXJLODZPZ3Axb0RCWEtlNml2a2YzUmpx?=
 =?utf-8?B?VnJ0b0ZYR0gzTVlaMzR4c2J4WjBNR2R0USsvRUxDSUxQbHJDdDM1T3Uybzdp?=
 =?utf-8?B?SVJnbk16YklZTm5zcjhEOStaeDQ5VnZ4QW1nUjZ5Z0UyYXJ0VVErdzVKSXQw?=
 =?utf-8?B?bjhTdGgxTzFNQzE3V1hOUTl3VGh0eEtvcXBaSDdPb2c4V1BYRjBqMi9LZlFa?=
 =?utf-8?B?NUd4RjEzK1ZKdG1DWkdTZjlqWmZCaWhCa2hUQk1iTlpwQjhwRnEyUjNLc3lw?=
 =?utf-8?B?bmI4aHFqSGdQdXVDazQ5WisxU1hpNnRHbEJCV08xTzVNeE5TZkhtdVRoYkk2?=
 =?utf-8?B?c3k2Sk55M3NKL05oUzFwcGlWU0dDNVk5NjdwWlR6STAwa3d3RGg1dDVmUFJ4?=
 =?utf-8?B?MHNjMTdEY0xPcHZKS2dPZ0ZqcUhLa3FOQVNiN1lLaU1lUWJjaHBIa3FKcHpw?=
 =?utf-8?B?UG5OQzBIUGFOQ1pUYVBjV0gzVFAxNWc5TytJZElVcTdSRy9LU090NW01UkNu?=
 =?utf-8?B?bUVHczgxZTk4dWFtb3NtOWJuSnNkMGdXTHIwWURtS1BaNWhNR0hyYlFDSzZT?=
 =?utf-8?B?YkpHVnBhYytpQkpsOVJJMlBIS2I1R1IyM2Fhcjk1YU1WazgxWWlUbXlaWDJ5?=
 =?utf-8?B?Z0FnWXpIcU14WmREN1lVdG9La0VubWpRZGwyTUhaRU0rYStlYUo5OC9sRFly?=
 =?utf-8?B?Y2p1OVc0ci9xTWhrUUNGWjJ2RmVyMnFHM1oyRzdvMld3M2I5Y3dCZWR0ZjdZ?=
 =?utf-8?B?YVZKaDhNQXVsc3hUSFRRM21WWFJuODNwSFgxOUw1MnRjbHV6Zm51eGJZN0VI?=
 =?utf-8?B?aXQvS3hoMG5wdnhGc3JHRlptaDM2enUrWTVBZkZNZnh5NHRldjhtRXBlRUlw?=
 =?utf-8?B?VEorUjBiK2lKMGZ4a2xjTVBob2dMUmRacnhZSEhyK1FhRmhKNDI3SGtTN2xD?=
 =?utf-8?B?NEpMQ0pNdUc2Rk1rNk96VVRpbHZzZjlvNFl1RzluMmFJbFFncUJ2bmxPRGtk?=
 =?utf-8?B?aU85c2djS3dHTDJGZHBpMmJCUjFCSzlpZkp2UmxlRFZkVXdnMll1dFcvQVJn?=
 =?utf-8?B?bi8zL1pibFFJVEx0YlN5QmhOeEFVZjFqaklxbDdIU3d3eXl0UE9XK3pNY2xO?=
 =?utf-8?Q?1KuYUCm+gF/AI+a1Qo6ZvwUS4CEPjRIrys88MGr1SA=3D?=
Content-ID: <FEAFE5421CC3644E95EC5B30594D2158@EURP251.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6373b759-7d2f-46b7-2dec-08daf4b422f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 15:46:14.3908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTfxuDRvT3P0BQ64gY4/zJ6K6BsATIPjukwJ3XOZNXbWQ/l4oxQ53YN2Lihg2I41Ja3113903AHVWtF1CWpzpK1QBDL0hvIEIhao7nUWQzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0738
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp2m3T7AfLZ3wtkusRA5MNC23BQd9dgGIlebZ13W7Oc=;
 b=NZ6Mri1RUYKt0bPJTpkNkY9GRTSGnPI7/NIE7s/G1P66+EgANfBBxHAxqKdk+l+ymeEEZRRosGjagbkjWDb7aiUj1lproFU+WIceN/xxA5gBpF41l1qy9IvxokJ8S88kbZBgad9F1kl+7cfHGut1IAgnQjKevTqPb7q5b1eSq3k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=NZ6Mri1R
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: [Buildroot] Saving
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!
I'm having a look at legal-info generation, the source saving step saves neither local nor override
packages.

This is a problem, because it's those packages, when forked from OSS, which would require publishing
the modified sources.
Is there a technical / philosophical / whatever reason for no supporting them?


If none, I'd be willing to develop support for that, if anyone has pointers as how to proceed /
where to patch / mistakes to avoid, don't hesitate to share :)

FTR, I'm using a (lightweight) fork of 2022.02.

Thank you by advance!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
