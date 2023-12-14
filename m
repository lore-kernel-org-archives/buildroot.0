Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5632EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 12:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D6242120;
	Thu, 14 Dec 2023 12:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D6242120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fft1GigEcBfW; Thu, 14 Dec 2023 12:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62634211B;
	Thu, 14 Dec 2023 12:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62634211B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03D0A1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A22E583D5D
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A22E583D5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBcaW6xTa1kD for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 12:11:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260d::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 248A383D57
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 12:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248A383D57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGxbDfl/n8AS8KecZp0egnN8+fNtM9INROueYwz8FS35Mx76/ejK8E8+x4hVB3Dzv+nMJJm78B/HajIrCprTRnJo4NxeDb9QhpaOQ1+l+6g6k+/kC577DawhGICZC2AQooPmR+YrfQnuJQ9USRN2aWhv3GShVPy6O7De+QwIKM4Yxwzsdou83gxr/5VLU3IBLp0mHy9CizAdN0rfFC5hD65gL5eKPZbOQMQGk5rUbJU8gdQg74JnBzvADf7/k9N40OpNHDk/bERfm5ANQjhnsa/3c6H5JjMH+tShgTNS6oS29k7BurIpYGl/SUXve3uKa31C3Tg4ZhWtBBg2jkTYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgBWj8mTOB7tpdCVRXEAA7f6VDkJJwv1JlTZRE+XUS0=;
 b=i5NuDszFmNiJVAigGQVvtCJzHT+P3VxZlJ8h3wZjblzEOrCZvqTyXB2DoQjj85B+YXzmkjzbD+a4eLb/NOjA8egnUKjprk/UA5fW+F6TnmEgoqswe+y2W5l+q6MOTfOUif4+/y3vPeX5jZFAJ0NR7y64zs1YaKvrb+oACmPbKWLq60f4eor1S+gzqRZ5awOiOkDNs3v4X36OIhWN2pbvhy2P0fh/hIBuOkxxdDJJHwMRtiHmSbCi0TsUewmODAaXdtECf8nsApbnXWup/hQi+OI1ui9iqpVzf+C1ICedmbw3czbY8K2Onlbfre0hpCHflcMt+09LfZ2SEX/vSQPNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AS8P193MB1509.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:353::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:11:46 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 12:11:46 +0000
Message-ID: <57789083-cf2d-44a4-803d-c49cb3f33469@othermo.de>
Date: Thu, 14 Dec 2023 13:11:44 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231214112436.144804-1-james.hilliard1@gmail.com>
In-Reply-To: <20231214112436.144804-1-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AS8P193MB1509:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f68249-78fe-43b6-ddbf-08dbfc9dd7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HlQeTpt0/hDuJRf6saNCL8QgwFpzAAGLe3TSaeVhK8/lQU6XLlcLxh8z15dp4ZD5KBpstxhyVvtrrPF+0G2i11hMjUc4xqnZh99S3933xIM1g1cj/033r6YQdP2ZbXomxiHJCo8iLuwqZG6Q7zC7tf/wa9EuOXgkAKVGh4wNkCW5AlQYtAl0X1TycnvcNERAChSAVQ4By6KtjZqwDqDU5K4s054YWJzaH5v+koHNDhqGPFPIt5ZlsubGq0+e5sVjvCDZEx2K/Jh7WPOyS4ab7OO2cEZ+gX/WhjVDZzA1Cl2yp112WoCwjReBGcX4hCmwbfoT5zpd3skqNYb4txxRYapy4FeVplsR08LiPsaHdgmIKSkc55OjZvA7J9/n9BUD6KC0oLA9Cb5uG7eru7R31icxiFA8YhzOYTZKT485RdQqexYvLUVS458MTUpil/MpbqZgYDBKEc+I+I6Iq+sUM3xCTN2O4k8WdvEJ+ABFNjsgdffxPxZCHsBPQcDGbosD+WOYe4Ns7HJHI8XxDxMUEAN6Po45VPlbR+P9oqX1/0scpZfj2Lv92wZGfRI5snzsmpbdNGkxkVwSNSfEcozKRzhim79MbVya7512wPiu4aK+vCgKDe8b0SK5he0wvDlFDKFvqN9WvuihDcqpKLEgVzj79T1bMZvjQe/u1wr/mu0Vy+/dseijz/U4OaqTqBgB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(376002)(366004)(396003)(136003)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(478600001)(6512007)(36756003)(6486002)(966005)(6916009)(66476007)(66556008)(66946007)(38100700002)(26005)(2616005)(53546011)(6506007)(31696002)(316002)(44832011)(8676002)(86362001)(8936002)(2906002)(41300700001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlUzQjBhQ0NSZ2xXLzJOYnM4N0FKR3Vuc3Vyczd6anhJbFUva2RtdnlvSDVj?=
 =?utf-8?B?ejFTSm5VVHBqakpyK3J4QVRkVCtOQ0ZjbkNOZ2tCdzk0a3hSdTZkNThLc3BZ?=
 =?utf-8?B?SFJ2eVVYWVFVc1hoMk1pY1gzcVpNYUNITWVmdWs1aU8xck84RDI2cHNCNmdI?=
 =?utf-8?B?NW9rVTFsMy91amZTVk9BQzlhUlJPVW8xTEEyOVpReXh0UXBLdjVRWitmSE9y?=
 =?utf-8?B?RUdUMjlORVVoU3hGQnNhaFFEbW0vRnhLWVBxb21tWlpzZGJxQm9LbWlBQkRl?=
 =?utf-8?B?NzFOSVdtaHgrWVhlMEFqTlNZWGM3RGJLR3Y0c1RHRDZpYnZEZ0xwMkhxSmFa?=
 =?utf-8?B?UFlxRTFnYWRLa1dpSi9BdWdHYXFVdXRRLzUzVDdNOGovZTVlQ3ZmTXk4bFc0?=
 =?utf-8?B?WG1OenFGeUdlemlkYzU1N0liWXVXNGpTeTc5ODdhdVNaaDdLckNDYTlBcVl0?=
 =?utf-8?B?dmp5MW9pNnRISDhFZW5jaDRoMTNoVXBHY21DUmdTUWtNQWFVNFVjWm9UcmVm?=
 =?utf-8?B?SnZLTTBiaHcxalhmczVabytTeDNSSnVCUHBRc1NaaXlza1BQTFBLOVZwRmNi?=
 =?utf-8?B?ZnFZVkovUjdsSmoxZVZNMENhdFpuYVQ0MDQrL0RwRitjM044MVdadUU1UnAv?=
 =?utf-8?B?SUhRRlNkWTFPd2JOdzZsOG82Y3lLQzdqRWVkM3NBV1ZDWURDNGRvR2VmOGpS?=
 =?utf-8?B?RnYrR3FZdjNpMWJpMHBqUXRYaitvenhTZXFDaStwVWlMbkxPd2JHd0dkazQv?=
 =?utf-8?B?V1RVTWlzaHVaTXFoSFR3L29ldjFOWVpPUHpYaG5LQ2Ewdm9hT2U2VmdwczdZ?=
 =?utf-8?B?Uk5HTXVocENXcUNKN2Z6MWo3dWFMZUkza3RWYXlnaDBXWXJxaTdrRE96OFQx?=
 =?utf-8?B?SlppbFZWQTcvYkNCbUVrYnJ0UFc4TEx4WGR1VXkxYnpndTNOK043WGNHSmIx?=
 =?utf-8?B?WDREWUlOWXd2L2pCejRBT2F2QU8yZG56R3pIQUJiR3AwR2xtWUhFS3JGaFZ0?=
 =?utf-8?B?ak5rUFNKYUtQblBBeDNsdlBQUThzUzRqdFZOVjRKNDNJcS95OGVEeTZmN3hF?=
 =?utf-8?B?VG9BU0h5N0FhTStleTRsNGdNMERHb0tYN1NtK21NYVZNQkVoSEl2Nm9jS3Rz?=
 =?utf-8?B?Y2xYR01XTUQ0NHh1cjVTc2NMU2Robmd2NGMxTEFpZE9GM2tTTzdvWnZ5SWpq?=
 =?utf-8?B?N1c0TG9Ga2FCemNiM3VnbU9wYWRtSmVSNEZrbTNjZndGcVNQK2lqK1lhNFg3?=
 =?utf-8?B?cVpVODcxZVFBbVdHajJuZm1odEhPa0kwZElZTmc0MW1sN29CRDh3Yk5kTHo5?=
 =?utf-8?B?UStNa0drWkhxSGlFakZBRFc4dFpYY29mUDVlNmRBS2c4UVBXZEFHRWZISkdp?=
 =?utf-8?B?NDZFUkhQejVCdjlmdGg3d1lwbU5VcUZ2cFIzbGNadGE2Vm0vS1hnRXU1aVQ5?=
 =?utf-8?B?TjVYaW1vbjZLdEpLRjM4MC83QjcvN2ZHUDdVRWN5Y1VuNFN2L25YbCtHZlhm?=
 =?utf-8?B?bFRERm1EdG85dXU5Q2lyOHhXbkhueFluZVk5V3cvTk8xNklYYWxoUGdoUGRK?=
 =?utf-8?B?bGZjTHpWRDFXeFRzSzY2ejBGZVVUQmF4b1dveXNFY1pUN0l2ZHo0TE02ZjZo?=
 =?utf-8?B?NGE4a2xqQi9zcUdKall1Z2JFVnh5bjZrSnBtWEhGYUs2bkZuZDdmTFg4bGJS?=
 =?utf-8?B?bnpuWVZhdHBEMFhlUlkvRTcwOGxNWitoWVIyUXRldUdtRGxMOUZCRjVyM0xQ?=
 =?utf-8?B?MmVnNTk0OUg0NnFXa1pqOWJDV2dZc01nam1IT1pKaXZMLzFjUDNZOXcwbVhU?=
 =?utf-8?B?UWw1Vk5pSU9CU1pUOWl6SFVVNU5jWE9lU2N0MkZrSnpmY3JiVVlyemNraUVo?=
 =?utf-8?B?UWphSHlaQ2wxMStORzl1SDBuVHJWYkg4UU1LcjMrQSszYllWR3Aza0NFbTRL?=
 =?utf-8?B?a0llVkJlbHFNdGd0RlUrM1dPemo5RnpSNEVhNUdJOXhEOEE0SFA1NlBmVndm?=
 =?utf-8?B?OWRqTTl6UGl6S0l0aXl5ZXpVRmIycGIrL2EwVmhlOEF0QnF4Z1FTV1oxQUR5?=
 =?utf-8?B?ZTdsRU93VWQ4Q3E0QXVob1ZRK1ErSEg1NEQ5c2RzbFc1QzdqTkpIS0M1bGw2?=
 =?utf-8?B?aU8rUGFQRmthRndCYmZla3FpNENCWk5peTB2bFM5cTdmTGlHQkVpQWJna3Q5?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f68249-78fe-43b6-ddbf-08dbfc9dd7ec
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 12:11:46.7495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRssskPNpNS4hDkwq++PhoD373npKD/b2oqJTf2Mn8Stm9nF7zrIAVBIj53xmqY7/ryfRWNXa+LfevC1JT0WkW+29zWBWsrf4OFhAD3QFzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1509
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgBWj8mTOB7tpdCVRXEAA7f6VDkJJwv1JlTZRE+XUS0=;
 b=mMRZhF2b7XYqF0f44fuaWbguzkWyIQdn7xD79US3chCFqyuOKAAg3cjgb51jUkUaI+7KmjTHVdhu1JymbVrgf05i9w0s4gtUwzUCesYua5bLMysPoJFRebkLZDGL0b65f/jyrYHD615mO9MdLm6O/hZy3mxyze1I1DwYRe78O+g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=mMRZhF2b
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-anyio: new package
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

CgpPbiAxNC4xMi4yMyAxMjoyNCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4g
Q2hhbmdlcyB2MSAtPiB2MjoKPiAgICAtIGRvd25ncmFkZSB0byB2ZXJzaW9uIDMuNy4xCj4gLS0t
Cj4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBh
Y2thZ2UvcHl0aG9uLWFueWlvL0NvbmZpZy5pbiAgICAgICAgIHwgIDkgKysrKysrKysrCj4gICBw
YWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8uaGFzaCB8ICA1ICsrKysrCj4gICBwYWNr
YWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8ubWsgICB8IDE1ICsrKysrKysrKysrKysrKwo+
ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9weXRob24tYW55aW8vQ29uZmlnLmluCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tYW55aW8vcHl0aG9uLWFueWlvLmhhc2gKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8ubWsKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggZmNjMDliMDdj
NC4uYzAyM2UwZWYzZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2UvQ29uZmlnLmluCj4gQEAgLTk3Niw2ICs5NzYsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRo
b24gbW9kdWxlcyIKPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFsc2FhdWRpby9Db25m
aWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1hbm5vdGF0ZWQtdHlwZXMvQ29u
ZmlnLmluIgo+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tYW5zaWNvbG9ycy9Db25maWcu
aW4iCj4gKyAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1hbnlpby9Db25maWcuaW4iCj4gICAg
ICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1hcGlzcGVjL0NvbmZpZy5pbiIKPiAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWFwcGRpcnMvQ29uZmlnLmluIgo+ICAgICAgIHNvdXJjZSAicGFj
a2FnZS9weXRob24tYXJnaC9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWFueWlvL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWFueWlvL0NvbmZpZy5pbgo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZDg0M2YzN2FmMAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1hbnlpby9Db25maWcuaW4KPiBAQCAtMCwwICsx
LDkgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9BTllJTwo+ICsgICAgIGJvb2wgInB5
dGhvbi1hbnlpbyIKPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0lETkEgIyBydW50
aW1lCj4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9TTklGRklPICMgcnVudGltZQo+
ICsgICAgIGhlbHAKPiArICAgICAgIEhpZ2ggbGV2ZWwgY29tcGF0aWJpbGl0eSBsYXllciBmb3Ig
bXVsdGlwbGUgYXN5bmNocm9ub3VzCj4gKyAgICAgICBldmVudCBsb29wIGltcGxlbWVudGF0aW9u
cy4KPiArCj4gKyAgICAgICBodHRwczovL2dpdGh1Yi5jb20vYWdyb25ob2xtL2FueWlvCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFueWlvL3B5dGhvbi1hbnlpby5oYXNoIGIvcGFja2Fn
ZS9weXRob24tYW55aW8vcHl0aG9uLWFueWlvLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjFjZWE1NDliYzEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9weXRob24tYW55aW8vcHl0aG9uLWFueWlvLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiAr
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9hbnlpby9qc29uCj4gK21k
NSAgNThkMjg4ZGQ4NGUyOGUyNTA3ZmY5Y2U3ZTQ2MjAwMTAgIGFueWlvLTMuNy4xLnRhci5nego+
ICtzaGEyNTYgIDQ0YTNjOWFiYTBmNWRlZmE0MzI2MWE4YjNlZmI5Nzg5MWYyYmQ3ZDgwNGUwZTFm
NTY0MTliZWZhMWFkZmM3ODAgIGFueWlvLTMuNy4xLnRhci5nego+ICsjIExvY2FsbHkgY29tcHV0
ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICtzaGEyNTYgIDUzNjFhYzlkYzU4ZjJlZjVmZDJlOWIwOWM2
ODI5N2MxN2YwNDk1MDkwOWJiYzgwMjNiZGI4MmVhY2YyMmMyYjAgIExJQ0VOU0UKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tYW55aW8vcHl0aG9uLWFueWlvLm1rIGIvcGFja2FnZS9weXRo
b24tYW55aW8vcHl0aG9uLWFueWlvLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi44MDQwNGFjNjYwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLWFueWlvL3B5dGhvbi1hbnlpby5tawo+IEBAIC0wLDAgKzEsMTUgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1hbnlpbwo+ICsjCj4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gKwo+ICtQWVRIT05fQU5ZSU9fVkVSU0lPTiA9IDMuNy4xCj4gK1BZVEhP
Tl9BTllJT19TT1VSQ0UgPSBhbnlpby0kKFBZVEhPTl9BTllJT19WRVJTSU9OKS50YXIuZ3oKPiAr
UFlUSE9OX0FOWUlPX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMjgvOTkvMmRmZDUzZmQ1NWNlOTgzOGU2ZmYyZDRkYWMyMGNlNTgyNjM3OThiZDFhMGRiZTE4
YjNhOWFmM2ZjZmNlCj4gK1BZVEhPTl9BTllJT19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICtQ
WVRIT05fQU5ZSU9fTElDRU5TRSA9IE1JVAo+ICtQWVRIT05fQU5ZSU9fTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKPiArUFlUSE9OX0FOWUlPX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLXNldHVw
dG9vbHMtc2NtCj4gKwo+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCgpvdGhlcm1vIEdtYkggfCBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6
IEFsemVuYXUgfCBBbXRzZ2VyaWNodCBBc2NoYWZmZW5idXJnOiBIUkIgMTQ3ODMgfCBVU3QtSWRO
ci46IERFMzE5OTc3OTc4IHwgR2VzY2jDpGZ0c2bDvGhydW5nOiBEci4gRGVubmlzIE1ldHouCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
