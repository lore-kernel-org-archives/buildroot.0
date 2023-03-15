Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A2C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 16:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF6060F4D;
	Wed, 15 Mar 2023 16:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF6060F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ot12u9eZ0hA; Wed, 15 Mar 2023 16:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A1C60F0F;
	Wed, 15 Mar 2023 16:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A1C60F0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 341F51BF86D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 16:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F370440B8E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 16:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F370440B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChiUXTcaen6x for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 16:21:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFC240B84
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFFC240B84
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 16:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ4wOFYvDdNvXhelxENnk8oHPSycZRivBe25AsUdBBBQeYfNCoIqKMEz/CIEp1zAdMsCL1pYlyxsO8vBiryOEljFkqx8sHOeVxGGyJMBFCKc/Iqd+0PB8uRc8jVPboqQB8kVbC21q0Ldfj48wkIDGx5R2n3qLQvcgRHohV7w3Vr2JNOGWRCQL6pYuEvzbQYL9JPd/Svh70o1WTkqDCL+DNAn+0f5Oq7XQMrYbqBAjd6J1Ve8RW+f1sAhJ7ieEM2gvEaMp8/GgdNt2Hb2GBpkiJGYkEJXCOXyv8Ps66v4QOYsTF3k4UjjXTKj2Tv/g2FSRY9rf8iB93Fjax2fz+8QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48YlJWWINa4q/FYfU44iFwedD+lAMuEG9/dXChrvI0Y=;
 b=MKyrsKS00KgtS4GcsT9kJJAvo3Ls/7erc4xtbDCiv9BbbFzy1tXw570lYtMS6Rv03DVnkDMzr4PAyeD0+v78bxsD4XoLfpLZrC2wuQRUvCjTtZkjxLXBAGQUSY1hi6X1g3l1gHk1tiv6aHczee1D6eJmDYJ6QZxOFRrzrIVgmp8b1FpumxkxEDyLDBUI0kwgxN5Htoxh5InddkxNtlBcXjltcynimFXSTgxNbZpo0KqGtIZKnjiS0RYdK+phtMhQ1x3H7NX3cf/EzAvRLxc6JAdhn5N26itYcq0Gh5ir2jdb5+KPPlhCCnBQXzzfZPtMSCXP+xmFkG0rIZDw5KIt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0615.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 16:21:12 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 16:21:11 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/sam-ba: drop 32bit host lib requirement
Thread-Index: AQHZV1n12pXzKZH0S0+Xj+DX+Q/58A==
Date: Wed, 15 Mar 2023 16:21:11 +0000
Message-ID: <VI1P190MB0493EB214DD0DF6418B029E69FBF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0615:EE_
x-ms-office365-filtering-correlation-id: 2d4c658d-8d9b-4ed9-6c8b-08db25714ab0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lbv83WhK3HxCMcolhjk1Dfv2S3q+ze5iwfqq9di144dWB2zWHkEdCu9isXeW+Ui9oyD9JpqpnltJC/d9n8tZrOdlPAvKqWN6K2HoPVAzHseN9Cm2gzgu6DooSKWLApGP1jbZPRyUXmNynpx8VH5PVyekxTpmZhQ/dZelQjGYlvx9Mmn1T8RWvM7W7dSPgU55iDGAHg07RxzCqfLhZiTAA7k480tmr3VpUtJ76zZE/bD6zjez2Wa8f3ekJozzWPOqvuHR9IuZ/ixonWVSp9HfUBmYYOOR1c/HwqPmcagHxGiyolv4cWhPbUHAqFhV0nUhHeJvg/3j6vK0aCRu+hmgeSYdoiRYuw2YZDxzP5Y1xshbogsvkLCQ5oY6MnDPjwz6pORpnZZWeeNAWkJRmW6t4tIoetn97vZ96HPqLwhLd5TXwl7Rw8Kon9rhrl09l0eHkpmLXjiLeXFa3j8SGzXiLBpZUO/+/IO6WVx3FK/b3Z8ny2kHdICymZj5TiMlylnTcoBs16XHt7HT/AH7EhLWWxz7EI9l5M7cFAL6Qq1KnE5ajY1XRdx5n7TcL2xfwO/xKGMBk17hWBv83B4Zs710btP8fMnQSpx9GuMXfIkrwAozUvolrXoAQW5pYODEsh0DO5/LuQMbXCrFc1rK4zm1EYb8RChorEy/uvVUs0cbZMb3m5wlSeEPrdG5vebPO0hzrPs8B7Mms083gKpOdcY1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39840400004)(376002)(136003)(396003)(451199018)(41300700001)(52536014)(8936002)(5660300002)(2906002)(38070700005)(33656002)(38100700002)(86362001)(122000001)(7696005)(478600001)(71200400001)(66556008)(8676002)(66476007)(64756008)(6916009)(76116006)(66446008)(66946007)(55016003)(4326008)(83380400001)(54906003)(316002)(9686003)(26005)(186003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tqgx4vUnm/t6nBCXorZ+AG0VwmKmQ7lR0cmNi++dGOPx/NpxIfDjxUa0VV?=
 =?iso-8859-1?Q?wK9QzivAC0U7RODeGqvPamtnfsFOOPi70YGT+eCCKJ/4F0JGSkPBKZqTaI?=
 =?iso-8859-1?Q?j8gUBYlykd2HPz3lXcg8bSthmzQYttJbMkpscznGiLMlj4yqDhKdyIZOFb?=
 =?iso-8859-1?Q?AJh+h2zfvDPSgDY70aBOJV+l1befBDVNsXaprgvdneF0KakeGkqowT3YQ7?=
 =?iso-8859-1?Q?5kUPTkYghDWRHfjDiAtU8B5XDOORqiFAwtpi5/EKDnn3VHbwWXNSLHJsvC?=
 =?iso-8859-1?Q?GPPePYxGq1Qc1W3Qqgb0TMe/TCmzyWdvtiozObQVyo48zliwB/vfDRyFdl?=
 =?iso-8859-1?Q?xGHCKq1vmCQVtZxOskBT9LqEUNTx+orxOSynoddvOcK/4qBZZId9cwH5Fi?=
 =?iso-8859-1?Q?fXU6MZoecgJONTbYIktxKAYIuzT/F+bikT66f4bwa+hLzlDQ69MxJ9zBQa?=
 =?iso-8859-1?Q?BwIevB8bE2aHntjUJWInJ9pRD0BjEdzSsKhkYmzHxzCfXcmsZvdQlJQ1mz?=
 =?iso-8859-1?Q?TyHIlLl2WiTaJNBm1HvI3ga7eiWV5toZ2LT3MLWFO/InvddUzxW9NynIyK?=
 =?iso-8859-1?Q?1UWDeCQvNyrsEP+rUQT38d9amq6jaMpfUVTAXM3BwJfUV01USx+NNAhHmU?=
 =?iso-8859-1?Q?yuNOjyFbs66wZorC1SBjgL39nJztcxsDVFRLFn5fFsyGrbN9u1ILLOuiJF?=
 =?iso-8859-1?Q?E4tTSk9brRrZRnJ7DWqdpkXLSdgQtAIomaJzjkCifLVW28SuNkl5sGcv6a?=
 =?iso-8859-1?Q?uQoNAOQJzhSxcZTlluBj27G7Nqh/1kKV95VfuG482+F3UBmVHZpziqRAm3?=
 =?iso-8859-1?Q?9SzNqt1p5sg+jqohZacNUopo2+TaOsnPt6BL+PFBTiC8onlSC6sZr9rvzR?=
 =?iso-8859-1?Q?xsLWe5FH2EvZZYvDk8vhE/pbLIaGwnHk5cI3f90SQmzBBPy32ArNA/rjVt?=
 =?iso-8859-1?Q?uDUEcmEovK2I10QtdHlqo6QY3jRX4Ox7kE9qFa2RMF3yJEx4f7b9e7UrNk?=
 =?iso-8859-1?Q?p5iJ77cSZ5VBX28/NATaK5rh6ht8sxjWP84d4DztAYCGsJxrhuqd27YBv8?=
 =?iso-8859-1?Q?JZ2cnEnTe5zKRhDlrHcVlec4KTGfi80Rj3RXynmPtM1t1TglDe6Eev151M?=
 =?iso-8859-1?Q?jU1P6tTwT7TkWGIzLurBAfTz6QGltbrhF2rMkGalGpubc8aYoVt/c6HM5o?=
 =?iso-8859-1?Q?h83qTNYsVWMg9MUxcfhwADMvxOxkohDiCw7+X3Ax48JNlSqtK5b5rZ6z9T?=
 =?iso-8859-1?Q?pXRxU78FfFwWGnJi0KFMhGuBYfrnXkCreKJK0eMW3wrTqLY6HmSll3USSo?=
 =?iso-8859-1?Q?fMH98Z5yR5kEZgbAcsjQ9v13BGE17SAQVWO4+edFC9PYxWqxMG/ddNTHBp?=
 =?iso-8859-1?Q?sO19fS7Wu73d4KmYJxZpVr0RfKRfa1gqIP88VAY8KwnTrjwFFKkIEMzDXp?=
 =?iso-8859-1?Q?PPdukhlCVK3u2+6qCDgqOHvvT2o9I8fMWrOjDvqQWzCX1H+pFzPb8ZRTCN?=
 =?iso-8859-1?Q?hIgEubKaW1FlCm53KO4bYg7eovSguGa+VhsP/JIyZa/IC5/x8nfsrK8Qd8?=
 =?iso-8859-1?Q?zm/556fnOOxFn6UvqqYSy4KYh71zVLlLRAFAkTAsX+kLj55j6XV+LXt5VQ?=
 =?iso-8859-1?Q?xV2iOOohWSI8I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c658d-8d9b-4ed9-6c8b-08db25714ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 16:21:11.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDVRz8CpvtlHQUn9pPtH9gvw1f0Umv6tAzPfNCWzybZLSPSTcJv4e00ACV8GY818aKuQqzsbmaVAVTBRr7p8vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0615
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48YlJWWINa4q/FYfU44iFwedD+lAMuEG9/dXChrvI0Y=;
 b=i8wGPe7tuUdgEM+dYmIHhOR850PNS2EC7wCur2WmxLyOwYnq0UAVHWKGxxISkmr3ahBkw4m6Uz+P9zXDOW0DvBjTb0gvlpFaVLeVEhMHtBO27qnvBCuGqaisE+UaTqzTTQdZ+Xx9QbOWYtO98u7sx07V931+EXbFVsChdFYSQ9I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=i8wGPe7t
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/sam-ba: drop 32bit host lib requirement
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current versions of sam-ba are 64bit only.

objdump -p $(HOST_DIR)/bin/sam-ba
$(HOST_DIR)/bin/sam-ba: file format elf64-x86-64

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 Config.in                     | 2 +-
 package/sam-ba/Config.in.host | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 0d7641633c..670e199c0b 100644
--- a/Config.in
+++ b/Config.in
@@ -65,7 +65,7 @@ config BR2_NEEDS_HOST_JAVA
 
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
-# toolchains, binary tools like SAM-BA, etc.).
+# toolchains, binary tools, etc.).
 config BR2_HOSTARCH_NEEDS_IA32_LIBS
 	bool
 
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 1967f33ab3..cd11e8633e 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
 	depends on BR2_HOSTARCH = "x86_64"
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
