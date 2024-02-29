Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446A3C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 22:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2A841D78;
	Thu, 29 Feb 2024 22:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_4PaHhf57Zv; Thu, 29 Feb 2024 22:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFDE641DB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFDE641DB3;
	Thu, 29 Feb 2024 22:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3EA1BF368
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BAAB82ADD
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 22:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwHiqO6kAHDp for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 22:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE00A81FBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE00A81FBC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE00A81FBC
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 22:41:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412b41a1294so10717215e9.3
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 14:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709246485; x=1709851285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=de9RD6XG/egUHedUUiX28IHr6aoEiJVTEfa+lk5tdiQ=;
 b=KCSQdTz8r79IesvRpGBs4UIzR7XFb6vWbb9ntNoofER+irJ8UQ7RujK3jd1L2amOfq
 rMdvw0dLtrtDMREvZiKl5HorlRtAvkYXL1FfwacaPVpiNRZ9zZ7KGqBv/0oy4ZO3xRsx
 2NuasBntiTIdHRbXqcI6vLYchT4s5Q/kT1XKjeoDOE0OUrbYSpQ7jUpwWLiPWXqKIa0c
 yi+LnXG8JKA+EekZnOkJIz3aCP+e2zvLKhBqZ5N+geGWhyYFMJ50pgpDZouQBcx3z2nn
 /XAzzBv56GFBOpgpAyS0BYFAEX6aD8Sn1/ve4gIHzG0Q9o2kxno10KfFV52XYaSo5AjU
 6EHQ==
X-Gm-Message-State: AOJu0YzjFaP7PWogBMXw0a5ZXoCK26qF8Ba/LdPZTy/vLebgFfwi6TrM
 NXGUHvkcOiQs6kp6vpo4/H8U1QRu5z8v3ByNdeESoXTvhRCgvthh/5iyTGKQyJFT4as6R+x9CZ3
 5
X-Google-Smtp-Source: AGHT+IHkZTK/YHtOC3/uztkOsUjLvB66mBuic/rk1+ddtS+T8rEb+tssQ3JmOfDQI8IwOlVz4dzfMg==
X-Received: by 2002:a05:600c:19d4:b0:412:b7a6:72bf with SMTP id
 u20-20020a05600c19d400b00412b7a672bfmr43485wmq.3.1709246485412; 
 Thu, 29 Feb 2024 14:41:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jh1-20020a05600ca08100b00412b944b58dsm3300481wmb.15.2024.02.29.14.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 14:41:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 23:41:21 +0100
Message-ID: <20240229224122.1085300-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229224122.1085300-1-romain.naour@smile.fr>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709246485; x=1709851285;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=de9RD6XG/egUHedUUiX28IHr6aoEiJVTEfa+lk5tdiQ=;
 b=D+drFNng7wcn9FXeOUp/Pv4OTs4YRGAdxLR6UCAUjoc1VqJQgAaSa5LXXOpaab+rrd
 MYFyGzvO9MfyiQi0nQFQBKaRnac9NQh3/gysU7tLyd2R3Q0bWxqDRW4BtR4bHQGklHCe
 7Zxi2G5knFhvGxZ1PRM8AnzWH/CIaWRElPoOTr3i3Zb1VpzfPYAlTjHux3k6QdEvnKlV
 gAFK/KZBWEdmCU/EziakcNUCYexYJFMkd8Iu5L7Zsn+9127K6ZiVuNQq6OlPASq6MQv8
 qzsITfRf7/LiqtkP1F/IoOS7wDQ02FAJeg+FYpltt7hosU4PQH/rUtuOho+nvFkYL33Z
 ix/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=D+drFNng
Subject: [Buildroot] [PATCH v2 2/3] package/rust: use host libraries from
 HOST_DIR
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

host-rust package depends on several host packages to provide tools and
libraries but it doesn't take into account HOST_DIR while building rustc
compiler. Indeed, rustc needs zlib and fail to link if zlib is not
installed on the host.

  error: could not compile `rustc_driver` (lib) due to previous error

If zlib is installed on the host, we can notice it with ldd tool (while
it should be linked with the one provided by Buildroot host-zlib).

  ldd [...]TestRust/host/bin/rustc
  libz.so.1 => /lib64/libz.so.1

Provide HOST_LDFLAGS using llvm.ldflags in config.toml.
(HOST_LDFLAGS provide -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib)

With that fixed, rustc_driver link with libz from HOST_DIR but the
host-rust build still fail later due to another issue.

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6256881545
http://autobuild.buildroot.org/results/a6b/a6b28783f29e6b729824bf42679a62f72ad5bee0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: no change
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 16a397407f..4903060368 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -65,6 +65,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
 		echo 'ninja = false'; \
+		echo 'ldflags = "$(HOST_LDFLAGS)"'; \
 	) > $(@D)/config.toml
 endef
 
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
