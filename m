Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB0C7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C7674044C;
	Mon, 12 Jun 2023 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7674044C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A35NOA8WwSyy; Mon, 12 Jun 2023 20:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E87A6416C3;
	Mon, 12 Jun 2023 20:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E87A6416C3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87D2C1BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C38840328
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C38840328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mg-tWAXiijkc for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064EA40302
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 064EA40302
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=macK4OOvlu0Q5WFNLDnDRTZ/2mvRMux7bOmLGVpMcsCC8iiPtr4mK0ol0rQAEWxEQ1gMFuGTzAcCgntBXItFOu35AoGU0RIRjGVM+QK/VeU0W+aKk+gXIaggqjBmB1ka5SeGiNpiPI4LUp8IQp3T6smdOLT5y1gbqWqQWYlfGEXD9ttuCe65J//fAWlnYgTnzvfdGU4jOQMa6cg1E3YgS+3g+j7GwfxOL7QhUEvY4AEsid+/x4DH+8l3LfewhW6RqHQBad8H2q8F6ain/6/wOAN3C0ZpzpPY7XAz7qgLpMnGikHe6sUr/V8MIhH5kTqkVESu29oxeSLl3ZgQcuTw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwHj02h6/dR3cj332INRaVuYh1eeaqjerRS/AK7It40=;
 b=Atevy9Ed+bJFvwVBpXnwpmg8t/lhjnO6kCyM1sNFvcqZ5o6ag+uE+/+xdIk8vNwXECGmQmS7tPdsJOmruiWBqL9sCAMA66d4jJlRENc8Da7od3MiqoToMLF734SpLp5SYOelWJzuml7F+XMzSL1Jiu9gOI6/1MW32Zhwbeno7xLtmpHO9tiO325aipYJ87O8kjsvXLP0lX6kuOyXpq6XRJx5S53GVcnyKqsit8/ES7g0Xgi8RYjfD6tTYjTIQyEYcpzkiz/SIypcrfvTG0cCyHKJ6YJDukIPn+bPYg5L/6CAI72f6pPDHPKUSCTWeBTtSO7klyWU2QqiyrV3JXJgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 20:03:39 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 20:03:38 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH] package/bootgen: add patch to fix builds on machines
 with modern flex versions
Thread-Index: AQHZnWj6tB1l9YD2HkitKh2fsS3zPQ==
Date: Mon, 12 Jun 2023 20:03:38 +0000
Message-ID: <49ED38C7-3654-4EBB-84F2-3B19FB3DB4F0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB7035:EE_
x-ms-office365-filtering-correlation-id: 21d37173-372d-4b8b-df8d-08db6b801d00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VvnxXBSMMDtIRNZte3AJN1ENjAfRavdozgSsvJgN2aeU2UyLnsdb5CinrKA5W+TigU1+/gXDAI7WSYMibvKxghmj8+SSNDf9CuZvmLYgmr8b3oiMgSFxzvzxDS/XzCWUWjIuD8DuTlx8occtdcKT3dqPfh/Fg3OoHCxpQqdjeo9xpTiRw4++vsN9LElzvw0xZb5zUddor/wS8A0OI0iqyjD1EebBAUvnQCDUtvimzWZa6P5UHxkHmMpPUbY4gfmRAWGIEI2tjKTP+7phPx806hO+7EuM8YchMurI3f05YoXBYtIQn/Ied6eJ2d4noXxk6bPg915IbPD0GwpIdlATOZUEbYb0tWOErglBAHBPv/TpqHQHwkSN3q2p+nVe+7eXziYDW6E2jEPuZPN0mB7JeD6gR0YdfSpr/TT4Vyk1FxQwB0zkOxUUDef9fPLc5ZoZkFtH4Z9TLtykK/i0yt1yNzNPBImZ78hui5tpHOGCOC1vEHwnf2nn+6etiDstmAE5pzw/K0aQM2qERU+C1ILyK6/KTIcvqxkCZPTXBjlrV1XCN6Va/8Jg+jo3eo9iqWt64tNWKh41OJ6FBD086P1WxzADgete7ZXStZLpqOubEcw1nq6q1zeWUrLJUGHxuqI8bCYfrCwIpqE9R+bo8jc9yAYzmYzpMZUww0itZJNEz7M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(6916009)(91956017)(66556008)(66946007)(4326008)(76116006)(64756008)(966005)(66476007)(71200400001)(66446008)(36756003)(41300700001)(8676002)(8936002)(5660300002)(316002)(6486002)(478600001)(2906002)(33656002)(38070700005)(38100700002)(83380400001)(6506007)(2616005)(66574015)(122000001)(186003)(6512007)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFZJR0ZEQ09HZzIycTlWM1ZGa042ZHFYMld3azdiZEFSeW8vR0w5OFp0QllZ?=
 =?utf-8?B?RXFRdnhHaHJzRWdhamdvamNWYjFCK21yQzZ3R2R6Y3dMVGdNa05QdzZVS1ph?=
 =?utf-8?B?VHBja2p1ZlZGR0VMdk1uZFN2TXZ4T3hYOXNEUjZkOFhyYzlOcEtTeElSQzBz?=
 =?utf-8?B?UUdPaUdFY3hEYSs1Njd4T1hqTTJOcTJyb1F4UytWMkVRcFlPcGtOQzJGRktH?=
 =?utf-8?B?ME9QVE5Uamw2V1FtbCtnNDBDOGdxSGFwa2ZqenlRSDZSMmh4djM0NmlJNnl3?=
 =?utf-8?B?U2w2c29idytRM1NTY1phTWE3U0Z3UzlvcmduamxMRXFDSzBPcHRxdFE1WjN4?=
 =?utf-8?B?QUd3dy92RUVhZjVNYmk4dGxZNkw5aHgzUFFnL0daSklrTmpxVXRicWxmUjdh?=
 =?utf-8?B?aC9ONTUyYllSQ2ZXekpmblU2aW9EeWZ2VHJJV0ZFUjVJWDBlOG42OFhwM3A2?=
 =?utf-8?B?UitxMkRndWtleHVNZjNtQzNOVmFoUk84YUlsVUw4UXVVV2lwNnMwTlZUcnZj?=
 =?utf-8?B?K2QzSXQ4Mmc4K05CbHR2NVZXQ1d4TkQ0Zko3ZTluSVlzcU5mQzRFRStpUW1G?=
 =?utf-8?B?L3J0Sk54b1RpcVZjTVVmZGtOdjZGVUk5dTVxa294SDNZS29KSVBSalp5emho?=
 =?utf-8?B?ckpINCtBSjB6em9kU3hYdFhZekh1Yy9iS3RvQ2w0RnNXMWtubTJ6Z0VTM1RN?=
 =?utf-8?B?anR3ZWFFTnpDd2V3VXBtZ25mOXhBOVlyZXdBTlZ4MzdqSkVteDMwRTQ2dWJh?=
 =?utf-8?B?L25nVG12REpLaVBTekh3MHNXZks2SWFMcmJpR1RLd3FabjZaV0J6WG1jNFJF?=
 =?utf-8?B?QkFGd1Z5NnVvaGZCRzBlTUJXUXBPdGZDQWx2cmgvd0w2VVI3Y3ptSGFhWXFK?=
 =?utf-8?B?VXhYdzIzb3g0bGVyTzBtNDcyYVAxeEhCeHVvK1NsUXdicFMxY0x3amx3Q3FE?=
 =?utf-8?B?V2RiOVg4ektlbnhuM0tGOFR6RkpKODYxQ2dFT2lKRmdtQkVYT2pqNDdLRXor?=
 =?utf-8?B?VUhFQVBCcVJWbXAybGhnYW53ejUxRkdpNVRmVG1Ga1pOd1ZhekRCckFVU2FW?=
 =?utf-8?B?S2xLdDFZUFJVYVZRdHdhcSt4QTYwNnJmcHZvTnFqcnVjVzBvUnNFeHhIdVNw?=
 =?utf-8?B?SzRDcm9tU2hqcUpOUDZMRTJMc3N1dEdJUlhVWFllSXRFdGVSR2hhOW5YMXAv?=
 =?utf-8?B?dm9YNkVjSkkwL0dpcnhMTkJyRGpieDQ5Vk82TythQ1JocTV5UGtVOUVaYTBD?=
 =?utf-8?B?VEg3ZmhxWWdMRi9TMytZNmpiQ3FaVERaZTEvcG8wRmV2emtSRUEwMTJRN3FH?=
 =?utf-8?B?R09hbC9weTB3YTZUNW1kVmN0WkJTeEJwSXZEWnN3a2ZZQ0RDa1IvSnlQOVU5?=
 =?utf-8?B?ZHVmK0dKcGszWXFtVHBmb0FldzVtSEp0NTVwT2kxU1h3ejBKamNvMmRkUWhs?=
 =?utf-8?B?WG41RURpU2tYeVBoa0FZTmdxUWhjR2E3Z25RVWF0bk1LNnp6UjdSVU1wMnRR?=
 =?utf-8?B?VjZXWnN0KzR2QjhnV1R5cE5WOFU5Y0ZIaHNveEl1VkRrNlhJQTc3c2UvdEkv?=
 =?utf-8?B?bXR3S0NZU21VRm4xaGtud1JSeHFMOGNEeS9oQlUrbHhjckd0bmdBNUwyNWNJ?=
 =?utf-8?B?amtRenJaRzNrUm5vNzFEc3pOQXFsS1F5VVNESUtWL1h3VWsvZ0FabUdEaEhV?=
 =?utf-8?B?OVMzdlZpdE9saVFWa3U5bWM0V1lRMkI4L21Weml6aTdVS1RFaHQ2T0pQdW5h?=
 =?utf-8?B?djdQWG9TdU10cUhEN01UOVM3L0diOGpDZUpzNzRDSUhNelM1RFR2RWxTSDF4?=
 =?utf-8?B?eXlwcmZYTFk4WEZxSUZCQWJ5NTVZRDNqdkdyY2IyUzJtSDVIbzdlT0x4NEFv?=
 =?utf-8?B?SFJzeC9hZjRNWjNlenoveGZSQlIrNjBUV0g2Y0NNSlBpMVBQZ0VTTnNOWHp3?=
 =?utf-8?B?UGI0RzNiQ1QzMXc1MWJ3TDlqS25YcEJ0dllGVndUbHZTclJkMFdEeGtDdnpI?=
 =?utf-8?B?cjRCQkt1cjNpR2VOczdaRUlxU2hLQWlGUFZ0NU5KM29PVnRZV3RhcnVkZVZa?=
 =?utf-8?B?eHR5b3FvNWF1K2UzZnArWnIxT3gvQk4yN1Jac3RSRFUvMVg5ejBQbTBxNmoz?=
 =?utf-8?B?WmNqbXZka2dJcVJJZGp5Ry82SkdYbm9MSUxDMXNWVEh1SjV1R3BJUE40Z1pC?=
 =?utf-8?Q?83+7lAHUP2wzqoE4YlZIQPk=3D?=
Content-ID: <73721A5889CCE64CBF469EC011C5E89F@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d37173-372d-4b8b-df8d-08db6b801d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 20:03:38.9252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOGVzzyws50rtiMmKrmFt7fGMjKarXOHj5EAnvzvXseP6tR1Fclz7K2NTnuTiiNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwHj02h6/dR3cj332INRaVuYh1eeaqjerRS/AK7It40=;
 b=2o6Bq7bM06aozy/UGDpMuAPDUio+G8I0RGVk4enuZbv2eb+/qXg2EGyEzQ4eY5B+NiScl8JCuRWh435U2UuNKzvj7j96btXhCOlcWvhrLG0hyY5FJGZNf3lq2E3LCQJ0E6JYRLBtqk2VmqJvfJuZR3m3gfwDLcuY1Uud59DNVhU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2o6Bq7bM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] package/bootgen: add patch to fix builds on
 machines with modern flex versions
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQoNCg0KPiBMZSAxMiBqdWluIDIwMjMgw6AgMjE6MjYsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/Rml4ZXM6DQo+IGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzI5My8yOTM2ZDliMDU0MjY5YjcwNTVlNjZhYjVh
N2Y3YzFmN2Y0OTI2ZDQ4Lw0KPiANCj4gQm9vdGdlbiBlbWJlZHMgYW4gb2xkIHZlcnNpb24gb2Yg
ZmxleCwgYnV0IHVzZXMgdGhlIHN5c3RlbSBpbmNsdWRlIHN5bnRheA0KPiAoI2luY2x1ZGUgPD4p
IHRvIHJlZmVyZW5jZSBpdCwgY2F1c2luZyBjb25mbGljdHMgb24gc3lzdGVtcyB3aXRoIHRoZQ0K
PiBkZXZlbG9wbWVudCBoZWFkZXJzIGZvciBhIG1vZGVybiBmbGV4IHZlcnNpb24gaW5zdGFsbGVk
LCBsZWFkaW5nIHRvIGJ1aWxkDQo+IGlzc3VlcyBsaWtlOg0KPiANCj4gLi4vYmlzb25mbGV4L2Nt
ZG9wdGlvbnMueXkuY3BwOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ3ZpcnR1YWwgaW50IENPOjpGbGV4
U2Nhbm5lcjo6eXlsZXgoKSc6DQo+IC4uL2Jpc29uZmxleC9jbWRvcHRpb25zLnl5LmNwcDoxMzYy
OjE4OiBlcnJvcjogbm8gbWF0Y2ggZm9yICdvcGVyYXRvcj0nIChvcGVyYW5kIHR5cGVzIGFyZSAn
c3RkOjppc3RyZWFtJyB7YWthICdzdGQ6OmJhc2ljX2lzdHJlYW08Y2hhcj4nfSBhbmQgJ3N0ZDo6
aXN0cmVhbSonIHtha2EgJ3N0ZDo6YmFzaWNfaXN0cmVhbTxjaGFyPionfSkNCj4gDQo+IEZpeCBp
dCBieSB1c2luZyBub3JtYWwgbG9jYWwgaW5jbHVkZXMgKCNpbmNsdWRlICIiKSBpbnN0ZWFkLg0K
PiANCj4gTm90aWNlOiBUaGlzIHdhcyBhbHJlYWR5IGZpeGVkIG9uIG1hc3RlciwgYnV0IHRoZSBj
bWRvcHRpb25zLnl5LmNwcCBhbmQNCj4gcmVnaW5pdC55eS5jcHAgaHVua3Mgd2VyZSBhY2NpZGVu
dGx5IGRyb3BwZWQgd2hlbiB0aGUgY2hhbmdlcyB3ZXJlIHNxdWFzaGVkDQo+IGZvciB0aGUgMjAy
My4xIHJlbGVhc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+DQo+IC0tLQ0KPiAuLi5uLW1hY2hpbmVzLXdpdGgtbW9kZXJuLWZsZXgt
dmVyc2lvbnMucGF0Y2ggfCA2OSArKysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2Vk
LCA2OSBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Jvb3RnZW4v
MDAwMS1SZWZpeC1idWlsZHMtb24tbWFjaGluZXMtd2l0aC1tb2Rlcm4tZmxleC12ZXJzaW9ucy5w
YXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm9vdGdlbi8wMDAxLVJlZml4LWJ1aWxk
cy1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LXZlcnNpb25zLnBhdGNoIGIvcGFja2FnZS9i
b290Z2VuLzAwMDEtUmVmaXgtYnVpbGRzLW9uLW1hY2hpbmVzLXdpdGgtbW9kZXJuLWZsZXgtdmVy
c2lvbnMucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4u
YjEzZGQyYjAzYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3BhY2thZ2UvYm9vdGdlbi8wMDAx
LVJlZml4LWJ1aWxkcy1vbi1tYWNoaW5lcy13aXRoLW1vZGVybi1mbGV4LXZlcnNpb25zLnBhdGNo
DQo+IEBAIC0wLDAgKzEsNjkgQEANCj4gK0Zyb20gMjlhNGU0ODc1MjdkMTA5ZjUxN2ZjNDdhN2My
ODRiNzczMmIyN2ExMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4NCj4gK0RhdGU6IE1vbiwgMTIgSnVuIDIwMjMg
MjE6MDQ6MjUgKzAyMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gUmVmaXggYnVpbGRzIG9uIG1hY2hp
bmVzIHdpdGggbW9kZXJuIGZsZXggdmVyc2lvbnMNCj4gKw0KPiArQm9vdGdlbiBlbWJlZHMgYW4g
b2xkIHZlcnNpb24gb2YgZmxleCwgYnV0IHVzZXMgdGhlIHN5c3RlbSBpbmNsdWRlIHN5bnRheA0K
PiArKCNpbmNsdWRlIDw+KSB0byByZWZlcmVuY2UgaXQsIGNhdXNpbmcgY29uZmxpY3RzIG9uIHN5
c3RlbXMgd2l0aCB0aGUNCj4gK2RldmVsb3BtZW50IGhlYWRlcnMgZm9yIGEgbW9kZXJuIGZsZXgg
dmVyc2lvbiBpbnN0YWxsZWQsIGxlYWRpbmcgdG8gYnVpbGQNCj4gK2lzc3VlcyBsaWtlOg0KPiAr
DQo+ICsuLi9iaXNvbmZsZXgvY21kb3B0aW9ucy55eS5jcHA6IEluIG1lbWJlciBmdW5jdGlvbiAn
dmlydHVhbCBpbnQgQ086OkZsZXhTY2FubmVyOjp5eWxleCgpJzoNCj4gKy4uL2Jpc29uZmxleC9j
bWRvcHRpb25zLnl5LmNwcDoxMzYyOjE4OiBlcnJvcjogbm8gbWF0Y2ggZm9yICdvcGVyYXRvcj0n
IChvcGVyYW5kIHR5cGVzIGFyZSAnc3RkOjppc3RyZWFtJyB7YWthICdzdGQ6OmJhc2ljX2lzdHJl
YW08Y2hhcj4nfSBhbmQgJ3N0ZDo6aXN0cmVhbSonIHtha2EgJ3N0ZDo6YmFzaWNfaXN0cmVhbTxj
aGFyPionfSkNCj4gKw0KPiAraHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
MjkzLzI5MzZkOWIwNTQyNjliNzA1NWU2NmFiNWE3ZjdjMWY3ZjQ5MjZkNDgvYnVpbGQtZW5kLmxv
Zw0KPiArDQo+ICtGaXggaXQgYnkgdXNpbmcgbm9ybWFsIGxvY2FsICNpbmNsdWRlIHN0YXRlbWVu
dHMgYnk6DQo+ICsNCj4gK3NlZCAtaSAncy88RmxleExleGVyLmg+LyJGbGV4TGV4ZXIuaCIvZycg
Kg0KPiArDQo+ICtOb3RpY2U6IFRoaXMgd2FzIGFscmVhZHkgZml4ZWQgb24gbWFzdGVyIHdpdGg6
DQo+ICtodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vcHVsbC8yMA0KPiArDQo+ICtO
b3RpY2U6IFRoZSBwYXRjaCB3YXMgbm90IGFwcGxpZWQsIGluc3RlYWQgYSBkaWZmZXJlbnQgcGF0
Y2ggd2l0aCB0aGUgc2FtZQ0KPiArY29udGVudCB3YXMgYXBwbGllZCB0byBtYXN0ZXI6DQo+ICto
dHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2Jvb3RnZW4vY29tbWl0L2FmNGY3MDgzZWE5MjkzMWEw
N2U0Nzk5NWViMmJjMmEzNDhjNTc3ZWQNCj4gKw0KPiArVGhpcyBwYXRjaCB3YXMgbm90IGFwcGxp
ZWQgdG8gdGhlIHhsbnhfcmVsX3YyMDIzLjEgYnJhbmNoLCBpbnN0ZWFkIG1vc3QNCj4gK29mIHRo
ZSBjb250ZW50IHdhcyBpbmNsdWRlZCBpbjoNCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2ZmMDlmMGU5MzBkODJlZDA2YTgzYQ0K
PiArDQo+ICtCdXQgdGhlIGNtZG9wdGlvbnMueXkuY3BwIGFuZCByZWdpbml0Lnl5LmNwcCBodW5r
cyB3ZXJlIGFjY2lkZW50bHkgZHJvcHBlZDoNCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9jb21taXQvYmZiYTkxYjJjODQxNjBkYzIwM2ZmMDlmMGU5MzBkODJlZDA2YTgzYSNk
aWZmLWUwMjg3YWRiNDIwZGJlY2MxMTJhY2RmN2Q0YTFlZmJhOGVhNmNiZjA2NDAxZTRlODY3OWI4
ZmZkMjJhMDkxZDgNCj4gKw0KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
Ym9vdGdlbi9wdWxsLzI0DQo+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+DQo+ICstLS0NCj4gKyBjbWRvcHRpb25zLnl5LmNwcCB8IDIgKy0NCj4g
KyByZWdpbml0Lnl5LmNwcCAgICB8IDIgKy0NCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2NtZG9wdGlvbnMu
eXkuY3BwIGIvY21kb3B0aW9ucy55eS5jcHANCj4gK2luZGV4IDM4ZmVkMzUuLjRlOTQwYWIgMTAw
NjQ0DQo+ICstLS0gYS9jbWRvcHRpb25zLnl5LmNwcA0KPiArKysrIGIvY21kb3B0aW9ucy55eS5j
cHANCj4gK0BAIC0zNzksNyArMzc5LDcgQEAgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIFlZX0NIQVI7
DQo+ICsgDQo+ICsgI2RlZmluZSB5eXRleHRfcHRyIHl5dGV4dA0KPiArIA0KPiArLSNpbmNsdWRl
IDxGbGV4TGV4ZXIuaD4NCj4gKysjaW5jbHVkZSAiRmxleExleGVyLmgiDQo+ICsgDQo+ICsgaW50
IHl5RmxleExleGVyOjp5eXdyYXAoKSB7IHJldHVybiAxOyB9DQo+ICsgaW50IHl5RmxleExleGVy
Ojp5eWxleCgpDQo+ICtkaWZmIC0tZ2l0IGEvcmVnaW5pdC55eS5jcHAgYi9yZWdpbml0Lnl5LmNw
cA0KPiAraW5kZXggZDgzMDczNC4uZGVkZTQ3MyAxMDA2NDQNCj4gKy0tLSBhL3JlZ2luaXQueXku
Y3BwDQo+ICsrKysgYi9yZWdpbml0Lnl5LmNwcA0KPiArQEAgLTM3OSw3ICszNzksNyBAQCB0eXBl
ZGVmIHVuc2lnbmVkIGNoYXIgWVlfQ0hBUjsNCj4gKyANCj4gKyAjZGVmaW5lIHl5dGV4dF9wdHIg
eXl0ZXh0DQo+ICsgDQo+ICstI2luY2x1ZGUgPEZsZXhMZXhlci5oPg0KPiArKyNpbmNsdWRlICJG
bGV4TGV4ZXIuaCINCj4gKyANCj4gKyBpbnQgeXlGbGV4TGV4ZXI6Onl5d3JhcCgpIHsgcmV0dXJu
IDE7IH0NCj4gKyBpbnQgeXlGbGV4TGV4ZXI6Onl5bGV4KCkNCj4gKy0tIA0KPiArMi4zMC4yDQo+
ICsNCj4gLS0gDQo+IDIuMzAuMg0KDQpSZXZpZXdlZC1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJh
Z2VyQGFtZC5jb20+DQoNClRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcyENCg0KQmVzdCBy
ZWdhcmRzLA0KTmVhbCBGcmFnZXINCkFNRApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
