Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1369EC79FA0
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 09:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07C8605F5;
	Tue,  8 Sep 2026 09:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smblPfbSdAaN; Tue,  8 Sep 2026 09:35:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDAE960640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788860151;
	b=TniS0EBD5riVs7S3gHeL4NnFe6pMvdaUZgmYJsta7fFEI1Of3Oy3PeTPp3ToL3zAnmYx
	 AR9lSyAI057+2ZlsfSCnP/cH+7gr0xH0Q8pwIDWWiCkXmW0RLyvPZw2YHZPIVCThZiT2u
	 khZqpKUPyGvlr+NrOL4/PFLawSjmB4M8V4MhkpT4axvgIvHGKCRW9g8y5ZtzJ0PB5ffTo
	 PktmEh8/IkoecV8Ptvxl2ouBoCDc9E0YjhqAUKvafPaTGKUrGLBnYHnjiiJMlm92Tkrl8
	 hM8y2zMGyWot+vcwZhi/LWZaSYksGKTSA8bmoEwWKoWcufZOcFjDFDYF4DDt6dBu7DA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788860151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1dVyE8M87hn1+6xZslO5p0i2WdEcX9Zc9Ye838Gfld4=;
	b=P5erfx4LCbvLxtO7FjyJDzsLmdfwrXcGtu+I2uOxEo2KqFdO4OEvIJBmpn1+s2hcfkXm
	 V3GjLb1t7uWbnCInZ1wfOplxeSfUTg+cJv+Uo4sdltQISxu+qipURiBEBidDyQaO2wsvT
	 UXcO/nqTZyH+HqHx2TKWfTNCz+cSimS0Y21YZO7f73R3ABgneeiP9ztFSYWRDzkIQie7u
	 iC5f/bdYYak6TjeXo9TAEDWX7VAAoT2iKV8QG8CEypH1xkPcCqy432bJ1fl28S5jiUSHf
	 HUTvt9Dv5GOjvk2upwjMImCDyf5kTV9s9tv2AXiqNLXG1ficQMGQ8bfgAKetAXHqUWw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788860151;
	bh=1dVyE8M87hn1+6xZslO5p0i2WdEcX9Zc9Ye838Gfld4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=L3TxmO9JetzdtuphbPsj8TWFk5QdAR4ZyrcHwtDhM2tnu1Ct45q7fhaSFYsm3h8RF
	 got5GHP6bWaBWVPGEBoR8+fByqDVTyaWbxAa0sScKOqPHe03XO6zZI2bmiycPMgtpx
	 yCpQFB8wvddyyG29ukBkJRYB+eGn6RLgaVUJLaxygndpNunS450CYwV5ntJGN2V8vp
	 mrmxsGtFmNmZIqwffQnCTgGM74cyMi7HxYKG2z1kkfUhMf0mBr0Ccx7VGAp85BK30U
	 FBHDYTPIUpHOdG0enPczCizWkbjIgrGd3xJNMpdGcP5YNaUzRWH4vbDBJB8IDqHAZb
	 mPiqHiQ7nohfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDAE960640;
	Tue,  8 Sep 2026 09:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47486D90
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F2040063
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfg6g68FZs5A for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 09:35:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4C4E84002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788860149;
 b=YNY9FqMTInulrXMD/rWx/lkFLU7IifrC8YGqumVHbAm3yDe0nA7kagAxQGhw9CjpSipY
 qiBPPEi0uB+vPt3k1Y9yO6X1csJGkdU0nirxbSLk16FWbWfUUjrWfPF5qBMkYaTF2+gVY
 BHEbTvEapNac55ISjaoEH5Eli20OM3rtgciuTYg3ORKxnd74URqEr0LodgRvcnk/BltBz
 NPbBNaHO+YprrqUXpP2DfjPG5AFuz+v3CwDHgHQmJw01jcY8mhN3PndGTJjJ1/r5P56ag
 GVz5hy49srnPUfX8LUqzzXrft/zUdQWQ1HHV+fgauARFckZICsOSpFrX/4xTElmg6WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788860149;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=m3PqPr1nym6m9vZdqAYFDQXi5LIogrgQAqPcTAVQeZ8=;
 b=Vghsn5kj/7QPn3vDGTr0skPgCTXJ/GrIuQqH9EhE+2TmkHyb3u2+ccdOMMNyWwqzs25a
 HgkguPiO6M0SKI9DEvr3ssJ7n0VS5VgURkAwqsyct0UikHtULHD1S6Ufm5VVwh4emx4zP
 3wHms4fqr+w58CwVZ3fCKxsUNPsQ5YYKyt6EhTwPmDo9LI4aNhaxUoboUl1gZuAelNedD
 LAam7WC7VNInGOeCldCOywhDlO9qhVUf1ERoAeZUKHUIuKTbrlGRNqLLPALmEi/AWmFSj
 dZsSScIztHkLtdiWA0LlIrIERV7XuuGrEWdH3kQ7E0EarocNhX+apAY5VGxvyrazU0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=jHEOMTPc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4E84002B
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 09:35:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c207cb16cf5so685379566b.1
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788860147; x=1789464947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m3PqPr1nym6m9vZdqAYFDQXi5LIogrgQAqPcTAVQeZ8=;
 b=rjkBKzn1qcLYWZIdDs6hIo0hQ9sgjV73LmN1GorzCTbI7+1c+jgJUY7JoJtfSXO7Bb
 PzfVwehusjI0a9M9NKRqREcTdGPUyt0BLpx9dbTfXq7k0bX445UtN3BIWe+Er8zulkFS
 gEV64mytjnHpLUeZeEB/efBZiZRL1N6jgPC/HXOVD7MUFqp+XCUQM+I8eh6O7Jo9CxZf
 nb9XEZH+xS7HAWO4wj6X5rRtG/kEgbibe1QBK6eeVNYC9i4aXQQT03ENN+xz2dtDkdNM
 0PcO5eSgWDvx959vFpL+DUSiCAUjQ8SLnNEpl23dThz9DWv7oI5h9hS7V3f3a3G6G2sU
 q/xg==
X-Gm-Message-State: AFuF++mn+QSQapwA3hiU4Md7b2EOAYLwi4KeFnLMPF6BgGU+wHcJOKIZ
 7Wj/IjqnWBk54B/g5n7gewn0gFcsBeg5dBS+2Or50DaOIBN7rqjmSNFA+JFEDQ==
X-Gm-Gg: AYBFou1ICbDT1JD3onc4Q8yRR7aVVJ2sncaX4WDp1KEQuSTB/ViXo8g0Ik27lUVSCM/
 ZrCirLl5mQ9cjJNP4mvzagZIL03OaUVphN01uaauQfcG/4dU6nK2SB44L0qMej3SbEq1Yjg5wcB
 zp1BJ6PXTu14cS1W59meny9v8oNw1r1clUVPX/pbcLbZ5WUrR0q32v4Cr7m16Fx4y9DU6z6zPWG
 BOfF4n12KjP+QP5nW0T9aWyAKWV3BgOTcuOBQeULM3RNiVq4JsYDxI8CGYV9rk8OqrrhUG6Dw7p
 lDDHpeLEtCd2Rc8KX3aUhdmkXND3zokXzV7JC6d737DNcvciMlftiZT+VGtMG7DbpHd84IZxV4j
 w2jmtL7XbA1PR8Q7ZOHlUsQhLFg3yvtubap6VB02PkJCmtxkHt6cMmvvFqiIr/HqkRrT6Y5ZlY5
 I57Krh+HqeBp4F3pxNhI4HQDXJPSvPjZTdnQhQB4eYaZjOd/do9YFS/ctF0RddfD600YncSod5H
 q51aMxKpCp3LdZr7jAM9iUDKXzQpXP9D7E3KhbPbg4Wbv0=
X-Received: by 2002:a17:907:948f:b0:c28:599b:7782 with SMTP id
 a640c23a62f3a-c28599b8bc2mr522191566b.21.1788860146502; 
 Tue, 08 Sep 2026 02:35:46 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4aa166sm575968966b.16.2026.09.08.02.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 02:35:45 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 11:35:38 +0200
Message-Id: <20260908093538.2715153-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-grpcio: disable for the MIPS n32
 ABI
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The bundled abseil-cpp only implements DirectMmap() with mmap2 for the
o32 ABI on MIPS:

    #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...

With the n32 ABI, the "remaining 64-bit architectures" fallback is
selected instead, which fails to build because long is 32-bit there:

    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        error: static assertion failed: Platform is not 64-bit
      130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
          |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        note: the comparison reduces to '(4 == 8)'

Upstream abseil has no support for the n32 ABI, so disable the package
for that ABI. The o32 and n64 ABIs are unaffected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-grpcio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 6119991c7e..f52e19dc18 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -6,6 +6,11 @@ config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_riscv
+	# The bundled abseil-cpp only implements DirectMmap() for the o32
+	# ABI on MIPS, and its 64-bit fallback fails to build with the n32
+	# ABI, where long is 32-bit. See
+	# third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
