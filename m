Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E125C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5515C80C0F;
	Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90pgX9g_K8rM; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747819;
	bh=/bdwSxP/ux2HM7kGYIevYjoBzaqjh8T1oF26V7l9JJc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BcVFnyUN0kuulNHWfxjkDuW0rKGs4M1ewHoVQAwj1YY+j8lxlQJGrUPx3EDzfGugm
	 N2gD7v90DSgUS0nqWWK7shfTs+G99vtAg9xBzMo+AIAVqXK+/LTpRTs7/CK5at7y56
	 bbj2/LJTKJHeakwtlN3uIZpwpHYDFpEr1z0sq28nhNKhZG6J4vuw8IyZlKDfcPLnde
	 O5UVSdx0XQTSLJquJelDg3VcfAvUuqI7R4f499VfCcR0VYxqtq6mGMsOk4DHzE3AKt
	 hwWPpYmB1Xsv43weGQJfkEmRdLLO4lCTZuy7vuZarYdFL+Gr/Gl2gpaaOrcvZIf0GW
	 NHYBrFHhNoiFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C01980BB8;
	Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F843396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21AC840555
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODJxYKByhocS for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16DC040550
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6a18e24ad25so1201942a12.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747811; x=1788352611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eChA1B7CcMkERmr/K0lhGmCLNnHxuput1oFfS7pCt/A=;
 b=SdCA170gbYqyOGiS82C1/oybv2Y4TvSdt3sLrUrlYMQ9sY6op1CUdh2AG8NpwfOlO9
 +/z8Qagc4EoNA4ozuKLi1Fgy+xhf+zTWuh3a/nEAiSQF+W/XkYxNGfpRSfv2QxkYK4cY
 LIPJM/4aCH5Hc7H5TlM7u3+Y8WedGUzBO02V6rXYg1+RgL3gLZE7d1xDhXYY3LiyVRd3
 KvDuoCtF8Lhe5w1XBLOF2DqetPIIpSD/c5PPF29ijqkySWJiHa3NgS8t6/ZT1lXvznNW
 rbXN+Me5UAXczkrfFhpn5BMaRdOScEwXij8hv4L7yTXi94M2/Sz1LWbv6cPKSbi0czSv
 ALSA==
X-Gm-Message-State: AFuF++kVlQzE5VGFLjZ3AylbcVL6blJpktk0kAZPIwF7Wo+q5x3N9UEa
 l176Thufm7FaRGINWzkPimiFvA1OG3YRkhtV17rSuDZBvrF/GFVMf7vwMv7K3GRTFoynikSGD04
 jKrGoVdM=
X-Gm-Gg: AR+sD11oCrcol8Lu428Bm7SsXgvX8UWTyRIzjR66lbM4BhUv5c9SpqO99taWaxX8ahc
 7zBxwLnsBK9ueKVEEvr540f9qNtbCXsAh2nvBtF/Z8v3I4nrWlOpRIEuE0+XuFg8cWc8V7rBY9W
 twJM5sr0NotMg+6vpAtEf0gvLT1By8bcPV2ALL+qP3PNJymSXSVJlfmsM/cd+AiwGKImSmfJRi2
 ejRMM3T8gCji1r2s1dJDvYS99jCIaZrzJlKBj+wSG/WyjnW02pUMSn1GuJiCngpif91p9NH/mYg
 9m3rbeYGAOY7k+fUTNnsUk+SSI0sNf0TPK7GXfLw39Q28kL04d7LNuoaSDNdf9jDTaNhfqYJiuV
 JZxbbBP6lvK0ixQA93P4XiyZlfd1+1Lqv9mqiOBYwb9o/I6yR6AIiPWDmHWEK2gXZilf8WbzYUg
 9XkUosNKXjqvyvk29HmYoAPZ0bxdCFwMUUt2R39f7AODpKM2XKFO6Uj0rwn4+M+tI7gZiXjIinq
 EBy
X-Received: by 2002:a05:6402:380f:b0:6a5:d8c9:d10c with SMTP id
 4fb4d7f45d1cf-6a5df63427dmr9859505a12.9.1787747811100; 
 Wed, 26 Aug 2026 05:36:51 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:24 +0200
Message-ID: <20260826123637.410258-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 03/16] package/clamav: add patch
 for RUSTSEC-2026-0007/CVE-2026-25541 in bundled dependency
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...pendency-to-resolve-a-security-issue.patch | 30 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/clamav/0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch

diff --git a/package/clamav/0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch b/package/clamav/0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch
new file mode 100644
index 0000000000..b7ab48814e
--- /dev/null
+++ b/package/clamav/0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch
@@ -0,0 +1,30 @@
+From: Valerie Snyder <mx.val@icloud.com>
+Date: Mon, 23 Feb 2026 18:04:59 -0500
+Subject: Upgrade Rust dependency to resolve a security issue
+
+Upgrade the bytes dependency to resolve RUSTSEC-2026-0007
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/a6761cb41c3dcb4b2e1c17364a56cfb83fe84903
+CVE: CVE-2026-25541
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Cargo.lock | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 85b604e90a..ec534e5ae2 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -240,9 +240,9 @@ checksum = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
+ 
+ [[package]]
+ name = "bytes"
+-version = "1.9.0"
++version = "1.11.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "325918d6fe32f23b19878fe4b34794ae41fc19ddbe53b10571a4874d44ffd39b"
++checksum = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
+ 
+ [[package]]
+ name = "bzip2-rs"
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 56e4217f3f..84bcadde6d 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -27,6 +27,9 @@ CLAMAV_IGNORE_CVES += CVE-2016-1405
 # 0001-fix-possible-panic-when-scanning-some-html-files.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20031
 
+# 0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch
+CLAMAV_IGNORE_CVES += CVE-2026-25541
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
