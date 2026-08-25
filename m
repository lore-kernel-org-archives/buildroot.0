Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089F0C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA9380E09;
	Fri,  4 Sep 2026 16:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkMh60zCfB3N; Fri,  4 Sep 2026 16:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D179D80F64
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538929;
	b=LiYjvno7h//EqkaAB4Cb8NAzJR0U9uuHk+YnA0aan9DfVGd4QsiHWxLaANatY0LJ5LKc
	 HW+o1c43ir0ZpGFIjFFgBaStwxIJBFQNWQzfnBZHvr9YYs6ecPBVYIIg6aFN7YfVE1RZ/
	 XrubzrtbkNULM4LABd/aIbOJge+mDLrELELE97g36ihyDaEFJoaOXUbLY6GP1yVGPPjfD
	 K/Dj+Oca8ALDpsvJ6gXs4GAo5ZIOYYd+6eb4ffsOaOapVdRRnIDXyzlwCZxnpaVAOkWAJ
	 8j1vK0YFqF1PPiC37mQpxWOdhmg5U5qUATcEWkl/6JRTMvSjzkgpn13zgZQ1rIN031Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M3i2ah063YkuYnPEDNgn20Jnqt5IUASvyopuOgCaGZE=;
	b=Y8BBAilDtZ3gIEAxDRhAleIS9MzSUTcjEe6ebiEbVMXu4iQ0/dVSxU+jfqY/vNte5KKH
	 /kgpp/zae43Zj4+bbHb2MXiye5EpDFTJIQzela57L3gKDNIFGwsHXjIGnEZMpiRqi2F8B
	 34RbA/M4Zlu8KqXT+I3Zvx1mALDt/QXhnfeEkO2bhdvfd6O/Lc+XDqshLL+bY3FA9LH3W
	 W0KQV6UYqJOu2tavdMlUuEd1KFylBfKtt8sJVFSiPpGaILpZz/0pOvKp7V4+pK7MEiUSU
	 0gGGdZM79/7SAje3S/O1Effa+3OOYNarEX8TRKQzIhCUCGiJyisn5qHA6fwkMJZjI4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538929;
	bh=M3i2ah063YkuYnPEDNgn20Jnqt5IUASvyopuOgCaGZE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gJcQlL/OXpqTRCSbchN68jfPehc8IjQQ+Qbt0RbaL9SxlgUy/oAA8cT9sazX1j1qw
	 LXeF2vLZO/dVqgbXijIQY4bWeeedvMKIGQv4HrfY7y9Kuk3GulhtxOhlUHayT2pdPJ
	 1omq7ViKjQHPWbYXoWXxm6aHTmsc3NjEAMGr7WXuQMUwUiK3orPVCRGXGT0J431qXv
	 mjkvUMEaAHZoBL61QsALiO3U0aXQ57gO6/1wBnya+A7xO4TZJsYA0WtEyor+yifE7a
	 txTHk5es+XBjW4DxoJRQnT3m6a3fWsApH6430OW0YQ98yHqY4ZjrFqaQuqksGSzsqd
	 VJhpFCug81qYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D179D80F64;
	Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3416B2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5AE040AFE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrGPigMRoL4T for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 248C740A61
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=Y2vS348sW10WPMC+66DzdqrPqux3Agc7XgJxpRTDxfHwXantIfKZuRCJD/f3fBmoOtle
 6TLDNLqEALLt38gXwxfwwPc44IUwlZXYLFSr5AwtYb3K+B9Q30ksHFtGvRTenEEQwZTC1
 pqfLGgEn7s0XCUR+LZMnngInQn7LQoH6ums1EX0Zirx83Fx/BjIk03jzg2i0AJqbK6wIB
 N4xzeNBbRRrmR+uL4Sj0l+Hcl/gXT3gHBzajp7vE9GAXu99d2W05fCBWl5i/OtaIcoomg
 Cmtck9xxL4KUwJxCIY3oAP+sNjHDGqpnXerG1hfL0BjWjQysvpwMQRonoEtwwQr2qVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=I/EQVL5OoXwKxmnDTsW/5F9j5J+WBIRTgo1nRuU1Uus=;
 b=hE0d9A05XcW632xjct2YJVO9/oaisiIaG0hXLUoCZd7LaXufdwkEp7mY+WqMfPphscFK
 ribUw28fGRCe+HUN3mywHm7Jg8PIwyX+9lBnRzBZ9P0qxCupBqFMd+sphwloInI6wydMQ
 vGew+9zIUOi56c5ESIbyXsX86YUyAPRj3ZTDaZjXpwZanUsIgyhmvNNuoPdpTKXkspzXf
 QqtxdMRr1hWVjXe7zeaWv+0bVDB7tYCRJ9Q8y+hAPvzhfe1hkTwYXqkxx5VyzhpZnLZlx
 o5xOfMW/pT/bZmMpndVE4enQmphLSacT5TPlmhgWDzeeoR7QOsuVUIDi7zpe2WtcpFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 248C740A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 958AF94D41; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 22:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8dd506faabc65d3cd678141f4303a8d88968894
X-Git-Newrev: 009d34015b44075e15c632a514511bdd27074aea
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.958AF94D41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpsl: bump to version 0.23.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/009d34015b44075e15c632a514511bdd27074aea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The most relevant change is included in 0.23.0, which fixed handling
of trailing dots (so e.g. "co.uk" and "co.uk." are treated as the same
suffix). Otherwise, it's mostly cleanups and support for non-Linux
platforms:

  https://github.com/rockdaboot/libpsl/releases/tag/0.22.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.2
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.3

The COPYING license file was changed to a symlink to LICENSE.
The changed hash for the license file does not imply a license change:
it is unchanged, but the copyright year was removed in favor of a note
telling to check the Git history. See:
https://github.com/rockdaboot/libpsl/commit/da5479661839e25783ee482e0180efc3d28f2428

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien:
 - rename COPYING license file to LICENSE
 - add extra info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpsl/libpsl.hash | 4 ++--
 package/libpsl/libpsl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index caf760c496..5446aa891e 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,6 +1,6 @@
 # Locally generated
-sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
+sha256  93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be  libpsl-0.23.3.tar.gz
 
 # Hashes for license files:
-sha256  322392e6001b2b3b0fca705dc9f11f26e12441188ecde50eb1d22909980b2925  COPYING
+sha256  e7c9f0d8498d28a360a7e8293ea70fd7bd952955b636938322c13d60a03b5a45  LICENSE
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index d1a12f864c..95b7d38e6b 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.5
+LIBPSL_VERSION = 0.23.3
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
-LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
+LIBPSL_LICENSE_FILES = LICENSE src/LICENSE.chromium
 LIBPSL_CONF_OPTS = -Dbuiltin=true
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
