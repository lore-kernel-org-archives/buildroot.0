Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7842CCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6564051D;
	Sat, 10 Oct 2026 16:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3t8oocQKDsd; Sat, 10 Oct 2026 16:32:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 331A840544
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649953;
	b=BgwuaQ4WO+rknVX1XvXyuFY38hWGb5YTffzDXbjz53+nZ2+nGpS64M5O/4bgJTmn59pG
	 7M6nMv+k3jVe8aNwDAWLmD2rS39VXWztzhqFNZ9EZs8EHBc/7TwVh/TO94imYf8z4TSFX
	 zWldX9fUIh0VbdR9lqFtrGk2SRUO+++giT0EdgMzFLY1kDNp09ITVvStejTFfDlf0hkGY
	 f0NuNJdl99lkWXJPA0QILHY0sGdGpsmyRpLOEHjO7+pGD4A1shEmRu7ihhLlbED6XvEra
	 mT89S2NA79ZAoRa1aJMtH3FXjogszzY2OuQLD52E8n9VGrRG3A/bq0pt5rXh+btWM8w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
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
	bh=4aRowh9dGEuwarl40tkMJtv6xI26e6nnH98OckXtBXc=;
	b=WGCSJlu2p154YWe14EW5SXlkKK9Z6Y90U/Ws8Ro3pJW/Jw1YmSejNJ+h//M3QKxhcUmY
	 YOURC7j/lixrroxAqveZkUg7keLiU1MxNNGEQ/Hh5ifN4YaIXyigDP0cvBJrrUsKl+53a
	 tdSnhIoY+qX/4/MxQ2dvXggMBql4ONOEee5oBUBFnECWNwcT3yKqjUS48pUxnhD8U8A6k
	 nzbNK+aZ2xS29LPN6nxFYaqxne4BW1LCF4mKENkHWy8xhMa3auEmkr1fW8uUMoSvd/qX4
	 eaooBmgQ5v+W2+he0k6EgYKlXkqZWDclL7nYkIdGdhrTd3dJOMKStbVIiTyDpNV34Sw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649953;
	bh=4aRowh9dGEuwarl40tkMJtv6xI26e6nnH98OckXtBXc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IDiQj4vI7XREj3JHyKnxWPZ7DxVT/gjkgWyNi8zU9Dxey41cvVT0pjM1oxof2OYir
	 bShFvfZpy1hNKmlpy36yz3viomSqkUbp2EYoBtcUrmkZUSq/Azc49nddkmEy1A6JUF
	 GUr9FMBwjUwRsarHgnymHTzX5ZKSsS97uexQddTDQ3mI4PnlFgeemqpPVc3aMuo9QK
	 xwW+Bbz6q+qyZBqUpPeaLUfQ15V7rIE4uRBXVTKD/il2LeR9gG77lbRctnhwlK9tHD
	 N8CS8k5DHqmB6xVVrc2lxwE0EyyuwfzfNNj/ehzs1Gf0qT2MS0v4CzHIlglIXb5IqO
	 QgQaaRYgLRqxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 331A840544;
	Sat, 10 Oct 2026 16:32:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA083156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBEFF4005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoU-p-CvTBt0 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:32:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 987D340004
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791649951;
 b=MdUDaRPHyq2oV3Q1TT9ZY0HSxko5VgZxrhhdLIDA+mPhbFXNB3HiTe9sxp8RLoajr0QD
 ye1TTOqB0sGyqO9Piuolwp8bYo9EtJbAid2HOHE59BSjaeT/dHk3k9u0ogUnoRzGI6++8
 yX6oz4AS+rHdVmPdKPsCoIEpf/TX5lWQxscte42gd/wt2NoRl92lrZzaN+rjYrRSf2xfn
 4Xtz8wZPEyPa2D1XQCmY7G2tedWX1Vlejevg6wSorYh/7QNEZ7SU9SkYfV9I1H1mhPv/d
 XX2LfvV1jIFCAA87X6w6Zm+Fqy3St99rwVzzqqfyRetCTSvY+lsJrmG9XHzr24GvA3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649951;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
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
 bh=5NyNdAL2rNBNhuLH0St4urgBJcMtG/V40/N8hTjEpio=;
 b=ICKlSg6bzba0fRLkVNR8OiiFiAQG6Rw3ZGY6qBj8crJwbCW1wYDsA3uL8Wn6MSVgT9AA
 ood7BjeAkM9x3G7Ak/fO28zxdt8fTpxH+uZIc/dR5po2Wb+jl5EIcYmMbOhPiNngobTcu
 P9R3kxgKQq3V6pLcPzvsw3mKMGu+X7oIwtPDgimuNsbAJB9ahFPJwAzusjH2lx0N4iD2J
 FrAJYXZucSs3XcbledPMf/9abXbAo5gl6MeV/0ot38QW/J0U4mfXf8uIhSmX2LCl681+/
 3bZg7dC4ZCaFngdzkLSN8DH+ZfZcm5Xbg9uLqwpllr04CyiZzsWKPOIwMrLdym3LsgA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=m2EWZ1K9; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=m2EWZ1K9
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 987D340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfVZ7CJm3MN8nMc1XS6KDxSDTPv2ruXF/OR1aUTIFlXPdSUH2ST2wNIO/Q54e0NP5oR+HXm59xUUZONoPJcaQ0SoXy1xWGeI7H/1M8XwjaSIfLywHwRAcHvllGXtc9rvsMyyvU5iHH0ksGGH4etLnzH1HHzDjGUV5bWJbDc6/I/xdwDmGVhJaSJUSVchEI+2gtT9wGdm39XQwmMtzTdpQV9Z3uVzj7I9RS2KGNRp75L8i8LqaYbxmFqSa1w7YHcX30Se0nRmZZY4zK/Zmk3PGkmhWCJlVvqDxDffzRMlm9qEPSnV3KCWMSsmRTK8YzH4ckFLnlx+H9IuLOBUADAIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NyNdAL2rNBNhuLH0St4urgBJcMtG/V40/N8hTjEpio=;
 b=whJg44MtVi6fZjIlakjah0fXAEAKzt0yaMAMU25lzdogpH1Cmio3LnI17pYz/DTbpPNPYI46CI8jQigb/2nal1jIy6aZLaTqvjMr7hy5UbM2NOMr4Y62U9MpWnGFVOlFRvHXHleS6E2GCopgdjfz32i2gmbOakSN2iw+6gdDfsYy9nIrqyalyEIl5Wkbrxfvhr2cnT7ycJE9sVXDImWOt/yZXehadMVimKL37GtGO7YHDnJiFzg/d/tdiZWWMX8vY/7kBidcgTphOftfU163JVoJ1f14SeXE+VHESBelDTyqK0MlC1/BejQPVqQdmr6MenNRo/+Ai/dUeQGCHjgVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NyNdAL2rNBNhuLH0St4urgBJcMtG/V40/N8hTjEpio=;
 b=m2EWZ1K9ytzAChBNz2fPrfoa7O9y0SXSgk2X7s5sZ4FBL3+IwtQRPZb8PsNvooHTvU1qDeHLGRvtkHKWyMG/zKkDefDKUYyWa86BnffA2Dgz5qAcco2csdX/dvBY9TRRpbAuU/nh3Vwamq3U0e/Tq4nln6+mnBJQSw3UW8rVRGPefrXjA1HoXtN7Bpl0b5SSqrXGLgAUWZxwkyS2uVuuXMzP6+CQBtGOyJapVZPrzyJAEpT3Qaz7EUU4K4vieCylduHxV9lVraogjc1tWKhtDZ7l3z45kntYfh7jUrqePiIWuGbbrhHEjTJUkbAol8MCxQiYy7hqpWElIfRi2TYnNw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY8P300MB0062.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.19; Sat, 10 Oct 2026 16:32:22 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 16:32:22 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 11 Oct 2026 00:31:48 +0800
Message-ID: <SY8P300MB0041EEB4A158C2FCD79854B4B5912@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-Change-ID: 20261007-visionfive2-bump-linux-version-0de383d488d3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679; i=tfx2001@outlook.com;
 h=from:subject:message-id; bh=xnv0G3isd4pzrA8AGUfeOS7cldI+9A3iKISO0T+9/6I=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBqymhzrlHsFXC/oqZUokb8Uirfj/WUTYKfYmC3y
 NkE3x1xBE2JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCaspocwAKCRAcD62l0/wL
 2iRfEAC3KzhKROGZfI55fVdqi+3YCUepWco3ei/llH0FULcwKVz7+Mo/bTc1Kcnu5NNJWBJbWUI
 VxE0GwtJBT5HX6vmVHYPbvzukLVQOCvHBN/EfPZ2NotgHlvt+szhaxy0AAYFbVKMDf1BakAPXBA
 gEaZDvQ1Mq1X1OCVNfwVqiJcScodFvLW+90VwwU5H/avRd2q8pP7D67XUoGPk0o7aO13EQSH/tO
 76QmCOPaC8BvIZgomDB234bGFIQrxT3aIdfU/bSyxLtwSFKvjTV8i7GSZ+uAbBDbGh0RkN0V6Hv
 u3iKb8rTeg2oNMtBw8Zleur8x4BDii8A0YMeISgXFKqoIt8qh0jBI2a4C093JBBTdY4Z1ryKZ2O
 W3ToxtNE4Q2VCdQ7GmygMTRT9Gba//g1C4aFIiVhAVh2LET5+Op7nqC1QFxa8I7M3wjjXNgUPWG
 ZruV/UFkSs3QGDKhIDGQ98ZVVWsL6Htpl/jNzM6O+Zfymg8fl9S/yG7kpaaJ5+LIIewtcOIds2x
 RWP6Ql9FIiBb77PDzuKM8l/COSZjurAgV2NbWBQEtafObkS3C3B5XUzxE0bHHmi9qkDOlyr2fwh
 JqFyoYgyz2e6fjrk1Hu3Qa4RvEbBpeoBW/ogPqTkropjdI0/HUj46wuCss/dZzv4l5PARC43BXN
 kBlNKauS8/1NXhA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261011-visionfive2-bump-linux-version-v2-1-4c3deef59a0b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY8P300MB0062:EE_
X-MS-Office365-Filtering-Correlation-Id: 586142c2-3e76-445f-02c4-08df26ec0f52
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|6090799003|15080799012|23021999003|5062599005|51005399006|19110799012|8060799015|25010399006|12121999013|260925184616899003|24021099003|3412199025|26104999009|4302099013|440099028|1602099012|40105399003|10035399007|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVhZdmkvelVTbDYzR01hRi9QSCtGd1gwNmtvSXVtOTZBZW5KZDBhNWpXZFV4?=
 =?utf-8?B?UHEvSDdYNENsS2xGKzdXZ2o0bW5TUHBOb3VCWG1hWWhNbUhBZm9Yb0dVMjg4?=
 =?utf-8?B?K2JHcTVzbDN3TzNNRVprM0lFcGdmR1pRNWdmMjlQN29iMUkrOXRHZUtRUUJD?=
 =?utf-8?B?MUxvN0lhNUs0cFcrem5uTXhtNkZFYVR1Z2JsT3MxMURua0YxOUZmL1VTMnM2?=
 =?utf-8?B?a09Ca2F1QmttN3VUSFdSL0lmNmpDaUU5Z3NNRU5DTTg0S0tYYUN3TW9hSEN0?=
 =?utf-8?B?TFl0eFRnMlp0cForRS9idlhwbU5hZFROZUpOakN2d2NoRERhREFwUHZlQ0Vi?=
 =?utf-8?B?VjRQS2xQc1p4dVBHOHhDeVNHVk1GYTVwZ0xadDlaaWlHNFJkUnN0S3FBYzRK?=
 =?utf-8?B?L2VIKzJudGdrNFB4WTdWRWpSRzlsTFBBU3VwQ2FVMXRXL21LcTlPM0RwSlRa?=
 =?utf-8?B?LzhHSE1EU2tDRWZUTW9rRUxUS2lNR1loaERtYmcyNUhmY2xtUENYNWM2QzFW?=
 =?utf-8?B?eEtjOStvTFJNd1VyMjlFcXNPVmZuTWwySkJKVVFFQkgvSEFJcml4Wk4zRmZE?=
 =?utf-8?B?cGkrV3dMNlBDWEtSZ3RCcVMzQ1ArUDMxSi9pWkx2SDAzTk9rMC92aWIzOWlE?=
 =?utf-8?B?Qi9MN1JvaVhjcGkyc1B6U3FwdmZhT3RVQlFGTGpQR3FwTkxNbEs4K2lxc2g4?=
 =?utf-8?B?RytGdURBdG9XUmM2cjN1bWlOd0p3NE5nL1hKU0dsb1RKMDR1ZkJjMXMxMTho?=
 =?utf-8?B?ZWtNRlFGcDdkWU1wQlhhR3dZTzNwalJqNFNSU3djS2lYcDhGRTRpS2djZFBY?=
 =?utf-8?B?L2M2NmtkamVUTFoxeDVwVno5dWNqWjh1eDIyZmpwN3FLKzJqRW9IZkUzUHZq?=
 =?utf-8?B?U2VDTmxLekllMW9mWjVuTzVTVXQ1RTNLQ01palhzRWJHTEhNbWRuaEFxVFJj?=
 =?utf-8?B?WXZpV3M0NG9xQ1pYaHNvbHZ0TlFCVDhucDBYZG1CaytqUjFnbyt3RUd3MEMv?=
 =?utf-8?B?cFkwdGUwcnNCS3p4TzY5QlhuZFY4M0lxcTY5N21LUkEwdHFnOXNia3RLVjFS?=
 =?utf-8?B?QVNXa1RSODg4R2Qwa3JXZGV1Vko3SHowK1BubmJkUk9CRyt5MVRXTUZlVXo0?=
 =?utf-8?B?V3c3TDMwRWFwQTdjellzbFR4dFdzSGp6NVJQT3dpaUR5eGUyQVNtOXg0d1dO?=
 =?utf-8?B?MHVmZ214OXo1SEwwamhJNzRtOVNoLzVhYnEzL3JzZThINDd1TWR1NmJoVEhj?=
 =?utf-8?B?ZDk0QnFKMUZKaE1HSm9nQVV6UytPV0tVUC9ERFdUYXJ1cXBYaXB1ZTg1NVlj?=
 =?utf-8?B?dDFpVTNOdmQzZ0JkdUgxTjlxZzRPWnp3QnYrYTl4Q1l6L25INC9vbVhKY2Iw?=
 =?utf-8?B?YzVmTVdXZElhQ0gxRGw1SzZFR1Jja2cxNHAxVjR1RGcxNFlMYlJiQ2V2dkdy?=
 =?utf-8?B?cUVHK0FIUnFtdkMwWFk4S3Y0ZC9PZEEyUG9hemd3V1RuOVlKaFV1dUpyajhK?=
 =?utf-8?Q?pMmOYw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWpMRlNtS24yalpkb2EwQzBQOXRoNmNMSENPWFhOR3BBeHl5YXR1QTZxeEM3?=
 =?utf-8?B?WTdKRnd5TjROSkcrQlYxd2s4QVNsRFBSMlBOQWJncVlBZ1AvS1hjdkJXZTB1?=
 =?utf-8?B?T0FaTlgyNGtaWGlNOTBTb21IVHBVWEZJUzFCVTJreUxwK1BSdUM0MDlTZExX?=
 =?utf-8?B?dXRhUXc0YTBWZjE3QmhTeGVhTERIdVlIdEk1dTVyN08xUVM1bUMrbFVqSlZW?=
 =?utf-8?B?dnNWSTJjTUVxeWxFL205SzB2RzBSdXlyUmRGK1ZmTVlBbExzNEJ2Y2dFY2th?=
 =?utf-8?B?M2JlbGdPelNpNW5FbmVsNk9hNUZSM1dPYkkzeGoxMlVkNEFDOGVwcTdUSjdw?=
 =?utf-8?B?VnU1d1MwTDJxcGVUZ1Iwc082eVptN0dtN1dTQTRvaXRRSmExQkNqOW5YZnFX?=
 =?utf-8?B?em1jVkJLU3NtLzlLY05oWURUK09MN3YvZ3dJQUdSMEFXcWNLbk1razZmNVdR?=
 =?utf-8?B?MDhpLzBqQlJvNjQ1elNVOGpISlZ0SkM3bHFLd21FRkVSN21sZ2kxZ3FDTENW?=
 =?utf-8?B?SlNkNFQ4aDZnd3FWTDJaS2lRRnRmUlpEOGVZVUFVdWJ1MFZvMjBtdjE0S3lt?=
 =?utf-8?B?cVQ5QnVLMXJ0VDJmOWZCU09TcUdIc0dxT0NLV3JzVlNwM2E2UmkzWk9pelFD?=
 =?utf-8?B?TitkOCszQlJsd2Z6dXJaRlJrd25CV2JxTTZEanJzdExhTmlTQWRLWnFlblYx?=
 =?utf-8?B?ZnNwTDdIRjA2WW9ZQjlZYTIydGVkaytzMk9NZ056TEtPakJaTzAySUxWSFRW?=
 =?utf-8?B?Vi83MnQrR3djVUR3T2pmbytFOERoMzNFTWUydk9tdFhQdkZVazNITWxVRzIy?=
 =?utf-8?B?RCtGdXU1ZWlBdFRZZDdNb1VTZWs2djRFZkR2Q25WSVZMUkZYQVFtbkdWNytv?=
 =?utf-8?B?aDJWcmk3dnlrOGJmcytVTVh6VDhiUDRNZ2dFajQxL3l2dTVHVFNaaTh3YlUx?=
 =?utf-8?B?YkdhVDI4WkFmRys0K003TFF1YXJDTTU5ajhPWVBKZWE3TkhXN2JGWUJvMHdq?=
 =?utf-8?B?TzlramhjTnc2QVdsazA2emQ3LzVuNUJTTy81S2xJTUZuVEFlUm9hRjdpRHhR?=
 =?utf-8?B?Ty9rRTRodElPQ25wL2xkdGQ3bWlLSHQ0WTRzR0RaRzdsMTRMYUJidTU4WUVM?=
 =?utf-8?B?Z09vZVRrNzd5VlNhdStHSm9NU3FkNDVoTEZWQjN1SWlybVByWDlIYlYvSEk0?=
 =?utf-8?B?MngyYW1wQTB5Nm13SGVkTUt3aWRrN1hna0hXWW0xcXRBWWJVcDY1aTJ1QlRX?=
 =?utf-8?B?c2p4M1UwcjhwbWhPOUZTbFR5R0kyREdqSnptQzhGMlZkS0VVeEJDM2R5R3M4?=
 =?utf-8?B?d2lWODk4MW9GeDNKbUdhNCsvNDNtaEtZbmlnbWNsUW4rdXN0Wi9lWnVUeHJp?=
 =?utf-8?B?U1JYT0ppWForajlIdzhsWVlFZ1lZZFhJdkd5V1hYcXdrNU00b2s3SHgrZXlT?=
 =?utf-8?B?cXk1STY1c3RSTmtCOTZNbHJRb085RWtndVFYaXdibGFQWWUzY2xJK3V6elpz?=
 =?utf-8?B?UGYrQ3h4Q2xzTlUxTTg5c0FSY01RYW1JQkVQb2xuaUN4ZzZFb3RGZ1JIZkhz?=
 =?utf-8?B?Wks5SVlCN1dpa1owOTRtdmJidENEVkswVDVwUDlETmJHK2NJb2tveElzdzFz?=
 =?utf-8?B?RG5TcXFHaFZBMWlsRjlORGdrckNoMTR0bGc2OVZiVTlNdS9VcnBtTFdJQklX?=
 =?utf-8?B?ZmNkVjhXS2E3bjU1YVhnaVZOOUk3aWtNYWZPVi9JQjRrNmF3SG5oTkR3Ymxy?=
 =?utf-8?B?TmQxdzQxNEhFdmIrQmZ1WHprUm5sc1grMUgxQ1RqUnhpSFh6bHhjY3RpWWs1?=
 =?utf-8?B?TGt6N0VRVkRvWTk3RXNOZ2RDdG9LcWRwZUxYNXhHT3gxQTUzTW1qc2lTZjFs?=
 =?utf-8?Q?T7FDtP+xR4LAk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586142c2-3e76-445f-02c4-08df26ec0f52
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 16:32:22.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P300MB0062
Subject: [Buildroot] [PATCH v2] configs/visionfive2_defconfig: bump Linux to
 6.18.55
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

When running iperf3 with Linux 6.18.51 on VisionFive 2, one CPU core
stays at 100% load during the test, while network throughput is limited
to approximately 793 Mbits/sec:

[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec   945 MBytes   793 Mbits/sec                  receiver

The regression was introduced in Linux 6.14 by commit df542f669307
("net: stmmac: Switch to zero-copy in non-XDP RX path"). It leads to
misaligned access exceptions when parsing packet headers. During the
iperf3 test, perf stat reported approximately 9.6 million alignment
faults over 5 seconds:

$ perf stat -a -e alignment-faults -- sleep 5

 Performance counter stats for 'system wide':

           9620073      alignment-faults

       5.029337000 seconds time elapsed

The kernel must emulate these unaligned accesses, resulting in
significant overhead.

The issue was fixed in Linux 6.18.52 [1]. Bump Linux to 6.18.55, the
latest stable release at the time of writing, to include the fix.

[1] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh

Fixes: 98aa14a186e1 ("configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1")
Assisted-by: LLM
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Hello all,

This patch fixes a performance issue on the VisionFive 2, caused by
misaligned access when the Linux kernel network stack parses packet
headers.

I noticed this issue while running iperf3 tests on the VisionFive 2
board. I captured perf data [1] and analyzed it with LLM, which
quickly identified the relevant upstream kernel commit and the
corresponding lore archive [2].

I rebuilt Linux 6.18.51 with the fix patch [3] applied and retested; the
issue was resolved. So I am pretty sure this issue was introduced by the
commit identified by the LLM.

[1] https://gist.github.com/tfx2001/f1f10ee1274acb7063ef1def5f2b119a
[2] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh/
[3] https://git.kernel.org/stable/c/2ea42936416b29cca42b2c7bc7d3d3768f77c199
---
Changes in v2:
- Bump Linux to 6.18.55
- Link to v1: https://patch.msgid.link/SY8P300MB00411684A8A44ED2157BB57AB5942@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
---
 board/visionfive2/patches/linux/linux.hash | 2 +-
 configs/visionfive2_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index b2cfc9b7e7..63b8047edc 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
+sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 7ce605b84b..6ae6f25a8a 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.55"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y

---
base-commit: 1ab8f8ef5af5a170a1ecbea3209ca39afd49194c
change-id: 20261007-visionfive2-bump-linux-version-0de383d488d3

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
