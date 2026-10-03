Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24A7CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5F96069F;
	Sat,  3 Oct 2026 15:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHrntcHOMdTe; Sat,  3 Oct 2026 15:55:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA86A60E24
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042904;
	b=WFeJ4j3mIJV3lInYKO3TlpCpFyt44dWtv+9a0BlnMA65mUAbKO7UM2fRHjo4UibVnvlt
	 3CC8UKorFJsvOm1s4TFVxoSo0FiuZ2rbDz9u1t7Hf5kqQioPjZtTq9n8UvfD/yAy5wArQ
	 IN0vBKUGH3gJMneQP8oKECpxl5AhNiEd+u5w0XTtRoY9l1lDsTMDVOXrENzsZbR/eX++X
	 TCPqoUIf6+yldbPRg1MK7EM9HktjVS0GS+An44i/3c0FJnDfmLYvcntn4iUI+BJH0sypo
	 SXTV93KFBpTx1FWYpKcWsgCuVPs1a7bKjVWql39i6sMGakOwCBZbQMjnRlN/bo9GaXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SkghhgsseeFLSFsFcRSIWNK164EzF09NSr5GS/ehf3o=;
	b=roLOX5RFpM7cqdMgfyuitm08zTPaoCfMuoAj2YBFJj+RroJUvPIcUz1LM0hNi7R0gvf7
	 w0bUYHME9eZYTEHmI5ADeH2uZB+Q7L72igK9eWpUPns+6/gKTsXmUs8QhoPMpoQqCbpab
	 XoV9npy7AcWel7KWOoKINeomSlls+vAUdojfTedXw+VEr6wb+15GTLoTaiNyI5lIs9x7n
	 BJAibImBJXROThBcyPZAQXvrsp1dgt6pb7PMhy+dCEHwDuFjJ6IX41dYtPI16Jx3lno2i
	 klaByO8AYh8Ec82QNP6b/eh/mfTQFHaPqVrhS4ZCIrMJJ9ZLeDKLz8v/u8IL2jrK0kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042904;
	bh=SkghhgsseeFLSFsFcRSIWNK164EzF09NSr5GS/ehf3o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tco0dhhkoep32jkIrBnoh5PLbHRlECkCSkI0CslNcle7pCHd3GnsrgBgtpSNO7SLZ
	 rvxa+Ua7mAbOALW5uhLkVNk31GnZdtARZl0ctzH5rmZw4gh1AnaD0KfBk2DrpsiLVY
	 e9y06m7hrkTuIHZJLveO/pPqauuntHv0g0tbczQiIdHpBDJxw1GafffTpJXpRH3IaY
	 y/Mn+ZIyq2qAqeZIYNoVMbhmo2Rsf90zkJbzTcbsdzrSASiPu67cI8rdhznE31q6Y9
	 AS7S15vjA+NSoYkeGWB8xikt/Ab3c8gQW6xXGO70RU4br2wnsvV9/G49MvRMePIDgv
	 k6hrlqu31548g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA86A60E24;
	Sat,  3 Oct 2026 15:55:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61B1F335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591386063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1DJ2epEDgtE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B44946068B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=OFG/y/SysveE3IabJPFzX/jILWqXOafE5YMABbGs+BoA4HNWFJR+iZyWJWmHn13Wujy8
 jBMZ6o4OfKQ4YV8IQ5qPCsgfLHBeXzPAKrtR7fMJHRHrLxXVDi6HW2I5CcSc29Q5sq5Jx
 /5jUDfD0mPBSAdpZHpilk6RIQv4hSO5spiwaN4QkzutVeRa3A4CmlmlWht4F2F2WeJdCb
 AotTW2IXPtJtUuCff/jU8e0nYod1/KMlPQIIQaws3EOOFu3r4vDum4ouLtcQpejTrROxs
 7gxgIhClWHOacRH1yTBCHzBllmzGHJwc43s9DoYoQwWyEJbJo+dLgvUzOfKDdX61YWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zu0cMWNk554lsv+fE3gw3WDQj/JzeAJm2LYMaU0pvZ0=;
 b=c9OGFZeR7YszOg57Z4wSJc/qDVa9cZDvtVYMPX9BLDXBrx2U+DblIvBwI3RxQbhmna/V
 IrkC6iHCWKyzXXTpDc5RyKkaDC0BL8NIlaf4105Daw/uR11jCD1kh1S173aRq54SZOP6+
 V2EnOQgGPxHwNShlRr3X0k24VC56zeB6YIzNRoUdP9EXM0DxYw6Mxqb+Qejq+gU7x96B6
 NlNeZLjDk1RRcqbVfE7iN/XH1LwobjKlJ+4LUL2pJ6WNBswVN5gZHgQQWfWHpcET+ATor
 ROlK1XTikGY3vJhD3to0MkGyxOKpffwt7deSzAul7+o9pM77cnUgVi4/lljPYP1r4IA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44946068B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0113C886F7; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f98095598699e4fe35897159c74c1b6ea57ffb2e
X-Git-Newrev: a8f142b2e5d3e7c3f42f6b02dd0005c24de6149f
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.0113C886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump version to
 9.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8f142b2e5d3e7c3f42f6b02dd0005c24de6149f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index cdfab80acc..b1cb9d8cfe 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  0cd1c357553d2e3eb850d71843b375d1  pytest-9.0.3.tar.gz
-sha256  b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c  pytest-9.0.3.tar.gz
+md5  31f635913c0b1bce9438be52d44398a8  pytest-9.1.1.tar.gz
+sha256  1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313  pytest-9.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index e949eff8a4..6de425cd23 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.0.3
+PYTHON_PYTEST_VERSION = 9.1.1
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/7d/0d/549bd94f1a0a402dc8cf64563a117c0f3765662e2e668477624baeec44d5
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e4/47/b9efed96c114afcfa3c9d3fe98a76a1d14c74a9e266d397cf6eb64be5e01
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
