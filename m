Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27998CCA490
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 03:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99476406CA;
	Mon, 19 Oct 2026 03:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuWFLKxo_omz; Mon, 19 Oct 2026 03:06:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7F83406CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792379172;
	b=CWztO8rsvx++d64mrT/nVhSbtMe5KSzcpilxL7s/b5wej77oAc6CjZgjjETBeOZOdfxM
	 AGSsU8vwG2eIHkLdewImFmUvvLdJmg4l7FrXF9pA+rJJebnNv4V0UrpVwHnE96fWhWak3
	 TR5PPqSt5gslgnN08kkWk1hjDzxJiemiGsLh4cEluBj8JTwroDVtHfeih6Yq+nKuDu8NT
	 N8dypok/mCGf0AJAkQCZ6hHVfv5WjGqrh3vK+JUsJ8PskZjVxewH9DcJ3H6AT3grtQHUC
	 m4nmKBlL8r6kMqIJ7ecALyXmvR2AShdiBW487wV1Kpe5G5/Wc3U8IiAnNwKGmPqCUqQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792379172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-ClientProxiedBy:
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
	bh=qURbr6liFRPmsp84SuCSMLx/iFEoP0cCLwB4+6ETykM=;
	b=fTp3xw6QhrhXcCHOPMfXkIhzp/Bu3fS3hrKhf4YET0CzJP7JXZcalJx76VVHN5OGrhMS
	 3U6GXgzkVWbTdxrB1muD3gGb1PhZ5KHFI4+6/RtpDSHsoEGGEp1hdSPu9+lM8/kMUtjld
	 vuz3vzS53NALTIbakEMN9Q7vgZ6FFZCkQTubNjHb8m6mrSNNt6I3suzpTAVJAirUWr/62
	 R43v0CuHUemgWwAOCt3zBxvSsPMkWcLfdwtW/8LGuvFmhV37vJGLFV0XeO95piYpNPWHS
	 vjJ/mgsvjxaY2Yso+o5d3dgxCJRDT6OaGgiz83KdE8sbzJjO+X3aH2mx5+JzO1UhNZQ==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792379172;
	bh=qURbr6liFRPmsp84SuCSMLx/iFEoP0cCLwB4+6ETykM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfAATqQVS2U34L6GUOIPsp5rkofEcZWyRS/Q3EOpHydOTSxTZ/jH/1nxcy5nhnuKE
	 VV1lJLjDvzhTFqJRqfUOV2Kxn+OAha2r9ZZ+Izwc+6CqnIuIYnJZguWL6MT1grfvV7
	 GcxARWz75Tt1IDfe+ci5jft1R4e9hTRQJVCwDANjSacw6jMunUDwHa00JRMDRM+PSs
	 My7hVwBfJruN35S66TjZpVCgcWqnjselnlUV5dj+AJucoyi5afDqTFSPO+z6EYnRoa
	 H6UZg1/LKNJQSssEMSTV0fO46QB5TMYIfDJwUZeCp7joa6cJLmiIIeu9ONAKESnHNo
	 L/V8kYCKaDLUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F83406CC;
	Mon, 19 Oct 2026 03:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D6512A8
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 03:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D0FB80F1B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 03:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NIbMbLWWGQV for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 03:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EEF080F0E
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::1"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792379170;
 b=c8/2E5LOgZTUUJKCflppzvthSi+JwlCHZjQpFz3OoIufEYYXDBC2vggFSSPZmlCSryOc
 7rbN8wXBOh6ywuS+hhXOJy3zBHNC4z86WJWXHua4j496ZaavUWxD4vuo9eAfi9tRfhatr
 oNJWMZilX3rnOCvieTFSeiu9yjFKztFyKWpHTfLxoLtsLzkXFJ/vanIaAlcmNEBp0b79d
 ZfKseedPmjMOOJS0Wl982lc/g9WlrXExN8S+eVwnQBkiD3j+Efe8PHblyoHlMaBNhSK94
 OFoXpfUqbJcnc8mxOpgJ5uwEZ3jDtocx3w+GMYCgYPp2+usGm/4Jkfe1R2uLtIvAUQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792379170;
 h=Received-SPF:DKIM-Signature:Received:Received:Message-ID:Date:
 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
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
 bh=7SSmWABUVn2wFIhZpvNdE5hTGzY+q73XN6Ps8F8I5ag=;
 b=HDM401XNyVBexyzT07pss/g7z3ajFS7ZA6Lh3TlDmWxVBEzvrRmtcvyhElJ9uEKFXknK
 gVRzRfj7QjProU77KBEHlHahDoGz/snPs9ZZWQ9eHTQjyYoMgNcxc0O0Ol0etElWIg2mY
 06GInhhhcIJTt0rcgGewreHFKRHneBBIFwzZDWgzF3ZFDQrJFqr+5Pa4U/xLeW+C4sk40
 pEfVWcActVB/3fBqKBwpOKY2X84tRLt1MBTCWiqHUSPBwNIaDgMlCKohi+bpXLgl8+NAY
 S643ok61zfSLmZoXIXxlVLCzWpZpAG9JOkPrajyHTJ0Vxl4cYgAHlHxQFShNChODaPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=p1KfbiKY; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=p1KfbiKY
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EEF080F0E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 03:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWgWwqEIuusJifVmA2n+gt22cJ/ksCxIwxt1z+3fXMkYQMMRIBcrGwcodtMIo6DxVwlXM9TzQhR9MNGywqm9aQdFjORrS1g9WZISrOgEQ3SSrF9VBhOfHtBsPwrSPrws8O3K3WsAUjtFEnto03uYifSipSmP8CnjNuvR6/X9Ha6O+CPo3FPikLyw6gJK28RTXaRcy05WXKrRxAmEvi9u2pK8hxKEA10Uyn9RGuI+VBOORZGt04ug2HkFOQh4qwvjAu/NLT5AbEHDOX7Ry/7nCobmhqEqvSC03u9FR7YO0bSdKIadp1ESfKJ8AvSv5YGfX2ADVgQ1LYE+Ztb+I+mZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SSmWABUVn2wFIhZpvNdE5hTGzY+q73XN6Ps8F8I5ag=;
 b=RrMrrUGKr6k1EJgQxmrQI4634bH3fNFJTeo4AkXXFYH31sHF5zFFj7Y6OO9WGdiHCVY1Yk5vqb7iwVI0qhttg0fMfI2mLy5dZiEm+pCfr4k60yLYUJ4I6VULvgb46J/JXgjf8Ge8JrA/8X2FXgzeDAQT1Sm+jmU2lgnP90OrU8RXqAQuASIXuFzS4VIu8k4NVfKyPN3hsnJpQihqi2frg3AFKYnr7eLuaKG6hEG9g9J+9CTtYNxlaZymQFowhHUHa46CIHaUVc1Rl1+5TkWqFUmdZEU6DbjqurH6XoHAtV4M4U+rJxeDbkqAgt3X8abs7yn3KcTfx5kDzdVcghn6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SSmWABUVn2wFIhZpvNdE5hTGzY+q73XN6Ps8F8I5ag=;
 b=p1KfbiKYiNiiNxwYWA1HwohlbWXH1ANrkv1mP7sfb24WOl6NNd9FX10ae0bY4sZsWXxVnUGEJ0lv3E5ukVzYWaz994FjPnRfcSwbAqw61MIk5saocNzG+bs4G/grrOp2R3QzNG23Oq/weEKKPvhgDOLkuL28j7R+vUyHUVBaUDvXaZB6jJDbcyYprW3nl+unwfUD8t4jLauUkdtphmKsgtKObuPicfeyKmKHlOtzSZ8fzC9p/vNrkYlyqr82GVC+TEGAdztwF3JSHYzHSMJdRQTlWx6/C8pFYWfTbARekB0zJR4oBSx2ST4BiA6FJXo3Yp+3Lzu/EaK4Au/m05QZ9A==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME7P300MB020347.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 03:06:00 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 03:05:59 +0000
Message-ID: <SY8P300MB00418F3CF55F40C6155911EDB5982@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Mon, 19 Oct 2026 11:05:51 +0800
User-Agent: Thunderbird/154.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <SY8P300MB0041CF44C55A5BC134A52D6EB5992@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
 <atUmkwceBlEjFRE1@windsurf>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <atUmkwceBlEjFRE1@windsurf>
X-ClientProxiedBy: TPYP295CA0041.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::19) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <4b82b294-c14b-46d3-ad9e-6eab2d2573f5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME7P300MB020347:EE_
X-MS-Office365-Filtering-Correlation-Id: f70c115d-229d-488e-52c9-08df2d8de6d2
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|8060799015|25010399006|19110799012|5072599009|15080799012|23021999003|6090799003|24021099003|51005399006|40105399003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzRYeDZtbTlTVEpNN1BETXA3a0V6TDlydnplbDhvMlBTanVDUmxqWVN2eXdT?=
 =?utf-8?B?cVJkQU1WZk04d0Fvd1VpTSszKzFhODZ3ZXJpU0RrUnZvZzhXYXBpOXpIMEwr?=
 =?utf-8?B?cVVFT2FETkw0SUFOMDhKbWlMeDMrQVUzb3hrenBkL1VWQk9jcDV6d0JzWnBi?=
 =?utf-8?B?cVA3WndDZWFDMVFLSHZRTGNTYzdKQU4raklGRlpadUVJYjA2Z1JmZEdrNG1P?=
 =?utf-8?B?akNZSWdkdnVrVExXeWVFcE5EYzExaUN0TmwwVEZmK1ZxcC9MVWc2Nmh1aC9N?=
 =?utf-8?B?aGdWZFlCanM0bWxFZEhubWtNODRRSDVhUkt1bTRnT0JkTEZFTUNvWGlkMERt?=
 =?utf-8?B?aEJPM3hMUEYzYklFOVJaelQzL29kblVCWWF3WTA1STFRb2pVWWRqK2ZOUitP?=
 =?utf-8?B?SUZvZ01XYTBkZm0xRVlURWxmdCs1V1pNVWJvUGNOV2s2ZEdJUW9iaGFobnAv?=
 =?utf-8?B?bStVN1AzRGcyTXpXMGhBUi84Y0xVTm1lM3kvcFgvdWwxYXBZekg0a3BLOGFJ?=
 =?utf-8?B?UHhTK1M4enkrTXNxQ1hSSGZHQUhZK3ZjNkkxS1E1UzlwRThtTVdqbHZTUGdI?=
 =?utf-8?B?NnROYzFNMG54by9rMkVrN2NFYVBOeGl4K2JNZXpuaEV4QVpPUHc5SG5obFdr?=
 =?utf-8?B?T0Y0c0RPSjQrcE5TS205b0xEaWxYSTZaajRpRm4xeThIa0pVQ2hJK2RjbnpY?=
 =?utf-8?B?ZHJHbjRhcXAyWkNxODRjZVNzbUI3T2ZSZndCZVJWdTdSU0pjY29CV1Z3WWwx?=
 =?utf-8?B?WlVpelRWY1VIbGdsRGdjMkhvYm1LZDd0M1ZkQ0lSMnFleUZPNmdrNGJLaHo1?=
 =?utf-8?B?N3RxdDVmalJIK2JDMkU4cFAzYVd6dWNVL1J4OHl6V29wTFp6THVHTVJ1RVJD?=
 =?utf-8?B?MDRiNGlHMldqSVJFVlhQaUZGSU55cW84aFVqZTBIVEhBcS9mNHpJaE1IQkds?=
 =?utf-8?B?N1BEd041SlFLMWRlaTVKajdRbDNFeURyMkJ0MzZ6bGpHYXpJSTlqMml1WnBx?=
 =?utf-8?B?UFJWRzFUYVJYbGM3bGJFTFNzb0hQUG4xejlScVZmd2w4SWp2SDFKTlhlbXJv?=
 =?utf-8?B?aFhERFM2Mmpkd3poeVpLZlYvVjh4eGlmVzlETzh0cFpOUERNNUxtd3gzSyt4?=
 =?utf-8?B?dzlFMnRzT3lCUHFVblFSVk53MnJnd0ZEV29nTnZLV0FDbHhOZUhyL2FscERN?=
 =?utf-8?B?WENCa2RXZHpqaC8yWmh1aVY1eldWQjMrTnVFTHEwZmw5Q2xUVEJUU1pRbVNn?=
 =?utf-8?B?ajk4bTJsVUhCOXR0d1Z0dSt0WCtSeWkrV0kyUkNwcTlYMW51ZEV0NWNCbC9m?=
 =?utf-8?Q?Hq4jxGYYpDpVHzWhF7Ol9O2w0YsuBwxg5N?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElBUFhPeXExbTdBM0RzN2I3cmlsUiszTlU3MWMyak1OOEQ3ckMwWmY3SUtz?=
 =?utf-8?B?enl5V0ZsVitTcnZWWERnTTkveWhwcDN2MmVXcm9McjdpNHlUUGE3dGVySTUv?=
 =?utf-8?B?aWZFWUh6N3gxMFQwNXVVS0c4TCt2SlgzQmRLUVY0aGdobGxtckRLSG42MU05?=
 =?utf-8?B?b0JlcDJXWkJ1K0JDTVVEK1hxUWJXbW42QzhCTE1tclZnejZodEJjSFhqMDNJ?=
 =?utf-8?B?bFFKQUdZZlpydFFSOC9RbzJQM3N1ZVJhQU4zR3V3ZE9hZzFNSDRZQUJ3OUV0?=
 =?utf-8?B?QnJOZDFGa0ljNlRpTzZFZTBRQ2JGM3UwVi9JR3JhbitoY1NwTzhEVmRGUUpi?=
 =?utf-8?B?RFI2YjJSd096QVZOUTFtUzFsUmxET2p2VUlUQllhL2JIY1JxOE56U1FLVFhz?=
 =?utf-8?B?VXY4NFJaNFl5dnJPa0t3QzFsVUE5NnVjVnpvZDl3UDBvQUZwY05EZjZzNEdY?=
 =?utf-8?B?RVVqMlI3NG1uNWo4bHJ3Z0dhZ3V5ZHZLc29yUjhmTVVIZm5oVmxTU3cvTUU0?=
 =?utf-8?B?dEVlMk9OVkJVaGVHSXQ0WlJOUzhZbGtXVGJuK0pETFdQMXlCNWlRTkdCT2Nn?=
 =?utf-8?B?QWJHRWtpek9uWGt0cjljbFFZNXlqajJZSjFhVnVJQU5oemgrZ3M2eVNhSStq?=
 =?utf-8?B?MnkwU25Fazh4dlVNMldaZDRnNkdxZStMOGxSNC9rcDJmTDNuL0wrZ3crVkU5?=
 =?utf-8?B?eTltakhmYkUxaVRoVzdPUmhrTEtqcDdqeDVZSU1sK01ndG5XUVFEaURTZW5R?=
 =?utf-8?B?NXExeVlrMkFHUlpWSDJwQWdlTG54bnArSmlkNTZueHNSc2NJbFpUR29IMG1i?=
 =?utf-8?B?eS92NWd3UmtnYVpwY0hWYnN4ZGxJRGpkc0FHMzVIbURBYWZCOEsyMk5Ba0dL?=
 =?utf-8?B?RUpDQlVXL0g5ZnJJUVNSUWZOMmw1TWxhWDlCK2sydWpoZTl6ZUhsTkhSa3gw?=
 =?utf-8?B?Rjc2VjhnZ1U3eVJJdEthQy8vRmo4cE5FOWt3bzhMdm42SWZ2ZGIzaXUyWnQw?=
 =?utf-8?B?LzRmQ1FSY05TZjg4Sko2RjhCL1F4cEFLUk1CZ3haZ291Y2I4SHFpeTZsZDBD?=
 =?utf-8?B?aW9NWWlabEVMNnJlUElPZlBLWThoZnE5L3R5ZGs3UURtelc3TXk2TlZkeDdF?=
 =?utf-8?B?R21ubEFaMEl3OUY1L2Y2TGhoSkhNelhLL2VUcnhTNVR6SnI0NjFoY0N6bHJM?=
 =?utf-8?B?YXdvVnBkZlhCeC9LcGdYSG9keWM0WEhZd2dVdTJaUVRIcDdnOE5ocmhuUXBk?=
 =?utf-8?B?Ly9sb0FVOXBPQ3B6ZE4vSitodEJjcVJQeGdBY1AwMlFVTVZBcndxZ3NmMXJz?=
 =?utf-8?B?UDFSamVmTno1dlg3M0crblZzTWhEbk01WGNITzJ2UFRXRDNjRkNXR0ptN3Vj?=
 =?utf-8?B?bXhLaVdxRGVBK0tJbkNGZTkrZEZOQ0M5eG5oNEV5b2R1QTJ1SG8yakhrVVdv?=
 =?utf-8?B?OVNMeFFPSXhkSjVUWFJOcDNSbjF2a3BnRFF0UzJQZXVhRGZaZ2JnUmlHU1VB?=
 =?utf-8?B?SzJ6Z3ovRGpmeWlpZEJOUGVsOWRBNWtPMGN0TVpiWGJaSUtSUW9HbVFlcTZY?=
 =?utf-8?B?Q2RuMkhLcFdzYzQ1MmZGYWMvdlJmM2lCMEN5aUp4Q1Y3UkZtU1RpR1FsdUdt?=
 =?utf-8?B?bytmbzNZR2RSMkt6WHY0VFVBeFlFSUJSdWhBN1pVU1haVEh6UTJFamthNGpv?=
 =?utf-8?B?Z0FkR3B6eXNhMndiYjNTNDIxWGxCa1FMMzNseUJWRGVBS0tVeXpMSW9BQWV5?=
 =?utf-8?B?Um5FSzRQQnV1L1Q2Q0ZhQlR4L3ZLZ0VGQnR3T1BzYnZ4N2lPRkhTVzFzWXZv?=
 =?utf-8?B?anM0TzJadTh6WWRaMVU2ZEMxZ3F4d2ZhVlVXRnQ1VkJYbWQvVUVuNEtya2RY?=
 =?utf-8?Q?yEU3SAZ0Ry7WR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70c115d-229d-488e-52c9-08df2d8de6d2
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 03:05:59.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME7P300MB020347
Subject: Re: [Buildroot] [PATCH] package/btop: fix build failure on ARM
 Thumb-1 target
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoK5ZyoIDIwMjYvMTAvMTkgMDQ6MDYsIFRob21hcyBQZXRhenpvbmkg5YaZ6YGT
OiAKPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBwYXRjaC4gSG93ZXZlciwgZm9yIGZpeGVzLCB3ZSBu
ZWVkIHRvIGhlbHAgdGhlCj4gbWFpbnRhaW5lcnMgb2YgQnVpbGRyb290IExUUywgYW5kIGZvciB0
aGF0IHdlIG5lZWQgdG8gaW5kaWNhdGUgd2hpY2gKPiBjb21taXQgaW50cm9kdWNlZCB0aGUgaXNz
dWUvcmVncmVzc2lvbiBpbiB0aGUgZmlyc3QgcGxhY2UuIERvZXMgdGhpcwo+IGlzc3VlIGV4aXN0
cyBzaW5jZSBidG9wIHdhcyBpbnRyb2R1Y2VkPyBPciBkdWUgdG8gc29tZSBvdGhlciBCdWlsZHJv
b3QKPiBjaGFuZ2U/CgpUaGlzIGlzc3VlIGhhcyBleGlzdGVkIHNpbmNlIGJ0b3Agd2FzIGZpcnN0
IGFkZGVkIHRvIEJ1aWxkcm9vdC4gSSB3aWxsCnNlbmQgYSB2MiBpbmNsdWRpbmcgdGhlIEZpeGVz
OiB0cmFpbGVyIHRvIGluZGljYXRlIHRoZSBjb21taXQgdGhhdAppbnRyb2R1Y2VkIHRoZSBwYWNr
YWdlLgoKVGhhbmtzLApGZW5nd2VpIFRhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
