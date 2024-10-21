Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41286D3C92D
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 11:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FA040302;
	Mon, 21 Oct 2024 11:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYpjHdLk-1yi; Mon, 21 Oct 2024 11:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3144030C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3144030C;
	Mon, 21 Oct 2024 11:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FBE127D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA5280CC3
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCE7Tzi5FxNJ for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 11:57:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2614::706;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D14F80CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D14F80CB0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2614::706])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D14F80CB0
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na4yyFOI8sTI/I1HEddEvMQhwqodOm61ih1ehVqVk/LfnD9o3es97PPMmS02oTZJcHAs7P2AZfy9WJg1I2TUWjYREHFqf8JUuVFe9lebG+KuWuiW4CnB5HVfabNW6QAoYkcrPedOxAbOBFag9K6wsUA3Bk+nxBFr+JivY1vO8L5ylJcuwFs1/1lAI1PhS5t5kRXX3hQUboZ6kHfO3RpNU8tA5882bOwgqjMSpmkU8eELrZaT3oBOliWM0t1kRkJXu77kxlV1nsei0f+rjfKf786bYWih6abU7go39RCR4H6ozrlizDzY2qdsrmZCS0OYiuqEE83gyUhsk2zxjd0MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR4LxhbcMHjIb3V9Jbdtg/gi2QRfML+aXy0jMnMqpsc=;
 b=SBpAcp4Rjsog0HJQFqx+BS4uKwdsV1hXaPAbp5PAyFbczMaywJodIZRn+43rF/0yjZRGhZ7s7RQBKxHQotbJ0k3xTga0b16PrKJ6BN5E1oOtK9W/QJON3/OLupbHRrgj9ca216WnuT3PnZlAoiDDwtU7Q0SDBqseNr4+Mw/MakpF8M3S6B0FO1LwhSRWwXmh5aHuoZQ5vMg263it8zK0lo2QWuYeJp37x2vNW8kydmkbZWSHoVMrFuY7g1evnN28o3/X0YmolYcAFGnGDaqpFQB7wy93HWPZfVcY7izxYUho1s7sYikbqdO23ljqMgcTLAXWE9i048Gy8u+K7kWtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by DUZPR06MB8906.eurprd06.prod.outlook.com (2603:10a6:10:4df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:56:55 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:56:55 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/certmonger: add certmonger package
Thread-Index: Adsjr+UlTTOopnvRS0uIZFEAq0Bmcg==
Date: Mon, 21 Oct 2024 11:56:54 +0000
Message-ID: <VI1PR06MB8926C0355B067317D6675B37AD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|DUZPR06MB8906:EE_
x-ms-office365-filtering-correlation-id: 8cf8fd71-7f7d-4372-c0a2-08dcf1c77566
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zEvu33oSKo7S5Ap8xjSa8dh3WYHaP4E371V7gwki4WbPFl1V1rZI42mNcXR/?=
 =?us-ascii?Q?p2qc63y6xT2QbxNMLzEkod+pTv6ix/abteCt2PqtwaEhMPoS3Cd/y40T0ulg?=
 =?us-ascii?Q?/IJ8G5gcuj0paat6nMIPR8Jyw5Exe5QmJCoTScc8FMiwhdbQp83odk/L9Tmn?=
 =?us-ascii?Q?WQEmTtXjHGl7ZPJ1oJu740DEM3S+wU6LA5DlCs255UPTGWChxPHlt72GsAhS?=
 =?us-ascii?Q?Yfc6kvk2AiJjhzQ8JBtAI+7VoRVrH06WcNZ8mSKmdxQeGPvDcNLvw/1Y0uQh?=
 =?us-ascii?Q?gRfiES8mKqZoH5d43vGi5v7Flox7oU0AQqdoaDjxsZapZprt7cIdvItYxcJN?=
 =?us-ascii?Q?8AFJnDPoui/rxcm/QMU8WqcWekyfg2AGlaevIZAtiwFpCp96pCkrUSTPRYRf?=
 =?us-ascii?Q?HHzZqhrv+yAzSZxS5pjE5qTccoHfl0/YWMxuL8U+8ypdGfHXDr5PnPlcV8YU?=
 =?us-ascii?Q?ANXBWYkNwVYTvYaxKX1ccSKi/JiKAhR0/Fa86Dm7WPGTaIcbr/j51oQ3jmjg?=
 =?us-ascii?Q?6Lfu/GxnF4gM/Y3qkj+7VtSKX2juB8Bmf+PcmF1u4Sq49Ta/+Ub120PizcRW?=
 =?us-ascii?Q?gr2oc8w1DeRm5SdBXZgWzhV6GetPGhulA/evTOl/1KAXPYPDbVVFG8IbLleD?=
 =?us-ascii?Q?Zfd2na7ql1902IMKFAwIQX6rdZoNWBlkUn1fxbjND1RfH84fBVpkg8h8EuDp?=
 =?us-ascii?Q?zh8pJEDRJQvtdo+HUM6eMBMFNB6R61x3EZHX2A5H5j5d3+EvGRQn6zcC/4h9?=
 =?us-ascii?Q?IPa+89S8m7OY9H4JuLFGeGMjwYEvCAreLi6fyqrIMpCFbijusLCGzwvlfX20?=
 =?us-ascii?Q?E9YueGdKXtN4Pib+6ESAByvF3I7jrIU2F/P6QFK4zD/B3mq8UoRX4e8s5sre?=
 =?us-ascii?Q?xFkAYvFHcUp/joeYTZgTN1I3AwsZ9W1ujn/WiIl6+6aOrqa3JZUYt65e8VgK?=
 =?us-ascii?Q?flsKHNvyQa0M3GGiZFKWX/gS3hmqNu/3+V4s319kwwz+AHrHkccOsrhtTBJf?=
 =?us-ascii?Q?XxzkEjunyqyuRIX10UJGRPD3mL3hkahU05aTkG2NZNMzx4M+n07zRD9PczK8?=
 =?us-ascii?Q?ioUH5f3qWOveegaNLi5XMHI7Ez8j09LEsWVjPGrycNBjY5hsPX1moSYDwdse?=
 =?us-ascii?Q?8LEjeqUf7+kxFEhGpEZDJCNZi3yAaz18aajVDIG31OoIvlW5SA/RnlUKqTm6?=
 =?us-ascii?Q?YS5kpMQzUhlCC77/po8ZvaIhtzqA6tgPNBRanorSWOCL9Xu+BWgqQn7n6I7S?=
 =?us-ascii?Q?cIe00FY4MYzjOCuIX3fecCCc/NoF3RlGacxcKvCNmq/jM2BA2hQyt18MgNJj?=
 =?us-ascii?Q?D7Ho2Pucft72orISo41FL9gx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uV/AKwdPzMP5mE9NDfJPoDn26UpfM0t6XMwZ64xvIOK86gwpKmdxtOvSVWzh?=
 =?us-ascii?Q?pTugALesI0DPkNHtwQni/22Q/90u0MdCCWnC0dKsCL7PMP58GYtbu7IUgNu5?=
 =?us-ascii?Q?EDZxW8Iu+Wtv1T2HvVRlD0JZl/4hizboY7s4FEY/xS02smvXp+jR21C0P7xZ?=
 =?us-ascii?Q?urQDfJ33HV4Yn9Tej3Mbt3109gkkzsso1RCDT74rh6B3rzW2Xmrp7R+BMVio?=
 =?us-ascii?Q?nH+InsXt0ZJ1qYRTiebUAWhLSMPVp/+Yu+KC0afFV6F5CYsyzjpaMJyzltme?=
 =?us-ascii?Q?qgFJX1R6RhRaqVEDpIl+XGbe8o2Zo1cSiYAK+4MKo22eFB64AxY3aGE7Wn2e?=
 =?us-ascii?Q?mPeUoMsQgD7Uy2BgRdppS5CsCHPU8XpyLiEuK/4FlXr9Uht1yPTZ1p8/df8h?=
 =?us-ascii?Q?tBqjH0NT32E2PmKlM8TVgJRTT6MTCHTxNfwySLIQyqL+oldwwQT/vmwoNQNG?=
 =?us-ascii?Q?TZSrAFpmaQX5lhEizbsTzRRPF+B3xo75au63qTxCu1BgWqD9i95cmabvhfLj?=
 =?us-ascii?Q?5yQyrJp15XKH5oH1fMZNc419Dfbq3+3dYSZ5BGfS8WVaO+SgdAmUz/dN+uf5?=
 =?us-ascii?Q?5CwPwFxLQT1oS1QUtZdof7YIMX+04rbd20YpYix7a+qFO/IjBSRG/a56Lw4t?=
 =?us-ascii?Q?9u1YdjCm+ejmSTX/2OnuI6JooNDkEoBAzSYMarqO94lpI+VWBCyez7fALACT?=
 =?us-ascii?Q?Xg+It3nzkIXsQpXPkK9oZPjWV4Itydv8emRoEa+UOuSV2LBg57T7xEPaTaBQ?=
 =?us-ascii?Q?4bKiUCjjszOwopp8mYYAF5yWUzKsttDzuKxpF1orq0A1dLa6aJBWrM7ytglv?=
 =?us-ascii?Q?2MmFSitfCn7sLqIM1WaJkYcJpN4zlU65Mi19RA3JnrxpSkeBuN1laWDE2QHm?=
 =?us-ascii?Q?JVNxzHdEMJTLxeYsib+X+vszzyqCmaNGoOF5WOJyFfGXy4zy3WNSClIkX0No?=
 =?us-ascii?Q?gEjmS+LllNVZdyrHlfV80wHLQ657ZGL4tRVsV1udJOgj0JMg+uNFwQjWITYq?=
 =?us-ascii?Q?a7tYg/o8r6rYs5Z+lBBzzKIJ66l+3MYRvj9hkMymdWpBCgBD7DbKFjV0br+f?=
 =?us-ascii?Q?63pUAjGnMmbS8pg6D0igYkLptBRD17buaeyRz7u3p7+AYHbq0W8Vqg32snE4?=
 =?us-ascii?Q?uj8xQtjjcUq0hR4W+1yoZWSKyR+vW7856QW++yVGfd0VNAxH9isg9Izuf2Zs?=
 =?us-ascii?Q?84ttQZU3cePKKadtKLJJXbUBI+M7Rv6/Mso7On/eMdmV9ualb92Wfg+Z/ewf?=
 =?us-ascii?Q?PA7W8xrKqFUJ4jg4DF8MuLsnHK9iwC6Ua7N8A57E5kJhjNZVAh5mnzVIGdc1?=
 =?us-ascii?Q?0MGW2vVpPIu4DcZEsO0YOEjHR5pcLhSL5E3ot1pKbTG1EGHf9Uk48UxasIIC?=
 =?us-ascii?Q?my2aofjZRd8h5ptYpmTpLp3fDBHXct7wWXZlxrQ5WkYKNtUGtrYfvS/EN2d1?=
 =?us-ascii?Q?go2w5pf9XR5FphWDCtlgxmuRcXqFIG9zzGz6CBQpKOQx06uCY/VAaI/flk/A?=
 =?us-ascii?Q?m1+9ZXWUJ7+a7iFmdmVwoeWQ5Dh6942Q+CR25SsA6mouOljFBex6wbRXaPAy?=
 =?us-ascii?Q?NSpN9Z4Wu13T5iqXl9g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf8fd71-7f7d-4372-c0a2-08dcf1c77566
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 11:56:55.0194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Cv+RsgkvalZFPsF1TMzz2EdiCpcXum/0/2Etx2wR04GuQdgQfA2Fa6nxLeWHOvPRAm6NHBOqrPDmTSIicBH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8906
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR4LxhbcMHjIb3V9Jbdtg/gi2QRfML+aXy0jMnMqpsc=;
 b=F0+YN0HQtmb0IHm09a89xEtnFvDgv2xddpQavVuXCkeAJQ7XDl5X0Tvdf851ASg9BREvf59IcOKgI2qqD7i16xduWNwwJf7SE3pnuND2JOuMXGQoOX/jX8l9rJaIGKsSXUsKBIBkYfRpY3uHcfp/a/OxkSsuvatp97yD7CddRfE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=F0+YN0HQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: [Buildroot] [PATCH 1/1] package/certmonger: add certmonger package
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
Content-Type: multipart/mixed; boundary="===============0285161024624051588=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0285161024624051588==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB8926C0355B067317D6675B37AD432VI1PR06MB8926eurp_"

--_000_VI1PR06MB8926C0355B067317D6675B37AD432VI1PR06MB8926eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Added support for the certmonger package (version 0.79.20).
Certmonger is used to monitor certificates and can refresh the certificate =
with the help of a CA.
In today's age, cybersecurity is a critical need for network connected devi=
ces.
Certmonger can help maintain all the certificate stuff so the user itself h=
as less to worry about.

Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>
---
package/Config.in                  |  1 +
package/certmonger/Config.in       | 19 +++++++++++++++++++
package/certmonger/certmonger.hash |  2 ++
package/certmonger/certmonger.mk   | 25 +++++++++++++++++++++++++
4 files changed, 47 insertions(+)
create mode 100644 package/certmonger/Config.in
create mode 100644 package/certmonger/certmonger.hash
create mode 100644 package/certmonger/certmonger.mk

diff --git a/package/Config.in b/package/Config.in
index d4cc03dcdb..73efaae622 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2688,6 +2688,7 @@ endif
               source "package/zabbix/Config.in"
               source "package/zeek/Config.in"
               source "package/znc/Config.in"
+             source "package/certmonger/Config.in"
 endmenu
diff --git a/package/certmonger/Config.in b/package/certmonger/Config.in
new file mode 100644
index 0000000000..9d0e112b5a
--- /dev/null
+++ b/package/certmonger/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CERTMONGER
+             bool "Certmonger"
+             select BR2_PACKAGE_LIBTALLOC
+             select BR2_PACKAGE_LIBTEVENT
+             select BR2_PACKAGE_DBUS
+             select BR2_PACKAGE_LIBNSS
+             select BR2_PACKAGE_LIBXML2
+             select BR2_PACKAGE_LIBCURL
+             select BR2_PACKAGE_JANSSON
+             select BR2_PACKAGE_LIBKRB5
+             select BR2_PACKAGE_POPT
+             select BR2_PACKAGE_LIBOPENSSL
+             select BR2_PACKAGE_POPT
+             select BR2_PACKAGE_OPENLDAP
+             help
+               Certmonger is a service which attempts to simplify
+               interaction with certifying authorities (CAs) on
+               networks which use public-key infrastructure (PKI).
+
diff --git a/package/certmonger/certmonger.hash b/package/certmonger/certmo=
nger.hash
new file mode 100644
index 0000000000..653ba1dcfc
--- /dev/null
+++ b/package/certmonger/certmonger.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  1e66094ef4130fc15c8acf5abfca097c2f8f40f57f699f80bb14e9941260d473  =
certmonger-0.79.20-git4.tar.gz
diff --git a/package/certmonger/certmonger.mk b/package/certmonger/certmong=
er.mk
new file mode 100644
index 0000000000..c6a9c179e4
--- /dev/null
+++ b/package/certmonger/certmonger.mk
@@ -0,0 +1,25 @@
+##########################################################################=
######
+#
+# CERTMONGER
+#
+##########################################################################=
######
+
+CERTMONGER_VERSION =3D 0.79.20
+CERTMONGER_SITE =3D https://pagure.io/certmonger.git
+CERTMONGER_LICENSE_FILES =3D LICENSE
+CERTMONGER_NAME =3D certmonger
+CERTMONGER_SITE_METHOD =3D git
+CERTMONGER_DEPENDENCIES =3D openssl dbus libtalloc libtevent libnss libcur=
l jansson libkrb5 openldap popt libxml2
+
+MY_CFLAGS =3D $(TARGET_CFLAGS) -lssl -ldbus-1 -ltalloc -ltevent -lnss -lcu=
rl -ljansson -lkrb5 -lldap -lpopt -lxml2 -lcom_err
+
+define CERTMONGER_RUN_AUTOGEN
+             cd $(@D) && PATH=3D$(BR_PATH) ./autogen.sh
+endef
+CERTMONGER_PRE_CONFIGURE_HOOKS +=3D CERTMONGER_RUN_AUTOGEN
+
+define CERTMONGER_BUILD_CMDS
+             $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CXX=3D"$(TARGET_CXX)" CFL=
AGS=3D"$(MY_CFLAGS)"
+endef
+
+$(eval $(autotools-package))
--
2.43.0

--_000_VI1PR06MB8926C0355B067317D6675B37AD432VI1PR06MB8926eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR-BE" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Added support for the certmonge=
r package (version 0.79.20).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Certmonger is used to monitor c=
ertificates and can refresh the certificate with the help of a CA.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In today&#8217;s age, cybersecu=
rity is a critical need for network connected devices.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Certmonger can help maintain al=
l the certificate stuff so the user itself has less to worry about.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Ayrton </span><a=
 href=3D"mailto:aleyssens@idtech.be"><span lang=3D"EN-US">aleyssens@idtech.=
be</span></a><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">package/Config.in&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 1 +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">package/certmonger/Config.in&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 19 +++++++++++++++++++<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">package/certmonger/certmonger.h=
ash |&nbsp; 2 ++<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">package/certmonger/certmonger.m=
k&nbsp;&nbsp; | 25 +++++++++++++++++++++++++<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">4 files changed, 47 insertions(=
+)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">create mode 100644 package/cert=
monger/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">create mode 100644 package/cert=
monger/certmonger.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">create mode 100644 package/cert=
monger/certmonger.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/package/Config.in =
b/package/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index d4cc03dcdb..73efaae622 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/package/Config.in<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/package/Config.in<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -2688,6 +2688,7 @@ endif<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/=
zabbix/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/=
zeek/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>source &quot;p=
ackage/znc/Config.in&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; source &quot;package/certmonger/Config.in&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;endmenu<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/package/certmonger/Config.in b/package/=
certmonger/Config.in<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000000..9d0e112b5a<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/package/certmonger/Config.in<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -0,0 +1,19 @@<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+config BR2_PACKAGE_CERTMONGER<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;Certmonger&quot;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBTALLOC
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBTEVENT<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_DBUS<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBNSS<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBXML2<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBCURL<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_JANSSON<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBKRB5<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_POPT<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_LIBOPENSSL<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_POPT<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_OPENLDAP<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Certmonger is a service w=
hich attempts to simplify<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; interaction with certifyi=
ng authorities (CAs) on
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; networks which use public=
-key infrastructure (PKI).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/package/certmonger=
/certmonger.hash b/package/certmonger/certmonger.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">new file mode 100644<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 0000000000..653ba1dcfc<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- /dev/null<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/package/certmonger/certmo=
nger.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -0,0 +1,2 @@<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+# Locally calculated<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+sha256&nbsp; 1e66094ef4130fc15=
c8acf5abfca097c2f8f40f57f699f80bb14e9941260d473&nbsp; certmonger-0.79.20-gi=
t4.tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/package/certmonger=
/certmonger.mk b/package/certmonger/certmonger.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">new file mode 100644<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 0000000000..c6a9c179e4<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- /dev/null<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/package/certmonger/certmo=
nger.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -0,0 +1,25 @@<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+##############################=
##################################################<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+# CERTMONGER<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+##############################=
##################################################<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_VERSION =3D 0.79.20=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_SITE =3D </span><a =
href=3D"https://pagure.io/certmonger.git"><span lang=3D"EN-US">https://pagu=
re.io/certmonger.git</span></a><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_LICENSE_FILES =3D L=
ICENSE<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_NAME =3D certmonger=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_SITE_METHOD =3D git=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_DEPENDENCIES =3D op=
enssl dbus libtalloc libtevent libnss libcurl jansson libkrb5 openldap popt=
 libxml2
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+MY_CFLAGS =3D $(TARGET_CFLAGS)=
 -lssl -ldbus-1 -ltalloc -ltevent -lnss -lcurl -ljansson -lkrb5 -lldap -lpo=
pt -lxml2 -lcom_err
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+define CERTMONGER_RUN_AUTOGEN<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd $(@D) &amp;&amp; PATH=3D$(BR_=
PATH) ./autogen.sh<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+endef<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+CERTMONGER_PRE_CONFIGURE_HOOKS=
 +=3D CERTMONGER_RUN_AUTOGEN<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+define CERTMONGER_BUILD_CMDS<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(TARGET_MAKE_ENV) $(MAKE) -C $(=
@D) CXX=3D&quot;$(TARGET_CXX)&quot; CFLAGS=3D&quot;$(MY_CFLAGS)&quot;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal">+endef<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">+$(eval $(autotools-package))<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.43.0<o:p></o:p></p>
</div>
</body>
</html>

--_000_VI1PR06MB8926C0355B067317D6675B37AD432VI1PR06MB8926eurp_--

--===============0285161024624051588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0285161024624051588==--
