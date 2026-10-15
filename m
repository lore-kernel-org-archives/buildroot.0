Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F8CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51F861289;
	Fri, 16 Oct 2026 13:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id TE5H3V5JfSeB; Fri, 16 Oct 2026 13:12:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4E3761276
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156360;
	b=DVJ0ZdAoawRaEP0ACbdiRdzIu9FDks0CweFd1GVASlIpdzAHhj8F5y8gaT+2/N/+JSKK
	 OyOlg8rFUwzrSJcDvkkJWFDUT3H6YotSRmyPJttFGlQELvoUV/E8Eo4atS86W/0uJmXs4
	 JRRKH0O81AkVfFFjYvY+hoU5ZJ3vw0+fBqIpwxtMnuTA1yGbosHAWJiq4J8MVog1be51D
	 5KHuirK+bsaoIhXObarmnlmdul1EHRu+BSRasW+cNAUe4FVuczITt3NtqtA9YZsOcal+F
	 ItKfjCgtaiSbfhXMf41G+074j+8mpegv3NvLzoduI9IZ/K/L1sSgG+Dba+fDZrGKbuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sGI04fUT0xKzxs3nVWngtZXccUxLRyrmRO6mRHIyqTg=;
	b=j38nq8PVxR7gPgjZnrds71khRO5kiLiHhMPvLRBvgj2JBNIMq4OxWKmUSVIMHZNQpI9E
	 ePO5AVhpE/MCukvOgofFK+RWPCxqTRm4Ai8dxoHBV8sYMHKk9W9ig36rgmkFsbS5YaglI
	 SorJAKFB29rYvGRNphaAwq8U5Pwz8suMuB90siiaxTndU3ENz9IZFciNP0Kl94tbqHego
	 /H4zON1814+hmMFp+VxY099RQpsQqoML2yaY2wIiQClyiwb2QLGF8RiAp5XHXQIII+3k0
	 pN0GaFDBTo7HLs0QlTRDmrxC5NiDnVZB+p4QJPTlvjUsGqrRE9Dx3zsWlvmwhBrSpZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156360;
	bh=sGI04fUT0xKzxs3nVWngtZXccUxLRyrmRO6mRHIyqTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SdVD5QWgdnHVEIas5OIahqRdlE/RRziEAnp6lyw0Uw+3qFXeC0adSV0C7i0b5nmFC
	 ok3yPfclRlkU0Xl0L3l6JADMmtrMJXY2Sj97PqivwRhdHSmllxhGUCV+of0HNuCK+u
	 NG2JoO5vTo3PJVK2AYz814PQ4B8nAiIN+ZMFn7QMCQUdOJScInoBXo/5kv9TXXynRy
	 dV4oDMz6sMnzdsfRaFbOnok1ruPcCcpoawGqwD5kSUGZrtKF+bsokSdGxYkELXb+f2
	 nPQXQQBIiE3RrjNoxCerAGUT+39X7fYbRjHx7PaqbkpF98FHZPqII38NqOzcNp2kdm
	 aY2vsu0nifDAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E3761276;
	Fri, 16 Oct 2026 13:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE19BF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A2F60F1B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89v8Pi8lYvPr for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD2DB60F28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=qTOSfMbqQFviuRCX9cqKCKeB1343w3E14tvlWc8bl4a1d0ST6Qg7eGvQpnMXGvapcisP
 o3UTM5fiQZZh2nXx9m4o8gEmKa8DvP4Ze9Z0DcFcAqUdnEdn6OjWK2iaQOPa8AQW3ruyB
 R/DQu3i6fN/A14SARNHqMmZLzkUhDnerjKVVm5XEtdBcpzh0pQfkDpuXtg2sq8yGL1kEh
 6viv4aGlhoxUGRq0Abx1PGVHT1vdAzLEu+LQ6TupbSGQwQ4ahdJ//0uCu5CfsvZspm+7h
 PkpWdUDYnhJeIioTcX4Fhb4uxyGCaRwKDbJOFzxQ6mWpNRAqLtC77x6HggJYMQYbdMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Uw/uXbMbEdGiBgmitw+eP1sn0ovog03by5UR7KWUjnM=;
 b=ANcCNJ3OAA4VsCo1TRuFZzhW2TaBFiTwkeJmJ1/YcB0tjOrH35KPC1J1dZmbwTVvAeYv
 /Avi8WavffFNkan9Sqp6pWO9e8AZ7iHgwBVt19GezAfHNQ3HBVKeBseh2kD3YZUaLIkKr
 FESFLrfG1HG+zrYamIG4y9k2urj2N90lAsFSFzXuQWLJwiy9sWdkDXygE+AZ6tWxYJLnJ
 pCBqZhpdsia96mXDVjPmBYkeAjZVTb941nXftFlhyMiX9GCraYg/0UZOLbgOxveD9Q6aq
 /H0vpbqgBeWFAHd0wKYxe1RDfPbKFeqvgcC7ed2II+RU4D3mhhfgi9rp/YhIBDc/f4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD2DB60F28
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCCA3960DA; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:34 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b7ef4f78ccaa8b524277e3728735e3af841c5203
X-Git-Newrev: 95f448c51164bef07a1743c8cbd5a1ff65d0fe92
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.BCCA3960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/docker-run: add
 NO_NETWORK variable
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
Content-Type: multipart/mixed; boundary="===============7698812842242800536=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7698812842242800536==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95f448c51164bef07a1743c8cbd5a1ff65d0fe92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

It is sometimes useful to be able to do an offline build, to make sure
the build works properly without network access, so this commit adds a
NO_NETWORK environment variable to our docker-run script, which for
example allows to do:

$ ./utils/docker-run make source
$ NO_NETWORK=1 ./utils/docker-run make

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d6f816facc4371a0bc4ae351e90584e585258864)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 27c169db72..8cb15c9c48 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -21,7 +21,7 @@ declare -a docker_opts=(
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
     --security-opt label=disable
-    --network host
+    --network "$([ "${NO_NETWORK:-0}" -eq 1 ] && echo none || echo host)"
 )
 
 declare -a mountpoints=(

--===============7698812842242800536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7698812842242800536==--
