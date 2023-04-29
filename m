Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EA4C77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61AA6005E;
	Sat, 29 Apr 2023 18:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61AA6005E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIYfPG2f_Eut; Sat, 29 Apr 2023 18:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0CE60FBE;
	Sat, 29 Apr 2023 18:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0CE60FBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A93C1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C706F4160B
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C706F4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AReP2atpi0tP for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CC3415F0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn20803.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::803])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18CC3415F0
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWqwhTb+DOaGeuC+pDBI6YU+0uGCblHXsWpu/NAmrpiAd/v8G30MW3Gi3BRNUM5MpN0fY4AO3QoNYsVvh6OC8TkGv0VGcXVI/Gl5dA6fyTP6l+UgGIGKhWnIbcELSS3QFxdelQ5iyno1YgTBhr5HNXFA0efuGLHqHt40UlpUygT5SIIVoj5pcp65vtSCGJ0nUikDbxR5RZC558uZ/crzZDFx27svmTvY65D64s1lOdFjigLCwL268QAv5b/JLNZzchdPQByMFAbZdtb/UAC/0cjzuygKYEJJ/op3dD7axpCHCmLZkrXSboaY2thH54aqcHxZwis9+nZZSOLOSTPzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az1k89i4Zcvgxrztkuk8havUGpNSoGG1aBBeo/UTVzI=;
 b=Z4iDE2+F/0phGVAE6vZ5aFsA+JbMPxyzSA3LH4N5/zxjdU/myiq5+3SMrSZkPFavy02gxT2AmqON1O7D/D+3w5gVTuBfa5joj8zvDw3oy/ifiAqZtsW23oYTdx+BsAxKpqgVxa+74GGx6nkGA/TruBBrfuwJG9PA8y/qB4yA9kHqGAoQbspG+rz0BG1oajbgKaiioDa0qEnTQKQ47LskfqZlZEsq2/pbhLiO+4b8Esqp0AVeGJETJPtZhLPlHKUGzYyslxjxftxInoi36bna9I+NYzqnRXqbU7G54T7szCSzSjBUfqAHVMfVjs/bv28+6rXBqyodhlO1USLRHyhXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CYYP221MB1094.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Sat, 29 Apr
 2023 18:12:54 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:12:54 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:12:03 -0400
Message-ID: <SN4P221MB0682AE13FB1ACA5A755024F1A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230429181205.3620-1-james.d.knight@live.com>
References: <20230429181205.3620-1-james.d.knight@live.com>
X-TMN: [B1cVSOk6Gu/LJ0TmjnEKhBL30ugPhRkr]
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429181205.3620-3-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CYYP221MB1094:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c348e6-588a-4aeb-19f5-08db48dd59e2
X-MS-Exchange-SLBlob-MailProps: AZnQBsB9XmreLwtPaBeZFZid+sA2W5GkSuvCFzfwnUnK0byAo57la48ioESvrgBrY79hE9fx/BvXg84XONqy3lC3segAtPA1OzU00AnTRfXRZy4yI4IteC0GSTFfAtlaAbHBpxyrUgkCCGGriWBwcKgSMrnO6K6+mFLiTmqOWxYTzhKL8iP9LbCigz8yvN8cdN/fLDwlTMEy3P7a6njo9Euf5PqrVwcgMLpv/1EuoTOCA30Sc+qhucFUcux185gmINkNjK8VV8fMMoh9owWrm9EPdNKBA4tnaGtBBRTQdK4eQAGSIAibBeejnQOrRV/httQevDpUGWr/K72UyBD3Z1fUfrQwnNoDOhbgodXI3xx9EzMDELzuquQbeNSpYzyRPYt6FREzVfsaUb8Kyfs0QWc4xoHUXw1siStKYGSm23Yv76IMjIfBFIuksikNXOfRtZzuVfmO2uDyZTuyg8TUnQylsS/Z7j5aYbUysXFQpjXkvUEnqNjdRYrTrW23Y/nnN4cJ10IgtUPldJ3dYErVSejVu/tN2ZnYBhO3r59YXMaazi5GB/dHn9UDV+YwJdl9FU7T5AEYmtN71nYXiVcd8yo93pQtAj2aN7AQcAjfWTKPg3pwdWQXgtja6HAEh4hvUjQvimWhxOqUqwKlQ8ktkcRs/wt4o0PVblVUfzG9b/QQTs1pdZJEK+eer+lrB5bZ6o3INconQX1TfsNBLCmQIxXDhkbDe3fmwMF75OZQhe7d5eqr9uG+VgDfqH6Lv9Ip2hlnV4c0CKE=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7J42XH75m+d/W3dbgp3I9SvYvgziuD8nHiqun7Oj1aPAanb8nWw5JQJOuQE+fje8GDquExRAk4xhroQQzV9086zEAXbetvC+mxTG2NXzOFWODDSswVn6SkDod0nX8XlV9bm/nN4YT6h7+uyGgo3rwMDB3hjgON91JiYGTpj54/H2JII7NC1CVt9TLOKA+VYK4xzqYs4XPAMPUPY03FUC+St+6EiX18dK53poek1dXGnMY3VR7BVTcOM6OsGSGDo/L+415EKL8KkyYeATIW5AnV2ddkfkkgshvAOQRzj7dWzA++zPPZZ6IUfChVpKaebvPOtqXOcF0q1oB0L4a9momuKm4p/YDApeT5qupYH7AqJkbpeegQs+8bnklgCaDkTg5QEVjslf5bT7KwGmlBUlSW0RZPy137jVTW9axkDpyCouMyMHRqv+TVedNsqvUz3M5GoL1fRGsAGuBb3YuC8O1DQWdlzUFCFl3HGDi2IBZXEBhLdjS0mjuA4jR//YlLff4JlsRDLEgMAnNvz4hjcahZgUqHoCBAnijUGBVIUsXXfP36vbEc/ypPkqrCBVXL92at32JyoeSM1i1Q9+bN6QSMWJj2aKAk30PeW7N6uExOu/QwgNw9fFAhG9JmOZSsjY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZTwRMCw1QqO5Oxti+qibHhh3MnzoJUzYDfB0EpsB1CvjL9gXKU2Eh9J6rUQC?=
 =?us-ascii?Q?He+TxXmOJiIBGbX9xRQhdqKciuysquwXqmAEmGsCC+k8MDp4cs79YrPRSsWR?=
 =?us-ascii?Q?LUsavD+JLXZBKZWgIqD1qGhpCx37VswglxnOYEBMeI3YEY3ZKoH7osxEPXvo?=
 =?us-ascii?Q?5XtMUJ8e1iib714K2J6OrYGrElfKpfFSzdXOBgJEl9QKLuHyeUcOvrVQ7R0f?=
 =?us-ascii?Q?yHWe68G4LxcF0SDSxnI1wlHHFxujmcgq+dto8v1nDI8Tw2MKVOaXsf9UxjkG?=
 =?us-ascii?Q?2hXtJHgRh82A/NBpSd9LWXQ3/yFi3rsuR2/8QISt31BpSsrxUXiOWfbnL+xs?=
 =?us-ascii?Q?gYK8849DgM5QUp/kVdbcsquXYFk23nFS4H2ZU0H4fr13xfXP0Zv/GL2uFzVS?=
 =?us-ascii?Q?CA1QrVxZGokwATlfxqwjDO2UtfWDMYd3Bg3arylDmmqhaCoUmwkrrFOJyx+v?=
 =?us-ascii?Q?sYC2oYv1XDNWjsJSaTw89EdG3xsBwAfg6M5ngR8123hlO9bbbUYIHagsnlCX?=
 =?us-ascii?Q?DVXRS+xRiEBr9HRx2hS77OEyvvypjGnYJWIRyyGgrR2n//YektinCDF83o+E?=
 =?us-ascii?Q?VNIghe/i5fpMZS2+tf24l6oOE9ACw2t1HeybweAGZUGXLQnUxSyxeytzGp9f?=
 =?us-ascii?Q?Nu3dQPa1M2vvgGrfGyc0aDMVia3Vy/n05oP7MLGcVVNpsRcimRN22RyL82Rg?=
 =?us-ascii?Q?gvnUoiwBW0+wD4SxZUpJxV+qr4n6INnzDk86nPMypONtI4zGxjvjDOYG4pRw?=
 =?us-ascii?Q?UzrDSrtI93Nx5f1pjF3T/CbuDTCH5x/kwMdqN6dLGDreqNfzUQ7sES81xV0r?=
 =?us-ascii?Q?v0dZT2ynOmZhfcFJ74Jha0VCZyQSK94mqfHlCH0TyzWZfbcF9JxZPmQ5uiXP?=
 =?us-ascii?Q?kGk6QNHQb1Zsh9UUbOYaMUaeMPY82RaWJ6DmCKvfw8MspzkABuVfsPfo1Qu2?=
 =?us-ascii?Q?q8XbK3jtE9vGfiNjJIKATDiV1Rz08L+D17QFkTESoblr7kIu/m5ySfjyNYoQ?=
 =?us-ascii?Q?SWz6dDMy7FcmBS/XauZbKARg6R/2MOa9GjSpD/IruW6/E286d+v2Mb6MI293?=
 =?us-ascii?Q?sde13kJ/v2nmr7Y1R9Vn0qvHVjlSSMuHWLstYuy2lY4W2lSKAYIwh30K0vgi?=
 =?us-ascii?Q?HpXoUeSqR6gpN1Ir2FttZdp8GE72bUTW8TvdzUdaty3pGyqPEsO57MQ+BJX+?=
 =?us-ascii?Q?UzBfN9vN7HYP5ewDr5kp47mbi+69Q//vEGUcoYz4SZBpMCNapYIM3p9pSns?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c348e6-588a-4aeb-19f5-08db48dd59e2
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:12:54.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYP221MB1094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az1k89i4Zcvgxrztkuk8havUGpNSoGG1aBBeo/UTVzI=;
 b=jx97aQJKQubUfy6HxDdUK2s/AGrUMccj9geOS5C028bA2YHwpj1zxH8WNqh3XaSlPYWaRsg0x8N9hY4CHMjQ8hvYXhDt7Hhdigtpm2n9rs7iIKAAFi3NM1skloL68q2/5dMf7tIj1rIrIb4S09m/t79VrlMBmf+DM9CHMAEMx7rtX6Ona1JW+YeeeqjaEtPbBydIDCGfXN5dO/mKamXn/QRON63tn8NbVXQtaDi30L7ZocrWkwF4GXiFpStlE4T3YiDB5pHNhxKbE6VMEljBGb86ek3HJZOdH8MczBQl9d8LOJXSecjaL7/7IGcSfwYdIL4vgQcBQ81tH8N3CMrV2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=jx97aQJK
Subject: [Buildroot] [PATCH 2/4] utils/check-package: support a file-state
 instance for library types
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following adds support to the checkpackage library to have a
file-specific state instance that can be changed across multiple
`check_line` calls. This allows a given library type to provide hints
across different lines (if needed).

This is in preparation for a future commit to provide support for
linter suppression that is configured in the files being processed.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/check-package                 |  8 ++++++++
 utils/checkpackagelib/base.py       |  2 +-
 utils/checkpackagelib/lib.py        | 10 +++++-----
 utils/checkpackagelib/lib_config.py | 10 +++++-----
 utils/checkpackagelib/lib_hash.py   |  6 +++---
 utils/checkpackagelib/lib_mk.py     | 22 +++++++++++-----------
 utils/checkpackagelib/lib_patch.py  |  6 +++---
 utils/checkpackagelib/lib_sysv.py   |  4 ++--
 utils/checkpackagelib/test_util.py  |  4 ++--
 9 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index db3a00b524bc2c2aa663d3621c94fb11a6db7cb3..890420fe6992d49ad7d50f311007689e35ab7681 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -220,6 +220,12 @@ def check_file_using_lib(fname):
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
+    # Check if there is a state tracker we can create for this library type,
+    # and then forward to each `check_line` invoked
+    fstate = None
+    if hasattr(lib, 'State') and inspect.isclass(lib.State):
+        fstate = lib.State()
+
     objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
 
     for name, cf in objects:
@@ -231,6 +237,8 @@ def check_file_using_lib(fname):
     lastline = ""
     with open(fname, "r", errors="surrogateescape") as f:
         for lineno, text in enumerate(f):
+            if fstate:
+                fstate.process(text)
             nlines += 1
             for name, cf in objects:
                 if cf.disable.search(lastline):
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index f666e4110b1abbc87ad6a00ebcf16c03a7be8885..ac87685eef13080f4b14c656cbae98d2f22aac12 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -11,7 +11,7 @@ class _CheckFunction(object):
     def before(self):
         pass
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         pass
 
     def after(self):
diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
index 457b3c317198bd5a798d164b6c629b621539f8cc..a121b5b1c072fce46c7da486db70c1fbd80461e2 100644
--- a/utils/checkpackagelib/lib.py
+++ b/utils/checkpackagelib/lib.py
@@ -7,7 +7,7 @@ class ConsecutiveEmptyLines(_CheckFunction):
     def before(self):
         self.lastline = "non empty"
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if text.strip() == "" == self.lastline.strip():
             return ["{}:{}: consecutive empty lines"
                     .format(self.filename, lineno)]
@@ -19,7 +19,7 @@ class EmptyLastLine(_CheckFunction):
         self.lastlineno = 0
         self.lastline = "non empty"
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         self.lastlineno = lineno
         self.lastline = text
 
@@ -34,7 +34,7 @@ class NewlineAtEof(_CheckFunction):
         self.lastlineno = 0
         self.lastline = "\n"
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         self.lastlineno = lineno
         self.lastline = text
 
@@ -46,7 +46,7 @@ class NewlineAtEof(_CheckFunction):
 
 
 class TrailingSpace(_CheckFunction):
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         line = text.rstrip("\r\n")
         if line != line.rstrip():
             return ["{}:{}: line contains trailing whitespace"
@@ -61,7 +61,7 @@ class Utf8Characters(_CheckFunction):
         except TypeError:
             return False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if not self.is_ascii(text):
             return ["{}:{}: line contains UTF-8 characters"
                     .format(self.filename, lineno),
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f26ca0d89807cf827c81c51fd7cfa694ad4514ad..6e65eed66b490c6d477de67ff7589e9f05da4e28 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -37,7 +37,7 @@ class AttributesOrder(_CheckFunction):
     def before(self):
         self.state = 0
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_or_comment(text) or _part_of_help_text(text):
             return
 
@@ -87,7 +87,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
         self.level = self.get_level()
         self.initialize_package_level_elements(text)
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         # We only want to force sorting for the top-level menus
         if self.filename not in ["fs/Config.in",
                                  "package/Config.in",
@@ -159,7 +159,7 @@ class HelpText(_CheckFunction):
     def before(self):
         self.help_text = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_or_comment(text):
             return
 
@@ -194,7 +194,7 @@ class Indent(_CheckFunction):
     def before(self):
         self.backslash = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_or_comment(text) or _part_of_help_text(text):
             self.backslash = False
             return
@@ -244,7 +244,7 @@ class RedefinedConfig(_CheckFunction):
         self.configs = {}
         self.conditional = []
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_or_comment(text) or _part_of_help_text(text):
             return
 
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 5968c809bfa2f925ecf900b9bd95637d0c81c7b0..c1ba281ee2067724cb40fab739ef357981ffaab4 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -18,7 +18,7 @@ def _empty_line_or_comment(text):
 
 
 class HashNumberOfFields(_CheckFunction):
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_line_or_comment(text):
             return
 
@@ -33,7 +33,7 @@ class HashType(_CheckFunction):
     len_of_hash = {"md5": 32, "sha1": 40, "sha224": 56, "sha256": 64,
                    "sha384": 96, "sha512": 128}
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_line_or_comment(text):
             return
 
@@ -55,7 +55,7 @@ class HashType(_CheckFunction):
 
 
 class HashSpaces(_CheckFunction):
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if _empty_line_or_comment(text):
             return
 
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d340882971f165bf1e2acd288c4b8552cb2dbc3b..4114e89ee04ea407d18a5e9f59d88d885b4d7008 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -24,7 +24,7 @@ end_conditional = ["endif"]
 class DoNotInstallToHostdirUsr(_CheckFunction):
     INSTALL_TO_HOSTDIR_USR = re.compile(r"^[^#].*\$\(HOST_DIR\)/usr")
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.INSTALL_TO_HOSTDIR_USR.match(text.rstrip()):
             return ["{}:{}: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/"
                     .format(self.filename, lineno),
@@ -34,7 +34,7 @@ class DoNotInstallToHostdirUsr(_CheckFunction):
 class Ifdef(_CheckFunction):
     IFDEF = re.compile(r"^\s*(else\s+|)(ifdef|ifndef)\s")
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         m = self.IFDEF.search(text)
         if m is None:
             return
@@ -62,7 +62,7 @@ class Indent(_CheckFunction):
         self.backslash = False
         self.makefile_target = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.START_DEFINE.search(text):
             self.define = True
             return
@@ -126,7 +126,7 @@ class OverriddenVariable(_CheckFunction):
         self.unconditionally_set = []
         self.conditionally_set = []
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.START_CONDITIONAL.search(text):
             self.conditional += 1
             return
@@ -178,7 +178,7 @@ class PackageHeader(_CheckFunction):
     def before(self):
         self.skip = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.skip or lineno > 6:
             return
 
@@ -214,7 +214,7 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
             r"^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
             .format(package_upper, package, package_upper))
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.FIND_SOURCE.search(text):
 
             if self.package in self.packages_that_may_contain_default_source:
@@ -229,7 +229,7 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
 class SpaceBeforeBackslash(_CheckFunction):
     TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t ?)\\$")
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH.match(text.rstrip()):
             return ["{}:{}: use only one space before backslash"
                     .format(self.filename, lineno),
@@ -242,7 +242,7 @@ class TrailingBackslash(_CheckFunction):
     def before(self):
         self.backslash = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         last_line_ends_in_backslash = self.backslash
 
         # calculate for next line
@@ -294,7 +294,7 @@ class TypoInPackageVariable(_CheckFunction):
             r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         m = self.VARIABLE.search(text)
         if m is None:
             return
@@ -333,7 +333,7 @@ class UselessFlag(_CheckFunction):
     def before(self):
         self.conditional = 0
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.START_CONDITIONAL.search(text):
             self.conditional += 1
             return
@@ -361,7 +361,7 @@ class UselessFlag(_CheckFunction):
 class VariableWithBraces(_CheckFunction):
     VARIABLE_WITH_BRACES = re.compile(r"^[^#].*[^$]\${\w+}")
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.VARIABLE_WITH_BRACES.match(text.rstrip()):
             return ["{}:{}: use $() to delimit variables, not ${{}}"
                     .format(self.filename, lineno),
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 1909d3acd063800345b9e040c05b74bb3a05b96c..985f925d2ca9201ca053d4fb192cd5c7c4dba486 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -29,7 +29,7 @@ class NumberedSubject(_CheckFunction):
         self.lineno = 0
         self.text = None
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if text.startswith("diff --git"):
             self.git_patch = True
             return
@@ -50,7 +50,7 @@ class Sob(_CheckFunction):
     def before(self):
         self.found = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.found:
             return
         if self.SOB_ENTRY.search(text):
@@ -68,7 +68,7 @@ class Upstream(_CheckFunction):
     def before(self):
         self.found = False
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.found:
             return
         if self.UPSTREAM_ENTRY.search(text):
diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
index dc4afd71b80577ba80c0ebb60a626e793fd94637..8df4f7d507bb8aca32228d63b05b02470d80427b 100644
--- a/utils/checkpackagelib/lib_sysv.py
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -13,7 +13,7 @@ from checkpackagelib.tool import Shellcheck            # noqa: F401
 class Indent(_CheckFunction):
     INDENTED_WITH_SPACES = re.compile(r"^[\t]* ")
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         if self.INDENTED_WITH_SPACES.search(text.rstrip()):
             return ["{}:{}: should be indented with tabs ({}#adding-packages-start-script)"
                     .format(self.filename, lineno, self.url_to_manual),
@@ -36,7 +36,7 @@ class Variables(_CheckFunction):
     def before(self):
         self.name = None
 
-    def check_line(self, lineno, text):
+    def check_line(self, state, lineno, text):
         name_found = self.DAEMON_VAR.search(text.rstrip())
         if name_found:
             if self.name:
diff --git a/utils/checkpackagelib/test_util.py b/utils/checkpackagelib/test_util.py
index 23f2995e2721ccb2c64266e8aeb095f308e308bb..84117b8dbfa6c003263ccd4fb095d27b8a3ee976 100644
--- a/utils/checkpackagelib/test_util.py
+++ b/utils/checkpackagelib/test_util.py
@@ -1,8 +1,8 @@
-def check_file(check_function, filename, string):
+def check_file(check_function, filename, string, state=None):
     obj = check_function(filename, 'url')
     result = []
     result.append(obj.before())
     for i, line in enumerate(string.splitlines(True)):
-        result.append(obj.check_line(i + 1, line))
+        result.append(obj.check_line(state, i + 1, line))
     result.append(obj.after())
     return [r for r in result if r is not None]
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
