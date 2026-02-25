Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC25FD3758
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 12:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0581783E64;
	Wed, 25 Feb 2026 12:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXRQyz3cPJjL; Wed, 25 Feb 2026 12:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F53983D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772023722;
	bh=oV/kodAtFcGl1KmyK/+u32yksV8K9TyQlIgmyJ1l8Hc=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XxHFdZ++mT6T+syFgTTdRGfGkWYkgDco0vNj9I0WYGxz62QsejE+OtIpu8orrOqfN
	 OGWmezPMMEElwiA21arKo6+fKcfQ6WfY/yFVXuxuQE723GuVRuott3SoBof/94V8Yp
	 hokOCqV0iOD9yBbD9fd3kp9P18ZFRg1c7z1LuM50CXKb0ud8jPRUfGgprkGR/vcJr/
	 WS9+d+G2XbbKAOr+J0sIalOKg14i/yJ/wlGRJL9s996tmEL3ha02SSIKYz8mKBIo6f
	 zPELQ2GsMhSeZQI/OgPAwDiUrYNK0tV8useNlg3Tuvqz1/o0lKN2QBbeXnChTqTZqZ
	 kUubUH4dCeR6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F53983D14;
	Wed, 25 Feb 2026 12:48:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A29C23D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FA7F41D25
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-hKTPtwP-9I for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 12:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 437C541D0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437C541D0C
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 437C541D0C
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 12:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8C0kUCjObol/w9kuH54bxw0c578vka5yFySSHcVvz0o2nvm0b/3y5bF6YY8JVUuvyWGG360BPc9u+PVVtB6kq14hh/dET+VT+krPfi6J7O9c2mntQfpho+SZFYijm2bzZnc07n3Lyg2EqDbEecsjBYx7O1SSxfKHuzB4rZyyRArpfvQJ5Rnj2w3p8b9z2dix8DTSHMeoQ2pQP9+kTQPq9sh5knB8W9YJ8MYyS3aSXdUzxeY5L9sybz8pw2qWf8sUk3E0w3REXBA6//MySVI3txdCBrOnImh07GKsFT1z1M5E0F0Yg0DhrqHv7Nfv+Vz96br90v3OU4ckrxgOLL8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWtimSpcdt2mbBR9gk8RbMwzdwKs8Z35BWFY3tpWO4w=;
 b=s/xIiYHKEnvIEasI8I9udbhNuTROuo4lkswuDOhVdsicZ8OzgRT6p4LypUWcho5xJf1RzSMbMUieG0hQCxbk6JAU7h4ixaSId2ZxfaHACHwTg7uMSGV7igl1wjnvhCTK2dMy6WpniZlGS1HeEv++rRNdSPDBHIXEAgCIed1gJqkiKbYv6I7TelfmveeCmMlLQ03GP0yoajD1vwdXj1AJl6doRmSk7yIkhnNKRL/W/vANVbS0Riti+RrwRYEbBox+524ZuJ79/ghrzLvMDxgQwafVRRIPMpMe0rAApV8KfY45Z4iAX8QPU5q2bcQAKeQuFv+a/jaUlvn+5eHuDHA8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartandconnective.com; dmarc=pass action=none
 header.from=smartandconnective.com; dkim=pass
 header.d=smartandconnective.com; arc=none
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::6) by
 PR1P264MB3510.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.23; Wed, 25 Feb 2026 12:48:35 +0000
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1]) by MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 12:48:35 +0000
From: Sebastien LAVEZE <slaveze@smartandconnective.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Sebastien LAVEZE <slaveze@smartandconnective.com>
Thread-Topic: [PATCH] package/pkg-cargo: add HOST_* variables for target build
Thread-Index: AQHcplUNRQkdTrEt80iyVGgZmm6GNQ==
Date: Wed, 25 Feb 2026 12:48:34 +0000
Message-ID: <20260225124832.3969166-1-slaveze@smartandconnective.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB3425:EE_|PR1P264MB3510:EE_
x-ms-office365-filtering-correlation-id: 63967e92-e96d-477c-01be-08de746c304f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: J/5kmtnHwdqwUha/KIYXPP+0n2+UGnhHf/P6qRKJgSaedvjXbIiuQx7gm0sPqOSJ0Kzdx2TaLS3ew5X32kJzxtWmfT5uJXEugey6sixLENQ1rAkwAmCQUrpaHyoVg5c0j+tFnCgibHGLkLIod3+cFzkwn+rSiQyIa+fNQtjL53P2lXoaxRefLPNhkMK7U3qDxymkIi/nNWSjcYpGW2ZCKtDWvQBq8RbiYN9R4BITA0rR9PtmhGb3BD9kHfxnKW/aytbDTsW9FOYVY+SwFmNSPRJ7PpMyahv+MQq8wQTSTZWmjN6w48jG9ZiLooxoqK9QejN5S6qUEEXmsx95UTpdXJ+UPIFoZ1dhElmb1a0ZS/rJt/G1dyc43Jqnncqtp28UDZC6hqorxwgtQ0fG3fUmlM82r1tE4qzGOU6lcY9IOtvN96gurUl/TeAwFWdFIx9qhYEwzOj4dJj1cLnXEJTycmtpfDR3eGvDNn5gU/UHtHRgWaUqA+06+dpAGYdcfH56kC+AbY6R1CICke5BnC1u+YyuqzJbY2SAiSTcA25tlrznktJ8eLMLc4cT7t/7+HY1IzcN0Aq9x7Fd4CoZDO+tCIMX20mNBAvzfU9CwFtTk4XYx4UVTG59CnGywLP5ukdmCFDV0sb9bDQDl1yx1CxE+ir3obraLiogVzPKxow2tD/WoCP8f2jhRWsyPy1CJO2s6zFl1BSbTOpJV/X9VJ6PgdfM1/Ro/XEveBSAwbYRtrViVnRnS/1wI1iRMD5HDOsL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H8DrudGxsBCkJCbCevL++kPHOxU6BNWi0Ftz3bBB8J43GvYxqq0Be9hYXz?=
 =?iso-8859-1?Q?ZKyVsptj5VaToTxn9KJqEL2kayo1b/PKfwEBauzcKAB99wrI1fp3zbF1gc?=
 =?iso-8859-1?Q?kq2hie/bhtmZTf3UO954d7hYFhNuNns3+SoAiJ19SJrAdDgLA5609WXinJ?=
 =?iso-8859-1?Q?gE/Hl+leB2EkXU65B55ZpxnykrJfAVy2knnnSmJB7oTsnSom7jxaKPrKpn?=
 =?iso-8859-1?Q?qDPyXXGAOKakXHmghIkTZqEIiTFXR2gRTFu/LVThZP5c7EpAra/bxTBbqx?=
 =?iso-8859-1?Q?l810MGYotCx7ovAzhsmjaLxYq83c1zrVaXY3n4UdXPM/QyFTtk0NO13DIY?=
 =?iso-8859-1?Q?81uyFixkBApQsE/gf7IMQZqSK82QP3GenFAVk0Z/F9ys9IIsRqV3IDqFsV?=
 =?iso-8859-1?Q?5HuM1cBNH6k62jsuCr8X38c6ib2RBBNnLdqPXioimkxd/8rR6/ohF0LOOY?=
 =?iso-8859-1?Q?vB0AuI08qmbcec+7ZxEYNHhdSeiwPODDsqhBNwxtDQouHrNLaZqd/X63HZ?=
 =?iso-8859-1?Q?Ph8yyXEerGknv3aqNiJ6EpDahO507VwWwbzPJkuMWDimBhs3k3MK8jMAn+?=
 =?iso-8859-1?Q?J+OLiZLc+vkeLaocNK+J0WJnowr7xubJa79te7s0E0ACxPUOI2TYnJxREg?=
 =?iso-8859-1?Q?/k0XnnSJnc/Hvr2x2YyTHyqWqZrOiU5bW0HIJjoDafMLlvBWcUnuKbly86?=
 =?iso-8859-1?Q?gwE+GFWJJLFUKsOtRFk8de55UTHHMALcW50uJ0unI11w/cD3iBrGdutghH?=
 =?iso-8859-1?Q?lR1D3lTeFrWHybhNApPCYKc+b4gLUFg1AecQ88W2Z9z+o+PRvPWxENS6Ty?=
 =?iso-8859-1?Q?HFzSx0jBB4c6rqIGsGsME/3rEiLmIIh8NH+xmHodMxV8M0M5ttY1uQ6T8L?=
 =?iso-8859-1?Q?8CpFK1YQ2cD6j36YqtI2Y0PgeZWtWm8mKzm1/pMYjA1mqt/Vh2cCikZD8P?=
 =?iso-8859-1?Q?xXloNk0sy3vmQnV7xtmrO0etkvvZOtlr0SB3DHA7itiMRATumKp786LdTc?=
 =?iso-8859-1?Q?2Jg8msA0aC7GpDZNdPr355kXHZ9OZigGh5jcTpMXMfAqDiX+y8EuwqGyIk?=
 =?iso-8859-1?Q?b/Hls/fpRABAGrihgn0EoDOFa7TfPnfbEQrpiPxtGGWWxyC73IeCWqS2FP?=
 =?iso-8859-1?Q?Fha/KJtGIBVwX1fW1dqqvJ5GyOySqvwlbC6ehH4MUsPM5GkIx4yqZFlpBY?=
 =?iso-8859-1?Q?ZjFndfZjIHcreW90Am1Qg9yHHCZ8/w3vziP75JWYpKTsF8RqPX+6fcSKVp?=
 =?iso-8859-1?Q?7O44x8bbtNfiPZHONQ6hhN9nokzyA+XCdYb+Eo/bUHpOjoeNT3Oj0B2xTB?=
 =?iso-8859-1?Q?DsD3Tc+05NHTW5WHITuvWX/9Y9bbyVkyjfLmOiIK4VMx6bqtaJZJsF5uo+?=
 =?iso-8859-1?Q?MkntxPPkfg57L7EG354PUBxmwPvi6oxCDiNHI92ESsKJnOW1NUjokj0xhL?=
 =?iso-8859-1?Q?i1430Rlc3QqESsdMAKj4HB3HpGQ8HyiwvH2iTfFxyAWNl0i4taOrQM2iLN?=
 =?iso-8859-1?Q?lWIpJcDRlEo8sB0gCzHbvsEUyoLBMcj0He3ZrjU5T+ZjlCnukdZXcwNiNf?=
 =?iso-8859-1?Q?lB+ityQ8FTpOkhJ676c+nlHqOx4MnxV8WnyMubmU+3GZjUkSjxeGVu+u0/?=
 =?iso-8859-1?Q?Kii/i5bT/HunvVvJjTtz51d8PbN/0ecMWBgSGGbOSAIIiJAN22dM0pyBZp?=
 =?iso-8859-1?Q?NUQy8IUtmAR4jXSSwii+wUuuGXB1apc0SXku1+4mq0DL+muYe4ufLUq3v0?=
 =?iso-8859-1?Q?mYRbbJ6VMUsHWM66uXntg6OfaGCXc4bChNAvhQOPKqM/Z7QpkXpwbWSPko?=
 =?iso-8859-1?Q?+c59Hyh6Tx/rvtC4QVrttC5ZvpvrChY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: smartandconnective.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63967e92-e96d-477c-01be-08de746c304f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 12:48:34.8356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f3dead9-eeef-44dc-ad5d-e14fabd26082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2s1JS+LtZjl4S9v3TLsFWMkXPX9D7rWX3lS1HjLTSfwWpEX8lH62N5S7/LvK5gH73gi7ljTh0vv38qtNi0cdVPU9Wtd/ZsdLtNGkbDl2IEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3510
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWtimSpcdt2mbBR9gk8RbMwzdwKs8Z35BWFY3tpWO4w=;
 b=nMra0UIAyGf5G4T4n6rGVfxax44rt9mUbmHUN10ptq/9NZif4qb5XJO8Lw/Qeej7sT5CdSAFZpQUZN6k0AQkEoqUi2eY8ZDmGgmcE4Nelb37/jPcwJUKMDjCKvA69K5LnaWLBXTuRsp96fE6Eyj8s7P2sjuGqqw4LpE2WheT8mZE2NkCf8gUZ4x4CL2dDs+P7qXxe6bp94iKsFDHGSOPhNNPnSshES8BM5A01xBSTs3tB5u8a+CMI2UP01cE+Duoms5iAW5E1nhB3kjCVby+csZtSTJ5k9YdYACc3HSKSYBIcf4Q78MO+Lgczt4MOGw17yC8fu4Wv8G2Te4XcclZlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=selector1 header.b=nMra0UIA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartandconnective.com;
Subject: [Buildroot] [PATCH] package/pkg-cargo: add HOST_* variables for
 target build
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

From: Sebastien Laveze <slaveze@smartandconnective.com>

Cargo builds both host (build.rs) and target in the same build stage.

Host-side build scripts (build.rs) using cc-rs resolve tools/flags through
HOST_* before falling back to unprefixed variables. Without HOST_* set, they
can incorrectly pick target compiler/flags and fail in mixed-bitness setups
(e.g. 64-bit host with 32-bit target).

https://docs.rs/cc/1.2.55/cc/#external-configuration-via-environment-variables

Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
---
 package/pkg-cargo.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..a3c7436a1b 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -51,7 +51,19 @@ PKG_CARGO_ENV = \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
 	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
-	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
+	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc \
+	HOST_AR="$(HOSTAR)" \
+	HOST_AS="$(HOSTAS)" \
+	HOST_CC="$(HOSTCC)" \
+	HOST_CXX="$(HOSTCXX)" \
+	HOST_CPP="$(HOSTCPP)" \
+	HOST_LD="$(HOSTLD)" \
+	HOST_NM="$(HOSTNM)" \
+	HOST_RANLIB="$(HOSTRANLIB)" \
+	HOST_PKG_CONFIG_SYSROOT_DIR="/" \
+	HOST_PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	HOST_PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	HOST_PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 
 # We always set both CARGO_PROFILE_DEV and CARGO_PROFILE_RELEASE
 # as we are unable to select a build profile using the environment.
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
