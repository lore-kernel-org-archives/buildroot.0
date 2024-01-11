Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8BDC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528AE40192;
	Thu, 11 Jan 2024 05:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528AE40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c11bBECL3KDK; Thu, 11 Jan 2024 05:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3874171E;
	Thu, 11 Jan 2024 05:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3874171E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BAA41BF313
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFBB4023C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFBB4023C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAnap50j7mI0 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:47:57 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 990FA4018A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 990FA4018A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmITk2EhXD/m4YqmvwknkfldMyG/fODfpU2TPciXDhYwB/uKo0868jsslKzlmc2QsD9m0VA2l5UtOeLWtY5adLCd8ok+QLW0fSl9RT0UI3bqXoidAx/LZacX89MbEuGC5qOd57bBcoeXc5EmQ6xEOGKoRIF4AumkmN94GuZnpahtuOVwRLHCEB3A1MjJWk5097Mb2kaz1RkqaMmFoJGJqpTWQIQQFQ0qx7QnnwMD/mCo4Rj+aeU3JuBo09ByKw9yJYfkpazLeoe9NfY/sBTgLQnhPWx9lOY2e80n77YVZkeMhh5FXlkYKJtI/BbTWU0Vn1YCgH/YUI4m7pFnoIm3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVjeYE4yvY54a3Vk46UMWC7XizB8kr5CgqcLv3tCQnM=;
 b=ljeBZ13nwBx6r8mypO2rnbDGXZoGrbbHOEQt2bqCYogUDyP/gfEpQBLiaefuTj2qH75zG33oetnaAS86NF2VrNaQxCX31ECt5G6HS0wCR/ggc2+wNA+qmf9TczT7M4PWa7r2KIVoOFKeE4ZdgEn68QWsXlrOmkPw7HrOSObsTpEc5OYmhr+Ga9PbDcohD93ooNDELWv6Lt4+e4/y/zQtywnB5rFp1d7PmqE/k3RhLASQWgGf+RMxQY1VdYMtFGAP7J9xrpg2FQpGWf8a/oMHqvX7NPvbO5NEUuIJvfBZN7zcR8dOeiiI4kFy8txZIJIGlhJPcy7i+dN+14sprqcTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
Received: from TYVPR01MB10639.jpnprd01.prod.outlook.com (2603:1096:400:2ac::7)
 by OSZPR01MB9486.jpnprd01.prod.outlook.com (2603:1096:604:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 05:47:49 +0000
Received: from TYVPR01MB10639.jpnprd01.prod.outlook.com
 ([fe80::70ad:85f2:87dd:b862]) by TYVPR01MB10639.jpnprd01.prod.outlook.com
 ([fe80::70ad:85f2:87dd:b862%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 05:47:49 +0000
Message-ID: <78273b30-5659-4cc0-91f8-23a8775fedf2@sord.co.jp>
Date: Thu, 11 Jan 2024 14:47:48 +0900
User-Agent: Mozilla Thunderbird
From: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
To: buildroot@buildroot.org
Autocrypt: addr=atsushi.nemoto@sord.co.jp; keydata=
 xsDiBD5pq4ARBACDYkbmfj8Thnt/0lQQ3ZL83pkmhTmYHB3fXCXH54s6xiGLifMjZoJRlRk7
 be8YS6I37UqW98CDzL0wh7G3PVoz/IPAFjzrOaOjjb8/hbxw+EljhlLzw6jT1DLp7f7+TRXM
 +wlsv4MKoPaLdJQgE3aF39uNESmOb0NFYPzos4Y95wCgshVvpSxz/n/5GEitYYt0w5xhLfkD
 /2dMwL8EMqwbpMSg9hcMTTjjNRZo+eOkdl/J36OCrl7/JtHrLDIQKR65mR5F2E88DNxZVvpU
 dBAvJ/XnynJTGLldWleRfy108J5hii7NSItfnhZdzzTZmw1cvZphZ2DaYreT84+SyKDrPUuT
 FIWYBHrwXktbd+RGjnhZt14nBUaSA/9F6qNQXmEE9Q/X0RpcLjLsU8xeHZ6afX/gU4/hCq3x
 PaImcjNzF1kIRHniBv0yHjjXTzB4+5KZkUSIyv36zVTeh5P6NKXAWqNzRq3oKOJYpH1TK9ZR
 4V/9UAGbEU6qhnllj70MXs+KsOAt4kak58fGymurLhtz62v90W3cRNz9vM0qQXRzdXNoaSBO
 ZW1vdG8gPGF0c3VzaGkubmVtb3RvQHNvcmQuY28uanA+wmUEExECACUCGyMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheABQJbOX/NAhkBAAoJEMp3/pQodNUvl3wAn3lxQmyXAFhllzIFog2t
 Na/9ZiB8AJwN+xEEsG4SNm7CmP2AVJUUiL/FRM7ATQQ+aauGEAQA/TgDTprw/Cfqeyn+2cMy
 ULu7NYa/svJ1mHGeIpRnd8ESyC+YaLqmTiEs1p5uSGPHhVNctbVNcF/pzJPId0IYERwt4Ck8
 WBEQrGGOx7rj+2+eyHI4ZB1H3KH9E6a8U6CJv49W6TP3HuYxWLbkQZIIrdwSCwVZSmzTDhPt
 8OEL7hcABREEAN8nY2k1m66jIgviVInRHzR2mHa5T775M8+97eMcA1W5T8uJELbwWKs6rCgE
 hglDNliA3UJGjEKbm3nvUo5oO44RUbl7nYDWBoffQYVltmLYTAIFoh/D9N/8Bet80bsQAX28
 u2kv363344Ex2GWeDjVQY6rpWsPLwhXFmb0UnlN6wk4EGBECAAYFAj5pq4YAEgkQynf+lCh0
 1S8HZUdQRwABAU91AJ96ztctq3IqC/uwUz5Nzz87N3JVIACfeG/Qwv0DqLn7FtmxwPHmUgnu e/g=
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To TYVPR01MB10639.jpnprd01.prod.outlook.com
 (2603:1096:400:2ac::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10639:EE_|OSZPR01MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 3657f1a0-66fd-4f44-2e6a-08dc1268d858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSCz09Xd7cirepWc0GtBLbPWmhXpQqZeMDivsj5fZwhQetT/yGvHz8eGZnFvVoBWof6YFbuW17VmROBzZn2oSGabWhCNuG+2CkdnNVW5DgcXmoGRSC9gAf+uDQqhhqxg7uWb9befGuR/hpYOM/PKpLBd3kpfd3N+b3uXcBa83NSvJvQvVGkmn7qx4ZiLxyzAzVr4Oqhm3lUd8/w5Ua5s9Vg5FFqNP9wQG3/UnmsHzzelbDEvVoAS1FOVeg2ZCETvx/SY1+RfYuh60HzS9MkZ0tMkvuJvNpHbDfp0uHSKJi/zGjGvLXqWNmEicmllCxXtam5LydxIJBxTAeLA/TyV4+shkYR55e7ublpS84ildFteaLcpmByYICmAnAeHDOLeFjbAZVcP4aMVixyPT8uVOkNuakSRI88St2p0i82ALXOaMqB0g/M5OVy+ox6DCRx9q7pmQG1m2nk5VyAycbEzw2zBcSSIkuBRfFNYdrUsPmnEgDnGO/monFo2A+WK1to4AlVJ4uxvc10p/6IyeAbZ+xqPa1ULSNjhYabD5Atdn4tGNzfMFl3GD6ljJs0IF7iC/+X+8fIVZ95h1v1mhYn0GFGl8tNnRYiXIPUj0v5SRxzCHvGxjbGxotn0Ok/NTdkw+e1kzbGQiasBCmh4HDLzOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYVPR01MB10639.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39850400004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(4744005)(478600001)(5660300002)(31696002)(2616005)(6512007)(86362001)(66946007)(8936002)(66556008)(8676002)(6486002)(54906003)(41300700001)(6916009)(66476007)(38100700002)(316002)(26005)(4326008)(36756003)(44832011)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEkvMUIyRW9ENlM1bjE4YWFyMUdGT3BDTjBKTkIwem1VckRvbUs4a1d0SWtm?=
 =?utf-8?B?bnRrVFVFc3BRSURVeVlGejhxWFgrWEhUVS9RS01FMGMzSDFCY1FxT3Y2SlAz?=
 =?utf-8?B?aG51NDRCbDZPSjA5b3N0bUgwa1J3ZlIvMUJmZG5DQnI4VWYyalMwSHB2ckhP?=
 =?utf-8?B?MzJPNTEvMFRSeER6dGREYlBiL0l1UU1IWDdHaWxlbC9hQU1FdWRqOHFSV0N5?=
 =?utf-8?B?S0paS09PQmlhbUhxQzUwNmNuSWZwYTluTHRpTVQ0blNXTTdGVWhJV1NnUHNj?=
 =?utf-8?B?aVZRWnd2ZkxSMC82N2RrWVl2QXJJK21JNjVxVWduWE11dERoVTFZNjJ4WjB6?=
 =?utf-8?B?SXpDZ0NxQi9iR0hRL0ttUnlneHV5akZGN1g4TCtqd1JzSXBIellHOFRhR1ZC?=
 =?utf-8?B?ak1CWnh2Y3ByTlA1VlVDR3Z6NkhsSG5GSEttNkdDRm4vVldsbHFHOGNTa3ZT?=
 =?utf-8?B?TFIvYUlyOWpEaERiTUNYTzdjcW9jaDhwM3ZOV2pCaEhWWlFmUEE5cWxWSWlB?=
 =?utf-8?B?Y3ROdG1wZkFZSmlKZy9COUM1dU5MZEJQaVlMejVyNmdnOW8veUZNTi80NWRr?=
 =?utf-8?B?VUtrTGppdjNOd3FUVExhYUNldldiTEIyZ3pyanNuS3NSQ29QQ3VCTGxOcWJh?=
 =?utf-8?B?aHFtSXJBRmQva0ZqVVlha3R5RWRtU1RMUklJaEtaeXhvREpEazB3bjM5dDZa?=
 =?utf-8?B?ZGV2ZUx3eDlqSkNtVGg0cHNBaXJTNjV5eEtqdFFRM0hYeFNEaFU5aFJMQ0RP?=
 =?utf-8?B?Z2ljbzFoNDlsdS9sTXJLV2FkTkxhQlpHSEVRdTVzTkdsNEdKNzdlc1d3UCtK?=
 =?utf-8?B?TGNPTE1nMjdCT2x1eTd3NEhSMW8xMTZhR09sN09uRkNlRGF5cWN0RThDVEw1?=
 =?utf-8?B?MG90bkd1NFFyTnAzNTVmVnN0bUxid2RndDdGUngvS1IvUUc1L3krWHJ2cEsr?=
 =?utf-8?B?cDRSSHBTRzh0azBkZUZQQkVvc2xVekZCWjJSdndWQmN4NGdBU2t0MzY5K0dW?=
 =?utf-8?B?RStVSWg5elVhUkxsakxseVR4MFVZOTFmWmsydFlnSmVvOGN2eXJiM2J6MzZi?=
 =?utf-8?B?NzZRcDZTcUIyRXNZOFFtMWZxN2dmZG1BOXVubnVzbWpEdnk2SFVWWDNGWGxK?=
 =?utf-8?B?T1JneGJWUmJHaXBVQVh1VVlnSUZGZnQ5STZ0THUxdkUvRStHa0UyYlY2RWVR?=
 =?utf-8?B?K21PVit1UkQzS1JXNG5yeUZhNytrMzA5U25VMXJ2YzR6VnVwcWI0VUVvQkp2?=
 =?utf-8?B?V2VaYUVwT3o2NmRpYUh1UE5kRWVOcjdpaGVxK3RkU05oenFPUmlhVE85SzBu?=
 =?utf-8?B?NElJeXNORjdzYThqZUhtQ3VLMU5CQlJCSVlYUkN3SUU1S1Z3cDZjQnBzbTN5?=
 =?utf-8?B?OHA0Z1phckxOYXpLdGdqcWN1RExUNW5mckZvVzYyZDdOZkVKWFRzcTErR1Jl?=
 =?utf-8?B?bzBkZkFORW5GM3FWOTB6bU1xb0twUUh0WjJ2aUxSYUtkcGRjVzBtcWhQWFB0?=
 =?utf-8?B?enVBZ3RuelN4dlB4dW1aOTRmTG13TGNuSmEzQ01RV081U01nc3lNUk5MZ1Ja?=
 =?utf-8?B?UWJKSFoxbXh1bUtsWXc0di9tWGhDa3FYUnQvdnpvRWtUMXdyY3dPWUowM21t?=
 =?utf-8?B?SFNNWlp1cGdIMjNnU3h0VWZPcVU3OEQxaWduRkF0eHVjSHBPcWxpNXFscWlN?=
 =?utf-8?B?WnB5UEFGd3NNNTVUcjJ5MzJsKzVjNnczSUYxazdpQk9CV1FIMVJWMUN6OVkz?=
 =?utf-8?B?QkluTEhmUXQwRmJkeFpkQWRJY0w4U0piVWVBZzEzKy9rMHdnbUNuS0tiUGM1?=
 =?utf-8?B?WitmLzRqbXI1ZG5KMmlkMUNwWm9LclNWOC95b01Ia2NOVGVEeXBaWEdwb2l2?=
 =?utf-8?B?U0IvcHpwdE1NeGwvemQyV0VmbVQweTF1WDVEci9BQUJGa2ZOc1RtS29pMGkz?=
 =?utf-8?B?VzBUZlVLeDJnZUtzQkM4RHRhVWEyMmFweVlkcXFDcVg0eHlaZEFneFlwUmxL?=
 =?utf-8?B?Tk5IU0dyVERmT0xDNkJDMDU2TXg3dWgzeDFkcmJ0YnYxd0tyaWJYMi9YWEpn?=
 =?utf-8?B?S3Nma0dMa2ZoaENyWHhaelNEbGw1dW5tOHU5aVVYS29UVUxLcFA2bFlTdmNr?=
 =?utf-8?B?NHJpMWlsM3FPNlBhM0Z0WXZVY2dUVGdZNmRQK0tSMy9RWmN6Rzg3ODlYVVVy?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3657f1a0-66fd-4f44-2e6a-08dc1268d858
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10639.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 05:47:49.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4awRMwS1KNlbyILr4iUkC4yYN99bsT8WABxaxsIRv0lC7EJYKk79izfY4N4V4Au6RmOber+jYVWdMygfJ3isF5TkRueP35xjN3JDbaDKyd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVjeYE4yvY54a3Vk46UMWC7XizB8kr5CgqcLv3tCQnM=;
 b=IQWcCWdxepRNYIH3C8trfm3Vv6eHFAfJ5gDP2ukoshr7X+1agvyK3+Et6I1xAOForoBCdrh2YtOI9kBa1Cux5u+ykV/j3tTw/mCUxytP9OozZSvc2tqu9bflGNXh/eDkdB6Qy1AP59xRzO22QT83m856qCszbLqiwGMFf5pzG08=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=sordcorp.onmicrosoft.com
 header.i=@sordcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sordcorp-onmicrosoft-com header.b=IQWcCWdx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sord.co.jp;
Subject: [Buildroot] [PATCH] package/sysstat: do not autodetect sa_lib_dir
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configure script of sysstat package checks host's /usr/lib64
directory for default sa_lib_dir.
Specify sa_lib_dir exclicitly to avoid host dependency.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
---
 package/sysstat/sysstat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 377396d986..ca05ec50d8 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -20,5 +20,7 @@ SYSSTAT_CONF_OPTS += --enable-sensors
 else
 SYSSTAT_CONF_OPTS += --disable-sensors
 endif
+# do not look at host's /usr/lib64
+SYSSTAT_CONF_OPTS += sa_lib_dir=/usr/lib/sa
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
