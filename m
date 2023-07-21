Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0492EC0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 11:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C33082F40;
	Fri, 21 Jul 2023 11:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C33082F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl44FDgyJitH; Fri, 21 Jul 2023 11:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778CE82F0F;
	Fri, 21 Jul 2023 11:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778CE82F0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4D81BF286
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 11:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F23AB41EC1
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 11:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F23AB41EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AK6Qsz0O5zxy for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 11:52:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::622])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 823F141E9A
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 11:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 823F141E9A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrg5FJTtdRSrZGCPFwIKgTHThy2VxqivRUNC8zbeCDlMArPxSilCSuVfEkxLVHC0MTm0ggIFCaJ32Ia8E/d6OYrg3rBAdxrOtYHo2gVpsio/L/XieJLQUQK/udoyG/577e+p1X2Bb4PE6GXWmPngH4Px3oJZNie6cpXPs5UVgEw9Cl95Gs22oZCbAKi+gwsQ5INVc0mauJO3kFBeSTRfjh9qICAD8y4PMT612/Z1e3BEPC9oDRtc+ifNc/DMMVQ668rqh56jAEcxJgIHTWfgvyrUcJcD3gChgTkgrKK3xUH6f6GQN9rTodwqe6tWFsZM7bLFYc9b6kolvCgFSxLcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9m88x7gZe/kIk6nQjo4d3nPemtiVsgn3DUzSv+lOiU=;
 b=LhahYBqWISPhW0lmX7Y23jctgdrqLsDb7658E3KdVbXbLJcfoDotz/SbtoQPghxwBNM5h31v0XMxQVYpY6YdfPCOWERXkEKuSJGkayBSxYtijO9LRPW9iV0AlRJeg0bU0dR1TqpT1uKHNJmUriO60oP7oHMUdhxPeHhDQzSDYdHSJ1bLxSU9GDNfkLi4ALALU91s6k1Y0Qe8HCtb4C/BiNC6NDPyNptI0YcA3/OgSgnmBsM8wW4fpgsc+qscgTYOZgj+ew6VRGoX916soXYEowgO0GCfXv9VpxueSlKRIj51/Wkjs9nL91qscAFRNTRnsDshjbOjdFcxlSeBZTxeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB0824.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 11:52:47 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3e:f9d9:44e1:d426]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::be3e:f9d9:44e1:d426%6]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 11:52:47 +0000
Message-ID: <46d6aed9-d971-d754-b080-6b151eca3065@othermo.de>
Date: Fri, 21 Jul 2023 13:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: buildroot@buildroot.org
References: <20230720053031.33014-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20230720053031.33014-1-bernd@kuhls.net>
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB0824:EE_
X-MS-Office365-Filtering-Correlation-Id: cebad85c-2bfc-4d71-2435-08db89e1007e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LouTQv1tjOV0Fc4MUeCcUbf+coMuqP+1W5kK2zOHsDjvtXeJkLJmNOrzlqMW0jqKzwfH3l6ZIX+lJDj2yLvMEjRY2VCymL28lMVGWyzsqAqLl8VsTFtj/LYsoXDEiPg7F1o3aGxcQVe3tJYZm3VrFsqJHXKMprNEToCljyv0cjdPwTcZOFO0GIDR0PCKutsxiHApPOiKXDl2AWo8ejWmEQ+2+5xIrLEam3RyHoC/YCEPQDgh8AsvghlySZjFlQaFdFMm+W7FbTJ1tFvRFtUP4eW36k87Zr+Yh4ZH+CeHXARfE63AgcSA8jpdh5Y0wbkuBt7c8yX1YIpP+MQm0sjrJBYBWsQO3KGPaeNRhzVq6lDOHPfrDPKWNYrcN1RSR92++P++DfVzBLZgrR9PTqggOXSysfYSMGl0LO9B0qCLuXiqnaYNNktynMWuxCmBBhmf2yffNUp8s4fDh+k3eSRMfOK48uVBwEWo8engT5X0kXFuQIzlsetbVwJ+8zTyA9mZbD7rkdr8Hbn3O5/pz5rKCC+kB3hubkevFxeRH3rk4V/7S//D07oFYW8/54PmZM10lfL3iri6V9v5F/L3g2MQ3kODrQ3DDfVqQK1p1TJhjcgz84pJKn1M5CfGErUvktzwZIXQoB0p7Te+JO4jkrz5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39830400003)(346002)(136003)(396003)(451199021)(6512007)(6666004)(41300700001)(6486002)(966005)(44832011)(6506007)(53546011)(31686004)(6916009)(186003)(316002)(5660300002)(66556008)(66946007)(66476007)(4326008)(478600001)(86362001)(31696002)(8676002)(8936002)(36756003)(2906002)(66574015)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVMMFkwSXdmbElGNUZvVW5ld09XdndzUTF1SVZseU9VdFFxTWdNUExNWnN6?=
 =?utf-8?B?L0V6T2hWenZSakdvd0JjVzBVYW9XSEZQT2hIR0pIbGE0SlVXYmgrSzU5Wm43?=
 =?utf-8?B?bHFoeG5GUWE2eHcyeTdzdGFtNzhQRlVFem8vL2JXV0xFb3o5R3MvZzBKcUpq?=
 =?utf-8?B?R2YyVXVyZlVYUFgrRzRCaU1jbHpMZTJVS1VCSGZnclpLeVZmWGEyUDJ6SkZP?=
 =?utf-8?B?ZStzemprK3hJM0U0TjNvMjhkWG5OeFRnUGFEa01rVnZzcVA2ZTMyTHRxcGQ1?=
 =?utf-8?B?NGNycklJUnlhWURsQlZ1OGJEYzJVYWhNUFQ5UE10NjI3TFNvSW1OUXpnck5u?=
 =?utf-8?B?M21QL3Frdy81cTVBaXRkZktlVmp5dWdvRlNLaVdTclVnTjVnVW1HSTgvNm9J?=
 =?utf-8?B?SXJvWU9RZVNHVFhBaGJERG8wTEp2OUFYZjJCb0VESHk1aUlra2ZKR0pCWmMy?=
 =?utf-8?B?UjVuMUlMOE00Vk9DQUJwUzdPV0h5bnJRQzN5SVIxN0FzekRRbTZ3Zmc2Nm02?=
 =?utf-8?B?TTREdUdDWHVKU0hNemZmNlVvdEJMZGx6RkpCZXcrOEhBcWM2S1hJdGd6bzdG?=
 =?utf-8?B?Tm9VZTZtd2dCZmc1eU5SMjNQdjFNc0REZTJkS0Nzc0QxVk8zVHBBay9kNW1J?=
 =?utf-8?B?OVBhbjFEYVJ0YmlobWF4aE1vM3Q3aG4rWFVVWUVvVXV6dW5lSllKSUJSdDcy?=
 =?utf-8?B?cFpUSXo3S3p2VTAwb2xMQ0ZTaUdab1lNSnVPS1FUbGxzdlhyZmxINXo5MnN4?=
 =?utf-8?B?SS9TTFpmMzJqWGhRQjhwNkJEbm9RS0VOa1RKS1BLZ3ZnTnpCOHhYK3JNQ1Vr?=
 =?utf-8?B?clBpTlFGV2xGWEYzZDBHWEVkckJNWGFVZzAwZEZXeHQyc2ZhRmRnUURYbWpJ?=
 =?utf-8?B?ZWxMVG1JbGRBcFpSTVloRXFrcFZPRURtMWpnSEo3MlpJTlVES2dzU2F1Nzla?=
 =?utf-8?B?ZWk2ZVIrellxaktOK29WVy93aVcwREQydlBYMmloTXg2MHBkQXVTZ2I2aDg2?=
 =?utf-8?B?UkQ5ZFdLWXk1T1RKLzNyVEZSNnZjcUNnd3d1RmdINHpVajZmZDROblA2Rm12?=
 =?utf-8?B?THR3TnBIZ0s4aFl4K1lKelh6SUI1Q0xxdldQV2U0WjlkNGJ0Mkszb1NaczM5?=
 =?utf-8?B?aGdERWowZHNEWmw4b0c3eGpHRGhvOXZCOHF6dUhnS2VOeUhneURWYlRyMEdN?=
 =?utf-8?B?OXpQclVPRUk4bGNqMWR2WWVHVHVvYmZFTUpvMjJXTHdYMms1aGhPMjZxcncv?=
 =?utf-8?B?d2JmcWJmL3cvay9GTU81dUFSZ2FNY0tWUkNZUkhZeFAydFIwYjV6S2lXS3c1?=
 =?utf-8?B?YlJYQlVJdFpjTWlFRi96bW5tRzZ1dnY1MmdjZ3VqSS9xN0RHVVZRMHZiUEJT?=
 =?utf-8?B?OGozeXA4SWRCY3JmUjdNQUVzY1NYeUEzOGF5NCtkQzhtNnloNklLRHozN3Fw?=
 =?utf-8?B?ZEMwMTdoZW52VWh5bDB6VkZkemxvcUtJK0VLQjVSa3lRU040aGxaZ2l1UTE2?=
 =?utf-8?B?ZXVJVmJGbFl2VWZjSXAwc0dSR2MxYzR1TUtQRUFpNWN0M1VpVmk0WnAzWk5s?=
 =?utf-8?B?VmNaUlM1OTJwQ3pnbTBWbzkyZnpZUjJpUFpPZDhzMmE3MTZ0Z0l4VjMra3Fl?=
 =?utf-8?B?RXE4OWtxWUg4MDliRWVSeS81YklXcGFRQUxBc0NzdFZNMkVnTHBuVG1KcXpX?=
 =?utf-8?B?cURSSmt2Z2RDNUVVM2VaVmdBMDgyem9PMXdMZVU3QzR3azBkT1psMElsSlgr?=
 =?utf-8?B?dUdOY3dBREFBNFpCc29WUVFkMjNQSG5LSVZGYXFwa2o3bGRZdWhSM2svYTJ2?=
 =?utf-8?B?Z3I1M0ZSVWdieWFsQ2lQdjFTTFJFYkZoSEIrZGZBdlFXU1czc3p3OE02N2tV?=
 =?utf-8?B?amRRd3l2ZlhTaHdxME9kQmpzZFFMdEdrUUo1cFE2ejNhOGl0eU9UQ21tZy9h?=
 =?utf-8?B?QVhKQUxvTWozK0JFNjl6RmJmbnhCa05pb0x0VzhxSC94eDduZXdybnJ5WXNi?=
 =?utf-8?B?VC9ETDdRbkswazNRbFpLNDNmOE9KWXVFaENKcUNIZmN0SjZRMlVOcjNNZmU1?=
 =?utf-8?B?WGQyYm9KQlprU1E1cWJoNVBhb2R6Nm5XSFU5RGlyMzZsdlJ2cldSUSt1OUtD?=
 =?utf-8?B?aHp6V05MdlU4aHpGTVEvTWljUEpWYzhHZWx0WkI3RGhpZ09FY1JldlVseFBN?=
 =?utf-8?B?VU9oa2FOTkFWa1dEd1NLVmxOcTBtSDRxcHZ4cjV1TWJTZ2FrQVBqRUFDZ3FE?=
 =?utf-8?B?K01WUk1lYUliWmFXWFhGKzBSSXZ3PT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cebad85c-2bfc-4d71-2435-08db89e1007e
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 11:52:47.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YUarFeukqovFeHu7x8F+jTNpfBuVISSELAkHFxHE+95CqO5+WF8v6/9jBB8wrIsj2ImKLwPnIJDQCXb6dgEkWHjudlzeDUJFFgam9xVO2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB0824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9m88x7gZe/kIk6nQjo4d3nPemtiVsgn3DUzSv+lOiU=;
 b=Yj1uNDRruuTuOfx6MDSjgQ86zYpLtWZZWzJddKViAuFVUgq3q4yuIFfP46b8HgC1gN7gDGHqiHbd6GvLVHF5OUD9rSL5OEn4Z0WsbhWfYxOfozWCKxtN8K1FJEFvpUPvQD0s8MbUlaRGPofw/9+lNWXOH2kumnYf8pC9pk6VcOQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=Yj1uNDRr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAuMDcuMjMgMDc6MzAsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IENoYW5nZWxvZzogaHR0cHM6
Ly9jdXJsLnNlL2NoYW5nZXMuaHRtbCM4XzJfMAoKVGhpcyByZWxlYXNlIGNvbnRhaW5zIGEgc2Vj
dXJpdHkgZml4IGFzIHdlbGw6Cmh0dHBzOi8vY3VybC5zZS9kb2NzL0NWRS0yMDIzLTMyMDAxLmh0
bWwKCk1hcmN1cwoKPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5u
ZXQ+Cj4gLS0tCj4gICBwYWNrYWdlL2xpYmN1cmwvbGliY3VybC5oYXNoIHwgNCArKy0tCj4gICBw
YWNrYWdlL2xpYmN1cmwvbGliY3VybC5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJjdXJsL2xpYmN1cmwuaGFzaCBiL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLmhhc2gKPiBpbmRl
eCAxOGIyZGJmZDg2Li5mNjA2NzM1YzBmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliY3VybC9s
aWJjdXJsLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5oYXNoCj4gQEAgLTEs
NSArMSw1IEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2ln
bmF0dXJlCj4gLSMgaHR0cHM6Ly9jdXJsLnNlL2Rvd25sb2FkL2N1cmwtOC4xLjIudGFyLnh6LmFz
Ywo+ICsjIGh0dHBzOi8vY3VybC5zZS9kb3dubG9hZC9jdXJsLTguMi4wLnRhci54ei5hc2MKPiAg
ICMgc2lnbmVkIHdpdGgga2V5IDI3RURFQUYyMkYzQUJDRUI1MERCOUExMjVDQzkwOEZEQjcxRTEy
QzIKPiAtc2hhMjU2ICAzMWIxMTE4ZWI4YmZkNDNjZDk1ZDlhM2YxNDZmODE0ZmY4NzRmNmVkMzk5
OWIyOWQ5NGY0ZDFlN2RiYWM1ZWY2ICBjdXJsLTguMS4yLnRhci54ego+ICtzaGEyNTYgIDI4NTll
Yzc5ZTJjZDk2ZTk3NmE5OTQ5MzU0NzM1OWI4MDAxYWYxZDFlMjFmM2EzYTNiODQ2NTQ0ZWY1NDUw
MGYgIGN1cmwtOC4yLjAudGFyLnh6Cj4gICBzaGEyNTYgIGIxZDdmZWI5NDllYTUwMjM1NTIwMjlm
YmUwYmY1ZGI0ZjIzYzJmODVlOWI4ZTUxZTE4NTM2ZjBlY2JmOWM1MjQgIENPUFlJTkcKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgYi9wYWNrYWdlL2xpYmN1cmwvbGli
Y3VybC5tawo+IGluZGV4IDJiZTM0MTVjYjguLmQwYmY2Y2NlYWQgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJjdXJsL2xpYmN1cmwubWsKPiArKysgYi9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5t
awo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+
IC1MSUJDVVJMX1ZFUlNJT04gPSA4LjEuMgo+ICtMSUJDVVJMX1ZFUlNJT04gPSA4LjIuMAo+ICAg
TElCQ1VSTF9TT1VSQ0UgPSBjdXJsLSQoTElCQ1VSTF9WRVJTSU9OKS50YXIueHoKPiAgIExJQkNV
UkxfU0lURSA9IGh0dHBzOi8vY3VybC5zZS9kb3dubG9hZAo+ICAgTElCQ1VSTF9ERVBFTkRFTkNJ
RVMgPSBob3N0LXBrZ2NvbmYgXApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKb3Ro
ZXJtbyBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10c2dlcmljaHQg
QXNjaGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3OCB8IEdlc2No
w6RmdHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
