Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B204C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4830141DD7;
	Thu, 29 Feb 2024 22:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15MQLlfIyvyG; Thu, 29 Feb 2024 22:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3905141DE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3905141DE7;
	Thu, 29 Feb 2024 22:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5D61BF368
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE8081FBC
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpJ7Bh0-Vxiq for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C09B8210A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C09B8210A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C09B8210A
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:41:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412c780464dso116515e9.0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709246486; x=1709851286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieQp5HkywGuFJ1wzuGbkrN9KzVjgrcpQp9br8nEGuEM=;
 b=TH3zqmMsvNPMs4HIRvMi3HKTKJsbITUMuEIWGZa/VUXdmWv/dfhQ9fG47HSj/C3bQP
 bpYgF46PLv3usr7cuexS3wo8oMyCvwzT1zvbf5+IPS+BvXifPpyjEvhordqZweByFDwK
 h/rV7b+11qGVFlRDuwZgc7JRTyQtnFHM6mGJXJo/9ED5qIkSoWQ0tkTW0ow24hqAi+U7
 mGW60RERjYcegaAy6L7d4ltgIjIORzC1qaTtcFz+5AEu6p/PiOcYXicNGWNoP35hdt5e
 /XP7ydbDQZJ/T9+Kbke3WGZtn+xG1lCqalKoUZEPlhKTtPBVEHmt8cgWQ1a7J1EOU299
 fBZw==
X-Gm-Message-State: AOJu0Yxef9WHBZr9TrCxD7SwKxhNmh9k2K+Xb4VUfnuqG5+Kk/SMtJIr
 STQYB9neO8BwL9c7oJnK8EAKxpURyygGX8+l6zNcegppX2sZiurszJd1wjWAaXnj+RyjlyEWDn+
 H
X-Google-Smtp-Source: AGHT+IEQrKocw9Pg5F902G/aHfGyIM3tAXV9CtqIWRYv+RLyGL150dNSkpuQGTQuNYZRrfYN6Zby2w==
X-Received: by 2002:a05:600c:35cb:b0:410:656c:d6d with SMTP id
 r11-20020a05600c35cb00b00410656c0d6dmr35911wmq.18.1709246486034; 
 Thu, 29 Feb 2024 14:41:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jh1-20020a05600ca08100b00412b944b58dsm3300481wmb.15.2024.02.29.14.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 14:41:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 23:41:22 +0100
Message-ID: <20240229224122.1085300-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229224122.1085300-1-romain.naour@smile.fr>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709246486; x=1709851286;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieQp5HkywGuFJ1wzuGbkrN9KzVjgrcpQp9br8nEGuEM=;
 b=OJ94hGMk+USOObpl+2Nvr0HT4OiIOfXptMP7MCFITc4D2UyB2+ooxmVMNT6O88ol7R
 hSQnF8KbuNnryNxt1DuHmxwpeTihVu/L26XuYL6GQnzXPZufoFXtXVh3qurLW2ynRkyG
 CaIFaSkZGVWUPtFOSk+jVZqnS/fYyZy6RjYEqi5aqpL284muUmPUB+gtvfnuqaTY1x27
 flSPhqyMeEsxL6N8RbTTfVObMZ/jsE+jslh5rCybRf6R3vd0FYf5V6lhbIB77HaPfg4Y
 i0hugnJZ9h29nShtLGjY+bXQyc8/fsDXgRc8klnPkgTMb16ksOzXi0Xl/jikzgOfeVvJ
 +tDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OJ94hGMk
Subject: [Buildroot] [PATCH v2 3/3] package/rust: provide RUSTFLAGS for cargo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building the rust toolchain, the build system endup using
cargo (from [...]/output/build/host-rust-bin-1.74.1/cargo/bin/cargo)
to build some tool like rustdoc-tool.

But the host-rust package doesn't use the cargo infractructure (since
it provide cargo binary) and some cargo environment varialble [1] is
not set to crosscompile cargo packages in the rust toolchain.

For exemple, we usually set RUSTFLAGS="-C link-arg=-Wl,-rpath,$(HOST_DIR)/lib"
to force cargo using libraries provided by Buildroot in $(HOST_DIR)/lib.

RUSTFLAGS is actually needed to find zlib library (host-zlib) to link
rustdoc-tool when zlib is not installed on the host.

Fixes:

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02-rc1/package/pkg-cargo.mk?ref_type=tags#L167

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: no change
---
 package/rust/rust.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 4903060368..394fbfa4ca 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -70,7 +70,9 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
+	cd $(@D); $(HOST_MAKE_ENV) \
+		RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
+		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py build
 endef
 
 HOST_RUST_INSTALL_OPTS = \
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
