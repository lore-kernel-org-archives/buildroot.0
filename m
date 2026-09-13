Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C8C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC521605F9;
	Sun, 13 Sep 2026 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEaRYKu8P52C; Sun, 13 Sep 2026 09:53:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DC863605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293224;
	b=p/0IZtgQdPomwrTOnNjan9cLHJKZL1qwsWqTKoDr1S8adR14YOpyxgvcCcasOTkRgu29
	 0s62geOLSWD/rq3BkX+1B7uLag1Ogd9klg9D9ims0kMmd4sZXwthIYKHU1GEucmqCPORU
	 KeYPWjzhj2t3XFIuorLwheIIaEMCCgPs75+HjrA2HG9dEgnxkmQ/serHQxjzi82UjL4Uw
	 EkIpTVmPGFllo+FTlE8xvx9fG/eJiQk3Pf2rBDt0svZnNjM/qnkK9xzFQHocaPqtsj2Zb
	 /7K7eqVZAfl+1pcRr9ACvyFeqXsMlcN0XL311g9xt7W6NNfXK4WUvqvmI+ZeXNPY9FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lZRlqJRh3advaXwRKYqG7/J4AGfAeQVAX9T32nAtR3o=;
	b=TsQXCDZsiWJ7UjRiVYY8b9dWyNznYclkz9o7pjnNrTb9QN0a8TL/B8FvL2qo6Az10HAu
	 IKlibzggtavoJWfEHqrnEWacSmeglao9QYYccGseyYUzQTc8WUyB8yPai7YahwQIxwEq8
	 Sa8OBF1E5pi4eu6cXhABOyBB68LnOPNPtcqSgz5DH8D9QHf/9RbZuKIeOiTCZkmmSyjaj
	 BfCG8VP0DbfAJYK4fCIpa6xbuS1SmgOTMmhg9oDSIdSZ5h0agTWLpA6Q3CaqH2d8NecVd
	 k8uBh+ItYXDb+DjiNLfd++/RdPlappER1QLEioiFMLSQFXd7wPQMXxNEnRDA0dWZZMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293223;
	bh=lZRlqJRh3advaXwRKYqG7/J4AGfAeQVAX9T32nAtR3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rtvn1rJvYBlKpDrJixIP5+ceZKpjXB6fxTE9ucdCvPc7j+l+6C0drkAHoaNvTj9rh
	 EI6fR9SYL5OqurcZWCjjWCk1EE6ZmTLatJmz8OGXjnCUS1VYQjD20nJoL6sXZjG00z
	 FZx8rWWXfCLhKrpTdJb7/37NlrgBfOeLMlN8AxYDtClgPFsxU2Ceh4juk1zIkSScBT
	 Bfh8jt54eh2sOWkgvg8pFxiRXfd0ZyF6L9OLzQVLFVxKO/vcbbdf3V8lPZLZi6hX6N
	 Z+Mm23FlXETkjNjM+HXx+BNpmTwMTsB5BlOUV1G2WaCFaO9PYRUv1lvjZHBlVkrIHp
	 JmZLrFj2lcxHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC863605FF;
	Sun, 13 Sep 2026 09:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE1323F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91482400BA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKQCg_zJ8Fpc for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:53:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A42BC40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293220;
 b=q/nHFUEEyek+mnV2cwR0KjkgMwtukp4ySJiwtnWVgUxC/YCS+Cms6Ee301Ry3UgerLa5
 Fka9zDRxqC917YRXHEbQ7kaIybf3edWCw53KU8shw+dhNq9n0gLB1bD6gnfpdHvsxVV7E
 QNk4z2DaMHkCleKLEB4k+axn96CyEGhTjYxy1kB9XrYT4Se7x9pVmzKyoFhhr+pswj7jr
 wVWtM8UN+1IOUT7+tb8wR9y43BuciUX2LN18lFGzQtL/Se0HZyBHRFcVvfO7W8RlaONWu
 14DFM1eLfL2I80PbBjnpkCIVzXy0b3W9CL42cHS0SaJqMoCDrbocmEwe9hPToD91stg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293220;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yR/OBFgXfxvod/aLZay6B28lq5zQwoGumzcwoqApGJs=;
 b=mtGix2BVQ/BnQeOYCsi06S1MZyFTP72PRtBqGIdG7j0mKiBQxwBjnRD1Q9uwWXOv8DhD
 v5TOoqCje1pR5P+8I7aOXh+P3UbWEA9UU/plqTdanvAZ1PLj7hvYQJZ2prdLAnzquuhRw
 030bem9lY+At2OzRsBgTcwJKVqfpI5RYvkNSAzgbsxAmTEzKBB4yqB/WB+j431CzLZHu5
 qc2l8JYBdztVIUM9JNp/iztp5QOyedRo1npQlngHTYG81AvKEZ4JamnX69dFGMFIueXna
 qkfR30qriCWcLXjWUGi9DhJ7YZcTJwgOSbWkdj3oEAjukoctgEYJmzP9eGidG7weR4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42BC40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C772B95B85; Sun, 13 Sep 2026 09:52:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:31:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cbe7861def8efe24e08ed734c6828bf713af86c
X-Git-Newrev: acd98af32e07d0ae10adca355f4ec9b182eb4214
X-Patchwork-Hint: ignore
Message-Id: <20260913095235.C772B95B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: bump to version 0.20.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acd98af32e07d0ae10adca355f4ec9b182eb4214
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Both .1 and .2 have been minor bugfix releases. Changelog:

  https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.2
  https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index cd1b83e6e4..aea272b12b 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.0/downloads/wlroots-0.20.0.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.2/downloads/wlroots-0.20.2.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  33f52414e1b280839aeb70786f0ae2c9f54e27ad4873108d86270a2f89c4934b  wlroots-0.20.0.tar.gz
+sha256  80c567d2ed4efb2cfa6b077f22c7a710d9c78ba4e185a75e8694001114af0733  wlroots-0.20.2.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 5ce634d402..cae2ff0c5d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.20.0
+WLROOTS_VERSION = 0.20.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
