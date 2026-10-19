Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E4BCCF2E5
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E2380E02;
	Mon, 19 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtbC5EtZT9vi; Mon, 19 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 688BA80DBB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792419484;
	b=tPiwWiBMQUoaOVyutOeMXSYrH/pj2nC7a4kS7cdH/67cfZ6Ky2X+KSIq9QDrKevvEY5X
	 oRdaVSgDb19wRaMmdxlR7UCYLHS9QWGmkZc0Lxaop/QTIE5vL52CMgKYCUrJDyeGEJro3
	 v6Dyn1RXBOpGd6p44ejDWozMoyoxt31LTgKkIxOyigoiBnC2Awl80989WE2PMBrmcRhuL
	 +LdQxGtXxTu1bueTZTrtv+0FdHgD1ybFitqWeikTjeQPoPZrGj60cdpSD4SFrTizx8Ih5
	 GgguAStWpmiZ1j8kXbziQjziohcI3shU2TYJ+fYN6NIeFZpc52gioIOmsmd8nRndiNA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792419484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:To:CC:
	 Message-ID:X-PGP-Fingerprint:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=rlgzphh218rsP9dwUi86BlXUXI3hHXbzZeWNZimG0Uc=;
	b=MLr0AzQfI+KdY7RUCyjInnVVcNExZBbFI6HKwUuRUgQET2kEKncwBk7reZZEFB/huhhl
	 YT9Rz6916lO7z4vaDwkbobPxGLTwUHMNoUjRe+X8CD3rzdbov2uI/8lWW+eckUYXYTdhP
	 sQjcssL0xaxqPHmlo1dAtIjiH/7LydqFtk+EB/oRFZYeveU0THfXpEfmGHczwBPPc7YH8
	 iQTTnUe3vpTQ5C+D7YPwk/vMK6xBTxiiyiUXJjR+l+z3ClURcmz5yvN2FsocAzISEirv9
	 MszGwT2VhmaQDcJ4zKceP8gsWHh8XdvYM8aatpom3NuAgg5b9a3QWWZyj1SXHVC8n8Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792419484;
	bh=rlgzphh218rsP9dwUi86BlXUXI3hHXbzZeWNZimG0Uc=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TPYcTLjmpJxejnuWXwrHTuoHJzTkcvS/uWi1R+ow8L6hDSUaj31rvDbiS81UfH8c9
	 RZLlhxCKt6zMK88aEeEcxEPPb1RbdvC0sWvjAp1+Cp0Cl9LSveNzHiR7vo7ZKLDFFi
	 dw4D+6aN6q1gsV/34JkzAoNsBZUPGm2S+8klhEeKzyHOJbEKlNIx8WdC93MYA8/CdI
	 L6e3tRL3hFCOu6ZGa7SDhMcv/LlZ9jMDY+hPnaxpZiLN4w3ld1hMOYtJlTTXMukMXE
	 mzVeqGYhxs+XNhfoVMpG3BlEqMR0CMdQ6NdCZ/9/RtZ3E0STWpttp5/7wRSCdgugew
	 KHitxzhkfhGow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 688BA80DBB;
	Mon, 19 Oct 2026 14:18:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F271AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5289840637
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2_z1HxTdDOp for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 14:18:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C98B540633
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792419481;
 b=H/4mwC6Mow9jG5sJiVqHyCXiAW1eJ5mY/qtbZPxfuqt4lnc4bqbE6OFjr1h8QXpPqEpp
 oZK8F+fBjBGxlFzJqNKzutAmJ8yrv+JyEWFWG93qYvtSsuG23rEBcNYF1wWqac5n1xepc
 /tDUXYK8AgDnycq/TDvmBM7yS/PEfYWMj7GBSScUClgrDN1h8EbhT0Sp0g16KFBp0344C
 rBCvH7WlxV4bjC40LMZpIJVK76px9w+dzHH2dpXFPy3qwIaX0nQwLS5Uo/YWlgbjWwI/w
 eRCivw9Xjv9urKRm3nezzqJ9HD1UExxpiisktrlgl3bJBc+8daMvma++f58W3oambpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792419481;
 h=Received-SPF:Received:DKIM-Signature:Received:DKIM-Signature:
 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
 Message-ID:X-PGP-Fingerprint:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-EOPAttributedMessage:
 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
 X-Proofpoint-Spam-Details;
 bh=k1SfslDZxhMNVdzGw6JtVAR6K7v2toID0YB7Mtgrk6U=;
 b=Og46hCRWC53EgJi0gd7U5lvHQdRaxBn7Wivac3AqaK1FTtptvmRuxuOD8UEYNvEIV6A8
 40bz+fqkFkEaBIhDMRAqWTSXU/lHZwX0Q+hFhzmzko162/dFVP/0WAuvNxsfTfJhckKwS
 5bn4xhGiREB/WJratEL75EsobHqqcexRc9L8lkqzpHI8ycNbE4Z1d1I6zUI3kNz6HmLMq
 PgQsplg/LWvr/34MZSk55gj0aVUmr5yq536fTmuVWFx97Z1PLoA5GW9k2mOdwCjoAsCjg
 F05zXXIEjG/dG653kKVeXoC4DS9Ymjgg45iXHklqJZ3VeQhOinMOietfOj9QwZ//UJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=ti.com;
 dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=proofpoint-05-2026 header.b="lmW/zPdi"; 
 dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com
 header.b=hXR4whFk; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C98B540633
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:18:00 +0000 (UTC)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
 by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JDwekP280379;
 Mon, 19 Oct 2026 09:17:59 -0500
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jpept-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2026 09:17:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKNu+PQH5G4bQSv4Hxq0Dvu7Ghq0ZHZmeXRN/n3OnNkt4+JGohw0ItzgJvj0pzvU6S/9qbdF0EqZsVbhvRNe1tSZPPb2R8oIYq0XChKFfx1QTVfuYgPRz3QeOlZRQ3eYGliw6aLb5dqISCyDukEleyusXCxnc4rJm+DNWcJAeSn8HD2xKcmQrQt01XLZ6X+/uEgNjc66fm96QnhYnV/9ReSI2r3ybBc2iANedGtlZhB/pV/24M6n/gjE+ztu+EHBn2msZUUpvrS0MnaFtcXtD7WcG18+YKKSJSkikUkzLYsdM00+6QJu/8deNIzZy5zkbkDgfXGRAWcZEQN5+xZ+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1SfslDZxhMNVdzGw6JtVAR6K7v2toID0YB7Mtgrk6U=;
 b=o3kHfWzjUDdbr4KL5sT38T0T/t1o46ba5US+bGQJjJlYa/9fu6MkiZ3go2cDp9mIPHdd3+QV1/LI2nqphiMDXx5Kqv1bHeNr5ylzQ6LSfEggfeM6J0kCi0/WCQqfMiltiyxkf3WZKuLZ/IRJaGR/Ws3HY1M9MB8CKQpePPJH1oPhBU+VnSYjYqIfTfEru91jLL9k6Xy7GRDc7GdENQniHECtc9wql02kghEpdFQlgmc0k3Tp5u5YtFiISLX8O8gCNVQKOpODeXlswtvFbSb1irqid1OXwBwYVwFvlg7ge1XOacg3vP+gQEYe8yuHmrsM5EMZZkQCkYSqwLotVUYA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:17:54 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::44) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 19 Oct 2026 14:17:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:17:54 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:17:36 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:17:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:17:36 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JEHa5c2947987;
 Mon, 19 Oct 2026 09:17:36 -0500
Date: Mon, 19 Oct 2026 09:17:36 -0500
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>
Message-ID: <20261019141736.vxoxhvfebtxevtqg@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
 <20261014-uboot-fixes-v1-1-2676fd37a97a@ti.com>
 <da1ddb5f52475161b61ff86f347c180e@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1ddb5f52475161b61ff86f347c180e@free.fr>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1011b5-2f2c-4060-1e63-08df2debc42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|22082099003|10067099003|4143699003|261009223027099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: iT5inebexFmPYnSf+oVMtU7LIXPsSQATChjJu2+oTDVJYhO3RMUXKYM4modkjEUzr3ILVhQwDqxpdfzA/v1ZLYZmiF3KWEHtQtM1sKtr2/CfRQ4wMIs9nWendOh9WpcUOslStF5tMAH6iHyeEDpQPzFciR0RtT4gje4OOGhPBqBgIURD9MYm0NaFhfo0SC0AAyWXbX/2LJq4KBcYu1pOe0XSEzL21uNkirRsbWMwXvhp8Npk2BCgbEsF1PqZ+jd0cEKBGBFzQCw9O/IBus+cIB2lHejLndtQM2I61ww+Q/WeSQxr86ryi3JAWaiHRHQBD51d7k3G5SOPCmffXRwmaIi5Re/kei31vnSQMeH/SgZZgZDn0+yXZU08ftG72Wn7e7TLGaP6AM0lxa1L1zccMGbM55eapyYSBuCBY5uk5PoHaMA1XFui4yYsCmGKHTwxEyJ//VX1fcIuwHTggaJkGZqGDruaQhCY+1YD8ySKoDAW81pSGt2PQMdGH4qVZmBRXN6dSU0xX1SbzTsqOxCKaeTfraMxsR/qySTpAP9HEMefHmSIpQh5qkJSfgL7L50qpFdmlhOmX7mm0Eum3hOBU1Yva4S8MZMbCxs2kXEhquMwZQUfDX8rpSY3SAdakS9r66x/Rqcg0hQHPLgrqWnNAOyKntdaQIeiOumCcJpwLrzDiyeO1o7sCDwza//2hkUQSzwO2cz5wRpiGFsYIbjfJiblDtzQg0lSHeb47sE57XiPo/0ovgKz2r30roTkW2f3nO2wdbkNsSLNMFeXeu1F6w==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E6JhSulNyaljvCYCfd2CpZuzyHEn9zgR9bsT6LsTXYGoXHYf+imtin3XtROv3WHKBmqToRC5KPOVuxsOaX06G6RJ2dzx3V8fl9v6MadUXzefMg4dz61IOEoReK4dYliGTq9pGCmsTFSoKwmR6NsIpH4RPKNNj0iPNKx5xA0gG0R9SYoxKEGQ45kH13qNsn0/gOG/itTa53/4Jp3lzaarsqC2hPobj1s/xKDqCjDNKrtLvqfh2CV+wB+LV62hvPAMgqpRKahR/xZLlaXahMBoF5qWzJ6GbKVxhP6Cz0++pdzC5Xamol9H84A1GizHWN5cMM+GBCnKmwL6Omd+2TflklWvF+06o7GE6Te9qefFcWRW2xlhs1Z/K35uarEg+HeR78OYvCbXg9XBciWOoFpy1TIUUO8ftrXruvy6wq0Q7tRme+WFMHMATvebSXTBH8xL
X-Exchange-RoutingPolicyChecked: dJewWvk/LFUicWsZxISdCdMH78M4AvBr0/fKlMRQgErwgzy0Q///m0eRwqMWsm5u3DSVd3w5S4Jvb13j2gRhNH0yn2Gi9hGMsS5V+ehmS7BdmACFzW6loi8IQ7iIOgorDniVFySrbLaLFvp3akBeU+/k5X54KRuXbke6aro9PaL5sDFRNdYrLstLZBCnKx7oQ20yiLvL1djqOqNl4zPIa2t9DEBRY42R/RPjLftsPc3Wc2mizByangoQkFY764/rnKcmyvYYfxJGK1YY+CzJT7s5WyuN3WOdxMNdh/z09+BSbAkhHdb/C4kGf6gAto76lEKPf1SP9Lxd1CfgwtR65g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:17:54.0532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1011b5-2f2c-4060-1e63-08df2debc42d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-ORIG-GUID: iYPDzo-bF_LgHslkKwrOuy9mCTp9hTaZ
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad62697 cx=c_pps
 a=JXicDZ6CVi74U63V4YFJkg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=p0WdMEafAAAA:8
 a=YRHvXXt1AAAA:8 a=sozttTNsAAAA:8 a=r0UBTMTOJqwyHRUxTBYA:9 a=QEXdDO2ut3YA:10
 a=9bw_jnHfPby8klRCszyn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXxf/TDat0jylv
 fVD8voLK6vKvRaHU2rXzdtjl0loU7K89wvJq7e/ckEwctvJzwYQ3iQ7BpHd5EWdD1k2hU3PLW4t
 qGAeIZ1Wvnkcp6WWPqVx+z0Cy/JvBttD49VUKWrmvSINBdsAGJGImeH2onWZUczVbGK9OdMMpBg
 9dnegYklrwwu+QX7Wzdw8Lv4OgSTjoB00JT8yj3XVkNlrEFQlhXapHehv4UuHH7m70hOLV3w4PQ
 o2THtxzr7p5LLU8upwqeytG9dOR4GDAXFiaVWKApqoLtNS4ZrzbHyNhUrHQ0fgLwQwBr8pafN6h
 RKQmUaI+8Z39S0ciKOo47s4w03XEMzu9IYnfo2LG9J+j+TqKgDnzHfxdBITOOBX37tQtGizNr8Y
 h8OLRe4AQlkkHlZszNCCSa1oR8v9c8a2jDDUEagJ7xs0DuhbP2+5MxEB8fDiJTK44dzY22dng62
 2/0mhY64q/vuDhVSSjA==
X-Proofpoint-GUID: iYPDzo-bF_LgHslkKwrOuy9mCTp9hTaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX3DTCfpCEbha5
 9wZGM8O0EGC5yZs/KEn7O2u/uphBL6IF0CbTrJp7mGdcWtix6VliqU+nKGP+92xBKohRtTGkL9H
 2Qe6pk2T5BJm/fHZiXYVucXSg4cL7S0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056
Subject: Re: [Buildroot] [PATCH 1/4] configs/ti_am62ax_sk: bump tfa,
 linux and uboot versions
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On October 18, 2026 thus sayeth Julien Olivain via buildroot:
> Hi Bryan,
> 
> On 14/10/2026 19:10, Bryan Brattlof via buildroot wrote:
> > Bump the am62ax-sk reference board to use the latest stable tfa, uboot
> > and linux kernel releases to pull in the latest bug fixes and features.
> > 
> > Because swig 4.5.0 removes support for Python 2 compatibility we need to
> > backport a patch for U-Boot to remove the Python 2 macros it uses to
> > generate the final fimrware images.
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> 
> I applied this series on master, thanks.
> 
> For info, I did minor changes to fix check-package errors.
> I added the missing "Upstream:" and "Signed-off-by:" (with my name)
> tags. I also added links to upstream hash source in linux.hash
> files. See for example:
> https://gitlab.com/buildroot.org/buildroot/-/commit/5ff10177c49d18878e44a1d8ab33e24d1e72ba50

Thank you Julien! My apologies for not catching something so trivial.

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
