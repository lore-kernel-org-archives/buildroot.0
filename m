Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042CFC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 18:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF8480B50;
	Thu, 14 Dec 2023 18:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF8480B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmk5CJZkdekg; Thu, 14 Dec 2023 18:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9214281585;
	Thu, 14 Dec 2023 18:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9214281585
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05AAB1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE07A60F93
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE07A60F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1KK2y_9Ddkgv for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 18:15:43 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BDB360F7B
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BDB360F7B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgLzPm+kqKfsO/LdC1QNW4DoWXDIV9K+t9Pv87Fq3q4n6kEh7+xyUP3m+nqsnCy1oxDu2SzQ9GYF8EWBNNWcOngDYYzUAZszOLG/7Bk6XvA4bwJKxsTqYzOmibw6mA3TuRABuaA5KV80NTDooVod5hkvuZPaeVCYKodhnIWZGJNAp8VS28XIoZXXBrYjkHh2/bNPpfrW3ItXFfcH6d3gdw9QVGjiyzf9VmqQMRDt9HRHSt6P3wN4/7q8EcwNxBEUZENpKfwjAjRVmpJw8mXNVkZCOqL5hM2sCnBADpY91CpJpXswRi+XyjMBj31iGFAl6mJ08iuF0m4FH3pvWtEQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdcbUQhGd4jmuWcSEDqLRzcDzw61DLCnmMcPgJJQnf8=;
 b=HUFqg8tUtd9swkZpvO7I8JLEqEG2jISb/EHHwMPLr3NvQu1X/JVUCGOSFwGqrhPg2uxVqhgNhJ6I1paTbt773KlXV+WzdCqX5weDC25H/+4KkRxTxly2sReCNX65BjvAaWIrd9i93najqXZ/X2X4sDZbT7OUi2hoGAM5+tlHpymeaehmwCFoXN4K3n5V6zMILyqFyjGN1twYo1sbcjiBuMfJ21/YKjAkSZlhuK+kHfX9/QArk2SXINOO67M3kPJaTm5rxOpF7zHRay+lMOctIiPl3EqYMTYTKcR8QHrmH9F43lFpQN0pz3HBeTzMstrvlCXCuW5EGdoezbNObkESig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB1602.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:308::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.30; Thu, 14 Dec
 2023 18:15:39 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 18:15:39 +0000
Message-ID: <e9f5c145-f117-48d8-bc0e-0d54e87cf6c2@othermo.de>
Date: Thu, 14 Dec 2023 19:15:37 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-5-james.hilliard1@gmail.com>
In-Reply-To: <20231214165420.181703-5-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB1602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f83b66a-895c-40ee-3cf2-08dbfcd0ad25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KBJDSiZDDa1lAXAOe2pBO1Mw4n1Venw9nid1PCbFDdMvmFwE/4SxbXdxifWrbiVHT/b7+TjfQCIBg1O9FOsc5nO7xNWEjCZfOEOcjutgcaAWUy1drXOBPO6iCzT4AzBWmNjrUtZPV5Z0Uy+osqoz7qlKVC6JxVbrIl8zzcDIbvFtnsbOgvJ2vkHWboJnwUaHu5NaD/RTtv6EmwK6M9NbV7QD5RGyHYyu+rE53WLkzYHRLnsFbkFgioRjXOlMKaFG4Fuz6q2Cp9HmwrmCl5jYzHRD15W11UN3cCWbIyD74GLJx5fz9sbxVn6O9gmPYK9b6qkclowE7XKdKN/morIVNWDLvT/lTLJw+YGpou5HY33ejX6tIVEAZhfKjsLZ3QWKYIKQeoPs1YuTXKANyCUq+66w6D8gnDYtBWKVDFlYCk4J1CcH0i+z1R1P2rxIz5AAoGP28BwS4PB8+N9VE8HhT6hX4mkWO77kD+FC/K9oOZSMxg2ohM6Sy5YHmAkjLehK25DUN0fTk2CiKq26GMC6XSLmuhKbhqtJ6o9GUeV7JwkKOcMg3wdPKK5hbfhDJ3P0ReXBEwilMl2f76mKLPutvjvO57j6faXwRJkE5EKYzamwbYNwDWT48KYK9yY1M6C/KdtzTel91dZc+BQAnzoSEjgl5EReJxeyM/SzQKhxn9uoHL5oMN9InzTO5WPRFCy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39830400003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(86362001)(8936002)(8676002)(4326008)(316002)(44832011)(31696002)(966005)(6486002)(478600001)(66946007)(66556008)(66476007)(54906003)(41300700001)(2906002)(5660300002)(36756003)(38100700002)(6512007)(2616005)(26005)(53546011)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lJVjk3TVRIMlQ2OGVkakpjcVdzQkRJVk9obVRwU2xrVzRUd204WnNxdnlh?=
 =?utf-8?B?dkZHNGtpeUFtL0o5QkhQSFlMVk5OaStMMG1VMUw2aVYxQ3lHeWRRSWZMZGl0?=
 =?utf-8?B?MTVidDVucis3NEtKYVFlNVJYcU9Bd3RwRTFXR1k0UERnMS9CTFphRFlGUTR3?=
 =?utf-8?B?SnlkWlhSL0ttT01tclQ1eHppODZ3aW1iN3dLWXpBRW1NWWtLam14b0hKaUQw?=
 =?utf-8?B?RTAxcWpOajl3MWdCN3I4dStEc1pCRm4rUHliY0g3TXJjYXlkUGIzVlhTUTVq?=
 =?utf-8?B?SDRVL1AxR0phbm9jSXRqRE9HVjRzOThXQzFIRXZuNi8rdWVKdVgreU9iQ1VY?=
 =?utf-8?B?aHJuVEM3UU1lWUdYd1U1aTFUendIbFN3d3ZxRHcvL0tyaGVGVEdhbFZJODFI?=
 =?utf-8?B?OGpXaGQ5TzkvSlpiMzVIWjNkeHZ2ZlhxM0oyNFJ6UDlNWTBCWHZIRjJZMno2?=
 =?utf-8?B?VG5VUXp0OXlJRHdTT0tGZmFMYkRmRXhLQi92VEdHMlVCVHIwYndLd2dyMmJk?=
 =?utf-8?B?OTVyWEdCM2RDenVoQlJoR1lZK213Y0w1U3V2WjV2STlDZExOQ09yQThjR2Zs?=
 =?utf-8?B?TzNBT0ttWXErTG9BV0NHdHVLZlEycHBTYzNIc05MOTZLV3Q4TDJJWnlLTjdH?=
 =?utf-8?B?VFgxYmNmUEJwMVNGWEM3QlVWL0tDVHl5UWo4dGVva3BrblUycjVhU094djdW?=
 =?utf-8?B?Zkx4Z2lRTXhuZndGa245TkdqWVRGRmFucUdwV0gwbGV4UlFjVTdydUR4UVhY?=
 =?utf-8?B?K1RLK21JeXpZbXMzeDhIeHpUQVRrQ0ZoV1gzVC91WGFBSGVtQ3BZVnBmUzZn?=
 =?utf-8?B?MmJ5UGFNRlZCTW96RVdBTjE5Z0E2U0pWYlNFekxsTEl5L28vT1FVVkJlbmxQ?=
 =?utf-8?B?UkhGWTArRGJNMUhLSWxleWJSa2JoaWZ5ekhiVWt3QnRML3lOV0htcDZnOEhz?=
 =?utf-8?B?V043MXQ3b1VlMk4xOGlqSitUZzRydE82Z0YxaTNsQ3VBVUJyZVREWTFTODVT?=
 =?utf-8?B?djR0Z1dkanpqbWszcDBYV3M1c2M5RHV1QjlqQ051Q2FWaGVpSkNtbVZqWnRD?=
 =?utf-8?B?Yk1xeDN5V2xWRlkzT0h0YndaWmdGOHpLWkIveWlLY2RjNFJnZFJRYzBLMW9R?=
 =?utf-8?B?WHhXemJPTEZJS0thN0QyRjlyMjQ3RDJRS3JTWHdoaGdUNk9ybTJWQ25meSt3?=
 =?utf-8?B?akhVWkF2YzNlNlZDSjB5NWNaQTZyNVdnSEZmVlZVaU1FSEczRjRJMWxpdkdx?=
 =?utf-8?B?UzFsT2RFQ1dYSTB5Ym01b2VFeFZkMDRwVTgxQysvRnM5Rmd3YXBNNXZBOE1i?=
 =?utf-8?B?Q0NLNDlld1Z4di9GbnVGeTI1QnJBTmpqTWZBS1RTL0xXcUd3cjlRLzZNQW5y?=
 =?utf-8?B?TnhZSDZBNVc2WGRwN0dhckt0OUkrV0R3MTRvS3Q3dTlVaEp4aHF6R3dtYjdD?=
 =?utf-8?B?TE5VK0ExVVRVM3Q5RVpyMHc2U1dqcnRXcTlDeFM2RGdXZGVuU21uUUZqUzQ2?=
 =?utf-8?B?eDRkNVR3a3hMaFpZSXFYNmkyV0ZyaFlJdm5qZHI2ZHRCY1JPZEwrM0N2OEZa?=
 =?utf-8?B?UFRBM1VKc282YXhYQjBLekQwYU00UElYVFFscURKY1Q4Y21DaHVpbk8xY0hS?=
 =?utf-8?B?K3JOQUZZWHA5blhGQ3MrU3AxdmMvUWx4NDQxMmltRHlkcTJMK0ZlU2w2VFlN?=
 =?utf-8?B?UGhhaHVScFBDMjNVMWU0RlFUdTZTL3JUV2ZudFNHdVZBeG1TckhXd21DemdW?=
 =?utf-8?B?amo0VzhBanJoVHN0Nzd6MUdpdCtXWlpRaDNkUXZJendzSXBwdkVncFVNS3pX?=
 =?utf-8?B?SGl5V3U0Q0o1RGdRbDR1a0JLdzFIdHhDZ2l5KzB5eFpxeWcwTE92SkpuZW5o?=
 =?utf-8?B?VFdGQ3MzY05qMm5GMUxWV2lJb0RuaWxEdzUrMVZMSGxHcjhlSGRScWlDazJL?=
 =?utf-8?B?YUp5TUg2WCtESXR3S25HNzhlWFRpbGlTNlErQW1HL2xrekpCZDNhWTZSUFUz?=
 =?utf-8?B?WjBUdGtYM28wV3lzenV3TWFEeWh3TnRKeXlBZzdlYWViYkc0V1Bud3h1NE1V?=
 =?utf-8?B?M1QwaG1ycEVQeXpYNjhLdldYcjNlM2RRU3VDSkFoM1dWK0oxejRubkJENmE5?=
 =?utf-8?B?OEx4TG94cUhwaFd1NFptcEd1d3hleG5sS1ZTSkxwaXdKK1dGUEt4cWIrcVZ6?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f83b66a-895c-40ee-3cf2-08dbfcd0ad25
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 18:15:39.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OfZWGQdFXlblztNyoW3NUs3rYXwC64mxxY4hXZe6ixfB6QWEud3PSMw8k0sy1bKjKrgG3rnwBaWw5yZ9kdNU32pNHyQXICx0N9hwC2ORzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdcbUQhGd4jmuWcSEDqLRzcDzw61DLCnmMcPgJJQnf8=;
 b=ntRyRKemhlc+a3OKowb0CjoJWVFmVkasyMyhuDhGRZIL6ILAgmsHIf4aiZM82uguGdm6Yx4gg0lDFOCdCP8S0I6zMB/zHlWEJOL2t3l5uteBfVzwrEHAOeNKHggc/XS2CgwHGWdysNRhzZJofBO9KoQNUwEina5IdLxwZ6KqrlA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=ntRyRKem
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v3 5/8] package/python-uvicorn: new package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC4xMi4yMyAxNzo1NCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4g
ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBw
YWNrYWdlL3B5dGhvbi11dmljb3JuL0NvbmZpZy5pbiAgICAgICAgICAgfCAgOCArKysrKysrKwo+
ICAgcGFja2FnZS9weXRob24tdXZpY29ybi9weXRob24tdXZpY29ybi5oYXNoIHwgIDUgKysrKysK
PiAgIHBhY2thZ2UvcHl0aG9uLXV2aWNvcm4vcHl0aG9uLXV2aWNvcm4ubWsgICB8IDE1ICsrKysr
KysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tdXZpY29ybi9Db25maWcuaW4KPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi11dmljb3JuL3B5dGhvbi11dmljb3JuLmhhc2gK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi11dmljb3JuL3B5dGhvbi11dmlj
b3JuLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZp
Zy5pbgo+IGluZGV4IDhhOTdlYjI4OTcuLmNmNTMwYjEzNTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xMzc1LDYgKzEzNzUs
NyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiAgICAgICBzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLXVuaXR0ZXN0LXhtbC1yZXBvcnRpbmcvQ29uZmlnLmluIgo+ICAgICAgIHNvdXJj
ZSAicGFja2FnZS9weXRob24tdXJsbGliMy9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNr
YWdlL3B5dGhvbi11cndpZC9Db25maWcuaW4iCj4gKyAgICAgc291cmNlICJwYWNrYWdlL3B5dGhv
bi11dmljb3JuL0NvbmZpZy5pbiIKPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXV2bG9v
cC9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi12YWxpZGF0b3JzL0Nv
bmZpZy5pbiIKPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXZlcnNpb250b29scy9Db25m
aWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXV2aWNvcm4vQ29uZmlnLmluIGIv
cGFja2FnZS9weXRob24tdXZpY29ybi9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjNlNzY5MzkyZjkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9weXRob24tdXZpY29ybi9Db25maWcuaW4KPiBAQCAtMCwwICsxLDggQEAKPiArY29uZmln
IEJSMl9QQUNLQUdFX1BZVEhPTl9VVklDT1JOCj4gKyAgICAgYm9vbCAicHl0aG9uLXV2aWNvcm4i
Cj4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9DTElDSyAjIHJ1bnRpbWUKPiArICAg
ICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0gxMSAjIHJ1bnRpbWUKPiArICAgICBoZWxwCj4g
KyAgICAgICBUaGUgbGlnaHRuaW5nLWZhc3QgQVNHSSBzZXJ2ZXIuCj4gKwo+ICsgICAgICAgaHR0
cHM6Ly93d3cudXZpY29ybi5vcmcvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXV2aWNv
cm4vcHl0aG9uLXV2aWNvcm4uaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXV2aWNvcm4vcHl0aG9uLXV2
aWNvcm4uaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uY2Zh
OTk5ZTIxMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi11dmljb3JuL3B5
dGhvbi11dmljb3JuLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBtZDUsIHNoYTI1NiBmcm9t
IGh0dHBzOi8vcHlwaS5vcmcvcHlwaS91dmljb3JuL2pzb24KPiArbWQ1ICBhMWFmODQzZTdlMzA1
ZDU1MTAzMGFiZmEwOWRkM2IxNSAgdXZpY29ybi0wLjI0LjAucG9zdDEudGFyLmd6Cj4gK3NoYTI1
NiAgMDljOGU1YTc5ZGM0NjZiZGYyOGRlYWQ1MDA5Mzk1N2RiMTg0ZGUzNTZmY2RjNDg2OTdiYWQz
YmRlNGMyNTg4ZSAgdXZpY29ybi0wLjI0LjAucG9zdDEudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgZWZlMWFjZjNlNjJmYjk5YzI4OGIwZWM3
M2U1YTc3M2I3MjY4ZWY0MzIwZmU3NTdlYTk5NDIxNGU0YjYzYzM3MSAgTElDRU5TRS5tZAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi11dmljb3JuL3B5dGhvbi11dmljb3JuLm1rIGIvcGFj
a2FnZS9weXRob24tdXZpY29ybi9weXRob24tdXZpY29ybi5tawo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODg3ZTRhYzM5MAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL3B5dGhvbi11dmljb3JuL3B5dGhvbi11dmljb3JuLm1rCj4gQEAgLTAsMCArMSwx
NSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcHl0aG9uLXV2aWNvcm4K
PiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArUFlUSE9OX1VWSUNPUk5fVkVS
U0lPTiA9IDAuMjQuMC5wb3N0MQo+ICtQWVRIT05fVVZJQ09STl9TT1VSQ0UgPSB1dmljb3JuLSQo
UFlUSE9OX1VWSUNPUk5fVkVSU0lPTikudGFyLmd6Cj4gK1BZVEhPTl9VVklDT1JOX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZTUvODQvZDQzY2U4ZmU2YjMx
YTMxNmVmMGVkMDRlYTBkNThjYWI5ODFiZGY3ZjE3Zjg0MjM0OTFmYThiNGY1MGI2Cj4gK1BZVEhP
Tl9VVklDT1JOX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiArUFlUSE9OX1VWSUNPUk5fTElDRU5TRSA9
IEJTRC0zLUNsYXVzZQo+ICtQWVRIT05fVVZJQ09STl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5t
ZAo+ICtQWVRIT05fVVZJQ09STl9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1oYXRjaGxpbmcK
PiArCj4gKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KCm90aGVybW8gR21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8
IEFtdHNnZXJpY2h0IEFzY2hhZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1JZE5yLjogREUzMTk5
Nzc5NzggfCBHZXNjaMOkZnRzZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
