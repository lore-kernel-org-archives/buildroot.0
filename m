Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121EDC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABA9940A66;
	Wed,  3 Jan 2024 00:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA9940A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dF86bqU8tSWT; Wed,  3 Jan 2024 00:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABE6B40A96;
	Wed,  3 Jan 2024 00:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE6B40A96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55A281BF977
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28E2E40A66
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E2E40A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHFL9k8vSWn3 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:28:32 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::703])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0E6740192
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E6740192
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT3zcJaGcCobUCOLiYiDnKPA17NpEcEbAJBME/QFT5I/yfZHdogkfBzQqQP95xmLABMo0jAkmu1tzZyGN9dJJWnEfUcQLMRIi0KHbClcihFsYpZhIByVSNt5BJ/+fvhH1seiL1d+vuBrmnmq+xf0jGzOeOcoEoN8AaPlZDrFOmn5oG4Zv5ntYh4FsraTS4HKamVoD+CLhlV859HMQxLWmn8p52Ld/qudtG3gKZGcOgXLrVb/FHozpOJANj67vM/6gH4USnKKy0m/j5w0KGH24GQ1+FSJZPV08qjWoUdVAkI253je0blDGvVlxQZYg/Y28TY/DrUk5gIPlvRKbiv19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv87gjdt5twGgLeXMJRXrR0FvEXr5OCBSHJUBptqKdI=;
 b=V8lXnQYoPBLUvcomeVwOAWqCv2mUPcegQFY4SaphvAXP6rFUyjtzBEv4mcJG7LEidrZXif8ujRs4W2lltSqw+gkjflrA7sXf+cBlDdmlOOIawBe45fSejSscIoNwCvsy5ic7BBoGW+XpLs7ndMDnb+/GoH75JtIZ7mnjBi6rTD3/slaeESc1tfp13J6El31VQkFic35KMgbxvJSpSGwjeDR6jjGtDeKc+YbeQWwbDUbS2oIDAuy2LSNZNXB4DZG4Y/M+rWSrt4pHMw+EuZXpqlJdh9W0yql/9Ng5emHRtvvx/sfYVEEHPUNw+nJJR3TeBlUR4+b7Jbd3qiFwYChCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6346.namprd10.prod.outlook.com (2603:10b6:303:1ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 00:28:24 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3%6]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 00:28:24 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:28:07 -0600
Message-Id: <20240103002810.1055951-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: CH0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:610:e5::8) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4d9971-67ac-41a8-b751-08dc0bf2e5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZcdF39pmj1ttJc9IrQWoZJ1qVUQbAv5hnwkYyIhwS6ov/CseBfehvX6zR3LqtNizoLRyG1WqPoffA7gSVMmUgsuu119eoqvjLEM50lPYBv+OHFwQnMDKk2jD1r+Fs+IiDZR61BvZXByP5+kX/CKxgEAviP1BEsWgS767sC8fMS3iOH/oUhnAgLwumVazWFaLl+6WVKYC1tqe7Gh5H4HLcNuWNtOwQkAjfLaLqRJYhIWOCw3+NFFed/X9IKIBqXp26VAh+EpWf45w41GOE7859qIoipYZQQWA8cIrIiBY1lsUuY9oUpiII4VuooCv3Wro+ASkEf+NeFXLOkLKo8QyU6dIyuUQNUrqHnRawqKAERIXYGWWSJXGjTIElj/IqzngHz/96WJGr/hszpepIQgmHcR9oZ2258mly8Naxii5+zw5AVkJ2Vat9syDR8RNCJ0FSweU9GMkKVzjxOzsjLtB9wVfqZffMOGMBgVKIjbCnZqEPR9vuEr/9TEgqSlyHWqsx3yDhOlAKGd8dIUD6tptKWcWFEuPZx1hHrHpR6aKOeA5Oo7ttZeLECJHtbTv0usgOhbnwG+q1SCoJbWjSE973SNoJdWrMDNmCsZ+pTbVpBSavOeY+gVLYRCFGus7NKF5ZtI+Oi9q7prKI8rGl3MZut5mV6lSMYAK67dkZRZtzIol9ZJti7UtoPlS/FXayU2N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(346002)(136003)(366004)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(4326008)(2906002)(8676002)(8936002)(316002)(19627235002)(6916009)(66476007)(66556008)(66946007)(52116002)(54906003)(2616005)(44832011)(6512007)(26005)(1076003)(83380400001)(41300700001)(38100700002)(36756003)(86362001)(6506007)(6666004)(478600001)(6486002)(38350700005)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l6h3Kem9qEkDs0bbJYth3+0l1louA1cI5Gx72ZBy+UeHcWnAd2Fk/LtfPfdW?=
 =?us-ascii?Q?CAwgBNUTpAN2QieAOZ7ClZjFUz1Z1qk2XbAbTw4TVuNUQo24ICHVxwtXhOT5?=
 =?us-ascii?Q?aWva1T4UEKWwUcUqh5XW3Cn+U/V1AUI2CVGjML8EZqTbwGjUmmS6bEn0kdf6?=
 =?us-ascii?Q?MOe7SVms8b844eBVGBCHcKQ/t4zbOqvySmAOqb9Ud3G0nvCBDUSXaQBcXA0h?=
 =?us-ascii?Q?spVuk33FN1wUsTSrU2yivk7G9HOAiMjpT1NEshyzRDumEnwEPCUBPUcr6jvY?=
 =?us-ascii?Q?sRlfehWa60bUoaot/7Y5Vo3PYvqFfpHLwVCInJUnDDbzWjEiwECX4CLQEjRx?=
 =?us-ascii?Q?twqJHpHJKtc4dNOujaVZC7BjKeS4R4sP/QzoUQASwPRAm56aRdaymVJy9SYE?=
 =?us-ascii?Q?aQljdAk5WOUwyki1bywvsM+SrsWs/W0xKFhD4XvkQDy5FhuwrvOy0GcmGgr6?=
 =?us-ascii?Q?DYVhQXYZbOs15/7das4UjjSezkZS7vj9ViJVS0B8hu4FrXVoKPwzvjwNZLLa?=
 =?us-ascii?Q?q6Y3CwJtTnWI/eUVS5YH8UyOVceW1wXqpSdjvz6MaCfFcS83dj0mV9pTGDFR?=
 =?us-ascii?Q?69b4J+pzTK+n4YNFpJvD83mEFd9zuUtZ3o3teARPwW2QZS1e9DRz2GGb3i/A?=
 =?us-ascii?Q?7FQNO9ASKYnZ5U8FZcHCVEG1PVqJLy3fadRumJm6/Y5BfJmizaY7sYeMTEDh?=
 =?us-ascii?Q?sHKH031Py/YUAsP2+iawm2RunvHr4ObAlfGBdrEnPaafc64OGJQgYtaqatIT?=
 =?us-ascii?Q?vLlT+6tbQOfoD2Xp99rHwUSiQ1xKPHA6AIR+s1cWgsQzWAdiFW9LBubCRUVY?=
 =?us-ascii?Q?Z5SHljJCZ57z53b0lBzwRWKHL2XPa16F9iM71kstc90zC3LhtT6lvMuBP5Hm?=
 =?us-ascii?Q?omojBRv6WxLlEOl6scNBGgh/VcbvAxiH9INVasiepN6WPaurwbSH+kovphuH?=
 =?us-ascii?Q?qkRn8TZsRWrHbB2x+eVoIeHgDGppBkYey0pjo8T3nB/yjCD+DIp5KIdfqv59?=
 =?us-ascii?Q?YGU6hxowGVCiiXIChxZkIvDRr2/Zz/B98iKohRDMOOMOjoiXfh6j4QUX1IVw?=
 =?us-ascii?Q?98wtJHK4/uMuDeJuBNInPlStaxgFc7+mMVCVNpmCoPdu4d05R6/Qy2RPHDY8?=
 =?us-ascii?Q?UYiPVfCJG7K+LKb8NAENdAagrfsWVwJ/iH/nJRcm7VU84Li9D8CG5nqVLa+X?=
 =?us-ascii?Q?Pc/WxGfcjQLJXlwAJnKbquUaBjASelDr+HJW5TsaaqEZ/OeQLl/tW7InQygg?=
 =?us-ascii?Q?8Vx1Ykdtm0Go5ZYvjTkVCGzK41hZQhZ4RQG8YxbCHJiJLdMIaUz/OuSaQmiX?=
 =?us-ascii?Q?Dgfb4T1dWqUr/1meJO3AmffUjHYVdz2lLt9/j0Lb6ZWUALqMVHFv0mHlYQQE?=
 =?us-ascii?Q?yqQi2BeOzUf5ks3CeM5cz8nTDZ4BYiMwgA7QmUF6MD7WKZuiI3D39fzQKf6M?=
 =?us-ascii?Q?awC0BGX23pauIVAsCCSbj3JNXnGbQtgaS/YsTo7KSIPdKXCTyB8DclvhzOL4?=
 =?us-ascii?Q?okYiXotrSXU1xBzIGSQO9hA3hB2whRWo0ZNkj/sRIcNpIKDhhL3yX5kSvdL1?=
 =?us-ascii?Q?+sg1wya6e8xt3ZXbAWsWyv+U/QvSCGmoSYduZ/CsUELieoHc3CDmL6e1f/tS?=
 =?us-ascii?Q?iO5FwCjMoHuZnWo5aGdBCYQ=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4d9971-67ac-41a8-b751-08dc0bf2e5cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 00:28:24.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynugGNEtpP1goDU9rXrLsltkxYL271e0FYZfd+Wu8xMwiLhu4L2fq/EbY8BWUt+P0VLnPEavq7uvjDT0vQqPlPrbU4R/r4kQXbTUhO51rJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv87gjdt5twGgLeXMJRXrR0FvEXr5OCBSHJUBptqKdI=;
 b=VXz0hb5sR6aUHVdwZGpOWJH9RYVytRKL5wa9YZQJoH13LNLF2L4C490NC8devzXKW32w5wxaf43tUO9KNuqGnwT9soU2CsHzWGByQO0uY99m+V9aqvu31uwTimaRVbsgjF8J5D2F+Y2GU1/G7c+MjU2IwX7WyUl7veIV/pD4jkk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=VXz0hb5s
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v2 0/3] Add external test support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
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
(.venv) $ BR2_EXTERNAL=`pwd`/buildroot-external ./buildroot/support/testing/run-tests -d dl -o output
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


*** Notes on V2 ***

There are two other techniques that might make this "cleaner". The first
was suggested by Yann in review, where every test was discovered and
soft-linked.

A second option might be to duplicate a directory into a directory like
buildroot/support/testing/tests/external. This directory could be in
.gitignore and removed upon a clean.


v1 -> v2:
  * Still non-functional
  * Split into three patches for readability
  * Support for multiple BR2_EXTERNALs
  * Remove conditional copy to temp directory - always do it.

Colin Foster (3):
  support/testing/run-tests: add try block for indentation
  support/testing/run-tests: run tests from temp directory
  support/testing/run-tests: add ability to run tests from external

 support/testing/run-tests | 164 +++++++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 73 deletions(-)

-- 
2.34.1

From 1a2a472ec77173101f12a27b28acba688dbc37a6 Mon Sep 17 00:00:00 2001
From: Colin Foster <colin.foster@in-advantage.com>
Date: Fri, 22 Dec 2023 16:55:32 -0600

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
