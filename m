Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6446CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A42E60D7C;
	Thu,  1 Oct 2026 14:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGe80p5mT0VN; Thu,  1 Oct 2026 14:23:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4D97560D73
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864596;
	b=tEZCzA47TyrhkGUC+kx1eL9mZU0mgZhsLO206m8F1iHODXiGwjmDjfCk74j7mhco7Te7
	 G8nfup98XXS58kFy3z6bUPwYXpOq+yE1Sw/ZsqQtNQf1gf2IwiRcHTXgKzS4qSpYT+i8G
	 ullbKy/PKb1niBofmjiBRvWc1P8YvzNskNT2sprZVqNte5j6Szy7BrZyzayhgSzD0BQMh
	 OO55fkExiYCNeIQf2zGgmpwLbMBJjuvm2Ks5uINdMelZMfdHAtaVUYZ3K7v1NzJYt2t4t
	 S/58WxydbValgyDLs3idYB87a88X7GeW/pyu+ow5nsWoUsYWyk9RqDFBhVIj12HQiTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UsnJKTfYqvgtZpwDrd4+KqPxHLZ7h++mD6Xqx41dttA=;
	b=bZNUFqYQK7/ab3BaFlsjGZe8RqiRjs5Y/2UoOpcnqFsSC1ys3FTo4BRfmyD+yYjm/Mn2
	 dAzipECFMRTlM2CwRvh4y91o7YYA4NeKqZiPWxqe/qRxCSOip2HYNDPRRGflYd9eEmXxA
	 p7XhxBA1bSg/I/zuMmQ525Bj0/eApm7et4VbQPukUylgAkKMV+orhoON6WBQvq2pzDdVW
	 kLxntD4Wx43l7t184SSuezHYYWxXlPEr0B8fym/dZLmLH0j1rkd6BESHP0YrDWE7n1tt9
	 UqzkCpt5qh28mDAJkWV+dxZU3X4/y6yx4kpU+a0GFoFdMtpgaed+WERbzTzX6xDgoRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864596;
	bh=UsnJKTfYqvgtZpwDrd4+KqPxHLZ7h++mD6Xqx41dttA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Soyn8uEuevepNZ3eQ+nu8gy9cqPdeH9iCqWwO8Oq33mvWt2hVxdNwoMZRuhtxivo4
	 gRukgVrR30HBjP35LK1khKB/5+9tiNvCfI8rYrhfwQT0vhGY+8igHgggR+/Bp2oXjd
	 XdM5IbmA/CW3YCy8pTAkXy9SXk4Ur5fbQoNzo+OipIFBws2PeYNjWapnle395smL5v
	 w+eZbjRpUKER0hVuAYQr75+93czlDtre112dKpUtDU9h/QILU2pd5ac07Pw6A5MiEi
	 CC5ZnpadlLQP7Na3Fu5pNAXeWhnBIgA2S6SC6XK6yuYSXIPHBXv0pOQgsgIU50oR+7
	 4lwIQowil7imQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D97560D73;
	Thu,  1 Oct 2026 14:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90DC832A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82FFC80DF4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d4vJaObcSAv for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 68BD380F40
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=iGTPGc3nMT3omy4DjJsWbj/7O4WGHWd2+MbC6fsbRaoEGuunOssu5FgACulZuAax6Lr1
 XJNf2eERULOQnzFMj+ieJvjyOrpO0cS9bCJF/CPOcVxdZSToYVHOkIvtHsK3M/xlzq/AY
 yYGYIiHh+SIF4JhDDYVewWzNQzGZhZj2iNfFhlrO9jMwOtcT5vsfQOa7s3uLOQJE3XImd
 ssGjE/rKPXk7JkJWi8xMsOZ5mRUmpJX8qaJ83HMCAjK8wElAFiZ5b+PtPXoPQYaqwhVXU
 c42X4VwFnHLv5Nkt8p4hHBIJLXV6IFnMlE3rr8rppwdpThOzzyEk+0CkZnVMDi0GCLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/tNLrsxXPb0jXJTCaVHvfCXz36RvE8b8bdp6y9uDunA=;
 b=ctI7lBynsn/7EMa3BI8QvvnLLl62tQg1nWboYmrjIF8bihA+q2fz/JECkWwLhMIk6EN9
 YO39pZQGI/VwpjaEyLMcinjewBUUL83OsPxcLhy9GiL0s7UkGegf4UkYWqbQGwWh3eT2l
 XlvkdOEHch07AOfLT52NXnFkPHWLMoeFJ1JrI+xS3tJDNQ0kBrxByR7eBC7IKTje4TT03
 AUdq0BEVTBIgXvJRBcpoFfch3BmiaVXzpd0fnsmEMLn9GOqOVH3NwW0ETIqL10fKTaFOu
 BWUVZEQWVnIfdH9W3f8GQ4YJDurLkVbNnZm4f40Qy1EXfTMCYE5JxUPtA6KBJv1Jyww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BD380F40
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E0D49843D; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a6f549301c0bd80a7c1ee8e39a19a6195593fb1f
X-Git-Newrev: d54bb2aad3279991e09893d03692dede81c8a1ef
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.8E0D49843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.4.18
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
Content-Type: multipart/mixed; boundary="===============9158056117343529011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9158056117343529011==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d54bb2aad3279991e09893d03692dede81c8a1ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- wnpa-sec-2026-64 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-64

- wnpa-sec-2026-65 · Sharkd utility crash
  https://www.wireshark.org/security/wnpa-sec-2026-65

- wnpa-sec-2026-66 · UMTS FP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-66

- wnpa-sec-2026-67 · RDP protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-67

- wnpa-sec-2026-69 · Dissection engine reassembly crash
  https://www.wireshark.org/security/wnpa-sec-2026-69

- wnpa-sec-2026-70 · BUSMASTER file parser abnormal exit
  https://www.wireshark.org/security/wnpa-sec-2026-70

- wnpa-sec-2026-71 · Tektronix K12xx file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-71

- wnpa-sec-2026-72 · ERF file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-72

- wnpa-sec-2026-73 · Bluetooth Attribute Protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-73

- wnpa-sec-2026-74 · Catapult DCT2000 file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-74

- wnpa-sec-2026-75 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-75

- wnpa-sec-2026-76 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-76

- wnpa-sec-2026-77 · H.245 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-77

- wnpa-sec-2026-78 · Kerberos protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-78

- wnpa-sec-2026-79 · Bluetooth HFP Profile protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-79

- wnpa-sec-2026-80 · Bluetooth BR/EDR FHS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-80

- wnpa-sec-2026-81 · 3gpp phone log file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-81

- wnpa-sec-2026-83 · CMS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-83

- wnpa-sec-2026-84 · Pcapng file parser crash
  https://www.wireshark.org/security/wnpa-sec-2026-84

- wnpa-sec-2026-85 · SSH protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-85

- wnpa-sec-2026-86 · ESS protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-86

- wnpa-sec-2026-87 · X.509IF protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-87

- wnpa-sec-2026-88 · RRC protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-88

- wnpa-sec-2026-89 · C12.22 protocol dissector crash
  https://www.wireshark.org/security/wnpa-sec-2026-89

- wnpa-sec-2026-91 · Bluetooth AVRCP Profile
  https://www.wireshark.org/security/wnpa-sec-2026-91

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.18.html

[Peter: add list of vulnerabilities]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5245c41441bacca292d129d4339e79e5179af79c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 917ac47471..3d8fdb6131 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.17.txt
-sha1  d46443d5bbca3580f944f3effcdfcc59e24eb7f4  wireshark-4.4.17.tar.xz
-sha256  b89a8c60b9282f29be4db91437a6e969e61bc17e8c92ddd980cc38c7304dd772  wireshark-4.4.17.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
+sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
+sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1fd81515c1..c500a49336 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.17
+WIRESHARK_VERSION = 4.4.18
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============9158056117343529011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9158056117343529011==--
