Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46729CA9EC5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE41405E2;
	Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJIF1V-re5_8; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D050840596
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786348;
	b=UHckqtqHN8wplLtjtFWOj4C2fvDvzekaBCkydWApJN34uFOHt85PtF+fUYEo6hsY5EWu
	 JZwrcCHG0XBIp4i2qlnkvynPhNOUKSrM5W8eTipb/r9fCJo7Z2PFT3zK7JFzP/BHegYQI
	 P2itgfMXVsuBr+PRqq+CSHDC5f/5L9v1gJHp0Mt6k5V/zT0zUJVAqaFAn31HXXx5l5zya
	 698yyKIUnhXBqhbzmtcKoBb4X1gyOEnyZv8erV8gtoVdhZhty9D80bMoGaA3glJlilnrT
	 aFYuRRHf6T4G4oKkNJvTEjObYeAI84ihh7y0VRJ4NQBNgwWPjms+jMN/sW4XB0FIV4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3fy7/p7sgJ31xNv5CHLMwekCuHupkmSdKIeV5dfWbno=;
	b=GORqL5SPu3IrySBvL/1Y4oqZks260fnDp84xTaWWdpG68wkELXVCYQF0qHQZ7lX72KZM
	 fBosU9wCYgGVZzFjvxk/u7DRmyxP0qkbu5rmUi7wgH6LMaz42bwHMHvzMPAcqIseUD15I
	 Hxp1VXT+L5Zgy1iVik7BJDyiDktY/cWDAJK8KY0h1ZGiGOpEwEY5ydk/uczqonI2v9dan
	 rvfseNn4jvwBOgjf1g4v6LcITfb1pcLUDiIItRSeP7wGuc6+LM3UWnKyYOZ1sSeaBgUcL
	 Dp3reJPEIr1ONoYg0G3wQdkI/hkEvskUlqfO6vrURCy68yAMqa3iq+DQqMrhvgLs9Ww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786348;
	bh=3fy7/p7sgJ31xNv5CHLMwekCuHupkmSdKIeV5dfWbno=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HDymlt7Gjo9WoQpmd9/juWKKLC25Myd5jbj7s8PWpLXAveNzbmsg3me9BpNtyo0v3
	 leqN8E//yxNn+1XGvchBUOG4YGMYCcytOw2r4ndunLLR/tQRR1u5GoJ9sCdOHZADc3
	 1UzRLiDqSP8gLBW1givbeQX6H9SIslF45UvEA0smypXK8qfBlpj/NgFi+Ggs16z41C
	 TrTUXXbSeiaHYXXPTiDK+nez4HNvyQ5TvB5OnvN1lYEJzg4GiH2ZhyKLhl/y5y8xKC
	 lJh2SRThhMHbwyI1KgCc6aT1McjkHDjjRPVmzwcPGwmrGFc5UYpF8E/vaD/NjY/2P6
	 JU/xVAqF2UShw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D050840596;
	Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0149CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9682D80CF0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5qX2vU1WzOh for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FA2C80CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786346;
 b=Tagjh3Wxut0c9qe6FkDF1LBfWrFQn3Fb/1W5ANtSFtZkCSYUXSnWvjQGAMWJ7EgtlPkp
 j2SB+5PO6Nb3u5UnRhQspGTMQt1UpiYTjKusGPBjZpwcplXcpkOuzHWqrx7vSxKiBrxWu
 96A+XA6fPJCuKy/+LhnwyLO1I25BAOUIsW/iV5B/vdhjvVN3Qm0KIV/wte3SXzBlpAup5
 GfSrqu6ZqepR+HRGOIo2Lvl8wKhKvQXyLkJyQzUzmTxQ1usQ1w2uneCe7zeVlFaJRI+kv
 gZEuVTrN2LHm985CbNZQFHzbeggaQgkwtLbAfsw1E9eMpxFkr5cet0QSlvqJlU6Bk5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786346;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=X7fXBkpWgW22DPkh5xit8qbb1GQ8WYcuzPq02jzicPQ=;
 b=I9SBKbrU5z36+G3qRinL/q8UuGj1wXEkQhtQCbxLnmMCeP4m0ya+hiWyWI4bW+P6cAgl
 DVa2a02V66oexeqx+yve+arkdwG0KSJerfkKPeFF4+27kdl8CvYPnJnih1uUU+5h2Vfm+
 C3+To85XgLBfqh436GaWbCNbwdAHtfbWsfxPa8S+Ms1iyQdC1lXjX0mou7Mu58tT2E/4A
 B7+f4gc5QIL2qV8RTy7kpIOkR7i7/PJ9U+Wv53MSJdG9axDr5IhTemsJrAUodFWEoJynx
 p1adNhCshpIbDh6bwQcruAb5g8+TFtlZYVLAZMT1u19Ug0IH9aubVfSZBVxL5fIQSuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QgZ+Wdqd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QgZ+Wdqd
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FA2C80CEC
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49fbb2acc90so10699455e9.2
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786344; x=1792391144; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=X7fXBkpWgW22DPkh5xit8qbb1GQ8WYcuzPq02jzicPQ=;
 b=QgZ+WdqdRP2ZK3nrSEOItLYSB5WPlkINzDCuV6DUyeXOyLRW1I2x00rMRhMdRYVSym
 RM9hfbw93O/ek04d6uKGKKtgYA7iL7ZC9SAZcMjLO69ipH26l7yNW+W1f9XlvOanGlTG
 NC364rw5BmEDCm9WsEW3UuQ5pLseX5bXnT3QnyUjGfvqb/T/66qAniSyIYqHfPYEa9Kx
 rs/DtCsTlb2qQZI6xNgxgjGQOXCNnraVyVJ/H50xMiHh85OjiZzR+Y6fW3n41UadarKL
 GS+KIMAxuUASI0/654t3Y28R0ERoIeMGE2WpvwKZrJ7H1FOD7GuwQzMpyGcZ7kUqCRir
 j0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786344; x=1792391144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X7fXBkpWgW22DPkh5xit8qbb1GQ8WYcuzPq02jzicPQ=;
 b=Resi0lUbV9g6K8Bq+oIY+yxtIvt1W5/gnE5/F7vLAR/wNoKa5HJmwE2Zqrgu+5lotq
 sKFXIXHD6+9+x/xVGbBl9hbCPd6zUZgqf6X+wNCBzzYKeP9UuUAwUwUHWnhZrnUseRQs
 UGpQX24oNSEtfg8iC8mVm/L++jPZGRZMoJjfH+XKjK6Bz/qPzJHMaFAuAbfxXMOXAzdf
 KAxhbF58q48/pGB4hArEnC6iINhZUDXRJDjriGn8Dk3Cg/YRB/+ZtX2+gutGzooS8qKM
 1UzzcZQAwUIYmCPmhJk/6SSl3LQ/xq1D9XY7i8hurK9H57Z0RQr1h9QRoHoYENzqz04t
 +LsA==
X-Gm-Message-State: AFq9FYITVxVrgPgpm65Jp/fgAn4vJiO/G9qSxnusLdFlZTP26RLvEFFh
 DNbUq6RgiOAtPzd9ZfC0mEcpA2OSfp3Ziu0oQs5xNPoljgO2AFuflZCZ4Ky0nA==
X-Gm-Gg: AYBFou31W7h29YnblfBT2EKly0pPFFu2BlAm0AomVdZLY2Q285j+UTJTggveRipF4dh
 cPKCi0ZrQo0OuXgQEUBUXy1uYBnmQCxfzXXe8+HTGM/TPgUAz7wNEZFBaVTownZJUCS38xjXIyX
 ocn6txu3p4zaHA0GXzfYA9tIZpPcZnv29gU0hB5t+r4ugDeoD8yINXZMcPdh+VnYbYOjVHghCwF
 rIr0fK4czp3z/QMQp1eIjBKf2L/bi1NgpSVwJOEYbT2rQrv9Tsks/3mNywWX1dCWobQ3ktZguWw
 VSmuGS33jZnrkdtXNJywdVGO70rfG8NdO9ESh9uPY49/QLisfuQMl4x3ljpBCyMm4tvCgyFo061
 UTnMfMYApx5kJIZMIBGA9W5YtG8U/f02vON2Jh3iLVasEudkDE510SWRbLCcCmfD6xPzwEY88KW
 On3klAWpEdeUcB2hLaJUXeWIK/lBFfu4PQnIUW+iu5YJaAdaJ4lFZR0nQ0sLp4TbJ8sqmNVMavM
 2PLbf6BQdGpF6hAUgZlPdEwNldErPNoBb/lV+Hw
X-Received: by 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id
 5b1f17b1804b1-4a18e4a9b31mr175179535e9.12.1791786344060; 
 Sun, 11 Oct 2026 23:25:44 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:43 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:26 +0200
Message-ID: <20261012062536.78874-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/10] package/perl-date-manip: bump to version
 7.00
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index e9f686891..2d00767ae 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  322b14e69dc35106b9df4f45a4f520f0  Date-Manip-6.98.tar.gz
-sha256  acfd8a60519ba4cd181c8a67a83d7f029c6d9ab4e8b0212dc47e41d6210fda49  Date-Manip-6.98.tar.gz
+md5  58ab5bfd0b0f96fc80f49805e4b10265  Date-Manip-7.00.tar.gz
+sha256  37133eeb09d36da6d461546cc216b8f6a2297a43331c680a6848f3fff925975c  Date-Manip-7.00.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index a82fcc0a2..c4629b5c6 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.98
+PERL_DATE_MANIP_VERSION = 7.00
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
