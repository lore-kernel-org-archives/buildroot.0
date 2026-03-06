Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C7F0183A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136BB61046;
	Fri,  6 Mar 2026 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMjjTp6SMHGg; Fri,  6 Mar 2026 14:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388D96104C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772805813;
	bh=DJ0+b+Du4FMB4oN4T2IO6qxuvSY6uCJ3gaFHjX2btJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mofh+3reUvpEdJTgyzVspJVqw/D/WoEI2lWQn0BVYdXErb9c3FCi9qlDDVr4CySG6
	 oxs2JPjyxddf+jcKU0Mz0TMo3p1iwjvmF26tDCDkX/D1mfTGgc+KKAZ676A5tAlUWH
	 yMG4Bve86lDXeEgzUUDi2fwyPvME61k6qRgZLgy/1QJ3Hei8FhPCc1Vb8qa44alAMa
	 +SHc+5IbQGIjDjwxZqIN99grapaGO4FaN5vRuo9nNnhETAmgAqv6yMkFN/XXX6D2Vl
	 zPe3u1jTmQVZBqwgF/G/a0MbDsoZa8tEuzo9OsYZoqM3seG/wdr0kdhrYKjZc2OG/P
	 lzzsrDwkp2apg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388D96104C;
	Fri,  6 Mar 2026 14:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4760C223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E2181E88
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oboPyYe0oALI for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 14:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c214::1;
 helo=gvap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 270EF81AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 270EF81AEF
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c214::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 270EF81AEF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxfBN+ofeOhZ+03a1C0AaUNOl2GYZ44TndYnhPQXL3w0AWJuxFcF7pO2tEdoKCeyE9IXY1j99WRbfHlR4bXDfXVsHKT/8EGuNYyJ/jAgGviVivCVkT4wvLr+cF4+GLuNJSsqfFmsQYMu4pWv0KfjzzVdwGgLyA1RpdLelB6MK0I8+LigZYcs38H7C2hfc0KiciZVChVCOtXuySlkkONQarcy1cDb+V6b7ilMPH8fSP/uV0nWrCmtsbFQDlBpAt0JlH8f+FqJ1iBWTAtP78gcraL2T0XZ0iPW3nk0WuM6K0ae17qyclBneRZI6DlFsN+JAyOUPFfgXC2VRS7a1i0UMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASg61GDffW3FoKiUdKXK8hcrO5i/VEq0489p5grnWKc=;
 b=lSHYbI0abMJD6nmL1yMXCRfVXSf6WLXVYSB4gt6Zo6eHoIzQPwTvgzMRqAKmqEy0kHl9V4LXoWm4krxNi0EsXgka/atGLG9mxqMZHmBFlCJ6hJHj7o4uMOWV2CPi7yzOyo/medVVYzj4q9STzzO4VTP6MXWg3cBe/DpF6V05dOyeiY6cA08GTmemqhFag0aAAw0b0RG2SqI/tvY+YphDBgT3qxy6h3ahH+cpI3y5P0jQgYUqYZ2Jk3uoj/Qld57R6s/etR6J62INmo011shndEyVNz4H8rirdMdAZxcInlDpB2vHlLfkrRE9K4NwD4zou7q4z85In9WHgcnLAl5n4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:55::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.19; Fri, 6 Mar 2026 14:03:22 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:03:22 +0000
To: buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] package/dejavu: add missing license information
Thread-Index: Adytb2WL7t8mHxTpQJimELIpbapNZw==
Date: Fri, 6 Mar 2026 14:03:22 +0000
Message-ID: <ZR0P278MB0869330F8A433371A1F8CB008B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=992e540b-9e70-4679-9404-cf46464e08ed;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-03-06T13:43:52Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR0P278MB1168:EE_
x-ms-office365-filtering-correlation-id: 1d3de685-f5b4-4e2f-feda-08de7b8920d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: hBiXoDD4/YtvJ1v8USCynRxny0wCscf758EfxX3JWnArJJM1qreNsywUmdels/ztdK/PiSsnTNtErrkE1MFjm9QwxkxKJLSGYLFwBKto03RNtjnQRmgl9xvW0chEPaX/7tIVuJqGOTYFfLwTJDp6w7HFRXYd781FDbcaDNKU5DPwPV8NVDmQM+pbQ4PWVNiMEIoIh9qIBK5NBWnRMkeCfbOezGv9ltKno0ay4PinIG4v1fQfNOvkaAhddyrrEpmrSCBRX5eMzB4I1Nhc91FBii2O5xXVcT+VfjZlkpXpRPQ5bsqk1zYlSXphgUqUbDX3as72DUisKmoJtcnd7jV/z8OL3qHIbIFAZZbzWgnkt1M+eMi+OXs+8jtyGPIk4QJ5W0s6Ry1Xh2oIprgOxFiPzbDJxlR9L5daj5AITeApkq7HXwccMgI6Qq7F2RKy5huQRfk6QBAacmrtU9Bwnn2XYjjQj6p6+4OaQExI+1b+g32B8XdFIX52xjiXSauU1HsnPEA/oF9bbcLAScX4C824VcxociCQwgavLorTFflMxWyKeDllDjJIDSmWr82fzybZWgl1CGDw2AaFljcRZczs/5WYx2vLi9ICeIIEaIBPH4GwD2Oey4dRpOspJvjUfzJxO9IYmL2P2tTyCyavCWjIEre2myY67xxbQ1g3YZsQItkQNSv/e02O+VaBylBEZXjAGxF5aiA/oTJvRN3tNsEtEUiVu5jn8hrJITps76pk32o5dUkJeePlc6dC5JQxyLDXUzKWHaCEemSuU+a79neyd94zbNmTYXbbEEYqXVzY3+Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?43fNwY3yvXd1SaQO2As65VhdbYC115E4oiTPPWSs+InbGID5hFBGTPDe1ewu?=
 =?us-ascii?Q?Q8pmpFQJp5AchZCgpMJvlLjFSzOJb67tCrQecK22tE8xklAo97dRypH58Mqr?=
 =?us-ascii?Q?Axq5fh1D5fV5NT+h6+ZgKO1uEfHwsyFjP7gG9AdYoTD5QwmHNDTP+TJxbvN3?=
 =?us-ascii?Q?wFdGS/U88ETX4lpEtECuB+P1PhHN1/HTzPKhFmvjpsjX2YU4p+ZKgiXyX8IG?=
 =?us-ascii?Q?uVM+hzIaHTN2A4GSChoLjzq4jW9cvxMmfqXZq2k1N4BkqOJbaROTlUP3Azoi?=
 =?us-ascii?Q?v2dGNizo5dENpvpV00y8iA279nlJmXYBRM+wDEzCD+yKMJb7HwG/6TDujjFC?=
 =?us-ascii?Q?X1hpTPi98iJUn+6eflM+922iLBLU+QaLW0A2hkTcm2LMvxZC6FcrsMCmFj8U?=
 =?us-ascii?Q?CN4wIrY10n3HuZBTdRih3giQRw3sRPZtoKGyq2Waad1HOyfQd9yD8U3JL8mO?=
 =?us-ascii?Q?n1vx8g9734/HSD9tdcxm3hzK/uz/OttfltatpAIyWZXztokPLZDUV3MTX35q?=
 =?us-ascii?Q?fsuByE339wgnmCIGOlD8wNUuAWbNkcRsjMNZXu8K9B9ZMqzJIJg5CjRBttJP?=
 =?us-ascii?Q?sMfPTeRimCrRd5YyHjorX8mNfkLfmpYWEQ3wEFG6ZXisw/VobWZqEuk9bxRi?=
 =?us-ascii?Q?2IVAhICfbwYejndypAm0iZJlQXqcjcBlyiI3ZI5ANywMV4bCn+Vi32iUo/23?=
 =?us-ascii?Q?R8WDr6rCRArBbNai0It2u9KOINHJnHYmoQ+IFbD2XxMeY3Y0V/LZTHsE9GRm?=
 =?us-ascii?Q?w4M1j9ZJGUI4J9mhlNZ3cH/vx0P4ZRwZNYuYnZD/WAC5QXTNrScHgkYP5dDW?=
 =?us-ascii?Q?532580itWF9GHxHqjs3NknnYNSTp2UHqwFSfkQILGcmmJHoPOqvROL3i3B+s?=
 =?us-ascii?Q?uCYNFbsRU6x0QneE5NTxb6hwPKbbCXio3wDt19Ilkvw77dPEGWwFaTubrR53?=
 =?us-ascii?Q?Sbv8TMO93CAnQfolQAi7+15rtc/RAYP86XECC9tGx8QXpsAGY78XB0Ohb7ZZ?=
 =?us-ascii?Q?xhvwV4yYtQDzphBvUW/Ua5ZFGxLa8qtjJOl3BC5MMOgcjKfurCdseG5wiCEE?=
 =?us-ascii?Q?7WYKxLZOVymcHe1GG2KMsBwGp0HictbH10h7Q5AkGZxdvevFngHxCgzOA4ff?=
 =?us-ascii?Q?JtJZn2bvXi44NWiTQKE/CEmTGhPTYNKrg9JFxWffCgr0MXEM4Wh1P7aItTt1?=
 =?us-ascii?Q?qNzXTIovKp6ruVs4pau9xWRjtJ3ec8CHyNUciyjyHEASICl9CrJqG6qTiWYc?=
 =?us-ascii?Q?sE0ejL7fN+ZIWjWr9Yp3yKInYOiWP27CnU40e3f+u3GNdDBWxJfmZpMY9Jg8?=
 =?us-ascii?Q?3mxcx738RSIwI+OTro6/pD5A5ObC3q9e7y0noLgSOdmrh1aAYT77CnVyvndO?=
 =?us-ascii?Q?Z/DqHItsniXCZx9WAGLpngQlFFjxKUX/FZ/AQcaIVmKKlcR5gHAJJ0U9e3nP?=
 =?us-ascii?Q?NgRCiUHH//pt10YQk0V24R6oR7V3rgbrJllKqwsJVPQiHEtjQ8ietZ3oTWzF?=
 =?us-ascii?Q?OBh1EzQCY1ZDwpTaKznLZxYy40D9CUV5zgfhllKG+8grLlUBfl7Vugz7YwAd?=
 =?us-ascii?Q?7dS0t+25+UynVQV3Kgd8cyqklpfQLeH+I674s+0phYev+KC07uzQh+JXqxCY?=
 =?us-ascii?Q?Rv1RNo3pgtUlOTIXY0yGFalqdHDDg8EpCWFWOg6naqFIE1p4so5LUJtuvwCF?=
 =?us-ascii?Q?7XOAo5r+UqKHuatvPj7WE3Py0VyI5k28jQ28Gwoqq1dfHqUvxqwbATtBia8C?=
 =?us-ascii?Q?WgfbN+K/iCo9mvWLoHfg25om79C3zYk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3de685-f5b4-4e2f-feda-08de7b8920d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 14:03:22.4507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh3Kz7qXBkxvL7s8JqLHWgPippVUjZAltP16K17nXnT+90ijneiD6jp9qtStVm/1Xn0aNxefOjunb27aQ9HzkQmhf3eMgNK92IchxoIZ+Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASg61GDffW3FoKiUdKXK8hcrO5i/VEq0489p5grnWKc=;
 b=nbJgi7sdVf040csa49Ysw3QVNMhdcSZ1C9Cpquhr7nZgoV800zhiGSyCES6si73VmKzhbd1lbS3aKy3TT6lpgsFIzfL41/awQXiuIQNjTUijw6HnqerZ9I6ka6Fxeq8mbdyg4nueBJGwSUuLaKJhpeeOWbsHNjfS/fZM/xA86cY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=nbJgi7sd
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH 1/3] package/dejavu: add missing license
 information
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

DEJAVU_LICENSE is primarily BitstreamVera. The license file also specifies that DejaVu-specific changes and certain math extensions are in the Public Domain. This matches the licensing logic used by OpenEmbedded/Yocto.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/dejavu/dejavu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
index 9b57f0992e..bcb8675442 100644
--- a/package/dejavu/dejavu.mk
+++ b/package/dejavu/dejavu.mk
@@ -7,6 +7,7 @@
 DEJAVU_VERSION = 2.37
 DEJAVU_SITE = https://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
 DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+DEJAVU_LICENSE = Bitstream-Vera
 DEJAVU_LICENSE_FILES = LICENSE
 
 DEJAVU_FONTS_INSTALL =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
