Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A75AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 12:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B3861212;
	Thu, 10 Mar 2022 12:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_SX8VUiLmA4; Thu, 10 Mar 2022 12:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7984E61204;
	Thu, 10 Mar 2022 12:41:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF0F1BF361
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328CF40347
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ny_d7Wy0qtCy for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 12:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D53C940195
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2We/unOE/sDTVa9mWny3VD5fwqKaBxIigYaVkofbEGBWlIh1B52/SC3gB1v0v0NLBxbJmhc4k2Z/eAh4tWdRaZEpQ/lV/XkQLUrAVm4jkA26x+kQTTnlJo1WYB0uGa4szj+05qEPuU1foXkyDayoesq7m67RDMoRpJVnF/hi4d2ysIXldHJGTr4oxTqeaWq/M5IkKTOiF3iGTFRej22hltkDPIc02zefNhvb74L9i3/Z901A8tqjxN4zl9nLNvh9yP+xjLMCVJvD/OreF0fKNL0LOqmMHFAmrw6/RP5e/jfSFqP24K6Fyvr6n3ruobyBkjES6Wqw8Z55ySVrKoaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlsaRJstx9bEnRbme+vxb7d83SYqdFptAWslfy+rkgg=;
 b=iy/UuzvEydUTBgf/5azdKAQPLbFZ3J8aLLqT3wTOeeE3ee+y7CUAr47QcuLp/GVtH7Jc0xfCTKUY4XVFlwcdHFTjCeCMw6yaYxFGSZlqDFwPLIEjjVWWzyfvZ37x/Ld6C5EbtwbdhbNn3sx/tkO+V4bLjkOG6bSlCL6X31dUlZuZXobudmztDcMechcgGf8VATrEJqSFr7WG1nzwuAxOulZzeRT5Y1qZMzAzAz0Ns1HChOhQTDV2j2QKahkGjLayyEHskHtmYyRhQCe28KnsC7z+AQu4/6g/xD1dQl4nLbfMpKVypBJ0cqRAK3MRJraxSFUJOJ9fP6KGySKqYQlJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlsaRJstx9bEnRbme+vxb7d83SYqdFptAWslfy+rkgg=;
 b=aNRxnUxwQaAi4G/iSl5kBM50Xbw0zth9psIt+q5lbopwGmNwaNRqr6IjxM4TPyUOUhbezsZi/LqeBSsPsUyhnJ+8oRxqc7ecQLrPoIkVYH9T9RtH9qxvm9LBN+adeaN0Qf3ICX+/tABXCNAyRXclm8s+XMvObEKcbLdKQtBeUw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by PRAP251MB0515.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:292::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 12:41:15 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::690e:181b:89ee:1f5b]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::690e:181b:89ee:1f5b%4]) with mapi id 15.20.5038.016; Thu, 10 Mar 2022
 12:41:15 +0000
From: Nicolas Carrier <nicolas.carrier@orolia.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 13:41:06 +0100
Message-Id: <20220310124106.2916278-1-nicolas.carrier@orolia.com>
X-Mailer: git-send-email 2.30.2
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:4bf::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dfbfbbe-861d-468e-4a85-08da02934436
X-MS-TrafficTypeDiagnostic: PRAP251MB0515:EE_
X-Microsoft-Antispam-PRVS: <PRAP251MB0515B0E1142477A2000F84D8840B9@PRAP251MB0515.EURP251.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqoiZFRcTuZVj9j8MafnODgHUWRSkUXsrNqvaywHz1ZunT+K/k1hC+57mO5N7auNmg61afvVwER3JPHSktEbKk3hadp5Ci3kua39+JXH2loT3HWPuSMaXmYrhtUcPHoXwqfbOue3c3gg2ROG9EeI5YqBGfopW86W5nxvjegUWlHUTBpjVoNMn8pzKO06sLfJ5g90cG8nsy20QZM5UMPuGPT3/HAhjQ48vsUS2GdNa256cYKr/btbWWb60hnQj4uBiyARL6LXAE1gPoCbgGDIZvQ40Y3epFRBTIHOd7YvzYW+E7+v/f2u0eReestzW9qwfqvhqWzRGbfGRoYE6EyW+MuiyuyLuI+xDuTOOD6l1GQRbNgNPWXZgl1ej65mnbZtEhlAKwWcFfTkUe1NA494hlWhNNdpvViVequxIZsfCET5biplS22tYQzNItJ/xLbvFFV0YKjcHor1Z3D1Ka3V+G1gxufkJIxIJF2hX4U4Lel5fvbTWX+kle1FK7EUZH2jozG1p9PHzbSiM8BYi31r69RumQCROLyEi4MjNXqhAMHx1pWZptSQhB+c277HEj0ZBnn4ZCyZqryQYLfQ/rFALxjrCTtsuyxMIlrlINFXEGu5A6sCyTwiNYgv7SLsEjm/mGUuqm+gYkZ685zXqBsGVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6512007)(6506007)(6486002)(2616005)(1076003)(6916009)(66556008)(36756003)(66476007)(44832011)(508600001)(66946007)(4326008)(8676002)(52116002)(5660300002)(6666004)(54906003)(316002)(38100700002)(107886003)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTYzZjlJUDdnTCtLdVVjWHVvUHJibnJqam5EYXM0WEk2SkwyeElnamg3QjRv?=
 =?utf-8?B?dFpicEMwM0p5M1k0dU5SZWc4L09qNGpvV3k3QnRnRTJPVW1QTE5vSEFXR0ZG?=
 =?utf-8?B?a3ZUOWxWZDE2M3hHNUZaZE1jK290R05kNHUxVlFpUk50NlNyMkFMU2huR0Ft?=
 =?utf-8?B?c0lQaWFkTDBmU2EyR29rNTJyTzBHWmRHbjJPcHVrdGVweGM1RUNkVXlhTXcy?=
 =?utf-8?B?RmFPZFJHOExwRGlGQit6L2dFQjQ1WmdlRzVZczdUUG5VOG5KUkVtMjVMVCtn?=
 =?utf-8?B?NnFpTWU3NlVWM3c1ZldDNGozeEt5TTl1SmZxTXhHN1k5dTFUaWYrQTNqSGY4?=
 =?utf-8?B?dUhRdmNBb3NaT2xsQklrMktYbkh1c3NvWkpnWTNYVG9XU1BxcEVXc3ZQSHJh?=
 =?utf-8?B?eEd6TnJ6U1d3Y3RPSXY0VVRrT1ZyeEIyVHJWeU90VE83R3lnQVlQZnJqY2lK?=
 =?utf-8?B?VGpOMGhHNmpDb1k3dW1zYXVZRjlxZmRnd3dTOVpkOHNNcW8rYVlvUFd2OEN1?=
 =?utf-8?B?L0NVSlVFYlFiWUMyQitaL0VKeHRKVDc2cHVFNFhvUWwrSTNLR0pkSVVmSDZ2?=
 =?utf-8?B?amtyUkRhaU4xWDBHSDFUUXJrWHg2K05mYzlPd3laaXpLYW9RTnpGN0VibXZs?=
 =?utf-8?B?VW1FZHdrM2tRMy9LY1d5RzRVS1JReEIvNnZMaWprWE00dXBkVjRjODRpZk9D?=
 =?utf-8?B?dmdhcGwvRXBOZmZSR1pCYzQzNW1oL2dIVE1DVFYzZFlOMUVWMlJycFFpMUMx?=
 =?utf-8?B?UW9IQkQ3WDNEWkxBOGVkbUlpTGZPR003azlMeGhiTUUxWVMyeUlhVTRPVUI2?=
 =?utf-8?B?aXRILzFqVFdQVXNZZXhFQmJWcGUzNmNRMXJjeTZ5dFRUb0QwdWVXU011TG50?=
 =?utf-8?B?alBGNk81SnhzcWpmbjUzcTdIR2Ewc05LRDdMZmNjQ2RwRmpOalVOK2ZNcFV3?=
 =?utf-8?B?QWVEUDR3THRRTFhHWDV3amo5Y1R5V2VlRmhGU0lsRW03N1NkallEN2FtQWxj?=
 =?utf-8?B?Z3BOR1I4OUNVMmJLaGl0aEVINHMyMHJ1d3VFSnpwYXpKMnBwMFFmYXRCc3Vi?=
 =?utf-8?B?aXJhc3BBaVhSbnZGei9BbVNXaWxERlQyWGU2SUZpeEd5M2pJdXIwb1pjd1pj?=
 =?utf-8?B?QkxtWkZjUERnSDBEdU9Ud0RWNFBzYXcyai9EaE0zaGdHRTRHWVV4Z1l4OWQx?=
 =?utf-8?B?VDBxTDduK3lwc0VUL0sxRGlSdXROQzhFaDB6d0l5WHY5RE5ZZVQ0N2dsYUpj?=
 =?utf-8?B?L0JpVGJNK1laQXQzVUVrV1NBTzlPTU1jQjJlYmNMTXZZaVRXVm5CMkNqRW1m?=
 =?utf-8?B?SWpRZ1l0QmF5NG1RZFBCRXgrY0IycTREQkJjWngzUkpvQ3VQL2VNNGhCek9s?=
 =?utf-8?B?NWJqYmZhNTN3RUcydkM0RmtxbEt2VDlPV3hSMDRWOFNITm5xQlI1QVNDNUhl?=
 =?utf-8?B?WDhLSFNyYW1UT1lYQ3ltUjNneU9mK0hxdVBYUys3WmQyT0RFbUpob0MvZkt0?=
 =?utf-8?B?SmUwa0xUTUFGTG5Vb2tSTHpkbjFMTHpyN0ErclZDUXMzbWZFWUQ5Q1NpU0ds?=
 =?utf-8?B?NWllczl1djdVdjJlUVNpbm5DYjMrSVRmV3N5OHVvSFprYm9mNDZpT2Y5eXdu?=
 =?utf-8?B?VnJiNUo0VUZHNHI0Y3U5TFVKUDF2T0tLT2dPNVdVWG1rR3BWdUtiVFMydmF5?=
 =?utf-8?B?eTQwd1NESkpseTFsayt1U1I1a3N2M1RDaWxVa1VKR3dCMzgzTGw5Mnh0SHR4?=
 =?utf-8?B?MDY5WWM2MVNSQUR6Qm9zblBYakp2OGJYK28yODczZThibTBKeGRHaExiN05T?=
 =?utf-8?B?emphSy9OYUdHSDNBS2w2TkhRcWRtZHdya25GM0ZQLytmSENxVzBEUDhCTFBL?=
 =?utf-8?B?ODlLMzdNdTlHcGZYVmpKVWFuMG9NN2tSZ0RKdTNWaUFTbC9keDJrWXZpalQw?=
 =?utf-8?B?YTVXT29rOW5QYnJnbHRwODJraWtIa0lCSXBRZ3RsNlZhYXBBakRERHlRU2hO?=
 =?utf-8?B?RjBwMXNNbkltNm93b3ZhWDFheno5Um51NTRSVlBUWjFKdGgyVE1IMFhFU2xE?=
 =?utf-8?B?Z3ZCMTJVeGhYMjl2OTU2bEI0Z2wrUkk3M3JVUT09?=
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfbfbbe-861d-468e-4a85-08da02934436
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 12:41:15.6390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZsqcmLGl7ScAmpPJUaSta7ox9JSP+PDM3XbxjqLwcNH2l6bvlrMThmvUMYbf2T5CpNr3f1mXl242L82NQqj11E5uyTkMaju0EaqE6F4hmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP251MB0515
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: fix compilation with
 linaro 7.3 / 7.5 toolchains
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW4gdW5pdGlhbGl6ZWQgZmllbGQgaW4gYSBzdHJ1Y3R1cmUsIGNhdXNlcyB0aGUgZm9sbG93aW5n
IGVycm9yOgogICAgcGxhdGZvcm0vYXVkaW8vZ3N0cmVhbWVyL0F1ZGlvRmlsZVJlYWRlckdTdHJl
YW1lci5jcHA6MjM0OjU6IGVycm9yOiBicmFjZXMgYXJvdW5kIHNjYWxhciBpbml0aWFsaXplciBm
b3IgdHlwZSDigJhnYm9vbGVhbiAoKikoR3N0QXBwU2luayosIGdwb2ludGVyKSB7YWthIGludCAo
KikoX0dzdEFwcFNpbmsqLCB2b2lkKil94oCZCgpUaGlzIGNvbW1pdCBhcHBsaWVzIGEgcGF0Y2gg
dG8gcXQ1d2Via2l0IHRvIGZpeCB0aGUgY29tcGlsYXRpb24gaXNzdWUuCgpTaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEuY29tPgotLS0KIC4uLngt
QXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLWNvbXBpbGF0aW9uLnBhdGNoIHwgMTcgKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMDUtZml4LUF1ZGlvRmlsZVJlYWRlckdTdHJl
YW1lci1jb21waWxhdGlvbi5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmtp
dC8wMDA1LWZpeC1BdWRpb0ZpbGVSZWFkZXJHU3RyZWFtZXItY29tcGlsYXRpb24ucGF0Y2ggYi9w
YWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAwNS1maXgtQXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLWNv
bXBpbGF0aW9uLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmRj
MmRjZGFmYjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAwNS1m
aXgtQXVkaW9GaWxlUmVhZGVyR1N0cmVhbWVyLWNvbXBpbGF0aW9uLnBhdGNoCkBAIC0wLDAgKzEs
MTcgQEAKK0F1ZGlvRmlsZVJlYWRlckdTdHJlYW1lci5jcHA6IGZpeCBlcnJvcjogYnJhY2VzIGFy
b3VuZCBzY2FsYXIgaW5pdGlhbGl6ZXIKKworQ29tcGlsYXRpb24gZXJyb3IsIHdpdGggbGluYXJv
IHRvb2xjaGFpbnMgTGluYXJvIEFSTSAyMDE4LjA1IGFuZCBMaW5hcm8gQVJNCisyMDE5LjEyLgor
CitTaWduZWQtb2ZmLWJ5OiBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9saWEu
Y29tPgorCistLS0gYS9Tb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9hdWRpby9nc3RyZWFtZXIvQXVk
aW9GaWxlUmVhZGVyR1N0cmVhbWVyLmNwcAkyMDIyLTAzLTA5IDE2OjQ0OjEyLjU5NzQ5NDg5MSAr
MDEwMAorKysrIGIvU291cmNlL1dlYkNvcmUvcGxhdGZvcm0vYXVkaW8vZ3N0cmVhbWVyL0F1ZGlv
RmlsZVJlYWRlckdTdHJlYW1lci5jcHAJMjAyMC0wMy0wNCAxODoxNjozNy4wMDAwMDAwMDAgKzAx
MDAKK0BAIC0yMzAsNiArMjMwLDcgQEAgdm9pZCBBdWRpb0ZpbGVSZWFkZXI6OmhhbmRsZU5ld0Rl
aW50ZXJsZQorICAgICAgICAgW10oR3N0QXBwU2luayogc2luaywgZ3BvaW50ZXIgdXNlckRhdGEp
IC0+IEdzdEZsb3dSZXR1cm4geworICAgICAgICAgICAgIHJldHVybiBzdGF0aWNfY2FzdDxBdWRp
b0ZpbGVSZWFkZXIqPih1c2VyRGF0YSktPmhhbmRsZVNhbXBsZShzaW5rKTsKKyAgICAgICAgIH0s
CisrICAgICAgICBudWxscHRyLCAvLyBuZXdfZXZlbnQKKyAgICAgICAgIHsgbnVsbHB0ciB9Cisg
ICAgIH07CisgICAgIGdzdF9hcHBfc2lua19zZXRfY2FsbGJhY2tzKEdTVF9BUFBfU0lOSyhzaW5r
KSwgJmNhbGxiYWNrcywgdGhpcywgMCk7Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
