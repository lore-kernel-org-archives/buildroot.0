Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F80DC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109AC60BB4;
	Fri,  4 Sep 2026 11:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wkZxv0IgcgB; Fri,  4 Sep 2026 11:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 53CD0607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788521154;
	b=O460lkpS7VF5sSkqk72q0t95ZfChCoeud9EGO4M4EuCbADl+T9wyfLjlUXDLUEeYMakH
	 tHnbkO2OoP21F5NZtAsQbfCIt0T6+cH2TnPi9wVC+ZwjXrrINvZiwT6twHzQX0WVSKFM0
	 +pojNNkHSnuhCxDxuc35PofXIr9tAb5fQ9pTvKI2M9aSLvirRD971m84gmul77kFo0L0w
	 iHBWT5n7VpXYeNQBBo/H8BSivBne+Txxgm7kPx4jN1DypBKp/wKPl7HCp8MHr82dCW0qZ
	 DtWe4zSzdGY9ivEL5HZWsUTpZkEEJcpi3gWAdZQVD5MZa3LaMdbXNVlakjVmJPhpNhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788521154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/tQUZyCi8pDI0EcC6+XUjoferoSGayVLpSlbJU6nCZo=;
	b=lrGIRwoKTLs5927JA+TKadXRngS9LRWACrhmsd3ghQXG87n/tBkPGLB1eQnnpmhPojI+
	 RP4/UUVxxenXmTc4Eul2qJ9kqDIG8zljg7u2zDlRSVtKqXnxB2Q54n529UA4MDHkGmTm5
	 RQIpu3H58rsno1ggm3CtMy1rSiJHl/uesg8Q331EXvZo52Eb5L1jOaSDsRADYIge4EyO+
	 Xtt0RxXjDuXy+OgmflU6wNOSckSEH8brUdE3XC3OZSEio/N7xcPKBrgvxkJrq4LKUvBZK
	 BkW+DjfzqbmnqtOnT5tv5jNPf8ntj5zoUrBgPzc3JZH1lKtz1iKjaILIG7SrhqL5ljA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788521154;
	bh=/tQUZyCi8pDI0EcC6+XUjoferoSGayVLpSlbJU6nCZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iacD8j5NiMBaP7yGlQqHzsv5FBHToAxjehVHOAc4vUOhiFez10jyH7OdAyU2q5ph1
	 aBo0yIh6dGfXubIlgq0A/3UGGpFjoJoC1jYaPWHpWqZFkpPMV18sj5BvBaxrIAaAuB
	 tv6544K55F1N0WL3e7rEoW6P4rih+kzkfVxE8hP2qNxTHVLdGISe2sJNlqCOFwVNcr
	 dbnhV+GNAVBiTGZqPSu+NTcfp3O3xw1DPTVNlK2Hih8wLSFzlruYfwOvufmAoBDG4m
	 ec4uMtvluErIYbdK0W7bZFMHiJelAg17I6eZ6E1gL0Hp2VG0EW9L1hhzMktMUkgc1o
	 FvD8MHk9OP/bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53CD0607FF;
	Fri,  4 Sep 2026 11:25:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D4E2FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55215607FF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3ezm5Ewh-Nc for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A77716079F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788521152;
 b=b2ox2NkPA+vEqAzQTtjXZOPJ0b1mor2JWzgsSgjiDiPA7OsdJonBJDpz5RfVh3qL5smJ
 4Tg15srTphq9s8uwDohy+lYzJ6SSOTDUfSQ635brHqqAXKTYaAUggSjx8H9lRI1SOCNA7
 DCwTQSLQhSHX4Cz1kwutoZNnMfFNCzlAiqirv4THIC2/6nrts5s9t0P5hmj9Wkgmfk0VL
 ZIy+ulaEHJPO8rhmT34tmVbwav5/5V5hyb4rLn5D8zYxA6lJTvIoJ6U8uQ2AV/CAN5AZR
 nqFn+P0Wko5tb6ifQ1cxmMR5+wLXm7hrlshqCrPmXAhgMs4DKNXLcRCZjsTgm/AGOzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788521152;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JkPlD2lsK5jSGCN8r6Pq2rvZRkWSwolHptuAsCfkpO4=;
 b=O2P58OyjBzwuA78Gz7uMHlm3d86bMMRP5Nj4rwLuT2PsEPDn2WQSI7iWPtRtPr8H2ygA
 ulBFhcfA2TH5QYPsEejDnx4t1pfwZ6T8aaENfg1TLDbJOIqqj46CxFmpOaNT56Yx3hibx
 U78LGR65E5SykTurhtsnIS1T2vEd4SugwkFseCU/sEZ4gAUyeQsflcxA2tWit0aaViyFk
 /Rw/a9UnuDGBgEHi4QmigkrhfN9+cRT5kwG0V89TMrDB9jIyopgkbNMUlQqzuirjhpnev
 Gdx5B5IBbUcEkwmG1yEU5/RKfZzRNQljIGEr6RfLjOhJeTXVllLm+pfm7vjDXrWqHHg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77716079F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FD47947C0; Fri,  4 Sep 2026 11:24:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 13:21:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b24489289fb2d93e0c80e6dd36061c75ae2d7528
X-Git-Newrev: 37c37731b16bbfe59709f3408e75c4fe124c00b4
X-Patchwork-Hint: ignore
Message-Id: <20260904112452.2FD47947C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: fix check
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37c37731b16bbfe59709f3408e75c4fe124c00b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] bumped glibc but also introduced two consecutive empty lines
which cause check-package to fail.

This commit fix this by removing an empty line.

[1] 82eff78dea package/{glibc, localedef}: security bump to v2.41-159

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 65a99b4a68..e1e8757e88 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -87,7 +87,6 @@ GLIBC_IGNORE_CVES += CVE-2026-77117
 # Fixed by glibc-2.41-158-gec116a0fbedcc860631e525e70b409cf295f27da
 GLIBC_IGNORE_CVES += CVE-2026-80489
 
-
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
