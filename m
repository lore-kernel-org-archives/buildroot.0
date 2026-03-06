Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF39FF0181F
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 14:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B44DF83C03;
	Fri,  6 Mar 2026 14:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1cbIfTg0cVD; Fri,  6 Mar 2026 14:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0A583BF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772806372;
	bh=XfIN1ua8rsE5V43KtFmsZCfN9ss/30DMvgC4rlFHv+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O8JYq3m9Y4MwzUT440Lnb493z1l8e+Gbr0hVyA0t1QJuSv5h4So5Pq/eRENzZHa3N
	 cYuReeSul/yO+gipbsilEy65kRkf47iIUFysIJc937bSqN0+zsMqUOtf/gUnn4hLBu
	 iq/3CtXvzUuQZrZVA8VEHmbd8eI/IPExPnCzgTB6JtFXPFobD0Egi4iQ7BTXCqkXLw
	 NtnR0LFd1qnqpYwcHvB1Pd0c8cVLISNXRTqI1R2sOQxSJpTv+BIECGod5RLZIwOgjE
	 ZxeHQYTYZEXX7okFB/Gx0mREiZhTGfIAk2blCT4eu5LQOPxaZvjBltqEr9/PeMEgMx
	 hAAea90MTCx1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0A583BF8;
	Fri,  6 Mar 2026 14:12:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A55A223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C075406C5
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJoDHExhwX1O for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 14:12:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c214::1;
 helo=gvap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 622BC406D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 622BC406D2
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c214::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 622BC406D2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh5rUuZ9yH0JQU2PSwlxhBZTsuhc7c4zEWgDW4xmKWBzh37rJ4RNStIkhT6km0LrBYoUjV7E4LpNQk5vXnH1xBbkEHUa7jjJdnFQ3m7DJKtHLDFRkabrx10g3SFpkMF2AAr4ExhcNGjbOVr89CFkSeQUklvbzFZFYab7rBmLfyQLN8sJa7Zw0vW/HvjaMMs8sWmhXNA5fBF0cnHYzUkxveHlXXREkyweoO1nfoBPU49O0XRJcWVL98TPFPTvFrchkgi7NycbohrMId/9UsNwwlOMLwovpmGxbxr+HXTaPI8fFMFmgglFJswKh2HNs+JvuRJDVZhIvHRamMlXmMMd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ig1+qtf1Fb/wClL1ffefFsJc3N1hw7JA9NbGTln17jw=;
 b=aQzMwdCBAOK1Dz4IBcQBo598qHTa0AQbp9jMLcS6vs+NkiN4VFB379eNhbay/NaVZzrJ0Jx+cHxsTOPDwvVUQxVdu6ctMz/Fi8E9bVWx6KrHTtKLFgmI0yCiuAXCHTd+I4yiNPDkCsUAgjg8TkXNqzr8j6frkHQZrphjAiiQn9+Ay4FeYh4UTnZ7vI+XAi2DgONIdhjF7XuXAz8EqXY4xWmxhsKcTmH2czdb8zq6fLrqQUBGVRWjlQkdBKI7tKJ1h6HxBBJbapBG+A0j+H9AjTJF4er0Rgzo/ImDpTSop3ZYYMStLGy5xBtPtbL1qrTmBXRKek7nzRLqdCnyvGo3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR0P278MB0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.19; Fri, 6 Mar 2026 14:12:44 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:12:44 +0000
To: buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] package/fontconfig: fix license information
Thread-Index: AdytczGDXwmOnTDrSVKbOKQnqTIGMQ==
Date: Fri, 6 Mar 2026 14:12:44 +0000
Message-ID: <ZR0P278MB0869478C4CE596433FD9E8F98B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=f6abcfad-1ff1-465c-a1c7-07c386eaaaf1;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-03-06T14:11:17Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR0P278MB0137:EE_
x-ms-office365-filtering-correlation-id: 528b3e1a-dbf7-43ac-bb21-08de7b8a6ff8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: Hq15hVQ+p+E6Q7ovSpS+X0UW31K5N8nyGjit25D7JcM86xh6d5e1Mfh0KkKeNJuxDarDEnB+zd+4Xf3jMb4+D/Zw7qevNoXA1yRrCdK3O5J4xzycHiMx0gVNpPUhcvbp1v8d5wPGD0+PBAfe7cwHim8mSN2LpRbVMshWfLf6BMjRWGVKHZF0NBOsQiSl7FssIXDUl/xrWx7GjNq+IArsHKIcNHeZWBHeki2NYlN8+dubbT3rf+GW+r+cuJ4zY9G4gPVIXHOB9uTOp367A2PabxTU6BWy0EIwlT1z82Ih7wR79vrKXqxPn/yj6VrcaWMCVkwP4jrQlYGMV0i0qQzo+x3MzEQ4v/dTYW1tJfcdZ2T9ryLoYx+R42A69X8ahgmuQQivOvmaEjkkPgTVIi9uDS6HffN4mVleCwXL4A9bi0PvquOBio4CsAURfhwGNmdVhRgCbFMww+c3BtCIqvXpzFsNkF2EukhOSE3vuD7c0ZO6/GnwX4q9RyGQjBJGtepkQRV91axQhCs8T1xoKD75moNDBimdCWE/oJjarYfDzS1HTTMb74E6L99HdE+EFgeu5XDn9M3ueo4C03g50i2It8facdQ7P6JzRzkNhBPbG76HbA0CjvYOyulbUYlwkbgWJPgzVbG8lSiR/oWaOif1+H7grjjCmLj+O0ecFqjQo+4mZ8G2+Wgsql+tsBJUGJFYXbCZ+n4rH9tl9SZqWB9UN022J1v1Uby6LNbG3SSpsMo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ix3/TIQSHhZ+NqsXr1a3x1fUN48aSNc3xnxCT5KqzqH4+sjFkRg9f3v0TF0g?=
 =?us-ascii?Q?RCgIe9JO5v2b5TPKYh1gdnDMuvPTJCsmd+eDRDrHotGSqck2gT9Ej8bWtnuN?=
 =?us-ascii?Q?6PaKPJgt5nsZZYVdqw8licA+dWiw9ENrhGZ3eAW5VAbd6dH39JITiUpWEYfF?=
 =?us-ascii?Q?3j0+HtyXvJpQcch33+ts+RglI0MopAayCb05rf0WdgpZLDQCy0wmvhJyAw3T?=
 =?us-ascii?Q?B2AfPucxk0DN0XhSf6f+Tvk7wTDDxnvg4r9pzrxr/BYvEDCXayfhxbJIm3yP?=
 =?us-ascii?Q?lGKRLpNaD0amsbBMW+2KamdabIzrjwkIq0JhdVBfSpHLN123S6aNgFTPBbPZ?=
 =?us-ascii?Q?+X/cH7UP/Jc2Sr9bSA/EoGK1CKeE9z0SoF8BZ5lCvaVT6bIlfhm82CJekcwz?=
 =?us-ascii?Q?0CiV/O+ZMK+i1hi9Lxid5XkjWJBiHOwf1+/aOQwxgxpmxiODuUtY+xd6nfLu?=
 =?us-ascii?Q?7oUI255C8dERV0s6r8NEE6i8+UV+tuitgW1mX2JMtUUtQSIatDgm/Znj99Cm?=
 =?us-ascii?Q?A+l3iZeGQBwQP4/cqGvEx46Aun0Lv138nTixRHSwu/f8zEZu2wOw6zQtPKS9?=
 =?us-ascii?Q?l8qRlQKZ04D9ox0J1ITEThNrY7HRUJ1v3c7j8bDCkiFS6imNOw/ClwR20bQM?=
 =?us-ascii?Q?LF+4JjHC1ibaew2v/p5mdTE6ru9cpzCujfz2dcpd53u2egD5JY4w3UP567Bc?=
 =?us-ascii?Q?8gInT0gbWCzeBG9VHnprO5Ecf8r/tsBAf20EG+WO3xbrRtt2kPb5EJO8Q8YU?=
 =?us-ascii?Q?J04bMxOloqk+dY7qdfNdOGscP6HrftMBz1RJw2Tf4QKQnqW7x0F2lwQevUVx?=
 =?us-ascii?Q?tFtawrBdOtFuJf7EZx+wR4FefkaZ/nATa9yMNRPuNTkpC3IZiEF011118lhG?=
 =?us-ascii?Q?Oa4GEUw3rluZDeZjBfwcxGkcG6hS57n86fL8RyESQW4FOn7YqE+s5Bvx/bRK?=
 =?us-ascii?Q?l/eyyqv/SXmT7EWTfmV26Rs6PxIiKqal0CaVXTrVVlkSg1vUzx7WpVpI85E+?=
 =?us-ascii?Q?fikGbq2leI57i3i2yHV47j3dJN0ruchnFAcIe0DnAdJO6EqwSqm7I8WtANIv?=
 =?us-ascii?Q?Qnystze3IlB8v1OGW9R8449HcCnwF+GBIhED83NmUaT4bCtEufP940K+eMNu?=
 =?us-ascii?Q?liK5yCoGYKzfdyeccAIx/7Ot1+FbKhrIMzBJf123RSnE24KQ5KUycKRzVfrs?=
 =?us-ascii?Q?73hmDTF3pDx6W/HBsNsZ7WRsExaCuOm4nA7KyJ7CFdGiZDGAmGiuuSfjqN2+?=
 =?us-ascii?Q?x0LD+D2BggKRFlgnP6dSVRNsr+0qGJB2q0ii+1AwgDh7hhEC1RDSCLw1ta8P?=
 =?us-ascii?Q?pzX1lIiQmTydaL6jDD8uZpEzaduQRTV/7fTduk1xF0rfMVs4tfp7vSsknn50?=
 =?us-ascii?Q?oXUVQ9TeK2GQrK9uAk+FKN/lWFyvIUpihzS9XvUGFX8BX3buNP8fICssr53R?=
 =?us-ascii?Q?Ait6J7L6/T3au4A/oonsuqjGcLPquai5AgFFOv3j8M2cM4C1QYkqQsz32HAn?=
 =?us-ascii?Q?4vWvqZJW5IuQlLrqMLeAvdFZyYBV3SB3smpv0BByNGmU3Ku7dYOa79fHEupH?=
 =?us-ascii?Q?CrjBQJ6L5vWPbowA0/0iI8JlF3eBmuAlZio7P2mtYC72IlM7/uCh9d06UsJD?=
 =?us-ascii?Q?wJGYuOLaydbEPkl5meZU8/3VXakNu/MZ4eiB2MG1zePSfn1JKJrJuE995nZZ?=
 =?us-ascii?Q?zsHhv6ViBeN6KE3DarjPqDRS1zmRhoDuYfJAAjBC3iEpjbSh9VMpUsOYU4BW?=
 =?us-ascii?Q?ze3XQzz4ErdFXxtY4tgjLaWZU8iu/o0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 528b3e1a-dbf7-43ac-bb21-08de7b8a6ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 14:12:44.7096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hj1HiaEqva6RdrsxwboSQwG1GeDjbICOIDUS+PgtOm697o/BGGATuhGDAGXBNWZFg9EZiQizPIwEIFgUnJb/FDp++tzPKpNbGrzNNinRgX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ig1+qtf1Fb/wClL1ffefFsJc3N1hw7JA9NbGTln17jw=;
 b=PiU/2tZlNPyNL2BIm5FgZnYgPzMaHDKg7c82uc9EPADo2Aj20OVja+XvvnlrdK2PA2emAJJwZeBlQNFf9r41omg4muiOUcwmnDa4v3l7i3hUujdajG3Uz8cEVUF7J+qFWVBXL09i703rIFngPWvzKeGegT3TJNn7YUAvBAfzQR8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=PiU/2tZl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH 3/3] package/fontconfig: fix license information
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fontconfig is licensed under the MIT license. This is confirmed by the upstream repository on gitlab (https://gitlab.freedesktop.org/fontconfig/fontconfig), as well as the metadata used by other distributions like OpenEmbedded.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/fontconfig/fontconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 639f6ed51d..198b9a0ffc 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -12,7 +12,7 @@ FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
 	$(TARGET_NLS_DEPENDENCIES)
 HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf \
 	host-gperf host-gettext
-FONTCONFIG_LICENSE = fontconfig license
+FONTCONFIG_LICENSE = MIT
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
