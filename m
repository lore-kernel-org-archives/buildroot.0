Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E86C88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C7CA80E2F;
	Sat, 12 Sep 2026 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN704vhgX6So; Sat, 12 Sep 2026 14:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 82AC680E30
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789222151;
	b=NmBIhZ7ttlOSYyhgH4srVg5TYnKxOm8NKkXciAH1hU4dRJRg5OW/J1nZByHTUDbwIjS2
	 I0+BHLJuowUZr0F1p7aUeI2YlKugsRGSYa213K+3b3I/3yU1c9V3L298L/N9TPzp88wqh
	 CVKM5gPSbka97+QarsJflWaY5DNnqoJuUES6V0JPt3ywCVo00hIw7BOMyJVZN+oP6DvjB
	 650halEQAAg+tZugEZ/2NE6f9jlpKRC2z0owchpNUZXuLn0RF3P35cYP7a7DQm14Lpeib
	 X+rGVKlueHxWDND/spxRnxKmZDsrfSVl8tk/eZu05ZiH4lnizfFNFelBOp+4p48Trew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789222151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LQ3iQc+fLDplRZCkbFh7fMU06SGbwZoUQi1+awbAEPQ=;
	b=kMvlgVo02QZ+XjsMIDBSn3vZupH0R115df6dcHxF5BEGLrAjcVkfORpDPYyN8H0FPwM0
	 DG8r/9kadk0rpRzLO/GWZBhsjo+/lJKkS5j+3jWriEDqdBIk2M9xPkrkHPZI5fhj82wc8
	 QMAC9J8LLVlvl1QzgCkmVgTzrinAaJICCNHY5+fg34MTwo0zlePIiB2GYXey66gIECOS0
	 OJl/mXY3K0dzQDvvbciFADDjXoUqbdEzMBUymN5NBiYs9N4fsWom+fo5hyIVfIdC11H8z
	 oFncmvvwCFHr1Q+acNXvbN42itrwP8icIwK5Wb+QL5cqxphX6+CDst7UojMEPLQ8yMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789222151;
	bh=LQ3iQc+fLDplRZCkbFh7fMU06SGbwZoUQi1+awbAEPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eBnVolCc51Uw0xKVO3i0nVfHIN8KD4ZU648SMb34Asszib32oIEesD/ysYOY0gZKa
	 BGXOTKDQ2OIowPXuAihNn2j2D2NdJ82sHn/HOnWGqihj1r4pXDJ+fPtryziugTapqd
	 2i+i3nKlxzuHy3f63OhJAc+n9bWJbcdSFE6ZF7YCHntcSjPnsi2+Lqfeb79YeLeYdL
	 pM7k8bFd39bPBrU+bJ7Zo59lZXBNOWlJjJgBI3Ukwf90WgUCP/Wcp6QKOEe6qsd9Pm
	 ZFvJES/4NIj8BO5D5rms2E9ZRc5b9KQd16Mkt1RcSn/kK288PsecR7pqQlQo4HcQYI
	 dwUPeejvz7xIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82AC680E30;
	Sat, 12 Sep 2026 14:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED96701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304A780E30
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TqrXXTws8KK for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 55C0880E2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789222149;
 b=VSON7G5AfNEZudkyzQHnYnHpgHAA0mxJbCeKQTwSLe72mO4PmPTsRp7TWDBWh2pxyRQV
 pjt5O8neZdO+VlVYYAq/lFIp++/pbv15MwlUE6gUvg7xCGQEVd+d6YrkCzeylprnVcyky
 ANUarGerNZ+4m9ho2OVymHQpItWlvwR/d6CBsKKMUO34HBlXre0wx2rrn7p2I6zqUjFXk
 J/zA1w5A0c8duC8za8ylYb83K2nvDy87Ps+YNspL5uzbF/2KxjsAVQr7ToO7k4G65vi7R
 kkpgiKjkZIacjKOhNDyIdTM2wkNVku1x2594X4xek6LhUfj3SvzZQnWaqUfBVLoziMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789222149;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7UyIiRUpBtk/4uBuiAX/Y+CYxaMNzfgnOBMwbczMIX4=;
 b=FyC6hjO5QHE/sJDMo2wPdE28P/Tt/fKCOYBfjoAIthegvQM+AG4HpzCckeWg8Q6PKnwv
 gSFJAIj8tRNWoCClXwBlrFnvRXmZmzhqkYZP7mV772sZ7Sjh7ezkqHPNNnHPfc9/FKjRv
 ginEVKiGXtHNvYajuJTJeQ9k30eS/604QfGBw7nbX/F/BjPb7WmAoXylVbD854c9VQFkL
 I3S1J7dGFx8I9OLuPRXwAOxAT2XhyrZMHLfg1Lq+ZRknawsuRcjSqkyOLY9QT8cCBsCkZ
 zweK1qjjGhzg6UsjXKSZ4oSQqAM2M9YBrAv4vyA0H6u9d+JO0bkTeeJS/Y6QDEMWGBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55C0880E2F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:09:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7479957C3; Sat, 12 Sep 2026 14:08:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 16:03:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d540a10df9dbe8d7fd1c19f64d6594c36ad94177
X-Git-Newrev: 051e5ab13b751b474310124798b3cc6916ac341f
X-Patchwork-Hint: ignore
Message-Id: <20260912140804.D7479957C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imlib2: add zlib dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/051e5ab13b751b474310124798b3cc6916ac341f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The demo programs, which have always been built and are still enabled by
default, gained a zlib dependency in imlib2 1.12.3: upstream commit
f8a451043871 ("imlib2_load: Add crc32 printout") started using zlib's
crc32() in imlib2_load, and 31006b425e11 ("imlib2_view: Optionally show
crc32 of image data") did the same for imlib2_view. Both hardcoded -lz.

Upstream commit b9555030dace ("autofoo: don't hardcode zlib flags"),
first released in 1.12.4, replaced -lz with $(ZLIB_LIBS) and added an
unconditional PKG_CHECK_MODULES(ZLIB, zlib) to the demo programs branch
of configure, turning the previously silent link-time requirement into a
configure failure:

  checking for zlib... no
  configure: error: Package requirements (zlib) were not met:

  Package 'zlib' not found

As Buildroot went straight from 1.7.3 to 1.12.5 the intermediate state
was never packaged, but the dependency has in fact been missing since the
crc32 support landed.

Fixes: https://autobuild.buildroot.org/results/4e05404c353ef985d74757d0b1ec3eda2cdff523/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imlib2/Config.in | 1 +
 package/imlib2/imlib2.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index c47178f174..46edf375f3 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Imlib 2 is the successor to Imlib. This library provides
 	  routines to load, save and render images in various formats.
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 5ad89289a4..c650981501 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -12,7 +12,7 @@ IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
 IMLIB2_CPE_ID_VENDOR = enlightenment
 
 IMLIB2_INSTALL_STAGING = YES
-IMLIB2_DEPENDENCIES = host-pkgconf freetype
+IMLIB2_DEPENDENCIES = host-pkgconf freetype zlib
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
