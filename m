Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F5DCA5FB1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 07:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A30881046;
	Wed, 30 Sep 2026 07:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFS_c63eqZTh; Wed, 30 Sep 2026 07:24:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B850A81029
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790753096;
	b=H06652TwPlc/8JU/BuJYOKuFioZ854Npn7pL0GzqGEZzSKE1MAOg5YncTrS3yiSHb7oK
	 oHMA42MeRx54U8X9rw2POn23fnbw9oaewN/MuKXbIUE7g4rDsYD/Hnpj1uzoZgrpXk6tl
	 FgjyXidAAufBJmNLy7T4ydWGJXwsUi5tEbRbPFwj8w8n8RgUbYGldifMGkjX9jbcGnOTa
	 2DkJgN37a5zip3A1LF5hbRfcFbZSljF7FYvic4cO9wQ2Q+REfWbdHQSBbHFkxz8G94/ph
	 LZCQa7Q4J5WtDEkX+G4g7wRB4eu29BgMcBzaJ+ZQgu8g4DoHdU6NOcfmatuznwuyyfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790753096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OXg06PZuJw7uJ+hqxvJDduKls7V81VF+F66G9VsI8CE=;
	b=Gecm2KY/L2F7eqgPheis3EJJK6lR+vAQCpTNWgYK0teAS+ahCi1nqE+5yXPMvXWJE3tN
	 BEISSHMGeo7aQYTnHqeYXGcLZz0VtNyT9i/wANCVipP0uwXJQ9//CgKxQDZhdcujuTe05
	 miuZjene94BEL7ayp19ErNv1LtfmvthY+tos/hl/Ju98e+R6VIojkRgJjzZhrFe7llSoU
	 Bzyn1QDYa+9T6AODXdwXvs8tBptvdHnFhdujgW34rjh0eGX/dI1UykQzyk5xUvfNtw6t6
	 rNw8G/uZFcqrg/oAiK4/PXiJ951QZ4gsbT7lIuMxSH3lgwRyYenZGCjQmw/JdDxY80g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gafhGvcu;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790753096;
	bh=OXg06PZuJw7uJ+hqxvJDduKls7V81VF+F66G9VsI8CE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MgIgucvzVROJCo14B/hxPW6n0SB8jj7rVj9a3TaJVF6LknPzn0+EnEPIMX/eY9oMv
	 tDTdf7f/fjPO4QpWSf4hoojme9GdeDNymMayY8ZjPtgIBh3d8LSzVZTY6sMcS5B8gM
	 g+bHodWFAx7/QPgO7BruZBMqRfZzEYNWJ4JKquvLLHoOXN3858/V6/oOkQTiq2GF5T
	 MnYxSE5flR2ZilCX+BMtZaemHmAy6oMLmHLfrl0jGneave+yaZz0vKPBIoJFRwbPUV
	 fH4AaV5trHRnKg6+THEHjfqf87aEYGbSDwG1/nnAIT21OgJI8ONvM/AocE5QgSImB+
	 jnixGP0JNhBig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B850A81029;
	Wed, 30 Sep 2026 07:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E53C3D8
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 07:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F62081029
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 07:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNeOyML3kdPn for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 07:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0F49280FFA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790753094;
 b=YvdCaRUQRz5qGvvWlZ/m0q7wkQf242QD2JFqK2aH0+cMuyO16e004bJjgh7Snh30C+Pw
 /ez119ihrM0zChJg0hQDoO4E2TZfO/UO4+mzmYmDkjrprGmEapT3YD3daOu8v3MSdRmE7
 VMgSIl3iC8D35oa5M9QiaA6leR6Hpc4BFWkR05fD9SqXTa673JUXnTRqw55jFgLoKp5cw
 IU8ZfPisiMu1aosF9Tv2Qd8OU/W1rODUr1xi0IA6e2EO6NNwd1L7I5Pq2SEvSkONSnkgy
 yjM2QZ+rh8xmRfen0Jbem4fkFcg2PnPmH3qsqvhsL0bd7ZHOqn7LCspRk7uJEDkkSyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790753094;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=jb8lewuyK/BXnpiDmC++VwKq4rzoaAdYzYJhXRw2eXc=;
 b=EbtvLijB+G8ldo3qCmCcsNDkvfcdXza7s8PD8JNx3y8kre2KzrvPLJJKwsT8vIbwaxAJ
 locRbuNqoE19fqAmoXyfCPGIuKTtfTGgsQIPXTa59EzjqKCVS6G2SO1YJT0GNiQEUs2H7
 wKwDy4G/KtR6q6Vb9ZIXbkzRmBfnwNfVMcleYqZroh5c216IwNI4lpfQzMtj2gT46fBx+
 aLPsGCim7LPqHzDSAu/1Cqn93iuA2ZrsIYkhmVG/rGshoKu8pOfSmp/aj1WHQwA1Uo9j3
 202vOvVeCjdo4CFsBsn7UBNr+LVME5XnkFL0pey1jR8nRzyKHXCm/n4YffPPWgEOoeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gafhGvcu; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thbt.cllt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gafhGvcu
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F49280FFA
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 07:24:53 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ffb83bf7aso31443795e9.2
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790753091; x=1791357891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jb8lewuyK/BXnpiDmC++VwKq4rzoaAdYzYJhXRw2eXc=;
 b=gafhGvcunxfLBy2nqJFPq7tS1VrUoVAjekRgQdF4wRQSQ77VbzsMTxtLuED74hEYn6
 TeRJHDOgtTpqfhk5DjHrMIynkbYzrAGtadT+/6R0CoQ+Dw3mJTJbQ2wA+/M/Jlc5Y8xX
 0IMLbc8YvPx733ran1hIhEz9XeY8ujifDxPigWs4PUnGVz0nkIXf18LqziAIeLy1lPZ3
 Z+Nf0SWRW2HFMP5l++2t87tsB13j80U2QWfGhwTqzWTzotIO5kNTcdR1B9yXQjuIXGVl
 rFfOhnn1pyAZOl1FjQaoULr1CJ/Eli7MwYKgYpa1K9nXbox2fz5UHuCwe84MDnptnJzh
 j3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790753091; x=1791357891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jb8lewuyK/BXnpiDmC++VwKq4rzoaAdYzYJhXRw2eXc=;
 b=ZMKfLVjzbvhzSBwmqsHG+rF93b3QCDNv8DAhPqrDHJAYdSVoeTQ1ChktPKaXtyC4L4
 NPM8P2yTXDO45dFg1S1YZhgg3zHBrS2OIH+oZZn8uRxLi798B/AiqWcAcxvoEfbRReWA
 kTLlRxuqaAwXfs1+NKxaXK5TIUJOmLZxdAaidrlvEzksvIczHyoPpdGXZZ4HVDSR2Yo9
 3nMRNNaZypno547RmspGn0YqDNDwK6s2QXASp9tMsELf/oa9dP9MkiP6x2fNEJVItNcN
 90ucOM8o4V8MXr2tpU3pTg991myK//2AkClP3aYKqlm45sOQIij4HpBahzEp8Sop/0z6
 SDPw==
X-Gm-Message-State: AFuF++kP2hngl5aUC2Ji7eNMmM+NROFjH0lKcBoeQDus9EYxf6MIuZvq
 YKhJjzwdYahVg2xMxIOF8zbr0n7n9iudyvhqRmtCu3gLlGj1B0fZWdMKnnbubQ==
X-Gm-Gg: AYBFou0KMKLBM4R+7xsGc1htYY14XHxJrTFAOITRlDH2jIqZIrz8SO9CScNFwwV0GTP
 gOw0AQ+yTESDInRt5Ml5BAnDEdFLGEYeFPZL/1WkGHO7BICMpPtI2vuI8K1IHgX91a221VAoN/l
 Ru2OcleFWWCoEXUcO190as2nNiDafVrAxdd0oH1EgrJb0+EEVXH8sl0WKUumpKhEbrmyF/ptolV
 7sVRnTwTD4wBljC+N0p3MubjJ7rwcXTUC5BESCqKkqKdgsWxJpNAG/IL5WZFjQCCiG6qJvVwHD/
 jz3oVZ+NFwT4cFHn6jAPqA177VN4sSwtSDaEXHSyOQ5cz63Yqbk6ghHxkn4367CHofictcEYX5+
 UH4Gt0k3cSo1vSBHScRkmg0OPYTt2ShVwXcexiNDG/yC6RiKLF7FasVtz5jvE3Z6Rvh54i3uyn3
 OzU2RVhTMAXHAs71R5iv82G46AGjfG38GsaunwtRKyxmTAtiY0ADLMRQgyB4uU8ZPYxNUbbeI0T
 dG2NvmERG5pTos+ACOcXxcqoCm5iybTPR9BduP3wCa5Ynr6sTDOVqS5qHLl
X-Received: by 2002:a05:600c:3b95:b0:4a0:37b:5c05 with SMTP id
 5b1f17b1804b1-4a01ab4e8a0mr9278295e9.0.1790753091476; 
 Wed, 30 Sep 2026 00:24:51 -0700 (PDT)
Received: from thibautc-ThinkPad-P16s-Gen-2.iliad.local
 (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01751613dsm30812525e9.3.2026.09.30.00.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 00:24:51 -0700 (PDT)
From: Thibaut Collet <thbt.cllt@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, vjardin@free.fr,
 Thibaut Collet <thbt.cllt@gmail.com>
Date: Wed, 30 Sep 2026 09:24:41 +0200
Message-ID: <20260930072441.174807-1-thbt.cllt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
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

lldpd bundles some uapi linux files for old distributions, especially
the types.h one.

Since kernel commit d4bf9e08d412 ("arm64: uapi: Use __u128 instead of
__uint128_t in UAPI headers"), the type __u128 is used by sigcontext.h.
This type is defined in types.h, but the old version bundled by lldpd
does not provide it. This lack leads to the following compilation error:

  In file included from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/sigcontext.h:30,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal.h:301,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
                   from privsep_io.c:5:
  ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
     81 |         __u128 vregs[32];
        |         ^~~~~~
        |         __u32

The uapi linux files bundled by lldpd are the ones of kernel 4.19
(https://github.com/lldpd/lldpd/commit/a192a2e91f81), and they are
prepended to the include path, so they shadow the sysroot ones.

Remove them so that lldpd uses the uapi files of the sysroot, but only
when the toolchain provides kernel headers 4.19 or later. With older
headers the bundled files are kept, so those configurations are left
unchanged.

Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>
---

Changes v1 -> v2:
  - Only remove the bundled headers for kernel headers >= 4.19

 package/lldpd/lldpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index f0cbc7e436..9ecf622b22 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -61,6 +61,13 @@ else
 LLDPD_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)
+define LLDPD_DROP_UAPI_FILES
+	rm -rf $(@D)/include/linux
+endef
+LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES
+endif
+
 define LLDPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
 		$(TARGET_DIR)/etc/init.d/S60lldpd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
