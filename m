Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A3CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E0460EDE;
	Sat,  3 Oct 2026 15:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jk-OBUuQz5A4; Sat,  3 Oct 2026 15:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 39A7561040
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043020;
	b=kbfbsvzCnGeEfeXv1Oa3ozEJ6ne0zRzU8Zg8M+h5iNX1CWgPY63Nle9q9srMMAKQVqft
	 S/BLmxqwdeKxD3pH2jcpLHqom4BePwXFDWePKgrFwfESWhBkLLnhOH1ypOGDvxXX5eccA
	 obEfSC+x92J//iHB4t7+MeUNB6zrqk13CbsnzsuHglWu6wWCcb4OsntEWcAOu34MQH0JD
	 rfqtyAGG2sEJhFtv1qS9BkXiajiHkvWdVBR646hb7HmpphtDNuxeM7ebjABZQe0ZaJTRB
	 zNODLHKcxdDZ/9eYk42ywimWA/+agi+FH8ZIRtkKGd5BbmRnFbsabk7jRs0IcoPeQaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043020;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tMbNSb+AGsUGXTpPlEhG5Y/oIISPF0kiIDIg+ZMStQ8=;
	b=leY+x5AstZgxAGScQ7DQ46pNk0vMxXgB3wMviAxJOPkYSSTRLDQIyYh73ZkUWgVHVfSK
	 BQe0ug6qUnLSso3W6bbl80PVf2DIUfFRQNMuznMxh8UimKXGvYDQsmx6uQoL/e6TmaL/p
	 oHdFX7loJJ4yU09T71QHUINgNG/JXEMhmmqSLnzoATRe2pQq1/PkOVFF5uAauIBpn6dXI
	 M3m+MKKPOvX4L5kJyydKXaPf3/T+sV8q7fQz3HZ8DVN3qgfr48/BUA+1i98ccN9fgs2uR
	 4c2V+XYVFK2OeKOndxgGINMROgBUjvuWcFXADPGGjMxkVYEyBZAz5sf7o5m30sI2NKg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043020;
	bh=tMbNSb+AGsUGXTpPlEhG5Y/oIISPF0kiIDIg+ZMStQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VEjUNsfY9uNJuZdGuk5azhaNEI1by6FabdJPBvgx7oJyUct2iS/BPraeYw0a5KPrr
	 2+oVX/QptMgivZ1eyU7dI3TlIy9hfbRzm3RxLcft7GaXafrhKP5mK1uf9pb8F66177
	 UxfrfsHoa8C1KgwpgYlxNaZqNltetQJZQ68sebfVLMuFDZpY0tgFZIzkRcOCnVcMKr
	 TxjTOLKODi+rvQiMtGuoKi0EMTJ2tQVKIyfyF8lz1YbFu/JSzba27oqen/XBWpxre8
	 V/rbShxZg5cecM5Us8zaGg7Wb+4W42ZtTG1THWEeMDl5d5BEb9GitEydE3hqUdk44a
	 2p9B/iFuAQhYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A7561040;
	Sat,  3 Oct 2026 15:57:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB8C9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E29F6066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgcFmFcnly_7 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5C1E4606C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=PSBT8OOcirKsVgBkW4vqTAiiD8Z05r5gyFwWXANhBkGIKkYgAzJeTUOf20CIORfRtzz+
 LSc+ZPtOr3GkPdfstJXq2O/e3UV2RMTCF43opJPiKhs6gg7I+A2iyUpU/0wC/TliM8biO
 poD2XP2VzUY0t5d98pG5sb4PTzwjbh6Ei7VxTIblp93eCcdRTA8SvH1e7a9GbKju6SgXj
 5yFSxvXMfT2RgC9+KfszSMxzrniLtpe1NWaJKVeO/NaSgCTWsfrymhBH6CxQM83q53Caa
 tFHQcEzwKRLFsJPN4LEYCZnQOIC20Jgau5XB4xtnNJ+n1WRFig/KAbb4wqInsv+ELDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yNVQYlx+kpOdKASOK+O/XS+Ij0eb5b3aW5mx12IjNNM=;
 b=RCpMjp+wo1WjKfX027w/o/uHyoklzmtHsWzk8te8A1L8H+iSMGXph0oky1BkVDmXHuE+
 5vZP7jGcjBYaFoPy2XYhaQpFjfvxBb+s/FwlZhqprZH6QJoPYqixjeqTgCFjLxuQ0AZmC
 7a3Vh+JaKZYPz8HTowxaL6VVrRcLxDg9hERITVQ8ZQE2LCZYPiYgZUatRGQKdD9q3IT3p
 21CynAzAblTwJLl670tOk/4s88KuOHitJ2jE5unMLn3S756C46AOng88hF5fbKHADke0U
 YemRthbBcfQOWvCTAN6xYz0jICP0YZEk/dA9o97FYNqZDckDvx1H9NSJkeCX74ac0Ew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C1E4606C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B6208A4B8; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01d4a3ec930885131b02f09eac021e03b09461e8
X-Git-Newrev: 15054309bda71af51d7b1af22ad2fe0458c2db55
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.9B6208A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mbstrdecoder: bump version
 to 1.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15054309bda71af51d7b1af22ad2fe0458c2db55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mbstrdecoder/python-mbstrdecoder.hash | 4 ++--
 package/python-mbstrdecoder/python-mbstrdecoder.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.hash b/package/python-mbstrdecoder/python-mbstrdecoder.hash
index aa278d4590..cb76f00d92 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.hash
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mbstrdecoder/json
-md5  c9d9514be421c358ca75faea3a430672  mbstrdecoder-1.1.4.tar.gz
-sha256  8105ef9cf6b7d7d69fe7fd6b68a2d8f281ca9b365d7a9b670be376b2e6c81b21  mbstrdecoder-1.1.4.tar.gz
+md5  606e6a8f552d5d0aa40dd9a139c5e6cd  mbstrdecoder-1.1.5.tar.gz
+sha256  8cbfba26938befd8a35e3cc06ca0632f61320b7b2be7df32550b895e1725b1ce  mbstrdecoder-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-mbstrdecoder/python-mbstrdecoder.mk b/package/python-mbstrdecoder/python-mbstrdecoder.mk
index 6f51b36103..66e2c0b194 100644
--- a/package/python-mbstrdecoder/python-mbstrdecoder.mk
+++ b/package/python-mbstrdecoder/python-mbstrdecoder.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MBSTRDECODER_VERSION = 1.1.4
+PYTHON_MBSTRDECODER_VERSION = 1.1.5
 PYTHON_MBSTRDECODER_SOURCE = mbstrdecoder-$(PYTHON_MBSTRDECODER_VERSION).tar.gz
-PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/31/ab/05ae008357c8bdb6245ebf8a101d99f26c096e0ea20800b318153da23796
+PYTHON_MBSTRDECODER_SITE = https://files.pythonhosted.org/packages/4b/9c/dd6e38d747a62ead27f9abef32f4ca4311d4e40ac28e76bcc9ffb5dd0329
 PYTHON_MBSTRDECODER_SETUP_TYPE = setuptools
 PYTHON_MBSTRDECODER_LICENSE = MIT
 PYTHON_MBSTRDECODER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
