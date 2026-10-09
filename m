Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D77CA6012
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF9D813EE;
	Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpfyGPVuvosR; Fri,  9 Oct 2026 07:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C4881813F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791532188;
	b=lGTUxde3qjKJugvXK/5d0XlkTZiSD6pr+9QJZ7cFFq1+OmeXUz2YMd1+7NpexTeFTBX+
	 wxJ4ug7ItWR3dWhRsxFBCVogBIPvZ8y9WYo2nZ8A2ktN6NhfnDMBA9I3O8g9knKMMRQlA
	 +sFoEIQBOW+2bTRoRpn21Q+5Sdu0Jjh1TBXjNtz4Dlxg0jc7Od326uwX2E1TVz9AqfUXk
	 ETQhJlBpVmBVYWooGEZtbIruZziATCXdGzlfTPA1OyS34u1X+0wvGJgJUkzgKUhAb7YY4
	 VNjVsw8F8Lfo/hOMfURApUfAnbs3FHbKN9gSmobaMofCuRFCS1YjOnwUNLnSKUZA4Uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791532188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LjNuYLlRfeXK0KFeZKYl84Z9mQt3jmImCafryT6mXKA=;
	b=JADkx+E259UonO7mwnxPIM2eO3i456tDkUA5ZVNqkLVviRsyDkLhyAHYyxsB0O5yN0Dy
	 Piubbg7e8z00zkBN1/GCh/sh9j7o2u+KQcuaR9rALc+sw0erTUCLL0khPMez0gOtx3r1k
	 AmUaSNSFCC1W8BFsL10PYm2cA+Yf0n7CtpZt4QbEeaYIp9Qqx1praprchj43/BBBpa3ZE
	 d9FzsUIgu7p7kS0ExkDCzarkZO4sP3prXkT6Jx9YJs8ucjahf8ms/E2MvVaSJoTpis7RF
	 DpFZY4q+6t9n68IcVubBp/7BgL6CqwYl/kH+RqOqY5vr+FAQ1NG3Dn5SHZ1HHSbsTLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791532188;
	bh=LjNuYLlRfeXK0KFeZKYl84Z9mQt3jmImCafryT6mXKA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdtYruDoGlGa0YGKJbQyOZFfXrLClOo7yhx0Crk1+4daQF9rllEqnFuZIG82ZrzsN
	 zUT661CyhxOqYainENLllrQe7WR4kp7nCBACWUTfVRqPQ16msLa5p1n0/TaFAG8guy
	 pp9dYUeJbw8gD5xopFBG+1yJUlfwg8mRBI6yRMawd1025LP4oVRmhnYshiGvLXbrIy
	 VW8JnPinX7fVI6WoFmbY9vbC2Q1VNqODBBRfcXZutnTiQdbOdw/bX6c/KCiqxKdRlV
	 PL4PQgN0Z4bR077GOspxUbW7hx617WXGOQlyUUv3gBurq8/iGm0FJdBspzedFhe/Ws
	 kYajLRisY5dZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4881813F5;
	Fri,  9 Oct 2026 07:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 109FA75
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0262A6084A
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJU38UUl_J1U for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 07:49:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7B0B606A0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791532186;
 b=lbpw87K1fxXVTm1w9cGsAznxEsDhUcTnDii2S/N/JrFr6ALpuP+cQg8xNJil4Tv1MkOp
 eo2mkuQGXrmYc7mdiDZ67Cumz9yq//EYtK3GsOMbEW9nKl3ZVmOC3fM8/UyE7ECPRktIT
 r2fKasgVpDBv0NM/AA09kSnA+OPebHiS19zkkiX8JHYjQJZhLA/UXNdAbFIm9lM1r+zIq
 owVWg5ZcIpW6yL7Yt3IOA6APxf3SsHmIDSfojyz8z04uJ9SD3zsUHR3KOVhnck4G8snTf
 /2i6LCNrqbHuo7Wd8No4YnvQ+exSuAXVGNNS4ENV4AA2cX7uML7Cp8D40WW+V1HZdIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791532186;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zviC/GXogNPoyUP3SYn9BqsamdBn8aXS1+1OxfvK9DY=;
 b=h9PAa6u93/ODqqsglauME/ubqTJEwapABfLL95ghqsXh2BL4L32DFiA2MYTdhT2SKDa/
 QkjEETiAsbRGDWikUE72DY9CmfxH2VCYOZjJcUPFuwdTl+nTvJx2/B62dgK5L2vmBhe1n
 XVtWqS1rqozPU73QbTkDNbGXdu343jeeKqxj3dk+0TJwe3uvEosBiG/zoD9OpbIdeZooe
 7cZz9zB/UH6aWW0CLtE5foRiAM7cq0j8bdV/aFviJeXtUWtMWhl8505iOVVYHj66Y0Tf6
 oqTKDP3ra65mJXVThE1YbzpvyB1KuKkASfj/GNw0raWtWw2IRAff3yIks3we9KZ4sUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OO5s3uby; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OO5s3uby
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7B0B606A0
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:49:45 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c31a34de844so111025766b.3
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791532183; x=1792136983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zviC/GXogNPoyUP3SYn9BqsamdBn8aXS1+1OxfvK9DY=;
 b=OO5s3ubyW/rbB4A46HQ76ZmY7lPIOdk9GCtvxZWwzFhnUJKNqXUO0zyTdoyEfzW78v
 YNtuuM73RrXwaZIsWiN25Pycom43cj3t+q0YNN5EpEObd3QYqjK7tuOhcoLHDrJbzhUj
 IseIul0GbBn8tv7PD71SWU6/wziB6V8zCw401jPbia9EMTj+fTtrGdmREvA8nnXVms9J
 Agfz67anII09h2At5KxbQVSNYiX3o57j1zwHur0BSFO95PHhRNAp2jEJED+Oxu4pJeta
 7q8AByFuWSBiSAJN8GHJjMjmiF9heuA/rp+xk0EirF986OhUR0gL049/8l6LYegmUeqB
 Fh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791532183; x=1792136983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zviC/GXogNPoyUP3SYn9BqsamdBn8aXS1+1OxfvK9DY=;
 b=uYIsmFRji3Zi/l20ighLa9wnNaFfguaOliakE51Z4M6NSuNRgMtzfGYf4n+qyKPd9D
 b8vuKShNGDQsgTFeb6KQMwFzHUo5CUegRyUq5qyLt7miykAjzcdAtX6fc5nPX4WpG8CM
 6mgs4rVHEWWy+nBtJ4S7FLiiwlYt1OlMgjiY+rLLrwA3k/qLhNDB4xRgB7tE6HL7s8Hl
 u/TGiLu2mE+vxJDe/TnP229AtFGHshsWywoyR2pGrbTEANbW3242Eu6d0cmI2Ns7JLt8
 ZX453LiIbZfuWaFukjJWwn4Z4aQ1YfXUKN6XC7eZouaIUbzirk5OPCvUd8a5NWgzMkrM
 XV0Q==
X-Gm-Message-State: AFq9FYKfeZL3zG5C7dX48HGPdT+HNcM7mJzL7yxGvGPkgMT0ZOZiXzIO
 r3tth69zZeLmxIPc1EMG/1rViHeAP0TA57mkaiMtSjJ3BGLDCbtYkmFBLLnDhQ==
X-Gm-Gg: AYBFou38H2+ljfTnoCZJN9O4t8JKQc5z1d2slHKLKuhETpUpKlbkJCXGtvkM1aEO8vG
 QzMg0p4VXGu/PSTMyJq+Xkwl+N9EuDB2KBnxUKSVFCm6Wf0KvioaSJtkprAEQvEDkpLtQNvQBXs
 USvbnYfJ4ZXQCKApEJFhI1emMJ9sy6eOvLQ45i8Wyly/uchqJ9LwlYeDdeaUKw4AQXsiKCfsMBL
 9Lf36EGy7zy+vXfG6HgViTvX9v9moMrE21mTix5IHDQknyF0zoek9z4DM42z7pFcjdtp1FA5moQ
 KfNYWTtKJYssSkqd2KFOADH8MOTDBV6RFImWZ1ZhZplD+XMVxX4E5pqO8Cq3Z05VbnV3oTGQjiF
 46GUPxjb5LdwHbBL0aNClTNUjmzAV3jk5Lm0LOX8M31pzCdmsSBZmKHMyXdcy6cONQEoHVSslz+
 JzWjTmv+DEooHeum79zVxUTtMaTZZevJlBvHsxBOIsrVi70K/rluVloLXpZDClZfj5QFjsmQIu/
 ivxuFBPSwaSXYvcZoDgGXKH0A/PmnTJprlUghS1XKuzlF6Z6A==
X-Received: by 2002:a17:907:3ccb:b0:c31:5d7a:eb97 with SMTP id
 a640c23a62f3a-c31aa0b47ddmr103909566b.40.1791532183350; 
 Fri, 09 Oct 2026 00:49:43 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C249B.nat.pool.telekom.hu.
 [37.76.36.155]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a38050sm56277966b.24.2026.10.09.00.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 00:49:42 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri,  9 Oct 2026 09:49:36 +0200
Message-ID: <20261009074937.992939-2-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
References: <20261009074937.992939-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/libusb-compat: add option to
 build/install examples
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

The examples are not installed by upstream, and their names conflict
with other packages (lsusb from busybox/usbutils, testlibusb from the
libusb examples), so install them in /usr/libexec/libusb-compat/examples.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/libusb-compat/Config.in        | 11 +++++++++++
 package/libusb-compat/libusb-compat.mk | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index 076d7b8d77..5efa9bbe3d 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -5,3 +5,14 @@ config BR2_PACKAGE_LIBUSB_COMPAT
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
 	  http://libusb.info/
+
+if BR2_PACKAGE_LIBUSB_COMPAT
+
+config BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES
+	bool "build libusb-compat examples"
+	help
+	  Build and install the libusb-compat example programs (lsusb,
+	  testlibusb and hotplug_monitor) in
+	  /usr/libexec/libusb-compat/examples.
+
+endif
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 4e78a213b7..c8dabe2068 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -20,5 +20,19 @@ LIBUSB_COMPAT_CONF_ENV += \
 			   |sed -r -e '/\(SONAME\)/!d; s/.*\[(.+)\]$$/\1/'`
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT_EXAMPLES),y)
+LIBUSB_COMPAT_CONF_OPTS += --enable-examples-build
+# Examples are not installed by upstream, and their names conflict
+# with other packages (e.g. lsusb, testlibusb), so install them in a
+# package-specific directory.
+define LIBUSB_COMPAT_INSTALL_TARGET_EXAMPLES
+	$(foreach example,lsusb testlibusb hotplug_monitor,
+		$(INSTALL) -D -m0755 $(@D)/examples/$(example) \
+			$(TARGET_DIR)/usr/libexec/libusb-compat/examples/$(example)
+	)
+endef
+LIBUSB_COMPAT_POST_INSTALL_TARGET_HOOKS += LIBUSB_COMPAT_INSTALL_TARGET_EXAMPLES
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
