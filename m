Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31030CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BFB6144E;
	Fri, 16 Oct 2026 13:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id Oni2Nx4pP57v; Fri, 16 Oct 2026 13:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C522A61459
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156452;
	b=V6zlv3GXWvd7R8HSGHkEP21TlRSJgZlpfLztkuw6L4+rl4qo8TC/epwthyW5TNsFh5dn
	 axu5587vumardILl3b7vLubov04RwFlSbB0h1LgJmRFS1shKSS2s2f5aCB/exVsOC0vN2
	 XGrCf50WWZr08FFi/wkeEo/JZwN58OwtWYLsj75Sh9OadktMRXfgTBbbD/CGyCnIGSTae
	 oqHtx6T4z7SZMADULtLdRNlZ+tAx4Wfo3Npht6KydXBshnn0sjOv3bSU0t2IXLsqvuJdl
	 iCZgGsCaA/9Zpsij8lZsm4TWHpg+YD/gc7mUNG1KMt+/r2zV3pBF8Fu0R7qQYyv8CYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DcqbeF+e2qzwAlSOfFerJmjavuPQPtIap+c7bbRFjjE=;
	b=V8dUz5HmmXqRVIY/HfBDT+P5OkPH0QfXH41qqPN09rp3Ljkhgb/Pkk2U9r+wm97eps87
	 MOqHoCdE+nHfZZPKsNrofaudRAKxmZpmGqsmaMlTkmPJXAa0IqN6JMwk+/HnUKgDzG9gD
	 f7hDXRP+bpWVx23BaWjw2AzB8DqLx+fWhasTbwI4pjDpxjsf+l2Lf/3Dm0lQMvym4/3Nz
	 C2A66o4b3BeqWFaXpJmH3SY9EmjhSTeA8rHepNqWynNQVnmsncznqL5O3+EvHfFL3VI1Z
	 1ltfctlds1TtA602Nbpv644ueUIi+30iRvciQrqN4i4x1ERUuTlXWktdENkUbP/4/og==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156451;
	bh=DcqbeF+e2qzwAlSOfFerJmjavuPQPtIap+c7bbRFjjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DjCXMcRQghQmd8RMO6agy3Uu/+q/ZsfHRg4+mEQFuwggT2XdOnT1OdHHOvFePuUF2
	 YYtriDp3pRcTjSxHtPXqs9OUSQJ0RLAEcNWwNXratxSzFDVqs9Z/QTgeHNCFazkgJ3
	 1SX2h0oDDqj/Y2wvqpbNTAPD/SF8u2d1xC/sV1N76hpa8atPFRKnL17KICh9M540Yt
	 Lpdw7GSmFjVp7V8XuNmJyoGuRefvFUD/VWbfq108hzfCtmPgFm/hr4+XVdT4u+g8Ss
	 8LaN/vjWlDWpQBsC9Y1lWigW3E03Xgon1wru3yAXwg3v8j7h0FoXdSFtSWV3cT8qf/
	 DP69bCr6jWuWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C522A61459;
	Fri, 16 Oct 2026 13:14:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4679D769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C1DA60F24
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPSDXRQj6Nrd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C4DAF60F68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=HBQLcrfrz/8cCLDhy8fVNM7kcFCsorYJUXpTaAdoKTOaiBZE5X2RnNXBtymw/jpygqWY
 vg+qG87l6Q/3UshtdOcQfzFuGCUwK0lJPnAWyuIC5KkBAFaiKEiM+Pou3Ro+ZThLgnaI9
 GW07TmbwlXQtgDPbr6zX4P2fZNIS22UfXjY20K6OF9reDGtbc8dgeiFwv47GRmuHgtQ+i
 VNVlh165YaJ/xhnz+XYTRc0yUkNWFiK8zy00nDJYittK6BnBTVb3lGQpvee3rRuft+SWI
 Jdzn6wouw0PEcf9ej/wCgGYzAgrrPAgj/zXdFePU7+hJQB6tCKm1CnieDzTcGKatZzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dd3gi+hVxYwOU3Q47bebRvRTlCAywX7mekB9MFF3F3k=;
 b=oHMext22dWZEVkbmwr1ap/UYF2CWQC1Ayz5SSktSa7M755nhw+KqTu+RT77XOyehJO8i
 QeJb3B8aIv7GVoqalhGEtZPiLezhkYsGSkmX9lCz9I8GDnVNYsLgBq9f0sWrafoSddIaU
 g69ia6L69PRBvKJuUrb718aMr0+Wz6k/x2DvPowpMZWG4d6CabO63j8Jwgc1GAMtq20ql
 UP8E9fdhvKpJiyBCptPELCIgoYqt2hyq+Pc90ppI5uBUSLc6cxjQWGCJ0YKTnslYYYm+a
 0T+gkVuRZhTfNSLbjdnzKL+L/kheLftpilWpWTqzrnxiCGYSzBUEBOqpuOLQso9Z4nA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4DAF60F68
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B46E4960D9; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:40 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 59bb1c43a4c6d3a628edb4a2ebf4672549af9b78
X-Git-Newrev: 0829afb150497b97fa2fdbf55fb8781e4bddcb6c
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.B46E4960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] DEVELOPERS: adding myself
 in packages with LTS policies
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
Content-Type: multipart/mixed; boundary="===============2087420781707782384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2087420781707782384==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0829afb150497b97fa2fdbf55fb8781e4bddcb6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

To better track the version of a package before a Buildroot LTS release
is made I'm adding myself to DEVELOPERS file for those one so I receive
alerts for this subset of packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a72cf3fa83ca85d1aeb17dba6a8986d864906de)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index baba0dc4bb..d27bf5454c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3227,10 +3227,28 @@ F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
-F:	package/go/
-F:	utils/generate-cyclonedx
+F:	package/asterisk/
+F:	package/bind/
+F:	package/clamav/
+F:	package/containerd/
+F:	package/dpdk/
+F:	package/gnupg2/
+F:	package/haproxy/
+F:	package/libopenssl/
+F:	package/lxc/
+F:	package/mariadb/
+F:	package/mbedtls/
+F:	package/nodejs/
+F:	package/openjdk/
+F:	package/php/
+F:	package/python-django/
+F:	package/suricata/
+F:	package/subversion/
+F:	package/tor/
+F:	package/zabbix/
 F:	support/scripts/cve-check
 F:	support/scripts/cve.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm

--===============2087420781707782384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2087420781707782384==--
