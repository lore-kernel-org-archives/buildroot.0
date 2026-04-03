Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31D3E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C62D5610D7;
	Fri,  3 Apr 2026 10:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0EywN915Zil; Fri,  3 Apr 2026 10:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938E4610BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212076;
	bh=FBk8n514KxLh5bj+k+NwJaB0nJXiW3QFbx/aIGm2U3c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IFxYOuooH5L+ehk9qo04iCFEK3ktB0FGvbYb7WDn2vo/xOEM+kWR7iedTFgF8imn3
	 hM4+8dkNcA1qD9P4kjlYiPnqHZrjfwxEH42YNe7b0ew5UmIj7Jo9Kf7vkKg1Mhloaw
	 wKqPK3Iu0pS5LEOWcVwQvPIr4eDoxz3zZk+kXQdcq42iCSCMmDok/yGrR9I3ER4yKr
	 jKwq2BcytmFbgotQNFFdQMxAtD4bmxCFR/m7N5SfLxRwXkkjFqvjhxwZmRXGkRYbmn
	 MSh7c37PX7pvM2SAM6mLi9w4X5LjdQ2dXMlB7aAqSpTkofSHBs36LRZ1j608t7YOwG
	 3K+igxO1MvY8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938E4610BD;
	Fri,  3 Apr 2026 10:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFBF72CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D7D81AD7
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqUM_c5ddnWR for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49253817AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49253817AE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49253817AE
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso15725285e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212071; x=1775816871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nGFfgYGEPT3A7nQG5lE3Aox+OQa9IKdDpvYE11qjEns=;
 b=TPi31Tn/fOX431840RXcieUSnAIcnP0m9kbwKYh0mEZBEqBmQCsq4g+KlVigyXWAwd
 qsPV3OFfVMFYf5y0rgRsXLWMC+cIM6XuoLvJHjVh+/175jpJy2Tn06acsy6ZOcmNTBM3
 F+cUWXo2glEAUtBXQDuLYIpE4rXbujrkZo8QGtPeMhtLxXw+Q/XB1MzUP1MdKEEx1ZlD
 NVX+vFEosf6Ah7ryhqYMsQMoLyf2xpHiYccLKaw9JgxJ9A/F2U8QIVyKCt/7qDNctUnr
 GctW9EvAvM/p9p6lXwjYxGOhx4kmJDoGqz8OpeUlEBdFWlwVx1xmTnTDE9+WjgegMmG8
 BXqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURP+NUHK8EaoDXb4AvoHH1AscD5kgnVRjIAlhMMN8b6OoKn2P2xi3ElH2SuTr4Sci5yK+7P5PrDh4=@buildroot.org
X-Gm-Message-State: AOJu0YxwSu5fJtD22K19+Ue69hgSjg9nSJgAOzvsEl8xQBjne/hG25zK
 c3FhhV3QTWrI+JcZYsz7STRMssIhLk7fTo/PV13jsMXSO83PHuaoxKU4piP65/UlUV8qvPoInf+
 qWHzk7Uw=
X-Gm-Gg: ATEYQzwc1TGuKJrSne9smlnxikQAN9F4pMZ7uyWOMdgZ0nTS8QEctT9txy7kQb/cIfM
 J7vaocZ+kLuBQcimKD2GeKxIpbfE/23XwRCO4oHH7kvHoGm8AYzxkp4JahJoyXpkTKBjRv2yZbZ
 bPnCjuKUKfsbSZakQE01mLPuQGAxrVqWXxy2hTYLbguH9Y563IKq4Q/G2Q4VQMBP3uRa6gu5DB0
 YpzEzivlw8YNTaoMxdrTIxqDA1s5Ulv0O7y71lBORsraHq55IN8riErOtpyZqQDAuc7qzWe0SXC
 WPJVx8zUG4bUsV8JRRCKdcs0qYl3aCERoaUhDtevgqdFVNYiMQN+4x8yuuuzPzNes4bda8LQjgT
 0rVyhcygjYVXgzDYb8ImM1j5eqLufKzx+zV08fUQuPAJDzjNNq7TXFYJlJDZmTjqxSLgJCfqWjE
 +iBWCUApNy79AGvnHH0Kjj8TYDk3I=
X-Received: by 2002:a05:600c:c8d:b0:486:fb69:4960 with SMTP id
 5b1f17b1804b1-48899794fe6mr36230885e9.19.1775212070952; 
 Fri, 03 Apr 2026 03:27:50 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93cf2dsm236908695e9.11.2026.04.03.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:50 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:49 +0200
Message-ID: <20260403102749.209929-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331070914.459068-1-titouan.christophe@mind.be>
References: <20260331070914.459068-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212071; x=1775816871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGFfgYGEPT3A7nQG5lE3Aox+OQa9IKdDpvYE11qjEns=;
 b=aEBnsmK4qoD+VaI7ZodjPjr6PUPNHXpDs0LsXEGYcWT2rnOhOcuqWTEycQSbuPgM2O
 Q8xBkvrRbN18JmiT5Xywk5XR6a+kVVOIZiwS/7HLODItlHPlpH9OfeBf8L/KK0ftfVYh
 lgqO09Vmy1zuI7ev6NcD2nrz4Ie0qfCTeEhEHzKB+nN5nxkAjTQpnwdO4W8JPqkICtwh
 yk1ZBXPzbECNaCu70EbZ4wEkQyV1RBxgeiJ7BrSwiM3lbqin82UnrUgfSRIsZNy0/AZd
 P7nM+NptH1XybVZi7btvVery8yFD7TjH9y3Ajl21DlZtJUc6MFz2yB1kRGGgNAS8QGTC
 20xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aEBnsmK4
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/rauc: add patch for
 CVE-2026-34155
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
> This fixes the following vulnerability:
> 
>     RAUC bundles using the 'plain' format exceeding a payload size of 2 GiB
>     cause an integer overflow which results in a signature which covers only
>     the first few bytes of the payload. Given such a bundle with a legitimate
>     signature, an attacker can modify the part of the payload which is not
>     covered by the signature. Bundles using the recommended 'verity' or
>     'crypt' formats are not affected. They are supported from v1.5
>     (released 2020-12-14) and v1.7 (released 2022-06-03) respectively.
>     If all signed and published bundles were smaller than 2GiB,
>     the vulnerability cannot be exploited.
>     https://github.com/rauc/rauc/security/advisories/GHSA-6hj7-q844-m2hx
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/rauc/0001-fix-cve-2026-34155.patch | 219 +++++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 package/rauc/0001-fix-cve-2026-34155.patch
> 
> diff --git a/package/rauc/0001-fix-cve-2026-34155.patch b/package/rauc/0001-fix-cve-2026-34155.patch
> new file mode 100644
> index 0000000000..dccb6f0d4c
> --- /dev/null
> +++ b/package/rauc/0001-fix-cve-2026-34155.patch
> @@ -0,0 +1,219 @@
> +From f482e9f2ce34697844332db531b4b8be1e4b6043 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@mind.be>
> +Date: Tue, 31 Mar 2026 08:49:13 +0200
> +Subject: [PATCH] Fix CVE-2026-34155
> +
> +This is the concatenation of the 2 upstream commits that make the actual
> +change between rauc v1.15.1 and 1.15.2; rebased on top of rauc v1.13
> +
> +===============================================================================
> +[1/2] src/signature: protect against integer overflows with BIO_new_mem_buf()
> +
> +BIO_new_mem_buf()'s len argument is of type int, so it cannot support
> +lengths exceeding 2 GiB. Reject larger lengths and additionally check
> +that we have created the BIO correctly.
> +
> +These are only internal checks, GError handling will be added in a later
> +commit.
> +
> +Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> +
> +Upstream: https://github.com/rauc/rauc/commit/bbdf9f04a96a7094e11cfa822d695bc7f33dbf61
> +===============================================================================
> +[2/2] src/signature: reject plain bundles with payload exceeding 2 GiB
> +
> +Due to BIO_new_mem_buf() only supporting buffers of up to 2 GiB, we
> +cannot sign or verify bundles with a payload larger than that.
> +
> +This fixes an integer overflow which would lead to calling
> +BIO_new_mem_buf() with a negative len, which will cause it to use
> +strlen() to  to determine the buffer size automatically. As a result,
> +the buffer is truncated at the first '\0' byte in the SquashFS header.
> +The first 4 bytes are a fixed magic number ("hsqs"), and since a '\0'
> +byte appears within the inode count field at bytes 5-8 in most SquashFS
> +images, the resulting signature will only cover this part of the
> +SquashFS header.
> +
> +As we sign or verify the payload directly via OpenSSL only for the
> +'plain' format, the 'verity' and 'crypt' formats are not affected.
> +
> +Fix this by checking the content size before calling cms_sign_file() or
> +cms_verify_bytes(), which call BIO_new_mem_buf() via bytes_as_bio().
> +
> +Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> +
> +Upstream: https://github.com/rauc/rauc/commit/662a212fc16b736bfed163ebb7349a53881803cd
> +===============================================================================
> +
> +CVE: CVE-2026-34155
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/signature.c  | 32 ++++++++++++++++++++++++++++++++
> + test/signature.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 78 insertions(+)
> +
> +diff --git a/src/signature.c b/src/signature.c
> +index 88f6e790..ca06bfa6 100644
> +--- a/src/signature.c
> ++++ b/src/signature.c
> +@@ -414,11 +414,19 @@ static BIO *bytes_as_bio(GBytes *bytes)
> + 		g_error("bytes_as_bio: no data");
> + 	if (size == 0)
> + 		g_error("bytes_as_bio: size is zero");
> ++	if (size > INT_MAX)
> ++		g_error("bytes_as_bio: size is too large for BIO_new_mem_buf");
> + 
> + 	bio = BIO_new_mem_buf(data, size);
> + 	if (!bio)
> + 		g_error("bytes_as_bio: BIO_new_mem_buf() failed");
> + 
> ++	/* ensure that we've passed the data correctly */
> ++	const BUF_MEM *bio_mem_buf = NULL;
> ++	BIO_get_mem_ptr(bio, &bio_mem_buf);
> ++	g_assert(bio_mem_buf->data == data);
> ++	g_assert(bio_mem_buf->length == size);
> ++
> + 	return bio;
> + }
> + 
> +@@ -1420,6 +1428,7 @@ GBytes *cms_sign_file(const gchar *filename, const gchar *certfile, const gchar
> + 	GError *ierror = NULL;
> + 	g_autoptr(GMappedFile) file = NULL;
> + 	g_autoptr(GBytes) content = NULL;
> ++	gsize content_size = 0;
> + 	GBytes *sig = NULL;
> + 
> + 	g_return_val_if_fail(filename != NULL, FALSE);
> +@@ -1434,6 +1443,17 @@ GBytes *cms_sign_file(const gchar *filename, const gchar *certfile, const gchar
> + 	}
> + 	content = g_mapped_file_get_bytes(file);
> + 
> ++	G_STATIC_ASSERT(INT_MAX >= INT32_MAX);
> ++	content_size = g_bytes_get_size(content);
> ++	if (content_size > INT32_MAX) {
> ++		g_set_error(
> ++				error,
> ++				R_SIGNATURE_ERROR,
> ++				R_SIGNATURE_ERROR_LOAD_FAILED,
> ++				"Bundle payload size %"G_GSIZE_FORMAT " exceeds maximum for bundles using plain format (2 GiB)", content_size);
> ++		goto out;
> ++	}
> ++
> + 	sig = cms_sign(content, TRUE, certfile, keyfile, interfiles, &ierror);
> + 	if (sig == NULL) {
> + 		g_propagate_error(error, ierror);
> +@@ -1479,6 +1499,7 @@ gboolean cms_verify_fd(gint fd, GBytes *sig, goffset limit, X509_STORE *store, C
> + 	GError *ierror = NULL;
> + 	g_autoptr(GMappedFile) file = NULL;
> + 	g_autoptr(GBytes) content = NULL;
> ++	gsize content_size = 0;
> + 	gboolean res = FALSE;
> + 
> + 	g_return_val_if_fail(fd >= 0, FALSE);
> +@@ -1515,6 +1536,17 @@ gboolean cms_verify_fd(gint fd, GBytes *sig, goffset limit, X509_STORE *store, C
> + 		content = tmp;
> + 	}
> + 
> ++	G_STATIC_ASSERT(INT_MAX >= INT32_MAX);
> ++	content_size = g_bytes_get_size(content);
> ++	if (content_size > INT32_MAX) {
> ++		g_set_error(
> ++				error,
> ++				R_SIGNATURE_ERROR,
> ++				R_SIGNATURE_ERROR_LOAD_FAILED,
> ++				"Bundle payload size %"G_GSIZE_FORMAT " exceeds maximum for bundles using plain format (2 GiB)", content_size);
> ++		goto out;
> ++	}
> ++
> + 	res = cms_verify_bytes(content, sig, store, cms, NULL, &ierror);
> + 	if (!res) {
> + 		g_propagate_error(error, ierror);
> +diff --git a/test/signature.c b/test/signature.c
> +index 7fc9a4f3..7a16c1b1 100644
> +--- a/test/signature.c
> ++++ b/test/signature.c
> +@@ -10,6 +10,7 @@
> + #include "common.h"
> + 
> + typedef struct {
> ++	gchar *tmpdir;
> + 	GBytes *content;
> + 	GBytes *sig;
> + 	GError *error;
> +@@ -23,6 +24,8 @@ static void signature_set_up(SignatureFixture *fixture,
> + {
> + 	r_context_conf();
> + 
> ++	fixture->tmpdir = g_dir_make_tmp("rauc-XXXXXX", NULL);
> ++	g_assert_nonnull(fixture->tmpdir);
> + 	fixture->content = read_file("test/openssl-ca/manifest", NULL);
> + 	g_assert_nonnull(fixture->content);
> + 	fixture->sig = NULL;
> +@@ -39,6 +42,10 @@ static void signature_set_up(SignatureFixture *fixture,
> + static void signature_tear_down(SignatureFixture *fixture,
> + 		gconstpointer user_data)
> + {
> ++	if (fixture->tmpdir)
> ++		g_assert_true(rm_tree(fixture->tmpdir, NULL));
> ++
> ++	g_free(fixture->tmpdir);
> + 	g_bytes_unref(fixture->content);
> + 	g_bytes_unref(fixture->sig);
> + 	g_clear_error(&fixture->error);
> +@@ -275,6 +282,44 @@ static void signature_verify_file(SignatureFixture *fixture,
> + 	g_clear_error(&fixture->error);
> + }
> + 
> ++static void signature_too_large(SignatureFixture *fixture,
> ++		gconstpointer user_data)
> ++{
> ++	gboolean res = FALSE;
> ++
> ++	g_autofree gchar *payloadname = write_random_file(fixture->tmpdir, "payload", 1024, 1234);
> ++	g_assert_nonnull(payloadname);
> ++	fixture->sig = read_file("test/openssl-ca/manifest-r1.sig", NULL);
> ++	g_assert_nonnull(fixture->sig);
> ++
> ++	goffset large_size = (goffset)INT32_MAX+1;
> ++
> ++	g_assert_cmpint(truncate(payloadname, large_size), ==, 0);
> ++	g_autoptr(GBytes) sig = cms_sign_file(payloadname,
> ++			"test/openssl-ca/rel/release-1.cert.pem",
> ++			"test/openssl-ca/rel/private/release-1.pem",
> ++			NULL,
> ++			&fixture->error);
> ++	g_assert_null(sig);
> ++	g_assert_error(fixture->error, R_SIGNATURE_ERROR, R_SIGNATURE_ERROR_LOAD_FAILED);
> ++	g_clear_error(&fixture->error);
> ++
> ++	g_assert_cmpint(truncate(payloadname, large_size + 1024), ==, 0);
> ++	gint fd = g_open(payloadname, O_RDONLY|O_CLOEXEC, 0);
> ++	g_assert_cmpint(fd, >=, 0);
> ++	res = cms_verify_fd(fd,
> ++			fixture->sig,
> ++			large_size,
> ++			fixture->store,
> ++			&fixture->cms,
> ++			&fixture->error);
> ++	g_assert_false(res);
> ++	g_assert_error(fixture->error, R_SIGNATURE_ERROR, R_SIGNATURE_ERROR_LOAD_FAILED);
> ++	g_assert_null(fixture->cms);
> ++	g_clear_error(&fixture->error);
> ++	g_close(fd, NULL);
> ++}
> ++
> + static void signature_loopback_detached(SignatureFixture *fixture,
> + 		gconstpointer user_data)
> + {
> +@@ -828,6 +873,7 @@ int main(int argc, char *argv[])
> + 	g_test_add("/signature/verify_valid", SignatureFixture, NULL, signature_set_up, signature_verify_valid, signature_tear_down);
> + 	g_test_add("/signature/verify_invalid", SignatureFixture, NULL, signature_set_up, signature_verify_invalid, signature_tear_down);
> + 	g_test_add("/signature/verify_file", SignatureFixture, NULL, signature_set_up, signature_verify_file, signature_tear_down);
> ++	g_test_add("/signature/too_large", SignatureFixture, NULL, signature_set_up, signature_too_large, signature_tear_down);
> + 	g_test_add("/signature/loopback_detached", SignatureFixture, NULL, signature_set_up, signature_loopback_detached, signature_tear_down);
> + 	g_test_add("/signature/loopback_inline", SignatureFixture, NULL, signature_set_up, signature_loopback_inline, signature_tear_down);
> + 	g_test_add("/signature/get_cert_chain", SignatureFixture, NULL, signature_set_up, signature_get_cert_chain, signature_tear_down);
> +-- 
> +2.53.0
> +
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
