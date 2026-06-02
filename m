Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EBDCD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A4A81EC0;
	Tue,  2 Jun 2026 07:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKZWXc7xZ2fP; Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7814C81EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385230;
	bh=uBPR7XD6sq7op0Dv6VdGtqJt1pz+E9CL3U1r8MOd1E8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e7OmoYr8fQQr+zRnxQ7MlbfQP6zg41pRGhxgpwdC7z6bymIExy5bAK7kkWRGgoUei
	 k9/ngqkS5k8bGDBNTxJmSjKed+7+tUtAhE5UOJrm9OKcfCXaXu/YiXhNEQQ/cV64Tu
	 kIiY4+cTyv9tl0H/kyJVk8fZYYn2IQLGia6G547baOwikecM8WuqbyVUqubBFmi8MZ
	 Y7/GAJGc79tfS2zDDefEqYIKZDjWwfOsdEaEXAyrW3w34yW+UID3kQdNhVqmi9ap3i
	 2QQ6r/NG193a3SCbpUKaifpyDyNcuoKqwCHoADH+NJYkeQeHeC7X7XApOURwNwBgIv
	 euZEtj1+Grf2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7814C81EC4;
	Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0808333C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E21D9404DC
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uNH0fDWGtt2 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F8D1402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8D1402C3
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8D1402C3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so38467595e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385226; x=1780990026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3rnJ0FaQk5ggK1+y9bfLb4zqau2GygoG6Wz3YirpzU=;
 b=EWh5D/wimZnLdp+43gN4LSZyE+q9EVO+Knq7BZm7WJPHe3yTuNM64Kw049XTONdGGi
 XrzJJUxO1ea1A5U/llAPzJCqq9255yEALyEVwCkFkP83lo6z3uUMHIhpK3nxvqSNJL3C
 IqwuRqbkDS4xFMDoNg/fq2cWb4SEVKaZyN0KUqgU4dVwQHnHzs/DJFpDDL3Aq18sGjak
 pbTUYEhdyGPNMUXl9MOxOWHkaypyGdId90VMn5OYS2DJNHPD/uZhok/qvZntoxitgxJ4
 EulZMAteUfUuDzDjOAArcb2N+UturI5CR34H7Y298wNdJST72WMNXOGFcDn8aTeX4mU8
 f3kw==
X-Gm-Message-State: AOJu0YxNOhm5O/gEOX+mQbOzT96nPJ0IpInlWGfFw/8SR/gskOY1pZrp
 paIuGYj8rR/ZaL1rVZZu37qpCFhfRaO00brHpziuIVXnXjRn4uTBinUi7NFTYTofkB69B0tjjf4
 9Qpos
X-Gm-Gg: Acq92OE7ONmpKPoB3fe1jSgv9d2yapJ3vb3yTPTL0pkDLE0R6psNVQ+QdDPd8+sepso
 AsXdgi0LUbtg+cX7pHqT9K7TR/rfRJOQTQVW2IoIo1SWoTpy/NFye6wfn2wUrW3EollYVwip2aO
 XJ6ovI6/i0yxMZMFY3QHzvYKIsoxC6n1qIensbpmAXkHD1YSmHn886lN79G3gNYW3Bdl4z+36TZ
 gjz03VBMkYdttmcifoWMf3vkUqopls5JuGO6sumPFuc51Y5jUJL/adNRfXYbnDMUrvmstAjrtMr
 ytDexRqePzYGmB1FEKaXjURtM1XPLSyCZOq9dIIBqrHcCCbdzAqN5znjjIGRdBMeQhKtzOE8SGM
 b6gSl7TtJnZJhjnD+3rGpXx6yq/732AJSd0akOlY+c+sLDoLhnI0k4ttiXqvPZLmuFv6zOPSGGk
 QSdY/f8pZIYPp+M7bH7rKCPlWc5zNTEn+88ZdAg2D8Vsq6vE0qO5HlJXv11g==
X-Received: by 2002:a05:600c:4fd3:b0:48f:e230:d5ab with SMTP id
 5b1f17b1804b1-490b0704533mr55544965e9.31.1780385225850; 
 Tue, 02 Jun 2026 00:27:05 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ab75sm93869395e9.6.2026.06.02.00.27.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:27:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:27:01 +0200
Message-ID: <20260602072705.43945-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385226; x=1780990026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3rnJ0FaQk5ggK1+y9bfLb4zqau2GygoG6Wz3YirpzU=;
 b=gsTUrG/TtimihVK3c39cUfb0/+Kih/vTlJ6G5pCPM9ABb8mAgJrahSLO3RGe9BPfLd
 CoJnV4KyApb1ylGM2KHnMwr+sHR3Yc3/f3dueZF4E/Ht6tcqbxWqrf2pjuR7XM5zoYjd
 zMovpC+MwvlORX/lpQmTvbVMA7m6dgPEY5D6jL6n/y+b0usMr1Tp395wPdMggIWe1cqi
 olKWCXwcMmVt9cZTcN0X5SiJdwbphQ32FcvLuI8FHgtf0xbLS590STGt89cSN09yY5Hl
 gZa12ykLbQyVC1sOn17D4mhItQtn9Ajm69TwtyY6vQp8291gbyDmw5an0eo7Ha9K6wYt
 Oggg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gsTUrG/T
Subject: [Buildroot] [PATCH 2025.02.x 1/5] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a33548c355..215a69e51f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale just wrong NVD entry.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
