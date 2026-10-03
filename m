Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A485BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F6F60F43;
	Sat,  3 Oct 2026 15:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLNz9WHgbt5e; Sat,  3 Oct 2026 15:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AD6E60F39
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042968;
	b=rVm2WfeAQxKQF+Renm45uV3DDdhJFtRvK4eyLfBLDljUMzRxJ4f0C60ciXTRmp4cMkFU
	 KZEtxfIrA5y7DFF5EA/MNCgqfwKrerGE9HW5lkLgKStLmIjcghRepNS1z3+j+okI7TKtP
	 0m10sqVK0HCD8u/lL64aVQK01gVaXhh1mjFZ2IbPpsahKM2CGV5SO1X2H4VifpwSazOsl
	 +ZorTrYQc5WnuUsrhtCT4APyLxIKsPvarPhuMR59hB3J1V6j43/O99sC83fhEVC7/MjGu
	 uQ2UaSNiojpgDNsy8SPgcFSojUg4DH21+ezOx/4e2WHSAMLynkH3Ty+I1GAlwXQTZPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j+iDAlQBbQZKNvGO1j68DzWQg4naXKJSX9vERotK4vs=;
	b=Btk0ddBI+iyNABSwmq+ROuOqtkbn2wn/e8sWIfbcg6DltTqjtlQGPvVXS19exd6Z1zJx
	 YExBNDS7bKbDjbmWaN2o2bE2l1mbvoMVv0WyTFzSznH5hBM5Wt/3v9xsxxqfKwaYVBYY/
	 I4rrwOJKzXIiEPmM160hq1G59dLeGWP5Ck+6jRXu0FAsYPJtYq2KNzO/JJBrRBgnsLjrC
	 pssXak8/i92XwH7RbTV9X2WPl9cIIYvbY9p8vTbYTA8xOuur9HzI9BEz8aNjEQWqCjE3b
	 WKudsSNxnLQeNuLt0BKxg7QWD3wRVdfc2qnTAhwQNB0odKmqHPbUw4UbW8xuMV2YsRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042968;
	bh=j+iDAlQBbQZKNvGO1j68DzWQg4naXKJSX9vERotK4vs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n+nIqUAIxCUzRS9bLGNgatfpaX0Odza7jAxpdhUByUB8AGdNvuHlM0UY1OPi/lQxO
	 UBM/rtalFvP3LfIFlf2+l6wHk0qmyyEoAbpAAT3h4ZoH43579whbuLJzbYMY4yr2p3
	 VejJs74lVM/yfEWoqdZCWSYrDlf38UmSoFYgq9LwV0hqrGBVOElj2Tm0vBa+x3FOy7
	 dRvQPfo8KpUMDnOV8gC1Ba1m3vcFeOf7tW7Q0tkZHxiagSqga4K7un+jNQpfl3RT4u
	 ueYIFwtBZ0XkzmHpm0/lS1NWGIEt18+JnGGZ6yUBaA1HPhPGxPlXlLiFqHtRAgNJ6j
	 Tk4Xkb5crOEuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD6E60F39;
	Sat,  3 Oct 2026 15:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C21F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2240D40055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmMZ_4L97RVi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6A8FA40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=tEvFLGKajTae0xB7+wNDtgBQhSLrWiRHubNWJgVkAexRQ7WGxr9XJzuGvQVws2Mv8zVG
 BsgU0rkWa4vq1nJzmmrC5UDJCos026P3WZIzMJmVBSpyMA30Hx6vjfyB/r3WWEBTr2eVO
 VsWohOd3OWGSHVxp0bN5V7sXcg6M0r0jPTPt4Z+2Lu02zzZpQAcB69eGSV7r4PGHCeg/R
 CeVIzWhGiLGyGyrMC1HbdC425NV4vIqjfzisusfYGDs1mhUiE7Xk24H9a96MDlvvucsCB
 WITjICI18XnZiJQC+EA9do1jqfBJSSh5YmO4iizqNp1UPf9FOSDh8l5CY4hvr+EOpGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KCE2OtDRS4trBy6SmchmxPinghnDgAbrRw86iEwTAdg=;
 b=eJ57MUky+iBJffGawDNsCUsQiXv6rR8xiVsRgYj2OWoK3l9m1yCXJNh3AZl9lqRwoDr2
 RnZ6vrgamlF1/OZEN6WV4lDx7wLBpJN9byUO9bMJesDDncwPi0qyaosX+KeQcwnGlGM8s
 log0LQ5rCRValHgzF94O+6GbXRWZ5/Nwxr4fmKG8EHSqly/DW7QKywWRUgrjvfhn4voTU
 5XDh9rTixP1nO9dewEIXxhgOUj4hI3sYRMdBDhZuiJLRtbyJ2JmzB8fT2iQzmUYTxWv3x
 86NiThCx/l0W+Eo7UvVwjX0TD4BA5SJfMHJmVtuTaSZj255H5FKQLrPW9zrh5bqF8zQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A8FA40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAFDD8A574; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15054309bda71af51d7b1af22ad2fe0458c2db55
X-Git-Newrev: d6064d8bc0157c8a8b9ff2fc8eb4951708baf5e2
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.AAFDD8A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meson-python: bump version
 to 0.22.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6064d8bc0157c8a8b9ff2fc8eb4951708baf5e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 1bab8285eb..2f84b61808 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  36c0a47464398008ea3939bbef334f31  meson_python-0.19.0.tar.gz
-sha256  9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553  meson_python-0.19.0.tar.gz
+md5  eb572c5384b20e0c3bfad88fb66ae0b3  meson_python-0.22.0.tar.gz
+sha256  9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc  meson_python-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index af8f26f9a8..be9b1fefb0 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.19.0
+PYTHON_MESON_PYTHON_VERSION = 0.22.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/32/98/7fe5d1bf741c03c6eea04b6245737dbd79657d4f9200e82fcbb4cc12637b
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/82/14/1bafca9db7691ff05767570686cd775bddec57c7358e78504cbfd35ec996
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
