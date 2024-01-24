Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8D6C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 16:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E931A60E19;
	Wed, 24 Jan 2024 16:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E931A60E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4AR10FZHWuA; Wed, 24 Jan 2024 16:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57DD860E44;
	Wed, 24 Jan 2024 16:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57DD860E44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B38A91BF3DA
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F5FE832C6
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F5FE832C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PxSfjQToJop for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 16:21:26 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2620::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F384A832B3
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 16:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F384A832B3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM3A8afl6D/JYEzwuYSpWChhJOjxChoJxaJ6PDbTy7XQCwxVZw+Tsmk8X1BFpmChO0ckVmclrDLcJGadMWdmJ5xfLRL5CUQkPXhC3AslDJOlthe87yWQK4EwVLGkAj9jTGmw2f5gdzeXkh5koiHS+rr5gGSD/Re8jvfWlq6U2hmdnLHRQi+/nfYXfG9BhaX1E78Ozlc5ZjBJHSkc1MefbMmutW7cma7aTCmqjz+8/OVV2nQtQDR5cL3vhLumEyTXzjzkHo+6tGrvQaK3/sfX9qY4fQXrLIEXfH/DBctaFG0dGVtqRclUAMMvYT9B01ViO/Pj3msWzRmhOD8n5E3T/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx05Yve8AZKS/lC9uJvPW7sm9MNlCaAH+kQlhpXAhcM=;
 b=ezt7bfRIDjQPLjUMOmU2SyuMQViVE+Ryv/A+Dw2c2JAWnusR88ACVSAQnRFG6BgLmsXahk8FFeJpwLApaThjEKuSVMevXkmQ/r8K1diFMmX9px4tBojSFIBZAV/lSB4s39KXXDpDD8jH0nAWcRWklC1a8VK/m8hKmNlaQnIn29pp48lP4xneBH4yLb5vC3kYYXxRdEJ7OtKF5EhqS6j0KJG4cQKyIszgpjKYksMI2DIJdC2lT2QuUOfchZ/Z2VdVKEnlkKqe4XhwkX35S/t6kcoUJPuFYwy6epkStzyZdbZWgBxdlZOjxnG72fBaC0TpdCH8BaUyQ7KtGM+yRVeLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=acqiris.com; dmarc=pass action=none header.from=acqiris.com;
 dkim=pass header.d=acqiris.com; arc=none
Received: from ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:55::5) by
 ZRAP278MB0804.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4b::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 16:21:21 +0000
Received: from ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c21f:1acf:92db:d310]) by ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c21f:1acf:92db:d310%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 16:21:21 +0000
Message-ID: <3c2e39b3-e19d-44ba-a46d-95d768516c59@acqiris.com>
Date: Wed, 24 Jan 2024 17:21:19 +0100
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: Didier Trosset <didier.trosset@acqiris.com>
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:55::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0973:EE_|ZRAP278MB0804:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cad2840-ccfa-437b-36f9-08dc1cf8802e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrTdIL9ncXIgWZPMRC7ctkKGGZrt7dF13BAB9+gdUljOL65AXPyDgHbneXHG3TaD/JnWo8PcRL52kCNZ3bJtibF8TOcMsRazNy/NfEcpvI4AXjAFdZKRU+uDqjCLbG59VUf1oRloQvKS+S62t9PLKqbh49BX8pvyEUc0yvPesNfaBxhhcoCDZjg9f/7P+etL4VV9KqvETwuuSYPZTkvPqex/cG+4S9tS8Pmnmg1vS9rMGXG10tofdfYxesYZuAA3cvtap7SatSWa7m5/Q1Aiwf0yX+loa+nfALtpqWdNZIvSXu7087Vw642tFl/QcG6VzEOSkU0v/eT87dcw3CqNA8BR8raq7iIB5pDGzcGNt8E1KcX0LsPSuFXXHEUIgu5x02TxTSGTmMxxI6fOtOGehztV8LaSlPYFI/aHREwVKZ6jJ6VIkpcB/OaEGfjldiJ2ona8xxtQKbjTvp/4n8P0HUxnJs/ZH8SrBDAE0BZiSbnrnLNFgIZTaA4cyoIUrYuMcV5Akx30VSUJCxi3O4jiD1gwC5ixg+FbseAKyi0DOENjiY1KbSQDEb9N7MKPr+ybo/OavMF+wb91QnwO50bHNvNHw8seqRoo1F3KkhGws3G/SZ+bAYUxHdDI38zg0vRNoA99a322sU8HjmCmgCGscfPKLBxy9KrHR80TT4PekNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39830400003)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66946007)(66556008)(66476007)(316002)(6916009)(6512007)(6506007)(38100700002)(478600001)(86362001)(26005)(2616005)(6486002)(31696002)(41300700001)(36756003)(5660300002)(31686004)(2906002)(8936002)(8676002)(44832011)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dOa0sza3BvYlMxbHkwbXUwT1NFaWd1K3RFSGxiK0dSc2REbXhuOVRiSG8r?=
 =?utf-8?B?S2Nmek1JUWg1b1NwcXJHUC90UElBZTR0MHBmREk3Wm9MTWdYWGtzT3B1Mmps?=
 =?utf-8?B?MWtxTVNmMEE4RE05WVJObmg4dlY3U2t2alNzelVpTVpUbnludS9qNjVYU2lT?=
 =?utf-8?B?N0ZEWDg3VjNLcFp6MzRJdGt3OVpUaCttSUJxcFduY3BuVUJaVXd6bnZaOURz?=
 =?utf-8?B?OHRqWE01dlBFbW5kUlUxNzB2QXVObWh2MlBSaWpnQkxGQWltamlZSkVndlFO?=
 =?utf-8?B?aHdOaWkyWlo5TlROOTk5T29vdUN0K2tIZXV2cTJPTG5KM3V0Vk9YSmlBRnZK?=
 =?utf-8?B?SzJ1V2p6YURMa2NubUdpQ2JRSHZRZGpnRlBrQkZkcXB4dTlXaGllc1dFZFlh?=
 =?utf-8?B?WWVvUUFCVDdJcFhzSzJVN1QrYmpLRUcwaTVuaVFyeFRLTUpHNVZYbnB4Nk9B?=
 =?utf-8?B?NTRHMDg1ZVFxU3VWeDF3SFEvV1owK3d6eTNBT2t2SjRLYS95L3hUdzQyaXFp?=
 =?utf-8?B?S3djZVNsSUE0YWJTWll5bzFteUJDdms1Nk5OQXZ5RjFaZzk2bVFqRTUycW9Q?=
 =?utf-8?B?SlcwWjNzTTJMa0I1YlpqbnByRmN4M3h4M1NneEloczV1aXhvZFFSWGZKamhs?=
 =?utf-8?B?MGhxOGNqMXdrM2lIMlVDQUlDVW4xSVRJc1NoS0dhWXlwMWgrdmF6YTdOU2Jv?=
 =?utf-8?B?THRyTm1NTHRZVjRlV09kNGNwM2lhMktTR2xXMFp4M21GZ1ZVVWV1bUZGNW4w?=
 =?utf-8?B?ajZKeHB5bEU1dW8xOFVzaHVpK3V1Z3ZaeEN1RTJoUnozckdlU3EvMnJSK2pR?=
 =?utf-8?B?bVVDeHg4QnF5ejhBK1pSUng5NWtSaU81UDV2TFI4ZGh0SVc3aVRVZkwyQUpm?=
 =?utf-8?B?NHU1aTJxRVFPUXllbk82cG5GMkNDV0VFUkJJN2FPNjdVTGpIWWFnYTRXejZ4?=
 =?utf-8?B?Q0hnbG40WXZIZm1ZOWdqRFNBdVdOQkJDV2J2M2ZsbnJLZlRGY2I3Z1lOdG1U?=
 =?utf-8?B?alNya3dkWm9KYis0d2F3RDVkeUdZYUFGMG1ZcldJOEswUm51QWpjM3N3cWlO?=
 =?utf-8?B?SnhTQUZMWUN4RGZhSmRkV3pPZ3pwMHNjZ0Zxd3dhNUV4bDFHR3RaRVRDMURh?=
 =?utf-8?B?SFJSMDVHaUV3WkI1bWtyK3VNaVBjZE9hMmNxK25vbm5JakdkNFNoY3BsSDRz?=
 =?utf-8?B?NmZzaWNiQXBReElGa3g1ZWpIbi93cGV6cVA4bHNRVEU1TThLRVdUVWtwWGk3?=
 =?utf-8?B?cGlUT3FIenVXc0d5Nkx3bTdwVysvQWY0RXkzdGZmdjdGN3pBemF1Wnd2Qngv?=
 =?utf-8?B?KzJxL2gvcWF5eVNOMWRQTXY4dTdyUThydStKUHRDaDVQRGFvenZISFJpNU1K?=
 =?utf-8?B?RUJYdGVsdzBmKzlxVzJ1YnY2elc5eTZmMzBjemlkSS9GSjJJZVlRVzBuamhv?=
 =?utf-8?B?YWFuaVJEbHd0Y2pQQkdYVzd1Q3ZzOEQ5WG9OWkU5Y3MvVk9hK285VUNUWUNP?=
 =?utf-8?B?b0VjNHFjNUU0bWs3TUgzazRNdUxTNGhlTHhxMUt0NjVEVndjUHhBaStLaXBk?=
 =?utf-8?B?bVRFaFFBVHVlTGNiWkpBVnp3THFVcms3UDBVd1BJSXJ0WjR6R25vMGZReWtp?=
 =?utf-8?B?N2RkNy93WC91c2RtSkJ5QnhmdllKMHpwL2hWeEFKOFIrTzlQQ3ZPSkxBWGhn?=
 =?utf-8?B?cXdQOFp6aTM1UXJNR2g0anc5b1MveThGSjZvZHVhYnJOUFNZclF2bFVUMUVt?=
 =?utf-8?B?SjFPbzNoOTZrSVVXVHQ0RU85Qm5BUzBOK2JRYiszcmUvd0NLVVFFTEpjV1JF?=
 =?utf-8?B?SzE5dWhSV20zcEZMUzN3OGtTVHFZbExGYWRDN3FOS2VCb2xsOWkvd3RjcUlt?=
 =?utf-8?B?bG01eElyTlU1aEJoMWZOVmFGTzBUa1kyakV3anJSc2pGK2syeGZzUGtyenQw?=
 =?utf-8?B?M2lEUVRVQTZFMTVjem5qaSs3bjE1QmZjWnBRbndET08rV0pCZ1hrUzZreWNu?=
 =?utf-8?B?eVQwRUJhYTVyOFBId1FHT2hqOWZMeHhNVmdUR29UZDF6WE1jUzJJekpjbEZ3?=
 =?utf-8?B?RWZ2dERoT1JOWXNOTDZIQ2t6TzZLckFsQzV6elJVUEhiejRGSlB3K2NOQU1R?=
 =?utf-8?B?azAwY2RUSzFpbVAwMzNCUDlsZHBZQWx6aE83QmsxV2xnSDQ0cjBDUUZCczNl?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: acqiris.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cad2840-ccfa-437b-36f9-08dc1cf8802e
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0973.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 16:21:20.8851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dd188994-de43-4df4-abb8-6e6240653675
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TBMRtqqsbIdWT7XbgFEonOquGFWTnZ4muFYfKA7YH2sEE6Rk11guZJmKjVuuUOiLN2nz/m4gFA6/F1j7bBM0okJ9rsOtnbBvZRU6XiFEyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=acqiris.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx05Yve8AZKS/lC9uJvPW7sm9MNlCaAH+kQlhpXAhcM=;
 b=b4k+MOVSAoT3VVVysmo95ORR40K0BsHHWzqLizqoK6LtOWvshIoWK1orioqNOl1vHbwHxi0jrJZZCvmYEoXjcGchLEXHRo7rizJNdjA/Wj2oMtpFcqHexy/jEfDQ9jHZZNah9UlvHZDIwqDGgLElDFyhKQO6LSafmUvWO9BnvvTHtpcWLQ0YCrJHnNHsvowq4phzhmatUCrW0RiBjrP66Z7qVkbYPyzQ7hsxFFAwNxumOfbvyQMrNg3OPOhTuSqFLEHPVPHaBpsNzGwMrIU5EyAtOpV8ZEr3txvjHSTUaN9KURKyvMffJ7W0nZ/qmAKY3jLxsQSIrKntfj8ATH9lcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=acqiris.com header.i=@acqiris.com header.a=rsa-sha256
 header.s=selector1 header.b=b4k+MOVS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=acqiris.com;
Subject: [Buildroot] Failed to start Remount Root and Kernel File Systems.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSdtIHNldHRpbmcgdXAgYSBidWlsZHJvb3QgZm9yIGFuIHg4Nl82NCBzeXN0ZW0gdGhhdCBJJ2Qg
d2FudCBvbiBhIFVTQiAKc3RpY2suCgpJJ3ZlIHNldHVwIGJ1aWxkcm9vdCB0byBidWlsZCB4ODZf
NjQsIHdpdGggaW5pdGlhbCBSQU0gZmlsZXN5c3RlbSBsaW5rZWQgCmludG8ga2VybmVsIGFzIGNw
aW8uCkJvb3Rsb2FkZXIgaXMgZ3J1YjIgYXMgeDY0LWVmaS4KClRoZSBVU0Igc3RpY2sgaGFzIHRo
cmVlIHBhcnRpdGlvbnM6Ci0gc2R4MTogRUZJIHdpdGggYm9vdGxvYWRlciBhbmQgZ3J1Yi5jZmcK
LSBzZHgyOiBleHQyIHdpdGggYnpJbWFnZSAoYW5kIGluaXRpYWwgcm9vdGZzKQotIHNkeDM6IGV4
dDQgd2l0aCBmdWxsIHJvb3QgZmlsZXN5c3RlbQoKVGhlIHN5c3RlbSBib290cyBjb3JyZWN0bHks
IHdpdGhpbiBncnViLmNmZywgbGludXggaGFzIHRoZSBjb3JyZWN0IAoicm9vdD0vZGV2L3NkeDMi
IChhbHNvIHRyaWVkICJyb290PVVVSUQ9eHh4Li4uIikuCkkgY2FuIHJlYWQgaXQgZnJvbSAvcHJv
Yy9jbWRsaW5lCgpNeSB0cm91YmxlIGlzIHRoZSBzeXN0ZW1kIGVycm9yIGluIHRpdGxlOiAiW0ZB
SUxFRF0gRmFpbGVkIHRvIHN0YXJ0IApSZW1vdW50IFJvb3QgYW5kIEtlcm5lbCBGaWxlIFN5c3Rl
bXMuIgpUaGUgc3lzdGVtIGtlZXBzIHRoZSBpbml0aWFsIHJvb3RmcyBhcyAvLiBJdCBkaWQgbm90
IGNoYW5nZSB0byAvZGV2L3NkeDMKCldpdGhpbiB0aGUgYm9vdCBsb2csIEkgY2FuIHNlZSB0aGF0
IG15IFVTQiBzdGljayBwYXJ0aXRpb25zIGFyZSAKZGlzY292ZXJlZCBhZnRlciB0aGUgcmVtb3Vu
dCByb290IGVycm9yLgpGdXJ0aGVybW9yZSwgdGhleSBhcHBlYXIgd2l0aCBhIHRpbWVzdGFtcCBb
wqAgNS45MTIxXSBpbnN0ZWFkIG9mIFsgT0vCoCBdLgpJIHRyaWVkIHRvIGFkZCByb290ZGVsYXk9
MTAgdG8gbGludXggY21kbGluZSB3aXRob3V0IHN1Y2Nlc3MuCgpNeSB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgdGhlIHJlbW91bnQgY2Fubm90IGJlIHN1Y2Nlc3NmdWwgYmVjYXVzZSB0aGUgClVTQiBw
YXJ0aXRpb24gaXMgbm90IGtub3duIHRvIHRoZSBrZXJuZWwgYXQgdGhlIHRpbWUgdGhlIHJlbW91
bnQgaXMgZG9uZS4KTXkgbWFpbiBxdWVzdGlvbiBpcyBob3cgdG8gc29sdmUgdGhpcz8gKEFsc286
IERvZXMgc3lzdGVtZCByZWFsbHkgc3RhcnQgCmJlZm9yZSB0aGUga2VybmVsIGhhcyBmaW5pc2hl
ZCBkaXNjb3ZlcmluZyBldmVyeXRoaW5nPykKClRoYW5rcyBmb3IgeW91ciBoZWxwLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
