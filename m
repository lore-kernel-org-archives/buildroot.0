Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8C2C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60C241061;
	Sat, 10 Dec 2022 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E60C241061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2hxM0Xbkwgs; Sat, 10 Dec 2022 21:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442FF410B5;
	Sat, 10 Dec 2022 21:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442FF410B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96CED1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71CFC60AE4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CFC60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcpAqaLfX_bD for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:24:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60671605E9
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60671605E9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:24:05 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id y2so1625414ily.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccbWNBGS1Wk9M439ZJ7ipz9rlIBNr9tT5fbPggSlwhU=;
 b=RmLiZu+FHKmr46rp0JpDZ5d0wjGPNE1ARBsHpmkvYv3BaNw0wQMhYzjSNQz1Kc6sAf
 79kAHjG2PIcN9s6oRws3b1Dg1npjpetqIrHrO0UISkD6epr0x1rTU3vn0c498fmX8cWL
 Av82+/W7689ZBDLW7I7NInkTDvP92HncBjYJKodH/P+9fvFDn12TiENYUk0zW7btArfE
 dJkOoB2hA1wWOxe6q0yrXT4NLcyXlnZB/URlOcxKEtNWBt6eKWJkOQ2obBsnz8M2dMNw
 iJVYuHreGYd7XlWDYyO2q+9ZTMq1ox11SxfFaFdlnB/QcMutmbZ01ERYyzUgJsPOOK6O
 sLPg==
X-Gm-Message-State: ANoB5pmlqjrVzQbgDi13TW5G5j68H3eVmKe7BqXAfBd1NSaueDjACvKX
 mzFc4Tfze1KzjcZQCUNQ1EcptOp4XvdqBikp
X-Google-Smtp-Source: AA0mqf6bG8tG63kncMouMNHS+BkkN02q1Yc/fZuYcTOa9Pg9j282plSJiqRg7sq6pPcKi4YV9Y7bcg==
X-Received: by 2002:a92:d08a:0:b0:303:5d88:ec3c with SMTP id
 h10-20020a92d08a000000b003035d88ec3cmr8490620ilh.3.1670707444252; 
 Sat, 10 Dec 2022 13:24:04 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b59-20020a0295c1000000b00389d74d7e24sm1705659jai.146.2022.12.10.13.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:24:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:24:02 -0700
Message-Id: <20221210212402.3721087-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ccbWNBGS1Wk9M439ZJ7ipz9rlIBNr9tT5fbPggSlwhU=;
 b=exdR9sGSsBUTqCDcwf+ajdFOg42di05sV/O9oTT4cpUR7fGuIQkaUM/udMEy0l2C/o
 Yt2GpgXjnrUgPN+fOBsKI1/SuvI3Y+mNKafOzJ5+K/uNtioqd/iLuut7+jaRaIfBexxM
 f43pJw2mHzou3e0HXSCKArGNhOFYRFfqXzSzJ4wGYQS3AncrjGFrZeui36gpeCb5/34K
 +jZI3XmLg7rSduRvjZzHif+qakSA46OHTSiBuY0VE8qAasnJizpFjsgucv22e48om9Oz
 0zHNTxhkcSujiBh5/G5VPEUSp9BHTquwdUoD3XGYBrjqPWE79JTUa1n/aKH6520vVRGR
 ZdLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=exdR9sGS
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.11.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...x-quadratic-time-idna-decoding.-GH-9.patch | 86 -------------------
 package/python3/python3.hash                  |  2 +-
 package/python3/python3.mk                    |  2 +-
 3 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch

diff --git a/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch b/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
deleted file mode 100644
index d281e7261d..0000000000
--- a/package/python3/0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 9bb8e18ca46fe66fa6802602f8a7228a24dd785f Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 7 Nov 2022 19:23:16 -0800
-Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
- (GH-99222)
-
-There was an unnecessary quadratic loop in idna decoding. This restores
-the behavior to linear.
-
-(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
-
-(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
-
-Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-[Peter: drop NEWS.d/*]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/encodings/idna.py                         | 32 +++++++++----------
- Lib/test/test_codecs.py                       |  6 ++++
- 2 files changed, 23 insertions(+), 17 deletions(-)
-
-diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
-index ea4058512f..bf98f51336 100644
---- a/Lib/encodings/idna.py
-+++ b/Lib/encodings/idna.py
-@@ -39,23 +39,21 @@ def nameprep(label):
- 
-     # Check bidi
-     RandAL = [stringprep.in_table_d1(x) for x in label]
--    for c in RandAL:
--        if c:
--            # There is a RandAL char in the string. Must perform further
--            # tests:
--            # 1) The characters in section 5.8 MUST be prohibited.
--            # This is table C.8, which was already checked
--            # 2) If a string contains any RandALCat character, the string
--            # MUST NOT contain any LCat character.
--            if any(stringprep.in_table_d2(x) for x in label):
--                raise UnicodeError("Violation of BIDI requirement 2")
--
--            # 3) If a string contains any RandALCat character, a
--            # RandALCat character MUST be the first character of the
--            # string, and a RandALCat character MUST be the last
--            # character of the string.
--            if not RandAL[0] or not RandAL[-1]:
--                raise UnicodeError("Violation of BIDI requirement 3")
-+    if any(RandAL):
-+        # There is a RandAL char in the string. Must perform further
-+        # tests:
-+        # 1) The characters in section 5.8 MUST be prohibited.
-+        # This is table C.8, which was already checked
-+        # 2) If a string contains any RandALCat character, the string
-+        # MUST NOT contain any LCat character.
-+        if any(stringprep.in_table_d2(x) for x in label):
-+            raise UnicodeError("Violation of BIDI requirement 2")
-+        # 3) If a string contains any RandALCat character, a
-+        # RandALCat character MUST be the first character of the
-+        # string, and a RandALCat character MUST be the last
-+        # character of the string.
-+        if not RandAL[0] or not RandAL[-1]:
-+            raise UnicodeError("Violation of BIDI requirement 3")
- 
-     return label
- 
-diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
-index 8edd5ac063..2407567261 100644
---- a/Lib/test/test_codecs.py
-+++ b/Lib/test/test_codecs.py
-@@ -1535,6 +1535,12 @@ def test_builtin_encode(self):
-         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
-         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
- 
-+    def test_builtin_decode_length_limit(self):
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*1100).decode("idna")
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*70).decode("idna")
-+
-     def test_stream(self):
-         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
-         r.read(3)
--- 
-2.30.2
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c4ee79305d..db78544bd0 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3  Python-3.11.0.tar.xz
+sha256  85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f  Python-3.11.1.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 123bc8ef88..219d135b3f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
