Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FCFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 10:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F611611FA;
	Fri, 11 Mar 2022 10:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRw7tNr760wx; Fri, 11 Mar 2022 10:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB54611CB;
	Fri, 11 Mar 2022 10:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD22E1BF392
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 10:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCFC9404CA
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 10:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ib0SVAp3-9Z for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 10:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::61b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2F884034D
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 10:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mf4aIUaoJz/98+o21vSNv2NVmYDn1Yet+ZxBOF4W72BQVn+eAoAYfy9yezREzXR+Bbh6fKWOu9axhbdib0qtd+zQvindAgjg12d7cK5GFhvGXpYXfl/jq5EkMNXsUYDS0vgLhUPgCwbCHzHWUnv2DZxMjOCUnMs+b8Eb6lYj/rc3uBg2h0ir1dTJ3yUdmsgAjnQujwSf8SfFrmXtPnvuN3CfVEn8naIVua8SyAihMoCRSDDS2IfY8zY06xskTZUxSBODOTtRJ1ta09qDhb23Ejz/TjIZybbbEz9n2jB5OpFuFEABh/m7tI8ccvERh1lwlKcJOikctcH/5wpG7pu4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lvvo4DceLxrsbD5rKMfahTryNeJBnyOkOSVgtJ3f8A=;
 b=bhonzi+bzSLLHEzBQk84qhEF0+XafjebY/xn5aFIxit67xf+f312C/yPiCUTfVUiJuBLXaB/XFeVqkUIU19Z3LpUyCEDIwS523rYepFcf1120jRSc+dVkeLaylxsvhQvLk76/fekK1U9VZ/RfvbT4UgmqfwpnDCAs/OP17hNfx7oxwiqckWzC2g4HP1WOMJaC+iiDf9u+R3r/mHhFtfwQcysYKQdUSPlMFUii1hvgrhGe0INLSjIb8MAv8xsZlN8oKVTcG0eRQYZB6+7OOWfr/S7Wxm+ON+VHtSPDdfLHhe0tfVNUBA8OkMFOYDoXP+qFvMIKkiISo3/jsIlCpgWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lvvo4DceLxrsbD5rKMfahTryNeJBnyOkOSVgtJ3f8A=;
 b=G7LjZjzNwT05fuZoilbDNVBupKA8ffzTwcLfRcWcXFsm0pVv6a6ptaybW/yYDeWTWYjeuh0iCOEjGndQ7CZSpsC2g7GlcMYAvzW0BULDk33o7pyc5co4AN8ZmrvqudsvwVTI3fRc/bIOfOsCKGyuhj8RTYfsCJmE1tTv2+jxeik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 10:09:44 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 10:09:44 +0000
Message-ID: <639cd3a7-bcdc-4720-e587-bc22b431bb2e@theobroma-systems.com>
Date: Fri, 11 Mar 2022 11:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>, Arnout Vandecappelle <arnout@mind.be>
References: <20220309142913.2102898-1-foss+buildroot@0leil.net>
 <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
 <20220310215914.3d26c317@gmx.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220310215914.3d26c317@gmx.net>
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5e32ff-b520-4f7b-0f73-08da034743e2
X-MS-TrafficTypeDiagnostic: DBAPR04MB7366:EE_
X-Microsoft-Antispam-PRVS: <DBAPR04MB73667F855E68FBB8201554A3C20C9@DBAPR04MB7366.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3CKDywixsGivMM57fkwNtdw1KLBv5DM/R07Z2ZkwLJigx2PHoJ8okJqsPzesxDRluQiSd7BDDag4j4Fyr/2ImRhAvn/5Ox4OBNTdWm5FxldbVwLvls1grbYEXm3Gz1cv4j4y6+ZWWVU/vtpECatm3dKC08VxyUH+tBjNtvYWI1ARwvMdCHtjmAGmkCK54cCiLD3wygCU2aEuAJmn5aW7DhDoGrJGvCAIxYyuZ03MmWBn9S85dyA41gHxjuQWlkwQp0IBkK5fM7GepPqOrVseMX10TqM62+HaGtQUkS2FPoMHeWkP5OKxc/YZcnYwTWdPPKjvtU7j0bDIlPDKLYuYl7+FIeJAfax4QhQAMTMgelnutMCeMLHtNJSOeJ7efgfFg8Yc8BjW4nEnRiXmkklMSWIDr6QPGP5qP5lG2By0mPUIaM52hFClzvCROFxrL574+bTtIK26IodKV6J73SVS9K6RTcR4/B/O9BNOFrdO0XW0wyIB3GJSR5r4rXCWHE7cIrEpRaHOUxs6JJ8NwlI4SrB76QGYE4Mz2c5G+EkjoeUE9OndJ1kNo/cYrJOYli1X7KziqwuHHrZfDMkz6tmf795ZXaXqXtSjngo0BbkXOdRdfnPKSKh6QRiJ2zff/llFR/O80hzT85eVidL13zIqX1O8ul7b+wmU9o6PrI3/GowLs46VVs7RSe0DzKta3eBjcAdzIWyHRyRpDGX2NCCxfCZYKTZrJcp9NuHmf09UHb6NXa7VQeOrz68b1Tb+b+aLFPEid0PHs+Sco31jeNyMUIcoWGewap45R9r0RpEEpsqaLtBwHrRjzAUIYlwHCpS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(6512007)(53546011)(6506007)(6666004)(4326008)(6486002)(66556008)(966005)(508600001)(66946007)(2906002)(8676002)(44832011)(31696002)(54906003)(186003)(31686004)(2616005)(316002)(110136005)(8936002)(83380400001)(36756003)(38100700002)(86362001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZvQzVrNzFTNEMyN2FnQldxaWtzWVgzZ01FMi9VVG01MXY3cmtZWFRHM2g1?=
 =?utf-8?B?ZE1qTElqZTJQTDFkMGgrRkU1VzJiKzhIbUsyYTZwT0ZMOUo0Y0VqYU5yNW5U?=
 =?utf-8?B?c20ydW81alNFTm5hcy93NkJSZzlyNTRPQ0R2UWJrREpxUDQ3bG54QklnVG05?=
 =?utf-8?B?UmovcytnVjgrTDU0MnV0L1RxYzhLZlZkYXlmSHhjR2E3UCtIR1ZTa1o3bFdy?=
 =?utf-8?B?aEFCL2JPZjQ2RU1RZkNPTGFpUGJFblBGelJiVWc3MDFoci9UQ1lpSDZWeDlG?=
 =?utf-8?B?VTJSQnlzZkFRYmo5empKeEovMGhJVHNJbGV5N3hqN0RUM3BLdmk2QUU4aFJC?=
 =?utf-8?B?VG92dnEzS1RXQlVXelpIdEpyY2NmMlRNclN3RGk5ZmtRRFpYK0dsUG5BcHRS?=
 =?utf-8?B?K1Bndmlia2d1QW9JUnQ2RWVrb21KV3dXOUNzVEhKY3NWRWhPd2hsYTRYR3VW?=
 =?utf-8?B?SVJPbW9YUWFBWmc4eGg2VHdQZ0dncjBiOTdUcHI2c2pXNkdkUWRGa2RmcDlO?=
 =?utf-8?B?dnZkVjZFSnNPM09CWEVaejFPZG8wNi9OYXo4UGV0UUd4Q2FMSWN6TU5CbEJh?=
 =?utf-8?B?MmZTOXRJdEE0TkFQaWdpb2kvaGtkcE1ZL2ZJNHNpc3JWVEhHalpuME5PbVBa?=
 =?utf-8?B?TGR5THdBM0xnTjFnRkVnZnZIcmlRL1pUUS9GYUp5SDFhYm5idWVUZlRzMWgw?=
 =?utf-8?B?VFFPZ0RMRXBqaWJSY2VjaW9QRC9KQVptZlFVanlrd0NiL3hTRTNaQlhGb2kr?=
 =?utf-8?B?V2RqR3UrU2dLMnI3dG9PSXczZTczRkZmY2NNdVo3SFQ2Wi85c3o2VVRtWGE2?=
 =?utf-8?B?dXlHenMyRW1DMHJYMGd0anBVNWxXNWlUSWRhRWprK0J4MlA5S2RLK2I4a0xW?=
 =?utf-8?B?cFF2dGNOaGNqNlhlYlYrazN3YSt2VmZQSEI5Y2V4R1hjYVAvZkpSU2NyUXVU?=
 =?utf-8?B?cExWblJ3dXJmdDZVQ3J4KzJhM0xVWEdiWjlYMFRWemVmeko2OGIvdENDTU1B?=
 =?utf-8?B?bjg1eWs0Q1pLRGd5V2FNd2lIaTFKWWpjT1V5VlBMWjBJSnl6dm5IVUtsN2lj?=
 =?utf-8?B?NVMyNUNvZmhLcnB0ckJ0RGRkOFIrQ3BsVzhzYWNPNTY5UU10TFZMYnVtZ3Bq?=
 =?utf-8?B?QWVJVW1PVnVER2ZJakQyUjRlSllJTEc2ekY2bUN2S09GcUNRSHRBRTZ0OG9C?=
 =?utf-8?B?bURmRlBnb2hDMEJOdGxYZTg4Qm5NdUNOSExhVHlSd2YxcjBTOG9qYm1MKzFH?=
 =?utf-8?B?NUhISnViSmw2by92SUYvZzN3V3RoZUZrelZRQ1JRVjl3R2VDb2dWRCtCaDNv?=
 =?utf-8?B?c0JzRmJlSDYwSTdES09FV0pZSDYvR2tKaHBJcnNJdXBJM1dpc29Bcis3K3Vt?=
 =?utf-8?B?WG1FWDhQVGladTFsdzN6VnBjOUlzRGJvZ25xY2pOZVdzMXhlQnNZM1VBWlZJ?=
 =?utf-8?B?Vkt1MTNZcWNuRjdTcUtVN1BkYnQ4eGtUK2VINEZySHFiZHl4cmIzUlpBa2Zm?=
 =?utf-8?B?RzRyU3Q4QzNmY1RjaTQyNEhPdXZ2Mk9nRk1TZWtkSGpBYlFKcXRvdHdMOXRv?=
 =?utf-8?B?alNrUkQ3d2pIOWZnTFAycjdibWt0NE5zNWwzZTNuck0vd015VEZ5d1IybXpK?=
 =?utf-8?B?eUt0VDg1cHNtWUs4allsQ3JKc1QzVFEyRW8wL0tlZ3VBUE4rSXI5VnVYZmxO?=
 =?utf-8?B?M3pzRmhOUVgxbGpueEJuYTNycDVNamRMRmZKMU1XTzZzU25IbVJ2RnNTVWhj?=
 =?utf-8?B?R1hlTEl0WEJpQndUVkRvTWFRSGV0V08yaWJiaWNjdjRyQTNYYTdEZnFLRnYr?=
 =?utf-8?B?Si9UTVRIVVpkNkcyMUxJNDJTWC9SMnNHOGlwMXc0Ny9SanFlVU4va2JtQlJG?=
 =?utf-8?B?eVFFd1NhY0kzaFRWYjVGa0t3MXN6S21TL2RuT1hIQVk2TTRIeE5xdkpoTlhG?=
 =?utf-8?B?UUZEWGYwVTE5OE1TQ1UvdWI5QjRqWW1MaXN5MmptdS9UU1FhMDJFREJRTkFR?=
 =?utf-8?B?ZWpKa1dTN1QzdExoVlh4VG0rYVNuZWFQZFNHcEtNaURydENCdkZ0eGZ3K2RS?=
 =?utf-8?B?emFNb21jK29mTzZ4aEp0dlpmUWk0a20wQUdQQT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e32ff-b520-4f7b-0f73-08da034743e2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 10:09:44.4359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTGDWDjC9OrYNARmilCA0O6ymUw57iAC/BhEg5EOSvRlTraEzlkUb9m4QIpamje1/sQ5wDNGYCk2cNkQ8guxm34gFEVCQsZ6JX7VYpVWt0JVNqV6AvfgknPDBvpp594U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5base: fix CVE-2022-25255
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 3/10/22 21:59, Peter Seiderer wrote:
> Hello *,
> 
> On Thu, 10 Mar 2022 21:10:36 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    Hi Quentin,
>>
>> On 09/03/2022 15:29, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>>
>>> This fixes CVE-2022-25255[1] by using a patch provided by Qt for 5.15.
>>>
>>> The patch fails to apply because of a conflict in copyright year so it
>>> needed some additional handling after downloading.
>>>
>>> The patch file was added by running the following command:
>>> wget https://urldefense.proofpoint.com/v2/url?u=https-3A__download.qt.io_archive_qt_5.15_CVE-2D2022-2D25255-2Dqprocess5-2D15.diff&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=BsFMymMtfNBibxvKyvdJPDHFdo422rhoYyW1yKTW6AhrH0dKs7xDb-efWy6vBNAT&s=-6cfccEeLqsLUibYZcNYVLGYEN_CxlShGyX6MzeFYX8&e=  -q -O - | sed -e 's/Copyright (C) 2021 The Qt Company Ltd./Copyright (C) 2016 The Qt Company Ltd./' > 0008-CVE-2022-25255-qprocess5-15.diff.patch
>>>
>>> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__nvd.nist.gov_vuln_detail_CVE-2D2022-2D25255&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=BsFMymMtfNBibxvKyvdJPDHFdo422rhoYyW1yKTW6AhrH0dKs7xDb-efWy6vBNAT&s=qywJU5cDeT4YRPIoWShq1zOH4t4wlihP8FgpBlCIvoE&e=
>>>
>>> Cc: Quentin Schulz <foss+buildroot@0leil.net>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>> ---
>>>    ...008-CVE-2022-25255-qprocess5-15.diff.patch | 56 +++++++++++++++++++
>>>    package/qt5/qt5base/qt5base.mk                |  2 +
>>>    2 files changed, 58 insertions(+)
>>>    create mode 100644 package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
>>>
>>> diff --git a/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
>>> new file mode 100644
>>> index 0000000000..dfab92a9ef
>>> --- /dev/null
>>> +++ b/package/qt5/qt5base/0008-CVE-2022-25255-qprocess5-15.diff.patch
>>
>>    Please make the patch something that approaches git-formatted. At the very
>> least, the patch itself must have a description of what it does (i.e. a commit
>> message) and a Signed-off-by from you. Ideally, though, you look for the
>> appropriate commit in the upstream repository [1] and use that instead of a
>> random diff. In that case, add something like this at the end of the description

Not technically a random diff. It's hosted on an official Qt website 
where the tarballs used to be fetched from.

There's no commit log because well, there is no commit log. I cannot 
invent it :) The commit you point to is completely different from the 
diff in this patch, which makes me uncomfortable with stealing the 
commit log and apply it to this diff.

Also, there is no commit available for 5.15 branch (at least publicly ?) 
yet.

See the discussion for 5.12 LTS branch:
https://codereview.qt-project.org/c/qt/qtbase/+/396020

Specifically:

"5.15 has ended up needing even more path corrections for helpers. Will 
likely be needed here as well"

"Yeah, I have, so far, just manually changed tests for 5.15. But there's 
quite a few and took a long time to get them all, and it will have to be 
repeated for other modules.
I was thinking about this too, but then, changing the test-runner may 
break other things as well. But it's worth looking into"

and finally, this patchset was abandoned. I quickly checked this 
person's other commits on Qt Gerrit but found nothing interesting.

I could have done a better job at writing my commit log and give all 
this info in it to explain why such an unusual patch should/could be 
included.

>> part:
>>
>> [Quentin: backport from upstream commit ab6915f0efb12cfe48d1f126f4a828212f853ce5
>> in 6.2 branch]
>> Signed-off-by: ...
>>
> 
> ..or wait until [2] is merged and bump the qt5base version/kde-git-revision
> (but then only applicable for 2022.02.x/master and not for the older buildroot
> branches)...
> 

I needed this fixed now and that is the only reasonable way to fix the 
CVE at the moment. If the Buildroot project prefers to wait for the KDE 
PR to be merged, that's another story and I completely understand :)

No hard feelings if this patch isn't merged, I understand it's not 
really on-par with Buildroot policies/best practices as highlighted by 
Arnout.

Regards,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
