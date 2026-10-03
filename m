Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DF4CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A101814D3;
	Sat,  3 Oct 2026 13:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXLHa28Ze5KX; Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9E544813A4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035843;
	b=UKbWSxp/CQnYMKMkOTd7culpGcFYUAcYTaZFw1nI+Rb3l+Bkup56Ue2iVLUuvUfevw3w
	 EHH7qYgW17wYMkwugHUpn2Ur7vh5MtFRty5S8D9PLGKTwrbPw83IBA+3gJMUqpE3bb9lv
	 cxtRuXZOJexz1CvXeCPT2whrW1oveximBb1J5h30MqmVkG24xkSmXgVW2unSFOtwebf3G
	 1zoUmLXJLfwRsDvRa7py7LwtJ7RQl0e7OMnyjZS/Rjdp9QwkIBigtXw0eK/UA80XdEgcQ
	 YjsmYXOmMyG9ZC3y78pwqK4H8Hzem2KKVHGbwZyo2Kx03E7JlupPA+tp8PBzmv+5qew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xxUy8SQv2ddagh9xJVyCWolx5juhd7yw2SOhj8KrRLM=;
	b=R7HLvJSF56/G+OCgPtqIwXf/tM2HpLIdzOHkP06KcKmmXBdGds9d1+o6N6kbR7fsNMWA
	 CmmFwt51cuDgwj9zAafeGttSUKyyu0MH2SX3L+k45y+GbsL25JSiw+fUMiv8hz6f/JCUQ
	 G1YzBWQ5dgIjVCuuCLVxNlnklsuB5isu+LaAnOCUY8qWOkHc/TQi9DR0ZMfA679mn8E41
	 bnkUfH7xWdTdZThwKu/bV0dM56+rOdZFcMgyqzPHjlrI0G3AFSnhmjgoDPWcCMlT3AwLf
	 vKJUmzKAon5SAfMcH8g5chgfYZcfNSFJwdFZFqxi2tfV0xYj9idfNI/nZq4NcKQwJ7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035843;
	bh=xxUy8SQv2ddagh9xJVyCWolx5juhd7yw2SOhj8KrRLM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tzbly+oECb47eEg5KgYXlPVVjMurMTV/FOLrC6X+3aDkgREf/Kdfxhje6VID2I83q
	 HNT0DbM1Nvs1HMH+icH9tPPYw5l0x2HkLR3TbMaT7XAmq7mMlASXhmugxHTQDCmWTt
	 IJK5pHneVox2uk67CQP+2lZrmWepS91l8eDmLdCr9GpVGx28RkxTCdRk4JonpQKjwX
	 114cSBPDguyojyEi22ZiLtnskUJzOVi7GpBe63v+w6EjomvIS3wpjTOjXhprFZf+rM
	 2ycfcG40Pmw9yy68rAvTA+MhI87ZQEjqYq/lxaQqUY5TDzqGFWhE1RCvsnBKZfvu7g
	 9GDSv5xBTghYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E544813A4;
	Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C42E9A0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5442414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s75Z3z1S1d6c for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CEC06414C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=YIiduiX4axatygF+Bpdj5ddX+GKKmHhup1mwU5MtmNT5/E8+3RXqcdcGPItQcu+lKa9S
 oRI7lS2FUoxricvPSBqco7aOZ+I/9SXjSeeY7HetkpXrT8qOFzmtE/JuqG/VqZEW35Jza
 91GkCmT3feSeNZFsUwNlI6icJw5FAtf7pHbNbJckbQYd3lVgkPKIDlK2G/n11/Rr6zc5k
 065vQ+otWEWm+ptlxUieaooMpljgdzxDKiIhb9pd8IJR0gHjtg4IJizUpz6rk1kR33ppC
 GqGuavuMwUk6nd98jSLdF5V+4mCv+jKLSmP0FB4Fwr4o0BHHDIHgbJ8myw6PMccRnoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u1hHiQuzeWReYvU6XYIhqLGY040GscH6mDHdkGvgY9A=;
 b=ryj9ih4kClGaQetfUKAjcnywdp6Xk/ySVVpUfPsZuT4odHvAno+DOzeo2qj+B71l0ia2
 WMxA3gXXJb86rZHqx6+gp52RagXu8Hqiqw09SzpbUo/i9BNOFSdoqs51smy2RhqLNyr5w
 42b9qtUVI7nDGO+BdPsKrHl7TbyPLgHsPhMZ0uqN2kE8tWK6a7HWy6uxyb6Q4+gDF2A1E
 7xr55hivy2luB1+uaLJijFkpD9XAyYDzatTwQRy/CF8m9VKlUTKPqahjrahdO2AAX7o0u
 4bYwEHWWfnFd4d3Bmfb1A3TEYD7CnTPg2O+7/LrzE4BuiJS0P7Xsg+Rh3xwiw5FBuWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEC06414C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266728A318; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6792e0671aa98585125ef3f9eb1f953887544f4d
X-Git-Newrev: 48d92e556ac55fe6cc8540ca00498870b43c7c29
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.266728A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyjwt: bump to version
 2.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48d92e556ac55fe6cc8540ca00498870b43c7c29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 92de436de8..2974775eb1 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyjwt/json
-md5  12623a5898f60c4c86ad4ad8d92da216  pyjwt-2.12.1.tar.gz
-sha256  c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b  pyjwt-2.12.1.tar.gz
+md5  c095da5019479aa8153266b1adc09d3c  pyjwt-2.15.1.tar.gz
+sha256  4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8  pyjwt-2.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 268d83a487..6524369c71 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.12.1
+PYTHON_PYJWT_VERSION = 2.15.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/43/ea/5194e52748b0da83d71e082d75496eaec6e58f419f5e184786ded517e6a9
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
