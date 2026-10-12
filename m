Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D35CA9ED6
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A19E60711;
	Mon, 12 Oct 2026 06:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elt1vCm4AXJG; Mon, 12 Oct 2026 06:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC247605FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786363;
	b=k1XvPSzExQN9NHr/+adNTGJvQxDMoiBNeNYsCSDsTeflmrBvHo++0O/mobvwoXoB3yTj
	 0mEXzrCcYyR8s3lLYtrauLt+HxJTohs9LadT5a95bLIHG5FPGA3iiJGz1GO5jo3ZkHqs2
	 ShG8Fa5C3Ofu7N87Myt2gtWPP6QE3IXVZKuBoqYXWBU2ajbolIsu/xLNB6yipDW8we+Vk
	 jJNhmv/KljUNSJUrE89gXZDHD3ylYHLh/YGH+XEVI2Dvc5AIqdKalE3YaV4cls7PsMIlC
	 tl4LGuNka+KbtyCDka/n9A2kTY+NcO+Yk3H3fk+JK7w9TBVGyYkj5wNVbI9Gx2CsZgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=94z9doGsgkiiL5tTGUklcrCfRDE4TkL38OLfuU1uELw=;
	b=CII9cgMrvkYcHZ+cTF7WRqzXnY7uqAGA0k9HMsQkFktdNnoBExHGhf0fcw56suLEtY1E
	 +PqwRPLtkYSLEopXfmwCGTI+/lasXJl2ED0Dwiab+hUC3X+YPZ33zhXz369oeiVuhB0DV
	 Y+QQ5zdJJC6LZuf1tzwcZK29rDwmBDOLPc4RcKHvipmiB2V7YJKag+sp4aAxy8Q8WRLRt
	 3tr06HOlOcFUQA5h5pVTcR2qjdCR4iu+eRWk5z+qMZRYZV3fOyenMa/w9OKQzcNIeVYt1
	 nTZq4sE8/vPbgRcL0Mh/O5VxXKtDvAryCossty3aXN+IQ+RarJNdZWgxwrc1xdSK0Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786363;
	bh=94z9doGsgkiiL5tTGUklcrCfRDE4TkL38OLfuU1uELw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8cWQAIDKTXcuOJDmScD81Dr4kI/8hNxvfXl4WkiYWfQtrM/kNEr6lNNGmIg0n3aC
	 P5Um9vWCRejTIk48vv+MaHgeQ+5EkkbthOo79OnrPEP4AYKWy/p8n41jA5sc1ofUTC
	 iYMGsHhXeQOI1fJAFzR7bWmJ19e/miGRc7MaaWNvHMdzV+XkXm6Wr0UXdAPEpi5p8H
	 knzCB6ICplrq5jc6hdokeHqjRxV2wcBr99jkvXX1VD1Pe2Ns1HijP6J6xdVfmAD+t5
	 hU0k3uHuM7aNCV/vAsgRsy5BlDPvNO5GGi7C+BW4RhC7ezfaCzMPFdwyl4mFxbY2cx
	 5myOHfdfSdjew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC247605FC;
	Mon, 12 Oct 2026 06:26:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5F69CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0931E80CEE
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKgmPHaoQWJ5 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 052C980CF0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786351;
 b=O53Bz2VpdNyAk6PxDKMbrI+XgCsUhP4iYCohLagGDq9xuDCc/LbDfVbPQ4TeEigLmDy9
 J73BtSHXGHb9ET8lzhuOJMbjb7S2WRf2UNmRxKNT/xXd9ElgeWdYmjv89J3i0YEMRwp/C
 rJ2ncJMvy2Oj3ZcoP/CYs4/g9R32YfEN+zbRxhqhAMcPG1g8kP4tGVvom8PtRM6Ckkx0c
 t1uzvBvBzckFjrERacZFgdxKCfJnDam6AxLS2/AKe39hiEdl/XngxMgRv8cKT4j8BHPJr
 bVVzs6qR789hh1KXpO/l+toAJtUZ8kvnAmy7cVNACwFh3AFXYaxdtjTQ5vNOIugI/XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786351;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zmSEytxnSsOeAVTmebg77rmhsPGTLv66CwSKGtEva9w=;
 b=LoSoGcPc+bvzYalz369Dmi3z32G6IO/dtSmZfJ4IrbzneWrD4tZppFsjWfAAYNAPPJbj
 BH3t55oK1uXZU+RY2nvc2//v+ZpGvRw2GOQrS98uRoh6DJ/zhAVEHGQEVQY2IxLJAdG+2
 JuJr3WTwJOc2p8x7gGzkGRGqj/zuaFOQa8rM9WasBBRMgZhtj0VkRfT7HJQa3M9EhEtxn
 7N1f5mTRVdY7uZL49nRd6gRTjFcoU0sjWjCnygkYIaLWuLSMkaXMIfD3B5A8jwtyBtW3L
 okL03oE2sIY91OhEOoOXPLjWEruwYTqt/1TstYkd2se16xQZiS+QOgQ6vr68e2wKE9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="r/rmk/Pv"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=r/rmk/Pv
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 052C980CF0
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso1360172f8f.3
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786349; x=1792391149; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zmSEytxnSsOeAVTmebg77rmhsPGTLv66CwSKGtEva9w=;
 b=r/rmk/PvU352ESgAejBFhgEnOBIUVPTULYS8VJyBu4/W/eZ/c8nAs0SNiKt1Gio/Y2
 y3BA9k1yW39e6oK6iwuosIwAXzgf0nvXItGfVqoCwEUOn7GI13AjwM7YSbhSUOQ8ejQa
 ENnINNupYbtpTWyO4Wu7tM2OdLOuIvYQlxcNDCCmik8zAZWf3t0Yuz2cnaoz5MDs2PMo
 stgsDj297lDaEuEzORyKK1gFoImptV+EgfhV44h9fZyXYfz6TiW892xfUjYOm7zXGKtZ
 o3IlUGTpQ8dD9XxIIJsTFXfuhRkqInEGIHB9dx/jT6Qk/ch8VLpVcHDbPXeXf35lC9hi
 gw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786349; x=1792391149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zmSEytxnSsOeAVTmebg77rmhsPGTLv66CwSKGtEva9w=;
 b=Y2/4ttfouv9ToElQvFY+5GobLPcqsQIuCdPPj6RUA0aBNKJhufzX0Pqbmcz//53qDy
 lmwZVWsaIlDtaz0aWv99gpCvBdK3pYOwrOiLKpqqV6c+dzpF0hvtdlsR+ReRJGnxkiwf
 Ph+guGYZ8wB6kXXB/fdHlMdt7QXrEWsv2WS0TV/nNcVN2sih2Y55SXBLRAobw8mWPSxm
 BTfxVNgT2jUv+YPmyrbv0hknDDmCJEB6iRInu7nu7d7zogdDMA/0XXtvJYG0IQD8sZ4H
 +sko/djRw3QalPOnoYDxxHO5oUeUtQkvshdxQVDAkicrFbzyWLCJZQ/5WkW1twZ+26uT
 k0oA==
X-Gm-Message-State: AFq9FYIaHq4SKMkzONhMx7B4DJFRs/KlvkGAeXiJQJKRtaaJ+nDyOJd6
 k4J5ZxRaUrBdM7XSffuv2eIZtW030y6ZNmKWZtFS6AHyZAjrJK220Y3FmpQ65g==
X-Gm-Gg: AYBFou1tc/71EvG96j2sHnOnWCcvrDRaAPp5nq3f4DB3FB/KXK+Ab6AfVi/oCvqSBUe
 72IIoBZC0IRGoUc4BMfKbCwq2do+rUmU5uPz1aQrhfyYQzN0Pr3LqrpTdjYdk4Yjj9PefiZ2X27
 qSFR3Eufh+bnxHQgw4ij07I9k4vMhg33+WfHKfGukKYXxfFKvuRxYDsKTca6p1SO20I1111N6kf
 kjZ7n7uHTLT+1l7MkLnfUGfM6i79e7NpzYmYwWPEyiV//zGsEkDXjAoHKgveo+TA7PInRJ+QXJe
 RxVS4KvRJx25TWci4ftB2snGg32KJxeaOd7jMb+RANSK+xrQbNllp2Q5u6eXX7zVPoH8n/kZtsr
 Mo54Yc2EB4GAkPJKrL+r1qxsJZ5+h50a9VIrOOaKNPH432TR5KxU2EReM2jfmit1ThHTp2q20fL
 XXRtPpIjRXNw9ljXh0AS6fjmEPdhur6K9wXEOO6kdxLjKmYzGFzCS3IIESyVEkjKDGumTliPB1y
 w861sikpWBbW1ToLYVKCKJNedp7Hs4RdHH9s/0D
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a18e4b67e1mr137811625e9.22.1791786348514; 
 Sun, 11 Oct 2026 23:25:48 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:48 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:34 +0200
Message-ID: <20261012062536.78874-9-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/10] package/perl-plack: bump to version 1.0054
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
 package/perl-plack/perl-plack.hash | 4 ++--
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index c9e2bb01f..341847e41 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0b3e573458b37ad69069fc8cb307b6b8  Plack-1.0051.tar.gz
-sha256  bebde91c42298ed6ec8e6c82b21433a1b49aa39412c247f3905b80f955acf77b  Plack-1.0051.tar.gz
+md5  2aff327a947accfde698fff73b42e1f9  Plack-1.0054.tar.gz
+sha256  55c44c483c534ac584ec334da29d9d7dafeefb26dda763c449b15da8493efca7  Plack-1.0054.tar.gz
 
 # computed by scancpan
 sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index 2c591cc05..6d0c04d56 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0051
+PERL_PLACK_VERSION = 1.0054
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
