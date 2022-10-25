Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F1FC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA77401F4;
	Tue, 25 Oct 2022 06:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA77401F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xLShD7Cx-ux; Tue, 25 Oct 2022 06:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6953401B5;
	Tue, 25 Oct 2022 06:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6953401B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9E21BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A5A7600B6
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A5A7600B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bc0l5XTPz78d for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BE8605B0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3BE8605B0
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liac2FunRU1af2aFLRZ8mUJiuQ0Q2jp9EQIwxIPiJSILHuGsXsL1qb5plmJp7XuE3/WAgXJc4KNKc+K93czhmos1U9o9l+Jc4ThFIX2A3LkB7fnzvH/it5dkkKYKbDxnYz/0Z+pc9fH35ZdeGDimj5CpzPyKe2CbdbsnDu8CLNH1nu395Gfwn/mk7w3q8AAOtGkxZCt/bhZTXQSUE5IoLggVAbPLUw1EDvtMfu/UXzhp6JyBxr4mBxuA70PNH8dyjTwP9teedUS3fs0UGwIQDbTKeX1XRBqLSS9Nc8J8tEiAkjkCtYVxYm7tVnop9XmAE3n01oyO+CUnw2ncntHQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlvNlvYwPWXoFLWWYt8w4dlAPMq/PUy22ewnnWz9w/A=;
 b=IFrG6hv2mLFqxCHfUgBHc3ksnPCiMM9y70uIsVgB/saaZGZay4PsQ40AJ4VQ/VoO0OoRAxk+gHDwEXxKI4yV+f7PLe32dme9DLDPXrs5Aqrr3O0uQTkqiZeY4PS61p42VFrk+qjwUm6tpw431YDpGg7VXrboRMZ7N42aaUD0mAe8Sq3tFut59HlpCw2WH8cFn4gWgiQfCO/jF4VM+mfShGvyhWIQHP+TeMfi+kUsWhFiZ5x3IR50wo43ybN2RmuWupGGx3XcWg8gCk8XchrqETXdV1Wb9sHIOwn3mtvFypzYLfkGdSgQvYrvcsgVOJhs9w8qz9yk++Bf41KEz/kDMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1803.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:13:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:13:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 09/11] package/spirv-llvm-translator: bump to version
 15.0.0-2
Thread-Index: AQHY6DhBJoHiqRyWGk6BkUUYoMLKEQ==
Date: Tue, 25 Oct 2022 06:13:19 +0000
Message-ID: <VI1P190MB0493DEEFA77B06AFB8DB877F9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1803:EE_
x-ms-office365-filtering-correlation-id: 9c7c71f1-7b10-4788-86c8-08dab6500335
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5yiZC7EY2MZJKZZF3x+u9EhPC4dfG6KmpkPnBD3ni7aDKsdHmXq3edrsHBoyS2gYBPkUfuPt3qCwgjIudabcKFChxlBCIVY+nGoD+DYO0kWHOoNU6J8+ydLvg2+yvxUr9XrtBIy/E6XAiPDEFMJlq/kT1iO5KEVNnzyqQFtFvQb1jksD0CZLitrFbG8mjtZgy0v1eCUjVbNb+ZHNOKauEUkWYJO8jS92kET7G8F+lirADHbKRfkHlFR+wTVWW+veWBG2iUwUgMMC5UDS09lB3SXD4GR2M4klKW/X0RZYsPDX+xuCzW9XBrPrYMfm+0JJFY2Ut2vMh0OzCQZGZCdLClNpfINpAR8gY10RA1oSCl7a1/n1DGPQihiWG4TS6/J28iPumQ8azClG0W3GnlT2eCAp6ca+S/xWwLC+7i45pPbF1yTWnAWqN/CNYvjZqzcZ6agWgsJ0naqQKEvzNv90gyDh+3af/8BA/FRy5OECvmXU0RDowtPUnZQ8vsabrDm+vlUD07TvppGhgZoud3FdkNstoeFB3CW5oMAeSZv6YWq6xHI6cRHbL2wiP4GwTeifYxZnOaIPy3O2Cp59lRRu9Iy/Ay3htKk74IQNFf8pRxCEM0n3ccTroyqMPaFJvunBkiJ2DSLDcf18Jdil2UkiN/RHDLPlooHyXXj8jzh3MPQFjC6M1y8HT6T7NqyrfiEiZey1fxT4huBrh7FVg5d+1qZ2ydiZKLoSw3ENBSlD2AzYqRcP0aWk17fSYgCrCR3fhH6OBcMGKG7sC1NFNdcbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199015)(8936002)(41300700001)(52536014)(5660300002)(9686003)(6916009)(66476007)(26005)(76116006)(66556008)(8676002)(64756008)(66446008)(54906003)(4326008)(6506007)(7696005)(316002)(38070700005)(2906002)(66946007)(33656002)(186003)(55016003)(38100700002)(122000001)(86362001)(83380400001)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OqRl6y/aD1UItJMB9ASFkg2gTdVITb5RCozSi9btrHOI0P37aYNOfykNis?=
 =?iso-8859-1?Q?2GEaMwBnfHlhlQFH9giSIujG/qod17LEWjWpUAkD8oJRqFUX2Jka/YmiEV?=
 =?iso-8859-1?Q?TtJXHIJOW6NhDZYUlQKfaenA2Lax44soYAj4h2isHHp56vuZ/Sir4NcY3C?=
 =?iso-8859-1?Q?+P9NkySBf7Mb21FkDKTkaMnjmiKDqFQfDABo201u1/88GoV/4+I5QC2DoD?=
 =?iso-8859-1?Q?dEe/RBTHRvTRRbTG/W9jO+9utwrzyhIY8oPwVt0d40hrQ7RGJM2fkRLrmv?=
 =?iso-8859-1?Q?L5wHvaH7fxvU5G/XQic00K3hg//0eTkSQZmsIcd7UM1pMKv0PdeIzIF2Bu?=
 =?iso-8859-1?Q?aRHXhsvEh8BtT9cIPVnXbaUzwolNeQKy2zU1F1U3seC+rfNB71jxXRksbz?=
 =?iso-8859-1?Q?bYxRXNbbTzJ2IB6D8CNAUCrJOLYijjAb5LlVHW5xMbsWEHg+oc91Ox/wQQ?=
 =?iso-8859-1?Q?oXPy0GnUfSPdYQcjvCM1+QCp0Nt8e4TW48Bk1TCYEN+5cIe8kBocqktvZs?=
 =?iso-8859-1?Q?t4bUwBJC2HD2WcpTq4/8jnPelHU0fC2rl8W5NWyDI2qt4eWYiTUoZmQ6A4?=
 =?iso-8859-1?Q?5KjFlxXwDcArqxXGZOeWDMAyQ0HqLmlAzoQeHaqU6PmoxaWw13aj7UObSq?=
 =?iso-8859-1?Q?dI82rdGJyCq7XiIC0DXjOMifZvey4rJuwYhdbyrpBRe+u1n/vOR7aVAZCx?=
 =?iso-8859-1?Q?X7KpDbbEQoQJ4bqcB0Z7qkoqaxVyX4d/MxeBA/Vledxh1RR46eAizzscEV?=
 =?iso-8859-1?Q?OyP3DS/H6U8X7puQC8tTvzCfBF7fGv1WQAbKnc/38gjMVkgvs4FZUoN5ms?=
 =?iso-8859-1?Q?HAgfTpCmSQKLhEpbVfgeVzTTBy2rbViJDChyJf8blClnT0ohhdKBKSPRfq?=
 =?iso-8859-1?Q?pFxZ0+tNU2FKbnLEXyA9BFY7gc/cL76az0hcGHF2Jdq0WJCbAYZcjFVGKG?=
 =?iso-8859-1?Q?120TDXJDa/CbN+IrqEvPfR4/JfQqi2I+FZi7N6U0phswV0FQ8Z7sIAJ38r?=
 =?iso-8859-1?Q?FZhNHxr0we239ECM0fVGIPaG6AM58tmaKf5ArvUdAl7yuLSjWU1+CP3pP3?=
 =?iso-8859-1?Q?HOsEG1ze1atUneTl7FKDbuFqK22JQL33XJ1US/z0YhtFKO2oP4MiHuXTuj?=
 =?iso-8859-1?Q?CudHYw3mZ0XFf96rF8uSGOFpuYzga7fAKwkoxp1Ctnraht+CybaO/iN8a8?=
 =?iso-8859-1?Q?+oIl0d2GU6p6YvMea3GqS0dEHVZsaWXOY49NkAcjv5t3lmsi62qtQrj7Dy?=
 =?iso-8859-1?Q?d6+VvVpPc3/M63DRGxiyZOMTidJJzKhaooI4uGHI/33mNCzN65AWy9PN0m?=
 =?iso-8859-1?Q?CAalyZN8DjsZ1bmqiQUxEPPBZZcRbpHPz1UtVxFgSf56BLdhsXXqcSP+gy?=
 =?iso-8859-1?Q?pEkOFLPw/F4AQTY4QtVN4GIqE9j9pXHIjdE+TfOtZ2Wrg0M8bxskPQmjjp?=
 =?iso-8859-1?Q?tNMQBQ5+vUeUAXFkoYl7pTchGV/A0bG4Dvre6C+VAujD8Ffr1RxsC1SSfB?=
 =?iso-8859-1?Q?7l4OHPEEGwXj+fx3HUJqiid+Y1JbtRMQgIGbs6swyhvu2edP2ghfOrgu1R?=
 =?iso-8859-1?Q?/+cvEFmSat2DU/5OdMAp/jA0hpPoQUEfLnI7/vLAy1EsR6wsX2rat/0s06?=
 =?iso-8859-1?Q?/FcNaxOS+6OZs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7c71f1-7b10-4788-86c8-08dab6500335
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:13:19.3668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BwNKGFga+zeXChK+ZZam/hW6/IZugNYml7MFc17Ls59Kv2J7HjVMmc8Z0BM/RX8WXL85+ux4n9nR7HtF0FGb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlvNlvYwPWXoFLWWYt8w4dlAPMq/PUy22ewnnWz9w/A=;
 b=sZSkUax51taoj6SruM/aHdhT3g66uFXG6LXma5CaOqXcR0vvz1/cqHpQjJv0TUkl0hN//yasAfBOI114tAJdUF4ynmAPhuAaE3MWMhTaUH92wYaN2eockkkYJFFa38z35jLN9J8O80stn2Dv7NGwpIlnZ0rwIWBgdn2NAAyV384=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=sZSkUax5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 09/11] package/spirv-llvm-translator: bump to
 version 15.0.0-2
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- Bump to latest commit that supports llvm15
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index edfca1ea02..0e06d36de1 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  bdd7cb677b9fcaaff1cce2153de9d69298f136edecaef3631915614bb5db09a1  spirv-llvm-translator-v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2.tar.gz
+sha256  c2b29bc495fe14a21e871481b5a25d7abed93df8fa3fc22e996e39d9c1373280  spirv-llvm-translator-v15.0.0-2-g2478920a91bff5c59ca65ea9bce8ffaa5af8fa88.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 159f7d3b52..d920999b28 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Generate version string using:
-#   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
-SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2
+#   git describe --tags --match 'v15*' --abbrev=40 origin/llvm_release_150
+SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-2-g2478920a91bff5c59ca65ea9bce8ffaa5af8fa88
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
