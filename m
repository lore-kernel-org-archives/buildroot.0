Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D6CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73C560F4B;
	Fri, 12 Jun 2026 12:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLtvN-1LphH0; Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A40C60F4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266571;
	bh=hdgDdXPvtHXYzZZ9GCvxxYvJiqOXSzQKKstBMDPNRag=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxenIJWpvCl11qD3eGky4YaCimi0E+oxcQG/xM9jmaRtZALQjvI68OoaVIZB0AkfI
	 bqMiyVCwMTIYqJPW58glIyOgE8UP07UpashNwp1N7WMdqpxYP8auR+ETJQBV1NqBF0
	 Bgsq6PGnqoFjtBead3I68UeyLPlo7YPArTKObgckTcLamT/VfQulMw2dnxkxJJBwpa
	 SDMsX0mgtF/vEjtwukFU3sb8UGuDVksPhtljcK4Yk6HJ8NQ0Q1XEFuE5midaYV6/7G
	 7Q+xpp3JxAvphy6jWQdBYFK6E+CZLtWTLyEq1E613WdZL2kXnqD85s5LuIWD1qy+gx
	 SXfjhVMP9bb5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A40C60F4D;
	Fri, 12 Jun 2026 12:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E91512F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 242DD81F6F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx0PeRjOKUhr for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DA6081F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA6081F6E
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA6081F6E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVoXOO3DYLeeeQBY5vgvWWshGoOOWAKp1WJsEoTTc0fNthUcJw1QO82GjcP3ucnINuNLGcGNQjTZfeg03lEyqW7S4TTEnofZ9fvvF1TivndxKsuhuTKHPmdpl2Kqxs2g8Bmha0T/92OthcnCm6LQKp6DCAheiByexszmnuwC44Pmx4cE6jpCOfnpuBe8u3KI8urRIVg9KMQPxr/nanZ8EIMQCqgm3YVHC7tLO2ccuh75t/szZ4iRJDOxKlyyY2mnHdfLFg+iRcHUXp62c1ZOum+PBm23HARqEySdXIKIEiBBCZH6sPVAC44YaIHfPxmg6WXRXpMnTN5Lrm7FEvWybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdg/oCaEYoCAnTaKSRFAtavcgxGox+2fzCWF2+CWM+I=;
 b=WIH2kclTouzfh5xQjD6SsEm82RdwpmxjgkFv7Bw7KhkU1PGeQaz1pf+lA/X5RHCLSB8y3KegmknkMdHNvqGf2MOrdfwiJp+XfTc5k2vAzgBPpcoUNEpvhUBm4ttHoD3qTvE0wtkYMedV5MhmgNcw+2YBdCtjNGNtXy+4Sr0ffgiK5cWKf4HB3g31OKI6Ik7jkRpPGmgz62KJ9KHx5ttoqxCYK6n/cXq560P8jdoyoGnVtekt58VybgbefnDaSkJtNT6+9KgMlVmsDNtFFxW66LcLQegig7XkG8F1dAK0mfcBFF9CV+Gr5fgnXXe6/wc3/tJNrFxQH+XVK5c+voGSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:06 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:06 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 07/11] package/patchelf: add CPE
Thread-Index: AQHc+mU+lrSYQ9ieAEWLVqoyVoxfuQ==
Date: Fri, 12 Jun 2026 12:16:06 +0000
Message-ID: <20260612121516.1634-8-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: d66b04f7-ba85-41c1-8602-08dec87c60f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: bdAx74URxh4BoTje4R81Aayw9282Bur9xE2iqC5ev1IRoWBodMa3hqcR4UptLW73360rBhc+/xThIO3POP+DLcOaJDhNA+ROoJTx/TzM+KCTQEIMA3CpI9ABoJWSmX4lFj85Ap3nvUXFlbzWzs3j02rAsWUBUMF8sI5cU/DQzxzr/Z0odTIoA5KqvXucu3l0ys8xZ4jlm95GpmpiYZuYDhindVhouw9zgh2x5m8j0wt+VoHOCy5b9+37kHyDT40sG+jO33CTRWNS+dHdqljD0fqJf9fmkJWS1oSLsLEG9o2V+DO70KPWnAo4XRaZg8stTKnGV6Ct1ur9EXJlJ6G8HFRngw6N4+9HoiB2mdoDs/KJMZD1v4jCZMRrreXKTXXl/KdbVpVvVIv4axR9gCnsmvkFaY8mq64txIU3xDIDS7uXmHsRlchL8Wg5M1ztkdN7Me533qW//YXEjwhRZJISJ8h/8RpQ80w9TPS6d887smVSm0aq6Aw7enIgIIiWlAUWRbpgsByH+TJ3bRNs3/D2a9j39yIghtSqUI9Zk3neUiYqSMLLISyI5mb5tzzuSOINSvtNGTAj1u4PL4F01GOOT8TiqbP/mwkIG8VVExlQU1QhAtGUTDTTr+Oqf/SK2196rjuMHHxSjK8hmqaHnJgHRoeHvQn9GERp5dxa6aFb3rqgtiTCgZYD32PPuCbl5rsqplXKI1wiRBpTSrwLTdVtbSVNm5ZJfYkLtqMKflNasProwEV3sIMLLejWQ/y3Dkzn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UchYJrf0GLQDZ75+u9dkrKHKRwiyhs386Sw3b5O0+dc+f12/FGrNriztvN?=
 =?iso-8859-1?Q?dhC+m6VTuuenIq5hBbIai9a9zcfzZ4zjyEue0afuSKftiXBd/LRdN7LzsS?=
 =?iso-8859-1?Q?jXmoy/FgT3nT9YwblYEJ//VaX/4nrHCSmaDqC55KpjTfvZZBH6vKaLRK5a?=
 =?iso-8859-1?Q?qDmKyLzDOYjhrmkPftZWFdXUAMjS0nnVD+xS9UlmTKU/t7Z2VWnG0sRKCU?=
 =?iso-8859-1?Q?F0yRuRlgl9iK7Y5xfryV5vVHxGM0OfwLGB9tR06Wfo2iZMUgAH/nELN22e?=
 =?iso-8859-1?Q?sDba8zUUxrfYkK1N1Ycbmv0Gp4ewNmr9XbOURH4b3MHX01BCL2ecHoIgjE?=
 =?iso-8859-1?Q?dYAZnPDz7mYOzQk/mTVmWMG6SZmhtbD43DTgKaohlmrn9RssmsILQ9+v9v?=
 =?iso-8859-1?Q?KFHVZM7tkZGxE/7pI1RIiyWZQ0Abb5L7+z75TqBU7xhsgblYq7BmNy4WXN?=
 =?iso-8859-1?Q?JNgVY1rC89h/ljkKOlvq2oFQP70t8IDx48L6ZNZP2GXj7GA1FTkzhbcyP0?=
 =?iso-8859-1?Q?+ghojAxOPnDdvKkF0DqfKWcSJZZ9UltjSjhJy7fX/JeJzFGokvp+C731zg?=
 =?iso-8859-1?Q?vKq9Wbc+hvSpKUJABlTekpjOotc3US8WgAP75/X2L8UUExEChU8/jgjh4o?=
 =?iso-8859-1?Q?mp93y3i9GQbYTnuRRBifhzF6CCLq+NBkgD1mCnn/TaWrVcrIiMizNIb1lU?=
 =?iso-8859-1?Q?fnbgZNPkqpDPins48svRXMNxhnnHyYX8HR9dFALlJ36u3bm4qktYQDd8gq?=
 =?iso-8859-1?Q?Hf09aZTuWef9rQto/Nep80FZQ4PIzUxXUULEUAc135FlTxIiPwVzQ2KC7j?=
 =?iso-8859-1?Q?qKl+s0R+KuMP6QXePOr9Na2GZ4oQ2Cd3bmtNVz1m6Jsb6jWU0eCThZoRh5?=
 =?iso-8859-1?Q?AehiqP0J61pcc/b/pcO3dDfX+q2F6boNk4sQmZJJWW9eWUyQdinoOC8RMv?=
 =?iso-8859-1?Q?9j+MIs3mEHrCvKPfJba5t1V56LFZ9tyiVNhFQ4zGJWEJsT/Xn+BP4FjBeT?=
 =?iso-8859-1?Q?LnVFxm4QovX3u4C1n16jVIRGa9/yypqqMKl+b20ZKvW9HZ4xZeLUqr3/e8?=
 =?iso-8859-1?Q?IPlpB5dVq9Swwv6jHwEmfQC7uGiMipLmsIPg0oZ7+V8xL9JG1F2fEfhKpu?=
 =?iso-8859-1?Q?/+6GD+tFvNJL9zEB60QeIQcAzIPbMSeHaXp7ZmZQJdLAzCDMr/axsT6A5+?=
 =?iso-8859-1?Q?mVhfdRk/KfNLTMeEZC3i5SRO4Y9R4NkBGib3d+laIPqZm8D24nxbWmVpHB?=
 =?iso-8859-1?Q?7BPpV5q7vzCLWko4xWIkZfJZusv5cLUHGsK6Ng6tudZcQSo/L5PLblPrnB?=
 =?iso-8859-1?Q?7nnoIuBO7XZPDE0+5Ht17Tpo7acfYFUeYoLlfB5czZ9I/BPz3pO4sv5Kdw?=
 =?iso-8859-1?Q?1gnvzGXGsjXPzwrOqhcHTIhPX6XoUmt4sDv704B/bP2RAyZDvYjFNVvh2K?=
 =?iso-8859-1?Q?IrqT7jSYtdWNl0NOMA+RirQxAseayu5G5v4spdctOM/dvY+TUR2QX/q/gB?=
 =?iso-8859-1?Q?lsnoP9v9T3cxIN3xSZWlZxo6VK632FN3PCjWo/WAkIJ5Ipix1o30m996Gp?=
 =?iso-8859-1?Q?ld8SoeN29170ozw9aanKHL62MV2WZ3BeHTeY53q42hnumhovjqTZXBVzrP?=
 =?iso-8859-1?Q?dAXe1W5E4iZrTPNns4FrpXOuebN5NAqPaNoNIAFyiOpxNliNaloaSIsmW9?=
 =?iso-8859-1?Q?FxC4TbR4qblbKNArxq9pPCUHjzLrMEA8VWQoPSXFWa82SNJs+JeHv18936?=
 =?iso-8859-1?Q?gUguB8gNDVnbPT91yQItEEoinp8qonpMv6fjqyTqTMifXuFZ43oZOBhTiX?=
 =?iso-8859-1?Q?zTkBz9GPOHI+eiDvB5B8DKYCXg7dHjI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d66b04f7-ba85-41c1-8602-08dec87c60f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:06.0752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7h/8CLPA/rYsgHuNI04sOYevtIRM1oZGvlHdFYClOzTeaCs4tdNWfowYuh7C9S3W31hwKZ2NQl08rO2MN+OcVEWQqg1NzMY3uRM8dB91yYN4552KRthAHgleo6KXdc3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdg/oCaEYoCAnTaKSRFAtavcgxGox+2fzCWF2+CWM+I=;
 b=hDEs+hiZuYS2szwWQtzXxo5iAKn+hsyzBGNEVVrYpr9XdMgOidb794abaq30tG1d1k/hEhgZpD2UbaWgl2mA1kv4bvx8bUpRQF8U0IwJ/anZnFOBNnV7jfwdoOB9NLoVoiWZ138Z+bAObgLKobwBMwcKidnWp2ngRMnQujD1tTU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=hDEs+hiZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 07/11] package/patchelf: add CPE
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

From: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
---
 package/patchelf/patchelf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index c583b228a3..4642ba26d8 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -10,5 +10,5 @@ PATCHELF_SITE = \
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
-
+PATCHELF_CPE_ID_VENDOR = patchelf_project
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
