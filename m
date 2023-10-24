Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E9BC00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 10:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E241940151;
	Tue, 24 Oct 2023 10:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E241940151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY9e_eJjDnrI; Tue, 24 Oct 2023 10:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC72F40253;
	Tue, 24 Oct 2023 10:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC72F40253
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 495751BF2F6
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 10:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4C040253
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 10:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4C040253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPMUORrDE1uG for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 10:31:12 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1b::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 775FC40151
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 10:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775FC40151
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGo8O22hpn9iV8AAje3SE+z+KTs2ZNVQq32KmuR10LQ63w3HIuTRvghR1sv7E+TBdlR6UP2lZER+5DQBoeuQOdjf7iSH4+iFJOrJgRCvsbjQryXaosoNye3yKOWKcQXMYKGAN1oH0/M1RxFi4fgUAsb0QNjBpFR9rULFjGhU6Js/Nig61MbtFI/96Anwn5S1NTw5nihSu1MAXj/NOkmabXcCckQ8Twyjjrss3KdwAzObxcHgPxURCD3HhkKIrp52X/suXGVST1exKXIDyaTzDuWOJAqHRpc3QdppAlbaoxyEdf6oqBI6RCnUFUPrrwWLSdEx/LgniFkZUOyU5eVIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9bDqR6nIXhm6FcZZCMHVuJdnOOPQnxNJWLCdELZQfo=;
 b=dbETL3B8hVSN6zAw+N/88mbR8qNc6gko2KTYBHJBG1TX/tpHBDtK2T2R/XnOgb7D5mhF7nFS49RlPW61t15Q+ogSI6bFccUmkpT4kdkQh+PxwbUNzjEnJzQz/2xZlw3J+PWMXzYVpiOkqsMO0MV2iHOljPnmfYMlCM9azbxt9QxTXCBLtx1k1S807qJ23DPO7UjA8ufPkIzB21d1otYNfF+6q4bBB6hIk+6i7DICS7zKew0N7EO5qtT4294nIiKrSzWMTll/b7ILbCpBs6PDLn/alJwVT5+e9BZ8HPmuRp55jaMxDfnFNOyzaoaV2od1VFTbD/RjOw4b89bD9uRwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB1908.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 10:31:05 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 10:31:05 +0000
Message-ID: <f1f053ca-5db7-40e1-90ed-6e55d80b92dd@othermo.de>
Date: Tue, 24 Oct 2023 12:31:03 +0200
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20231023182610.1400528-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20231023182610.1400528-1-giulio.benetti@benettiengineering.com>
X-ClientProxiedBy: BE1P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::12) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB1908:EE_
X-MS-Office365-Filtering-Correlation-Id: 166b1823-4971-4d40-ed3c-08dbd47c5415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgYBIASkH1ti1G5tAdmZcb3J753RqeUZbSePPUb57MjF8ft+wwc0f3Fc2PaRrkvSWE98UQ4r7+F7BdvsIDNg5RFB9jQebzWxBre67aX5kgY4lZx63pTmc7faJyiQhzioIcwNmU9hF1704j5OMixOReVn2vpo0L+SqFxrucD2vmEdZJwl8slV+WWs56tQ9WHtGDwIKz2/1E7nv/HjuR/lZdeoA3M2D4JcHfzgp6i5dbHQRI/OKztEH7Ne+40M7y1f3kCqHU913Jb/5okqYwP37WCZxImOYOeSWW2eikYL2SMpWld9hC0HdEOi078hOcaSZLMD7RLUJAw0kebYDOqm3Z0Tr8nqTOX009zV1VVNY9Vlphov5ODcHK6ML7GoxxGwyO4B3m7tui6/DU22gLf/POCmLky053rUXv9w/tisC2AwyfoKpxoCR+yWTdwVscdUD1FNyqHApP5d5p1etsfcdNOv7ynLEBTYWBP1pjUVi1X8RHLsraz5FqW2966USW9K5APjsHMS3B/i84KqPYcapHh/hIVUEUGdi93QJHTOeBPV11eDHNElTwEDzpdAO+5GBPPb4dDOrBAAgZLuvw819dk+gvmNtfoWTpnEiaMKYQzaRzCWMHFzA0WQNvx2YJgEnYCOUjZxO9nzdvioE8RtjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39830400003)(346002)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(31686004)(38100700002)(2906002)(41300700001)(44832011)(5660300002)(36756003)(31696002)(86362001)(8936002)(8676002)(6916009)(6506007)(478600001)(316002)(66946007)(66556008)(66476007)(6486002)(83380400001)(6512007)(53546011)(966005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0M3N3hzRmJYaStzdWhLTnNJZUE3WUkwU0ZQbTVQY1lOWDRweG4xb2NBK0Ey?=
 =?utf-8?B?UmRYdy9nRW5wUTE0Q3VUYjBEa2M2MzRCek8xMjE1QzhFNkNJSUxhSWRPcHZa?=
 =?utf-8?B?YUd2cTgzRTkreWRLZnk1cWVCWkFSTEJ2OTd6SUYwVitFS2d1UmxzYmNLRklL?=
 =?utf-8?B?aUpWdkdnTlV1NHVKQWl6QytiRFJwZ1RhUUpzeXFLcCtTWExEMXFUT0dCT3Ba?=
 =?utf-8?B?dkF1ZnNwZVU2YnY0NVhIbFF3bldxcUlPcFhwdk52YkE3NWQrNlBScUdqaUI0?=
 =?utf-8?B?RDgvNGViRFh5NGlFMitTdGNGeVViOHJBVXB6RTc2R3JrZ0JDT0FRUXZHdk9I?=
 =?utf-8?B?WVhTQVRiME9CNFlnZGxXMXBHSzdWcWRMTkhjMHN2L3lPbG9wRkdCKzZVbDYx?=
 =?utf-8?B?R0laQ3drYVpQNS9ieWEzbkxhd05SMTlYWEhRUmFlbjlydXE0MitteWV1RDB1?=
 =?utf-8?B?Y1VHcTk3S3dvWGdVKzFiZDlVYzBNV0JMS3c4dkVRdzlzK282Vjg5bW0rWVh0?=
 =?utf-8?B?YW9UYndnQzNxbkczTXo0cFVoeEJZMlZKUGtreVZxUm9uMm9vcEpuWGhGbEd3?=
 =?utf-8?B?Zm1HaHBaTlhJUElrdEFFeTFyWi9QcDJIcFl5M0JvNFdaT29WaERFQXlMbEYz?=
 =?utf-8?B?RldIUElPUFAvVmtBTlB1QXNJQ2E4M3ByQ05PVFpkV0NKQ1NoUVlCY2t4S2lL?=
 =?utf-8?B?eTUwcWlqMXlubVZvVmVTL3BHNExPMHd6ZXZyREd0YkZ4WW1sSTUxYlhPb29l?=
 =?utf-8?B?Y1ZsdnRMMGxRRThiclpsZjVVOW9La0xJUHM3bDdsWmFVeFdtOFBZa29ZTnVj?=
 =?utf-8?B?SHNaNTQrSTVpVkI2VEJBZE1UbTlrdFBQdGZFMXVqZUg4YmUrTVRMWXNjYmZK?=
 =?utf-8?B?OHJhQ0tzeVVLYzN0SGpXaUVtMlluSmhCbVM1bVNCOG1uSFBaL0pqRC9sR04v?=
 =?utf-8?B?S0VHOStNb29uTjhpYlNwaVpYcjNrMFJYSi9MeUgrbjZBdWZTMjhrd2Z2NThx?=
 =?utf-8?B?ejZqTGVsZXpVZXFBNzVXYmZwWlYvaCs0RTdFWk96b3lnc004b2tvSDl3SVRC?=
 =?utf-8?B?M3ZTWXZiQUo5UzBGQzM3V2w1RjZ2V0JsQ295cFJPZ3ZZSjRGZUpTUjBUeERQ?=
 =?utf-8?B?Q0IwSFQvY0dyQ1J6dzd3cFdtTlNRYXJSMGFFV3NZMHVFZFMwbGJ1Q2VJOTZJ?=
 =?utf-8?B?VTdHZ284SHhKTEJrS1pEdHJ5YTFWSVFjZzNZY01YazVNdUNUaE9WNHhlUnUx?=
 =?utf-8?B?dllSSWdvL0hyU1VyVkdrL1p2eDdTOGRKRElLZ0t6eWhMNUxIWk5DVEZzbkND?=
 =?utf-8?B?RlJVbWxOMHZPdm1BdGNDV1Yyc3lHdUxMeEZRYUdneW9RdU44YWx5dnpwNFVD?=
 =?utf-8?B?bTNjNEpFbjg3RHU5d09DMmhqY3FMZUNWbm5vaHpCM3l0MUtsUFpvZ3BqQkI5?=
 =?utf-8?B?aDRFN2l5SERKRFZFZFphajFhNGlCbVNpUEZOMklYakdNTjVhb2JWSW5RM0hT?=
 =?utf-8?B?NlB3SXhWS045SGNzSlVIT29LazJYL3dyQ0ZGT0xvQlduckhaMUNIM2ZZZ0pO?=
 =?utf-8?B?aVRCRVNvcStkdVp0RWlTMHVLMXdaaUdjQ3pqeTZKcExoQTNLUUhUMzRLTHZh?=
 =?utf-8?B?NlVEazlQQ3ZhMk8zNGNXcEhWeEZEellZU0hjbHFscm5jQTYzSDlidkJlRU9V?=
 =?utf-8?B?ODVva0JuKzBGZkx6K2xJK2YwNE4vK3Y1c0R3R2lBZ29RZmFNZTU5a0FNNWtm?=
 =?utf-8?B?dXNGREJ0eXhnNVVIdzFncDVQQitycjdUYkduMnNOVjc5VnZhMmdNRy9SRTN2?=
 =?utf-8?B?OGZ1Z2ZKM2hNeFo4a1BKdHJIanhHZUlnKzVvYkZ5RlArbVRYaWM1KzY0cEp1?=
 =?utf-8?B?Q2dHd0dVcUJlVEhrVHBucnE2RlVVWGExN3czL1N6M2trZ0RDc01YbWJveEg2?=
 =?utf-8?B?MFFFVEpVSnloWnEyRGJXYi9mQUlCbno4QWRmRytZV3IwRnhEWktqSk5tbEFE?=
 =?utf-8?B?TFdIVmJGZFU3dVBhaTJweW9JL3F5N2dhMmd6MnBlUkszdW9iaDQzNVBpNVkw?=
 =?utf-8?B?WFEzdkNHUUNiUkI2U3VwaUduclY3aWJwcFBGTmdEQTNrUmdqL05zSE16d1g5?=
 =?utf-8?B?bi80dEpGRzg5QmMwNjA3L0trenB2L3lRYmlzR0lWeEZ5QUl0SGdOQm5JK0RI?=
 =?utf-8?B?eDM5NENpOFdpdEFOcHV2OHBuR294NldITWNnK0VRbE1kQmQ3Yi85YW5mMzk4?=
 =?utf-8?B?SUxRRDF1WWMwcTVnNEVReURabGdBPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 166b1823-4971-4d40-ed3c-08dbd47c5415
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 10:31:05.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ofmg1suJweeSG/ghT1ORU0k2TH37SFtEvd/5PLO1vv9w8MNVzqJ/2pQjipYH/2S6JNeeZG3PGCcyAocN+t7ISLPP+Mz63bvQGm5dscAu2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9bDqR6nIXhm6FcZZCMHVuJdnOOPQnxNJWLCdELZQfo=;
 b=Sk2TVFNTpgrpun8HjtPMM5UM+u1+fbDcrqfGk9xUf29/75XgKd/WPJGvz8SZr/j5VAEsOXWfmPJNYGtSrH8pVA4tHNvr4o14Ww+j8lLOZLoJAhUMUgVV1ARKz8FtT5MW2Isyu5fzfaujtZyVoqpAL6xEf97Of9x9XZd+o5jmsTg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=Sk2TVFNT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump version to
 0.19.0
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

T24gMjMuMTAuMjMgMjA6MjYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoK
UmV2aWV3ZWQtYnk6IE1hcmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+
Cgo+IC0tLQo+ICAgcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11dmxvb3AuaGFzaCB8IDQg
KystLQo+ICAgcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11dmxvb3AubWsgICB8IDQgKyst
LQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11dmxvb3AuaGFzaCBi
L3BhY2thZ2UvcHl0aG9uLXV2bG9vcC9weXRob24tdXZsb29wLmhhc2gKPiBpbmRleCA2OTgzNGQ1
MjQzLi40ODFkYmQwNTY5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXV2bG9vcC9weXRo
b24tdXZsb29wLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi11dmxvb3AvcHl0aG9uLXV2bG9v
cC5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9w
eXBpLm9yZy9weXBpL3V2bG9vcC9qc29uCj4gLW1kNSAgYmM1ZTg0MWExYzNmNmU4OTM1ZWVhZjlk
ODJiNWVlMjkgIHV2bG9vcC0wLjE3LjAudGFyLmd6Cj4gLXNoYTI1NiAgMGRkZjZiYWY5Y2YxMWEx
YTIyYzcxNDg3ZjM5ZjE1YjJjZjc4ZWI1YmRlN2U1YjQ1ZmJiOTllOGE5ZDkxYjllMSAgdXZsb29w
LTAuMTcuMC50YXIuZ3oKPiArbWQ1ICAwMTA3ZjZlMDRjMjNiZGNkOTNhMGE3MTJhMGU1MmZmYiAg
dXZsb29wLTAuMTkuMC50YXIuZ3oKPiArc2hhMjU2ICAwMjQ2ZjRmZDFiZjJiZjcwMmUwNmIwZDQ1
ZWU5MTY3N2VlNWMzMTI0MmYzOWFhYjRlYTZmZTBjNTFhZWRkMGZkICB1dmxvb3AtMC4xOS4wLnRh
ci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAg
Mzc3MDI1Mjg3Nzk4ZjlkY2Q4MTllMWY4MjZmYTVmYzVlMmYzODI1Mjg2OTFhYjA1MjhjNWNmOGM4
YzI4MmMyNyAgTElDRU5TRS1BUEFDSEUKPiAgIHNoYTI1NiAgNmRkNGMzOTlmMjZkZTA0M2Q3N2Ey
YWQ3ZTMxZGI0Y2I1YmYwOGVhODM2OGIwYTQyZDZlMTU4NjM1Y2M4YWI2MiAgTElDRU5TRS1NSVQK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11dmxvb3AubWsgYi9w
YWNrYWdlL3B5dGhvbi11dmxvb3AvcHl0aG9uLXV2bG9vcC5tawo+IGluZGV4IDE0NzA2MmNmN2Iu
LjI4NTg4NGEyYmIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tdXZsb29wL3B5dGhvbi11
dmxvb3AubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi11dmxvb3AvcHl0aG9uLXV2bG9vcC5tawo+
IEBAIC00LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1Q
WVRIT05fVVZMT09QX1ZFUlNJT04gPSAwLjE3LjAKPiArUFlUSE9OX1VWTE9PUF9WRVJTSU9OID0g
MC4xOS4wCj4gICBQWVRIT05fVVZMT09QX1NPVVJDRSA9IHV2bG9vcC0kKFBZVEhPTl9VVkxPT1Bf
VkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9VVkxPT1BfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iYS84Ni82ZGRhMTc2MDQ4MWFiZjI0NGNiZDM5MDhiNzlh
NDUyMGQ3NTcwNDBjYTllYzM3YTc5ZmMwZmQwMWUyYTAKPiArUFlUSE9OX1VWTE9PUF9TSVRFID0g
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzljLzE2LzcyOGNjNWRkZTM2
OGU2ZWRkYjI5OWM1YWVjNGQxMGVhZjI1MzM1YTVhZjA0ZThjMGFiZDY4ZTJlOWQzMgo+ICAgUFlU
SE9OX1VWTE9PUF9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICAgUFlUSE9OX1VWTE9PUF9MSUNF
TlNFID0gQXBhY2hlLTIuMCwgTUlUCj4gICBQWVRIT05fVVZMT09QX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFLUFQQUNIRSBMSUNFTlNFLU1JVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwoKb3RoZXJtbyBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10c2dl
cmljaHQgQXNjaGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3OCB8
IEdlc2Now6RmdHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
