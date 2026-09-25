Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3CDC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7E581347;
	Fri, 25 Sep 2026 14:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vw0exNLZLqIj; Fri, 25 Sep 2026 14:56:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3AF8D8134D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790348209;
	b=joxXukbzOo1qRe/N/t/3aFG92oNQjxV0y7zXPefXaGzQnELoNLJ5sU7YkAUe/RpADZFY
	 svRRcgsXOUvP8/lCkbpiOXtz5ZrF5jQS9LKy3AGgscqPiOKkEJ5E0vnx7zpyM5qxcl0g9
	 Luw3GpJyYAe1m5zUkoJa/rHB9I/KG3WZYDnAk8jdZFm1s3Hrfhc1EU3cD0I7jCpbtuPPb
	 uKe5QQmnFoaKDmG0o+o7z49wOcncP7kHMfC81vRnH196pO9TC18osK5LLKc49MbkQdlIx
	 w1kKKX4/M0qMPtkoTOt1/MyuxoGuPiEC0hVK2iSEr3gOdt0whwqE1PeOhAbYWY1F/rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790348209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4nyW8hfhTCWaiIkNTyynb55nQIxBc3VHznr1TyJgsu0=;
	b=VYFK+OxIZngoboWLOoBdEx2WD2rAQQon1yv0PWfTcx5iHxom1K2L4PX0sbqsZSmZKGNY
	 cXHJtrvf3ZSj+d6cu895K/MMxHpKqQOUQJeyXGIvvvYwX6JcvvjH2qAdxh0Pk96F8b19m
	 SmhvjUHxv2+ogXWxF/A6HY3ebr7rpbLjLWqU4FYBUyZkrPTgLdOCG00stOt8aNjzuGzOf
	 WL9FBVIeLZLT1cyZsE5qRNbzSFrIkIas5btwxbbgb0E9GoElA7wSfJHPG2q2kqldiAKqb
	 6nqCU+dYGr+5+Y1nl9TZpSb8wLXhf1F2hOtvAVW8iqtOI4hA64ZXv7Fme90BKx8Rg9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790348209;
	bh=4nyW8hfhTCWaiIkNTyynb55nQIxBc3VHznr1TyJgsu0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fLAOMghrbtS2EvQ8P6wudlywMxrvbPuKODBgsazjEcWoYB/0M4SiUHNTyLqYDgNhL
	 GhMBuizGzh2dZhCOWepDKE5s6LjNQAgD0L57tReUHvg4m92sIkdx3FwVoTkdW9AFGP
	 5mWubsU7mXbTj3pWejO0EHRiZmXlp1oJCkWwdoC4NF8U+PacSd7KAVlmoepu14MpYP
	 V8U2vAPZg84egHr83hDFiu7OZdftkRAGShSvHROvzbevOk2RDm1KfZwceT3EGYmtCU
	 TULUtCBH6H8TUpcR59Ou9d5zhh7r2GlTyovKXuPakcnUfUPF6DT3IXoh2YyiPoA7xn
	 jmDwaI3HeqczQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AF8D8134D;
	Fri, 25 Sep 2026 14:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A02AF332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E6A140CBD
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVoYhDJEWv3I for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7AC0A40CB7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790348207;
 b=sL1M5d/mXy8BKo8VOomaiEEnGEQtNkkIsulDfxBRK1HjKIN4aXnPOKC/kJzTFWo2v+3m
 293oFWDEkx6M2EFc6XumJV8h113UTzxnQx3kNPjBSBz2Aa8+GYwB5RL1qsMeXzxijjXlK
 YC6enXnepXDUdKrK7V3x2evzxKJZr6oOfmMxaJMGL0hjNXZKppyI0LsZlK90o0Irrphs6
 hnux8BPOHRNxw01YkxkDvf5f2EYeEdbjgola9HGrhAH+K4M0iz0mNru3XnVr5HCWUNe6F
 ev3PQXnsGHxmpcDrfyRZJ7wY8zrzsumLNGbWda2c2wdpnJpuldiCNjAo+UsjYR3165g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790348207;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=1LC+XOvg3BUIQ4yyqjmKlOzZVw+e8pEqtUWzWyddhAU=;
 b=dIqCKq+iAAioxGkBUnzD0GyOBfPwZCqhxF00HAeyI5LY3NTPS29pvWQ4AdXnNukfZlzI
 31kyMs+KW2hrtt04XAfpWmvnZLIPTfNor5X5fCGwbuZ9G4rppJXAqnGX8upWM1ERhk1Rb
 GqY2t52w2MdB5xsTZ+/LP40rFAN52cDJS+FDnBmlYeAyGoUCI3lozdkQCy7nYEE+6/Xxz
 8e58f7E08cNlXqQK1aRbdbR5F1vyoPt/PpQgWArciSXB5JukGLm+6Nn+/VKMfEEivmca2
 EU1sTbJOCM11Pwb4DX5zPrUUrphDLQh5BngX2SVd2C3UorLbGFSpF9W8E//cGUkcnew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=vodden.com; 
 dkim=pass header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=MHJTeA5m; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=richard@vodden.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=vodden.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=MHJTeA5m
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC0A40CB7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:46 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48881a62e09so382281f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1790348204; x=1790953004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1LC+XOvg3BUIQ4yyqjmKlOzZVw+e8pEqtUWzWyddhAU=;
 b=MHJTeA5mqFFq1A9QBRIBTV0bfZfU6st41hXKQQUeRpncRhtRYjUYmM/2T7wAwFB/Se
 SNcp0QbqQy9+wvXjUtPy2MRKTdxSmOyJ9/SafctI69EF80yJZdjKSyYUoHZuk/Xg0vM0
 3NO7s4k6Wb6UlRwg/rYtvbJAISvVRFGFurljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790348204; x=1790953004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1LC+XOvg3BUIQ4yyqjmKlOzZVw+e8pEqtUWzWyddhAU=;
 b=j8hHB0YKKTkz3Cg+zWSVzh0PTbeoIFMUdT1tQKa/yk0b80MlxYIHxfLSu0gM3WbZch
 6R8HYn6MNcKKDLgu743DQ/ExDBLGYqpIHxaiDRl7BvY3iBmjKkaP0x4Cf98ViJ+DY/AT
 SMEnqGFS/LyVrbV8UZdCekNZZLno6FDO67CWV85DbebZ58Zcw5vPoz322sIGRlVHUF42
 lcI0TTt1naC6JJKDv2cTLKq03esFhWTP3K/+0QAHERyTkr1tfiiFSwNcGDXUs9rM6LUE
 QttW6RiGS6LA7T7QwnXvqGe8OjPgzM6DVrwjQ0Wcf2uXPRQX0MPqsyJeXx67l+tFzR5p
 9FwQ==
X-Gm-Message-State: AFuF++mZmPq84UFhlxkBO/rCnQKnZrRwENqK8YfbZi1hL34NHsBwzL2y
 3sPSAnSriatTKbvfYFpgpp3Ly94c0RE8Adz7RalSEJCoo/Bfo7MUAAC3aR9BWjQC6sAFxc2opIt
 hTSqB0f13Ug==
X-Gm-Gg: AYBFou3iYbb/EdyDurbIcsxB5mUh3Q0CEmO41PvRj3fYS/1W2bMevg7xbGmfzp7MFph
 pEkGPbF0VQlENrPNRrbZg3kDYnW8iMJvcqCszZTvA5qA9wMA3C2TRkQYPQhDSD30ytf8GTNhQr7
 fYtU/yKKQB0iN0MLxoNWLAg7UzaJ61oq43y6uWppNdMQCschdn8uuyM0pHhMzRA01fgMALiw4h1
 kH6sGuJNLm9P8+XRUNDyEHm3S6hP4GtVg6t7gUhmvyvHARpYhvUN1KKvKBqi3pgoQr9ievNIjn8
 XaQWDAlrNu1tZ+o7SSmeGXU5T1rTsjen0YpLF0tAzxB/01akERz2ADRlnsY72FGk+/CBbCCZex1
 rL+CWIvxgAOAkeSbTCiHj5zET+LfZYX5AjcAbIfv6DjLtJKvzmdkOotlV+wIJcLT/xcocHuCOob
 1X71GbUmAw9QItyFS532/TAng66/ssseQXYKre6+MyfbProzhlf78p8RSvwHHlty/fa3s/GU+zh
 /27r+aBEAbJx8BhVwY2zJRmqUDd2oxqb4Hgtx5CeEW8q2crnl4sbV1ocC6cuMbO
X-Received: by 2002:a5d:5e88:0:b0:487:9a9:6d24 with SMTP id
 ffacd0b85a97d-4887171a503mr9626143f8f.19.1790348204150; 
 Fri, 25 Sep 2026 07:56:44 -0700 (PDT)
Received: from LargePixelCollider.localdomain ([154.61.62.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm8046779f8f.22.2026.09.25.07.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:56:43 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 15:55:19 +0100
Message-ID: <20260925145521.54655-1-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND 0/2] boot/opensbi: support building an
 out-of-tree platform
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Richard Vodden <richard@vodden.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Resending: I sent this on 2026-08-13 and it hasn't had any comments. The
patches are unchanged, rebased onto current master.

OpenSBI can build a platform that lives outside its source tree via
PLATFORM_DIR. For a board whose platform is not upstream - as is the case
for LiteX/VexRiscv - that is considerably simpler than patching a platform
directory into the OpenSBI source or maintaining a custom tarball, and it
decouples the platform from the OpenSBI release so upstream can be tracked.

Patch 1 replaces the BR2_TARGET_OPENSBI_PLAT string with a choice of
reference platform, external platform, or no platform. Three existing
conditionals compared that symbol against the empty string; they are moved
to !BR2_TARGET_OPENSBI_PLAT_NONE, as leaving them referring to the removed
symbol would silently have disabled INSTALL_JUMP_IMG and INSTALL_DYNAMIC_IMG
and produced no firmware at all. The 13 in-tree defconfigs that set the old
symbol are converted, and a Config.in.legacy entry carries an existing value
over to the reference platform.

Tested when I first sent this:

 - The external platform path is what builds OpenSBI 1.5.1, 1.6 and 1.9 for
   a LiteX/VexRiscv rv32 target here; all three boot to a shell on hardware
   (ALINX AX7035, xc7a35t).
 - qemu_riscv64_virt_defconfig builds clean and installs its firmware from
   build/platform/generic/firmware/, exercising the reference platform path.
   The resulting fw_jump.bin boots under qemu-system-riscv64 to a login
   prompt (OpenSBI v1.6, Linux 6.18.7).

What I've re-checked since the rebase:

 - All 13 converted defconfigs generate a configuration and resolve
   OPENSBI_PLAT=generic, and none of them sets BR2_LEGACY.
 - An old-style configuration setting BR2_TARGET_OPENSBI_PLAT="generic" still
   converts to BR2_TARGET_OPENSBI_PLAT_REF with the name carried over, and
   sets BR2_LEGACY as expected.
 - check-symbols is clean, and the checkpackagelib and checksymbolslib unit
   tests pass. check-package reports nothing on the changed files beyond the
   two missing-BR2_DOWNLOAD_FORCE_CHECK_HASHES warnings master already has on
   the sipeed_lichee_rv defconfigs.

Richard Vodden (2):
  boot/opensbi: allow building against an external platform
  DEVELOPERS: add Richard Vodden for boot/opensbi

 Config.in.legacy                        | 18 ++++++++
 DEVELOPERS                              |  3 ++
 boot/opensbi/Config.in                  | 55 +++++++++++++++++++------
 boot/opensbi/opensbi.mk                 | 16 +++++--
 configs/andes_ae350_45_defconfig        |  3 +-
 configs/hifive_unleashed_defconfig      |  3 +-
 configs/hifive_unmatched_defconfig      |  3 +-
 configs/nezha_defconfig                 |  3 +-
 configs/pine64_star64_defconfig         |  3 +-
 configs/qemu_riscv32_virt_defconfig     |  3 +-
 configs/qemu_riscv64_virt_defconfig     |  3 +-
 configs/sipeed_lichee_rv_defconfig      |  3 +-
 configs/sipeed_lichee_rv_dock_defconfig |  3 +-
 configs/sipeed_licheepi_4a_defconfig    |  3 +-
 configs/spike_riscv32_defconfig         |  3 +-
 configs/spike_riscv64_defconfig         |  3 +-
 configs/visionfive2_defconfig           |  3 +-
 17 files changed, 103 insertions(+), 28 deletions(-)


base-commit: a962be2eea146e06661712159698bc7cbf3305f2
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
