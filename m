Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C92FC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7327D610B6;
	Fri,  3 Jul 2026 14:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mq48cbS9tTV6; Fri,  3 Jul 2026 14:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6308B6152F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089212;
	bh=IhOwVobIbMbSZU/fQQAEeQGXeS2GWetw5ibWGnFeaaw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sgkJ7ZN5dfIwE7CKkCXiMEd1dm/VXSREgazeP4lpk11wE3YhA6OKdt1mDGX2XEb8v
	 MBNvpXv3KLIT7jaBkRgzJVjy2tfTRl+wqls/3xtGupazoFBrtvvgrxaQ3Vyo9d798F
	 xHe4fccFHHibSxKn2Wv+nTBn7qF+P2ocL4j1sF2i4znk3bH7ho9pecjAW3uV2MxMAJ
	 JHL3+bxAzwQIxvvHmHoUqoyhGSqb0/8xLSRsTfsAixPUomDuJUP1iJN8yTNrC0AXUN
	 TVKcD5CoeMB6zK2fXuTSD1E6GZUBNXWj5JKy6TBNkerVREtuXb7kPxpM5bil5mz/5I
	 2kIdyL9au1mFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6308B6152F;
	Fri,  3 Jul 2026 14:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B56363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 632AA40420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpIuqBzK3Eew for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35FA04008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35FA04008F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35FA04008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-493b68b4643so3569135e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089207; x=1783694007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xD1tDNCjr4eobx8V2nruxgM5WbmPgcKHWyPqkbuAf1U=;
 b=sGg0AhdzcFKmuN1VPZpwoplbL+G2IR1qTo2p9JmqevSYkfB1IimjiXVlKG/1HFqCpc
 rD8vvo26gPOAQKkasrjBhChM84WXK/gHYd0xKk2Zfx9KaxXHrWQ2PBpTrVtZAlbN4cv/
 kmp1642jNGBEfnUyO7HROafcklzVCavKrBTzE2SMncfVG8dWpfT0RKfJ/teZP+H606ma
 roCHdWNNFLWzpnu+Irk0F8hTA5IZKmNUL9Bse5fBQQGjN0Vyc8/h4nWL5Fw6v8SW5XsT
 lcECcg4zO9TXjcpJSvvANGaLZkUSzJLo/XIHSrqyhoytUuHgE+5euA2Uamswd+2lzyEx
 OrzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ89pBQwvuTCTLvzkoKwRi8lZiNgHfhEqT12wJ0xdiog3cjFHv6PHs9nboQGMyR576lutfIcB8WqSUE=@buildroot.org
X-Gm-Message-State: AOJu0YzVXwK2v8Dhxn+ZD12ro2eNZwODgfnU4prw1wQyjNwFZ4L2w709
 oi5OWIHsIGufOADuBN7Sg9l3uxkfmn5rHv3SVpsn8mKk53bfl+AuQ6sIqVImmfMhudT7sxYUZ8K
 FOxKO
X-Gm-Gg: AfdE7clffZByR+5AndFWUh3BaAEJH9mDP0b7G6ClHcyAwFZvqnU7eLRyK9cqR5VxZ/D
 F6G6Xkk6eDPgMctDDDBr3Ri4C1Ic5p2T2nnCuBOgRvuRCe8iGRoR0jp6Dh8yOznTT8rv3lmQ1BQ
 xPvJE4CGWgTn3O6MsW0IsAjmAfoJBdUIUlm48jnipulheWG+BNmcOyCKPaHcKH+F3dbh8qW0cdt
 9gcqha+/4/ecj35TmceeGX4B1PMUk2sPTcOyfKhvnt4yh4iiyt1+N5hfxXpdzojTtqWNd9Fo19q
 k8dVnTG5qBggkL0cDn0iWsJRdsQmb2zGcyk+Hh0bjzhF4V30APY5xkI9NObQpDm2KgpWA07dQ60
 DZ1/Dx2IZ6UO5tUIOM9FwqbJaJg1lWgEn0XLgOfChuhLTsRFyA2aXlD+FDrZ+qJ2lUCGCTVfcvR
 3e4IFb
X-Received: by 2002:a05:600c:8189:b0:492:465c:56f6 with SMTP id
 5b1f17b1804b1-493d0f0ed37mr1863455e9.10.1783089206885; 
 Fri, 03 Jul 2026 07:33:26 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4a343csm168916415e9.0.2026.07.03.07.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:26 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:25 +0200
Message-ID: <20260703143325.275886-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260623182024.2068785-1-bernd@kuhls.net>
References: <20260623182024.2068785-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089207; x=1783694007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xD1tDNCjr4eobx8V2nruxgM5WbmPgcKHWyPqkbuAf1U=;
 b=hLRWxmakGNwOyh5/nDXT9UddbfzmOzVPk/fHG3MpWVMSWUe1mEtcYkd7hiKPAy5NDY
 SVOva52HTt8uGH3g5WsybPzojVnzPKRiQfdtxvA0UX9BQ54uKK6wBDCFEW55sU/fZP3D
 G4LfrWZuepy+hKCTyxhYavGE01pfcJOkALamGAnsWEKR36urYxkkF6JYruAE3fFCmDDA
 +Jy0FY/+6NAPfWUHW3z4jOBJYWjOQ6m/ouOzuvsHJWqHa9l2dHy+E5c6dBToqlRnCEgp
 MJ+bwFHCiDD3f62Hoo7y/DBTiBcYyMdaSVWisbOdXiq0SwyX/2tggSeaUx6tJ3D+O4jd
 kQ9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hLRWxmak
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: add upstream security
 patch for CVE-2026-11940
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

In reply of:
> https://seclists.org/oss-sec/2026/q2/1006
> https://www.cve.org/CVERecord?id=CVE-2026-11940
> https://github.com/python/cpython/pull/151559
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/8200789782546a265af81c894a442a2e64091bcc
> 
>  ...ix-symlink-escape-via-tarfile-hardli.patch | 83 +++++++++++++++++++
>  package/python3/python3.mk                    |  3 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> 
> diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> new file mode 100644
> index 0000000000..d3454a7a6b
> --- /dev/null
> +++ b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> @@ -0,0 +1,83 @@
> +From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Tue, 23 Jun 2026 15:58:47 +0200
> +Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
> + hardlink-extraction fallback (GH-151559)
> +
> +(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
> +
> +Co-authored-by: Stan Ulbrych <stan@python.org>
> +
> +Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
> +CVE: CVE-2026-11940
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Lib/tarfile.py                                |  3 +++
> + Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
> + ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
> + 3 files changed, 30 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index 39b1cd6514c..399f906efdf 100644
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
> +                     "makelink_with_filter: if filter_function is not None, "
> +                     + "extraction_root must also not be None")
> +             try:
> ++                filter_function(
> ++                    unfiltered.replace(name=tarinfo.name, deep=False),
> ++                    extraction_root)
> +                 filtered = filter_function(unfiltered, extraction_root)
> +             except _FILTER_ERRORS as cause:
> +                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 8503024a690..045377d620c 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
> +                     self.expect_file("boom", symlink_to='../../link_here')
> +                     self.expect_file("c", symlink_to='b')
> + 
> ++    @symlink_test
> ++    def test_sneaky_hardlink_fallback_deep(self):
> ++        # (CVE-2026-11940)
> ++        with ArchiveMaker() as arc:
> ++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
> ++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
> ++
> ++        with self.check_context(arc.open(), 'data'):
> ++            e = self.expect_exception(
> ++                tarfile.LinkFallbackError,
> ++                "link 's' would be extracted as a copy of "
> ++                + "'a/b/s', which was rejected")
> ++            self.assertIsInstance(e.__cause__,
> ++                                  tarfile.LinkOutsideDestinationError)
> ++
> ++        for filter in 'tar', 'fully_trusted':
> ++            with self.subTest(filter), self.check_context(arc.open(), filter):
> ++                if not os_helper.can_symlink():
> ++                    self.expect_file("a/")
> ++                    self.expect_file("a/b/")
> ++                else:
> ++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
> ++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
> ++
> +     @symlink_test
> +     def test_exfiltration_via_symlink(self):
> +         # (CVE-2025-4138)
> +diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +new file mode 100644
> +index 00000000000..74459d5680e
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +@@ -0,0 +1,3 @@
> ++Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
> ++filters where crafted archives could create a symlink pointing outside the
> ++destination directory. This was a bypass of :cve:`2025-4330`.
> +-- 
> +2.47.3
> +
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index ff9afbb5a9..fabbdac384 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
>  PYTHON3_CPE_ID_VENDOR = python
>  PYTHON3_CPE_ID_PRODUCT = python
>  
> +# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-11940
> +
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
