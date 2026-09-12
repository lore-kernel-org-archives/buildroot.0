Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBBEC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 12:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF79180DC5;
	Sat, 12 Sep 2026 12:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGUA4qsGodZ8; Sat, 12 Sep 2026 12:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8A5B680DCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789214763;
	b=i9EuW6ZM2pQ5FR1Wn7UPVgA6wA4ycUJkdZE8LVfqQ2rIYJNTUB2Ozbf4eznGsBad4YpX
	 TazoiqRbTZhYW6fkCDfBxTdAqIgVSHpUiVE4B9XJgA3mNvH9PmQSrctwu66CoxmnXodew
	 mgoOKwjcTrmNr8p+LXLNAx19qkoPsHleu0pKW6zWVWRvVF21Rhe4DFwRDmY8AZs/7sr8y
	 tyN31pYpLTtZyKIrRhQvKa0IXgNYlQwyhKf13GX1uw+C9hOd2zLCJFqgLn6rJe0mcPyNH
	 Hfe6O8FYn4L9XoZg9pCBObsTgQcisSSvttOFFxy2PoDdRiQr7SEEiOUOmBHg+2TooHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789214763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=332PumlwOJpKdkXWKOFwKlhtWgCdWlWNBDgFYtq+L5Y=;
	b=Q9051KnPyly3PswcZByNdV81LR4JgvouyNGn34oRhdRbjJDZanpSwpknS3ncG8FZF3Zo
	 38F0omjtS6kt2jGGwUnQnFhd6WgzHMEHXUkWFb8GmBIabdGfiJyk3OeZvSeRRB69LEhqP
	 uhAOBDl9dnYihqDgGkhmU5FxTXotO3b+JInfo2mdrWfinwhOESNGJc38b4mK8CyGZQRcg
	 4/E8nrRlJD476Z8OFLxtcU9vKO/2LMW21XZvkwPdWf9+S0NZW8n03l6X6Evn7iQuMuUQr
	 JpG3FBWYT7nHKKrM3WtBLD8PL+KD6FxnJixOIx7WDykibwunUMcBbmPzQS/eNAw5mzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tbSSPRdo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789214763;
	bh=332PumlwOJpKdkXWKOFwKlhtWgCdWlWNBDgFYtq+L5Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S1FCtPDs8m00fWw94OLPUdARLGuyCt/guGA5lyRHLjfuLmBC54UYOocQ+NSwLyWXK
	 LcBnqnwFMeuaeWLFL2TyLzWFyf0SPzwRC9hmm7YHxWtWwq1RlzNMjXjccGBNf+JZzO
	 L15tj1rv2UeY/L7fEPU2ny5UvcvJTQctkWFdaLXaJ2ae05gXWa0e+ydQvoe8pWnQKr
	 CMo+NABgjHro1IVDzkHsfthyab4iKRcIAYQlTrWATLazo4E+/ZmoKAwQYrzOVOmuPV
	 MtuaC5tFcvPpSyXIkpvlQ8DFUkdi0DdS2WY4PxYd490AWcG+JsBwfjFMubEiTN83aR
	 jcnGvYZCcXB6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5B680DCC;
	Sat, 12 Sep 2026 12:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83648701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 12:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74BBD80DCC
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 12:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdL9S7m4j-IN for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 12:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A317680C6A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789214761;
 b=ZfT9AfTqG7ZgRvEjiraOM6q64aPEpiGRF2iuyLQVQrJDXKSvOxZlojxH2xyWBGnFz8r7
 fcyCFVztab+rUhzODNZnKh0dg60MdcItsxIECXXBWMpg5/93wcc2aZyw5iDeI5jJ5NsgM
 7ZOkeNqvA4KdXn9L0fAixqT8RjwXl5fNvaFMwTsotz3q//WQs/iinpUDt9Yw6GOcQF602
 9exZ5Hv5cZQYUI11gjtz/orx7UW2M8tT/V1ve4qNieeN31EYenFV2KtKVRNIOX2KWcFGf
 hhW1sOVTqV4XC5gzdjqKjx2oRDVze3lFA8ak6KTYp4L0R1AX6Z1IY6bCr6jpsowZLew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789214761;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=zpSuKdcq3QhfJeJqi3e5XERyBUIU0wwpUmoLQu3y++E=;
 b=PA4QYqow5rqctxkhqFlyiWP26+Zx9RbzddSQpXUJGQ1By775ULmjwKAMewE/Nus55xID
 G/u9KKOAouHT+RmZ3OQ3gnlJy8CTyAiG8b9slAou6y5Qlf0dy7tP4Lt8dGM+Y71JK1PYa
 TqEMvogvksOKVsUHmOoyMXEBYXLimSEdgF8Yq9q3TI9wD3i9+G4IBro/rWsbYL6bB7cNt
 e77mONQJH/pLRFDs+7z5kcwJhIFFo+FzGEMwWEbELd0oHvPBRVwxjhX3p0mSdhEY3luUN
 aVzwBZ6Ghc/S4HW5HMKlmXhNKjZTH6/sPwecbaQa8oUNc0MpG2X5nAOIWXsVI9h5hAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tbSSPRdo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tbSSPRdo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A317680C6A
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789214757;
 bh=zpSuKdcq3QhfJeJqi3e5XERyBUIU0wwpUmoLQu3y++E=;
 h=From:To:Subject:Date:From;
 b=tbSSPRdopX7kv5345GQstAL1ZjMP70oD8m/U7Pa8nZBVlB6klq+ddROsfBzWj7gjo
 OywRzr4MLlSbCMdH4NG8/nDkN4hOZEkgIlIYSBeAtNLX+pj498duPL04c+kCqRce3L
 G6PKmVpPP9s1BZappYc41MjSNmtcLkszwpkAhZoWHmdNl9yvIssm/pViLzORILP1VL
 OQegFH3eltuFjak3FV1Svu6zZAHsQ3HT1Zh8fpDZ6qmQhXtnbOiSUrliwA2dzBZ6/o
 LV2EThKlkUm1z7b2JLEqf2aYe9PoHfl573T/r2Unw9Kl50q/1Vi2CkJem4Gv4sySls
 SxKovjzhzdQyQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5C69A4C32F9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:05:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52040)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5MUX-000000004Ag-1s3r
 for buildroot@buildroot.org; Sat, 12 Sep 2026 12:05:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 14:05:57 +0200
Message-ID: <20260912120557.2548002-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 1/1] package/libcdio: bump version to 2.4.0
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

https://github.com/libcdio/libcdio/releases/tag/2.4.0

Disable the configure detection of help2man to fix a build error on
Fedora 44 hosts:
https://lists.buildroot.org/pipermail/buildroot/2026-September/809202.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Disable the configure detection of help2man (Julien)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/047c612bf47cf256edaa84207d609d521c3f4679

 package/libcdio/libcdio.hash | 4 ++--
 package/libcdio/libcdio.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 4c15b53e38..821f949b98 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcdio/libcdio/releases/tag/2.3.0
-sha256  53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed  libcdio-2.3.0.tar.bz2
+# From https://github.com/libcdio/libcdio/releases/tag/2.4.0
+sha256  8e6a305f81e45a78b41ce696d34497cc208d97075469d7304c11a6d44bf006ac  libcdio-2.4.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index d5238e3aca..fca52e4f52 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.3.0
+LIBCDIO_VERSION = 2.4.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
 LIBCDIO_CPE_ID_VENDOR = gnu
+LIBCDIO_CONF_ENV = ac_cv_path_HELP2MAN=""
 LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
 LIBCDIO_DEPENDENCIES = host-pkgconf
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
