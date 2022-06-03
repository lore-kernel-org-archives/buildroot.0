Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0278FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 10:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0FE83E7B;
	Fri,  3 Jun 2022 10:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmI4HVjnHwwx; Fri,  3 Jun 2022 10:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2FF83E23;
	Fri,  3 Jun 2022 10:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8291BF2A3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 10:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1678C83E23
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 10:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-Wb0VVKJN55 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 10:44:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94FC983E0A
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 10:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZbmWz+9ME9BgsNbjQaenpMJw02FozenJEWK3e+4ZfH0QPn6dAlofT1kELzEzKSfnh0ui27Gjgwt9jkmqd0znA3UsMc5RbBZkJyFX+QJoJ19Hfqrjq6kRAkTPKxmyHBAGkyxPW+K2bQeP5MISLHfV5HTxmCzoUGC8nXCMHBFk4ZJ4aLLHCOF7LygCXNH0ktqfL66im064BA1whKUbsfK2MYuaN3JMNGHp3avuGX47/ZBQRYw6RKkakQzrBAMpVQ6KCef+fTplpCKVqnM9BTxYpBQBt7ExV7uxLvoqT4bhxn1yS0Ed+z0018NjYKIcqZdltOwnHSOVQ3itYeUq08gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfRiAauYKTq6nbbcTAvVWLKOwcryfqgGgR7vxoS2XIE=;
 b=c32JuyH6TPsMZaZUqM7L35UYV39TLHc6KRzqpBFeMqVNsse7ApN4DhdCmSLIdUQo+WnhLZIcnQza6m5A5HNNcCtAskC5x6tykqVjeuSSpsD2vAvs8KvbEb3ABTABxdhccAwrpVrfTTbP5FlezkfobjJCV2d6eel+yxLSKj3ypZhrNBd3Soaee/tOaOjTg97g/dblQhmZIYG7YBTnLOP8BuZXBEgKdINxPK0OJIVD2npIyWHlsAy3+C6yqjXBF1ZVeouqpZTdbtu05GedtpemttBpBYWNm9WxUT3dI/eSVUAHA0Eqcn6GONeUw7rqwVWDpG5FfFniVPeJ9ESbWFvcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfRiAauYKTq6nbbcTAvVWLKOwcryfqgGgR7vxoS2XIE=;
 b=UVR+LYoOaeBuW4R+UGLt1HAqKlY3xtUVmTeaOhzRda3p33zRVFW3SVshyBjU3qP4Oa6urpCSRpNylPpVXGgGo7DaBWHU8fZEaeucfexzQzHdGVcCg5eHnWYuKGZcHZyzOBephvLySLKjePDGF6P4+AMKXYKPT3nevY3QyPhowA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by PAXP251MB0083.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 10:44:24 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::6d18:5065:c1d2:9d47%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 10:44:24 +0000
Message-ID: <023b9abd171f8d56639f7625bbd7e573a2a2a1f0.camel@orolia.com>
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jun 2022 12:44:23 +0200
In-Reply-To: <20220603114724.5cf56736@windsurf>
References: <084d72797070bdd11665d39bdb0d3df277c88b78.camel@orolia.com>
 <b203b8a90944c5f307c113ba8db8e377a627017a.camel@orolia.com>
 <20220603114724.5cf56736@windsurf>
User-Agent: Evolution 3.38.3-1 
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd7c080a-7bea-4bee-af12-08da454e068a
X-MS-TrafficTypeDiagnostic: PAXP251MB0083:EE_
X-Microsoft-Antispam-PRVS: <PAXP251MB00839D3195E8608D8F974F5384A19@PAXP251MB0083.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVFYR2dz0MOLuV9DvIZpVV+fLokzhQFRfPDHzL4s00CNlrh44u42W/tOH8IyihTGwJgNS7Tl/mrm8Ypi2RO+5+34mYlD53huVCvBZccs/RPKMqrrfVn1p4BgSef0vBC4x4dn70bSHKYnxeT8vSKlrf9jOYsz65WlQXlbkZbrLdcalGIc4usSofcxjHG7IO0zmX6/E56OSDySUUiy3EC0wWImeedddk9HDIaD0gzquKDUou6hT0Y8xVG9AFDzT79u0UqiwpdhXHS6s9ktXNTsSmU4lh5OfqRIPvBqYAoZZxjbBR8ViFRrDg93jVdOmhNNaSASMw+oMxqhpmgwrMzCAA1wLv9JZBRcSy7v3VvR6Lr8gadS2jhdJ2yxYE57vdcnBgyDE1kK5Iaxfum24lxc54lDubglCbngSMncye6mC5cUq/Wlk0jBb2XPBefZdBTMizeHDQa/J2tYczXSFq7teGBs2eSF6fchoN23uIuW7xhix0s9a4zE4F3l2Hj6GlL9zctYJsOpSB9shuVaFToSp3iCS64RsEoRhjytS0VQk7Th2V8SI5yXPyWdnsOCH9QrUeIjA1PboT5APe2jJbQjXYYk7sgflW5d8ZN+3nd4JM7fjVibGdFOT6l6pUYVWs4kaRayxSjSXmAf77iKrQCAygXtRLMbhBj42aRazZ5Ybx5t1aA/AjacGejl8YGpOI0esUxUF53KPwmr8BqmFgfuXog7LSa8ZoZ9tF3XYrc+b5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(107886003)(966005)(54906003)(6916009)(508600001)(66946007)(66476007)(8676002)(4326008)(316002)(83380400001)(66556008)(38100700002)(2616005)(6512007)(86362001)(2906002)(52116002)(8936002)(44832011)(6506007)(36756003)(5660300002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnJKM0NUTEdJRXBHeHUrdyszd3U1OEJXelNKQU9zbk55MDA4OHFtL1pGTFEy?=
 =?utf-8?B?RU5GdUpWcXp0RStZaDJWRVNOdW1sVnEyUW42U0ZFa2dvSE1TRVdzYUVCY1d6?=
 =?utf-8?B?dlNHZHBOSzltRCtkWjluTnBSTVlTM0ZGY25kOXl4TVVpZXNMbDM2L1ZPN3Fu?=
 =?utf-8?B?U1ZNRngxUnEwQmpkYnNUVUtrbUFmeERWY1BPSHNmL2tFb2R1YlcrcGtZUzVh?=
 =?utf-8?B?elBtWjZsWDdkQzhrbk13RW90ajErZ3NjaCs5SGVEOVFUQTF2cDhiVXU2MlI3?=
 =?utf-8?B?VHprWVZVKytSOEhRZXZaR3RtMGUvd2s3a29yZllONEFFaWJhWUlSanJaWW1O?=
 =?utf-8?B?cjRhZWVOd3VQUjNRc3R3dWVBYzJFb0lkY29SNm9jQmpldDJhNGR2SWdHOWhE?=
 =?utf-8?B?cnVER3lPc2xtQkNtMWs2bi9WVFRJbk5lamUxeEJ0QkJZU1ljSU9aeUVqajlr?=
 =?utf-8?B?eU9pR05FMldtb2t6azNQSlo0RDE2aTU4SndWbk9rb1RIVzRDYkh0elV2elJO?=
 =?utf-8?B?SnRZZlNObUFVandSdDdBN2N2NDh0eEVKUWZTeWs1MDUzQjIxUThiRlhFNkda?=
 =?utf-8?B?ZHArcXV6Q1p4NDBwNDNiaTdrUkVRUkp3SWIyeFlsK3dBMllHRFh6RjNGWU9E?=
 =?utf-8?B?TDBpd1V2aCtqTGhGWkdMcGVOaXdBNm1ST3E1Nkltc09wajNZRmY5c2JrWWVq?=
 =?utf-8?B?QW5nSFRUV3h3VmhySWViR2J1RTB3cFZ2RDVEdlI1RVZhcWZHLy9mN2xuV3ZJ?=
 =?utf-8?B?WlFjZXlpOUxWL0hMSjJSNUpKZXF1TzhMUWx5NjJKSnNXR2MxaHJPWmJVSVpH?=
 =?utf-8?B?ZHdwdGg2MVZhWFhvRmtaM1JyQ2xNWHlXaExNdWt0N0FIeG5IMXd2Qm41bnI3?=
 =?utf-8?B?ZXVxaFgwRjlCczdROE8zV25wUWszbUZ5Rm0yckxIRzdmQVJ0ZU1xZjdzNHdq?=
 =?utf-8?B?TE5GUVJTQTdoZG9OWE1OM0kya3BPdEk3MUlabi9DYURxSWQ3eXBYLzluSzhX?=
 =?utf-8?B?R3pZMkk4NFRKb3UyTENUZzlILzRPSzZ6aHZLTS8rSUNYUkdJMnJielFkaGow?=
 =?utf-8?B?VHJkZVl0TTlsR2xpbTVZaU52KzI1bWhWRDUrOUF4RXI5bmMxbTM3N0xmNVVu?=
 =?utf-8?B?amZPaERmS3RORW54WGdjUDcvVlVHYWZuZ0JIN3ZZS01qcXhNVWcyRmR4aVhm?=
 =?utf-8?B?VFM3eWY2OERnZVVHeGQ0eDA5U29qeGh4UHg2c3V5bCtSN2NOdksrTGF0T1Aw?=
 =?utf-8?B?T05iZEpYY09HWE5FN3NEdk0wL04wbzZ6aE8rVi9sL1BYNzRpU2orTWV1UGpz?=
 =?utf-8?B?ZHlVT0MrL3k2aFBaYmYxUTZXQWhJc003NTN5Y0tkRlNiTEpxazBGR3RGM0Q3?=
 =?utf-8?B?VFUvSXBrVzJKeEpTQkR2aDNNZ0Y0Wmp5UlBHaDUvb2lpOEhJYllTRkF2RFVS?=
 =?utf-8?B?U0NyQzhVQ29GaEUxZ1M0V3hKU3BqTmI2T2xEdE1NbTQ0R0pwVGNEQ29pOWJI?=
 =?utf-8?B?ekxITDRSWUxiME1RWVZyVjFlb3cyN0orWTJITjV4QWtna0hzYTZZUGZpbmpN?=
 =?utf-8?B?Qnl0RGJ0akdmWkMyOWd6dC8xekhhNG5qYWh5Z1RIRGJxbHpnR2NrOTZxVHdn?=
 =?utf-8?B?eGc0T2psWVRYazYwUGVJRXp1MGNocmxWQkNOcmNIQVZZWkZFRUpFRkp0SzVK?=
 =?utf-8?B?MVM5T1pienN5UkJVU1lpcmpNUXltdEVKUFZpbklsZGdjQ3J1bjg1eXZ2azZH?=
 =?utf-8?B?ZTZEbHJWaUNaNzF5dGJySGVVaEFXSFZ3UEpwOHpQQ2Y5UjA0ZVFrVXRWL3Vu?=
 =?utf-8?B?NWxva1YwazRTdE82MFVHallBcFEvUzVEQzhpTE1zZFQvZWlPcFpoUW9JaUUr?=
 =?utf-8?B?Uno5Y1ZLdDlDVzZBVTRMRmdxMGh3VS9qN2U1d3NxY2g3RHpwa0R5c25yNG1j?=
 =?utf-8?B?YTNIN1dROEZZNG9RcStsUDJKTUVPVmVnR2FIUjZ6Q2lWVEgxRG10TEhEd1Bx?=
 =?utf-8?B?YjljU0ZuSHI5dXZMSURmVWxKSk5TRW9JcXhkalhDSTltd041Y1pGUy9nZWFr?=
 =?utf-8?B?cFNzSVBaRmxkNDFBOTBjNEM5a29IczMyUkdkcWR1ekNGWDlyKzlUdHd2TTZ2?=
 =?utf-8?B?aVFRUzRDR29zcXJmS09nWVF3ek8zc1IzUENoaFRJN2UyQXNUdkwyWTRZc0tW?=
 =?utf-8?B?emFrTk91Wk4vdit4bUxvZEhMK1YvbDFRNVYrNjNwS01qWTdPRjdqbGdQekpE?=
 =?utf-8?B?cGZCYnZlQUdsOTZ6Z1VwUExPOWJnaE1XVDh3TnkzNmIvQytuQmF1bU1hTjdM?=
 =?utf-8?B?MGZuc2RBQ3M4OUNMbGpCdVFIaHZmRHlUSTFBS2lDbG9sWHlqZ1RaN2d0QnV6?=
 =?utf-8?Q?1Oc39+0yVHKTSMe3xjfpNQWL8Ymbj89ecNRYXBD3Ge/Jr?=
X-MS-Exchange-AntiSpam-MessageData-1: RwIT2FhHyZk84OP70OMMwqLb0OxXNbSNF6E=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7c080a-7bea-4bee-af12-08da454e068a
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 10:44:24.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhYadfQgc+fqHACYPOthq+ESAp5qNRZqs+r0FuBGsIDqHMpEsBpHLjYWk80yGEMMvwztMqCjR/QUtiBfeR9rYwl6uq75k94GQw+3N35p06w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0083
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Great, at least, I'm not alone :)

One other thing to notice is that there libpthread.so ascii files in the output directory, the
content of which doesn't seem correct:

output/build/ulog-0389d243352255f6182326dccdae3d56dadc078f/alchemy-out/staging/lib/libpthread.so:
ASCII text
output/host/opt/ext-toolchain/arm-linux-gnueabihf/libc/usr/lib/libpthread.so:                    
ASCII text
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.so:                         
ASCII text

They all contain:

/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( /lib/libpthread.so.0 /usr/lib/libpthread_nonshared.a )


On Fri, 2022-06-03 at 11:47 +0200, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization.
> Do not click links or open attachments unless you recognize the sender and know the content is
> safe.
> 
> On Fri, 03 Jun 2022 11:09:48 +0200
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> 
> > Hello,
> > I tested this morning against the master of buildroot (with an ubuntu 20.04) and the issue
> > doesn't
> > appear anymore.
> > So there must be some change "recently" merged, which solves the issue.
> > 
> > An idea anyone?
> 
> Not yet an idea, but I confirm that I was able to reproduce on
> 2022.02.2 (just so you know that your e-mail and issue have been seen!)
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
