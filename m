Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927F1C79FA0
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 08:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B65808D9;
	Tue,  8 Sep 2026 08:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BD6q_BNJY2cd; Tue,  8 Sep 2026 08:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24236808C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788854850;
	b=F47HT5xj4TWkjActDTUZzRjy1XgATdr2jwYRznAkefRKR6RBnUY03GE1CTnyS8vwedTT
	 CpLi8/rJ/wA0bJvipYdNwxYHvKZW0CUG3akT+9U0+oKvwZpW3lT5Dl9yj0s6nEwtjEl7X
	 Mm0d6Xun6G0nJK0PAU30RAnLv+ihUieiHxZJQkybayzwwn9mqc9BJ3c/blnlHflpJHUuc
	 7SHHxji30ck0S3lFBUyBxkwxp4GBZZNmKYIm+lxj4D62Cdr5o5z4dLoqDujqU2d16kIZv
	 I3b0YmYHGviw0DLsFvBJVQ1RjCVot9NTYWJ0N86VqPyes1uIdsyw/Y6ZU/AfzGnjBxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788854850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HtrCdrQSla6cdg9QhXknGWxPU6Qg9z6YJ4wgUw6D1bQ=;
	b=LtZ1deBMdnA8o9cvckmeB6CFjUq31uJIOVlf9OxCb38+gqfG+3N+h5LMw8e15eAVJuKk
	 xSaCYPA8hnWzjxuIGEXadEalPqclMuu8b6f2RT94IXx+uaRBPryPyq80enb2I+8S3x35M
	 SDCa07hcNN8Coa29otFbAxrEsQjHqHmh/DJZDYGfNApkIN0+6FpSjWkLlIo0MCyhyqRA5
	 fQ+KUuobJFHh5pPmQSU4FLf0Y8crBVfvD3W1bIEA+LkabCbnkmcyXTZ1ZIPW0px+N0vde
	 aQWdj96CKDUcE8Ze+5T+buge0Q4DDPQvORZ/9HVAP57hcxzC9oD2F+Zn1zQtEcgK/fQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WYL0Diqy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788854850;
	bh=HtrCdrQSla6cdg9QhXknGWxPU6Qg9z6YJ4wgUw6D1bQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EKm+nfakV8oyPHF2ZxEn349Ouoaple7t8yBt/8KJKUEALFrNnfEjEMxJVXcy5uCuk
	 7r0ZheQbtTdcMxh9fWnrmUpVEcrtOSYwrNsibOln0jZ/E7zSErjUzXBoUg7FOyWxl2
	 Sxup09meHQSgqeQAUQDwrcGK92AbmdTdGnAbuvWvIr21o9U4Mwbb0uc1a6e9+UNX39
	 6V9bZinoHByhpIKrhm5g85Mc9NlY0iT20mSqluV7Z1Y593jPnRIkD4gTYn1rqonm0D
	 Jvd0iNybQgXAHdizQvvweVEAvB6IfAT+OHloOgb5Oer59eDnJvzWfex1kVP2CYdIvO
	 5IsmZxOAwGSOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24236808C5;
	Tue,  8 Sep 2026 08:07:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5865230
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E10808C5
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bno8kRLST5hG for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 08:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8AFF780872
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.116
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788854846;
 b=ri/v4fhG71n+4vpbfib3DOwcjpaqAImSKTEjVf4JKmX0mZgQQsmvc0k5w3LJAyxgqi5S
 iq0+xHhGjug43o0IBxUYvSaqlSqDfA0cd/G+dzS6qv8ZZ5AOTqeBhoJAwUjprmJ2PL7em
 FHLuYUR/sj6+H6T2Kn+OntvcWcrTzjFqxJB8xoKFnnfM1a0Us55A29xbeqEjv42SVsb/Z
 smqr7Nsk8mZlEhni53kw/hMJ4d7O1yikJl1Y5oYnfxmvxsiFPXBtTkAHNWdUCbyZ0IlLP
 a8JlfIwiPOIq2W/0efXAheqBGWoIPSGjTtzXsKjmVVpdr3uVQOIIaHp3ID+Wr4AtdHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788854846;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=bh4uHP8NmxTpBQTMW7IqhLCc5gD2Cq0ftYzOpDOBlIk=;
 b=Pqi9quuPcWCW+QdarnNMI47iWs95qduqY8m3RtD/AbcwD47QT+NQgogZ8rP548Q3S1Dg
 R7RJLtwprPwrRYwmieex7yaURbwwzkPfU8uLtJRcBBkvjmloPYCJgobYto7/DstMgBnRV
 UzsCN7ZiZn7q+vdrPACLPrHb+E3KPpEzEtYiVLHzzy3vo/7Dpi5N1p6JvRWzi9pGl/oUE
 a8dzfoyZiOyfVRC86mJV+Ek3rVj5MN7KliTb/GO2CBDeYl/OhjeG0IjipZgfMvogoTPXv
 qzrrkjpw6RgJSmNG2IsbIV1gpdPD6i56TyYa5D0eDGt+V/PrNEFpIGx9wo9SQrWa+bw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=WYL0Diqy; 
 arc=none smtp.remote-ip=62.149.155.116
X-Greylist: delayed 64 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Sep 2026 08:07:25 UTC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WYL0Diqy
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AFF780872
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:07:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 3qqPxrLe3CGc83qqQxHKfX; Tue, 08 Sep 2026 10:06:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1788854778; bh=Tm/PlN0Dh/HxRl9JvalXcXvlkjDWbYkOevkpgpp47C4=;
 h=From:To:Subject:Date:MIME-Version;
 b=WYL0DiqyLeHqlACqMNfj2yPnertWZ/VxNNNYVSRYxq1dLmoA5sSsDkYfAiOHcgKI2
 mWz8/n8hfpo2yACY646G4EAFTQcdd8qFvwk8fBpVftpCZ5ONTsqK2ps59S37YFRihK
 ayxVCxQGsf9w3ftMGW1T5bwIupQnR4af94ACwTxyQ6HO49CMHOxIJLFBSq9J/Aznnj
 6VcvYK0HVXk2Dz3imoUPeV2llpqsgm49CiIOLkCF9GgGnoQDS2mI4O2dZ5tbbI4O2+
 cVA2S3MeecuGGsBdtILlAGC53KOY2j2YU3qOHs3eVGf2HFagH5q/blhUYb8amOiPjD
 hdTU+BE6HjgRQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  8 Sep 2026 09:54:27 +0200
Message-ID: <20260908075427.3729011-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEnBec6Dl7rJdf8zbla6VRrgQFbBt8/eNazM3J22pxrXgMPGIjtHxePdhb0UPHe0EjMDQOE/TVhyGXnMhpL/L0pj04o3oC8gYCYRXR2VSa1IO/lYSvMf
 idboeuihOtEWyuVWRMdarLgiFN21xj1fr3/4UZ7XBXFchpZjN7Kq2HXULodJ6gKzP7cBtVGUCu86r1s5hq519QmA8ndybSLjF4Or01jpsflaoccIE6pvyzq1
 bxvI0wOmVBpQFryHzr68981e/8u0HgcZfzFvjsi3C+s=
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.8
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.8/docs/v2.8.8-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c6ce35a52b..a0ef7aea9b 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da  cryptsetup-2.8.7.tar.xz
+sha256  3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35  cryptsetup-2.8.8.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 28b9927e4a..643a2b3f59 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
