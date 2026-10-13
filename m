Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ACDCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C02406E8;
	Tue, 13 Oct 2026 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ays-zlKlDKX0; Tue, 13 Oct 2026 20:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 43DDF406CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925060;
	b=UNpVts8pcGkWZeEuM/BKgYpWQXAUIlamQBe3olXSwg5d9Gg8YAizgAsHJoYxEHl+oYLY
	 px9lgfwriFaZpFoVU0I0tXpF9C6ghUfHQHuQ8y0MQN2hh/QJW4+5aW1e2Qre++BH0goVq
	 m8eUFjs/8HDx2YMNi7odHbVq2czAGw8TrTGFwggR14JRLHgie8BQc7ZzUvJ3jaWukGMqS
	 2NitEMvfXZOY7A+yGcJGjSaZrZ5Df6SkvB7kHPYWDN7GN7SB66LZWy7EWZ5Oe2fnaTcBL
	 hSbNm2wCygiS1yYW9Wsdts4GKC39BTaKwJstl0TlDVcnPaNVYvuP0F1StB5AK7gOqeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925060;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a2Cyiqhj80i+qYIgK8sXOthcLfxASTt3Rbg2eLaoytc=;
	b=Y5xHa81SrrCP+IVll3YGfWhsR6Fmcv/vB+JbSd7v/+M2siCAcpKNOGN11W/e2fxU1Tld
	 Iv59aXeTtK+a35mA/WrpsbhIPcgxsRR4ILQFOaKGckyUCMuPDTkak5PyBfnIEj46lDzVb
	 kcrGVMuDg6aoOUDq6zGzwFpeg2BLj68WM0rwH/BbdTWP5rtgfhyynYQfimiv/FaUBR1vR
	 /i3jwa35aPPAW9rjgF718hIUSNirr7nLSQaohvv6kIW54GkwJ+R4+lwK2+P2uWDUVnhAD
	 Q6XyC822sixaJipOpTGs3YUbot/O05CVJDvVODOOw9gQ171eH73OAjKrVNKz/IIYG0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925060;
	bh=a2Cyiqhj80i+qYIgK8sXOthcLfxASTt3Rbg2eLaoytc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T7qYM3b7CdY8CW0aghuAnBjyQMHAB8yWSYz/QtXOjwE7IsXjpMVIZxMCBW9oHFdTb
	 CccDstWrN9zio+YcaMzf53Rd+eCBMcaO2MTY/Udj6ZDJ0Cmucuuw809jiBfZHq7r3S
	 DXpvyqE2dkmXwp4Y/2IifOiumdIXDANyBrfDZI3bhptB6VSHUQqAs5VF4MZ/u8u487
	 G23sSo64yZ+cw4Fhwkr+ei2RKbxfwOvmRSKkGkL5xh2FRc5oeyaiUKTg3gbTMV7OfO
	 AvCQXVQt79ZmlL4t0wjEmQhNaB6/nY7b9DJd6zetmEC+wleb6frLtZ2+ReQJ7VP1iM
	 RbTp2pPzocSvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DDF406CC;
	Tue, 13 Oct 2026 20:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EAF043F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4088F6081D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHEKqdKc5iXv for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 80DED60816
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925054;
 b=MySZYigCAf41YRC2aZihxHipupoH7430TFR2WVzLhmV4w8ickSD7V5+yq0ho9du5QX6X
 L7TgfUdXb9mylc1lRB5+Us6uCTmbiwpKPzDIpFvyEGI1fKO9ik189Nt+wphn4xNZTTXKm
 J5lMdD4/mzpzR6dTAo38Udymvml1p73d5ut8miNMYKeQCgN4qzKMlnXWTJhXQh9un8wyy
 gRsjFIsbohes8GZ9pg6z6vNlvR09LhLmO3DJzMP61fO/i7YHv4Gn5LObv/CJmGLsluEA1
 AcEkUSKHiaX9qWf91N74i+nRi0dOccLrVDkNqKyGQdB4fltq3O8C1iqRwi2Wy4/CJGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZoqSVuHQbeDY/+s91d5O6xGMdKxpCtapJHNg3+9xbNk=;
 b=rJGomhb4tgfAciInKGofk0KwJ8xS85HoJHpfsjKEH/ZT5J8GiE6b+FEf2ucySMuvDew+
 jpYkbq4i7ojVTqFalUZC4ZbM4lPvaWEz2UABrOCqLNHdKvTvSdBGh5WF0TJQz2faQsetT
 sLKmTOgpB/4CJXy0PvEBriRidvt4w0R0O+N1E7WOJngG4B2dqLdkkA94i5Q4E6Zssi1/L
 q9LZjnF92mOjZkq0EQFnfPcF9a1SdjGskH340TwFtIu6vKicg3sAVmvtNHTNEpnOIOjvu
 MI772FroPaa0lTsLq/7O4s4OI+VDk7Ep7onyGPyyeN4/ihqtXTpLZIC5uj323jm6dNQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DED60816
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B72BB957C0; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 696e2c4c5ab163b9091c28aad97377cd0fefcec4
X-Git-Newrev: 65db6968c110bd9af42226b71519052a8e05d546
X-Patchwork-Hint: ignore
Message-Id: <20261013205614.B72BB957C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jedi: bump to version 0.20.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/65db6968c110bd9af42226b71519052a8e05d546
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 194f1429aa..282c6d1cb2 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  6f7c8c61fff6da984d7297bb32cdd1a1  jedi-0.20.0.tar.gz
-sha256  c3f4ccbd276696f4b19c54618d4fb18f9fc24b0aef02acf704b23f487daa1011  jedi-0.20.0.tar.gz
+md5  900ed4ef71909892977ceb449eb42b19  jedi-0.20.1.tar.gz
+sha256  2f71208c3f9c1bca057c0e90d3f272aba44ace88fc4067d7587e9e069331b7e5  jedi-0.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  235e993965d399a25e7d493d25c8622f78718510884b9c051f1f1866b6f34e9d  jedi/third_party/django-stubs/LICENSE.txt
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 567946dcf7..2300bb2835 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.20.0
+PYTHON_JEDI_VERSION = 0.20.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/46/b7/a3635f6a2d7cf5b5dd98064fc1d5fbbafcb25477bcea204a3a92145d158b
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/a3/a4/4692ecd7fa700ac1066b1c1f6cadef60aa2e01e5e364710235137d823e0a
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/django-stubs/LICENSE.txt jedi/third_party/typeshed/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
