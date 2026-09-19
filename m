Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAFCC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 10:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78129811E2;
	Sat, 19 Sep 2026 10:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYOBoo8gAdXV; Sat, 19 Sep 2026 10:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA5F681215
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789813805;
	b=bKl3egIN3+NKjJ4LPKoDJ1somDx5Xta7BRBLuU9ExcfKhKBXCqktp62FRk+fRpJCEETi
	 CmtSvsxL6Hksf+gpf42dqd/YhUnl3kH4n0RABdWtLFTsemuCrrOiS1D13iXmJsf9QIIlP
	 ieVq+99xL3SVZAjgfY0qJYhxtHnZ83myocXF27bR3vhcCLB9x5PiAWse6frXz7mnzrdP1
	 i5SDf5/I9WPHXpuqAeY/UBqtbWTcQLOLeWOHNHyvBQcFbnZxxUlzeFRpJu7vxkY6DV/QB
	 U8UTiJJGgJLdDuELJ2bJnNpur84AjkeWCUHJkDLOQRClWK9gcO0xppe1mPSOahH2rRQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789813805;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j2z9FTw2SOV/M3PsGjYLwDjYWebP3jfP7SWgKTejCFU=;
	b=gtlp7cuYg4YSla4SD7Iq/MQs0/eFP9vXr2I6AixmlIwucwn1XtRW9f3fesoQu+eXnIRY
	 jB7BSXZLJaqSYXQlBNeZfxw/CImaYfkNvkbVmWjW8IPAxY33aD0gUrBSvGAQqiAZOSHWL
	 YUPORyWz5xvVzV8otLDntLV+EeBhvGA5FOOkobNcNZM3OBnr435a8eCRMZ/PtMJlwTfXL
	 YAFFaRDpepPyb53MLOrGr6BSyBuMlXHQysUR9HreLCH4ABcYBK0bfOWka4Q1tkk3oHTF9
	 xGKLT2NoNNz9gFamXCxzQfst8l+Z4dmEkyF+K7YW69xxcXfYGEBywJE/8shqdgkbHbg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sUhKFR4S;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789813805;
	bh=j2z9FTw2SOV/M3PsGjYLwDjYWebP3jfP7SWgKTejCFU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZMmZkjPUjTzJn3e7VNmPG9dbQcJfPi1OlhTtM60CWEdG5ZpZGiKdfiLUDdTyjtP7Z
	 9yaJf40w1a9IkBIhADY3pVWt67WsDAY04xHfTKS5fMRzgYg9Y9BfrXYNgQ8JcUyTA9
	 SJ62cL93MGL4fuNi/ZdVOZqRJquMg7oKXATHKK/r/9UKHMID4Y2efEsZXej6yxcn9O
	 Onm0qZS+w7bpzwSqjaFPdrFBJkqx+DSUARo0ePGKeyzpjnW48HTDepFgyEp4U1COA7
	 uxVprxeyIK6NxB8rlW7CiG89O4teTa3Ux6I8MR7nHziBW34YXK3qvF7q5KsRF+Uh8V
	 Bo/sPzTTnURtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5F681215;
	Sat, 19 Sep 2026 10:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5E9333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4463811EF
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H073Ai5KoHhE for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C787811D4
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789813799;
 b=suxdI8oXRSOj0foNBY6AhWqfgs3wUwa/GncBbpAAYNGEphIv4D47PWZIwDy5xd8BoPGZ
 LO2/jNEiK0K7DsDj+NXt2L00yynQRNlfD6AbnZL6zILwVm7zzoOBmbwvbqpMH4Zds2JYB
 uz8zguFroc2qOL3oY8U1AcEi6Z5ks4bGBH66onEoMnOxxYjZdlE8UI3YlSiiR6t0uChfN
 Co4sxqaDVximnZ4O/5ER55RqMGoszTO5GvFOyJsr758FtujeyOYcGR3VWBYvimJyRskTQ
 /kgKtc0nkquBokn4FQ8vlAYESE49EcNfSbQcpN+Ev29sRBz4wA1DaP7QbPrBjEtKykw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789813799;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=KYa7ew/QKV7dIFHoj8/HfsDdmogkhQ9ljh2SYLg7HXU=;
 b=sceV0G9vqSB5HEyzBamu/VpSqpgFfiI0Qa4GoaWux6xPswj9ZYZ6YY7VYsxgyTNPrWoM
 1OQ8TcWamkm/CjR60ujLuvsmsTlRfIehIJaV8XinBVKRZ0Cq+fVNFlUqnkNxNwhBrqS/5
 4l4z+V8midBk17CJ0Cya4BENC0NCHHNV3zuxlFemH6LRC6kiMI6/Zp+cX1Ft6QS3APSy3
 4y1EVlF1pvL1Qwf11PHsUQrD6H7ckvRnMt1rni1Zgg1IoPiG5+GXwD62GekfmvxTffasf
 o3o6LsTs7RlwWzu57DCGCV/rcZe8Add6hmnko2hVxJxB+JEfEY9fcx18X80miUSZP8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=sUhKFR4S; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=sUhKFR4S
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C787811D4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 10:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebiBUgIBI0JZQSI/SVXvPXXyn4kaQM+33JkHKy3TfFTZmRIx0hXAwwhImcWRSqEEp1GV6X4JFB0ClNeRBD1dILucQ7+l/12nmf1Mgdq1e3wGCDEGIDhVo0V4S3b0CdL5dlODJPXXeOj4D7AowJcIVt40peiDri737MXEUbMowGThlVCsIQN7N0DkzJIjV6yUmtKsfT7POTyUxQGvw5Uas2fapnQzajIt7f5ZtqNebo0nHX2RpvPfPqMLFg6sWwBf2PVh6sr7dixxPpX6w24Di6QLn1FC+dB81/+2EX0tMHFvI3PpgAgGUYdJT65w4/y+7EPux/x1SsBwQJU6tQqP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYa7ew/QKV7dIFHoj8/HfsDdmogkhQ9ljh2SYLg7HXU=;
 b=FIE/kUvgWJbla4mi38//+idejG2NCfVWBfY16ogRdO1c9w3Qsuai6vpcLZTuXrcb+5ICYXfkLCrNZa9z7BjGQbgstMJ256ZGLzKim2WdUYEXHem30X3dWlFVUiZXCHsnLTKS9rxtk1HDsq2v9FnAAJxlcd/4717tvZScyZgAl4vprkb4bBN8/yzFi2vq25BS0g16VKhQ9+H7sOKoRaIHmk6xqmDvjfqHMlcbHrFQOFCAKAE1DkyI2QqHpEiOfDf98/WCHT/ZUe0IdKtF1Czb8MLeK04aTEXiWFsXxxKLiw/vdvvK7vDC43XaCe5prCUocfEDr08oY84GCO8yj+N36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYa7ew/QKV7dIFHoj8/HfsDdmogkhQ9ljh2SYLg7HXU=;
 b=sUhKFR4SwmOLLc2IsuSveeu6rcouOOoxiSZrxCQqiewtAixlrxTfA3H7lAayRPkKBLQIJznTEdfusK3IYBoq8cf4ljTCK9/lx9HqFgFMxgU0DJ1FopEmoWazNAFyrCb58vmi4lBLOXB7Ig3gHHZaU2xnakj3u0/NbWHf4+k37/mJ1UbpL3QGqsSc1YoAxFrdc/TgV+ux9F2KjbScBKtgcYdk4pmQR2XMx220molv6KvvNh7s4EARFaI9uzu0sBXCz35asDqkLvcSrEsQ/7Us9qX2qozcGETRIWq4usMpJdi7CSKIFji1/9mjOhpTXiQ9blVngSOw0pjF3jNHUg5acQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB1433.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c6::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Sat, 19 Sep 2026 10:29:53 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:29:53 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 19 Sep 2026 18:29:03 +0800
Message-ID: <SY8P300MB00417C98015AAC4D2A3E3289B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041D841DA8295DC7F4B2510B5862@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260919-bump-visonfive2-v2-3-c6c5ffb1a452@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB1433:EE_
X-MS-Office365-Filtering-Correlation-Id: 275726e3-76fd-43bd-c4b7-08df1638f16f
X-MS-Exchange-SLBlob-MailProps: 0HFyhoHfXaQwDZMjTe2AY5W9TP9tSCo/uuBzNOWimclkRl45CLYZMummScwLKyId0bE61bfB1DWBRVaOQ9uTjUHiLO8j/oyrmQ1BvG/22+uc24guAjSCwCRsu/kYcA+lIIGQOPS6agWJsHoBna8hvepjkHABmwdxQ/VjsFjrec0M1Ec64u2n8+QuWCjvmbs7M09E+oRZ8tA2eS3RMS96DYJpsO+84L0aZ5vVdwnNIkmTUZXDjSZeGXbSTgymJkT8zxPW3aJ0cN7RhDzzaOmmv9/XK13SPxauR0nPT2l/7YQL/IPeC15lr5WOvrYnm39ulGSYLUsfN3r6/4ZzGqlCBdDJM2siiqwQ3Q6X//RkeUQIZjuxG8vwAc72GjtR7L6HBCj5QoRd3Ogyki2BfqOclJs4Fkn+PZkXSWaHh+VNnmy7HT88kEocwSHh8Ay2+tmP+EEJc1Mv9xmrZx2a+UWoyUNL2mmZ+cZrt1Mv4RGb0NQ6Rs4+CwThUQHZcLt42fB1vHE8mVyijYfAMh0V6BlTd+xpW37TpPg43OAzFpl8JVDmaNe8XnfFHgoFF+giPFdw461m33mPNInBG3VpoiGAt5uOJcZa8+TQwqHSO2ag/Xx/F/g9WmhSLKzU6B0OSz+a6mnZafRLhKYXPoP/3j7MeX89OtmbE6zFOObwXAFXQ0QAKAdkT8V0pK7CEl+KLZ1aZuu0ulPjTJhcogCu3H7isKNoH2ywhTnKlPss881RFbEoqN/wIuEfnmg/+HNCzRTUuK4KGYflo7TUGFLg6JkEDXpgZhft0A3TLMbnkxvYmixGvKa7AnwVfufh4oA9lYKdNrvD0nrbGj2nAr7Om68Hld8G6pl8j24icU3xdzkd6aR1tbtsmYPoyQygPhSTTqjsLvnZRCU1pXU=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|12121999013|41001999006|51005399006|15080799012|8060799015|23021999003|5072599009|6090799003|19110799012|25010399006|40105399003|10035399007|1602099012|2607281247196008|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0Rka3FJNjMwYlFsUFdWZVErbEFIaVY5SEM0aGpGUE1LNVo5OHdESWV0Wjg1?=
 =?utf-8?B?R1FxcU84TE1iM2lDczJyd2FYc3RYNlp2WmZtSi9HNmF1TVZRUUxhRm40Qi8r?=
 =?utf-8?B?emYvdlRRazFaNWV5dUk4Z0x2aUtzQzFLbldKZWtaTG9Rc2VqcHFTOElGeTZi?=
 =?utf-8?B?U2JGOThQaXNnTnRlTmJaeXNHd1BSRzhvR2thV0lMYTlsbEhUYW8ycHFpN0hh?=
 =?utf-8?B?aDdKMGFpc3hHMmgxUGlDUWVoSlhPcm1scnhVc0M4RHIxRlNTVHZlNHl4UkFk?=
 =?utf-8?B?QnRuUjh1eTFhZmNadnJZKzFzSHpQM3Y5SGFkRDZ4S1IzRE5ZS1dWRXhWa29D?=
 =?utf-8?B?NlN4VGRnUmdBVmJnRWpEVVZiT0JPaFRZb1Z5dnBBbHUzWjNTL2NYakEvSFpV?=
 =?utf-8?B?K2VXQnhRQStxUDFPS0xUNjJ2YnYvdjhKRng0QW02cjA0d213MWhyU29HdGJF?=
 =?utf-8?B?VHFwUHVjRFdMR3ZpQWQrY3VtRGpsWFEvQ3R1UmExNlF4Qm1vRWI2TkF0RzRI?=
 =?utf-8?B?dnhNVHp1TzIzQjRDWFhVZDBkNXc5RVYvSGU5aVNZV0JIRVA5Y1gyTmtMa2x3?=
 =?utf-8?B?eWVGbVBiOCtpWWF3am16YU0wTmU5eEgwNE9aaWFkLzY2MkFaUmtSSWZKR0tq?=
 =?utf-8?B?THVvSGZmazFtVDNVaG9TelV3WURBdjQrbTNUcmFWZno5bzJsamp1UU13b3pj?=
 =?utf-8?B?TVRYMTdpUzZFZXRoaUplTE9sbG9BWjl0dTVhQTZEZ01DY3ZESDBLakRFeW5k?=
 =?utf-8?B?WEZTa3NwQVVXWW1DRjlNN0NjL3hLeTExY1E3NXpPVWFrUEhzV2s0bjBZQzB2?=
 =?utf-8?B?Wkl6WVJLRS9sVUxnaDhkTVFWdndHd3RsdkNNRjBnRmhWTDBxeTBPMGNZUVdV?=
 =?utf-8?B?YzYzSjZuWUpQdUhsWEp4ZktPVlcxdCtiRUJQWlBVaG1pak1SQlVBZkI1ZjY0?=
 =?utf-8?B?MW1ndlp5djJCNnhEV3I0MEpGS3BVbEtVZncrZndHMVp4VENhTWpNVCtVcDZU?=
 =?utf-8?B?VWdieVFxTXJSVm1CTHpnbEY0aEpvK1V4VHFHUklQR1ZWbGRRNG52aXZLQTht?=
 =?utf-8?B?cEFNdVRtNGNwblk3WHJqYy9yQXhnVkZmQmZjd2hUdjJOc0w2clZzZGdJVUxs?=
 =?utf-8?B?TFdITkNRRjd0UTVOZlg2Tktib2RwY0oyUWQ4QlU2VUIxNWpiM1dRZ3ZsTVRa?=
 =?utf-8?B?WmM4dlZTTGFkTjR4ZDh1N1pWWGttVjdKKzVtVVNXeXlSYnVFci82WFhlbGxE?=
 =?utf-8?B?ZC9SbDFZWlk0WUlOWElUTWp0dmtwc1FsNE5XdWRyN3lkeGpFd3VmdHN0STZk?=
 =?utf-8?B?dEdqVlFFenByWnk0MUFLdXdCRldqUjlMUU9uSGZMYkdXQm5oYWFUOEtubEdV?=
 =?utf-8?B?Zk5ma09DQmRWZEpnN2ZSTG1VWW5rbXhMQ0RkR3pFVGdxQVJ5emVobWZJZVJF?=
 =?utf-8?B?b3dyYkQ0Qm5vN2tUYlpEbVBtT2ZaZUExUmwvVnJ2M0hSaHJRRDRtdm1TSnJ1?=
 =?utf-8?Q?KA370k=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUF1aE41ZllsZGZoWWVVRDB3MVNYdkU2aGFkcjVJdzUyN3hRR0k3aGZrakEr?=
 =?utf-8?B?ek1hZk1sajNUaEQvWGhHZ05wWTFVUThvRWVITDR0WFR6THNXQ1JHMG5lYjBp?=
 =?utf-8?B?cUk1cXhVOTRrb2djbW5OQ1pLcDA3M3dCZG4yQkhUWkVBTTNCRFUxM2hhcG1C?=
 =?utf-8?B?RTVuNHRvVmNRODVjZXNITUd6QmF1NlQ0WVJVRU82QjN5Vm44anRwa0RWU2lS?=
 =?utf-8?B?VGxxVU9UMmNmY3FVOWdBcGszL1lwMDFSQnVSOHRoMlhUclM4TUpKdUdrTEp3?=
 =?utf-8?B?YkxRQUtKUFN3OVhWZ1dqS1VZUmJ1SXpKVTZad2pkOVJqdGgxOHB2TzhlSzNj?=
 =?utf-8?B?SEkyYThkWVFpdWV3SXRHQ0E5TERiWmNpY3ZPREovNWlpZCs3MncvUWlmckpO?=
 =?utf-8?B?Z1p6M1ZITVEvc1ZKVlFyUklZN3FXd3JGL05UeEEvUEc0L3VmQlhUR1hxKy95?=
 =?utf-8?B?WXVabklxeFpuaDA0aDRaTCtNb1hjNys4Q0JhakkySW9qT1VHWHpqdWlxNSs5?=
 =?utf-8?B?cHc1R0swMGF5N0Mxa09lb3Y0VllPTW83S0U3SEVPd29BWU9jeCtLajRSOGFl?=
 =?utf-8?B?bkU0Qm14bHdSYXIrQWJPNzFyMThuMHNMSWN1SjhpQ2w3cVRwbHpzRm10dVVV?=
 =?utf-8?B?UzNVVjNnUy9ROUd4bGhCR2R2cGk0Nk1FSWMrUlJUeFNGZVoxRlhEYy9TL1Nr?=
 =?utf-8?B?NHdHSlJmOU55V1VWSFVQRy82dm16SHJYMDZYTHQwS2NoRTV1d2RqaHhXRGxy?=
 =?utf-8?B?UkZpcTZNSnZUbHhXSGsvMlZpWC9ySjR2R2JNU094Szk4RHgxMHM3b2dPZ29R?=
 =?utf-8?B?K0RUOWtqL25iVEppZGFtWXVzZXhBaXNKQk4zaGdTWGpOY3RrbFdlZUJobTQ1?=
 =?utf-8?B?YVNwUzg0MUkxTytnNnh5ZUFzVU1vUERqd21ya1FZTy9KVGdXaSsyaUxpUk1v?=
 =?utf-8?B?SDQyckR6V01YWXlUMjFBSlRpVng3T3VIOEszeXRvZHF3bFFQYlMvVzFiYlpY?=
 =?utf-8?B?eVEzRGRxYk8xdnpOZ3FZa1lWYVE5OUFjTmlmOUlsaE5HMDZ1NW9xNU56ZDlN?=
 =?utf-8?B?bmxNK0hob0tYTElBcWdwSE1zbjVieWpuZnNUYVJ3YndneWlDZzBZOTV4NitC?=
 =?utf-8?B?ZHdZdG1zWVRXTWNKcURlVWJnQndZakxBREcxdlJlcnp1bFdKazEzcnR2T2FL?=
 =?utf-8?B?OHV2cTBFTFUwZThwQXdpczB3Zk50UWMxRVNMNTF6TTkzZTQvRnY2MXZXMXVu?=
 =?utf-8?B?VUZobmxBZHIydmtkbGljcUk3MmN1UjJmdER0dWk3S0tnT2ZZTmRyWWs1cTJy?=
 =?utf-8?B?WTIvWG1sbzloakZ6enN1UlpOcldkK0FWK2Y4QjRiYUZtajA0MTZMZ0JCeXQr?=
 =?utf-8?B?eEZYQUtzUkxvUjgvWHNCUzJ0Y1lyS2FGUEg2VmhScmtOWEVVaGZHSE9YeXJF?=
 =?utf-8?B?REtSTW5FZlNxakRuelcxRURxKzVLcmZueFdqWGIrWkZCamd0M3JPanhLYWc3?=
 =?utf-8?B?eGJMQSs3eEcxay9GRTZDMVdBQ1BZSXkydzA3U1NXNEh3dTJuVHRxVHNOcnBw?=
 =?utf-8?B?bTd1SHo4Q0NScXRYL1JQSDhmTUt0Vy9hWjZIRkdIaTB5TTFIV1BRNXlzaXJa?=
 =?utf-8?B?V3ovL2hLd0ZQRVliSjV0eDRyM3dqSDZMek1YbHVCQTgzTGpzNWtNTXk4MkRM?=
 =?utf-8?B?UHVlNS9neU5kZ0kzdnNmSUljM0JobzV6WXZvOHJOZlZiNE5VSjNvVDVOMXU5?=
 =?utf-8?B?WTNNVDhBdnFjYng1WUU0UkNNbXZoaTNQUDNPZ3htcWFSQkRxbXd6Z2Y0dFdG?=
 =?utf-8?B?VFJXdFJURkVsY21nZ0dDRDNnOW9VT3ovVGNiVDQ2QjNPT3hkNTFzWHVFRkR3?=
 =?utf-8?Q?whzlU9Rjk44by?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275726e3-76fd-43bd-c4b7-08df1638f16f
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:29:53.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1433
Subject: [Buildroot] [PATCH v2 3/4] configs/visionfive2: bump Linux to
 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate and clean up removed kernel config options during the upgrade.

Drop uboot and spl partitions from the SD card genimage configuration,
as U-Boot has deprecated the SD card and eMMC boot modes since
v2025.10 [1]. Update the rootfs block device in the kernel command line
accordingly.

Update readme.txt to reflect the new boot flow and instructions.

[1] https://docs.u-boot.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 board/visionfive2/genimage.cfg                     | 10 --------
 board/visionfive2/linux_defconfig                  |  7 +++---
 .../overlay/boot/extlinux/extlinux.conf            |  2 +-
 board/visionfive2/patches/linux/linux.hash         |  2 +-
 board/visionfive2/patches/opensbi/opensbi.hash     |  2 +-
 board/visionfive2/patches/uboot/uboot.hash         |  2 +-
 board/visionfive2/readme.txt                       | 27 ++++++++++++----------
 configs/visionfive2_defconfig                      |  8 +++----
 8 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index 8133e740c0..af7bc70d1a 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -5,16 +5,6 @@ image sdcard.img {
 		partition-table-type = "gpt"
 	}
 
-	partition spl {
-		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
-		image = "u-boot-spl.bin.normal.out"
-	}
-
-	partition uboot {
-		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
-		image = "u-boot.itb"
-	}
-
 	partition rootfs {
 		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
 		bootable = true
diff --git a/board/visionfive2/linux_defconfig b/board/visionfive2/linux_defconfig
index 509cd0f475..1ca11f4097 100644
--- a/board/visionfive2/linux_defconfig
+++ b/board/visionfive2/linux_defconfig
@@ -3,7 +3,6 @@ CONFIG_COMPILE_TEST=y
 CONFIG_DEFAULT_HOSTNAME="StarFive"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_USELIB=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
@@ -59,6 +58,7 @@ CONFIG_NF_CONNTRACK=y
 CONFIG_NF_TABLES=y
 CONFIG_NFT_CT=y
 CONFIG_NFT_COMPAT=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_IPCOMP=y
 CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
@@ -69,6 +69,7 @@ CONFIG_NETFILTER_XT_MATCH_SOCKET=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_NETFILTER_XT_MATCH_STRING=y
 CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_NF_TABLES_IPV4=y
 CONFIG_NFT_DUP_IPV4=y
 CONFIG_NFT_FIB_IPV4=y
@@ -197,7 +198,6 @@ CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-# CONFIG_HISI_THERMAL is not set
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -370,7 +370,6 @@ CONFIG_SND_USB_AUDIO=y
 CONFIG_SND_SOC=y
 CONFIG_SND_DESIGNWARE_I2S=y
 CONFIG_SND_SOC_RZ=m
-CONFIG_SND_SOC_STARFIVE=y
 CONFIG_SND_SOC_JH7110_PWMDAC=y
 CONFIG_SND_SOC_JH7110_TDM=y
 CONFIG_SND_SOC_WM8960=y
@@ -522,7 +521,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_INIT_STACK_NONE=y
 CONFIG_CRYPTO_USER=y
-CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_CRYPTO_USER_API_RNG=y
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
index 48d267f725..7934d70e15 100644
--- a/board/visionfive2/overlay/boot/extlinux/extlinux.conf
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label linux
   kernel /boot/Image
   devicetree /boot/jh7110-starfive-visionfive-2-v1.3b.dtb
-  append console=ttyS0,115200 root=/dev/mmcblk1p3 rootwait
+  append console=ttyS0,115200 root=/dev/mmcblk1p1 rootwait
diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index 1213da86b1..b2cfc9b7e7 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
+sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
diff --git a/board/visionfive2/patches/opensbi/opensbi.hash b/board/visionfive2/patches/opensbi/opensbi.hash
index d7893a1dee..5e2e695bc1 100644
--- a/board/visionfive2/patches/opensbi/opensbi.hash
+++ b/board/visionfive2/patches/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
diff --git a/board/visionfive2/patches/uboot/uboot.hash b/board/visionfive2/patches/uboot/uboot.hash
index 80ea21b7cb..ff6e4ed2e2 100644
--- a/board/visionfive2/patches/uboot/uboot.hash
+++ b/board/visionfive2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
index cc4fece6e9..718494e33e 100644
--- a/board/visionfive2/readme.txt
+++ b/board/visionfive2/readme.txt
@@ -1,8 +1,8 @@
-Starfive VisionFive2
+StarFive VisionFive2
 ====================
 
 The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
-Starfive JH7110 processor.
+StarFive JH7110 processor.
 
 https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
 
@@ -24,33 +24,36 @@ If you have a booting device use u-boot and tftp:
 
   # tftpboot 0x82000000 spi-nor.img
   # sf probe
-  # sf update 0x82000000 0x0 {filesize}
+  # sf update 0x82000000 0x0 ${filesize}
 
-Otherwise, follow the recovery instruction:
+Otherwise, follow the recovery instructions:
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/recovering_bootloader%20-%20vf2.html
 
 How to write the SD card
 ========================
 
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+Write "sdcard.img" onto an SD card with "dd":
 
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
 
 Preparing the board
 ===================
 
 Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
 
-Use the correct mode for booting:
-- SD card RGPIO_0=1, GRPIO_1=0
-- SPI NOR flash RGPIO_0=1, GRPIO_1=1
-
-Note that Buildroot puts the bootloader both in SPI NOR and on the SD card,
-so after flashing as instructed above, either boot mode should work.
+Select SPI NOR flash boot mode:
+- RGPIO_0=0, RGPIO_1=0
 
 https://doc-en.rvspace.org/VisionFive2/Quick_Start_Guide/VisionFive2_SDK_QSG/boot_mode_settings.html
 
 Insert your SD card.
 
 Power-up the board using an USB-C cable.
+
+Note that starting with U-Boot v2025.10, booting U-Boot directly from an
+SD card is no longer supported on this board. In this configuration, the
+bootloader is loaded from SPI NOR flash, while the SD card contains the
+Linux kernel, device trees and root filesystem.
+
+https://docs.u-boot.org/en/v2026.07/board/starfive/visionfive2.html#zero-stage-program-loader
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 8223e6faa1..3e30c0649c 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,5 +1,5 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -19,14 +19,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
