Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD8CCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8772260F61;
	Sat,  3 Oct 2026 13:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVgpclwRPvR4; Sat,  3 Oct 2026 13:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 245A360714
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035847;
	b=H1KUINkskePBS+LaJ8hQ7Y4ZYt+N91b1OdALDl/YNQkcVZZm2zGtpAphVG4/2x/SculY
	 oG3TLKWGSOQANc4Yc+S+7Z07J2FA8X8bZPrKilg+9YGengrmGE5D4KyKh8I+aCnnnF0Mt
	 bgsS8uAzGK3n2OynL2bGPeKW9KZOq/JJFbzAJg2nMeznYXdS0GU/Ejb6OEHbUBVx7pkrS
	 qwISYv2jnFOEkE2fxQnn66366CPD8E2HlHj6Tyijnu1kLMkdIBjApwhhMsb66La6YDxZJ
	 qPEPz/9/JfGbSrnB59lUe57oNoqAHi0qpc+Ua2YQ6rnnBelkUwscU2NOitsZRmDtQOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u5tZBvdhAjLk3XlSG1JhZkNm0C7DUyzLZ/KBQhEY/D8=;
	b=GF28FLDfte9GJZ/iZ+TjGBJvZ1LHDC7Sfm/Ll0PrZd7IAu2gj3SaDEN6dYxy0rnTCx4o
	 fK9WlQx/SwagYwekh3DoWnZFUJ3aTTFSorU23RTj8o5nKZWLjldvbxeh/WMiffbtDeNZ6
	 aVgiLKMHH7y6OBGO9NunFtwgdP9I4s8OruRR/tr1whnvONtC+acpN4IFXffUd947/IUVA
	 ATdeuHDcdjxGE/W7mfAt86rb4ZoeS9vfi402qH3VveI3FKpcEdNJ56Rj7FkHfGtm+oDnr
	 3XrF6RHEltQq4ecqcOZgoGBgZXJ0KpMWPP4KV8c2ZqZcdDlttffIei6SE69kZog7LoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035847;
	bh=u5tZBvdhAjLk3XlSG1JhZkNm0C7DUyzLZ/KBQhEY/D8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VuZ+4ZRV/gum4ump9kntdLtW8+rPShiRkXa+zvu22PJCEZV2NBfZei+xsFOmh5ezo
	 N7g6HEKvbuN+PyZBJsqtTZsgAN/LTyqsyDgmy0K5ERgUjyZ+ht7vCvG4cdg+YpYBEX
	 h0plqLBMkMLWIe8jNCL33jmWTYDwvdg+MGztB0Fx5pPoJVsXkneYBsMqJsmxnRWBxx
	 xMXNUvEn2GFrWnaVe1qwxsoBjW+NnX+eErhU+elb0YPpUJ6fAXEf0D6XkNUPQ7gW7d
	 6+yVuwQOXUgJ5MC8lDVweLM3XggV0lNimOd8sFw3pzvmafjWzrsKzVFQAOrCcP6+rQ
	 UpzxOTsvxa6TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245A360714;
	Sat,  3 Oct 2026 13:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB6524B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC556414FB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lj4rliiqJz5U for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B025B414E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=f0zVYgETVyLoP4yyTj78RrV3KNpZkL372x4Lg2gvMtsSl+aDGaBRm2vvhJ/HWQ8z5O2l
 RQkUs+CR+YIHArj5nfFmc2VCTCbS+jmLglp/zQsiwDOcpUox7dWY0mVlev18PSCRcNb9l
 G49PMMG6RJEBnB74fNGpkUL5ohn/0zLFCLbIdb02EPdKkCP10WtfKNZ7OgwoaxYgkyD97
 +sKwr1cbAPHnvWc7On7On8kc4ps0L5QnOU4XGTFvH7y+UELJv/jZAYerKUDEmWe1MYU/g
 Oa0qclRKjv0HRMFEy+8LMWoSnUFzsvnK4BVrPcvQi4sF5gE7gexyBQyFAFcdFREcy3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LCv0lyceDXiDIftp+/HA6FC6QSD+u/PbtshUI1GCc5k=;
 b=IiGLZ7XBFTzq7u/O35514dlkaK0R3xaMhzm7luAiXv2OaANsrcr0ZnttFRwJIuY+I7+r
 4BcDKRe2U3YT40MfZ7hpoR1DiN1saHHueUgq7nnPNisgXFUANNTx/NbVOMSSfvJcJv32Y
 2GKvUxMeWVGwllI3NkkHFwRGj/O7t0hGVJNr4b14eQITqihdDgCpDtoL77u1/D+IOQqnw
 sSFVLlv8p340KrdAlWnGgeYMJIQvQ5eHck7f81qmhgDzIWQz3I1EhoA272uJhgeMDRhLK
 23JeUuwHCSO6hrWCdrL/CCn+N+FQSqG55J3h0mkS2t3DaK91oxCUdF8zkN5p1hoRAAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B025B414E9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06EDC8A318; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 388fbcebe0ca2871e95910ebf139ff8d233ac123
X-Git-Newrev: f4335317229da13bdc6322b52e23bd91e56bb2f3
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.06EDC8A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 version 2.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4335317229da13bdc6322b52e23bd91e56bb2f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 8b4850c569..00e8f84957 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  08bd879ddfc1547b9cf1a32a90cfa86e  pydantic_settings-2.14.0.tar.gz
-sha256  24285fd4b0e0c06507dd9fdfd331ee23794305352aaec8fc4eb92d4047aeb67d  pydantic_settings-2.14.0.tar.gz
+md5  5adc6be6e91067201caff66b05f1186b  pydantic_settings-2.15.0.tar.gz
+sha256  694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117  pydantic_settings-2.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 10d79b46b7..c297fc7e79 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.14.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.15.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/ca/31c57507b13119d7d3cfa1576dad2911a4861e3be07b579395f4e9d393f9
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
