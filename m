Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B042ECA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 10:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E90540640;
	Mon,  5 Oct 2026 10:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99HyAS7JcWBE; Mon,  5 Oct 2026 10:10:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 62F9F4062A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791195031;
	b=VxzwufWIMvUcDz2BvBfzpC+KSMOmEHeKif8VNUdLAtKxC7LB9Qo3UrlydMgxAVmh8hXj
	 BIRhvdVJLXmvjUmMh9trUFo5A/4P10X2EZnDZpKqEF4rELvZ33Yb7QzA4IUOwJmW+cudh
	 RQ2d5tKzjNKltOgoC83iCsAsnhlhr85j35RRSnAZ70Biw4UElqhjJUc5TN/gZrcdhrha5
	 GEBjvClIj0JQAnn7g9e7FhalalbaMNpMJAxjqVF/WwtURWUPkKJjecAQX1RJJ36zVQE5F
	 BRWdTXEZX1qDR9NpX7TdrgqoSGwDQa35J7pldZGFMN9R+mNDkk9ey64q8aXk/mnTdcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791195031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TiHXUSKie5/iLpCH+r2BfQr/04u9UoNE4yfMCdrWX5o=;
	b=Oc6hzoEgVOYgNTG1avAHStl70BwNfE8WYMfU5fOHgPLkiqHXCgtKZqLHW3TCcZh1l1WJ
	 /mEIz+sgYVh/zlnjBwOnXIBd1lr1n9PxnqoA3wXlqX7qb56WShj7EtFc04M5lMpSXu7TL
	 mwpNTJOHX/RnIticJiMvwL6GN/0Qki60GrJ/awQEYISUD3sZWWn9lv7I2d7kDWC2zKy1b
	 Z2Dm68dCQmZHy4vFZkcg0XyvpcWoAO9eUhwTUk9y1mK0yT3yiWcUoq4AHiipLUgWe/Omv
	 2dqiNr9jdSJ4VhiS3US1Mh9n71NCVMUvVtzfVlDJF9pofAuHYcahNyxXQz2EMuMbPcw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791195031;
	bh=TiHXUSKie5/iLpCH+r2BfQr/04u9UoNE4yfMCdrWX5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OCqBfCCOUG3Vvc28wgeizMnle8IXMBpjJrlY1BW4C/1oCil2XeXpk8R5XfUJtpJue
	 97F6YC1OftdZIEgVvX7xJnOFdmmh3rtW75A+K5yH9PxiDNl0a5TBNtNcELUZJvYJDC
	 kVk9apvRJjj1UBugg3d/+VXpk0VtwXmii6WFevljYC1ft8i8scnGIlp2qciv/jv+B8
	 F0I7W3326dCP6vLOEa5ShO7BpmKy/4BriGRu1B6Y8aFrDYryOAeqjOKIvimHLk/IHD
	 2LaCD/T8ao45VF/0QcRwJz3pYA7kiOiOBPvJGYu64HVhvMWbyM8Yzy4sUvwHFKhvCD
	 LMhd/qb7rbZaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F9F4062A;
	Mon,  5 Oct 2026 10:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC98F32F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 10:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DA06400AA
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 10:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71rwvCmcLXKN for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 10:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 845AD4007E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791194865;
 b=nK+jChF10MQ7ygVhDIFs0P4C8blxmpJt8wumho8h1QjiweZnRXM6jChB3xzVTGKTf22e
 wk0FDGfz8IDwaHq+IAm0ZRAfZfPs1YKjYN4KiwBCE3Y88WkYITE4JJJOL+64+1Y9YRsAs
 wZ/UTyK/7zXTEARQHMLqXQ9mEoPsev12mk9WBin8koTEuz7p69lx+hmbUHXY1gezr7A6M
 PBljkKOhs0hrZW6nOYr7mqx+NagX4bAZQ9CnRPXQV65qb76UcY2PCikNWKUGQzE1wG3gJ
 fugV0SvMPJgO6JDbl1jRbdR8EdmofrsI1gFANYaapsMMoDOhxjQ8L8Zov0KD0BKx+Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791194865;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Y4rrengorfeoickHHhkQkroj+Hdf6XY2xv/tsWdxp/Y=;
 b=KB9oosUCIBJER2Qk9OzljtZPYgyW6z1W1gnKsaOolQmpAdDcq5LEcupz2A9tn0uOdbhD
 Ns2OKdKpn1j6NYO4+ObQyzF6zTCXatxu9saSP8xqbYLipYTDTLTmthjhG9F0/xZ5fug6N
 njJ1IDMARyXThiTkxfzeDTPuBi+z5w48KOTWNzcbmv1uv6wkK9i3CdAwhcw0i+Cj5iEoc
 4ABPIKp7JCDteHDgCW+cNvg+KxgsXwTyGy9pisJFYPyykl9P3pJCL6stJIDmyUdaws42y
 9Og3J5Y43tpuOOCuEsfZbbGQpXPWaW+cp0ibhane8qkgaT7PsyZecqzx5phW0CtJLDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OJDQr2j3; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 845AD4007E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 10:07:43 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so10175735e9.3
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 03:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791194862; x=1791799662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y4rrengorfeoickHHhkQkroj+Hdf6XY2xv/tsWdxp/Y=;
 b=071fektsjqqnMIzCtYjfgjdIoAZHxs6rqtXVxcqk3zNPqOkltsr7jveGOkyQ5pulnY
 F9SkfnQU6ojH2hQbjHzdhtynmMELu1uALwk7WGRg6nxq+jD8XaxGu3YzHJNMtbeG9IRj
 M3v/Y53JT6DO6p2SiicDvmysyEhmsB3viUEd0Nro2sSYnng/Qwp0GhgnYWtNJgjZaDZ/
 qBDr09yxUhW4/SkwOybwxsbLrqDgJK7WOG5uw0TTctRJTIgFcEJr+F3NK7wBVaRpF0QF
 0a01QZXydSW0/SCmEqCcJ+1pU4mQnzSHHRjPIpdccE89tFu4NIAqypC8PW1GD163RStT
 eXgA==
X-Gm-Message-State: AFuF++kDJqIOpSGMgzZcYbYvCOJE4+Znh9RJBqrihYpldvzumvkvaFK+
 wP8yU/BC1ISIbXc/tbpj8Be3vAtghdp9ugVeUlA7qMhUrjrIMuHigB8AH8hFHTN2ZTSnwOWFZ1C
 fOLM/
X-Gm-Gg: AYBFou23173ahgmTfgFTIgZ30SE5G/qCNaF8J+3BsM94NYIKpFfBVYmPeUYXZehiTRv
 YyrgOF05ldhe7fj3Fmu7WCK0MvG3hX4Oq4FxyhNTnR2ef+CCurO+Fdgk9tNXsPcv67IVMIJm/4v
 jQwbR0vc+DO8DoJBK297+y7LmWy2Sk/eh1iFFEC7fAW95ET1KQnCXowkVn1c6Ab2iu7BTLgLvsI
 JNS23rivNBamANKMaD7/jn53bNnSbuO7il0644igeSZgunrhkpoLhQ4yFFbeaZZbIgEouhdWbDd
 BIBMl/ydaNPkkeyDEoSt3rEnMKym7VXJ/3iI+uJ4Vw4GgS8mhokIy2COucw96ALyE6K0jhh7tf3
 k5qjDepdOqXMuMeW40iHdGR4YrMjkr1nM9vQB71WK6HTz8HXInSxxj7bfeI9URnWWXsRHqwrX+s
 Ld0Y+Fn5TsVKeC5Tb9ptJFWdPTQFCK9ESn10KJqs11SlB0zly6fPSH5QJO92EzL1Hpl8ZwgdNOC
 xfmf2dx06Qs+mM76dsEC69dfGE9takedUT4/1+ZJSzXlCEpoPc=
X-Received: by 2002:a05:600c:548c:b0:4a0:1eb1:133b with SMTP id
 5b1f17b1804b1-4a0275599aamr169227415e9.12.1791194861784; 
 Mon, 05 Oct 2026 03:07:41 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280bfafasm350542585e9.8.2026.10.05.03.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:07:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 12:07:31 +0200
Message-ID: <20261005100731.201684-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/python3: security bump to
 v3.12.15
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
Cc: raphael.melotte@mind.be, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://www.python.org/downloads/release/python-31215/

This fixes a handful of vulnerabilities:
- CVE-2026-19445 gh-156293 Use-after-free of a server-side SSLContext
  when sni_callback switches contexts

- CVE-2026-19553 gh-156793 SSLContext.wrap_bio() missing validation of
  server_hostname parameter

- CVE-2026-82049 gh-157190 tarfile extraction filters allow file modification
  and content disclosure via hard link to symlink

- CVE-2026-15310 gh-156002 Memory exhaustion in zipfile in
  bzip2/LZMA/Zstandard decompression

- CVE-2026-19672 gh-155999 tarfile extraction filter bypass allows creation
  of directories outside the destination

- CVE-2026-15806 gh-155694 urllib.request.HTTPPasswordMgr credentials for
  one URL scheme sent over another scheme

- CVE-2026-17084 gh-155292 StringPrep algorithm considered Unicode codepoint
  attributes outside Unicode 3.2.0

- gh-158446 Reject float format precision near INT_MAX

- gh-157953 Update bundled Expat to 2.8.5

- CVE-2026-87910 gh-157265 tarfile hardlink fallback ignores custom
  extraction filter rejection via None

(alternative to commit 6e0a068475062968db52c102ec2b7185f8a90d1b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index cf4b6b8667..7949607fb7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
-# From https://www.python.org/downloads/release/python-31214/
-sha256  5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a  Python-3.12.14.tar.xz
+# From https://www.python.org/downloads/release/python-31215/
+sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6266c8220a..a842dab2a9 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).14
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
