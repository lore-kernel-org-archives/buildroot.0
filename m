Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C05CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E79F60F25;
	Sat,  3 Oct 2026 15:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWnNfHcS66t4; Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D5B560E5F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042958;
	b=YFB6wnREzB2/oxlI3jWombvNZIcmOlGnaSF+7dyw4sqxL+OjrGyyJPQSuCjEs+ggqt9i
	 7hQuCJmfavmrJCTeAeTCYb9WrqsPQfFkHuRpk1rwfkqpZivsz/493UOvvI7WTbnl3gwRU
	 qguP42ezWtYqUfJZtlyEAdC7PUzkqN+ret9bhbZJhEwiNP0hRrUbjiJIUiyibtV/PNvSN
	 xfM5INwbMaW+jFUYnU2DKbpfjm+X6LAvvwzrqi72kXKTDyfymW/q9S/wKcn8gCP49BljB
	 efVLYcLkrcFEcXYqW1+/V3DQ8xHIMGusE0Vq7AT5VhU7SpTOsYCDce/IDSMVYKSfaCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4AhwcMX1kQSuUeL6wxjLnHtZyUAMyuY3Kq/SV1l4r+o=;
	b=TR8oCg2ktziWhzujyjplU477qyPGqQIz9L+mZI25D7Mi2wr3/CgHeyBQPAtjqRW5iC6T
	 wtv7Eqi3AlGdE5YlR7B/P0ejCFXxng34RCGZrLrAUddQdj5qW/ao9C6du5CnQylps1x8z
	 OpD/dpgzpyueZBzjhN0ck5On6JDJvYU5/6BCmsTQJm2LvIyfMeaTMFIFjbsFknGA/vYQ4
	 KzE6sMiHLzsu40D2B2kvV9La8XF3ycfGuZPXHnRbnInz+Zy8AGlGwua5TsXt3EiQMGtKC
	 /PkY+Jucs73isUPZwspZgOATxsCtuHX4CHvhm9uLuNTzWKH17iPMicwkw6WhdR8NWZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042958;
	bh=4AhwcMX1kQSuUeL6wxjLnHtZyUAMyuY3Kq/SV1l4r+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q7PqPPttNseBx4HWCRgCZS3UYwCjBprIzbNBl+RhQ9z2xZgkEA6ijOZ5tKRNNOKsZ
	 BitpjofDoERxpdRDoIFx2VFm0zSC9yrKEaZxOj9M7IUyAPvEA/ff5LeIpywIc4A+y2
	 eBiAtwu+60LONJKeqH/XEwECrK7Zry4fdI945VNdEgleCbVjfwPH/cPpLiOAo4IxeW
	 pkGarsIQm0GHq61uJ5NaVgZvzzzZSHQuNG/3JS1zZ9mFFiLAmKvuCdZbD21/WexCrq
	 73pRUv8eapeeIYNAUQocFFLx27YaOpEakQ0AWZMuzT/sqha2fRxML0xb6o8BOrDZCH
	 KWZIajFNzOCnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D5B560E5F;
	Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DC24335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BCFB40055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5t5Ov5YdvuFO for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A23EF40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=ruXruj5uSbdZACSNkZcA3QsnjvDiskMaOtGSzYlfP4ex0UcSgcPfle4dN0xoLtddrlBW
 THNQ+E6rZPjG88b47bxinTPySs94DdsiY8eo36HYALhhL2eGsXTnR0mBQc2hn76j+9GJK
 gpsFtKlsARUMs9ira0aIEVeCxQo2qnfsG88gMAns4L3FzEheSbl4XdCE94b2AHDabUIOy
 UQx2Waefidi2Q5vGprLIG36VkjlWIYM7zymPR+TaCQbo3AdKCvIwpPz04mdZ/PZWdwOCb
 +MQFZgcEPj8hdlBwFN+lOHoltpqQGfVSeR48MAQE8xsHHQvba5X9oGEbVNC5vaviqkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bdBt5oKmt6puIV7+eayaUkwqXI/Th9+YNMiLCKVOYd4=;
 b=HBaVRIXZZqI1M0xM5XF3mdMrVa59EGO4vhBvBEFsyYQdW8U0TX0f+Hho8FzmM8SV00iI
 T0zNWTF8R9ydHsaChBLXAOWgUL8sk4v1zHrAflM5g6wquWoRfNhI3ZnvIrmI/Fmt7Dv5k
 AOHc0TBQX+EE7On09nV2WZVxdRmbe0sXf3to6J6RkgOc7XV0VXAxdZ8qOEfl8vCu2B/kn
 si1vr7hLQqZbT2NkqfW7vCmZh0iue3Ca6l6+9Zse+vYi1fbOEHj9jNJLYgPfws/QlbnJJ
 VlYMkPxXmGvrJIC21zlEmDLEJ0m5B08QqEY/xzzy/P+2FOivx/z88jjHDL/+tNV1jIQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23EF40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2012886D0; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac84f36207a8e1d5bf50ec17f67bce384d5d7300
X-Git-Newrev: 2bb6d02085b76fcc2c3f8c85bab0caa53cf340c8
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.E2012886D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: bump version to
 3.5.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bb6d02085b76fcc2c3f8c85bab0caa53cf340c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 8e2dbd4af4..79dee2c9ba 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  218f7f41d00dc84a8b84c57aa2ced62a  greenlet-3.5.0.tar.gz
-sha256  d419647372241bc68e957bf38d5c1f98852155e4146bd1e4121adea81f4f01e4  greenlet-3.5.0.tar.gz
+md5  334c931cef75cc40f6b7a81f7b50f0f0  greenlet-3.5.6.tar.gz
+sha256  8e67c43bdfc88d5fee6db0d3e40175b362fc95fb85f0412d233b9b203c53a575  greenlet-3.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index bf8181b0b3..e216da5689 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.5.0
+PYTHON_GREENLET_VERSION = 3.5.6
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/3c/3f/dbf99fb14bfeb88c28f16729215478c0e265cacd6dc22270c8f31bb6892f
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/3e/6e/0091f175ccd02b02bc8811bbcbcc6ac2e980be116e3b2f7a736ca322bf84
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
