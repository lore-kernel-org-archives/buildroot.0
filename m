Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C02C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 12:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898F2414E2;
	Sat,  2 Sep 2023 12:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898F2414E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNEuHS4ZmUj9; Sat,  2 Sep 2023 12:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D9D41E6E;
	Sat,  2 Sep 2023 12:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D9D41E6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7804D1BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC7D607B5
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC7D607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3fO6Al_lzlh for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 12:48:24 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0765F605AF
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 12:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0765F605AF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZno+nOJMTLkggWAYC0kmKVRwEABCJKZHN97Z/MNPoDeldjKblaX7hI7RApP+ph3z+IXmDHG7KUA1y2HT3fVKzZAyMO4mSjUn4FEbeFXeeT/k/jxqov7skocwZfEzXO3g1lBBwTomA5nI8+SGlRl458PNVJ6M8eNI1ZJtq2s0Gzi7rhld+jKOjEB7FIhh3TQI/BE5qgI4YrSCGTSxPDpUk0mumclmm37tPrUtCewdAnPDr0TLk91krGBiSw503CzwFr8Mjex9NZ0g2WpqmJQMNrIZG9rgVUyBbsJbsyK5scMNqvHa8A/AFy5w4jbN7fnyFmA5bF99PqtlIfzPkjufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCv+thRgyP3L7BUdSot9jVLNDD50WfaVMZhHrF9j0p4=;
 b=iJlyOat6l45qKYbtWhtZfQF9yVI07Iv6VxWu2Zbt9R/FErh3d9vqtuWdb6YdMBN18KMXRmG+AQebuQj2idL3S1TYH8fqwBtwL+B2vOLc3SxO6Jqb1df0cBt5aImqxvWzl+1KlsD39NeOg/2CNjPw+cpqYMo+Hw7BKBLW0eOLm29bExowu3E4jgTfCE+w0wBkgq4Mqhg6hwbGMZ+sxHt5s8UxlRjC9J4Ylqt7q00oorc3EUNjsycBo9zdQV9YB6cVhyTXIQozijrT6OcmzPle5LoJ4DNdtMjf7ER+D2mGPvlrlgRcognzn+0b2HZOMNmlwceIuyDVMizV0LCyCUSmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:c2::14)
 by IA0P221MB1083.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:486::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Sat, 2 Sep
 2023 12:48:20 +0000
Received: from CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::b72f:9179:b514:1c0b]) by CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 ([fe80::b72f:9179:b514:1c0b%7]) with mapi id 15.20.6745.028; Sat, 2 Sep 2023
 12:48:20 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 08:47:49 -0400
Message-ID: <CYYP221MB114006AE3D1C77F421E44B43A0EBA@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [I2lpIvp2IdB6YW9hG35FGbVlXN+GxXHC]
X-ClientProxiedBy: YQBPR0101CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::31) To CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:c2::14)
X-Microsoft-Original-Message-ID: <20230902124749.740-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYP221MB1140:EE_|IA0P221MB1083:EE_
X-MS-Office365-Filtering-Correlation-Id: 01635ffe-1bf3-4e1d-68d4-08dbabb2e28a
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9XmqeC0Mn8nMMn+aB/h7ZO5li1GgkuPvBTlmGAEBEiX1Sgo1ghc2k72qQ2sw00eri3kv040JPNr5K3IkwkadwFPHah+afwBhM6v3Q4Cpe+VWwRAfi0myPK3hh1NkrI5+IWlLoDTqp0LGwjcu7algkArFiAE3+p9144u/imvOlC6VsKuX3v1kTPtLbACLyM0vmpJWBupu7I1lmlC9TZrJdfluT7j+NJTEc2SUa6ucppvHkgZjDXq2q0EWX7Jv1/NVXzKxFJKkmRXnP9rxh1BHT95b2LaygPnk/+YtbCqXrqB5SZSbsl0dvPhM7ccYJUePmSjArZRY4x7V4RGOdjzgZxBLfwGH2JZXL4dOYp18Ue4CN3Y+5TfbCK0AxruHWgaxuA5m8CC17EqxGww//nFdOIqXBhv2DA6CzifX/kc6iYPAPXTGdCujVKESn8IX3JdpRQu1AEkrOV79KAB2ejnkZpEIMhBOgtmTATqPCEmCtuUJMrz/azCFw7MLrX1DhUz5BIRyditDcWIQOe1JXp3Rvd28+1S0AADTRDYJ67OnziscsvKc7EFYcpNTRh1qH3umGJFfleK/h8+4Wpri+ow2fB+WFQIWffKua+k2PG9pHZHcES4eHBEXzWvoU4PwoU1vddbC16Zb+Aygyh8CWvPzGtVk3ybwCAKJHmqHIEc4Zv/aFcfXTKfqGEB9HpKOKjv6qSbH/q//tN2+ueGsLrIWXbes035jY3xq3IO/VZkRe7ZIYINkSk3VyofA45neshNVWXP0=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxOx48apND8RjoVL8Jyfgs6D8rjwmmoB2txzz3Y+Gizp1nLQuk0W18MALaiXpnOvHqf9Ph4eR1CD2LLSbH9LLtk4N060yxykmqaN8BBcKZGzbajGUlTkzavDAaJ1KMPJ1QvEMvycRDywv+gD0bOpHaaChegOeF92CfEYM5a9ckYhnt4gYtr75iWC0F+7ShHSVtQJSrp6LCGdXaE0nREbd/xAT/7kXk3cdt9+ZuULnmQV7becmahR7Wj0PL5Rq5c1OMlEyZkSR35P8inClc8ptdly6GmF9evl7c6b/fhfSYWb/EjOGbj4NFal2NbHxNJ1GmSGtbT1BWYKW3s+VnpJ68ePL92H656BGJZtIAvSP6soksfA8Dws2oiop5cL1zQt3882P7zENvXZFtBQX4qe+bAjmIvegAGQwPcT3lq6+j+oiDV/LdO/U3o+jfetQsog7hFX8SnBdFIyUMBPFA0EcTUdUyB7BL/ZYkhl4VO6MScjUp1/Sh6z0eBvU7EVs/pR239lKCJhgHNA+ZwohLFT/fa4jmWSRClxsDyK8H2oQjrw+48zy2eHEC8bk4gbtk3uaiY4AYHrac2Mvzv5U6ZofsWBfohX4O5USMAIgndLUeecLGP+caC7goBX/VJucFcL
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eu4NZmB0OPIlCRIEYCoy74aqDMF5PiEGcNiuBemUnd58uED8WXFFC8Q4NnAr?=
 =?us-ascii?Q?3KM53kgxXlZ8dwEPjm6OEnCr2sK4sMZRQW6eoROpycpZS/jFRe3LS9BxGBh5?=
 =?us-ascii?Q?LH/MTGGC3mJL5RBZHsX7NsQPmid/Eo6MQG71edKHfQOkpNWxIDOKC0FnNtUc?=
 =?us-ascii?Q?cOhrN6fynocGl9qaiCKc5awT9X4DUdVpIiMcqiYfOFhmMWf4VJvKbHAtnxVB?=
 =?us-ascii?Q?ZBEM9ucJZyeL7wchx+BKF7LAb1X0sJ/gyuxDINczjwTvHG5keTICIL8Ea1oI?=
 =?us-ascii?Q?Vlas/226sIPMbtuIHL8auaJLwgVZnewRSAXw3xwviHLQVmc/hiSX1le3ArdD?=
 =?us-ascii?Q?GkHQNKkb+JD4/GfIYCI8Z8+ACeM622WoUcqw5aTRdFhVfHIOCcdXH48TebGx?=
 =?us-ascii?Q?oRbHK4sZmwNA7IROm8yf+B9xLMvfQaPiDtcQp5YYc4OKdUnOSnsTfcsn4M/c?=
 =?us-ascii?Q?FBPoe3t3O+O2VBeG2d9HZJWGxXy48ZVfra3Xx+bTcp2Djm6aD9F+SIBvatPe?=
 =?us-ascii?Q?Ibe6T5hEMDRrbkMTcpaeEA4UbG4R3Pv0nM6zPM8q+X68VCBrCUQ5cYQYeeJZ?=
 =?us-ascii?Q?T/TSwl1ZW/ntDaQ9Ejmm6a7XOCS0uNbFk8PFS1f93WfxK6qQbx9HnvrotiK8?=
 =?us-ascii?Q?RKk1Bm58Cf1MvEpITqO+R+goydEdhT+bkdWKYEDgUTT17K0dXvNxlnknRLmH?=
 =?us-ascii?Q?DGhYNZok4ZzO7S1bMwGYYEYeSrvhQVgAjl5W6Iu5UgOqgUH4vfXjpNXQWruF?=
 =?us-ascii?Q?WHqzXTkjLmU/nNmhxpze7fvp9CWICWLmr5bc4vna23IFcn5wBZJIdiHhKMgf?=
 =?us-ascii?Q?gdg3w1ohjv3W8/IYWdTFI8hzY7Af7erw8+DdnjtHFMtyYD+745FcVezDEgEh?=
 =?us-ascii?Q?V0sys3OESrDk5vhz8vhSxccgaahkJwBOOnU3DGf6QVJ0QYytwzd+iq8Pfq0h?=
 =?us-ascii?Q?SwgYMDL1rq6xZtk/N6Vk7rYxm2/o8ro9SpP/R6leiXT3DmTWJ9KvffGj9BW2?=
 =?us-ascii?Q?qOYE1Ms856Lov01pnIqUhLgK/nbdeWOTbqvizVHvDx6xi6izpOSJtlxOKM/d?=
 =?us-ascii?Q?a7XU9VooJUiTEKoS+gJuceUyj2meTFuBbfK+uaeD/5SGXtm+39EduW+qOP8E?=
 =?us-ascii?Q?nRYUhewWt9iqNCvEm2XXeuR1Qg3NjNmPXRI0ivFkFxVFWlONCeCc/AynG5ts?=
 =?us-ascii?Q?RIBwOiaOJDKOsojIHtaqio8U5aMx7qVSAym2oZyvwlk9sV8hM5w650nzDt0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 01635ffe-1bf3-4e1d-68d4-08dbabb2e28a
X-MS-Exchange-CrossTenant-AuthSource: CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2023 12:48:20.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0P221MB1083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCv+thRgyP3L7BUdSot9jVLNDD50WfaVMZhHrF9j0p4=;
 b=hCv8+JwChPmbMnIwjIbI90mlE+FWs70kDbxhzFT41KuCfaq2fk1vjOQPqlKnUi3rgW9JSoio0qV+vIXSsxl03L2fLIGrZ8qHJjfZ8gs7Kl/irQ6p7UKun8qz0aVUnUXCbwkSFRPUkQTPpfpFteznPGFiPiM5RDC/fbno1bMn4AmCihjENtCts70vtwL78v2FUkqV5HnOapKCAfbK1MV13UoiBXtI3QNef6sbi29W/T8BEnzHaJ1++us0oI5IHyyLvzysq1zBRz4t7r9YFGPCr8v4dHBKb9T/OiU7FS/c7nc6aC2vsZomlWFZ8NqEPFZ44ZPggJJFH6uXiWdchIMWfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=hCv8+JwC
Subject: [Buildroot] [PATCH v2 1/1] utils/check-package: cleanup line reading
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
Cc: James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cleanup the implementation for reading lines by having files processed
in context managers and utilizing the iterable file object for line
reading (instead of needing to call `readlines()`).

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - This change drops the use of an `fstate` instance which should not
    have been added in this initial/first patch (of a four-patch
    series).  (mentioned by Thomas Petazzoni)
  - Only this first patch is being resubmitted as this first patch can
    be applied by itself and the remaining patches are in discussion.
---
 utils/check-package | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 3de3a72e0c..105902303e 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -233,16 +233,18 @@ def check_file_using_lib(fname):
         nwarnings += warn
 
     lastline = ""
-    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
-        nlines += 1
-        for name, cf in objects:
-            if cf.disable.search(lastline):
-                continue
-            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
-            if fail > 0:
-                failed.add(name)
-            nwarnings += warn
-        lastline = text
+    with open(fname, "r", errors="surrogateescape") as f:
+        for lineno, text in enumerate(f):
+            nlines += 1
+            for name, cf in objects:
+                if cf.disable.search(lastline):
+                    continue
+                line_sts = cf.check_line(lineno + 1, text)
+                warn, fail = print_warnings(line_sts, name in xfail)
+                if fail > 0:
+                    failed.add(name)
+                nwarnings += warn
+            lastline = text
 
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
