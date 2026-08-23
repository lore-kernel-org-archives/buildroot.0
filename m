Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12554C5DF97
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C49C4055C;
	Sun, 23 Aug 2026 15:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Oaaub0klJo8; Sun, 23 Aug 2026 15:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787497989;
	bh=yhjKByP/n/iHMvOZoc3A8p/vLJ8cfzJ+rbIPnwy0KvY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUQgCMe+F4GY+i+xNVuUtIoR9MfQnuoeMWURkGmBDps3M0gxPnLjEt6sRq0TEHx6l
	 AFEIwBxIlapbsxY36D+Ot9/ljlfA+ah/+NeX+5+YscXkkcQ2LC4eMiDEc0tmVMpuq9
	 nFVTQQr1aznRAIJDOM7+N1eTXL1EJy9BGwcVKAVQI/dHfvVMRLKLQqNhi449Mmt5pR
	 kXBUzCqJhW27OteSBicdur2uTn+motNhjC0AOxjejxaDPGD74PzYdqmMcflo6gSGZm
	 U5oGEJyfsfupbTVKoTSyNssBr/6sGwTBqBdfTuiL7+GX3b+Yy3SfIEkpG9aUO9Ux5k
	 NzGB1trBqQG9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8829F4055E;
	Sun, 23 Aug 2026 15:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7D9441A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5FBA6064C
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEeYZoU91-Vf for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 15:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Y33Pf1Kh
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9FC56062D
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 15:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsYEQGIkBd4IJp2+12fiQ5NgM1ndkGcE+q/PtOnr1QGAMF70wGOncWNpVbObDGy0uzHV6HB6JWUUBfowj6rHymiXDQPYaEJINxMxv3w9wi8K4UNZirIqiSMvN+YNfvIXbfgSWWhkXzJnMkRDMEytpZ90US7/Vyr0YRNsf3OK4tREFbtUXFc4tPPgj98lWOuNlrxoQ0eKDMt52dBL1lMEzw9GP92OzQJSCumYHkZ4SZECsgIldOt3Zrg2TReEQQqIYILeuBCqQdNF/qcplqZaf2ACvrXc9QYKNFQdfOtTiOTTYzr4ar8EAh07bk6i+5e98Fv4lnOfOc0IzEElKkM+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3/bdJrNoMy0Ben1yS6rlJHgSLAN2+Sq+e7rJPGskwc=;
 b=gtHwyFXh0VZ8RuagY/Ma8buuIabifIeRHe+E1N0dGktLNiMPizGJ7zYK1sKBehJeikhpM8ycvO1gvHCWbX7VjCouLkRBW9qnHojH0sff3xoxIqAj8MU55Eq22SqJwvTAqF8HxI+OabvHAnGFMGXksFUU163b4N+7IBiofnhbU4SEg2B1eWaWMg2c/E/MR+oAW6C1dvDKsKcMyUckcFi8mbNhJzGfNC1+KasH52Jr9JEUFjvhq7ArNO+4k7n5mSrnDVl9/CzwXmQ8fyOK0qJ43dbOxMH/TE5cY+WjBSseYkjdH/vT+q7dNN19vzCVQH6Jzn2/dIvcX2m2PqvPgUr+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3/bdJrNoMy0Ben1yS6rlJHgSLAN2+Sq+e7rJPGskwc=;
 b=Y33Pf1Khw7c4P/4Ey17tQIafSxdadHucoHlvoL4KD47h0veUp3N0ZmKHBki0f4HUrTWiNbuwY3zIhetr1JCW5LGkGvvpCb+5AHu95D3FW0uw80VkeMEM7DPNndcoO0uxB467oxnbP7kPXsqYvp5glQInqdn12r/rIj2iaCZS2y12bHCBJCW3Ul4tfhhmUvE2n3iaRluyamWqYzAkP8RYgDUNczrpigroFbDH980jB7xKKsxw+1gj/aXVBeCoMspTYAzieJxcsNZIQt/nK5TWQgdG2568aoM1TbLJ7/UVVn1cZmbjSdNaqdSwBRHvUF9HVW2S1BPIsVJiOZSMMZ75Rw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY1P300MB960598.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:359::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 15:12:59 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%6]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 15:12:59 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 23 Aug 2026 23:12:33 +0800
Message-ID: <SY8P300MB0041E233371C6ACF046F15E5F8A12@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823151233.2319565-1-tfx2001@outlook.com>
References: <20260823151233.2319565-1-tfx2001@outlook.com>
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260823151233.2319565-2-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY1P300MB960598:EE_
X-MS-Office365-Filtering-Correlation-Id: e3069520-6609-498b-72ea-08df01290436
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|51005399006|15080799012|10092599007|12121999013|24021099003|23021999003|41001999006|25010399006|5072599009|40105399003|2607281247196008|440099028|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I0BaQzZ3bOav4IiSHblkOKutCOi/oUAWzj7tJA2tLikNdxbrCdWWEDuXLwhd?=
 =?us-ascii?Q?BrVr07pMte33/AsBDceQA8vY3uFvXhG+Ks1u3GESxE3q4uXQgZ7fT6YIkUla?=
 =?us-ascii?Q?msBfxUrJ/mdCXqXNEoivd+OJjHM9b8RRISCFHZhw4hy+9Gbl8zJchbK0Vo8C?=
 =?us-ascii?Q?usn4mYR8USNGgDXqoUQd1iwSwYFR62N0GPkvCrQBA/wcQgPa47EyJ3E1/otI?=
 =?us-ascii?Q?TtwINvCby8GPXGA8rSCIBBJq1xY0QBeDoZ6duLJXULTKOyiKUkZ5IyZNPq7I?=
 =?us-ascii?Q?o/lbKe8boAi4qJlQW4ZZG0OaPb2/cpw56fBI6CMy/whrVWNAUW2sLHhFF+oD?=
 =?us-ascii?Q?D9749M77CGUGxqdnUI2Z0Bb37MlSyMtfZS2XfjnBw4Bna5uNQoVjco/YWJqS?=
 =?us-ascii?Q?NdWvLnm9gB9sCTSsSFKfvpL34SjGHG5dzWQvZ2ouEyKEL7tTEdvDituNy9sU?=
 =?us-ascii?Q?xqRC6I8v9ibQ+B+jaE0ZZnKQ3NDpybRpS4pn4kPDp5HJt1k/88kYGTAb08+N?=
 =?us-ascii?Q?2eEiF4h8TM35UBQkNFTMZ+TkvWU7AZT1hIE1XMc7ZBnU6Mt5pxJDHq4oobC1?=
 =?us-ascii?Q?9Sh+Zfcza6gtOCrfIteeB2Y6+gPaScQWQdFE9mf9Pr6PLKx/Sh+HSxM9DOro?=
 =?us-ascii?Q?Vz8+aw3x147tjKhZ8mCXGfLCPhKlQMSDwfx8E3wlW7gm2PY2One4qTP8JogC?=
 =?us-ascii?Q?EJaV65BhBXDVH+tzZ8Au4iUQ/ZCrhHYsWTxtsUYEsAwPcn3MVo3Yr2eGuhZO?=
 =?us-ascii?Q?dtWUlqZ3/vklPpQHu8AigUdOi0AlXzW4nsnSyHrk+eBC6nhfLqzVnok4pD62?=
 =?us-ascii?Q?7ovtriBI4wTIEgZDiVXhkybRCzk+6BjY4I0IeM2LqTzTiWjtUDA2NH6v4Bhq?=
 =?us-ascii?Q?Ybb2K0VQbfh2JHty/6FzxXuk+3Pqt7cDx8LJgJylLu3kclTlebKO2lZLdZSf?=
 =?us-ascii?Q?XwPrz3uTsxWHT97QjtDkTfO4zWBnaC1zPGfGeylkoYgRlK8OEE8tW5Ntq8uf?=
 =?us-ascii?Q?ZHUaYBhtM8a+oDvZqZSp7s3oHQbYAWV0jXMxsM9So9Sw/zMkHY1c/QmMTTq8?=
 =?us-ascii?Q?zGpD5gT2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dm9K6TMnoiWrH7eQR8ryOGGVjRlNzEntgtyAJuVgctsilUP/368npwAB5ovu?=
 =?us-ascii?Q?GLFTmzrwR7MzkEq1VWBRwuq+W6e0RhApusHFMwexWeqpeVpq8Ciq5Kw5gYeh?=
 =?us-ascii?Q?T/VkVDIAhzSQ/ToYbrrlo5Kc0PzD75K7TWzn6rDtH4YxAaqqOo9A5haWYvxy?=
 =?us-ascii?Q?LYW0jjcze5eh9W6KtcY163ivRFEVNG5uEOfD0/bUVonBGzumh4WhKgLMA92b?=
 =?us-ascii?Q?2gpoOy/W2nneG47RcuAmw+y86rhIjwhtWeI+VyD6pVvRcllQpADoSf9XeboZ?=
 =?us-ascii?Q?IvSw9ReYRsBJBuDOd7yR5USrWhFgRsVj1yMyoLPvm8D/KvqYYwsFsAUD/RCR?=
 =?us-ascii?Q?1Mk9Jj8rAI2PUklfiTLrQ605HVGw6bViwAZqjwA9ELk2mbePNryLTx0Owh5S?=
 =?us-ascii?Q?hMIqlSEqIhMCVlE8YCWKuaXkOB70ypcezv0MtwFBWtML7PdFPGU69k2bw3wc?=
 =?us-ascii?Q?7q9k/eNJwauHNLt5OEUcxRL8zDEmMFx1H+NdvHpmitplEj+kcKeN3mLtcMbF?=
 =?us-ascii?Q?RYVrEZ25jT29NPU65/3J+3WS9LObjW373tjhHX4ykMRuAtBNHLE7fA9QaOc0?=
 =?us-ascii?Q?VeoA8CKxSoZdsXJMJkK9YqcHJvmcw1m4qAYmP2MrL7NQMdhnt8/6g9WmbNmF?=
 =?us-ascii?Q?OytY3sy4Yj6dl2DpNCqSRr7cQd0b7cZ7Uygc9HfcQxq+3s6OkCJNlMxP3pU6?=
 =?us-ascii?Q?MwxNxRUVtYMQU1I3OvHa7XCi5GWxOWO/kYA8AWwvAPMtZH3f8CM95A2qoSO1?=
 =?us-ascii?Q?UbijJWmge+JsdxPeyV7/4+Y26yzbtaeSWVLguSNmgUbvQn6ryR+t0DWNVPfS?=
 =?us-ascii?Q?KcNfDEeB7YWNXDe/bUcsCeQKTaGrApW+MR3cotw9P8NnYo2v4MnUJ6iMZEAw?=
 =?us-ascii?Q?ci47wdQKPy779CqmPwp52thY3PfjggLwHMgYsQ/kRoHWf11BKrsNRyHxfJrR?=
 =?us-ascii?Q?OEX5QsVgSgllVVFINzkpxxU2OZMiA1rpCmbwlezGbLcQy1buCG/xkdU+g/ub?=
 =?us-ascii?Q?l/cO7/WgGi3cqxz94+kduYhmYkUDW1XJ6vpm4051KpAY7O5kuDiQxGpj8yZl?=
 =?us-ascii?Q?GYx8IYF3NpIZRjP/5ELW5htw81YP8B6uXbtINv2GwKV1SwjdY8BCqsWZvJUg?=
 =?us-ascii?Q?67eqlaqIkbDg77tsgGMvV+uHTgZK2XaUdUhoAwP3TnH0Tx3ZwHPvgNCQ3IL2?=
 =?us-ascii?Q?s22ALLlqK0keRm++TzUHmJl0XJUNtLBr9e37DhV8mY1ojCipgj/8m45Mg/mI?=
 =?us-ascii?Q?Vov5e1DVJYtvA9KZOZMPOfwy1fZyKDFQ6ZvWCejro586pH463Py/gOiXDaxj?=
 =?us-ascii?Q?QTZHpTLed9cey66Biyd0DEk/+MCOjbzQkCmQFrmd5/OC6YBx8wtV4FoxO/h6?=
 =?us-ascii?Q?KkjLhvOkCcXFE/z9wXIIeqdPjVW7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3069520-6609-498b-72ea-08df01290436
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 15:12:58.9026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY1P300MB960598
Subject: [Buildroot] [RFC PATCH 1/1] support/testing: add FLAT stack size
 test
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

Add a new test case to verify that the $(PKG)_FLAT_STACKSIZE variable
works as expected.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 DEVELOPERS                                    |  3 +++
 .../br2-external/flat-stacksize/Config.in     |  1 +
 .../br2-external/flat-stacksize/external.desc |  1 +
 .../br2-external/flat-stacksize/external.mk   |  1 +
 .../package/flat-stacksize-test/Config.in     |  7 +++++
 .../package/flat-stacksize-test/Makefile      | 15 +++++++++++
 .../flat-stacksize-test.mk                    | 22 +++++++++++++++
 .../package/flat-stacksize-test/main.c        |  3 +++
 .../testing/tests/core/test_flat_stacksize.py | 27 +++++++++++++++++++
 9 files changed, 80 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/Config.in
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/external.desc
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/external.mk
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
 create mode 100644 support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
 create mode 100644 support/testing/tests/core/test_flat_stacksize.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f4e296abc2..1080fbebec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1123,6 +1123,9 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Fengwei Tan <tfx2001@outlook.com>
+F:	support/testing/tests/core/test_flat_stacksize.py
+
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
new file mode 100644
index 0000000000..cdb4e9f057
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_FLAT_STACKSIZE_PATH/package/flat-stacksize-test/Config.in"
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.desc b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
new file mode 100644
index 0000000000..f9c1a745e0
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.desc
@@ -0,0 +1 @@
+name: FLAT_STACKSIZE
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/external.mk b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
new file mode 100644
index 0000000000..82900bf036
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_FLAT_STACKSIZE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
new file mode 100644
index 0000000000..67cf9964f5
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FLAT_STACKSIZE_TEST
+	bool "flat-stacksize-test"
+	depends on BR2_BINFMT_FLAT && !BR2_USE_MMU
+	help
+	  Package for testing the $(PKG)_FLAT_STACKSIZE variable, which
+	  defines the stack size of an application built into the
+	  FLAT binary format.
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
new file mode 100644
index 0000000000..dc7681bf56
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/Makefile
@@ -0,0 +1,15 @@
+O ?= $(CURDIR)
+
+CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+TARGET := $(CANONICAL_O)/flat_stacksize_test
+
+all: $(TARGET)
+
+$(TARGET): main.c
+	$(CC) $(CFLAGS) -o $@ main.c
+
+clean:
+	rm -f $(TARGET)
+
+.PHONY: all clean
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
new file mode 100644
index 0000000000..64695ad2dc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/flat-stacksize-test.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# flat-stacksize-test
+#
+################################################################################
+
+# Define a stack size that is different from the default FLAT
+# stack size (4096 bytes).
+FLAT_STACKSIZE_TEST_FLAT_STACKSIZE = 8192
+
+define FLAT_STACKSIZE_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(FLAT_STACKSIZE_TEST_PKGDIR) O=$(@D) \
+		$(TARGET_CONFIGURE_OPTS)
+endef
+
+define FLAT_STACKSIZE_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/flat_stacksize_test \
+		$(TARGET_DIR)/usr/bin/flat_stacksize_test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
new file mode 100644
index 0000000000..9b6bdc2ec2
--- /dev/null
+++ b/support/testing/tests/core/br2-external/flat-stacksize/package/flat-stacksize-test/main.c
@@ -0,0 +1,3 @@
+int main(void) {
+    return 0;
+}
diff --git a/support/testing/tests/core/test_flat_stacksize.py b/support/testing/tests/core/test_flat_stacksize.py
new file mode 100644
index 0000000000..ab41fadbc8
--- /dev/null
+++ b/support/testing/tests/core/test_flat_stacksize.py
@@ -0,0 +1,27 @@
+import os
+
+import infra.basetest
+
+
+class TestFlatStackSize(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/core/br2-external/flat-stacksize")]
+    config = """
+        BR2_arm=y
+        BR2_cortex_m4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLAT_STACKSIZE_TEST=y
+        """
+
+    def test_run(self):
+        binary = os.path.join(
+            self.builddir, "target", "usr", "bin", "flat_stacksize_test"
+        )
+        self.assertTrue(os.path.exists(binary))
+
+        # Check the FLAT binary header really carries the stack size
+        # declared by the package (8192 = 0x2000).
+        out = infra.run_cmd_on_host(self.builddir, ["arm-linux-flthdr", binary])
+        self.assertIn("Stack Size:   0x2000\n", out)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
