Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3090FCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3DA140780;
	Sun, 18 Oct 2026 14:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f58lsPG0vq9x; Sun, 18 Oct 2026 14:48:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7CAB40787
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792334887;
	b=bBxa32FTILgBkaKBO2xr25aVynUOe8A8qnKDsmuPC7m44IGbk0Gq9PGeX9GP8AIht7M6
	 2pBCs/rBYGF4LOUk3aZ/aqmbnU2r73QNvESHuR/w1QKu+DZ5obbnkZXvR1B7YQFhMclHt
	 0SIckEeO1yQc+STifkbXrgmAzqWKjLVO18+TOVRK0LfFuzt9bOf/8yAN87VpjdNiPz2Kr
	 RBx+/UR1onoNi/1XHF35MjmRrSfkGf77mr2+2OVhIQtKq1x1rLZQXxnJvsfjqa5eeBgWj
	 iU87/3tko87Z9IVodeDt942UFv0gBa2g5ZCOyth9NED6/Eyry/e+mJAfQx71t0QtX7A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792334887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=uAZI5FD4u4TPY24TcmPrApchvDjqL2fa7Ai7FVfn7GE=;
	b=nib9YqP6K+NjdY3veKjxb5xgFwyFYBe4kwYBUu4iCsFaBpbLYheQSlVa3qOGp0NdAOuO
	 OByxWxUz2kAyEyq49WIQ2Z24Nk/iKcSdHt1Mey2SCDnUnPa1iT32eac8KVpJRA8QvJwXw
	 mGbgfyLa8hI1wHf3uyTdEj27jDYkNQ4BkRY7h9rFTfq3OWgYNUlx9bCDwFFgJ8yo9orxH
	 dNUG6nxHBeoG3y0cU1tHz5N/Qtp5jk6nmENm+wCOG3sxbRI4rU6FM7hre+EIYV7J87tFg
	 xhg5hyPJjgreBo8hTo9GJj+bu8qtVMov0w6SHkbLKrQRVUN6nkVKVb5du1TD4T6aPdg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792334887;
	bh=uAZI5FD4u4TPY24TcmPrApchvDjqL2fa7Ai7FVfn7GE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fQwhs2r/FFgU+xAanIVLKTYiJJ+lYnX3hhK7rf1qdJB7voGDk8yV79VbepkocSjmR
	 H6uJnFnJ7xiOTKKIHuzSQELVTJ/viNUy/nZ/t28wDXYiDEDOlcFWcQzaR3Q+U3HBfd
	 AfWg5c3+v/d2ZsqlJnCKSNLuuejmyuZSkyJcPU0CsNJeFL62raFteAGQm+xroecLlj
	 Yk14DJ43wvLFprmgZzeS2viRmf0Z9PW+yzFMRmOCsfmuhWF6gXAoCe/phFoKWMyESa
	 4xR1ZTqb9fyks/cCtIBRHqZvAMsMRahj+VpG4OjGIZ9V1hnWOpO9lgT5+BL73N/88/
	 j5GeiOvcgmgCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CAB40787;
	Sun, 18 Oct 2026 14:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD2C12A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F4F080FEF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qm_mucCaEEsh for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:48:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 781CB80E2A
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792334884;
 b=Vxy5L8n1nC/Nlqk+jdohpmV4/j59QZX9rf1R6EFMSBjUa0R2rJ93IPjIArGbnL9cyQ8I
 YfLmJdchTED/t7JtlC6mPNuc+Pm+tVbwhAXgYMcRcLh9TPtrLwDFcCMwNSfUNg8BexfVn
 1Xx4sqyiYb5nh0UYXpELISwapeH3Li1XvvbrMnOr7vnXtUFe/O7nCxNdLfWVBheZVoKW4
 7ysz1ee1klNnRoj/6M4Y72TNjbGCZLPpIfJmgIeSXDfXCO1nuyTQyEf0UootGyRMGH8zS
 r7+/qh4mqMnhPLMHlfViOB7MEyJL+QHirAtYoWOXpN8nyl7U8HZCnH2gefAHfEycUGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792334884;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:X-Developer-Signature:X-Developer-Key:
 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
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
 bh=Dlh/NIfdE6Yu9bT2+QkHqu2k5x+R+wFD47aWb5ifSWU=;
 b=k7fK6av+HG/yQtCjnHlJSBCWB7RzAR1BLmDclrRw+aKwAXzTozEj4VwR9UO/RUubcc8q
 I4/zCD0ecDvPnsthituSrjd6Xu5paUgbZ39w9fC6UOB1bkFvgc8EKUHItYDGsGzCVLsDb
 T0c0Rk3h5WmtJsh9Oo/9x/CT3qxMbTo8+m2UhHHo1VYQJ7M53f6Gc4eMkATwwinS2edBM
 /qN0OtKNaBSm3yOUmdaA9M/a4nRWy1++IhHUVwa/6lbC/R+Otz+6QyjRegm1bOB1Gds56
 k5kdz55w/9+d8FgDfZrNyhoyY7Goms/rMfYjm9MIhBSJH+NfYNS14TIcWLBmVWOlXOg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=NHxPeabE; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=NHxPeabE
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 781CB80E2A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:48:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLQkbT04SHNCFQW17EzH1OytO7AXz83OD8f1uvzj2YGPvNTx72hirvCn9cn0wzV77yKHwPd6GD0dqTmoLrPDhSs/sxfShSxLulHhuROZC+T8lODvbJLRTkXKL3GfcGRJnJT86vKK9siaPkmV+5oQwSd/KKpFYMnOPleonmCN53bMBZbqp1T1LsjOhvTn0sv3D6oVp+hmlbHdl2E+dUVwrHjbUas1CCraonxrJHsjjXhh6Iv3WV/1LOv7zSyM67xcdbp3q3iCYZI1xvflvbNK1w4vB6H/DTuh+I89eofcgpIWcvXZivLa2pk6512/dJYv+bwMPgvf5zxqvDXfvAlOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlh/NIfdE6Yu9bT2+QkHqu2k5x+R+wFD47aWb5ifSWU=;
 b=Im+TlMP0bnNl1fWcCW/4vx5MP0MKdh/IW3RHwVeEduPyP9OdwmrvzN6xZf0i8cd7jXec3iG87IRA5ska1J9NyFrP0q48b9noTQmhB47SPfWaCzCKKxkIDO3tMfzjsXsBH0450oTovt5lp2IyozJ3TeTkvNpSzrccuqyVZWSKwR7uwAfdRPY+9RGQqr+FBzUpSg7ev+Faiyq+QAtXqpqZ3vfijBt1KvPDYB17S4lr4ffwmJE9ynGrdMaXGTaFbnsDjlexJeo/442apUSySv8C/hjB6A5X/Nn1zLgBIIN3ZhbK6lFheENJ82Tpgq4u3Q1tRWJIlnV6gN/CPVcv7aBHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlh/NIfdE6Yu9bT2+QkHqu2k5x+R+wFD47aWb5ifSWU=;
 b=NHxPeabE5k1Ms1Qr7Oj4HI4KDmnchUTigXcTXGet7b97nodfNTdZAiGNbF2HW2TRrC7hP7peVCB0cqjwte/hXvQmpjlG9Bj3iI8krsK/+oEsDysUau2juhDg7tnsxUYcbQqpEDpiGwKiI16RsNbGIGDDwi/JdRlxuY/uh+XD3ByCtJbEMdpc+2cKPjmQWap9D3DzlpaABUlou+UMDvCfCmlxnBEu4CfoVeAt0q0slSB/HH6iFedbzxsDkX1iN5DQb4LXvwATByKsOwJm498TJUlLuyFKerFVFsrpSv/MnYJPzWWqGBBMONYOsNmrrcjcd4Ewqf5bxhW6+8LDcDG+0A==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SYDP300MB394280.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 14:47:54 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 14:47:54 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 18 Oct 2026 22:47:23 +0800
Message-ID: <SY8P300MB0041CF44C55A5BC134A52D6EB5992@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717; i=tfx2001@outlook.com;
 h=from:subject; bh=sjfcW9NT99+QKBNu7AAEosh2MAjzXu74ISK5rRUhNB0=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq1Nv6Jl/wbhIeHRX3lKTpp3PO4BSK+8lsBGp7e
 eYkWDd4OBiJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCatTb+gAKCRAcD62l0/wL
 2usCEACx3vjd+0IKzfY/hWrxSxlFLYigrNFzWrrAH00HhTbCggOGeGokBUkMSv0eemhVNzTUJTO
 Qppgh8B1w0hm+RGpQI8HUbkx/Ba+sW0QIwxN/1UB4UgznLaLsg2mDRK9YFCgDQ5BP1yOzuKRvRD
 QnvWv6M9m3HCH9SFMZyNxxNI7f0dzS4vWefG67+U6t6uXlE8iutH6Yif6wpIwP7vbiTSCfI9p6p
 D880lIaWC2wpCz5l6qLjfzPApAjPfDYvgttFQrd+2Ng51hQGvFQQgoY7cCO+e1wUkTGo19gT3ar
 2pQ0iDhBDHk+MhWxoL8gnBCiZ+lN8aiUq9EEeTr+wY5rM1DC22YZ1Fhj5gkd0jqsAXBrNvKq/cP
 J8vJLvH8fGvA6fxaVWeczk0u902iKCYhRb/IddkDqzUYU0l3EE5PfMmR4Q6UujEWesX+EUCCEgm
 f9DcMi2Vpn52NMa5LhaELNBE9fnx0iq40j46+5hRKxSZsqHL1zfUVo0imlMQPfDr2l+6ngwL2LK
 h9+cy7DYCqhJctbrS1gOS2bPQCF3fzVr2LoMuwZ3BdtaaZkQTSmttjr89Fh0Iqkng+sGNVNZpei
 nPVpDzLGdQxYhC1QXqIXkCw6OhKm4xf19l/z4VlfsLxkJWA44SwbciJUhUJsG3fWZuCWQWdvWuc
 bzA+op/oyjQIWAg==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: PS2PR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:300:5b::30) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261018144722.4014090-2-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SYDP300MB394280:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f0cdc3-efc4-4f69-ae4e-08df2d26ca61
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799012|5062599005|25010399006|23021999003|41001999006|5072599009|8060799015|12121999013|260925184616899003|19110799012|24021099003|8022599003|3412199025|440099028|26104999009|3071699003|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e5yp2KGt1fxrgg+X0I5eTtwlWdCLct2I0D1fR1ZQ/iwJ9e0uHMxRGnJYAU1r?=
 =?us-ascii?Q?id1EIhLuWpMIVyw/UAWr7ncWL8i3AKsHppgmddv4PVVwMTb/aExsTQaPXEDL?=
 =?us-ascii?Q?EZ3L5b7SuuiW88HUFEUXUO4dQDeUpvZg/bVKcPoYBVka0zzu17XbzCBuQsF5?=
 =?us-ascii?Q?njvWDNu/GtMdiPd+dmEqHfe1+MYr1YiF6swxkokquPxhd/+HDjSjPJ4zv1pq?=
 =?us-ascii?Q?OOSOuppI01Wifl+eTizTpme4rTr+rzUIbYWEnDnxR1LhBr9OTR0fMCtL+kls?=
 =?us-ascii?Q?jxzl3hBY5KFShfLBLHG2draNr6g17DeJ/rb/R5wp1K4Ro0v8HHcUbftGbuRy?=
 =?us-ascii?Q?7z1zRDkMYgTXcJmvaF/WeSzIgCD4WxgV8U3iHLoQugW9bcTz8Fvd57TXLLLQ?=
 =?us-ascii?Q?xUbjA+qtgHONjej3VobiqS+OzSqC5QX7OkN3j9UjzqXTo9DREOa1411gydaQ?=
 =?us-ascii?Q?oODPeCZzAtAS/otl2J738aO7MKLcb46HuC+273nNBBpw39EZFbJa8jkqbcLG?=
 =?us-ascii?Q?YCaKHp85fS4nGTBsG/gs2odpuV5xDKxuxoR2X1jV+juSZ7WMWEg8X9cljQ94?=
 =?us-ascii?Q?KNaFrKjHCHEg8KObBfXtI4KQ7/JEjTdw4+t++VWpUg7clZIhhx6Mb7wp1L8H?=
 =?us-ascii?Q?HbOrBqwta6v/dkgHiHvm13ctYASGvN2ejItTNgm81MwVby67F3fbFuJ63SCr?=
 =?us-ascii?Q?dCeaO+GU39Xjdfrx66d1FOTKfT0/ahIKcL5gmBOaTCFqrTZHHqFftItAMsIx?=
 =?us-ascii?Q?aIyoNDEcKrRuAh+/j1wP8aJcd4XVduaeBsveUjqgxOlDx7qvWV9RmxafWGsR?=
 =?us-ascii?Q?rH7QvkNWULfWcA4fuZYPakjdneDvTgA7imUmgcXFz2/13Q5FIcWgK3DIQo9+?=
 =?us-ascii?Q?GO9/5XrxJ1R+T2fQ/MDf/hqbtOX1ZCtv6rvtcy0GUa2s7/s2OteF0W7kzjxI?=
 =?us-ascii?Q?kpSoNQx2RROiDTBNJa9Zl+ZjTFUfXvI0I3tGGY10igaG59N6gkIio+CQhwGt?=
 =?us-ascii?Q?I169lZEXz6GwHNwEUIfsNhp3gUx8FzUtIYRlDfG6BH1/L0U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMldvpvOdCYtV/q9GiRkL7UxNoEM8k/2lq32QgYg4u3i0TbSD1dHqXhYDgEf?=
 =?us-ascii?Q?hq8CyIAEZo3GNDoLnaz6BGR4CfItePhcpFhTJlTuiZ8PV+McMaYzRCV3sO/Z?=
 =?us-ascii?Q?5mc9gDfzSeFj6l/5g68lOb8RQwqSDUFdoVm1PwochPwxUxS3wh6qFZNbDxOa?=
 =?us-ascii?Q?Xzqii35akRKOAtkhTFUXn0MVHt3ab0qNOnSV5mTlUPKs8agKXpQLT1CqZoN2?=
 =?us-ascii?Q?rS9W4UYXXklgKvYZ1XvNR+E/M1eQJG0uJTjHNG+odXGBXf9dIhOzKUD7O1fu?=
 =?us-ascii?Q?aloKgHtFlhwzLokaSc2UMf9Hm2pNJsE+wAyGBRAQrMWqsgw7G751Pxm4AxEZ?=
 =?us-ascii?Q?SvsPV82OUPRj0c73IxDM+2M4UuLsoptCaU2e/i2OEE3e1q5sFModfp+O3hsJ?=
 =?us-ascii?Q?kRpzLhquEd23Ir+EP1u8rknolvi7hoBwowaRv4TlkzXozO/ue/rvF4a977Mh?=
 =?us-ascii?Q?9y2iGqZJ5u7RW/+vjNlREwYE0IB+6jM4WONIPq0O7mQeUxq+VreXpNi8X5S0?=
 =?us-ascii?Q?j6aIuue/guM7tBswRDCR+wZvzus1IMq6LUo+c69aL5LGwypoqKSkM2l/osdt?=
 =?us-ascii?Q?MFMvGCvpKA8xIofPrBxBoX4g/4wM8sFBPbqt16mhiw8F/ahHA3eIQNXQtmzd?=
 =?us-ascii?Q?1Uh9Wd4LM/kEZnDdf/RU4fBqXtwAzqjim9W39vk4n+M3NZNBGIcPhF18NKMu?=
 =?us-ascii?Q?ii1uWwtjrXw9zsFR0JKq/ImUc6/hbRXrD/YIvy/cISnf+3ZSkPwATwLvA0hN?=
 =?us-ascii?Q?qYCybAL5bz9bMInqbL9a6RRpGhLvQzoY3FKA/BAwExXHrxSuVEokYb8YJ3db?=
 =?us-ascii?Q?VrzUbAKST2kU4SubPidLBfPDxkvuU7zLyd+8Q35ug1VCLBW5ws2wGMgMvX6H?=
 =?us-ascii?Q?S/NiMErYa4DXMighWGnyrehNQUKHQESm+r0E/IFnDekLFyOTxaWSgfHLPQUm?=
 =?us-ascii?Q?r2vSRzwVHJchTop7ycAuJexTqK4+lZrt5vYWNUrTeBroQzYI+iXsEBehUS8z?=
 =?us-ascii?Q?Gc3NU511lJSEGQlDaG2d175Rjbnpon7xIui5G0cKFyfSKn4PAZiJO12hPmYH?=
 =?us-ascii?Q?3qoTvurF4Macps0YA8wW+aWR5ymbyL3o6uj7Wy7+L+JJhmYR36IQsMRgMoUF?=
 =?us-ascii?Q?+dWZrsHxp9A8EdYDPllJ44utMPu9WnXVqTzKOo9Fq6Z2SX8UDPuJbcQUaAh9?=
 =?us-ascii?Q?L3/mLLOENM15v6X+Q3h7R6pI8Cth9iP1Q41y/f0r+owe2pyZRIH7bqX1n1XG?=
 =?us-ascii?Q?NDLTlO7/Crz2PPlDigAJ/oBc74cN5d/0yfqbVblzd0azix1XwXAAJcJ1AXee?=
 =?us-ascii?Q?UG4R0Znsf3Ka9LEkUOGVYUZpA6jq9ao8cs5gJrgm7Bn6ZKM14zFuYJzi+9Oj?=
 =?us-ascii?Q?sjtziq2kYd5zM/FYRMwTZjeAY8Ze?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f0cdc3-efc4-4f69-ae4e-08df2d26ca61
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 14:47:54.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYDP300MB394280
Subject: [Buildroot] [PATCH] package/btop: fix build failure on ARM Thumb-1
 target
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

Add a patch to add CMake compile test for -fstack-clash-protection, only
enabling the flag when the test succeeds.

Fixes: https://autobuild.buildroot.org/results/573e0fc3178f8c9a0583bf86a678caa775410ef2/
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 ...compile-test-for-fstack-clash-protec.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch

diff --git a/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
new file mode 100644
index 0000000000..b26a550698
--- /dev/null
+++ b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
@@ -0,0 +1,56 @@
+From f7b5ba16d3662ca036c6b1724fe741b28f29106a Mon Sep 17 00:00:00 2001
+From: Fengwei Tan <tfx2001@outlook.com>
+Date: Sun, 18 Oct 2026 16:37:11 +0800
+Subject: [PATCH] build(cmake): add compile test for -fstack-clash-protection
+
+On ARM Thumb-1 targets, GCC front end accepts -fstack-clash-protection,
+but fails to compile actual code:
+
+  format.h:960:36: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
+
+Add a compile test with large stack allocation to trigger the compiler
+to emit stack-clash protection code, verifying whether the flag works
+correctly.
+
+Apple Clang ignores -fstack-clash-protection and emits a warning, so
+skip this flag on Apple platforms.
+
+Upstream: https://github.com/aristocratos/btop/pull/1918
+Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
+---
+ CMakeLists.txt | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3398196..0be6365 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,23 @@ endif()
+ target_compile_options(libbtop PUBLIC -Wall -Wextra -Wpedantic)
+ 
+ include(CheckCXXCompilerFlag)
+-
+-if(NOT APPLE)
++include(CMakePushCheckState)
++
++cmake_push_check_state(RESET)
++set(CMAKE_REQUIRED_FLAGS "-fstack-clash-protection")
++check_cxx_source_compiles("
++  int main(int argc, char *argv[]) {
++    char buf[16384], *src = argv[0], *dst = buf;
++    while ((*dst++ = *src++) != 0) {}
++    return buf[argc];
++  }
++" HAS_FSTACK_CLASH_PROTECTION)
++cmake_pop_check_state()
++
++if(NOT APPLE AND HAS_FSTACK_CLASH_PROTECTION)
+   target_compile_options(libbtop PUBLIC -fstack-clash-protection)
+ endif()
++
+ check_cxx_compiler_flag(-fstack-protector HAS_FSTACK_PROTECTOR)
+ if(HAS_FSTACK_PROTECTOR)
+   target_compile_options(libbtop PUBLIC -fstack-protector)
+-- 
+2.56.0
+
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
