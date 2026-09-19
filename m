Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C4C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F61381141;
	Sat, 19 Sep 2026 09:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HApBrMPS3CER; Sat, 19 Sep 2026 09:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 783B281091
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789809258;
	b=b3uLBJtrbiYf8tfckuMowF1tGV7aqwlXecosC8fenREuz89jMTU4/NlnwcY3gLpVYHhZ
	 6Mi67lyOSYqT3+1kuGnmE+hkHvcRjmAUEfCD9mj0eT+UtumllDilvySLGKPuh54/4SqDS
	 URqu8jzVLApTklNlPdCyxmVjY3rVOf6WHaId8/wdFgZ5BLAm3uDzlIat0VM/Ui8F44vh8
	 BVV+Z1EqJdGKheNL5jGmM0GcQCVqrk7ZQe5282t/15mdsSmZSz/+VwiKfvWlglOwRoXDb
	 AMkLD3LqhqhsbVAJs5Zb1KEV5zohnJwmiHJBV3v6J8jRtBJM0NK99S1QLL/ayR50fdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789809258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cJsANsQvAHSYaAexld16lGWxCxwkiOUBJiLO0gx5gIg=;
	b=lTWbWLaiNsSB3ol98uLLcMOX72mfaDoDaDtDMuriWagt/dzTXtDALe+YbsIpp7EHNl2C
	 PPaZ6PMCuTtkChsN3nqPa53p2e+wVNHNexrQsKLooOPMTqEotAyovGtkoENsESLXNz/+K
	 oazwGLL3qTRTPY2I2w3uyrwurbt12lokOPdM6ob4MQWpxGQHIh0OmwI+zK5mk2znqK5qY
	 WrWUpELGkTmr6LkaY+sLyBPPu4/YIPdvXOWXLOfcYYBWYu1rEduG62rxC+ZBPiL73ogyP
	 kh15VvqvYpFExOdTxxstDG4H66bB9UGdJcxlixTK34zb47IklgAVlMhbkCJ5yQnk3aw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789809258;
	bh=cJsANsQvAHSYaAexld16lGWxCxwkiOUBJiLO0gx5gIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c2ymz9+hx2ApjOBeDTaA2x1HJsuqTmyom8+WE0Xo5i5wNdRkhIRJYF2GXgZOQp/Ue
	 YEGSEqE0Ji4Zs1KqO3ZlHMJLpHVKhf2PS0YcSC33Fcz+396O3sedFUO9LGrzcJWE4K
	 hCJFKiYtAjYrEA3pg0+g+NjYvFW7/Z9ojtr0UYHEm4mkaqkJaujWKorGshRdZv714l
	 B6gVYGc3OtERQDqJiYD4eybqyqViQSwSAk48RnBoXYrYHx/NTMv0ha8pq6rd+idW+q
	 gcVofSdzcTVP54Z82sjk1T2IYANHDNkDD484ZupJ3bTJZYvgRCIlF/1DqqlE5JLOWa
	 cC9oovuzFOlqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783B281091;
	Sat, 19 Sep 2026 09:14:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E078C422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D223A81094
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mji7X8iOVgt0 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:14:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E8E8D81089
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789809255;
 b=bq51tPkkcr6DOy+g5SrxQsSIqcAqi7zd1sHkMFF/WyG/gB0Ary0kjUk85Cbq4MjBRkgI
 wxkSYoFZrQDNh60+9qzb0y+CU3OZ4olirTI9Y1lGi0ZDo5vIuljKvAehXh/ZvKm5bqaAg
 beAdeNkINktW6/eNJoGTtVfwhdz/D6tuoepzsnSCDAzfKpg6mVDP1AEjRgToK9X920940
 9Qk2/0nFmibzKkv72u1XZFi6V3aSa5TVuATMlcLTexFSa6Kr6wMqcgSkQsOEwchv/k2wq
 U1erRLzd+SbdM2qwPAVUmokACZbKkYuxfj2x2xzG49/HCRfd5ikJvE6Xp4AEH6889nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789809255;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5urnKfL/DfJpWpp+a9THe5QHSKDeyiNaVCP23kM00b4=;
 b=fG877RFM+jx5c8bl8aCO8M7bv4d43BE2kWyw+s4SNjzaIF6OiZMVOrcq5TVjrlmzW0EC
 MO3sbLD3SrJOBwORKoQ3l6ceBE9LQ/ACi2O/7yw8KHAg1y7foc027EHDJPhEneKlkZukI
 I1IsWVKM7sjFQmxzGRqk+85oUkTybPtJyWGnzSCwWFgKG8Nt/NAPCezgZhI4WjiYQXnc0
 HZaToPh2soFpZi/uxM98qcV2N7ypNLkld44SaE2K/uQr/zQeqHyU1wxEPvRc/vpjALzDf
 EDE8wO2wERGBYEvancZ+hQv1X9dX30rPBcJg1B88S8gK6YhWMY6+RtI5usAa4vicYZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8E8D81089
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:14:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B9318D1DF; Sat, 19 Sep 2026 09:13:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 10:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45eccf764a83a3fc711d63153e9bb920aa53d0c8
X-Git-Newrev: 5a91b41f08d9b7758b8fdc2cc04a377c7a2d288b
X-Patchwork-Hint: ignore
Message-Id: <20260919091308.2B9318D1DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-doc: bump to 0.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a91b41f08d9b7758b8fdc2cc04a377c7a2d288b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here:
https://github.com/fastapi/annotated-doc/releases/tag/0.0.5

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-annotated-doc/python-annotated-doc.hash | 4 ++--
 package/python-annotated-doc/python-annotated-doc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-doc/python-annotated-doc.hash b/package/python-annotated-doc/python-annotated-doc.hash
index 8ffdae9b5d..5eee275743 100644
--- a/package/python-annotated-doc/python-annotated-doc.hash
+++ b/package/python-annotated-doc/python-annotated-doc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-doc/json
-md5  825f2ecff1f182cd942ea09907ebafdb  annotated_doc-0.0.4.tar.gz
-sha256  fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4  annotated_doc-0.0.4.tar.gz
+md5  bc5f2360d5687f8e822115c8a7ccfa12  annotated_doc-0.0.5.tar.gz
+sha256  c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb  annotated_doc-0.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  fff170779a6acbf65abdb405c087f1cee1786691e4a96a4034517e4a504a0cdf  LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
index 2186601a8c..6671db2f1a 100644
--- a/package/python-annotated-doc/python-annotated-doc.mk
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.5
 PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
-PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/5a/8e/38aa427ed5402449e226975b649c5dc73ccadfefeb95e6aecb8f8ea4b6b6
 PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_DOC_LICENSE = MIT
 PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
