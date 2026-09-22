Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE64C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 13:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F187E406FE;
	Tue, 22 Sep 2026 13:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUmSuLARWCwe; Tue, 22 Sep 2026 13:26:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F0C7640737
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790083619;
	b=Jqw8t2CYUZD+janeYt43kSHVU7X4eRJcnlins+/X72bcmIFNdSbxQ7NlCo8VikRrwzu1
	 EoFXo34NrnR7xv2tT1BgspRTYHJSBpNz1pdPffrheIA9zTtZI7yFE2Z5QoM+Q6Dqlyntl
	 892gkDz5U6ktCMdclLbm5olf7p4rn6rX6FokTat4qj607/aXxaG0u+EB5c7WZx9WS8FT5
	 WSz0D63zbzi/PHbu/JzBvWmiTjyfhM8Xbua6ymX1tdwcMsNFUBeoTynqQRqpHkFiINZzM
	 I4PQIePdWS9/SUoO8LZ7zi1MZVqtX1y9CVSl9BRGQmhr2bLukoZr5BEtwx2qY4GQuPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790083619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iFvJea9XqQqJCiod0qWsMIDRWq1F3lbmyGMTeOlXtMQ=;
	b=FTgixlB7fPyFjEQbqRH8Z65xmGk7Jv4c3WpNfQ674ZUbZ9kTH23mVA+HM0bNWnXMktW7
	 pT1IZgF/HRqFx7VBL+fog6qv2xaT8QwAHdJ7hc0vN95P4UIyTjezAmahR9b0IBzSXDuEa
	 Sr4I2/MUmllbU+aLikfeVASLOGUHgTIFSZsexVgi2YjyCdEO6mgm2QIbr6zd29JrWs5yP
	 4Cl3cgvLS7Y9Rz2fNZLheD+/jTarHr8CS0JFVfECt4+0cWmhlAed59ci4D2peipHbCI7g
	 cYgVsf9sxZ5ePQdLsBdg1eoGf78QTMNK2hlDEmU30BEcGWwbaV2cCZLV5Eljb3+3GRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790083619;
	bh=iFvJea9XqQqJCiod0qWsMIDRWq1F3lbmyGMTeOlXtMQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XJsm/9C01O8u48m4EeSg+7W99aDb5HCBKd5xba2/QIzrYv/oSAbtfmbmGYRmBiFTa
	 n3xGB3766Lt0MOkNk+/QUVpbkZnV3CvebIceAzjPIzAWiQs6EvHbp1Z4LXtG0SM4o6
	 YxisuSPQcGw0XRuW6D0rkHWNF0NG3ougV1kx7SMEEHfLGGlk0bNUFxwa/o60qT4ICO
	 hvs7J+sHrrHkurxMDQQVZap1nAw31yL8uYcbbXQKNUzLT8sc7ZMh+1B/a2vQ1AvyEc
	 utDSGhunJwCcdI0SmMJv9/KlQ1D+FeeqZOt5NVogG6YUkDb1dfNKv9LfTELwI2LU7D
	 2kQ+4fWO0nvtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0C7640737;
	Tue, 22 Sep 2026 13:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEFE512C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B49356069E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvfxBZDBBVME for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 13:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E9AE60674
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790083614;
 b=sldZx4qQsfRRtLuXdhcN1OqpdVrZifVQK2ovswhaYfobbPB1wdqDJrPCJNAqyE6ncGVl
 rW1KinoYkc/uwlmAM8n0fy9eF3L2MGSdE5Mfp2/xVYb0SCnEX4VIDBgwyA0lIqe+WGEvR
 wae6hdLBdmDeP+75LN+PBbz+QZw8G5trYyQly5CkrPo4P33nC6li35/3Rdro9S83MbTPx
 5zUjL1KRl/p6pngZqVFESQiY/wBQuL1hZQ8joEtJVswONmqaJHEQzjPc0ZBFg3SR0DAlW
 geRscoIYPWdbxuq6O8oiaaGmfbF/u1H8/uMoN2VsANdL2OY/LHUzEH1024b+K+eEibQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790083614;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=bR/Krz8SJ/R4I4+Xp/YDF4DcHC/ibA8RV8ATj0GGoG4=;
 b=bBQe+yCOLpgaRUNIGD0seUpPhL7eFzhhyg0hVy15ehlosMDp3UtL2f8GPPLjqH77iUEM
 fzyVx31Pn5BeiND6VrRlXI1cAxsCNKFvAUqAHWfW3mxrr5NnVNHu6jfL6s/OAEZjEEqpq
 yB2rkjWXFxxO1KcqaeGEr12jH0Qwfv+bXRXG9jduNKZU8nhcq4rCUXwLPqhDLDly0PYAx
 6mkkRZMR/lfvc7zYBleXeZcK9kly/pF/jlJyOmWrErVXZLCDm22WP6rxQOG4vFGcpbBA9
 KzyySUsYw4Epvk8Z7VeNaADVwyvFeJwUL4NMpd+bfrAfXg8G8pPkBTvk1rVCsl7kNKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=L01fTfYb; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::f;
 helo=mail-ed2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0f.google.com (mail-ed2-x0f.google.com
 [IPv6:2a00:1450:4864:33::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9AE60674
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:26:53 +0000 (UTC)
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6a67fa7a64eso6528981a12.1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790083611; x=1790688411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bR/Krz8SJ/R4I4+Xp/YDF4DcHC/ibA8RV8ATj0GGoG4=;
 b=q8qWJxEdUavem1u7iBRLX9YZFhlTsiTZshbWJVZwsJEJlbzhewJ3n619hq0EmzLpdE
 60G6gLKEpi/lEUDkIaJ1boEKV0SUvSW8Y7DPss61IRhC0SFJwRYWjxQikOLGkxM9KqQL
 RNt1a/TbHzviZoff+X+S+q/15Be0dvpFS46i5UoiDSijDqLLPaJxuRI8R0nNpqn+GCJS
 CX3V0/9dyyFvem/r+XKSY87Ov6I49mt8Rd5GtfjM/+gOP7NZD0+FpUpPBlEdnsVnBJM9
 ZJlv/bu/rmvSilqqbNX6K5Chn6g0WyFA6SQGMw6fAtLwstMLVonv4u6wUThM3zI7PDTD
 n5Kg==
X-Gm-Message-State: AFuF++n52YuomgTmpzd5JhALsxGNY+MueyJv6E4YzOZJ0sEU7dX0IQ/h
 /2GPEwbgDCKPTc1SB9DQFubo9kFsZ0wDg5FdRRtYOACRlizuvSXs0/kvyAU4gg==
X-Gm-Gg: AYBFou2t/m47hx1EmP8EeS2WEn4nQvNrv6/OIi+mDutQaL2GpOtjfWv+8MZMIwnsA3G
 GXUbIvZM0aoJFAJvm1UuzTILPW6Qswygh6zhe9lYIQ9FJFxFjH+mFVNhwXHWmuVkKbHwwwa4at/
 dncEUQ6RUPQIs/GrP3APAM3cuzSWSbt/cigVrk73FpXbtMK4sT2Q9aL2Z9OtO0x9IE8mLiUBbJ4
 i26z2AX0n5Yf3R02pYrXTkra7A+eJl8q4kIwfdmvwyNOhHbmHNuWpZw7FXm0XJa/79lrJXZeoXE
 BsQBJGVTaV7/JntpHIcdzoJLd3ZhhAq5ARE1Bz440QPDqPlgI8weqM9mpixJGZhMcXhJt/F7Z7P
 PQHGEiBOL/G1LE1ZwOmqynpby/kDOq6Vt21dQE+WG/9FQhJTVG1Z/tExAekmMe6GtnoCheK74lt
 vr2ZRNMRqKEmhcV1yIOP5seM/lNXp8kuqybQdy446ENty1joD9PCwnfAgF0MYB5XyxzncLq8qUB
 KJy82xGk4PCDuC/oZJtWI0BV0JWgWAfqe4HbPlcfm2oKD5Spgux7STIzw==
X-Received: by 2002:a17:907:a088:b0:c29:c079:676d with SMTP id
 a640c23a62f3a-c2a158468a6mr1201374766b.3.1790083611037; 
 Tue, 22 Sep 2026 06:26:51 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c5ee0b4sm85021066b.50.2026.09.22.06.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 06:26:50 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 15:26:48 +0200
Message-Id: <20260922132648.3229462-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922132648.3229462-1-yegorslists@gmail.com>
References: <20260922132648.3229462-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iproute2: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

iproute2's configure script enables HAVE_RPC as soon as libtirpc is
found, and misc/ss.c then calls getrpcbynumber() from its RPC service
resolver. Since the bump of libtirpc to version 1.3.7 in Buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3, which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
that symbol is only exported when libtirpc is configured with
--enable-rpcdb. On non-glibc toolchains there is no libc fallback
either, so linking ss fails:

  ld: ss.o: in function `init_service_resolver':
  ss.c:(.text+0x2558): undefined reference to `getrpcbynumber'

Select BR2_PACKAGE_LIBTIRPC_RPCDB when libtirpc is enabled, like lsof
and other users of these functions already do.

Fixes:
https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/iproute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index ab9e515eca..106a0aaf2c 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # __kernel_{u,}long_t
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  Kernel routing and traffic control utilities. Provides things
 	  like ip and tc.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
