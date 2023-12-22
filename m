Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C632C46CD2
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 23:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45F340965;
	Fri, 22 Dec 2023 23:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45F340965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLqdf4Jhb9SY; Fri, 22 Dec 2023 23:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012EB40915;
	Fri, 22 Dec 2023 23:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 012EB40915
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA40B1BF42C
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF8FF40915
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 23:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF8FF40915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3O1f8FiZdKgg for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 23:23:07 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::706])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E38F1408EF
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 23:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38F1408EF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSmv2CVO+EFeP3Q9D/7CkyRoR9CbE55sKlyl5d3EYHgeTgGMCSv70NYOnj0qkPniEbQzn+pkHvI/f9F2L05bqi/LKQyusksDtAtSz7j/tz/ugwaELCo7hhhbVGxX5afmjGbLPqc/RNNMbT42tnAoEhyrNNRB4+BwdnptgR2TPuUIV31R70TXAbj3wcf2FXLogi7zmfB/8EL6YB/3W3ZfuvwTeQinJNLKc90h0xsL/fUi2W/Xjjxboh+f9jCyEeyhDDlKWOANzFPkxy4aY6s08QpuGFqP5keTOFqeaIsi5Agz1KARDogGyyz3lbIsvuYxUAT/zBQpC72QpcLseActwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nt9w6a07zVwlfqjQmQiLXjsdybFMyW4qVX2HOLDuG0=;
 b=OI4dlw8Lm7b7Ej2ybKUGu6T0pqSGRxwi86e08tl+25Dd/YzVJf1VScSJ4xOwnCphM/qXs2JgLJ9R3wJdhDAYgjG6f8wKWJQcE9k/oQEckmGdHlPo4QoAbgGkOJdNM7mNyOLoDKyJPfRj3oXiWTnFkHIBdVRHugjYiF4H3opJyM8V0qRD26SFO1daz7D6iVudMyfcJnAPw9OW1qkeSyD/yUC8wI3JuFxqDriStncit9tiszPSPE0mDrJpA+Oh3vDNLP+r0LfTLXskyp97AN+IBjLNH+7sRmQiGRWhPg/is5Ol2RQUwO1+9iQvjKf/A1lKE6hUMLFTgFepy7SxB6IxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 23:23:02 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::dcff:e0c0:7c46:4616%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 23:23:02 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 17:22:50 -0600
Message-Id: <20231222232251.12786-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CH0PR04CA0053.namprd04.prod.outlook.com
 (2603:10b6:610:77::28) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|BN0PR10MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: d78caa71-7d52-4960-ff0c-08dc0344f0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ilt+Q3jKW216r9wPJWJqug1zOnDFYtbgI4ck3qpThAeC/vClt/lNrnQMScZlbuZ2MtDq80hTrEo9zBui17qNvaH3RZCtv3YYWN8PYMl3rwD8RzdrN+PIG3L4gs3VT0g0z84RM6N7cu9GzXosYrbHguxqAzYYOoYBdj5UwByNQoym0DwVJTmqwUgdQQX3bsTL3thVve1rY5Ewdxey1strHGpcBd+1x632EL251LGoz1kiHAbsoE3RsIvI5S9vJyuJpFN1ib77giVE/ebe5cBqK9suqW5QnX9JZcnRuru/TAc+tcg8kW7dQEnsH/oBPUpKzbq2gyWYzx9VA+wipkq9voaBGD+EliLc5rCXfdyWqMdmu4bjypSNNxbSI0YTP5lZK1VG8o8NABAawVaGhQcTyhDoRY5lynmiybMMGyy/Cff2meEkfDU8C3mrk+ic3YesovxXnoFS1knVG7lwA4BwKVPdBndVHZRVtatjzZEHlJAuju8xd6IuBDSs30x8XcokaGAiz62qBhl2H2s0MWbJZioBuTxB2mgnFljCLEgogq9B/mJ0fsYal0O2KLowsTCE4D52z8s3L8wPma0ZolW9TDK+YuxjnSYA5WU7scmcmaQ3rIlUokCdYC8zrmGmFDAEAenfy1eKWlisHxAObac4Aa+xOxANj0GxCqN+NEwVxAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39830400003)(376002)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(4326008)(8936002)(8676002)(6916009)(66476007)(316002)(66946007)(36756003)(2906002)(86362001)(38350700005)(41300700001)(66556008)(38100700002)(44832011)(5660300002)(478600001)(52116002)(6512007)(6506007)(6666004)(26005)(2616005)(83380400001)(1076003)(6486002)(19627235002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iSo3aiSt6AL9RGfeaQA59fS9opIw/8vlga7x6FmPDSJZsyPGUuJDXsihsBaB?=
 =?us-ascii?Q?sAtOiGj1l9Hsk3yMLF3OL3dVz1QEwAvBfPCx6060gpLuXXGD04dwaYapEgs7?=
 =?us-ascii?Q?AqiBkTVlLbvMNcQxgX5YOljAbqkmZpXOzlfoeIO3fHI+vT9SIKRqJNdhP7RO?=
 =?us-ascii?Q?1uKjGZ42m5XgG9w+a90Ri0iCgia870kK7r88k93/0jGhIJwDCH46s05VjDWv?=
 =?us-ascii?Q?0V6o5dDyDrnwnALvGxppv6seg4QW6tppds/odQL5u8PqzVgZe8vtCc09FeYb?=
 =?us-ascii?Q?9Symhi4jxkNDTFKAqhstchyCr7ybHdPrd8ECMp1vkcfkF9y5L5J6/HbxXE9V?=
 =?us-ascii?Q?ZB+EpTbG5qY4dEpU4yenoHLBH5p5lry2U2foHgWHmo9VWFcMkD2VjAr1kaOl?=
 =?us-ascii?Q?c9rOfPewknkzcgKRdSqnlYP4CRGqeX4Dd/jaZqVy4DWfvCo3ZBzstKk9yFAG?=
 =?us-ascii?Q?td7kMduD5bopGB57zfmiGe/ZssB5c5OO6BtlLDx1AQFVNVdhb1ixmbS9p/rD?=
 =?us-ascii?Q?U+vPEg8ycYdMFgGWdqdoWEBLyZ+O14/3fi+hCY7ny/PplZpKsB1AzmgegGJ/?=
 =?us-ascii?Q?RXWaWStJwReihZ6OxXodiinSwK1p4kUPNMfM+5FRUKEeIPbLVn4H26OS2D2U?=
 =?us-ascii?Q?B9uNl/HU9bhJSWGXeAU3q9jdAukrn1ZlrBemrP8QbHJMHSKcmVXeEa4gqBor?=
 =?us-ascii?Q?eNFEB+bH7IOrmoURF2U6rrSF2uNZMKpuZEFV6iYbxv5HqBOC4+Y+zQ9Symo3?=
 =?us-ascii?Q?ifn/IIvRP9idSMjY7zmx04maVbEwzZHt2HtCrdm3h2274Eu16mvzMFdM9GwS?=
 =?us-ascii?Q?4VT/xfiTPigOOyKtu1ZERze8M0g53uJ4V/TqT0by26R7iWFwiHMkCOOIS9+V?=
 =?us-ascii?Q?4SWdVcmyGTJJplo0ZCpJKcVWkvakhUm223/BPoNik9Vl/kytcMZWibFHbJUG?=
 =?us-ascii?Q?6VGh8wWJkYcDLyHB5TEkrvCHx5irak4UryxZaMK/TesAUAlN0JublbjySGEb?=
 =?us-ascii?Q?/mGv1jqsWx4L9FgHnUf2VC6HWpMSx/UFhiuaFFgz/6EGkuIwzK9HAY8fGPkU?=
 =?us-ascii?Q?lISN5jrLXbiDNlffFlFsJ8aeHaJSvtfCOQFvhtLow6Ldh4XHsARgcfOo1iSd?=
 =?us-ascii?Q?RN0t7drMf6vFMpM+HKC6Ey0LpJSQUtZnFg3aSyWT1i+EA99Fmsd94UylY9eH?=
 =?us-ascii?Q?cqqZh/FC8NxQ7RsWhwhAArLYcXhEZxW0ztL5zNX4N4KlywmvoDM2D6qYMZF7?=
 =?us-ascii?Q?TWlyuC4VJMx+Qp9Ldzx2gd4ofo9m/lj84oD9E8sw4b2AB9QHuDBDhPt5yGjy?=
 =?us-ascii?Q?uqDXDIlp3RwkBpHYIgVmGX7sBxIiLUVVvyFGeKqqPJWpxL6TONUjN2VQwLfI?=
 =?us-ascii?Q?dPRQVSIm/2zh3wgRXdSggMRFNglT/L9i6TpqnBIWgh2/A3jHmgi3x7rTdrZo?=
 =?us-ascii?Q?9/oOaLUg4z2WEaQCwtZ0TzbrqlJkdnqp74dn9VvI2ddGnOKEZi7J6BNfigor?=
 =?us-ascii?Q?YZM6I/ILuGSmEdoi/XfVIpI2ol1lc3jeUykvz8bJu7HYVH3mktDuMmwtI/cw?=
 =?us-ascii?Q?+0CA0mNRGhLXOabWLGsGKXkyRGk/9VkRyLDNBzuBkbWyubcAvoBRqn3Q2IuB?=
 =?us-ascii?Q?ie+ae/TmqH7+du5qwenFKgI=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78caa71-7d52-4960-ff0c-08dc0344f0d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 23:23:01.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRzwcQPDixlhyjU9kUoNzb2uxU58UkIhvpWqhZVcmFNVEywWoDM6wTo8pqlQ+G3Zf/Y+PY1VYtyPFRRQpNkPCQa9D1uiXt7wrgRJFi2eP0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4901
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nt9w6a07zVwlfqjQmQiLXjsdybFMyW4qVX2HOLDuG0=;
 b=ahK1Zwi6zlznHfHYEF2MXiKQQTZZOYwSzKYbAJxcChznFRLiPK+Zp3vb5CxoPjsZSnkGkzacPgbsOhkB/QZct2E3mlfUEgr73K6K6kMljt8lQIEkI/aDCXOnKuNmue34gzrNfSWHEDgIjSa51YSKBf/T8pLv9ayioJCHZx7lGcE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=ahK1Zwi6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v1 0/1] Add external test support
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NOTE: This is an RFC that isn't fully functional! Do not merge!

Add the ability to create and maintain tests in a BR2_EXTERNAL
directory.

I recently submitted a simple tftpy test module. My current system is
based on Buildroot 2023.02.x, and I would like to be able to run
verifications without modification to Buildroot and without waiting
until 2024.02.x lands.

There were some Python dependencies that led me to this current
iteration, which is to create a temporary directory for all tests and
pointing nose2 to the temp directory. I'm not sure if that is elegant,
or kludgy... so I'm looking for feedback on that.

I also tested this with my "tftpy" script, but it currently fails.


```
(.venv) $ BR2_EXTERNAL=`pwd`/buildroot-external ./buildroot/support/testing/run-tests -d dl -o output_folder -k tests.package.test_python_tftpy.TestPythonTftpy
17:07:56 TestPythonTftpy                          Starting
17:07:56 TestPythonTftpy                          Building
E
======================================================================
ERROR: test_run (tests.package.test_python_tftpy.TestPythonTftpy)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/path/to/pwd/buildroot/support/testing/infra/basetest.py", line 73, in setUp
    self.b.build()
  File "/path/to/pwd/buildroot/support/testing/infra/builder.py", line 98, in build
    raise SystemError("Build failed")
SystemError: Build failed

----------------------------------------------------------------------
Ran 1 test in 4.925s

FAILED (errors=1)
```

I figure I should get some feedback on my approach before digging into
this too much further. I did run a simple verification that the
functional tests aren't broken:


```
(.venv) colin@colin-ia-desktop:ia_buildroot_overlay$ BR2_EXTERNAL=`pwd`/buildroot-external ./buildroot/support/testing/run-tests -d dl -o output
_folder -k tests.package.test_python_aexpect.TestPythonPy3Aexpect
17:12:55 TestPythonPy3Aexpect                     Starting
17:13:01 TestPythonPy3Aexpect                     Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 6.521s

OK
```


Thoughts on this approach?
Is there a different way to overlay the external directory that I'm
overlooking?

If this approach is valid... then why might the test be failing? I'm
surprised to see "/path/to/pwd/buildroot/support/testing/infra/*"
referenced in the output... I'd expect it to be
"/tmp/tmp*/testing/infra/*".


Thanks for any feedback!


Colin Foster (1):
  support/testing/run-tests: add ability to run tests from external

 support/testing/run-tests | 163 +++++++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 72 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
