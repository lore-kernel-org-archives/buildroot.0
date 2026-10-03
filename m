Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E741CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C8081102;
	Sat,  3 Oct 2026 08:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVo6PvRYdMsN; Sat,  3 Oct 2026 08:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0788281248
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017107;
	b=o4qGqS5ie9n/A5fPffMd6Lpu+Bp1+uOeQoDdpRqRvQ3w/7yQfIGFmRbAv/tOxGzxQGEA
	 FTp016Z8DCgyoa0YWiSk4XN+p01qE7aGsFmqXYLP0EBYyk8DbpkKnhO2K/Zl3qHkvLAmx
	 9hx7hPiiAAE9R6k1/QrZy+XQHpFOsUxZNK34yEy+iddvllwqhxWk1td5/J32RhPT1NkQY
	 E/IP/BprDDvXa+njI+Hy51C9KIz3hN10GgCGsxaiynjezrowCYTnWEujHlYO9i+1mg5a4
	 yGQbBfQJuHRBx5gwVNi4LdDtSl3NLyCjxpW2p/t2glOQD3w95j65XEfyurp2mJ0wpCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PgQp2kGVYdCRFhKdIdBrtgLYvUIb2pMMNnU614e74cs=;
	b=J4YZ8SLdRgEG6BCX8MpaVcNDvIsJNS6HIVZsQENr59GmRabpFm7JiwaVQDt16qlEYPLD
	 ePXK414S9/9uXQXd/rAr9zAwheFnNVuupGr5YKFZxPJgFbpDP88sK6E5heMPDAxrHiCW5
	 wqv2lBm25Ha9zNmEz8oM3Cx5bIbWGRwcUElVTn91yM++iZEkIhJC5D9Up82DrzKATihwG
	 DZyiEm7Z4PkgC0G987r2QF8wBoa+bJyLgnonKTHplELSr2kb0qXMQSZB32rAXoN4TH4eY
	 WPa4bsMJzqmUqtUw+j36ayfCiYQPMvUEcQt0DUavm3G68mwtZ6e6uszRihak9X57iOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JRyFSYvc;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017107;
	bh=PgQp2kGVYdCRFhKdIdBrtgLYvUIb2pMMNnU614e74cs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FxNZXTRHi3sXLPyuvfjD6NPEaGJKqE1+KI3qkK5LulCNNcRARfCmO/AHTkLI+Jnc2
	 1j5X6otnfsN+LTrJQuc3uf+48hhvp4aA5oYa2Q6yYlzelRCy5nJVIAxBUVs81MfZsd
	 Zu9jBzYh9azWSmOA7rnvc7zfs3T86iuSePjYwN+gGZZ0d5l4pWfrR+3TkDr5aYFr8L
	 iIMLVMDdH51a/MPJRXnCEku8BH9BpXmFJtLwxClXxUaZiDZSgXebeJgORqC66SFz7d
	 RBdk003eSoJRPxLCdmeiax5dTR1QCVaGaCiwQhTybxT887f6esa/h8QLdHGcYFLzzY
	 IPL2lo7s+OElA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0788281248;
	Sat,  3 Oct 2026 08:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5D72E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B8681231
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSyc4DLBJEv2 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D9A9481062
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017105;
 b=C2/L+oyO/q8nKQc4mzN98VDMOm2zHKkrfvlV/SevA7kbkxmOFTX4JKnb/EHpvRSE4D84
 RRzcS2q1v3n5WaV7p7crNn1gIUZdD83GlBXWliqwjPkeUQGgB2vydPqr9o6nq0p/roZRP
 FC7z4nHjx05KCDVYu41dtMspSUnhQXd93PfmwDANjPDcS3n2me92PsPpveKVPBnosRSwN
 AkJVG+Ls+nt3eXx6U+cc5Dvj8bKCml+Lt2qD4uJ8gfnUF2ezhCFWayren3DuDq7It6Aph
 DBNeNPfjHPi3pD2BHs6hdEAN/X0GLn54euUt3XCGmsSISiufp9H4P6Ud9p3bXfHP8Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017105;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0QkJXYVHKdNVV2NHlujGDfNYGA4qlrBXNhW6bzBfmQ8=;
 b=a0UdpED2f/Zc08qe8haLkrnl0GzJCox655H84RRocKxDkmQmr1u9m5EByJd5yyMkjQJ9
 N3Q8zNgY9fsoXlSw1b6s9ktB2atihHVrwTTWo46TbsCJIZM8+wHp840Y4nYiTDRh02Fr1
 KZmfSgtUynZhP+g1G8dvJ8zPdLjOF9LlhZ2JUyc0eY/wBepoT4DXhnkT89BYMfWD0pvAa
 tKbYyQVSiFP0vN1+Vg5ekJb7ieQYNbz0HJHrmarBEf70iOfqREvW8nGpcCTSZlM8AgjFq
 vKvTYAYaAemOBVbaUmp+mP8pqdDuRL38NCfi6pNJV5g2Zt9v53u22MwrCaunVS3VxDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JRyFSYvc; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JRyFSYvc
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9A9481062
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8247421d2ebso103358a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017103; x=1791621903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0QkJXYVHKdNVV2NHlujGDfNYGA4qlrBXNhW6bzBfmQ8=;
 b=JRyFSYvcbV2XcyHaNPF/SG8wNHpDRm2L36sP2rOibB+plOzJJpukJEvvRpZZuytvPW
 QwIKTC2Mcq9CjN2c00MDWHJLSEa8kKY/bDnz+u0HXDB7KruKt0PWf0ZCZq3dw4v+7QjQ
 0f6lbgkMC0yt8zHbrNs/63Zt72DRDnh67CsKxLwVXLtWgmv5IksHMR2UDYvkMCpSxFSC
 HU+lxaBiZWbIRRl/hh3Y9S3wmLkl/DC65bIamIVUbz+D5uAAnTKgrVQfY7EMBP/fitdc
 mthkdyAPRu8pfwsfmVlV5Dtok5WEe24M89oYlvjVD8srcmrcZneVAk/HOC08/xasD6o1
 2LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017103; x=1791621903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0QkJXYVHKdNVV2NHlujGDfNYGA4qlrBXNhW6bzBfmQ8=;
 b=diWZK/Y/q4/yllEZjPXhQ2dyviEYmO3MUz3p6+jRe5jxfz3063wCjBV8VG0MrCimX5
 HCMrmACzamUx0s5N9pN3TYurUvmBiWtJ+WXUqhNRr0Yjv+6ONTyCIvmBFHEWwC9OpxL7
 Z6IbsgOH7USbsDneMfQXrBmAXV/5Aa1CL8JczU3RnQj2uuAYxArbr+inrmBdTe3KWzHH
 TVjaCqUBkwjQXaI0qUBY4Fa5UgWvlTkM2WtcVQw7RpqNipvtD5tIBJQcLXfzmD3ZMnHn
 tl/X9hsuvJ6tWilcw5K7+SSgcUPuaFavROPOOq7Z4eI/4vww5Mf1i1KjZXgEde15TkZs
 1zZg==
X-Gm-Message-State: AFuF++kissGjTP8Sg6JAtef17IrUVMjzEf64VFDcsZ21lxCVSkCyYqRT
 sRRtMr3yGKP1uWCEeeGXr8PMeba69z+xNVsgUqcalkfOyHf2XizNx4FB+jd/2g==
X-Gm-Gg: AYBFou199982LYBn+9+GVsE0aL7etM0+qnThsw1ZWtkiBnMXURc11vC/8VwYRXa8buB
 lWoo1ZcE3JSDF07ocDnOOhp++gVtTsGqggbU37rfR3Ynrrk/pWilEblrW484+zN/RCzpXtInnyz
 sToWrSboXZhjWYYgyKxpXINejSUiCAWOMDbMD4sZUtRcohqAUg1ksrptPWDEuT49dPRkVhPxYKI
 5d8Ni2bFzxve9TGp2H3HbaeMEbT9zt3w/RuxRBN/9hYksgnYTGE5Aeu8oF2uq0GOKNahmXEStzp
 r/P8W2ufvoXCK3aJjFdDyABodyUHEUHmk0YwoftI6CnC3WRHl18G2wJBoqzFZZQobVvxn5qLkLg
 DTEVvJ149dgWQ1GrnW7JQXKXf6x7Gap9rJbLco9ensr4V9oNjXRjdAUC8BAbvJOOyZ84vfzJOeC
 yM7bujZ0SAL8NlfFh0KLSs60AQV4mxb6k3YWS/sMIOKTnNOvUSiI8EWIcdnH/aGDqUP8xjVB9NO
 RJROwhxpenaAb8JFYiuPYxfgmd36OQKk3hYEeig0KTmBx/z4IjGyYhJkSuzvVt2rFKYBUQDf20f
 vBvQPCKdGvuApj2wGVa4N0+tUHXnrfK+BkWUsHfV/KCK3TLMb4ZMCSWC8AyQo8QCtceLT2VwvA7
 8ovjUy/n/3ZiC8ctJYuh2f62iPNFlvkebO+Co+4kLWPo=
X-Received: by 2002:a05:6830:2584:b0:81e:b1d2:95f with SMTP id
 46e09a7af769-82283486c71mr5312684a34.28.1791017103334; 
 Sat, 03 Oct 2026 01:45:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:50 -0600
Message-ID: <20261003084453.545653-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 3.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 5533d82a7a..d7b94ad577 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  9edf7e8e5d9fbea6aa8a9c045bee93b6  python_crontab-3.3.0.tar.gz
-sha256  007c8aee68dddf3e04ec4dce0fac124b93bd68be7470fc95d2a9617a15de291b  python_crontab-3.3.0.tar.gz
+md5  db7bcaeba9f5e01b67feca4f799d354d  python_crontab-3.4.0.tar.gz
+sha256  d2b5ad91f7a641d774661b7f3ba52258fd68273862c88713f4cc092ba614e707  python_crontab-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 248ffca405..5910d9984f 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.3.0
+PYTHON_CRONTAB_VERSION = 3.4.0
 PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/99/7f/c54fb7e70b59844526aa4ae321e927a167678660ab51dda979955eafb89a
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/49/3e/f61917a63b20d0ce0dfb58e44192201892a1cfe9d4167264b93fa5485594
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
