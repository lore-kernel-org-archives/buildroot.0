Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1292ACC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D569F4062D;
	Tue, 13 Oct 2026 20:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tSYwoAnxMNz; Tue, 13 Oct 2026 20:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E277D406D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924780;
	b=XMV8kyGMLIKIHucz6xVFnaEd2XwhjSEX5Bn9ypOozTB98Eu7Pk/wFEtW1htIznrJeNFa
	 Z//5nkP9GQ0UIBZ+UbppRt8+ZycJD/evYb5zmriQJJjOY9A9miLCb/it9QrXnT8Ssc15k
	 K5dwq2W8pT7cNlAJMOxZv4yvjQfwY5rlM4E6j98/IuWrEWcXSOYI2EmI08p4julLOkG4c
	 DaOioOOBuUV9su4cfS70PRd3m13L42UsJ7nyHf1tIkY5JufV8S8hRomefTYB3eBrZSxMG
	 uihxPlRh0V9euFdNaB7flGyZMQ802mK+xU4+5U2dVW6Y6/D6QAxf977+khJs0D6DRxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bKjxQC7KEP6Usiumhe86dNE/RgC6j8VsZeWBxKg7Blo=;
	b=C6FEo6iw+kALn9X49Ja8cZzrvIpHYD8y8orlF8iTV1xT/M3Dx5TW1DnAXMqkAqPJUioW
	 3sRh0kRUMB6qT8nG8qKp+iduDhvtZ6XJ9dS3z8bWC7yLnaDq5PewEMq3wOf9FIv2To/Af
	 1aPp/C+six4b0UsaRzsS++tOIgawaHW11myN9hrsVg6Vir6aCZFcsxLW8CgJlQRLuiVNN
	 xPj9LBHZF5ohrSTnMfBvBHpzPIqTnrNIsu3r/yqS+ICuu/4aBeyy+PHWWkf1HlbGLACcC
	 uZsGbprOyLv2I3oD+RXNlSImBiF2twTktM+9KN4CEO+6nx/sjLZuO4G3s3tLk31+5jQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924780;
	bh=bKjxQC7KEP6Usiumhe86dNE/RgC6j8VsZeWBxKg7Blo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rDQugUrpziZmg2ZLOdlbBHFw2xRJIfiachj8cErRaOWTEWg8LnMwmoQ1pFZMVAU+g
	 Lbo0KTLhPOGLDDB7QiKQiE7UuOGUmSITs/SO+dGYjSjTOvd0S+g0n5EX45wlLG8tUW
	 0448Mm2Yaty0DoCX0q0DYfE0em7IfY20+Q4wENCNKxz4lKB+wQlnSRMiB7TwmdcOnw
	 qlQ20N+SaL8DQPWJ5rkHVFtVb/5Vj7/+Iobt7RwhmYu4sjeNMswQSohXvVn0bhboxU
	 aHieMqGRCD5RaeCFA77X5o0qsyd+yZgkIJJEMtzYkMlr4IJbNUCpjwejftgSQpUJTE
	 bLvg2iobPzhvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E277D406D7;
	Tue, 13 Oct 2026 20:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 480722AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CB574062B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2Q6xsbuz6Ix for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C8704062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=PQNc3oS9thWmOPhlsZ8sp7JiIigXL6gQyXHKsqkEG7OzV2hrBQ3wWL0dxo22HjO8qVpY
 ljRHUwUXM0ha+I07KIs7QAMxQKa5B9BZDpH2IjCP3OBykG78rxU7FrYhyX/QpZOMuIECV
 ABaOopTPgRnemiErKyPSJl2gCR0lVkX44XfcoEwhOhDO1hJxrO3uEqpYGE1PrVl3CHIwt
 85e3KPKaF5WOZ6cwGVmUszKm5EFykkNY3Gms3HOoXlfmCe+yl2UhEgu954PU0nep0hhy5
 hQEa+ScmBGlGRL8SkufO7nNEiZ0k9TDYXoD/PwPbABfhFpdjqqGjKHZCoT+vjdUA1Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DpBmr1XaaSyuKBGujVaIEr843QuvYFkxl4UYyWgSlf4=;
 b=EDr6RHKEY2OJb4tTwXjfju4KdCsXQ2g5RsHSDI+8FhOi4EB/T8nB+N0Cya3xJIQo58jJ
 mNfH96GPwX7sD2rgkQBsMNbA2tqLsxjekRObc2dQvNd4KxYM2jnYjwdJCmepNE4Io+kQK
 8DfSzFg1Wmy3xwI3kwYQk+YA+e1dICFUJPfBCRGTfJtK3y+rZieW95a0Os0TFPlAn9oDl
 xZgn7C3PgGVhqm/hKj6UO4+nMsrwYJTEwmtdufcX9IEc9K0pkaDtrPTuhrMwzZSGdiC83
 QJlzZvyADkUylsiI5nw/8XFNwuHO4BinBXjxzfaxdmrrxNf0KxDJCCA+aJhSY6So4Gw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8704062D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B695B956E1; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30fb24f7c00cd6ab742a54aa4b2fee2235480786
X-Git-Newrev: 97efb2bb5c6a6a439750ef3158fbd5fc05b175bf
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.B695B956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 5.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97efb2bb5c6a6a439750ef3158fbd5fc05b175bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 321434e299..f3d592a90e 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  36560432e7ebf6e9746080ca2ca7cf0f  pycares-5.0.1.tar.gz
-sha256  5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081  pycares-5.0.1.tar.gz
+md5  32f250031005a3bd9a4e1a8e39488f2f  pycares-5.1.0.tar.gz
+sha256  4ae0712df072773a3193b23f124d9458d6b2054a22c9ea0059c9dff6b8f91050  pycares-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index cb645e60f0..2b8d2955fe 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.0.1
+PYTHON_PYCARES_VERSION = 5.1.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/df/a0/9c823651872e6a0face3f0311de2a40c8bbcb9c8dcb15680bd019ac56ac7
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/3f/b9/8f8389df1dfe3c9f6b5b02cfab60781685d146bee529e7628b77a1df7e9c
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
