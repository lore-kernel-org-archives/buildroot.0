Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C12C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 12:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0DF405E0;
	Fri,  3 Jun 2022 12:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmpd1AOXQyKP; Fri,  3 Jun 2022 12:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D4AA4049C;
	Fri,  3 Jun 2022 12:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 964DC1BF309
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 12:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9315E60C17
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 12:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBaR4m_u7d07 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 12:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5676260C06
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 12:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXXfxRHumVTrLoEFDNdTtxzive7gyYf0v+2tVvho4aJFPTFlCilxm1jMGxGw4Wo/+LSV1v9jXxWkLd4EjKyZfHlvAJObFtlENhoDEkfd5RExVTgDD5JOcicajffkdA/uTBmt04ByV6xGk2/lgR/1kvvoGYQ+aT0RDIXlqjzozWrw27D31/yqGvnRzYu1lUjMF8Y0IeYFRloRB6HTT/I3F/kc/zj5aEIz97+ttUDnhUVH+/KRvHLdhIp0ZMnl161Uay1q1olr7sZ2M7H3y2Ay9tMGGPLJ0gm1IHJyPp2Axm9gF7GCMYdhD+TOAD1n1gq/6xBB6rQ5PRyCSp+2381ySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxw0pR6qb+N3d7c+oki/U0aPdkpM7Tw7UZgPf2FFIpM=;
 b=KQCv2U/9SI+7rXaBZ7e5wLUtsf5VBH6KkFzy4fJcZc9FEuTEOcQ/VX8tYUPpI5R2tO+pbT2YfirZN8pNydBzxJvNwzRlMsfwlGuyE9GtW0TOEq8fUytz1aicz438xvG1Klxo3KZrbdAXmnDKGVL/GU+QJNVwr36jhiyFN+DRYKAWpiLVhtG4zrqoTd/drQiFRkb4SxxKLUw1WId6M7DaPJAEFBSiWFbg42o/Ax2OyngHbwLPSbhzcAEqX2qGIJzQ2VoN0z1jD9YX/vsOD8CEMvzgYkmr/Ote4Er162jdeTUEkEc+5HWZlx32XUWLuZdSzWMiSeHCHiYQXB0wgflT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxw0pR6qb+N3d7c+oki/U0aPdkpM7Tw7UZgPf2FFIpM=;
 b=ohEBFElMrSvKVyeigb8Y2N0qYOpuR0zCCt12xPkG3do44AGHPbihOHHlQ+ouYYs5oRw4CERo8GyzvEIykU6HLCsur2iPlfab5qiaX3WhY9vHV4SKlM7ncsMN7PKFcPuzXEkEkCWEe7T4nrLDNb62xW7VpVez9DF5Pd4z9Og+yKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by AS8P251MB0280.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:34c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 12:53:56 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 12:53:56 +0000
Message-ID: <38fbfa9e8176af0a0c54a3dac72c452164d7f134.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jun 2022 14:53:55 +0200
In-Reply-To: <870b4ca3163d724805fb1ad470d52b8fa5080424.camel@orolia.com>
References: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
 <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
 <20220603114724.5cf56736@windsurf>
 <023b9abd171f8d56639f7625bbd7e573a2a2a1f0.camel@orolia.com>
 <870b4ca3163d724805fb1ad470d52b8fa5080424.camel@orolia.com>
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31bdaf6f-2020-4b4c-c3de-08da45601f10
X-MS-TrafficTypeDiagnostic: AS8P251MB0280:EE_
X-Microsoft-Antispam-PRVS: <AS8P251MB0280E03C2DA540EB4905DF4B84A19@AS8P251MB0280.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNJVy2Zq+WP1djb7ii3uS+Gt634ZdVzq7TLuSeer6A4aU33e1nd+jIgitnA+EofdvfLDGNAKpyx4CoMpUtTnIuM5cTQvsDbKAiA74fnLbiikiX/8qvigxdwYN7wWfOF7U2kRW9hfCcum1Qs6KQ/n8h60XOF4FbyyZ+6W/MGKUcCPsfaVS0wzTOuUcT7NeDeqYbi+r6ohgBoMKjS7lWHDKhmIDiQZOmkhtyYMOz9w4VNHyNSQpQ7RVUGBfBayFbclhRop5tzkoPPe3eG54Rsha+B/mmURjsJ0UaWBIhZq9HxtFjd3HD28WOKlWRooOzUhIA6MAsXEjjRcqLKZCxE5C4N2IeSp5l5zqPBPcbxTDz8C3WXvR+D27hrmhvF6VY5w/O0Xxoi97amx9A1Lbil7s0FM9dslb0ttsvE75up4c2fd1f6b/ykqEveVBEGarLHKH5wYYsy8IrwbhhbGhYtBV9i8/3aZwmpvpnuXmZ3JyDq2sDPSKizbUi9wcneSiL05riXQSFSlis1+kwqaqs95h8E3VvDBrNZpZVWmqVo26MiMelCd3jfj6kIOIMf7hxeFmNc7JprTFIj3azBmjEHZhVu+BWH/bqoADx7JcYnrWCy2/b9qoVuW1B4INQoBQ6CkrRIiJutdm3UiZUWM265mSy5dX0Kow2pScnQlPM5JittuYJcHB0xCDADRhEOaP7qYJwiOGFXL1MqAJidNQM2GNiFDJlUPdKsrruv4ihV6fOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(6486002)(966005)(316002)(86362001)(8676002)(54906003)(4326008)(6916009)(66556008)(66946007)(66476007)(83380400001)(6512007)(44832011)(36756003)(6506007)(2906002)(5660300002)(2616005)(107886003)(186003)(8936002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVGaXBYZDJxejdzOEVvakRyS2lidnAyWEtaRHhUV3JJaGF2ZmxiSWNTazlx?=
 =?utf-8?B?YmxDdmttOXA2dlI1cnh5dzZVUTJHZ3lJWmcwTG9WOGNnU2VoRU9WeXJXMm1X?=
 =?utf-8?B?S3pzM1pZaHdibStEY05uNUJ5cURVRjd3amcwOG1qSllkcXE5SW8vL3VZSU90?=
 =?utf-8?B?aERjY1dWaUFWK0NaRUZXTHpsTGxaRWNZclVoVVYxR0Q4dE8yM0RucnZXc2k0?=
 =?utf-8?B?ajc4Vm16aUZVdjJoMlM1cFN2UVlFeDFVTHdnUWtRczlOMHc1UGw3VmFab2Yv?=
 =?utf-8?B?SHY2TnJQUDRjc1Z1clVuakp4RFQ2OWRFTVZJY01zQXR3NEpIYi9sQWQ3KzNC?=
 =?utf-8?B?ZXBDakMxd0lpdFAyeUZGWlVxV0tYQzhpckdnVU5HNDFWYWVpdTMxcFBLZjhD?=
 =?utf-8?B?cXUvU1cxWVQyUDMrSytuUXQyL0F6T0hJZnJtSjFEbUY3RnpxMFcrMy9PYnhZ?=
 =?utf-8?B?bUF0TVQ2Ly96ZG5YY2JIQzBsS21EcmM4Ri9TL1dmaGdtcGErUWFpQVFhejBO?=
 =?utf-8?B?OU1TZWw1YkpQUUxXL2FrOHdCRzJJaUpvTXBKVllFK3Rxd3o3SXFoVUVZVlFF?=
 =?utf-8?B?ZlB4eHMweUdKY1lNTjRuakRWbUZCU0V4bE1WTW9HMTh3ZS9PcEs5dGlXZE45?=
 =?utf-8?B?V292eWI3cmNGV0ZnbXZ5cW5vdk9BK3gvbWhHNHd1eURMcGtuT1AwMWlVL052?=
 =?utf-8?B?SVhLL3owWHpsVWFKVExIZy9nZkdmRTBrN1pyeU5DS0lHeXFtZkhoOU0rQVh4?=
 =?utf-8?B?YkswR1M1VDd0WjFtTWl3Z3pvaGlxbyt5NFU4VGhKS080Qk4xc29RWG1IaEx3?=
 =?utf-8?B?NVdUbXJ3Ri9VVWcvTnlVaURobDE5WDk4WkZXTUg4bWQybWNIaUdodHN0bEtr?=
 =?utf-8?B?MUIzUTJJZDZ2Q2Q2WWxTZzM0WWNsY3VPYXdOZXFZM3FUdldPY2xubXpYMmRF?=
 =?utf-8?B?Q3Fwb2V2dlJoSk1VajN3NWlyVjhZV005SHU1dnVHYVVuK3RpWUt2bjlTZVht?=
 =?utf-8?B?Zko4NGRlNDA4WmNDUWd3TGFUMXFIUSswTzJnMUEvSUFlZjlHSkZ4dmNOUlVT?=
 =?utf-8?B?Y2xWS3VYZkdnQ2RpMlp5NlJuMFZtblovb1Z6SDg3TEwrUlBCTWhUWThzbEZL?=
 =?utf-8?B?dTRPRDVhU0tHcnlpaEx6UmVCQ1AzNzgxdk9ZNGVKaWYySEJQckdSeG5iMVhn?=
 =?utf-8?B?ZU5UODVQY0F6UlNHSW5xS1pwZHZLSHNFeStmWHZkZmdYcE5kQUVlUUp5dDQw?=
 =?utf-8?B?b1d5d2pLellzREg1eU41bmFLdTBjelhBY0pUS2FLQnJlbnZ2K2w0VHBEa3RU?=
 =?utf-8?B?SmREREFxc3hqZ0lKd20xWVZtNDhZS2lXYjl4NlZEcFBobWlWQUttR2N1dGJM?=
 =?utf-8?B?Wk1Benl0M2wrVTZqV2JNSDlraUoxTnNXNWhta2FMSlZTci9jYnJPMmRxVHl3?=
 =?utf-8?B?VjdHbFNOL0hLTG13RXNkNzg1NmhuY1FlZDViK0t5d25GNzY5SVJOakxoczhX?=
 =?utf-8?B?N3J1YTNPWllRL05wZ3pIa0t0dmJQa2VlbGdpcEZIUTlnS2NlZVQyQll1T3pE?=
 =?utf-8?B?NG1OUE5MU0x4M2NNVVZnRnAvN0FCUUdBb0dLOWJuWkVsK21qUjU4ZlJpdUht?=
 =?utf-8?B?L2NUQzhkc3JuNGxVMHZSNTI3bkEvYWZUTSsvM1BWN2QxMDhrRUYzR3g0d1c3?=
 =?utf-8?B?aFJHeVRFWkhIZlYwdVNrelg2dGRkQ054dTFEdTJhT0FhRHljdHZ3SnR2aTFr?=
 =?utf-8?B?MjJrTDhPc05wYjZvM3orY2IvdGRrQ2J5K0F6OWJjcjF4ZDlIVjk3T3pCNWY0?=
 =?utf-8?B?T3B6ZU1MOHR2Sllvdjd2QTRrbkdIUzEzVk1pdjN0Z29PMktMV2dQYkdOOWNT?=
 =?utf-8?B?SW9DaDNYZkloc2FSVXZ5bXdsbDI5cTBWQlR2WGtrSjBtSFhNZlhabituQmZl?=
 =?utf-8?B?b1MwNnlVc2Fod09aMTJTSjg4UHNhcW84b0xNMjhZMCsvTjN0dHVQNEJQVDJZ?=
 =?utf-8?B?V2pkZllwbG5RT0J5cENpQmJRN2hPUGdPMXpnT2VZVzB3Z0lJeWNEMVk5T052?=
 =?utf-8?B?SnJUZ1dMR2F2aFoxTitFU05lVUVhb3A2QUl1ODlCREpYbUJiZHVoZG92bW43?=
 =?utf-8?B?a0ZJRzJ6M1ZmRG00dWpOdE8wbkJiVkUvWXlkMjBKQ0pwOTZKa0x2aFlRaUFt?=
 =?utf-8?B?eVMwUStQQ1pTUzVOT2ZLdmF6ZFBLV1p4c2tjRWErM0tMcm4wRzZrQzRib2dB?=
 =?utf-8?B?dFF3ZkNyZEtsckJXVng0c3E3RlNXSXEvYUlGVDcrS0owVXMrZkplNFNXbjF6?=
 =?utf-8?B?WENnYU5ScVFpWGY5NnBMM2ExSzdJUTVPYnIwdExmTHRpWko2SThoak5hdmRX?=
 =?utf-8?Q?bhVrSKnws+xIDaYI8bx1awfMaSdoebb4RD7LH+IaV/wLS?=
X-MS-Exchange-AntiSpam-MessageData-1: zmjzj8TTNnbMmX4i/SxjePRHsUYPd4oq2RQ=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bdaf6f-2020-4b4c-c3de-08da45601f10
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 12:53:56.7496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA/3jPt6HsO8Wr9DFpgGWf1vEU4N/odH5UtUErUZeHdp8mq5gdcAmZPahFa83/W5cztN993BT0DbbePmAG/uY+4w/BxW5Rb1Qw5KzbK5m/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0280
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2hvb3QsIGFwcGFyZW50bHksIEkgZmFpbGVkIHdoZW4gdGVzdGluZyB5ZXN0ZXJkYXkuClRoZSB1
bG9nIGJ1aWxkIGlzc3VlIGlzIHByZXNlbnQgb24gbWFzdGVyIHRvbywgY29udHJhcnkgdG8gd2hh
dCBJIHNhaWQgZWFybGllci4KClNvIG5vdywgd2UgaGF2ZSBubyBjbHVlIGF0IGFsbCA6LwoKT24g
RnJpLCAyMDIyLTA2LTAzIGF0IDEyOjUxICswMjAwLCBOaWNvbGFzIENhcnJpZXIgd3JvdGU6Cj4g
QW5kIEkgcmVkaWQgdGhlIHRlc3Qgd2l0aCB0aGUgd29ya2luZyBjb25maWcgKHRoYXQgaXMsIHdp
dGhvdXQgdGhlIFNZU1RFTUQgbGluZSkgYW5kIHRoaXMgdGltZQo+IHRoZXJlCj4gYXJlIG9ubHk6
Cj4gCj4gb3V0cHV0L2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYXJtLWxpbnV4LWdudWVhYmloZi9s
aWJjL3Vzci9saWIvbGlicHRocmVhZC5zbzogQVNDSUkgdGV4dAo+IG91dHB1dC9ob3N0L2FybS1i
dWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2xpYi9saWJwdGhyZWFkLnNvOsKg
wqDCoMKgwqAgQVNDSUkgdGV4dAo+IAo+IEJ1dCB0aGVpciBjb250ZW50IGlzIHRoZSBzYW1lOgo+
IAo+IC8qIEdOVSBsZCBzY3JpcHQKPiDCoMKgIFVzZSB0aGUgc2hhcmVkIGxpYnJhcnksIGJ1dCBz
b21lIGZ1bmN0aW9ucyBhcmUgb25seSBpbgo+IMKgwqAgdGhlIHN0YXRpYyBsaWJyYXJ5LCBzbyB0
cnkgdGhhdCBzZWNvbmRhcmlseS7CoCAqLwo+IE9VVFBVVF9GT1JNQVQoZWxmMzItbGl0dGxlYXJt
KQo+IEdST1VQICggL2xpYi9saWJwdGhyZWFkLnNvLjAgL3Vzci9saWIvbGlicHRocmVhZF9ub25z
aGFyZWQuYSApCj4gCj4gCj4gT24gRnJpLCAyMDIyLTA2LTAzIGF0IDEyOjQ0ICswMjAwLCBOaWNv
bGFzIENhcnJpZXIgd3JvdGU6Cj4gPiBHcmVhdCwgYXQgbGVhc3QsIEknbSBub3QgYWxvbmUgOikK
PiA+IAo+ID4gT25lIG90aGVyIHRoaW5nIHRvIG5vdGljZSBpcyB0aGF0IHRoZXJlIGxpYnB0aHJl
YWQuc28gYXNjaWkgZmlsZXMgaW4gdGhlIG91dHB1dCBkaXJlY3RvcnksIHRoZQo+ID4gY29udGVu
dCBvZiB3aGljaCBkb2Vzbid0IHNlZW0gY29ycmVjdDoKPiA+IAo+ID4gb3V0cHV0L2J1aWxkL3Vs
b2ctMDM4OWQyNDMzNTIyNTVmNjE4MjMyNmRjY2RhZTNkNTZkYWRjMDc4Zi9hbGNoZW15LQo+ID4g
b3V0L3N0YWdpbmcvbGliL2xpYnB0aHJlYWQuc286Cj4gPiBBU0NJSSB0ZXh0Cj4gPiBvdXRwdXQv
aG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9hcm0tbGludXgtZ251ZWFiaWhmL2xpYmMvdXNyL2xpYi9s
aWJwdGhyZWFkLnNvOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiBB
U0NJSSB0ZXh0Cj4gPiBvdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9z
eXNyb290L3Vzci9saWIvbGlicHRocmVhZC5zbzrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IEFTQ0lJIHRleHQKPiA+IAo+ID4gVGhleSBhbGwgY29u
dGFpbjoKPiA+IAo+ID4gLyogR05VIGxkIHNjcmlwdAo+ID4gwqDCoCBVc2UgdGhlIHNoYXJlZCBs
aWJyYXJ5LCBidXQgc29tZSBmdW5jdGlvbnMgYXJlIG9ubHkgaW4KPiA+IMKgwqAgdGhlIHN0YXRp
YyBsaWJyYXJ5LCBzbyB0cnkgdGhhdCBzZWNvbmRhcmlseS7CoCAqLwo+ID4gT1VUUFVUX0ZPUk1B
VChlbGYzMi1saXR0bGVhcm0pCj4gPiBHUk9VUCAoIC9saWIvbGlicHRocmVhZC5zby4wIC91c3Iv
bGliL2xpYnB0aHJlYWRfbm9uc2hhcmVkLmEgKQo+ID4gCj4gPiAKPiA+IE9uIEZyaSwgMjAyMi0w
Ni0wMyBhdCAxMTo0NyArMDIwMCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiA+ID4gQ0FVVElP
TjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9u
Lgo+ID4gPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzCj4gPiA+IHNhZmUu
Cj4gPiA+IAo+ID4gPiBPbiBGcmksIDAzIEp1biAyMDIyIDExOjA5OjQ4ICswMjAwCj4gPiA+IE5p
Y29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+IHdyb3RlOgo+ID4gPiAK
PiA+ID4gPiBIZWxsbywKPiA+ID4gPiBJIHRlc3RlZCB0aGlzIG1vcm5pbmcgYWdhaW5zdCB0aGUg
bWFzdGVyIG9mIGJ1aWxkcm9vdCAod2l0aCBhbiB1YnVudHUgMjAuMDQpIGFuZCB0aGUgaXNzdWUK
PiA+ID4gPiBkb2Vzbid0Cj4gPiA+ID4gYXBwZWFyIGFueW1vcmUuCj4gPiA+ID4gU28gdGhlcmUg
bXVzdCBiZSBzb21lIGNoYW5nZSAicmVjZW50bHkiIG1lcmdlZCwgd2hpY2ggc29sdmVzIHRoZSBp
c3N1ZS4KPiA+ID4gPiAKPiA+ID4gPiBBbiBpZGVhIGFueW9uZT8KPiA+ID4gCj4gPiA+IE5vdCB5
ZXQgYW4gaWRlYSwgYnV0IEkgY29uZmlybSB0aGF0IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIG9u
Cj4gPiA+IDIwMjIuMDIuMiAoanVzdCBzbyB5b3Uga25vdyB0aGF0IHlvdXIgZS1tYWlsIGFuZCBp
c3N1ZSBoYXZlIGJlZW4gc2VlbiEpCj4gPiA+IAo+ID4gPiBUaG9tYXMKPiA+ID4gLS0KPiA+ID4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+ID4gPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+ID4gPiBodHRwczov
L2Jvb3RsaW4uY29tCj4gPiAKPiA+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
