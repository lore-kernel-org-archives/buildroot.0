Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36528CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B0B810A1;
	Sat, 10 Oct 2026 16:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8el7aLI-86Yv; Sat, 10 Oct 2026 16:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 03D1B810AA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649688;
	b=kJgsygKmhLFCz9n0Z1VQIGaOzQyWLl6CiMxlNKVl6IunMoONRCZGIOFoUFywSpRKuIVi
	 uhTRC6t8oHwl3x0sck/v1hdJsr9IfdlCNKmIoQ6Dg9+jHPWkPDA84x3fNA2KjbamZzOY5
	 uekLzYRvRc/srtJDU8chLIPGaavGCTxAWYR/vW8+NcfztqXDb5oUkV37dr3/kDRGIIfUM
	 Xad30ordq/8Vaxcl7tdZD9A/jZwlCtmFDWJ8LP+Dgzyul8NSWva4Wpd+T0AYU5muki+If
	 RapxY3Hybmw0nk/3o2evAh8OaqfOaY4qrcUmA/4kc4PQN/LPwltA8fB4VAh/W5k2I0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=H5rFYQV0PsAiRh2IgPYDh8x8LfELeFupcy7yiljJSMM=;
	b=L4FSc4Zej+WLDyRv2tkIiIjwGHW7XSGf1hhsHydwynFk1tPPumbh3J2lEMOO372erNjr
	 obghiNwK9Yu2BHR8nHSIBUzIkKH5YxKy6LHUgN4dsd6v2AFamYXcaAdTouEOHsw9YnC1a
	 9tD1DCc5qkf1PJZbM0AXhowFTCBKrNTlhoNp5byX3J1e2RmRzq/yNt6n9/UnSHiGU3kVj
	 NlfNyP7WPMr5TLDDXhtRJFgFZwfFvpvG6b552YO5fyX+/mhka6b5WyJteye+se3gHSMrA
	 E2ip0QNh3BK+HgIjMWN0DSisyFtvn0are4HKMRmOcGvMNhfX93a6Jsrr1572+ngfygA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649688;
	bh=H5rFYQV0PsAiRh2IgPYDh8x8LfELeFupcy7yiljJSMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e+FfdCfhQ1JMqPb5TWPJNj0vCY0KO06yu6pTH81KiAO4Txuw0fWUVQVIREq7ElULJ
	 ++26OH0Lm7koSQy6aa/5zq6VJfvpo3pljiwcNz47hP4VnOGHcaax5mISbfAwFcNXlU
	 dg901PxZ3HDtlhCFgNA6vWrq5U5/IogYCH5ieIFm8g8/fwSNNB9bHF0dDUGYBtwYGy
	 cP+t2RPtRHbw1569Q5XG6CPYCjbKryumFe8M1SugJfud9OSwzzJpPV8rWzaQrFZRD7
	 AUeK4Yz1+/TC0HOXxdGLqmQaZ0/waED8qEV2LDV1DFfVfwFn8hucTpM/xj6UX/bpUS
	 D1MMiRgYFkaAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D1B810AA;
	Sat, 10 Oct 2026 16:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62B74156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5473A40875
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THBPULclMRAl for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:28:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 680DC40872
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649685;
 b=js/di6t+y1snQvZIpIELviThNbwNte13T8CNsFWeCUbqayjncmJTeY4pPgHqWAEqikJL
 UsDjc+wyZhbLvSrNjzdbSmqyMUS+cLUqO+2TVzi/9J0wRdPx7dzCtYdCRaFZd7jwaqrtt
 uSneV380HRSiJgeAjuVcTaf8/PaJLmSbleocksCfFevpesIb3zOAcjze9ymEUBunrsjiY
 kTQw082Iehe3kI8yGptZbO6OTpE26llXViR4fLkLoMJQwKyHoDhpQGwwhWKtN1RhFwtUC
 RbjcXpGXMOtZIsJbCGxOfQiQwuBM8xSCKhDB5QCvta2yw5S75iLfB6oDt5tDRehMCeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649685;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/w9eXXCle6YOXNHeWBK6LHRoBCuOnpJF2ry4fycSt+o=;
 b=lKtGJISKPKxTQEDh0G5kXwc5ljbQHtjTrj/sagL+IQNg6gZzqQu5YHIg2uO09Nzmu9RD
 0NVCPKwlW5nV5Vfirt4ipfzDa9goVlXQXhAtDruUTem7W4W/OYb6sHvw/oV5mSjKjo8vJ
 l/FZX0/JpnW+tx2+cXFycZp14zIqsCXbuK2nXVbzP5OOgELF0IkbkhutEqZ7YuYyGaMMO
 gz58dC0ES6kX/9uSrYyT4rbl9FzJWBIFAc2bx/pooai5/V1dXeEfWM8R5zwlGj2+VSg0r
 FyHin2TcbqI/3ywY0TduiIn9Na5ODwFPLjDjUqN1e5AcCcgnFozWJoZW4nBmTYXZhEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 680DC40872
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:28:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BAAD92423; Sat, 10 Oct 2026 16:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:27:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde76bfe85f4c0ed7e838c08d001c27a27469d9a
X-Git-Newrev: 39fdbe5bfe31ff2c7f341041aedeb5c35839be87
X-Patchwork-Hint: ignore
Message-Id: <20261010162647.2BAAD92423@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wmenu: switch to Git download
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4485853675096693061=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4485853675096693061==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39fdbe5bfe31ff2c7f341041aedeb5c35839be87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]). Since we cannot update the hash
without changing the file name, we switch to Git download in order to
have a different file name.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wmenu/wmenu.hash | 2 +-
 package/wmenu/wmenu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wmenu/wmenu.hash b/package/wmenu/wmenu.hash
index c4941001f4..235a46ad96 100644
--- a/package/wmenu/wmenu.hash
+++ b/package/wmenu/wmenu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308  0.2.0.tar.gz
+sha256  a77c0c9cdf501a06d011decd07a80569a5eae2178816e9b14a5fda70ac815171  wmenu-0.2.0-git4.tar.gz
 sha256  500f0a221b2f3667676f6a084fb4e92ba4f74d09f45bc492e55aec4dd296bff2  LICENSE
diff --git a/package/wmenu/wmenu.mk b/package/wmenu/wmenu.mk
index 7454dba8b9..8ecfdb25d5 100644
--- a/package/wmenu/wmenu.mk
+++ b/package/wmenu/wmenu.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 WMENU_VERSION = 0.2.0
-WMENU_SOURCE = $(WMENU_VERSION).tar.gz
-WMENU_SITE = https://codeberg.org/adnano/wmenu/archive
+WMENU_SITE = https://codeberg.org/adnano/wmenu.git
+WMENU_SITE_METHOD = git
 WMENU_LICENSE = MIT
 WMENU_LICENSE_FILES = LICENSE
 WMENU_DEPENDENCIES = \

--===============4485853675096693061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4485853675096693061==--
