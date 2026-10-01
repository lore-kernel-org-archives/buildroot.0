Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2947ECA5FB3
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 07:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D805940D15;
	Thu,  1 Oct 2026 07:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9szr-umNFdg; Thu,  1 Oct 2026 07:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F32AC40ADC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790841280;
	b=pEc7g3S3FeBXc/pbHcuExZXEELUVsvbUMFiB01WQRXtuaPlCqgXYQeCW57k08rIOnkkl
	 IQ2GTEB0bCDZIxD7hRSOds5gE+2mKU5FqUx/+9oX0UXDbpwdjQPf6PLZzGMt9zaKbgn38
	 vArPX31LzwhaUI4fVceTVyhTpkG0uCVbYw7krA4LW5GvyMxAbCRXu5Nwwe0vNYhwNtpvK
	 DADuVSC/KQ6lG9rPsw+wqAMC63KVph2wmzpkZKkHJ5eYWWfTELjJdVDuFphI9p4g/hcGo
	 pE4qN7XddaCotfmxX6Do4xIhj587zcxBhqVLbYrUwlVaBU3Vkgq7z0C5kLT9xpLqdvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790841280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xO3Ge586MRfoLwyiiGrqGJ9j/MEgSYYWdPqCOg/Z4s0=;
	b=AfuTDcw7C0wbX5D48dmZglBoI+BbOvPaw7XhNF00yMgaABBkEFdIrARXYQR5R85akMdX
	 F6y1xKXlaYCbS+k9NjAlnP51AbThPERWNNNuW/i2qO3TwThOfS9CTxWUQYWWpovDDWRj1
	 TU0LGhlYKlKituFL/Haf2KZAjNYJP/vGVyGg31CovvRyulg1XAtlRhIJG7r6QMgOebocd
	 HpTnnaM+wjGiDp+1DuT516M5aH2BifNw25fIdse9JeH18FPJ5hIyohmwfiEKiQwvqj6FP
	 OsFw0GrrvNtp3e0UvRW285qR3lQ6PbnWi6VaFxKsIWW/GL1U9zFVbbIwE0wGz19UIZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790841280;
	bh=xO3Ge586MRfoLwyiiGrqGJ9j/MEgSYYWdPqCOg/Z4s0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TT+pAU+4KM8JLMV80JjinNZrZP91d7M4FpYvn/48QWRTNPNdpmJwxlVkAo7HtHjGm
	 /vaI76cmwE+0i3wgvBw7KEc6RhtuZ1NSqnTaEDqIWAHsMx3yvkkfviXg8YOlkR+J44
	 yK9XV6YkmSzSX3yL6eIcXHIrTvdMaBLmTmPWpxE5apjb2tuQdM9auFFljPkowrTMuI
	 IhEqJ2aUuAYlqCR0ZbbE6+VfcNtrOJLNSetuq89c+VjpYrFqh6nUMCKM1FeMLQTONv
	 PdKqvDHjzoOrKUbKy+Ndy9VedmsvsvA07pY6/TMxu+n33/Hnwd3nSXzCq4PJM7op0x
	 qvVfD9Q89zlxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32AC40ADC;
	Thu,  1 Oct 2026 07:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C313B34D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 937DF400B5
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cYL9iItWNoZ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 07:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7C50A404D8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790841276;
 b=n6GA3yFcnZ69ogV8XxboBGhILw3mZN+D5OqMl97ejIxvcEy9yg3NEcmjXMZ39b7M0ygy
 QzvVk6SZS4opi4ynWZtwFwD3bD2ATRAfD+ndWsLxc62cGGsvC8RHfenLdPmpqF/sdYMrL
 6IBY9Kgyxo0xAEssG5xkYiBVdvX0PcKH45yY0WOIfsTf4cqtylQjUMm8RsRn487/06NBB
 hoQjBeq2GrbhhSRVdx3ai42U3OpqJ3W1HMD5bcOycb50My+oPCf4SbN15enSNMb8jIeDJ
 Eb8VaBhqyuJlgfQhY4gYA5tYHceG53PToSmVU1eiOLFFvC7AAS6MWRP0baqot9vDgqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790841276;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=yigs+8Tbd3EGXzV1q+V9f7UnhnhDa7GRkBNWB5JtIzU=;
 b=A/2pVTYBrcFSqBLayfbZbd3/Ht83Udor0tV7yCGBF14eZGyEbypPwVMkSVDuGiHJgZ+r
 ed/cSWZxG7nP1f06o7563itQO8V47wJfzFWeRQMBun8a+bA4LjoFjnGlJKCJQ5UnwSsAM
 ZcCwgC+pSiSI0DJ23Ee/Kb3Y47E+7NEOWb01ev0/d5LgbDXJx7J4I+gwrdO3ZRB17KcIa
 Qda+N5bILGnqWYjhHIi64Ag1chJpIKfzBEKtpmP+S3yfe06gTyygw1yCzvwaMsmEuf7Nk
 g8oCjL90t7quRzWCG1osNe0EiDU29ahzZrc67rtZ0GPNv6R1ik4tQ0hrXxBHe+sGyZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HHNrKMEd; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HHNrKMEd
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C50A404D8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:35 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6351831so3614378f8f.1
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790841273; x=1791446073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yigs+8Tbd3EGXzV1q+V9f7UnhnhDa7GRkBNWB5JtIzU=;
 b=HHNrKMEdNf0r6RyGyhwHKTrMJ0C4rTrm3X8EI4qaC6Gi8qUK7+wo+pCAzhK08dQWhc
 Dva5TsYt1LRG2Xnjds4hu25izvYFLpuIQvLymDS0xaBkwUTppnVn3g8968JrNZYuojSH
 2ZRbXXYPcAZYfcAZBRZwqY8UZsBO/CmU4hwRsVxhjcynxKBMjHn2Vl0XNkY8WnyMdU2H
 OJeTmwP0cmOhUbY1rWLmSZo1FFTnz9hD1QWKK61CBfpd/OFM9v87l8ocohbSlW7ow04G
 XoMiklK/BrmuflhiPHK7DN0fak6TzM1+oqqahmNXM/XpZd0Rw+MBv/g3vX/WK/1vqFE2
 kAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790841273; x=1791446073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yigs+8Tbd3EGXzV1q+V9f7UnhnhDa7GRkBNWB5JtIzU=;
 b=iR6Xf/R2UZDKL44yLq2oOxQvvFm/luonzfbBl5tb7yC+WXkrzQtV+17dXPBhLkOKCi
 CsV0eN5INmmxg3Py/O1+CCPAo4KTulbbWaoX4gqsZawoQ+4sH6/alhRgDk65Ab580WcI
 s5qxXWvyI3XXISDUuwAPfmPOKfBT6kxnrOdKlnE8XgeZQInUIlqwpIqgIEv9GTNmNyPk
 e1LuiZWoDAGCHKGtDfaf02q1sh7HnDpnaClwfMpSu0RpjJDiQbUA03lRaianxPgqgPrF
 AABBy/bPOOYSZyGS3AiZHYJgjynZ7BaZRHRUM0c/tOgP3IwbT+OsCCjOhVzqUwtmPryP
 58xQ==
X-Gm-Message-State: AFuF++msrNrzm8Q7kkF8k5zsBSVON0gMBuL2CYmhRslb0rQH2I3ZXUqN
 mx7bF4pTpTf3IfAIP87vgjY/JM8pgnBUju/ZRy++qmj5DtBi7wyI1xRKYG8+Uy2K
X-Gm-Gg: AYBFou0PP1y0GzgpLnFgTNT516ts4uVfiNn1pkSeFPp8B8NnPgk602mhHi/szCL2w2r
 vYO2j0yGsb6h3ZtF+18krwRjzEVX/gr2meAjIvcUfHHgbAYq4f4P4CVNdyyRVGU3DPx5oV0bl14
 DmITyBGY7gLFUjdFGdONYtJHZT0uKAx/JKCqTzg74eBfgQSwjwNwcS2tN1I899L4sE2+/rD9Dt2
 RYEV68IoWYmjWtuEI4CnOEvVNPkOsLq/DMyxFKyfAqcLzYEa+ZxZmmjamenFa/v0KbPBCQCxx2I
 MOj/1xNqE7cJVkGKAITtMRrUg2YXDVSl+SQXB6ZwdjcR/Kv69CVSgIUfWIb9P4fBviNluJC3as6
 1+2X3cA/g6CpHQaz0tlWRFuvGZQiGDAbI7hd7Rk3zfLjWsUz8m0Z+ey7VDPy4kaOcDIJD7xzz+e
 EijQYzHejLoRDhqFCINrg1UbBXvZTo46M85lDC+b4PbwzSuV0ekrVdEysqg8MdOyKOLW1QCb3bu
 oiwJHseaodl7Lbk5dUuN1N3IaiKsdJG56mfg9LSWxPLirVZB/7JwAI1E0svXGQtQm5NM5os18bN
 nG1Wu2IycBFFxXLFCKSGhn3/D4NPmKgcDeEZSV6DA3w2QjXG1fivLCX/83p9QKPgQ20Z3kef1pM
 =
X-Received: by 2002:a05:600c:840d:b0:4a0:108:3b54 with SMTP id
 5b1f17b1804b1-4a01b128472mr68786975e9.32.1790841273107; 
 Thu, 01 Oct 2026 00:54:33 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4a01fa153f1sm44826955e9.0.2026.10.01.00.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 00:54:32 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu,  1 Oct 2026 09:54:27 +0200
Message-ID: <20261001075427.539773-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001075427.539773-1-thomas.devoogdt@barco.com>
References: <20261001075427.539773-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: also disable internal
 ccache in the build step
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

WK_USE_CCACHE=NO is only passed to the configure step
(WPEWEBKIT_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/wpewebkit/wpewebkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 1f5f4aa5e64..c424a3c4b92 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -24,6 +24,7 @@ WPEWEBKIT_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell wpewebkit not to mess with it.
 WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+WPEWEBKIT_BUILD_ENV = WK_USE_CCACHE=NO
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
