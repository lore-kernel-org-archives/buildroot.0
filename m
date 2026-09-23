Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B41C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7182340FAC;
	Thu, 24 Sep 2026 18:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORnjjzdw-trU; Thu, 24 Sep 2026 18:58:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 541B440F97
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276311;
	b=VCpxl/X8nUb1vC3Z3LlaWDEXkwC24ZCXT24s9KaM6FcEpxAHbGvnGJiQkm1j9ZCj2ZTd
	 yMuP+/09wKiXI1wM9liVHpOV3MaH1fUgnJWPIg4dA4+Yp+Vo4VIhMvyI+HTmThDccz/qv
	 so/QqPFLkJdG+hG1Gz7gOLK8YrISC/QQjWLqSdm2MHYUOG3SGjGWKyr1tjB5VfP2xiuDv
	 z60hWpEuKoPhAPbUG3MGre8Qmq0kPOo1n0QRdchRsDjHnWjhY5UaRq2KagnUkjauKhlxN
	 cwiiaF6PqRGZ3TM8xrFC97qujajJpyaY4jr/5VdfONAazilWZZ3bpErQ1jxS7kx06TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IdJ6rXA2DCUGiSxE406h5SlKC1jzqHZyzDQ2ZCVrrkY=;
	b=qGSYjGMdkULiwGk5zA81uNB5GmVQnsCsThYWQTGJ7EwDccjiwQn3+86DWB2rF2iVp5ow
	 DDDscdVyDKuec+PwgsuTPnducJjiqr4cqgsR6i1iCNHmaSalH6qbufUcnpEzbrSTPkH+3
	 hYqUFygHBKlkXJUVNIfM402O+NLUNyfNgPX0ghUbBlhl7rZRn0P8o8SajMY/VK5zL+Gvp
	 VmIl9hWMwwe7GzY8TkztYyC237q6Xj6A0rlTKnJ8A4Fjozq4pD2GmKrmRw5/GAil1hg6B
	 YRNEz9/F3SA4Nf4I+j1ojlO3RsAeioDQGJwKvwxvy7jkzSp+jzS7NoE9w4k4NHprynQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276311;
	bh=IdJ6rXA2DCUGiSxE406h5SlKC1jzqHZyzDQ2ZCVrrkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PcI/eEV0uV4+kIWs7aU9hTnhKMMF/Bu09kbCc67Mmb22us4DsqZJ4rdUbqXr5SFPh
	 u/s+4QRO553zs3jaPTuyYJQ5guyUV15W3zAZ5Pp5jtW+dHE3uZQOwkdvkvs/RerZro
	 muktZp7/0uZnmX649rlzcN/DLFQ9cqi47YbrEw7UIa45rNXe6CYhaNhAPZOxxYcYg1
	 DNl/Eb3p1hnr0CdwjCS0OikEO4MjyrXgWm+yGdM2Bm7jPkrj1KeXN3sWuyV2Ex3q08
	 17LAEq+EFGry0Urb5Cx0Alqy4YZ9HxQtj6hTQaVvS1RNWu6YcbNMq9FOcwLe3PbObk
	 QhOmmxHybe38A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541B440F97;
	Thu, 24 Sep 2026 18:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DA68392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 547C8404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUQUmwJtVDwB for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 806FB404C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=YfSGkQGAALLhfZPSf/gq/C+7idw3QcdSKU65khzk6ubY+RJp2Tn82nc1rgFdzI9Y6RdZ
 bKsEeuutRgCN4yRgkHxb4qH8MY0hH7b6JiCZIZI+Q3nSHcAPdCu4+toa6IXVsSAlK3/27
 nUwAVP3y3rjDOOiPuPC3rKhapB6qUNTHakqO89h3iq0H0YuSEAFpR5LzSctNdiBn9Gawb
 leFYjwPlov2A9h5QdgaavHtH21UyERzgdT4pRrwk5G9vCRk4YpPkhviruemkkozaRPITt
 nJIPCaH9dHut1L0OKEHXKgbjGKlKBRfsd78ezuuacqJQLbjQ5tUgLwRsU/xlq/hEWTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QkqpWnbiVK5dRlpG9J3i96lEPDnX0ZGD6fEnizKW02c=;
 b=aSbcfa+nAsv7opN0Ct3CdUFQKOdJ4ph79d+nAl/4MwRyp8KnVdZWh+YpQq5D5KVPlg35
 mXtpmv1WXBOMN0lRHvU2u/9l0vjNsFMs46vJr2rPKPkWg9Vgw3zQR6c/YkXILDhdsUxtN
 Edw+l2wkoqojHeguQ0ZpKURk2kGu4VAmtw9kVkoDopDZTrpGKIBaORxNwnu4LNxAWCDIR
 j9EUzZL5pHyrZXDbOr3LBMYoP7gqVHbGZyhspdiAg6dFjdCj4A5USqSexW7Tv7cOsfCYa
 i6CTrJTblbjwgVmhjDJdsze4M007CYGBrnPwwRRgk6EXuGecHcE0fvpT7ou7TDNBuUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 806FB404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23EDD976B0; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d5943e5047a29f4d41324ca9d056bdb26b5d62d6
X-Git-Newrev: 4725deea9c38380925129aa4afb10422b434693f
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.23EDD976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/zabbix: security
 bump to v7.2.15
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
Content-Type: multipart/mixed; boundary="===============6345351951972162162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6345351951972162162==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4725deea9c38380925129aa4afb10422b434693f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 055a1e249c8d15dbee3a3c10dc7d0acde03e0c91)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============6345351951972162162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6345351951972162162==--
