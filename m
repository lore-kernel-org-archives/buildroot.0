Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE67BC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 09:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C648123F;
	Fri, 18 Sep 2026 09:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRe7YqwLgoJ5; Fri, 18 Sep 2026 09:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9DDD58118A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789722711;
	b=XYC2EtmwnZKjlFiW0eRevMP5Ou/60e9aWhkgELjy0yqcME07zqjgn2jc8UoOYXtOv+jU
	 FpK85crnNlklh+QAQGMtquVGqUS8Jiecl1Mq6cEmNaO93h2cKs8XDMKINP/6jiWGjAsMH
	 jLzjDllklhyYTKWATzdi2+8tANQb/DVsUB/ne/WkIC9+obeUD4SBo9xh7bHD6TIdhG5k6
	 MkqWTQw35jfxTZTZ1PoYk5XbHvoDuX36YUeXTcA11mdsymS0kjKT7eyX6me8ex53Is2+m
	 ozgcwl0fagLepkt2KGKVfJDYkXaC6WC6dSoUJNcMm17KCz8HSoifLVqfqEWs6951dSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789722711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SqJMBmmnVSdrBT3h7PSlgImtSSSvtDZcg3DYyUgcSTQ=;
	b=Q9pCvd2Nq20nI0LNpCU1zoSeb8el0YzUnKxyjXg4FYftRNqLmJT2Y4t+v1hclwYjaOCW
	 XRaK1Gk/cvPAp5u64dJ5ihrk3B5bCsPpGfhiA+n0BLeiX4Ez7LELekYt6Q5l1nDkrbOtM
	 4ILHv9pXSAG4fi0gTfMCG37o0JLFLKKZmGXtNpaKYih7srX3P2CR8BNbNBLRJlhv4dRgA
	 jGThuI/EINK5f/P3pgaqG1Ay6DAgZHASu3HS8UUrFWeFfeqU5mWudaqb56FeMcxmUd1t8
	 PvhE2tURImfFx9ahmoZL9a62XeqEMspQ1uqrcneRA4P+AdOeDFcZJnI6+zSihH8kN9A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789722711;
	bh=SqJMBmmnVSdrBT3h7PSlgImtSSSvtDZcg3DYyUgcSTQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MUPBL1cBdndfn04Bogs8+7Jv3jwgOMwLc03mAL4lL6MQ9pswrZfsMMrBs9Tz5S6Uz
	 9WmV5gOHyYjKRXhQkBLNkR+0OrfXpPtkHwaYgk2E7Q4hXygupJqL0TKWtJQKWbC8+w
	 Meaj4fUmSoE6utOaby2VcQwym4nuZtsQtem1YzqQWs59sH1bnFCPKn2OWgURBxzBGn
	 gbrVj2kyQQxuBeUFFONmKpnKbywjXxR0/oKyglHaW7RkIceNagwqe8nhI5uO/hl2ud
	 tECshkLf1mn2ge6gTdihJsuYsyMiCsNstzzHc3kK5i4WimzxRZeI8vUIic6jO+xC2a
	 3DPlAz21zaCOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDD58118A;
	Fri, 18 Sep 2026 09:11:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE4B422
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF3160BE1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GEBa8MNQ2DV for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 09:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 41D7360BC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789722707;
 b=l+aj7RkEWLX1bztivU1Ef6k6qQTfmI65/7XvviohUpRdWBXa+AxDEzx+SzcK1L2Z2WVg
 ndZAejh3fyW9HPpM6lS7e9d2+1s7q5AIrblWBVVWzAy/c2KjEtUNy9bcHP3uvgn+xG+9/
 a/fRgo7ci25TYdAf70YGzgS9LQHJdMR9OiGUBJ6cDwV+SUWAACZalB+/hN98md+VVG9F1
 GkkkS5Zk8p6+TpV0yGDNBEipbqsysfvEiHkfP5jDlr7yMDxQfnPD7DtIjAJTTUvD4Y27w
 O0IHMyONs3mSziqUB4jLnFG/AO3oOcLjdmU+AmOIPuFmzMV+5nVwVN8h9QoUefJnpxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789722707;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=q/R/CwUr/2i66AaalM1xU0QPI5VGuC0bItqfXjWwLYg=;
 b=G7WpWNGFe+jy8JbXn0DfgHzKP755JfzbvY3ktru6zdghtNZollwEwOVLRAbIFdbokHDm
 V71b3jiMGl/FvorHXYEwKz1SokYSfjki6wrhzeZKWaukpBThH6AS4YvuJrJ3xeaQnS+nO
 utBbdkuM7rFmkZlkNBQD8Jiqd/Y0A3Az8UPtdRULRBFIaQaFSOK86bGWCs4L8XTFRbT4l
 5snCkh8LOiVwis3OPbB8EjsYO2iOlk6yJPYhLpH/mXZfxnbRpuze4W8A4+nxT8Yn29ZKZ
 n4PVl2guvGGgN/py6JqvS1rYEM8lyz6dAe4Ejd7Lz67EDt8Z5fejcXYZeINDdB+L3RQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BQCznUvJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41D7360BC4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:46 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so234012f8f.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 02:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789722705; x=1790327505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q/R/CwUr/2i66AaalM1xU0QPI5VGuC0bItqfXjWwLYg=;
 b=zU5t8LliO53/MzM3MlceC8w2nxOvD2tiJoW3Ep2+c2SLTt+671eeC5IOdEs1ouazgC
 j5rvqByLilblG6JQNxwHg4xZTBkLHBAp6NFaFHQo0oWTCTBO1WS71fQp7AWGhlPWpMPw
 1Fq88JXHlgEy1+hRz7fa8iXRRoxTDZeVJcDCN9aH+eKzd8yAMmZbFsk/yNpcCPtDaZLy
 zunIRnZX+8sLz3cG7f0FQHcMkDSFDxLblSGDxv1nkpYf7kPTQ20fbZ0+7Sy+YfIBLndL
 cK/RaP3foJFyLLOx080Wv857Hg5Tm2WZWwHaunpnCt9CffVd9Y+qya+siFyfMIpe7q0F
 QzFQ==
X-Gm-Message-State: AFuF++k8IZpHrWtqKeUGmAWhtanVYTnJXTtZI+gkr/AKO7IpAvec228e
 5BfrF5toI8lQX/Ww6GmbbjlAMI2+IzC7G7oEn9880/G7l53nQpbYTtW8Nkx0ffLweBHray0LQLV
 8dVRU
X-Gm-Gg: AYBFou1C3FZ6YtrrDriQUSmBaG7y6RrDgOL82sAS3PyewgOxVoouill7+J/SMfEm8KD
 R6cb0OWnyF50F8bpqG3XQw6y/VYy9yopYD7c984Qh44Yvm9x4Tl0O8tOcowKBnrxFwk3isCR2Gk
 WgcngQEmYLrcVBM2eZc5BHaq8JZVTMFS8nL6fnUP2obFaiXwy1Fw5guFlAT9UGOk1p6VT3SQjce
 EeWY0oxsZSUJss9j95pwy5HlZlldSQkghx0NWJAGY+Sj52BHcFxdwoG/kDQpPrCzVFllSlhVUcy
 VUnet72/tPwCa+xBa3Bu45BO9BltS9zyLcRg59P8kEmV1BCxNJWTvawkf69gq8Q6LGkOzbQe6wK
 WNR4TZ8yxcud9WY63XbZ/uzFe1h2ABsqcH24yG/xUfkAbfwYGmnh0MwZFZ47kf98VDRYrAkCuSa
 Aro2EEoENUJm/OnpDtMKLYxAmjRZp50HRLeSdNFpGgft8zvgT5A2K7KUDzx0yhaFNt7UEjjLojt
 14=
X-Received: by 2002:adf:e001:0:20b0:487:21a4:f617 with SMTP id
 ffacd0b85a97d-48721a4f785mr1053009f8f.19.1789722704593; 
 Fri, 18 Sep 2026 02:11:44 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720078bfcsm2493345f8f.28.2026.09.18.02.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 02:11:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Fri, 18 Sep 2026 11:11:41 +0200
Message-ID: <20260918091142.62239-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918091142.62239-1-thomas.perale@mind.be>
References: <20260918091142.62239-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] utils/checkpackagelib: support other
 identifiers than CVE
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

Currently the MissingCVEPatch check will complain if another
identifiers than a CVE-YYYY-XXXX is passed after the 'CVE: '
trailer in the patch header introduced in [1].

If a package 'foo' defines the following:

FOO_IGNORE_CVES += GHSA-abcd-1234-efgh

And correctly references it in a patch header:

CVE: GHSA-abcd-1234-efgh

check-package will report the following:

package/foo/foo.mk: patch file '0001-some-patch.patch' is missing 'CVE:' tag

While we could argue that GHSA identifier should not be present in the
'IGNORE_CVES' variable, it's still valuable for users to have a way to
correctly ignore and link a patch for their vulnerability report.

From our point of view it allows us to track GHSA vulnerabilities that
could later be assigned a CVE so we can update the IGNORE_CVES variable.

This commit relaxes the constraint on the 'CVE' trailer to just check
for the presence of the trailer in some patch.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/lib_mk.py      | 9 +++++++--
 utils/checkpackagelib/test_lib_mk.py | 5 +++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 065733d464..c5b85bcda9 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -121,7 +121,7 @@ class Indent(_CheckFunction):
 class MissingCVEPatch(_CheckFunction):
     PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
     IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
-    CVE_TAG_IN_PATCH = re.compile(r"^CVE: *CVE-\d+-\d+$")
+    CVE_TAG_IN_PATCH = "CVE: "
 
     def before(self):
         self.pending_patches = []
@@ -136,7 +136,12 @@ class MissingCVEPatch(_CheckFunction):
                         .format(self.filename, patch_lineno, patch_name),
                         patch_text]
 
-            if not any(map(self.CVE_TAG_IN_PATCH.match, patch_file.open())):
+            trailers = [
+                line.partition(self.CVE_TAG_IN_PATCH)[2].strip()
+                for line in patch_file.open()
+                if line.startswith(self.CVE_TAG_IN_PATCH)
+            ]
+            if not trailers:
                 return ["{}: patch file '{}' is missing 'CVE:' tag"
                         .format(self.filename, patch_name),
                         patch_text]
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 21effa9489..ba9dbd6aea 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -239,6 +239,11 @@ MissingCVEPatch = [
      {},
      'FOO_IGNORE_CVES += CVE-2000-1234\n',
      []),
+    ('patches present with other identifier',
+     {'0001-some-fix.patch': 'CVE: GHSA-abcd-1234-efgh'},
+     '# 0001-some-fix.patch\n'
+     'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
+     []),
     ]
 
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
