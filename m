Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94862C5B56A
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 16:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1338980EA3;
	Mon, 10 Aug 2026 16:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFZp_Q1p2pn5; Mon, 10 Aug 2026 16:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D0F80EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786380701;
	bh=hLrYSAm5V/IWUJ82kO1MFqbK2a9wfZvCe2UkxT6mFH8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7+CcJ7ubZIBTystML72tr4nOqalnx7qgvxNJfL2jdfpXV9qWQg/opokVNjkpLnVV
	 liMciOSW/5W/OmwhiepAkBgwjEJNwWzojLp9P3PU1GEbvhdPdus/Waj+mU0RPDXqeR
	 QAfucOaScoPTjUssBzLY2IcIJUzAR3y8Hb+Ffo5UC3qHUZMAt+urC9KLwnrWw97fW7
	 nO/XAwjuZM72OIwkv2KvLdXmBG4NUOzLe7e9nwuSITs7trNon/obdSvsbaZRVQF7Fl
	 VGwGKK+VJe0M1E1ytTdmu83iE9rvwtdv/UDtsEkDHTN8ftjJuklZ5C2tgzEzZ57XGq
	 vBCSTPMvGgc9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D0F80EA6;
	Mon, 10 Aug 2026 16:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6B8823F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C88C40450
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC6GV22b08sS for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 16:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFD414043B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFD414043B
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFD414043B
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:51:37 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8484f229529so1557364b3a.2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786380697; x=1786985497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9+NbrMt7swfeUgzWZ3Up8JguyMNeAKCW/F6GAulJgL8=;
 b=lQcEZYE7WD2CmTeVXKPu4huAaUZ4/H92ub88ZLeHXZWLvKub976behynNWVLnrjfKE
 RI/uSaEUewqGe5U+at1uqIEO9HHBk3OmQExrpYUo3u3LynD12koViTkHs4EuUux4ERqd
 jst68ygAbYEV+TMP0VN10zR7a9v3w57IihOsqZNEbuWuumarAi/u34PMKZTpvin4tbWy
 Mmki24T39U7/Hug1nyfZX9dIgh9DYbb/0Nyw/vRfpGtRampIXoAUfggolhs51uJtr33L
 cOPxhDLUB7CW3Pje6e9yf2av3Vqo+SmLre/exe7juYOjdRTdfrh/XzOIIYKxrc/y2obY
 gqMA==
X-Gm-Message-State: AOJu0YzB5Gxl4sDzMjnujtmNX+/xOhizWLIQPlbcjBkja6WI67ffyj/Z
 Duxc8Pg6vrz199OjTKGNMb63aZT6kZ81tmJw6HoJRf3s/0uqnyEN7AGX0N4jWpQh
X-Gm-Gg: AR+sD10hRRqg0FcZssdfObggjdpNw1sm9dv8Zutx1Dd0xW4P3fzRsU6YJVEHDAZhs2/
 CQhgISrohdroHipMxVDa/PprFI+pNVpzGUR/tuwXX0/KHt/7TvcEvoh5T76MTgMg+4FZBOHNWdW
 1/VIp5MZWdA4kvqi53fr5GWduKPfekjRBcsu5cdUzpOEG5cAiyRUeEiNPW1xJu5IPbbb4+xeHwc
 D5+9XF1OmOtczb+OxIQlR4cX2oLKkpO1crqvEskAFcl68TXXklc8lWYGo99+cy2tJ+u8zc6mkq3
 Dk4uzXzdYzcVCUnZ1kFHL1328SdDzvALecCOYsxk/A78w+R4jeuu5+wmP0pHQ1rEOiK8zMIldQm
 AkShH4gGQGHDXqzaOR+uI5iHqxnE9qAFWKQj9jCB1cnd82KzdP4pH/Hl0B3mw5qjB8ZOYHvRoFV
 n1lzRtGjtRWMLIjFh7han8cgWnQjKh0/0EKWSuc0/QmnIwnSkZl/3uQckApHrw43kA1vUQCQ==
X-Received: by 2002:a05:6a21:69a:b0:3c8:e313:8d42 with SMTP id
 adf61e73a8af0-3cbce96f6dcmr24076510637.31.1786380696974; 
 Mon, 10 Aug 2026 09:51:36 -0700 (PDT)
Received: from fedora ([2409:40e5:1164:f0da:ce1b:8575:cc78:84c8])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be8d6074sm48409776eec.12.2026.08.10.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 09:51:36 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 10 Aug 2026 22:21:05 +0530
Message-ID: <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
References: <20260221081458.865721-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786380697; x=1786985497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9+NbrMt7swfeUgzWZ3Up8JguyMNeAKCW/F6GAulJgL8=;
 b=Levi70cx+EJXwacabaFjlCBUIn5oy2pbkirKsDmSAU0btn/hlEjahY81LeCbGq7H20
 WSvsPPFLyfEg9690fp/LuP/hTm869r6lLHWKK4nNp2W2oSqaoOsJPT0uYfXqlcNNv+uC
 54DQHy5s4uz1s2FasyMTFnEk7EtCfhcX1HnAESqQmY95sUXxQO2R2P19fysYTaOLYUKK
 mjC5W0UNbmlku0Mr9qTVqK4PO8F0O+YHUFeKTt2fWvdX4xC4/A1lDvTAGYoCehY3gTdM
 /aGtV7zjDjFum81Af4qiVEKVxcx00moZTgcFs1VoV+5wSV2qAtBHx3/Q18ZpwxO5aYzW
 6TCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Levi70cx
Subject: [Buildroot] [PATCH v2] package/libmpeg2: fix build with GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 15 defaults to C23, which no longer supports K&R-style empty
parameter list declarations used in libmpeg2. To avoid carrying intrusive
patches that rewrite legacy K&R-style declarations, pass -std=gnu89
to CFLAGS to restore the older compiler behavior.

Fixes: http://autobuild.buildroot.net/results/53d/53daf0b4bd8b476252ca219e53a966405ece7e51

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Dropped C source patch (0005-fix-getopt-modern-c.patch) and instead 
    fixed the issue by appending -std=gnu89 to CFLAGS.
  - Added Fixes tag pointing to the autobuilder failure.

 package/libmpeg2/libmpeg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index ec23dff57b..dd3008987e 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,10 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+# GCC 15 defaults to C23 which no longer allows K&R style function
+# declarations, so force it to use gnu89 standard.
+LIBMPEG2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 LIBMPEG2_CPE_ID_VENDOR = videolan
 
 ifeq ($(BR2_PACKAGE_SDL),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
