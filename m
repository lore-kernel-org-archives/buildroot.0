Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81333C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AEEA83F23;
	Fri, 28 Jan 2022 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYo75F8CkIyw; Fri, 28 Jan 2022 11:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C1F84C34;
	Fri, 28 Jan 2022 11:13:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 449E61BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4031340258
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatec.at
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2B6GIGrg2YcQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5DE4401D1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZ99wkKeaKgMnYxJKK0d4rMWx3OdkydTTKU2KMPH08gMPHkxTNY+q74Q8Sh0hbkuBGdSp2MK0gK7YeWeMOVqyR4/V2BB8GWeUpVMi7OKeGAaoS/UmUnNK5BtYWTmu/F3T+C7WWWv+EbYQDXAH334TD0FFN2sdmDeA0ar5CUSYeprUsHCoRUVAVHw6nM6FK31Sq28AGgbUWBuAJ4r/falHY/j5amjFZxakfjdXEHHD4mOdCCPYT+D38v6E51nHifW3c36ESmppZhgNI7YEMZXH5VyH+YmTGrk1UkV1E2BHgeIKnJ5+EwBEMA/7/TK7guupOk0x/ULCMROGxUf9HvxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlpFAMXdxp70FP+mG3NmU/2dFoUJbA0D0sTQrEopUVg=;
 b=nKlWNeuL4N+CdhcJm7lO6ZujHc4IV12nr3acMJpIz7AUPfwb+0OpdAvIQO5P93AXyoFTfJZR9tOnVEWkuHapGwGysLsVwMP5C/cbdrBLpX+NnCR6Wv2ez0rZOfqwuvZXvPVEVD/i8dY4ew+ODhQSJuZv6sdc7KKUtm9duH6J9Jb0Xtdso2R+KaDmEposjG0syVxKCMc/jUXniWbFRvXmACXbuMbujhsMcT1/Y8GkMV0zIOYAfTmTyZohbuXid7QH9CxRVzTTIOYcAnNsNSR4vu9bKtVuBtrPgDLxAqCzxVN7opR3C6q5QaA+aIIb+X63cxEI2H5LfdzAZOcsnikacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlpFAMXdxp70FP+mG3NmU/2dFoUJbA0D0sTQrEopUVg=;
 b=3ZQjMbgcrj7ymoEnBYoAnljpwYBBMhBgg4KeuVJq39uqge0OMGDgyM/sa4hgb5znU3uzPMnEP5/ffjnrpUgiyoCZd0jmwEG8F+RvZZQSppVSlP6VXUQAmD/nuUFOvNziprJH1F8K9IZ2u4s+3i0BaSqVee9+OiK9x/UqZSjdJEo=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS1P190MB1750.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 11:12:58 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a829:e31:ff4a:2a14]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a829:e31:ff4a:2a14%5]) with mapi id 15.20.4909.017; Fri, 28 Jan 2022
 11:12:58 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/dbus-cxx: new package
Thread-Index: AQHYFDcn4A2OGhFWb0OVu5ivgw4IlQ==
Date: Fri, 28 Jan 2022 11:12:58 +0000
Message-ID: <VI1P190MB0493DF9BFD49D3072CFE03A19F229@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 213f1d20-09be-2c2e-c502-ded7df11316e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af4ccaba-6fc8-4b7a-6aa7-08d9e24f2406
x-ms-traffictypediagnostic: AS1P190MB1750:EE_
x-microsoft-antispam-prvs: <AS1P190MB1750924F2236D4A7663128D49F229@AS1P190MB1750.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKSccyMMI4xPBra/E2hyU8o6K8d33hM/bUPxzlVDzE7ju7J054SJvO5mOBpQy1XdYlSG7CIpZEwYYNXp3fglZJjLqpdtkUD9xGgrj1QxU7kFGhRKTpzwTGK0xaBlGfY6eFZRW6EgMsSrhWKHrG15KvvCuUcR3jfH58KWUi47c0Xf0iJzO1OheOKH8ZUHxxRyCr2Gkqjyr5ex5rPKBFg7g7+QkVvYvbBth0PTBxJNPGJwjRXTQqkDdNIpWtjCNXm1IrXRoOPSUOaiAYyLCu0G1XfRRjF6PD7ODSLrlyaqslB8/ofxC3MAAv2WZRXTdh61r1s74Omt8rTeG61uFtCt9zJkucL26m7U1ME4JkJi3Ob39zRu6O04Im6E8rJclmd6aJcNyT0hQMEWb9x+ajUU8cQqRVySKv5Ps62RcftKRH+XQlOR5kXOoLcJ6pCuUOxwJIasBitNP6ooP89FPjL1UBYvbV9erYXYAyOo2VTdZgZfsWZGUdjYEYjp7ZN5jlVeP2Uh/rfEypO2kxPFTLDGsEX3G8wLN1BjVhzHZ2X19OKjOAy9o2TV6MNDPGOsfAAvrubxxkII2wU5MH+hHTTSIuyBX9BMDkVIjw19Y0t9GGyITN4/SJzUQ7PsR08oRx2xdQmxW24XRAHFq44kUfmZu37ItOqIBCuoFbEx5Hcn8XUGUSn763OahWNZPE6PQOuJlmcTYwIf0IrMNzlcx4OPyn6eG7N2N8B6J2Zbe1UA2wb7lgYQa9QrQ8HQomoHJDXGndF5IcOphZPnY2EgWSxILOONh8pNLY74uXPp5NhYwwg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(33656002)(122000001)(2906002)(38100700002)(83380400001)(55016003)(186003)(9686003)(66946007)(76116006)(5660300002)(66556008)(8936002)(38070700005)(508600001)(71200400001)(66446008)(8676002)(66476007)(64756008)(966005)(316002)(86362001)(7696005)(52536014)(6916009)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h8M12ZwOVJaDJFatf2Q6ebKw6mbmaMzB4ktJ6zd4/FR+n42mgasXJ/gSPF?=
 =?iso-8859-1?Q?9JjH1NHIXbtyDEXtRFAla2Ffz+OYGD/ycfllai+F0TSA8aLDVLu2GnYakO?=
 =?iso-8859-1?Q?czBKfICJCxt5TM/KvwR+27U0bMYP0F2wapalk4QRpo/1hj6i0l7ucjDv1s?=
 =?iso-8859-1?Q?7x4sQ1lMxol3VuiFGQ4JLwfwV0VYSIYJnF+zjlC7HHA5c1c8zQWwiCiaxN?=
 =?iso-8859-1?Q?b9w5JSzjXwBqCEMJe+KOrseZVhvUCk9YCCglJbU31KQ7IeuuqXIV1jZkXm?=
 =?iso-8859-1?Q?2b9TwyG9QKAX6HXkLt7THkn5U+2g9dxpIrUKeChJ457xkoCNf5YOQ76WNO?=
 =?iso-8859-1?Q?KfoCpKnZ/IN9Ke8ZJ9wduMa2gJTDg9AXEmtsaA2/B9zDH2zjMttuCAkx+1?=
 =?iso-8859-1?Q?Cc7jd7xyBc/jqbPmfJ20UN/jjtcKvghxBQZBUiRjiUPfoGYxObQBzkUNLT?=
 =?iso-8859-1?Q?qFSm11dmZ8y3kqIJeIsNaLM3/2gPQKHdmtfY/VHR7ita2fthwYh6u2LLoN?=
 =?iso-8859-1?Q?pq4EygM4vn8WlLPqsDka2Pj+KcjpUNOY2J8A3BoJpSIG+8aWObXvD19spA?=
 =?iso-8859-1?Q?xgHndj+Yvv40Ka/UjVL6ki3Tqvas6he9hCSsl/RLZRm7nv424zeKMTXWsN?=
 =?iso-8859-1?Q?uvTvUXaCYSgMAE+qxU2q/AQHgnmoTCRWWcpybrnCo60Sds4gvGBIUG+zN6?=
 =?iso-8859-1?Q?YZ1TcukKkR8u22XjlNrx6cj2oFjvBE85eTjsbX8H5yadDg2+51QtKdKlFq?=
 =?iso-8859-1?Q?+swIm8RdC8VuUhNNKCRR5poGCmQ/wymJa1uwYPLFhbHoEYJbAPK2GEigfi?=
 =?iso-8859-1?Q?fcIaQ4WmxBFO3EFBxdGz16MZww82DA8kPxycixghxLfNjH9mdrmyLM8DRX?=
 =?iso-8859-1?Q?WcjuinSAUAYuqFYRgDb90iQeTPfwdt13F4WPU+0pD6otunImvSGWbemyff?=
 =?iso-8859-1?Q?y4ru+rawAoY8NgrpVSXTFOm3NncAQ3buVo0lKFuLOwMaXs+otImCPyLvtE?=
 =?iso-8859-1?Q?DTBTQ3iNOvN0xgrCSwuBq6HX88HIpKUmZuzpVESmpUBZn6dWKOmVy6a2By?=
 =?iso-8859-1?Q?hudmdlCbxNI6m1unezBCeE2xImoFVC86Wn+kbTK+ORTX1wQVcZukkk8jTi?=
 =?iso-8859-1?Q?PqMw1sW0kpRLUHUmx2k5IP0flFy7BxhQz3U8mf+pkgvffMwDT1G0UhRYJD?=
 =?iso-8859-1?Q?ZHwMIx+RGJuenym6usJ0G2mq0t1rgMXPCGMskhCLf02K1kaccPxoMl3cXM?=
 =?iso-8859-1?Q?G9hQPh8WfDEejADR9DZT4NxRlRqoCp9fHX3eN8iy4dd+apOmWWqfQplQhF?=
 =?iso-8859-1?Q?tPKtZAsPB4YjB8m0rdvBYG5wnUV8aUbUtQJiFOOlXgZaD79c3OMZubRulQ?=
 =?iso-8859-1?Q?yJK7jZpxzOasHHJwkAl9FIZa6RvReyR/gH47M30KxsiU2yUD0jF5oTlm1h?=
 =?iso-8859-1?Q?CEu8GLqEXvameyoqiQH/CICwQDFnkyIwVtbKufIFob177F+wH5V1y5Ps12?=
 =?iso-8859-1?Q?nSnP34873+IatNWTupXxhB8C34znWjjT7N4Q3IT9r2nueRHjqJwleeJitF?=
 =?iso-8859-1?Q?ueyuDy+HGseQBnBLH8YXH0xdZ9YWysGfPd1OCNo2UbKwoLpMIwED709xcv?=
 =?iso-8859-1?Q?4XBXpOwHHDWjjXE5nW4dADS120rjEqqz9x1y6sB7ZlVxmS2QraElD3ws3X?=
 =?iso-8859-1?Q?yjuQ2l+cX5Ldsri+wY11woWnY6igZ7N7+7/2kVh2wi/39W7PqHrXaahmhx?=
 =?iso-8859-1?Q?kmbw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ccaba-6fc8-4b7a-6aa7-08d9e24f2406
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 11:12:58.2923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYtPnELeUwluabcoWgdDRQNSJ8E28CNZOZRXRE4s2z11AQXs1+/SjY6h9e7CnITHhGZoAb1Bv+hntiYMgVUuqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P190MB1750
Subject: [Buildroot] [PATCH] package/dbus-cxx: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DBus-cxx provides an object-oriented interface to DBus

Signed-off-by: Lang Daniel <d.lang@abatec.at>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-gcc11-include-typeinfo.patch         | 29 ++++++
 .../0002-cmake-improve-include-paths.patch    | 91 +++++++++++++++++++
 package/dbus-cxx/0003-sasl-use-uid_t.patch    | 41 +++++++++
 package/dbus-cxx/Config.in                    | 40 ++++++++
 package/dbus-cxx/dbus-cxx.hash                |  5 +
 package/dbus-cxx/dbus-cxx.mk                  | 28 ++++++
 8 files changed, 236 insertions(+)
 create mode 100644 package/dbus-cxx/0001-gcc11-include-typeinfo.patch
 create mode 100644 package/dbus-cxx/0002-cmake-improve-include-paths.patch
 create mode 100644 package/dbus-cxx/0003-sasl-use-uid_t.patch
 create mode 100644 package/dbus-cxx/Config.in
 create mode 100644 package/dbus-cxx/dbus-cxx.hash
 create mode 100644 package/dbus-cxx/dbus-cxx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fe8de1916e..c319c53e00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -626,6 +626,7 @@ N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
+F:	package/dbus-cxx/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..4e3d261cc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ endmenu
 	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
+	source "package/dbus-cxx/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
diff --git a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
new file mode 100644
index 0000000000..b4b7d83de2
--- /dev/null
+++ b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
@@ -0,0 +1,29 @@
+From 0a4c5db225d8d213916655593471e303ba71e0ea Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <sashko@users.noreply.github.com>
+Date: Mon, 13 Dec 2021 03:42:44 +0100
+Subject: [PATCH] Include typeinfo for typeid() (#83)
+
+Otherwise fails with:
+    error: must '#include <typeinfo>' before using 'typeid'
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/83
+Upstream-Status: Accepted
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ dbus-cxx/demangle.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
+index b71bcb9..9a4e99b 100644
+--- a/dbus-cxx/demangle.h
++++ b/dbus-cxx/demangle.h
+@@ -21,6 +21,7 @@
+ #define DBUSCXX_DEMANGLE_H
+ 
+ #include <string>
++#include <typeinfo>
+ #include <dbus-cxx/dbus-cxx-config.h>
+ 
+ #if DBUS_CXX_HAS_CXXABI_H
+
diff --git a/package/dbus-cxx/0002-cmake-improve-include-paths.patch b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
new file mode 100644
index 0000000000..1f6a36a2c0
--- /dev/null
+++ b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
@@ -0,0 +1,91 @@
+From 5a0ebbf55515a928acf9926d3fcd789115e347d3 Mon Sep 17 00:00:00 2001
+From: Lang Daniel <d.lang@abatec.at>
+Date: Mon, 17 Jan 2022 13:57:55 +0100
+Subject: [PATCH] cmake: improve include paths
+
+Adding the dbus-cxx subfolders as an include path might override system
+headers (signal.h for gcc 10).
+By removing the subfolders, includes can happen via #include "..." or
+via #include <dbus-cxx/...>.
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/86
+Upstream-Status: Accepted
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ CMakeLists.txt                | 4 +---
+ dbus-cxx/matchrule.h          | 2 +-
+ dbus-cxx/sasl.h               | 2 +-
+ dbus-cxx/sendmsgtransport.cpp | 2 +-
+ dbus-cxx/simpletransport.cpp  | 2 +-
+ 5 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5b6d28c..e76cd61 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -207,9 +207,7 @@ set( DBUS_CXX_HEADERS
+ 
+ set( DBUS_CXX_INCLUDE_DIRECTORIES 
+     ${PROJECT_SOURCE_DIR} 
+-    ${PROJECT_SOURCE_DIR}/dbus-cxx
+-    ${PROJECT_BINARY_DIR}
+-    ${PROJECT_BINARY_DIR}/dbus-cxx )
++    ${PROJECT_BINARY_DIR} )
+ include_directories( ${DBUS_CXX_INCLUDE_DIRECTORIES} 
+     ${dbus_INCLUDE_DIRS} 
+     ${sigc_INCLUDE_DIRS} )
+diff --git a/dbus-cxx/matchrule.h b/dbus-cxx/matchrule.h
+index 69fdab7..18c9e81 100644
+--- a/dbus-cxx/matchrule.h
++++ b/dbus-cxx/matchrule.h
+@@ -20,7 +20,7 @@
+ #define DBUSCXX_MATCH_RULE_H
+ 
+ #include <memory>
+-#include "dbus-cxx-config.h"
++#include <dbus-cxx/dbus-cxx-config.h>
+ 
+ namespace DBus {
+ 
+diff --git a/dbus-cxx/sasl.h b/dbus-cxx/sasl.h
+index d7429a3..44edd6e 100644
+--- a/dbus-cxx/sasl.h
++++ b/dbus-cxx/sasl.h
+@@ -19,7 +19,7 @@
+ #ifndef DBUSCXX_SASL_H
+ #define DBUSCXX_SASL_H
+ 
+-#include <dbus-cxx-config.h>
++#include <dbus-cxx/dbus-cxx-config.h>
+ 
+ #include <memory>
+ #include <stdint.h>
+diff --git a/dbus-cxx/sendmsgtransport.cpp b/dbus-cxx/sendmsgtransport.cpp
+index ae053ff..a10ae66 100644
+--- a/dbus-cxx/sendmsgtransport.cpp
++++ b/dbus-cxx/sendmsgtransport.cpp
+@@ -21,8 +21,8 @@
+ #include "dbus-cxx-private.h"
+ #include "utility.h"
+ #include "validator.h"
++#include "message.h"
+ 
+-#include <message.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/dbus-cxx/simpletransport.cpp b/dbus-cxx/simpletransport.cpp
+index f291d9f..fed4364 100644
+--- a/dbus-cxx/simpletransport.cpp
++++ b/dbus-cxx/simpletransport.cpp
+@@ -18,7 +18,7 @@
+  ***************************************************************************/
+ #include "simpletransport.h"
+ 
+-#include <dbus-cxx-private.h>
++#include "dbus-cxx-private.h"
+ #include "demarshaling.h"
+ #include "message.h"
+ #include "utility.h"
+
diff --git a/package/dbus-cxx/0003-sasl-use-uid_t.patch b/package/dbus-cxx/0003-sasl-use-uid_t.patch
new file mode 100644
index 0000000000..e517068891
--- /dev/null
+++ b/package/dbus-cxx/0003-sasl-use-uid_t.patch
@@ -0,0 +1,41 @@
+From 9db9673c0c2407e18e215844adadbd4a397e6f78 Mon Sep 17 00:00:00 2001
+From: Lang Daniel <d.lang@abatec.at>
+Date: Fri, 28 Jan 2022 07:53:13 +0100
+Subject: [PATCH] use uid_t instead of __uid_t
+
+uclibc and glibc define getuid() as
+extern __uid_t getuid (void) __THROW;
+https://elixir.bootlin.com/glibc/glibc-2.34/source/posix/unistd.h#L698
+which is a typedef for unsigned int.
+
+musl uses uid_t as return type
+uid_t getuid(void);
+https://elixir.bootlin.com/musl/v1.2.2/source/include/unistd.h#L108
+which is a typedef to unsigned.
+
+glibc and uclibc include typedefs from __uid_t to uid_t,
+which means one should be able to use uid_t as a replacement
+for __uid_t and make compiling with all three c standard libraries
+possible.
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/87
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ dbus-cxx/sasl.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
+index e8a6060..7a76af6 100644
+--- a/dbus-cxx/sasl.cpp
++++ b/dbus-cxx/sasl.cpp
+@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
+     bool success = false;
+     bool negotiatedFD = false;
+     std::vector<uint8_t> serverGUID;
+-    __uid_t uid = getuid();
++    uid_t uid = getuid();
+     std::string line;
+     std::smatch regex_match;
+ 
+
diff --git a/package/dbus-cxx/Config.in b/package/dbus-cxx/Config.in
new file mode 100644
index 0000000000..49f0f2237e
--- /dev/null
+++ b/package/dbus-cxx/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_DBUS_CXX
+	bool "dbus-cxx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_DBUS # runtime dependency
+	select BR2_PACKAGE_LIBSIGC
+	help
+	  DBus-cxx is a C++ implementation for DBus. DBus is a
+	  Linux-specific RPC (remote procedure call) and
+	  IPC (inter-process communications) mechanism.
+	  DBus-cxx provides an object-oriented view of all programs
+	  on the DBus, and allows an object-oriented way of
+	  exporting methods onto the DBus.
+
+	  https://dbus-cxx.github.io/
+
+if BR2_PACKAGE_DBUS_CXX
+
+config BR2_PACKAGE_DBUS_CXX_QT
+	bool "Qt support"
+	depends on BR2_PACKAGE_QT5
+
+comment "Qt support needs Qt5"
+	depends on !BR2_PACKAGE_QT5
+
+config BR2_PACKAGE_DBUS_CXX_GLIB
+	bool "Glib support"
+	depends on BR2_PACKAGE_LIBGLIB2
+
+comment "Glib support needs libglib2"
+	depends on !BR2_PACKAGE_LIBGLIB2
+
+endif
+
+comment "dbus-cxx needs a toolchain w/ C++, threads, gcc >= 7 and dynamic library support"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
new file mode 100644
index 0000000000..907de1866f
--- /dev/null
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  05c4f4750261f09819564bb8ee93b5d7f56fd05bbcd755858860fa6697d09c2a  dbus-cxx-2.1.0.tar.gz
+sha256  e85e018c8ee7d4f439b097289bf4371f6fcfec24e89f3e77c422944501bc383d  COPYING
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
+sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
new file mode 100644
index 0000000000..e184ef48ef
--- /dev/null
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# dbus-cxx
+#
+################################################################################
+
+DBUS_CXX_VERSION = 2.1.0
+DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
+DBUS_CXX_LICENSE = Boost license (cmake-modules), Apache 2.0 (libcppgenerate), GPL-3.0
+DBUS_CXX_LICENSE_FILES = cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE COPYING
+DBUS_CXX_INSTALL_STAGING = YES
+DBUS_CXX_DEPENDENCIES = libsigc
+
+ifeq ($(BR2_PACKAGE_DBUS_CXX_QT),y)
+DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=ON
+DBUS_CXX_DEPENDENCIES += qt5base
+else
+DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS_CXX_GLIB),y)
+DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=ON
+DBUS_CXX_DEPENDENCIES += libglib2
+else
+DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
