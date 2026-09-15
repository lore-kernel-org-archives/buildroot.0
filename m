Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34716C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B13666074C;
	Tue, 15 Sep 2026 17:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWPYb2RWdVs9; Tue, 15 Sep 2026 17:04:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E88C560732
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491860;
	b=G63uvChgrPiR50D58rvHA2D3AmIEi9mGaZe8BNgxs/58H+FA1Z6QIt5FdkVT23Km7aOx
	 DIna0A+LqHTwXdEOt732s6gLP+2TfbJHMGUrrGmQCkBW3wqRtQIwOKxHYVmtJWZel88lQ
	 twqn4e9BzaSsAWbavqFU+IM0NdNXAc6na0pGARozJnT92PVeF8XMbKHP4hFtOvwPU+B5O
	 iQUBhZXxFkqMtANSQwvtlGpGBDVw1QwG4LAsTS4MGMI/9/GhSJu54kz4UxPXy9b+UaRUB
	 Rjq34XEQPMYpn5bo0dCuaFFfFvfC+/7pUoZ1Qh/ATZgAXtTJzxSaaRYi5fFPHMcH4Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gK2V5mebZiGjbmL2DS0hay+jOR0wMFm8QRwqYMjmFI4=;
	b=YN/tQVqfFfEQU+7sucK5dPJ5HoOEQBnnXvkr74BMQ73qwNM5fqoNnTpDYg/r2R8/ieDG
	 TsZ2UaMRx6OAuWDRdKj4E7HlCUBHnwGvwtTqGtZnYfzJK7bHAnjr/6HkoE8aoIjbnufJe
	 6+gicaRWmpoE7FgV0XR4ScmXHc74sgPH2w/I72kvrKr6QEHPMl944L9P/ERtU7RsaMfyd
	 XW6eiC/EU0J2IsgrScz8IwedkxuJMt3PvW8+g5NUl4bhmF0lAGL6KRbBVcgz1tjF9mYbM
	 ndJMee3ALdG7TnNr9GcwGaa1M4pKlwqaioPPASxC5ZpuxTTWwe7wiUtHB3/yQAFSo6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491860;
	bh=gK2V5mebZiGjbmL2DS0hay+jOR0wMFm8QRwqYMjmFI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bo0rqgBKJ+7FJ58NloNH0qHUc5KLIDIFlqMtSY23rR+TSZ79NK84PiQVu24MjBrMC
	 vDBaQmwKIvv35svfADbjZhpaIyKN1G9qNpx8HNi+OaquFVDSPJx4A91P3kkcsXopB2
	 w9WhJpthnKLtqEAUfxZDNZ8B48LoIDI7fNII9zsbsyvhaMZXd0E+SlIMpORDDBA0mU
	 DwhSedThUCyaHBTgX8Rwnd59aumTT40dqDjwut4705S5J7QVJtPhW87LSYQj++Z5IT
	 tl56I25yaO0717iYsAgqyXFxk8NOxmpBJr56TO9C2ApDMcHqf+SeVN0hCQAe6xmSGL
	 2b+8BaBHXwWDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88C560732;
	Tue, 15 Sep 2026 17:04:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8B043AF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBBC780A79
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjCyi4YMWvz0 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B0FF580AD5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491856;
 b=fRhC5BdCF2uv6uzPa/upiHhq8W7/OX7a2FkVrW2vv4OGGCv3TxxbI3mnrVIC64hBexlM
 olodW7yl5iBvtKbYAgzmS6GEOjEijF4cVMUS2DoqsBMOhVKMVdbDmvBYX+/FGC/ev3xco
 OEEiBEhUvxbhKKBZTnEzC2KDfWPTsKgliWoWlS/gFX2PTPGrfNKRfgG7MOLFPRaof7zd6
 TG5j173A87CZXQdiDSUTIygtzi+erViG/S+AjBBiA5b+zpTk7XyvrXG2+DjGsbqXvSwGs
 LDuvz+qgvrUH53SiNfRQW5MbovzwYRFoaoycmfoiDrP2pkzttxhIJ/kqBv18WiX2xtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491856;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=925wOZgAxibkrkyl5hHUYGaOlPX+aew8VmCni1lL/0E=;
 b=Xf9E5ujjMdrW55HU8p2jq8aSKqhyMdNn9HvVh6ydIIKe4HJBuJrbZRqO/mMnlAdD/wY9
 NwqlMk+UCPjhLYuj7dX6PL8IKWPzveOh9uZL/NmJSgfiL0EU5k7Hn182vA/DuGXI1Tjyj
 t2Wm6GYXdIs635AiGEWnUquNdtgIqSkbMu7IAoST89V1oc/DOa2qEpXsXGIA9WzuKjTOR
 rOTNk0R+EyuRQ8wAPpd3lfiTecanDJMwe5xLeXOUy5TSXr9s0wlBqnKE3iGnffxZDNaQ2
 Kjif4yKyY8ED59yxXnrWLLWWlPKEPcpvm4btpwNx5kW0QCmC2lxbN86eZ8NA9bp84Jg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0FF580AD5
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7FCB95CEC; Tue, 15 Sep 2026 17:03:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 18:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7878630479ae26bcbac37c73f64e043f773ed171
X-Git-Newrev: 055a1e249c8d15dbee3a3c10dc7d0acde03e0c91
X-Patchwork-Hint: ignore
Message-Id: <20260915170310.C7FCB95CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: security bump to v7.2.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/055a1e249c8d15dbee3a3c10dc7d0acde03e0c91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Zabbix 7.2 is EOL since December 2025 [1]

For more info on the version bump, see:
 - https://www.zabbix.com/rn/rn7.2.14
 - https://www.zabbix.com/rn/rn7.2.15

This fixes the following vulnerabilties:

- CVE-2026-23920:
    Host and event action script input is validated with a regex (set by
    the administrator), but the validation runs in multiline mode. If ^
    and $ anchors are used in user input validation, an injected newline
    lets authenticated users bypass the check and inject shell commands.
    https://www.cve.org/CVERecord?id=CVE-2026-23920

- CVE-2026-23921:
    A low privilege Zabbix user with API access can exploit a blind SQL
    injection vulnerability in include/classes/api/CApiService.php to
    execute arbitrary SQL selects via the sortfield parameter. Although
    query results are not returned directly, an attacker can exfiltrate
    arbitrary database data through time-based techniques, potentially
    leading to session identifier disclosure and administrator account
    compromise.
    https://www.cve.org/CVERecord?id=CVE-2026-23921

[1] https://endoflife.date/zabbix

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zabbix/zabbix.hash | 4 ++--
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 787a0acfe9..f312dd4a49 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
+# https://cdn.zabbix.com/zabbix/sources/oldstable/7.2/zabbix-7.2.15.tar.gz.sha256
+sha256  b7013063b9c6256a185f6e6001eff7d43b831b183aa39133d6ee524d0570e85c  zabbix-7.2.15.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 50bdfed609..09673d43c9 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).15
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
