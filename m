Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B081EC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 09:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7332E80E8A;
	Sat, 12 Sep 2026 09:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3r_TUyseDTg; Sat, 12 Sep 2026 09:24:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4DAC080E8B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789205087;
	b=AGKBtZLXkZbxi3etUn5Yclev5630k/NUC2yDFEEmDJjMYAhm4RuUIQd07fJpg7hcsvnt
	 NUjbQqgf1s1dlWLeJVKkdcJI2qRT2bDDTsAPn5ATU99y4DV/CNfKkcMneFCPlRLsy6ZXX
	 6MI8yU7npP4Jf5u1XNBiwYV0TtHQ37N0zecr/l8YCU5dgjvz9hoOyUAZWmCkkYXK8tBWA
	 y4Jd5s5Ty4iq3rEOKKSc6tSWbL3ZNmzOyhlbYeCk/C7M6P1nC+x9XAKlR5lWEA7v8FrDs
	 0+EMzbdkWvQgMQVx+9U6MsYqheCkuiDPm/ZuVxp8/4mBnGVioicoXgZKhp9yOWxLxng==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789205087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:Date:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
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
	bh=HqgaCeacWdOaFWHaGlluNqo0yiaARtaz0IzXENrpDeY=;
	b=QMbIqbcnDH32hVFpPn7aBBCtMYSdysldag7j7DEEJ5LcbpUeCZO0vaTHxW+5Don4g4GA
	 q3WhKdNbRLoApI30HKVkP9OYDlJxh+HgHAyFLcLhOxok579hNkFORfp3BWIOjBdPL/10o
	 4ngwstRW2LRP5fhsnBeN2AEOr/l1yIHOmMQT3aoR6j4xYZIvfpv5ieGLVLzGC2UfL/7RM
	 cvql066YijrfTg0gcm62hbpTyj5gLP1GBFJ0lktNhdVlDcoIs+6qejdNZn5NLZBe+GtBv
	 YO7d0qw0AZeOBuY+mj+sBdg18h/NnLtHepzWkGpzLoUv9OYxWWcoK7JYmorD9LmLZ+Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cDMdaBHW;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789205087;
	bh=HqgaCeacWdOaFWHaGlluNqo0yiaARtaz0IzXENrpDeY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aX+/kc02dgz5ySPMWWkOmp32op/jwAPZKxYWYIp6cCZdgj6R2NrTfkxZzKlZE9gns
	 bU6r9OD8m1xazME6LABQ+HtVBor+tfy2js+Vq+eXUVE6srtnTdss4x3y48fnuwZvrH
	 g9LULrijmSaWWp6sqnPodpy6E2nIo4K/n1rdHlH1E1nJYPqdaeAZ1xrbMBz2fTR4hg
	 y44nMjMPspoBtkwtPY39rh2fLBSr6Ub0qpolo+SeZ2DAJNkqKbAmCKTUKG+TZGU7Zn
	 89IscUNNJuv2NsXKmk23Pf2iz1k1jNYNCZZF0I6N8Hv9pEW9KqhgD3UrjASWM9XSth
	 f+KsCEw50CkNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DAC080E8B;
	Sat, 12 Sep 2026 09:24:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 980F549D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E04C80E8B
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6A-dydK0zBUQ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 09:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F418880E8A
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789205084;
 b=r3C8A40lPGwQ3xulZmALElIGyHoQLRQnzLH/N3Sp61gjBgmECqnwMIvytqv0VbWjUfsg
 zOe+x9a2LdiPYDqsrMYXkpK94WPXprJSl3r2wE5aH8qgFKaRTU60Juyhd3Dk8XbBn17Ik
 S8NMadb0VyDoNv83+xiC/ij+HIksRD2/P2eC7Eowaabv0Do2h2Q7olgMhljLwzrW+Reri
 iIPvKJu8WWmugFIJpwKS/kyAmNeJqvdyZ80EF+pby2Jsr8PDJWHdwvr5gyMWRIAZhBGok
 uA0uFhHBl1zUU75uCGDHSmn0gyc0zcfXczCw1oo0hAAbKSPdhQ7UEAbk1QVmFUpu2sA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789205084;
 h=Received-SPF:DKIM-Signature:Received:Received:From:Date:Subject:
 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=WX7wO7V2uMN//BBJ82P3Imoqf6RqzEFujHqqdrXGsmk=;
 b=S7BKzY9jJin0ZeEinll3do6bVEOcCY2XDuatgCRah51XlxjaMtFLXhHt7HmWzZFNWa0U
 /D/kyLwmE6xGj7sooUK60KJCp0Bxr4Wvb1sF9FNkFMrT8C+9rzIGyo5E6kIYWrkmoEaL+
 HLasYrFECl9xjlfIcYWvWZ/CGWSHwc+qY1wNo9bFGrt63tiIbC+BTfIY8Uop4q02Zq6xL
 jVevyK2WaOJQ4lp3wyO2ga0IGXsc7IE6HyjqY9tNg3m6hzo4iDHMfu87suwsmQmowtBkE
 ByjI9KZynspVsOzGRR4GYGS+QzQOR+k9QWzkxn/p2MiWhKD2Lctbj0L/9FhtLvA6H5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=cDMdaBHW; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=cDMdaBHW
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F418880E8A
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttn0tvv0OEfre8XyXqFHBrXB5t3aBXZ5UyQwzgTKBX/nwJeqddoQLeFpOSqWOhx6wBBhnQxDI2Vqp5HFnOnzrL9zy8XyK8x+zmgmhQCw+FvOWu/UCrdkSuFTMXgLaabvXSVc/dopvD3DdoQumFD8IkAYqCOmKIIpluPtDY7k1no/zyy4kg1uUFpqkDn+NQP0Ei5sMUtznI3uztPDDb8P73abxXnAxmXM/6+mKeQC41v8e+zC1nygtqvOT4tG5jswEeuKLUYay4fb/b2DjnZoREByzVApzbG6c4dDX3yvBNwFTIrvG6OtVl5h67uYa54JjKwiGBki1WeR+RkGI+pJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX7wO7V2uMN//BBJ82P3Imoqf6RqzEFujHqqdrXGsmk=;
 b=MchuvtIeHq7g8Pl/dt8rd6hhHXh9qzXtSeU2pxY7hrSKBEdGGvJ1MuA5Ey25GjbRfiVJrEGJUzILYqDd/aSvDe5frw0b7adgTVGQEqPOIfFYY3yTEUxXO+dsK8XqDConZWMD2MAnN8hun/6izC3ya2VW/20jRUE8qV5OaTSyUKSaFohD5wzaT6DLMLHGLFA/1sQxEGPz8wz0nfi+4jZMmrHKj27hBOlNL1iv+ZxU4Rq1WkRFKRV6ERmrpw80TsryWXSHHEssjTv7gmWa35xlODHIzjBWsW0OktEIYXy85HqeB8IowmVUjOicIA/Eg5J/xzz/6GWVVusNO+XhHsifiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX7wO7V2uMN//BBJ82P3Imoqf6RqzEFujHqqdrXGsmk=;
 b=cDMdaBHW8uY0Ss+/qwLRFIZcZheH84IKvVRh99O8U/6QVu443ROuTqwvV7h0NRF3+4n2I1GLe9PR+bR7LwMC+Q+Ds2SZ+O0FgabuoPCcuYmnBCuyNciGHQGwSKNivGrWH81FJGO2Kp38oRQDD2FZhe5xQpNX6EESIdiLv/bf6BkmR95m9yGfq4oOgaMSyN8eCPoBWcpLiKNpu/Jc/hxcCGJz4Kbhw6syb12rBAJhtkMM6Ozc0t90I7crlb+li8RVkqKpes1UrE0Dbi5CqBvmKG2azsUPvMxxqX09ouqdgOO7k1OUiJcmXab2lg+BXMgfSQNrLUrcL0xsE6GKQiJoXQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SYDP300MB896511.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:350::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 09:24:35 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 09:24:35 +0000
From: Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 12 Sep 2026 17:24:12 +0800
Message-ID: <SY8P300MB0041A241A227D8AC8B1C8488B5BD2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-B4-Tracking: v=1; b=H4sIADsapWoC/1XMvQ6CMBiF4VsxnS35aEGLk4C6qKlRGYxxAPyQ+
 p+2GiPx3gWcHJ/knLciBrVCQwadimh8KqNu1xqs2yF5mV4PSNW+NmHAehC4jBbn1FJj0/xk1Bu
 pRWNpP+AFCoEezzJSP+8aC/Vqq9vdz+aRHTG3TapZFPp2obbUmLb11UYsOMA8AvBc34+gF3tsL
 CDkEQ/cqA8TEbps+DdzwmTVyFks5ciRyXom5dSJ5Zx8Pl9RMBdd1wAAAA==
X-Change-ID: 20260912-flat-stacksize-test-793fe88e43bb
To: buildroot@buildroot.org
Cc: Fengwei Tan <tfx2001@outlook.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1789205074; l=7326;
 i=tfx2001@outlook.com; h=from:subject:message-id;
 bh=emSrvz8vm09qxA1zS30QoBgOhLnYjDnoe/nWBHOmoqY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgWn0zXFaEzb3wW979THuk3KYjHGEf2
 F2q5Ef1Ms/MyxYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI0ooluq/jexTUZ6GFdQ7u5oDwtg4SEawLxnRRW8tlmDESJD71UBhXJScWLZbzVkLeS7Pgz0azy
 HOI7cGAkksQg=
X-Developer-Key: i=tfx2001@outlook.com; a=openssh;
 fpr=SHA256:SlTe6QorUgYju7PrIhZKHupKHt3RWwjx7Fyr8jEzs4E
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260912-flat-stacksize-test-v2-1-928009275c8d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SYDP300MB896511:EE_
X-MS-Office365-Filtering-Correlation-Id: 916d3e6a-351e-46ef-0d8f-08df10afa91f
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|51005399006|23021999003|25010399006|15080799012|10092599007|6090799003|5062599005|12121999013|24021099003|41001999006|5072599009|40105399003|1602099012|10035399007|2607281247196008|4302099013|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjNRUjBDVXZDMER4YTBTQ3BsQ0ZMSm5ldkNvckgwS1lpRlJWakQwZU9kRnJV?=
 =?utf-8?B?M2d1dGhDaU1KTmtMWFR0cFRsQlpjU2QwSUtMMTI5a294MmhtL1dFVHRienZy?=
 =?utf-8?B?WU4xM29VNkZiSUFUM2M4SVFHUTFoa3RnT2gxbXI1ZGdrb0lxNmpFNy9CNTlz?=
 =?utf-8?B?bzBYcm8wbW9Sdnk0UHBXVUJyN083bzZlalNFN1BTeDBjZ0tLRG5pQWNHb0JP?=
 =?utf-8?B?SFgrc3FEdk9IaUJXcnFyMEpUbTFJQXJyK1pkNUdtY0YvVUdYSjA5Z3hPZmFp?=
 =?utf-8?B?cjdHVmd6Smh6bGpkNzZpelErcFhSOCs2N2xmdloyTlMzcGtacEM4ZnlUSzdG?=
 =?utf-8?B?Y3pNbkdYSmpxUjgyNDlkcDhiRm5TMVY5SUhUTWsvVkRSMVRzUkRXTnpFT1oz?=
 =?utf-8?B?VjUyTlVxcERHU1dRNmpKUG9MTjhHMnAvczczQTZFKzJaQi9GeHdqVDZiWTd1?=
 =?utf-8?B?WWF1RlZqbUdhL1FxZG9Fa0U3aWtxNzF6MmpGYmI1YkhIMitMNmMvcllROUwx?=
 =?utf-8?B?bStZMjhqSXdDV2xiS2dHSndLMThCMTFhdm9sdUVwYkM1Sk53YXNxT1FpbjJh?=
 =?utf-8?B?SnI4NmpKL1RUVm1IN2pudW1KSGl2TndyY0loUDIvTWk4UFI3RnI0eldUeWtx?=
 =?utf-8?B?MElrb2s0bzY0Kzl6RkJkcFlkemVJckt1VGpXbGc2OUdRaWV6T2R1TVd2ME9p?=
 =?utf-8?B?LzFMR2lQWWNIdHJ6WVRpbkRnd1ptOVduRjdGa210dkF3K2FOUjZQNGZSYkJv?=
 =?utf-8?B?b0JXMHlWODNiMlVWQXRYRXVDN3prdFUwK204aVRXQzdHZFNpQmhMVDlEdzZ0?=
 =?utf-8?B?MjIwL0pzSWtDcDZBVTc5d2NsdWZ5b3VtcGxqU29YRFpTdjZ1RzJ5WVdXdGpL?=
 =?utf-8?B?QS9ZV0VDOVkzOGFhMVdoNzNmeXJsUVZuU2VDekE1VnFhNkJ1R2x4bnJlOVhj?=
 =?utf-8?B?VjdXUlorYTN5VDE2bGZjOGtVZWNzZ29ydHdXc2xSNkg0SXpQbzZJNHAyUmdJ?=
 =?utf-8?B?WkYzb1hsMERrMnU1b04xeUJoS1p1aFNSQkRpZTdjclFLbG8zQ0VwNmtJbVk5?=
 =?utf-8?B?RU4yMzVQQnU2Y0JXc3hEUk1rWmJpUGw2a1EwM3pyT1d1c0YxcTNmTTh6Tkxk?=
 =?utf-8?B?RkxqWGNUQ2N4K3Fqa1ZGdzhBTXF0d0hoUXl0K0JEWitNQnVnTUNqcWpDTmdD?=
 =?utf-8?B?cElDcEpsaFdyWEMvRjdRTkRwdVppeTA3WFozbWNRQWQ3L0N6d1NuZ3BlMGpO?=
 =?utf-8?B?Qlh4TmRlM3U3djhUZldrZDhiWW80ak95dDYvTDFmWFdkQVEyT2E2NWpPL0li?=
 =?utf-8?B?L2RVQytJTXQ2WERUdTFZWGFGMXg4cnFhRDVzTjFSODJpSzV1aGNISUd6cS9G?=
 =?utf-8?B?RCs1dDJlUmtXa3VOSS9uTG9SNWJwQXA5cmVGa01saWpsczdXdk9XVEdVekNi?=
 =?utf-8?B?Ujg1Mm1yVC9JZE1FYUVaSjQxT1NjdGJGaU8wUUplOEh4U295YU9zTzhnam1l?=
 =?utf-8?B?dnRZRW1sZ2ZuaStnWjlvbmtOMDNORm9zbXFZNHQ5clZwWmt3T3Zwelg5QlAy?=
 =?utf-8?B?amRRamI3Z0dXTVVHS3M0TGplSGhGMkpmODNMOUVJNEpxY245SFBuV2lENS9O?=
 =?utf-8?B?QjhqeFNDcTlkeEVJMGFML21qbGF0Wmc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1B6anVVWXBrUFRxTFhscm4xcTlDZEpMSjVMbXZQOVBjRXdEU2VyUnpDK3Bx?=
 =?utf-8?B?ZlpxZnZCNlYxZlhKRzZUYWdGdmQ3bUtrNFc4MHlaclh3OUhOaFhUQzJRNy9k?=
 =?utf-8?B?SVlNdkI2ZTFKL1hrUUc1cFJJcGZBckZwSlZ0b0VIQ1lkWUlLTmFKNzNUOG5P?=
 =?utf-8?B?YVVHZ044WnQ1ajEzUjg0MWRDMUF1Z1ppQmhTcU9kdHAwU1gxb3pMZzRCaEY0?=
 =?utf-8?B?aTl0MDAwNzB3elVUWDU0bWM1QzFNd3ZKT2V1MDFwckF6TEpIS3IwL05FbkRy?=
 =?utf-8?B?YjFDK1pmbmNBemMwSXVabDE0SVBmVnJjeFdQOWk0QTFFZjBxeGZoWWhTMy9D?=
 =?utf-8?B?V0VFWEhBdmcwZDJnL0Q5QXllaHlLRXBjdDlua0FCZkNDR1NDNjkwanN6RmhO?=
 =?utf-8?B?eDJKUjFxVCtEWWJTUnFGWk5EenovSXdkYW5ieWdwSmlnWDBXQWFMZ0FQQWIv?=
 =?utf-8?B?aEtqOUU1LzB3MlVHR3M2UDNqWVBmcHIrSGRQeTZPc1FWWkFkUStwZytKQXIx?=
 =?utf-8?B?SWtGNXNCUVcxcjZYNXdvM3o0U3h5TlVMN09oWDZhRDlEQmZVOWYvUDVnTDBk?=
 =?utf-8?B?MS9WeGRiVXJPajhCUTVXSC9EWDd2YjMzMGxtTEV0VXh6TXk4MGM3clc1SC9l?=
 =?utf-8?B?enpUU1U3c0ZQWExvMnNJdmQ2Y0Frekk5a29hNDZIZ3ArcWtQcXJjdXUvU2g4?=
 =?utf-8?B?bjZCK1NhcGlmcG03ZlB3UTJ4SmZjekE3N1h6a2NXamlPdFBtNGJkZnBCTWc0?=
 =?utf-8?B?SVlRRFZqMkdidERLZFY1bCtpN0VrUHFrZ1E5RDh4czEyTnFSUzlSS1Q1NWxv?=
 =?utf-8?B?MmdGZ0dCd0FCZ2hPZkhYcU5Kcjh2RFpXU0FvTUtxeWt4eStsclFEanZKdS9R?=
 =?utf-8?B?SDM2bjhTZm5sd0hwY2Y2VGRZMGttSStsOGFyeGsyaEs4UlJiRVUwaDBtTU93?=
 =?utf-8?B?OHA5a1pXbXdwd0ZIQThPSStGTkZsZ0hPL0grbDArMDZEOXF4TGliNVR6NWFp?=
 =?utf-8?B?aVY1QkpQaXBBaFZxSFJ6RitFZnY3MmF2UDh4czcrcFBRVUFmSDBQNDJuVGhi?=
 =?utf-8?B?K3dKcE0wUUlXWnJzclN2cjRvOTNpbnFRTWNEK2RTM1d0aGpPMGgwMFpxQmJM?=
 =?utf-8?B?eHh1a0ZkU2tybWhYNE4xSnMrL1RNeVFPd09pOWtVMnFBa2ZoMEcxb2thQ2Zm?=
 =?utf-8?B?SC9jcEMzSkhQUFBFM1pyMFlFaUVqRzZnRFdTSkFiVTRkTVM5VXZ2TEcrQXBi?=
 =?utf-8?B?S2dsdVh3NHMxZGFTVW5pQ3NjcmNSK011bUxVNFU0RmVvdHhtNG1SS3BDamlj?=
 =?utf-8?B?WVRkSHNzWm9OVWh0MGNHUVZiT05lVGg1RWljZ2xNSVNGbEJKUVRkYmFDSXU1?=
 =?utf-8?B?b09STlR6Q0J3VnNGM0RqYStFVFAyVjZrTFlNWVc5K3ZDUTM4V0t6VC9kTmo5?=
 =?utf-8?B?NXBzelJzNVBHNzE3bXQxRit2Y3BOa290elloOEwxeGFsVHBTZEIyMHVhdFpw?=
 =?utf-8?B?eDh4UkU5TitWS2tiTmlESkNkUVRVYWsvNy8vM0dTMjdpdFRzbEUyVE0yQ0Zr?=
 =?utf-8?B?b3l6c2lINGNOQ0M0NU9tQUllODFEOHFxK040K1FuM0VuanRyQXNjb3hvK1Vl?=
 =?utf-8?B?YkU0aFM3RkRpcFlwYzdUQWVPK1ZkY2crazVIeGQ4YlVzSnQ0c1Rtem9lZXow?=
 =?utf-8?B?N25qbnN0V2padFdKTnhTM2FXeXQ1UXVyR0lZV2NkSHVnQkpHeU82aGR2amdE?=
 =?utf-8?B?eEsyZks4SVVTdVo1ZWlCTlJFTzhZUy8vVUliY0dUdXdNZXNOU0x6TGZxdG1t?=
 =?utf-8?B?ekQ5ZEZuY0ZlNE5naktyV2FiNzNDclRRSzJ6SzVWU3NKbk1nY3h4d3p4ZnNT?=
 =?utf-8?Q?PMLOcTE9hZJNW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916d3e6a-351e-46ef-0d8f-08df10afa91f
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 09:24:35.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYDP300MB896511
Subject: [Buildroot] [PATCH v2] support/testing: add FLAT stack size test
 case
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

Add an infrastructure test case to verify that the per-package
<PKG>_FLAT_STACKSIZE variable correctly configures the stack size in the
generated FLAT binary header.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
As we discussed in [1], this patch adds a simple test case to verify
that $(PKG)_FLAT_STACKSIZE works as expected.

I have also pushed this patch to GitLab CI, and the test job passed
successfully [2].

[1] https://lore.kernel.org/buildroot/SY8P300MB0041233A165784A8729859B2F8A32@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM/
[2] https://gitlab.com/tfx2001/buildroot/-/jobs/16053520032

Changes in v2:
- No code changes. Settled on the FLAT header inspection approach as a
  lightweight solution, since no feedback was received on the RFC version
- Link to RFC: https://lore.kernel.org/buildroot/SY8P300MB0041166E9B5D56A3796BD3D6F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM/
---
 DEVELOPERS                                         |  3 +++
 .../core/br2-external/flat-stacksize/Config.in     |  1 +
 .../core/br2-external/flat-stacksize/external.desc |  1 +
 .../core/br2-external/flat-stacksize/external.mk   |  1 +
 .../package/flat-stacksize-test/Config.in          |  7 ++++++
 .../package/flat-stacksize-test/Makefile           | 15 ++++++++++++
 .../flat-stacksize-test/flat-stacksize-test.mk     | 22 ++++++++++++++++++
 .../package/flat-stacksize-test/main.c             |  3 +++
 support/testing/tests/core/test_flat_stacksize.py  | 27 ++++++++++++++++++++++
 9 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 97eb2d9cac..ed59f11309 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1124,6 +1124,9 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Fengwei Tan <tfx2001@outlook.com>
+F:	support/testing/tests/core/test_flat_stacksize.py
+
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
new file mode 100644
index 0000000000..cdb4e9f057
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.desc b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
new file mode 100644
index 0000000000..f9c1a745e0
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
@@ -0,0 +1 @@
+name: FLAT_STACKSIZE
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.mk b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
new file mode 100644
index 0000000000..82900bf036
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
new file mode 100644
index 0000000000..67cf9964f5
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLAT_STACKSIZE_TEST
+	bool "flat-stacksize-test"
+	depends on BR2_BINFMT_FLAT && !BR2_USE_MMU
+	help
+	  Package for testing the $(PKG)_FLAT_STACKSIZE variable, which
+	  defines the stack size of an application built into the
+	  FLAT binary format.
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
new file mode 100644
index 0000000000..dc7681bf56
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
@@ -0,0 +1,15 @@
+O ?= $(CURDIR)
+
+CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+TARGET := $(CANONICAL_O)/flat_stacksize_test
+
+all: $(TARGET)
+
+$(TARGET): main.c
+	$(CC) $(CFLAGS) -o $@ main.c
+
+clean:
+	rm -f $(TARGET)
+
+.PHONY: all clean
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
new file mode 100644
index 0000000000..64695ad2dc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# flat-stacksize-test
+#
+################################################################################
+
+# Define a stack size that is different from the default FLAT
+# stack size (4096 bytes).
+FLAT_STACKSIZE_TEST_FLAT_STACKSIZE = 8192
+
+define FLAT_STACKSIZE_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(FLAT_STACKSIZE_TEST_PKGDIR) O=$(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define FLAT_STACKSIZE_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/flat_stacksize_test \
+		$(TARGET_DIR)/usr/bin/flat_stacksize_test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
new file mode 100644
index 0000000000..9b6bdc2ec2
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
@@ -0,0 +1,3 @@
+int main(void) {
+    return 0;
+}
diff --git a/support/testing/tests/core/test_flat_stacksize.py b/support/testing/tests/core/test_flat_stacksize.py
new file mode 100644
index 0000000000..ab41fadbc8
--- /dev/null
+++ b/support/testing/tests/core/test_flat_stacksize.py
@@ -0,0 +1,27 @@
+import os
+
+import infra.basetest
+
+
+class TestFlatStackSize(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/core/br2-external/flat-stacksize")]
+    config = """
+        BR2_arm=y
+        BR2_cortex_m4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLAT_STACKSIZE_TEST=y
+        """
+
+    def test_run(self):
+        binary = os.path.join(
+            self.builddir, "target", "usr", "bin", "flat_stacksize_test"
+        )
+        self.assertTrue(os.path.exists(binary))
+
+        # Check the FLAT binary header really carries the stack size
+        # declared by the package (8192 = 0x2000).
+        out = infra.run_cmd_on_host(self.builddir, ["arm-linux-flthdr", binary])
+        self.assertIn("Stack Size:   0x2000\n", out)

---
base-commit: 9a1c11c9971b454b3b38c4eb111ac5e42a15cf1c
change-id: 20260912-flat-stacksize-test-793fe88e43bb

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
