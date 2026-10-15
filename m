Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E3CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E975612DA;
	Fri, 16 Oct 2026 13:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPLcuWEFvH5h; Fri, 16 Oct 2026 13:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21B18612E0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156381;
	b=jj2VKMAD0nnbj6Z6y0JBW7KTxiWJ+vzknQ32XnhTBF++5IfQnsy6V49Uxzzf5CcXq2/j
	 JDDqxybJE/iUbyw/ypR/01ZzC6U+87rpaqNEoKIEsTE8BTBumJ6f6MhUQFYH5hnD7TC2K
	 sSUUofFvBlonN3PJnCsgKmPame1Nk7KYrwqu3gEPYsK78ejjl/itStKBxHn+hYSNxaRGL
	 uCe6Fwpm5fKAKFpBodr+Znn1/U2Z4kVR8WK04c8RsllxHckX8d30arLfyLRsboaQLkqtm
	 Z18A3MiUwiVI7u/uVEsPOOCz224LFtATLpkx3hQ/GC92glcurFWdQbijutjPdHGR4nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4b8EHb7EFe8BNM1hjaIWxB6KtM1U8p8AgbHA254M2Z0=;
	b=c05uWO0ffXQx5D8atdpmJc/OSigC252bnUxJFHktVhx+kUQJYsBgNy9EeWgPTRCFJz8N
	 ncmNxTL0DT3sg5EMhgQ9kX/WJgQ8XhkZVvM8lSF+0Rb9RNvdaXJBo+Xhg/kHUDqnwdRWi
	 Geqks+wVndpNA/NnhtQtGPKg9po8eJYgf46e36rYmMH/fpqqUdVxcywRXRLMjsUViAjsh
	 9/RzIJucqpTJSsWAEmkGH52RyveuEqOvQLXgY3EzcvHiMhpXHjjOsO9dyX+qHxXpSbtwH
	 heHvcg0sbg9kuGLuxmGcQDtFll82ThW/seYheyN/SxBnDXzMpNXYjDnEzuT2seIO2Xg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156381;
	bh=4b8EHb7EFe8BNM1hjaIWxB6KtM1U8p8AgbHA254M2Z0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f2BoOwJWVE70SO9AHZW4ydXtQg7XQDCRUKJZvCTF0bIL+bnDwer14BwLJ4sJ9Jgmi
	 7cWQdgNrXVxtchtBNyu+CoiJt5gmlwFBTJswzEUZh3sB/E9yzxkdR8DTpr/9b9sFjp
	 DZBaHfKgKbX+kQvTYi1nTyPZn1wBi3MRxbuN+VjNO5TceOIdxVWv65DS3UBTMNwwvr
	 mJD9Uxv/TffFRSXES5RgnvLCR1nlLVOuK2Ci+T21V4Mk3umyGwVRT0CLOcpiuNrBSf
	 9xdEk0LvfkayQ3eIKCzFdpXRQsQoxx/W1n117h8d9CLUMbwgmARjwAoRw7QjdXWDsQ
	 A5XnIIu9oBOhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B18612E0;
	Fri, 16 Oct 2026 13:13:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB6A4920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B097760AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0p4MYc8pFBvO for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2782260F2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=Gw4H7ulqPJ+PHbJs+mzRddNWfpO7gMuPRNdfK1tCMceqPrRNH0tzm0w7fK391joeR2yP
 ZpWkTyzNmlXje0jPNigxOoTfW+nhevyGJOV8dqxFw90ux6iuBYkCXYxXihCbRYAPZNU8t
 XriV/8/q+CfGNP+d25JoCVdq7qHdZEcUQlqWVuKe5qT0Ysq29EACnmXfGx4HHGKVf58BD
 r6kH3TLrse2m/XlRNKQWKaikOK+Lg18XyTh8lk/bq3rC4Q2cq7nETSTpSEH0WTOh/+1No
 3IfEfXhUiOMbRKSuXRe6/CKYb/ZHtiywNRfPUCfiApYQfV0Ozhj8VrKbpoSMfdFDEuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1dEFmR9s6S3rj0r/QKL1/0ph9E2VP3+BFbj4voitqdw=;
 b=Ij4Pd7xQ3WJt2noGLj4RsMhq1COpRKyTf8vcxuMBsyGIm66IEpvrXvhIDuvfOr3uJ4Tu
 l1FIUzjbmfF68AUklBIq31yi14KspnV7FGG4U0xWPDZbGlpv6ylrn7qpNAIFS+pd9ELCe
 jLXMyoYXk0whvvqPiNuqGXCYlz+DkNK2sIIKMiMnctUIQQ6D3ZyemEhlArSvp8vHRJEGm
 Alxu+3KHCI1MY+gMx4HoO4OHTN+6l0EqN2g/C0k+PLK6ebFI3PHNOa/Hn0e7M0q0PzzSD
 diS3WGXkG4RtcisfN1OcwUuSTnKVMO1RKwqlQZLLQDXyJXl+i0Tn5RYMQnuFDWFLoRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2782260F2F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 175B0960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 265e33686b3ba3cca69dd08ba78fa211aa865d76
X-Git-Newrev: 736e6bb469d5abb675935973cf806736c22ba54c
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.175B0960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gawk: add CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2027109126339243297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2027109126339243297==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/736e6bb469d5abb675935973cf806736c22ba54c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:gnu:gawk:5.4.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2023-4156

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2ee591714dec4ea3921e2da33c8022447492f0bc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gawk/gawk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 10ca336844..2b3688ebe3 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
+GAWK_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv

--===============2027109126339243297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2027109126339243297==--
