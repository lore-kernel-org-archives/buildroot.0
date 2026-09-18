Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B4C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 09:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0138118A;
	Fri, 18 Sep 2026 09:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iHxdsOs-9th; Fri, 18 Sep 2026 09:11:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E05A381241
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789722713;
	b=FAcHUiZyDNcvQvdpiCwsEqx1s+QSw1/O14UXOCfLKEzNz5Jm5xnGuuPW2geB9onHgo8o
	 SwHpPhHvr3OX3cznKXsPK5FIpARptlsvg6uNF3YVhdLvsbf/wDWwy6AFtHTi7ejmRekoV
	 cmSJ1DzhOZie0hsbptIRgMt/VEwcGWCNSYy/YYzXdv25nqeHQh6g0tccsPjlqreuvncjA
	 n21x00WqWgL5fRADYt/bp3uRo2uWnMmWnmFWajsi7EgILE41RmEiVteEEXCDf4otjQWKA
	 R5oV/UoCL/uIoeMwylbuaybZyS4H2uUM9m/QvHVJ5MZmmEbymz9F6duyhWqzPZq2jjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789722713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0btSp9guN98QRuqBlJgqouPb8qv63udJbdGctbYB0xM=;
	b=USj2lKlcIGYBhNu++wlpPSmnSkhes5UEKaGOLCItKDRX8UFlZrjKPbvrFhVlu2t1tVrb
	 YOLiqXNugScpGCLPR/XSOQBif5rwnOxQio2ZzfxOECRhEhP2p/YYj1nPNghV0ZI75kknB
	 FtlDvnGkjfPGTs20GuhTZHDVKbTOwY9fO3JkwL7xwHhnxMneKgU9yCn5RYtAw4/tl5/Ih
	 LHlvSvL/umqZzp54i9LgqN/kQiqzx4JDUTz3AvtxuFCS/O7RD4NceUVmZGkmHT9rFkVCT
	 QfBoY0ClUEWnJcaiQpMCB+AT9Rpe1BbLVaTuqLO2MnpT9kfDYHe+FQvX2x/vyFirxzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789722713;
	bh=0btSp9guN98QRuqBlJgqouPb8qv63udJbdGctbYB0xM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i/wOnzEVStVaQXdukFdiQutKrEOzoM5dU0xQq0/eEyW+VWGQNdM6Y4/TNcA0Nwia7
	 bNyl2wBSQl5JJQZ5wIf8AIvKRKaOL2bgiuJYoExF07IpyMj8/PIhvWX+scJh77fA9J
	 uuhsansWuuBzbPfNyPL7v1modpRuCV4QDPHazxdyZ9/jRV1bH6kocDCv+YeMHAzLOU
	 QEO7fSN6JgwmNAPGxUBQoaqsG+7JFzFygRKjGj0TWqxGgC0Ib5WBn/fjw/8J+cEPzh
	 qxlstIyY7rRDLxHd7ly7Melh7M9RwAPVlz8m8jzcTG9S36UdwbHC/5vh3YWwdOhDZA
	 2o0JtuwWBwQ0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05A381241;
	Fri, 18 Sep 2026 09:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F4DA3B6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 754CA404DB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1qfDqe6mzZB for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 09:11:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CAA9C404CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789722708;
 b=p2+DL2MvfX//tvtXAkROPsPAy7YScEIvy9nk28Ab+06O76Xo/SXH9LcOW48qNOHDh8y+
 AgdJpti1ZYKIwaw0tOgECBJIEqCpbNR4w7yMl6e9Pc5Nw2kHO+jhMjpAtfIiA50SwaSJP
 pwc/VXK37pWBqUoqCQ4eBOW8IsUbROFI03BxlizIQOXyW6rARSYJ6l8fwNxBhzifT5PS4
 Xn8pZRoyMrxabun10dgXX+LvOys+gZqM62BbbWcNosYQzE12Gri1JHwjlm20JZD9RRryH
 pyI0eNwYOXYJHmbGHO36xdFRDAQVTnBoI5Mru/ZxYt2GYxz/chBv3RFzHtTHMfdNooQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789722708;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WVCp5irgfTxkQ4tpLe0wA5wwwWdNAV0IWVkbtl3tjTE=;
 b=pZ6SpQQLzvLLz7iIbTs2fvmlIIAhQrPPPdJD8hCKnD29C/kO4gzo2FO2v5LqHfD+Zqsg
 I30KhU3dD6RGzLV0eq3N/0kw8ZibpPnzrHhI/cS/OF5+yryFvPPFeQQju9TpaCMLeOpVK
 0eoC6JOHe0heDSJvWziJDqh2E321Pj/Im7w0I2tcyhFJaoxih83VdkuwTOcE32GQN7yYG
 6Iy7/eFakub6mmwGOHmA3HpgjS1gxec29slnuMx28EW82XpuJH1enhUBbIiocemQ3W2Gj
 zUBonyau9XNRlb3SunuffpZ+a81tB6fq9lHEBZUoIkL4o789A32LITx/0XBBva4fPiw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I7pz2+Tk; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::16"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::16; helo=mail-wr2-x16.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x16.google.com (mail-wr2-x16.google.com
 [IPv6:2a00:1450:4864:30::16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAA9C404CD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:47 +0000 (UTC)
Received: by mail-wr2-x16.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so234026f8f.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 02:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789722705; x=1790327505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WVCp5irgfTxkQ4tpLe0wA5wwwWdNAV0IWVkbtl3tjTE=;
 b=G86aTEvwXE7vdaMajpz0I5afk6va+Z3hiQfi5/iaz6WaJgo118TUKvad9vOe1KAK7q
 dYI3cAUnawy7mFnmZfIDqkyAQb098h4ZV7xSiJIKqTMA1ju61emSxz4ca7OMAVRBfsgx
 X51ulPSUNSeP5bb9s1acrz+Mjz1TA4qEePDYd9Ex5DyLq+fkq7gw+8z9MWfw0qA6RGe3
 GtaafMjSW/GI7AXWkpNsnDdl/x7dyXu4AVdXp4u3JMB5pbNApz71Dsno3LZPq/ZGRUd0
 6KkoSOKtEVdHnmJ6TQTmq1dKyupRlxL2p/ntJCYUe5ozDQ/Jpt0+AqLetxgt+212H/8+
 k/Jw==
X-Gm-Message-State: AFuF++kRZmglmet9RxpSbK7dr4bfqy97eEIXFYNDFlL3Q7RLKqipy4Nw
 YeiQ0cI77dGuo9A7l8cB68l4jpPClthnfeM5dr1LMMWIpj3GKDiZ0Mf6uUmcfJ9CKyyclFu0Xds
 vTfKm
X-Gm-Gg: AYBFou2kDpGu25gWg14EyimhN7tpTgo/4RyWHlNIx6DE4vbOJbK3W1bl0YZHrw3jcEW
 E9Z3YFWosINHo5K8nlFWSTo71BZ7aHcop/LkLNk7ascaQgm4mpDyHklSJMf1OntvpR2Z+FLj98U
 fW0XlQpsJaNoyn30nxfHqBOVbS3l7PbB3izEqzKB58Jff8+QTh7qw5feOzGr8XfASaDICczBlKQ
 q5zs65EtLmft0WNoedY6fJi4tJWxsLHtvpy8YJ5Y7OvSmwdi2IWX08hdm67iOdjvXKFXIrRiF8s
 DXCAM2s8HcGIPIGvd65U/hZc2h533/+hRGK2IT8yVNsHufQgcqWZputIQ8MXILC/KoT3SR498bO
 PTVRM6CdXVdZtWPluEpZE2ndhq1NLWGBLlD9YoH18gHJzbU+Di/QP9m95lEhAG3+1YCe3nr/iNB
 t3Jatzj0ClVDb3nGXLB41ZUPvk4fWzBhRA/lFVQQaCDm2YOhtVNwBwGHLL64C6T+ih
X-Received: by 2002:a05:6000:4903:b0:487:765:7550 with SMTP id
 ffacd0b85a97d-4871e20ced0mr4799943f8f.4.1789722705301; 
 Fri, 18 Sep 2026 02:11:45 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720078bfcsm2493345f8f.28.2026.09.18.02.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 02:11:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Fri, 18 Sep 2026 11:11:42 +0200
Message-ID: <20260918091142.62239-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918091142.62239-1-thomas.perale@mind.be>
References: <20260918091142.62239-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] utils/checkpackagelib: check IGNORE_CVES
 identifiers match patch trailers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ability to check with `make check-package` the 'IGNORE_CVES'
variable content reference an existing patches was added in commit [1].

This commit extend it to actually check that the entries that are
referenced in the 'IGNORE_CVES' variable are matching the trailers in
the referenced patch.

With this change the following `foo.mk` content:

```
FOO_IGNORE_CVES += CVE-2000-1234
```

Running `make check-package` will output an error if the content of the
patch is the following:

```
CVE: CVE-2001-1234
```

[1] b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/lib_mk.py      | 25 +++++++++++++++++++---
 utils/checkpackagelib/test_lib_mk.py | 32 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index c5b85bcda9..33988cab8b 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -120,12 +120,14 @@ class Indent(_CheckFunction):
 
 class MissingCVEPatch(_CheckFunction):
     PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
-    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
+    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=\s*(.*)$")
     CVE_TAG_IN_PATCH = "CVE: "
 
     def before(self):
         self.pending_patches = []
+        self.pending_cves = []
         self.package_dir = Path(self.filename).parent
+        self.line_continuation = False
 
     def check_patch_files(self):
         for patch_lineno, patch_name, patch_text in self.pending_patches:
@@ -146,6 +148,11 @@ class MissingCVEPatch(_CheckFunction):
                         .format(self.filename, patch_name),
                         patch_text]
 
+            if set(self.pending_cves) != set(trailers):
+                return ["{}: patch file '{}' 'CVE:' tag(s) '{}' does not match the ignored identifier(s) '{}'"
+                        .format(self.filename, patch_name, ", ".join(trailers), ", ".join(self.pending_cves)),
+                        patch_text]
+
     def check_line(self, lineno, text):
         m = self.PATCH_COMMENT.match(text.rstrip())
         if m:
@@ -157,9 +164,21 @@ class MissingCVEPatch(_CheckFunction):
         if text.lstrip().startswith("#"):
             return
 
-        if self.IGNORE_CVES.search(text):
-            return self.check_patch_files()
+        m = self.IGNORE_CVES.search(text)
+        if m or self.line_continuation:
+            value = (m.group(1) if m else text).rstrip()
+            self.line_continuation = value.endswith("\\")
+            if self.line_continuation:
+                value = value[:-1]
+            self.pending_cves += value.split()
+            if self.line_continuation:
+                return
+            result = self.check_patch_files()
+            self.pending_cves = []
+            self.pending_patches = []
+            return result
 
+        self.pending_cves = []
         self.pending_patches = []
 
 
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index ba9dbd6aea..7152b40e2b 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -244,6 +244,38 @@ MissingCVEPatch = [
      '# 0001-some-fix.patch\n'
      'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
      []),
+    ('CVE tag does not match ignored identifier',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2001-1234\n',
+     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
+       'does not match the ignored identifier(s) \'CVE-2001-1234\'',
+       '# 0001-some-fix.patch\n']]),
+    ('multiple ignored identifiers, patch matches one',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
+       'does not match the ignored identifier(s) \'CVE-2000-1234, CVE-2001-1234\'',
+       '# 0001-some-fix.patch\n']]),
+    ('multiple ignored identifiers, all referenced across patch',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     []),
+    ('multiple ignored identifiers, all referenced across multiple patches',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234',
+      '0002-other-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234'},
+     '# 0001-some-fix.patch\n'
+     '# 0002-other-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
+     []),
+    ('ignored identifiers split across continuation lines',
+     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += CVE-2000-1234 \\\n'
+     '\tCVE-2001-1234\n',
+     []),
     ]
 
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
