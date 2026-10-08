Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEDECA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA90860F47;
	Sat, 10 Oct 2026 09:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZjDaLUdcpel; Sat, 10 Oct 2026 09:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57F9360ED6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624497;
	b=mhqrP7NndIRPwZSxxl/vRar0svpVZJVSwAc0sxrHddTdSBnHvOKhdZmTF1kBekVevDLO
	 ylOzbmqWGFrnkdBWeDDia1Gh3c8uYTHxc90ZYQbn4+D+yAotPRO5mLKfahxVlNmQXvgVO
	 uom2mo0SaKCCBBPov48oFgVil9/RdQpAqK6hHr4YoBCIMG7xgiqmQgpBCtH2DTtwTPVbJ
	 FKYNWCQQbLNlt3tVeZxuTEYuLOMwEpTcqrc+WXQN6T2NYAySLO8gum4rFTpL4TNO91Cd0
	 xotX4fIvG9nyltXp52uQSBnAydVAIvjIQHHJ6psiSO63CmF0QpZ2UnaPx7tZUlne/8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8TPQE44X4hh3m/Wg36LvYy8M+r6jqaJ8CNA1wxC0mdI=;
	b=lq5TvCrjd4rFd8lgr9ZT6808tLjg4vgtzIPyP2WJ4kuDXMih0tvV9AqtatJ3KuvWNXSH
	 MaCnBE95G7mMdU7lvFZWbBp3g5+AG7F7vn/XfdxaQdMfxpm9MV+ioDFJo02cvkAnB7h5l
	 G45ZFJNDcrNWUVKa8wM52n0jEoqLfSIPAtLkjJnm5oeVroXhloCAK++uIe66aHBo84KCS
	 tXSdgd1JjTM0YujJ819b6f0aPqYldJtRb7hXsbyrVd2Py9TbjjtVeugDf92jKw16U3fvl
	 zmH+lNY5AlwcHU08kBFbC2mVeCdcEsr8jDmX3iqzaNCsKFLwrfrli5kWvJ9sMxq8Bjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624497;
	bh=8TPQE44X4hh3m/Wg36LvYy8M+r6jqaJ8CNA1wxC0mdI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sG4sBN7k8G82WqkKU6V8L/pIZpL2ZQ9aokIHbWWLptCX9EKKmV0F1XGqIAlazaVo8
	 2dwSsgJKRcotx6JE9oTUw55X+WM3gpx0VhtChqODMIviR9scICkp5oIWQaQIYsQLZp
	 RhpsGQU0MHdpmqAEdyb6X4jsulb8WuGSD5QNNQ/H/PFCmHjvbN1ZkYgoOkKLV/zbZV
	 Ob8MsvrGLGQJIDYnu0FyDJAirF1sdJsEpqPixw7BJApb13kF97TqYmFe9TdmfZyJvm
	 /WZb0OiYCsh/Y0IlKKMi6ffuoCtUKrLvipeaaJs2DNDbkXoPSDUJBxnSlvL46SBG6I
	 HLbEsJsrrom8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F9360ED6;
	Sat, 10 Oct 2026 09:28:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E6449D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F1A88111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOJH7kHA-Nat for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB8DD81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=TM4R/hZeb3q9zzPv5AtCcliJISIty8qDcQm27zNeRfgL4m5tjycUEF/XtLHE78nTmk3J
 txpkKE/MFPLLA7sK4Ryr1+J6zwOD0dIQ952x/Tq6n6Eu+qAWLp1FStb5grkAUh/GdIXRR
 rVsI8YDlJy9GxRcHX/SLJjd+HlnoSISSXgBt+gNKHS/YpWRw7MKBl39GuPZVdl1e1I5Rz
 UJXOSB6TDWrY07UuKaRZHGJE15LAuAYJEqe8w9c5PrnTx8ZQ7mN+yYyR7T7pABRrYkC8I
 mWuteqbWM7UNHEtCcW+LwOn2Ru9ZeSX530TdRBVJnDMDA2wMncB3LstLWdT9La43PWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=virySaMHmdmHfZQ48LkCDs89/04WblbxjwclLWa5BR4=;
 b=F420omIO7o1S+11TXrFQM3VTpUNj3INDZJehti7x3+50oBjA0Zo0qOd1t56Jvoz6sEAI
 kRiQ5deeoI99aprceEUOm5eqlJDgP+u8TJrQuJtuOEJWsSFG3oUDtHIkOmD5Kk1lsv13V
 4ud8pEe9+FualKf75XuSpXEwJUwHawWV85EnPV0q7dseubEPGCRLB/pPCnXJ5GiyOgW52
 MTsfb3VgsdMqd0X0Lz50rXfLqZadr0VfxPxNVGJqqpSZqm58rWLD6oV2LZXVFG7HRVArV
 KwnLFmULQmp7C7LjpjgCxY0HLGMa5d7Y2z4qHpILkxzv24Jwm5QCcUE1lUkDe/ddCuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB8DD81172
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 951828F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b666aa79d1909dc58152831bd6fbc8f7d7b8b701
X-Git-Newrev: 2a90512d09369ac8cd044f51f4019dcd8cfc21ba
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.951828F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: security
 bump to version 2.4.69
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
Content-Type: multipart/mixed; boundary="===============0313112435793114592=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0313112435793114592==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a90512d09369ac8cd044f51f4019dcd8cfc21ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://downloads.apache.org/httpd/CHANGES_2.4.69

Fixes the following security issues:

  *) SECURITY: CVE-2026-93546: mod_dav_fs namespace overflow
     (cve.mitre.org)
     Integer overflow in mod_dav_fs in Apache HTTP Server through
     2.4.68 allows an authenticated WebDAV client with write access
     to crash worker processes and persistently corrupt a directory's
     property database via PROPPATCH requests declaring many XML
     namespaces.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-79768: mod_userdir information disclosure
     (cve.mitre.org)
     Path equivalence: '/./' (single dot directory) vulnerability in
     Apache HTTP Server's mod_userdir module when configured
     withÂ absolute non-wildcard UserDir directive (the 2nd form
     inÂ https://httpd.apache.org/docs/2.4/mod/mod_userdir.html#userdir
     )
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Vlatko Kosturjak, Marlink Cyber

  *) SECURITY: CVE-2026-73637: mod_auth_digest DoS attack
     (cve.mitre.org)
     Use after free in mod_auth_digest in Apache Software Foundation
     Apache HTTP Server before 2.4.69 on all platforms allows an
     unauthenticated remote client to cause authentication state
     corruption via concurrent Digest authentication requests when
     AuthDigestNcCheck is enabled or AuthDigestNonceLifetime is set
     to 0.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-73636: mod_auth_digest one-time-nonce replay
     attack (cve.mitre.org)
     Authentication bypass by capture-replay in mod_auth_digest in
     Apache Software Foundation Apache HTTP Server 2.4.x on all
     platforms allows a man-in-the-middle (MITM) attacker to replay
     captured digest authentication credentials via crafted requests
     that trigger garbage collection of the client's shared memory
     entry when AuthDigestNonceLifetime is set to 0.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Hyojae Lee

  *) SECURITY: CVE-2026-63718: mod_proxy_uwsgi Transfer-Encoding
     response smuggling (cve.mitre.org)
     Inconsistent Interpretation of HTTP Requests ('HTTP
     Request/Response Smuggling') response smuggling vulnerability in
     Apache HTTP Server via mod_proxy_uwsgi and a crafted uwsgi
     response with Transfer-Encoding.
     This issue affects Apache HTTP Server: from 2.4.30 through
     2.4.68.
     Credits: Qing Xu

  *) SECURITY: CVE-2026-63686: mod_xml2enc crash on charset
     conversion failure (cve.mitre.org)
     A NULL pointer dereference in mod_xml2enc in Apache Software
     Foundation Apache HTTP Server before 2.4.69 on all platforms
     allows an untrusted backend server to cause a denial of service
     via a proxied response with a charset whose conversion partially
     succeeds then fails.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-63292: mod_vhost_alias stack overflow
     (cve.mitre.org)
     Stack-based buffer overflow in mod_vhost_alias in Apache
     Software Foundation Apache HTTP Server through 2.4.68 on all
     platforms allows a remote client to cause a denial of service or
     potentially execute arbitrary code via an HTTP request with a
     Host header exceeding 8192 bytes when VirtualDocumentRoot uses a
     hostname format specifier and LimitRequestFieldSize is raised
     above the default.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Hyojae Lee

  *) SECURITY: CVE-2026-63045: mod_proxy_ftp PASV address handling
     (cve.mitre.org)
     Improper validation of FTP PASV reply address in mod_proxy_ftp
     in Apache Software Foundation Apache HTTP Server through 2.4.68
     on all platforms allows, in forward proxy configurations, an
     untrusted FTP server to cause the proxy to open a data
     connection to an arbitrary third-party host via a crafted PASV
     response.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: Zhen Kong

  *) SECURITY: CVE-2026-59797: mod_ssl SSLRequire allows .htaccess
     ap_expr file-function (cve.mitre.org)
     Improper Privilege Management vulnerability in Apache HTTP
     Server's mod_ssl via SSLRequire and file-related expressions.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: kimchunbok

  *) SECURITY: CVE-2026-59685: Out-of-Bounds Write in
     ap_directory_walk() Canonical-Name Rewrite on
     CASE_BLIND_FILESYSTEM (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server on
     Windows while processing paths with 8.3 names that may grow when
     expanded.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Dhiraj Mishra

  *) SECURITY: CVE-2026-58415: mod_dav_fs property database read
     access (cve.mitre.org)
     Internal state files accessible to external parties in
     mod_dav_fs in Apache Software Foundation Apache HTTP Server
     before 2.4.69 on all platforms allows a remote client to read
     WebDAV dead properties of resources it cannot author via a GET
     request for the .DAV state directory
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: ì�´ì§€ì›… (kimchunbok)

  *) SECURITY: CVE-2026-57941: mod_http2 use-after-free / wild write
     via shared session->bbtmp re-entrancy (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server's
     mod_http2Â via shared session->bbtmp re-entrancy
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-56449: mod_proxy_html: crash in dump_content
     (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server's
     mod_proxy_html with crafted HTTP response bodies.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Lucian Nitescu

  *) SECURITY: CVE-2026-56154: mod_rewrite use-after-free via
     %{LA-U:HTTP:...} (cve.mitre.org)
     Use After Free vulnerability in Apache HTTP Server's mod_rewrite
     when using lookahead (%{LA-U:HTTP:...})
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Nebula Security (@nebusecurity)

  *) SECURITY: CVE-2026-56153: mod_charset_lite: Heap overflow in
     finish_partial_char (cve.mitre.org)
     Out-of-bounds Write vulnerability in Apache HTTP Server's
     mod_charset_lite.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Bartlomiej Dmitruk at striga.ai

  *) SECURITY: CVE-2026-48005: mod_auth_digest reauthentication
     attack (cve.mitre.org)
     Missing authentication checks in mod_auth_digest in Apache
     Software Foundation Apache HTTP Server before 2.4.69 on all
     platforms allows an unauthenticated remote client to cause a
     denial of service (forced re-authentication) via forged
     Authorization headers when Digest authentication is enabled with
     AuthDigestNcCheck .
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue.
     Credits: lokerxx

  *) SECURITY: CVE-2026-47360: mod_session: Session cookie not
     removed during internal redirect (cve.mitre.org)
     Exposure of Sensitive Information to an Unauthorized Actor
     vulnerability in Apache HTTP Server's mod_session_cookie module.
     Â
     When SessionCookieRemove changes across internal redirects, the
     session cookie may still be passed to a backend server.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: lokerxx

  *) SECURITY: CVE-2026-46729: mod_heartmonitor denial of service
     (cve.mitre.org)
     NULL Pointer Dereference vulnerability in Apache HTTP Servers
     mod_heartmonitor over unicast listener.
     This issue affects Apache HTTP Server: from 2.4.0 through 2.4.68.
     Credits: Zhang San

  *) SECURITY: CVE-2026-42528: mod_dav shared lock overflow
     (cve.mitre.org)
     A memory calculation bug in mod_dav in Apache httpd 2.4.67 and
     earlier allows an attacker with permission to create WebDAV
     locks to crash server child processes.
     Users are recommended to upgrade to version 2.4.69, which fixes
     this issue
     Credits: Zhenpeng (Leo) Lin at depthfirst

  *) SECURITY: CVE-2026-42356: limited RCE for some internal
     redirects to non-CGI files in CGI directories (cve.mitre.org)
     Deployment of wrong handler vulnerability in Apache HTTP Server
     allows the target of some internal redirects from CGI programs
     to also be treated as CGI and executed. The target must already
     be in a directory enabled for CGI and have no other extension
     understood by mod_mime.
     This issue affects Apache HTTP Server: from 2.4.60 through
     2.4.68.
     Credits: Feliks Penconek

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47dfe8439945c84287bf6dbed11bce64a92d11fb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index e8ed8c0df6..453a22b965 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.68.tar.bz2.{sha256,sha512}
-sha256  68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06  httpd-2.4.68.tar.bz2
-sha512  134a5bbd3ffe97523ac750490531bcb9441c532cedf0229aa006aa1368e9d25040507c6f519bed6754044f62c371f7c7f9a11b6a311f79b9680d478bf4373eb3  httpd-2.4.68.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.69.tar.bz2.{sha256,sha512}
+sha256  c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d  httpd-2.4.69.tar.bz2
+sha512  ca9c5808eef7a0d8d88148b0d2d6045b5a0151823f09afc786b283cef9990036a9c7bc53d043e2f67b6ec06db05f655aa961cb875fa7ad0911fa04fdd295bd93  httpd-2.4.69.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index f74f557ef8..8f6d0ce549 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.68
+APACHE_VERSION = 2.4.69
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

--===============0313112435793114592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0313112435793114592==--
