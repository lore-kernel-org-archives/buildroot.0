Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C99AC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 17:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D30F40B7F;
	Sat, 20 May 2023 17:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D30F40B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FO254dfh2lx9; Sat, 20 May 2023 17:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88AFC404C8;
	Sat, 20 May 2023 17:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88AFC404C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1661BF215
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 17:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 660A760C0B
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 17:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660A760C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGrIJGjtcGMc for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 17:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A979F60C01
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn20816.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::816])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A979F60C01
 for <buildroot@buildroot.org>; Sat, 20 May 2023 17:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeFWF91TN2hba2flXm8O+8IHMUWQE2zohOeQ1RRj4O2Y1NALSkEEPVP0jhAlGIwpPvogl520nUJLJ449jc7dIzLcJ/2RPV1MmUL6KHKDaJfAMi+NWFodrGGtzqEnS3OpdLMy7mTeqJQJdnrchO4a9D5hDv3lgx4U2fOdNN749/FJRJROc2ApoYAj4GN7XYAePJLOyoaRqAg0jtoxO5ztD1kG05oL/y3PmUVWkdHKc1BBAdvLBoWrv3V/aiV4yp0NjQ99Ih2PcjrOqUzyw/mbOw2z5fmTBKv7MXUpEe9B5fOgjmJybicpYKIBUAv35xll12YaPG3REMI4aS/T7csnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzE6be12EXt9IYKjastBxylzqb2gQFRzXf6mgDSCKU8=;
 b=hLlnxli7vVR7PfzECf6ltF0i6fcpb487HyMWjwCvSfLWQsjFibn2CoUWGZUIhROh79v3d+bpAhoPRwobXUkDP4eY++6xCLPyI+CqmtDfm1ECVFXpI1BK//FcOjGczJRqBBHaeK5hKdHkbhkv9W1z4q0iOuP5y2jz6ZGu1tDBhNWQxfb+X9ja/xYDvi1rKPH/ap0I6ekG3SckNGrE/6uFOAR4Xr7R2j4rounkFW1pCN0jHtrI0NpxFEEW2oQqtuaZHdVffYyyu7gTcZqs+DLwNLI94QrS+MzU7UHp/9siWThg0KuvGLUo9P/criYwB/5m2kWVInLpcmoduHWxTPSsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by IA0P221MB1155.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:485::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Sat, 20 May
 2023 17:59:14 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%3]) with mapi id 15.20.6411.025; Sat, 20 May 2023
 17:59:14 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 20 May 2023 13:58:44 -0400
Message-ID: <SN4P221MB068245BFD104BAC32E86F520A07D9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [EdAHtoFPSkQ67ZaI2rhSsTrkn2yG6ofC]
X-ClientProxiedBy: QB1P288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::23) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230520175845.5027-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|IA0P221MB1155:EE_
X-MS-Office365-Filtering-Correlation-Id: a9875427-0804-404b-674f-08db595bebbe
X-MS-Exchange-SLBlob-MailProps: 5R4zPSLKzf5w/xllF2fMrZ2ZrJWN8ll7rpmYh23VPnf5/BB3ZLIqH2d9kzBMpThIGWd+6nYKPhROwHovQYa9yu63KYsTSOAOZsy/G1OYeTMFvBHzBr5hKUDlmQ1xzsqQmXIQI4lY2zes1+T3QqHyzdbNoJdJEEwvgqRAUGJXXiV+Fw6MITtOksTCKb8akqhrQ2ITgiTjY9N4iM/452x4jfZSSAUzyxvUVxVAO9R4Ci3e7oZfjg87v5Q7Vd3uktzTQPH5xlYAyf/KOXEVJHVufe8S4UJS5KJDO4wHk/4pXUeXS1h1RbHyeV6g3jDU4k8MQHlMRNJDG7oHW3zIsSPW9CPP92y7T7SC4vrz8gFsXg2XfdEMxenh4WzGeAMJo00rTXH9IKgBz1LIK5ne7AKRqXS9m4LB1pMfPn72WhrkGqOv1X65uIcgsNJU/li/MlgRH6/yDvFqb0R3jfNjASaOC/p3zJ8gRDspbkFscvjqva2DWPo8lfpoPRH+u10sadE07hrB6kZmMyKDHgU8LHHRPshOLeZLZGKQ5T/pwIWuRkj12Q6zFN6JJ4WKCzRKeYuvzRr4DD5G7sbsm5kafpV/xdtmf3bw/60gXgCv2/eBnRv5qYA3VNaYmTDnZgL4a9P2RzFSnr8X3DnDMx9JAI3H7Yvo1i7akutX4hDa455whzk7qzv9CSBGl994FqkwmqfBYEVGWJqSsD3QX9upjB/30sB8WCQewzmfa/xk2RAC6KGtPXUMn76Zwyw2xRoiEpEPUl8CDF01muZ045j1wuZYHqPBxoWxyhXeDOnAGmzqv3Dew4P/4eyOwYTno953l+aZrXWY1W5QdcmbIpQsWXO9lR25fpOo4h1F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upwrUdpd+xK+LR0DTW+oEIikz9SJJLcZq6xi+6Xc3c6kC2OxMVcZKUyBiRQI373RvKFkw6jB2y4KIXj1zIdXnF9YhpXAlUz781YX1byp6rKp2GmCQqqvYeHSYWSiapkfClK02RHH7bJtjUYJJnsfV7MzMMlK7BDwkT6OMqisX5NHNx4BK2iznYEGIgnhziT33y/mqsP55u1cyklCx8UJqV6HDXIPhquuUm6JuSXp06V0UFAdgNMHcwa6+xvnx4xMrlirEcM4sNBS2pQvnTmWUj2mxCGQTNJpugFl0YlkXuREF611+KrpZIJi7Et+uTzsHJTQ2xa2ZNubicNPpnAeI9F3zKgrG2t1BcEu490DqAsNhJRk1mx8DhUX5mAjy32vwt20ufoAYQwNVHWTBgwtYN0u0cMYMIrx6XBfzboUahzlwBatC5c0vFjD3Yff6zUjuz8GRJBAgBlEBRMrkQUCRtu0dMFbTdq1Jwb7w+vitZd8hS6y/YM7n8H2pNgCWeY4KhZOuEFRakl3WEH4lN9i/B/BNzKeY+WEwUadfCHVD5VPCgzfNT5btMXzTsiJG3jSXPG8NJ6sKDuu725uSZ3/VTsGlwR4ik7Ek0dEtbZMBgE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NOr1rLhu05UrgWDEezMEg0U6rPBCd9sSeBZmj3tL8htumGoqO8l4ThcR7rMU?=
 =?us-ascii?Q?zn0g0GjLQXEceO7A7b5dgkTAEc/Xhr2oJURtSN7r1ydUwSn/fOrhd3lEQKJu?=
 =?us-ascii?Q?mngZRuEhv9q6YJKYQAla9EPy+PjJ3278ZGiTBhkwSRerhayhDDIZOGTFjTny?=
 =?us-ascii?Q?+38ilZ3LWYmDGFvgOVwi14Wc6BI5VtNxR9dzV2i5YMhBSm/qOwt5jFQlhUAd?=
 =?us-ascii?Q?OKQyH+Z8wfrzc87vb67j0JCY7Tx49ok26rlUBUHvSXhFp5w0rsACyZzk7+2G?=
 =?us-ascii?Q?TzOk5dSuEsNaccaaFnMK425Ur55872X9bkvaN6Q1FLvogxHSYLWW+Pm9RDEp?=
 =?us-ascii?Q?EqoFld+svFuZ3GqwBWQ6XvJsO/03xiQaeSItT7H/hW69THQLZ0yKAQd9Ukip?=
 =?us-ascii?Q?HpOI1zSph+siN/QjpI7NU+bCU1NkXW3+ng7AngEp8ygKadkZLaGGvheAYPdD?=
 =?us-ascii?Q?gLhV30VzObK+34LgBTwQ9qPj9obNsud/RGCkeS4jmHm5Dfs5SW6HcGbtdz2a?=
 =?us-ascii?Q?00F6/iB8Agw2cDXazu96kCzRb330buS3SUIhdIS+ek/24IMO41V7lmnNzot6?=
 =?us-ascii?Q?q7xjXUvgMQ3DaEO+AkdaC2wPqwzSvzwgp1tzF9LbeZPn167H0dsIYz30Zq0w?=
 =?us-ascii?Q?3RqHSc1hpDEuLL7fLvggBabWy4sF0d+LAs1cKnYmsjuVg7bGRbpYGpslxS8y?=
 =?us-ascii?Q?S8dmVfxHSP6dg1vx4gYxlcVN+cCEGZl/2iVh2f3zd8ur7MgUNAfNaELT6yOm?=
 =?us-ascii?Q?Oova+lxHKcqwkKL4kGWEVK9vEcr7aKV7+qc+2Mg530CWof+uSVFcG5DPqRVC?=
 =?us-ascii?Q?Mn3dx9D5C1dxHQLf0sWYJx7u56viLl1OdwVeSB10YtnOeiWJ0eqmTjRYhRYx?=
 =?us-ascii?Q?pmMLKzyJk30SLMmNlEOE5+9xpNGJLnm33ONgYxZP/fxDewNvzXJUE1WyFA0z?=
 =?us-ascii?Q?1mOrTgTqjz5tJsonMyxsrSOxWwnl3iPR5Nsq3vcBJRtNi0cglbGLVUZ++7bi?=
 =?us-ascii?Q?SEctIPuFP7aN03D1B1pNtFILaCe/KgsnQ6O2wLKn+2jETmg40ResbWFpettw?=
 =?us-ascii?Q?UhwoAXfC7EbrJEe1w6U6HTYUqaWhaSF1caOje7fdwywBcmS6xoyu2eDG9/nO?=
 =?us-ascii?Q?aykCkMI8dX2yE14vNfU7xYvV0Wk9L1RxOxn7RyQwiXO6xaoRrFHSuMdu9nzK?=
 =?us-ascii?Q?2MeZoqt7cxDHjBHZJqIujAY6d1bNJK8fUnf/5g=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a9875427-0804-404b-674f-08db595bebbe
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 17:59:14.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0P221MB1155
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzE6be12EXt9IYKjastBxylzqb2gQFRzXf6mgDSCKU8=;
 b=tj1Hni8flmb8AGFGnmrnAeiBYSjPRPI2gVRZs41W3t+81HHjYw+A03Ft/iM+O24gMFAnEZqOZgty4gsigprQ/erDVZRPfeSfqbh7hUVYS1yhiwFLJ+zCC3qD+5wyICzvqs8EuXqborv+lUygGmjC8Z+xL+Yo/KTnnARji1rXOmxW4GXj4l4faknuktloWeEijysWCOdfA/KYR1c53iM1jdZYWAbG3jfax7RUVwppQP6ZIeN7K+3gUhK4lRzeRVVsiPlHuE49nRfNJ4hExRu0DUAKDRw9xL5wE4PYSduUbb8Wf6x58GdpZcJwYqBlEU6eE8DGMMeJ6QBPZVrd9m6McA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=tj1Hni8f
Subject: [Buildroot] [PATCH] package/libpqxx: needs C++17
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libpqxx's v7.x series requires C++17 support. Adjust the configuration
selection to require a newer toolchain, as well as force a C++17
standard to ensure libpqxx's custom C++ standard check [1] passes.

Fixes:
 - http://autobuild.buildroot.net/results/a79cb93aec74acc8e32809530c09e26bebaf16e4/
 - http://autobuild.buildroot.net/results/ae1a02b5238b650cdc79edb298c398b078882cfc/

[1]: https://github.com/jtv/libpqxx/blob/7.7.5/configure.ac#L106-L124

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/libpqxx/Config.in  | 6 +++---
 package/libpqxx/libpqxx.mk | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index d06451d7928ec9adf21bbfc8535f0787899343d4..f5fe2b38079fb3c619710e387c4676d7744a2416 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 4.9, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 7, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index b280f5a52a15b7c60d3da16ad326dbedac123137..434cefd06950e1a467fa31d23f9155764e8e12e8 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,6 +11,8 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
-LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+LIBPQXX_CONF_ENV = \
+	ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
 
 $(eval $(autotools-package))
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
