Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D6CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB90740FA9;
	Sat,  3 Oct 2026 08:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsNaE_0SZD5S; Sat,  3 Oct 2026 08:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C1D9140F70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017111;
	b=i5cfKrvDCviET7IlkVL5tuZiw1f7Zbgkhpemy3cy5m7EKnwYaO77DJ8b+IzyhNabWVC6
	 8X+uq4DqxMGNpgCGntL6MqXDZfwwt4xGwAH7oUEy4QMgkiY4n+IdZz4XL/rWgUTdVWvOn
	 Taxl7sJSlgH9jw2jA/a/7/GPFzAbvFpkQNLv4UOlY3r82gSwvTZnHKWiyVdxo1pBoKZVs
	 TsyT5uVyY6q8sM0u3AKk5TzlCW4nkUiSCFtLDQY+VzKi/zgoOaET4ZYW42srksfQgpJkR
	 x9tyH6bn0X3VcWKvnQhGYaCLGoTDTUu7RKn9xX927AOONfa0xVx4dkUhlRV99MPy3Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=r93pJa5EDZIrRo4gn+5RKETh80xXbW6FDXrU293sIY4=;
	b=BkeGkGzZXYTMf+Rs02XCU/c02RziC7ROnG1tgYfhIDlTdYjn/ecnoOda2ZcHIjW79CE3
	 qfKFbqEiAHE8N9MxNMYU0BUycT+bdaIUKy/zk+Zgye04AYaETA6fVlu9VGJd7LzdtK506
	 kfTwkaLKCIyCOXaWLzhIgw4lsFBVe6ws9sVLtachp5jQxUXRyTNUODqQz1nbKqaS2W2pE
	 VFoPQ/N+Wy0CmHRa5PigjiF+oh232Khv6U+hiMy/vwTN0Ft9WJyYMGIDgwU7ttqY2zk3H
	 heqlvzxPiP5MPXo9UQqVMsnQ+8dgm2Aj7IIA0WF/5Mgt7oyAlENxjLB1uTOySApTMhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017111;
	bh=r93pJa5EDZIrRo4gn+5RKETh80xXbW6FDXrU293sIY4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q0IEm9Pi/87y9lgFvJ6V6BlAx0/aeoGiaJbiZazJ5LNZmOpoO7YveLnfQDsDotsUn
	 H7lbfJ09WKjIYk6Mqk3tgKUMr5mjIcamnKZNa/rZO9WKwpvavLSJ1K4NK1EpaSbJz6
	 +7hHv+YHfH9uyYKiutyqIpAvrhtBSd6UPzDnHhbKWQOBTl2d/dVMMSh65pxOxjgItR
	 OhLUH12pwXrQV6EjId3Hhi6jqruai3q9U44RtkJzyMoVb6MgVwDsrwBxiO98e2R/p0
	 RnLZMjvb9iAYjEKqEl3G6NMS+jASmZCiEKo+fCoOvFmtHtjN4wF4MRIw9aSKZnx+Xm
	 Hyuyw+TJP06dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D9140F70;
	Sat,  3 Oct 2026 08:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA0E2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D88B40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTvxBqk0aF42 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5907E40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017108;
 b=UZvnuS0fAfQgEhQHaiPcsNQ0L2HwST98OWVRxnYBrGB9OSGhAMzoZSlSFKRuDKkCMk/S
 fgjfRroTnzsgn1wyN8HCkPzeN5kREuLZ4B3IhveYWoW53El0ln43TizloiIt0Nq6Z7JKU
 cNpMrejIEYrB3uQQ+mqwMl2TQ2qcIzqmWpnpSbzjOCLN5l53iTbYzG9fzgmrdOVW1Rau5
 FK6Sk0HoaXWUvX53HOS/UdySIfnVqwCXhc0GrYLqe5DB80M18Wn9wfjyIdxPpCJsWpgWN
 SyfF8p/CSpQXnAfuJKe7tdif30H6j+P1lHowYStZap8bcAAgVGe4PWpi7Hvt/G4Rs2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017108;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=l4VvKblOTqgdYxYRs1arF6mzfBaC0OxJKktRNv6+dWA=;
 b=TaCw5dV7KuNO03wYxMhE+T0XVUQvuD1489xVb3fhKzsAQjiwIUrcXYe5cFxdfgu7kNEz
 VWVXYMRXlEnN/PWCbz4a3B1Pf7avMwJqN9dlTmKGTA2ElBY9C5LC67JdjDEUJIvhLNODQ
 3elT2EHsMIDnFT26abfrGyPap+/9+8cF+N2ODs+BNl5NvKAI/kMpYE8vGBneZtVwgT1KQ
 OMekDElBid6YoWEfE1NCDQA726PMigTB5ZsEDoPnaLIS8JXu2i7YcJMKYks+5mD9OB3+u
 SVjAauYZx5kCJpNM6P5azQCOmmYzQl0jfuRkm2UtbuTSSRotE6VAbV64PCC0OiX+7tA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GY1AszAa; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GY1AszAa
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5907E40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:08 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-80587a80992so352824a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017107; x=1791621907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l4VvKblOTqgdYxYRs1arF6mzfBaC0OxJKktRNv6+dWA=;
 b=GY1AszAaQYOUykB455Sz0hg00sBD5hn06xnd7mgvrlMsyt7C1G7CoraJHbWySxEYnL
 Ac+hdows5vTvEbTj56X13LXRdsnwM+KAWyzVbetNNyIdXFPiJxHhbQQikbS/vblscSMu
 kMUlwy0EkKphBj5XfXp1O7vYUrfkvlcARGr9FmH/PU2aYcTjKGlsdj1FmqvnqhIFFl3E
 Z2MDX8E6FExhUvmOiD2T3+NM8+hKRo92+B7XHweeZ8zp2sZXJ/MDfoM2afR6LBywmosC
 9qilpfbsZQK85YRhtTzjlidR3xo0v2QreAwIqAj9kvlB0iV36EdLxb643+BO0U0702KJ
 HYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017107; x=1791621907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l4VvKblOTqgdYxYRs1arF6mzfBaC0OxJKktRNv6+dWA=;
 b=DBPTgnuf8l6siGkJcZbfhhZedUxaWdgpN1j9TNWu5rLcXwwIVC9ZT+molOvVXDi/R6
 WJLAppyzYMLfDtxM09ZSGBdEFXbHKYFUpdrizIpIykXp+keEwN1Yd4IRpyRd+q77z18j
 FLQ1VNzS3fdIpmVwScAVYv2BlXGdoOxSV7T34Qtw4xWpEm4TEqZbu+GjJ6Ecv/viOn5C
 228VtQFzmr9O1hNBdai/cBaUe01Fsa7dQ6NTsqBOwTY1c1GAmoaP5e2tnm3o45BJwqsa
 +U/IgqRdHBPjZDQMJGIpkHNEX5C26Gx36AcgJ1YETK6G7OMkEpR1kBFjH6v4PaIyWyfu
 KNnw==
X-Gm-Message-State: AFuF++lBfHj31SaAaXLyzQ8d9tTUOMU8woB7G9GSGCcKa9OSYZ6UV0oR
 /TczxOoUHAzloBrC+bqzg3gDvY9IDOEh8RsjxFtnUYoH2mqGx30Ux/7UNsJd1g==
X-Gm-Gg: AYBFou2SWBVpQOQo4rmLFR7/BCdmhokANozikCt4oshvg5wz3GXqRq4BHCEzPkXxRvq
 dmXW59ZZyiwB8XNWXHfzX8WL9PElXRDeF8pwaRB1SQZi7IdDa3sFPTys2N6Vh8YKdkfjiPFBYB6
 ED+ocU26+8jrsBWb/57iLSz1poqU+xmwqbTAdS4A6p+xUY3tXrbCc06zbQ/0lFN1vIMv94S439l
 GoPLClOxwKQVdLjrkU2PpEsv8jPUHYzfjlugVWDNyZXBQhxbK4UULgGooi18nRuZQuRBvupPsQz
 Xwk3WqNAtlo+j+HuY/REYhZUsZawH450Q1THpWrQoiqHuRnruO/nLwqsAif+sm1FC5QW3i7IMC/
 7Rnv023m4Ov+Zdh6RxwNWRcvt5DVd6nepHy6GOsxXk5D+i6pWG7cQYXjoN5vlhhDjW1GUp1DbA0
 tpJNGjfup863NMa3heibhJqvIJIZHlIp70RcbKIKbEiu2ayHQZstvAV+5GySyI1QZ3FnmZLN78p
 9nttrFJYagCgxpyWPwL+0ugiLAvHDi2nrhWOamx7Lj7K+8yzasoBr63d1QV/S69WgYDuUH9mdEi
 7BVepUz7KyQIwTxAsXQoN9zznMZgqv8iq76o5HQptB02SDqCZ+cgEX4lE1YrWKk73L78SFtOZbb
 qCS8N9gbm55nJN77K0duFluEH8ZW4GHzCQJXGJvG/3C3OaC74Hrvs
X-Received: by 2002:a05:6830:719c:b0:81a:aa47:3d5b with SMTP id
 46e09a7af769-823fdf1184dmr1722063a34.28.1791017107093; 
 Sat, 03 Oct 2026 01:45:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:52 -0600
Message-ID: <20261003084453.545653-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.19.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 85ba70bc6f..97503f5529 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  f23885cc901dfeb73d3eb56ebc80dd56  ecdsa-0.19.1.tar.gz
-sha256  478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61  ecdsa-0.19.1.tar.gz
+md5  8071b518f3f3235e5ecb9b710314e592  ecdsa-0.19.2.tar.gz
+sha256  62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda28e4f3455a2bf930  ecdsa-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index b1ac6fe1b8..ed6b9b0ea0 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.19.1
+PYTHON_ECDSA_VERSION = 0.19.2
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f471eae4b26bd13b698f6af2c44279f67af317439c2f4c46a
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/25/ca/8de7744cb3bc966c85430ca2d0fcaeea872507c6a4cf6e007f7fe269ed9d
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
