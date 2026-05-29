Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C254CCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B1861615;
	Fri, 29 May 2026 17:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9hJbtofYCIi; Fri, 29 May 2026 17:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61693615FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077122;
	bh=uBiWFvBktXhiPO5bjXmiMQc0Xdds1+IxA04N11ZR8to=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YOyUAK1WYX/C0zlRqetq532T25GPFU4vCquEL5nt1C40+6D+ZE/VUBgGWYML8Uudu
	 KBeUwlhFwyirvclB+wXG3RniOSDSTGwF27kMonBHSjnCGvplLMHay9YpROk3GxM6W/
	 TOhmwaKOiS/u+GTsn1dXZl1Ro4wQeviTyWTrwpHaD2yMMeSpv9RcRkLgO/2XTUB2H5
	 FJok39BNP63sD4UzsdKqll6PTR6NSvtewEaaMdgnHBVLp5eQfikOXL5XW2q1EyIZyP
	 FVNRN3uhFa3I44/Auq1YAQ2n7qB8wt/EG0ao33Sj04EDizi0GM869MJMUm4H75KydP
	 cfvvTR3YXdRRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61693615FD;
	Fri, 29 May 2026 17:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1288BF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E771041FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j20aMFK0fsWC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6EF240431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6EF240431
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6EF240431
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ef42dfb26so294029f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780077118; x=1780681918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b1D8t7mqZzaltRHxn3v01SuAyiis46lMgEFWCgf+5Jc=;
 b=YAPXsVIt1EFgLD+Ku5icwG9VzyD29Rr36a75lmVjZ1xXDAFrAxzoZawb6iatUfsXtC
 oSYxJa/CUlhtypwj14i73LNILoWhKZxiGU77LDtV0Qdh2uTDE6bXgfYSm6eG0U/XE0L+
 ZP7RsMg58GiYVYQny4/1EbEW9jRkrJzDJWuHR+Zy6RI2H/kRa+Fqk4PkiH6eeioXPaKU
 /hlB3BFc7MarfMn5MU2LpJ36szuMH6QL4Z0r+hE8JGnPB9AjaTGEuyhFg2fCLeVJis9d
 1Y6eK5oEprzYVBNlzzGqr4OoV9r5Bd3qlWSApGKC3zN0PsjbgBn7ucRpH3reTENqIhgj
 UR9Q==
X-Gm-Message-State: AOJu0YxR1mr3xTWWJeCZsnEtrUDwvYQ49qNrTug31uP6LhRWokesfbtg
 2B7twASckyHww9JI11airGC9hUaE7qi8EoAbgU5kBA1ssxuUk2kgHdWN+oqqST+rYMoZ6NSMbsS
 yQBKM
X-Gm-Gg: Acq92OFQ4v3eIjcAcNgyNfdrqj5KaaWKts6Z8paeqRKZ7N17cnbR6cJn6ccetJvezu5
 JVgA5J54BrLyw3ACMWuQXCPbeJHYgpGmkU9sAQ0wG4kNDY90A/DUBYq3utOlixSra8LD2pN9vmd
 /0UDbJ3nVrn4gpRWmaNH9JIX7CWfU1w6rGl0B/CJc+2OO7NnZNO7H+yMBZ32VrRmaR08Qw1UNQf
 wQW53PfcK4YrfVf1wMOlPtjHLfVx5FvoIbGA6cnfMle6Wk2dl6qlJZWsGS1VgWZbaB+PBy8bm8w
 QfwVQsNMZp+jS/kAOPYtjRL1fba7S2xDZrCqwZN8dSEFpqj8VtaVc/qp1Bcgn+8bIcY/5uxzurG
 Z80OMqwCb+R0eWbaPA5d041JWbvQsu94iC5PqOjzT+UZ53MwY5mNrBfMirLxWO0whSZyFuuMo5j
 CG4sF6emifqZAZwvWCQnF7kgqeVxcSFrjig1ccOkVkLKptaC/l7h30fXpI/L9poOo4EIt3
X-Received: by 2002:a5d:4bc8:0:b0:45e:ea46:3346 with SMTP id
 ffacd0b85a97d-45ef6b01df5mr1211792f8f.6.1780077117671; 
 Fri, 29 May 2026 10:51:57 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef358c07bsm5218817f8f.36.2026.05.29.10.51.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 10:51:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:51:56 +0200
Message-ID: <20260529175156.572429-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529175156.572429-1-thomas.perale@mind.be>
References: <20260529175156.572429-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780077118; x=1780681918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1D8t7mqZzaltRHxn3v01SuAyiis46lMgEFWCgf+5Jc=;
 b=I6P2gIFqMzrgr9p9YfpGjN4M7YafeetC9HX5FNYmIQ5WxjGFKlKGzOlAwJcDNo2/jd
 8351EzjkNoeg7QLiqtHpv3yJUNtkH0NSFUqBGc2rCwFmdK6zR4YGJS6sKN1q7eiH7RZ0
 IZIOzwMkNXeqiHvL4enCtYbqNX3nAqI8fp0VAvgSbsECcQHeqMB81oyVwTOOulYuy+Xe
 tbSDeuzoZWQcq3ykutoni6Pxe4HUM9VX+KGqND943jiy3wL5yPIpmS+kPlpXkgxSYHf/
 HSJf43GcD4uzgGOygk/rM2vCTrnp+hZHXJzAY2o1zVdirjTjnPG0qs8pm4QIOi2nRWU+
 MSKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I6P2gIFq
Subject: [Buildroot] [PATCH v3 2/2]
 support/dependencies/check-host-cmake.sh: verify version argument
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

When running 'make show-info-all' without a '.config', it is possible to
trigger this script without passing a version number.

The 'show-info-all' target is special because it forces the reading of
all packages without requiring a .config, so BR2_HOST_CMAKE_AT_LEAST is
unset and the script is called as:
  check-host-cmake.sh cmake cmake3

Without validation, the integer comparisons below would produce errors
like:
  check-host-cmake.sh: line 37: [: cmake: integer expected

It's possible to trigger this by adding the following file somewhere in
you path:

cat >/bin/cmake3 <<EOF
echo "cmake version 4.3.3 CMake suite maintained and supported by Kitware (kitware.com/cmake)."
EOF
make show-info-all

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/check-host-cmake.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..ab577008c4 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,18 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+# When running 'make show-info-all', it is possible to trigger this script
+# without passing a version number. The 'show-info-all' target is special
+# because it forces the reading of all packages without requiring a .config,
+# so BR2_HOST_CMAKE_AT_LEAST is unset and the script is called as:
+#   check-host-cmake.sh cmake cmake3
+# Without validation, the integer comparisons below would produce errors like:
+#   check-host-cmake.sh: line 37: [: cmake: integer expected
+# The following lines checks we have a single digit number from $1 before
+# continuing the script.
+[ "${major_min}" -eq "${major_min}" ] 2>/dev/null || exit 1
+[ "${minor_min}" -eq "${minor_min}" ] 2>/dev/null || exit 1
+
 shift
 
 for candidate; do
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
