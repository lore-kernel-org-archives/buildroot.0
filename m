Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5EBCA6011
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 18:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F3B40913;
	Thu,  8 Oct 2026 18:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7lWumnIdxQB; Thu,  8 Oct 2026 18:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 16DE940908
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791484162;
	b=PZmUSXC0MKPXGfrci4/wGpi1FMDyDC9Ra6Tbw5SZkomZWZ/675RzQRdTlelQLEk2LEDq
	 rClUyEF+NfDGxHo+cT4UOVBAR1LEjMJwqCKkYYfxnmSFBAHkO2keRhfpRqgLidqCkJegI
	 Ag2j6zJVb3W0q1Xiw4Cyqw5lNRz1+2GZQouwy9o4YpbZ28oXB2KissiaOM5pzc3PQUfA0
	 xowLJkyh5U51DyXngsGeToP4qyKb6Bq4dwAETBdQVSrkixoZrp/mcQNPTd9SGeGXXDMAa
	 kCsdbh4ktafSjwZjODWNSbqxiPwDWEViq+GAvAIbX9WbS0XgtxT2LpqCKj523gsR8dw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791484162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k/C9il0xc7t1Zy5tY6ij2NBgaUmwEnIg4d/5g75Rs/s=;
	b=SX4Fl/9nCqcLiFQc2v0Kn4OItlU3IkmZPskg4s5nAGGVTb5uHUiLC3HayJCYD1uiAk8+
	 R7On2uyCHZ+bDrR+ZCyhiUTjzj2QEyMrJryxx6Vf5UQoV/kbvz5Rqwd77XblG7XSziT5y
	 C94zk4IX1UqwFnnRYejeiXQf3+bbK5d8oGJccWegSWkFSGALCUokGvHIZMavnyj3Bnomt
	 wtUM8qLJtFH6Z5Gb21c6fOJ9z+m5VVaodT4LKQ9ZMk2tPehZdvG2FeJzBr93qIiLgOjyH
	 Hta7eXw8QpWb9aicWjqfEOBXEjfJTwdIU0C+3kr1DXP7UIO1+C0gvIeE6b+ZnJYH7yQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791484162;
	bh=k/C9il0xc7t1Zy5tY6ij2NBgaUmwEnIg4d/5g75Rs/s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mBip9sEnPBTk9Zk/6EeB1pxI3RMC4k52clZCCIjx8bhRCoGNV+TGq6avIpIvw4Rql
	 KyOLdrlYDtNK6SELSGbbf+l4L+me82QZa8gpNfBxmIGvYkUcG6Vts4LRrJiiOALbPD
	 4I/T4QStJ07q96Cl0YQr60yJkpGOHb7NtfHygqaMVS1V2gYq3wWj+sR7nY9p7QPGVJ
	 ThlwovarFYgf5A+Bor50tbpWmAEVKqoKgDO+eqh5fvNM8SY5rxVpa6Ki9fGl/5OECK
	 JX6izybq+x5CI+TfF+CfDSiOd6brvqhtHXq+tWrp2LkFr3Y5PZ2Ciok6hoX53SQX46
	 gzxSSd1wnrG6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16DE940908;
	Thu,  8 Oct 2026 18:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E77D3338
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 18:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94DD60876
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 18:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V3ovRp_I-2K for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 18:29:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 559FA60659
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791484158;
 b=HwzzCKxVUZHI6+ZS5eWGUwtMQsasnI15zlQLCaMqKH6EQ3xWGgSb+6kwfGfAxjHoQtnd
 4PctWwKYYuXqUhZU8Qjn2yqXWQV548CZwwYmSTqTYnKwdYxuiTq8LJgUccXhEhzydMER8
 i4WwO9No57j/VcLKkRSHPVJ0zqdqYF+LKjRnwfolCAAG1x6Hqb50CjUuZLN25rIu5FDd8
 jtGf4F0Y4OtQMGg54NMvVQioY6xFlOEyK8K2mv62NBDFlQ95R135YkS0j7lEiZxMex6l1
 RLBgHQSIL1OKXSVqi7RF8kCzrq9JDLzjUq0njtYB8eNF9vFK0jTPlAbla9zE6QESfLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791484158;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=M3KlzXDwQmXspUHqksdi82370s86ZzeyyZ+zMz37UAw=;
 b=lnb0dApnoiqNfmhhvFW0mEWn1/RoAOtdmngvxa+CrcFtQNDp6XWEVtRZnLNooNj9Gm/5
 65E5IlYc8qklEAtexkKl7AV67c+U+7XLRthIrB2NHCzYzIQjvD/WxNExHEAxP518QsPAb
 BNz4bMRSc261jW7eYG+g94oTm8gXxtnJTaVIqY6odzLys10oKCb4Nj5Oa4UxiADiq4Gdp
 ThFQYtXf9MwTqhHT58kQoFzLKkcQqMb466g8vdOvgHXmqg7+xkqxrtV6a/6FMc/xOVK+Q
 Mfti1p7bt0cVsVnZV2qZVpqnyWHFmYk6ASc9nzBhpfmITd70WNyN98Lq/1j6cdQXIzQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KQMx0ApU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KQMx0ApU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 559FA60659
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791484153;
 bh=M3KlzXDwQmXspUHqksdi82370s86ZzeyyZ+zMz37UAw=;
 h=From:To:Subject:Date:From;
 b=KQMx0ApUzkyJSgMrmq/2q85EbFwd8o2MGrWVau2K8aR00Pe8V4yx7/ALKzNyz00fH
 maECH777jOMGQNVXKeIp0ip9XjRC6RQi5+jdvkTPoQhUBo8+Mho5jeY7emR0io22oS
 3/oRYpQa3UWsQKNxdOlSAcyj8NIzyeBsZQwYbZ7K7XO02m7NknsBHwoVXxlniEWhMv
 Ljq5fT2BiLx4+m7ONk4ldpNlDoDdp8rQmeqZeq602yDa5vRLJZ3DD1Ax8O2NOb39dc
 PYdHDOEjFf0rhnSGeLS6jHH+pzO/LH/Ruj1JNEH3VIWkj8XYFNFXMeHqgscJV+HdoP
 dJv3DzI0YQT4g==
X-KAS-Sym: v3:f51bdf72230551df:WvVZrixeUQDnNg9mn7QLGMDIyViR5gy/vYpoqxa3xiH4E
 OCMjU0yxIAObhAlFSuTjUzNEgfPIE7Xa2GJCvMKBeK0l438ik7mNwGpl8e4tIgtGYab2N9PTbGT
 Z1ZeTxyl1tQn8n1fk1Brql7xq2B2tLfkRWXUZcV1hoC/XNohBDZpp+mP27UACvrvSNJub+QatAJ
 QnilzvqwTEeeRiozL92WUzgZd54kjZqjOcxhznyI3l+/LwFC3vNNY2B8BRoKN1DMUKSJWs7rlsE
 3CBCbJTARC7Fcwz2kpuXv7r25Th6xvrmHdHXMTqWH5DiuFgh5gxQkfLLcvYtAdMCqVA+urmg==:
 MxzqEyCGymRGFcl2os9O4gtrG9r0q7m49ip+DQUNrXXK4Zr5AHjss6zRSzH/SumiMsUKQ+I0U4K
 xdUKUmUAb9zqp6SOaYd1iXSTChA5QmYa5cTxuyMLroA0/Q8cOhvCrKLuaKaqzsFN8x3962E8+1Q
 5hRWRFbubHgVcxzc5fkQeILDIsL+ZsyAcVaR6IhG0DJmgTM1NatdSuoiIYLnT70mTkUmuw8aOyj
 puYJvFzOJG6yQl40gfWQYjj32ch12yBKmHdh0yzOLhd6UFnH4rCLiWgrkhyOI/fp3QahKj3E6op
 3Cm5HDDK1BLX3X/g1wE5uC8bdWbJAi+O+josheFGFVHvjopZsV2mpRch44mxdlBri66fImY9Bjh
 vagb5KG8+rw450LCpoeUTXKwcaHIaGEAwHY1vhJUjNsqt3PktMOJTDN4jB1WbKNGIbn0/KTPj50
 Jk5fKrMWz+AdpMiBQJbxN67Fj/erbLvrBwvQGvlwuRNrBve/+AA5WQmhmOsYWxFdgVkI+1KQgUI
 8biQNnwVfIVQU/pukeS3wBidrv1VbnbHL2u1bhZ/Jp3UGefOh1avjaCP6KhOKLlO112AuSK11Ub
 4ylD
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A720A4C4528
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 20:29:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEsrg-000000000iw-3jxs
 for buildroot@buildroot.org; Thu, 08 Oct 2026 18:29:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  8 Oct 2026 20:29:12 +0200
Message-ID: <20261008182912.3700979-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.14
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags

Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7d8511992eec71c8218a4a1fde6cc8c0b69a2cff

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 92e5fd4782..37dd1e6000 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
-sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
+sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8de7ba50f9..49b9524c26 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.13
+TOR_VERSION = 0.4.9.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
