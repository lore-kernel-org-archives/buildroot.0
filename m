Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E641EC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A965980D05;
	Mon, 28 Sep 2026 12:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNrjQLc9k_hb; Mon, 28 Sep 2026 12:32:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 188C880CF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790598764;
	b=ZBVA1FRqlycrYV6G08jkYULEmVTDK4RCqxnxx4rSpGq2ekNOsQLybZ3cgFOtRroFXjag
	 D7qLImvXiwoBHIKoapUvkgs9rkDdzD7ABes81qf2MGdflaR2qQNDepAuj53n/nUhcR6FM
	 6u4cydaFjNXSaAteKJXVAwyDEwdQdEsiXsJ8s1L+VqyJUNN7UxMtKAcucXd++gxPv2dtH
	 krRE/CSvye+93SuZ4BfM/zraUQXG7IktOqXNRuoboTVupk8FP6kZByfwSZQ7RAq2nJCNT
	 NEtzn34z3jVRiq4ZYVWYknD8eEYANIUR8/6k5jjFsJuRQEtPeFnDyqyx+S4yvtQRVdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790598764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G4VAQqjWLnZgvH19Z9ORDMHCgOJ26HwOymSkCtMbPLg=;
	b=qXOIhAOwr+QvPo0w6dWD5yhSEPV1y8fCxr0VB99dBWUtQ4R3Kwr9XKPyyEIuKth3Wyfu
	 3XT5S0GueNp6hgjbgkW8bvyMOFKvAdgYrM5SSTUgG7iOWX1yhfBcmZ/Eqxl53YiUjsi2Q
	 MJeHdgWpTzneAer0TzGWoOJKEZuDLdxV91RePDM15wOI/6BluaWcogWe6cLrNsqMVzQrG
	 kOkv05IWIcRr7Nz/ZiaEdz1/RKkg3XxlUNlmyd4nufgz16N+ai8Qp0UEs2Kw1+lA3pg7f
	 zOPJzn0WVio1tjFJNxJpVbtEhTEfubpp2sNH/Zf6ygieKFWmxiIML4jumROUBWg6k9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790598764;
	bh=G4VAQqjWLnZgvH19Z9ORDMHCgOJ26HwOymSkCtMbPLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BQCS9v8VKawHflfJGPr/97XpLcuGMwHeTl6HuXZunf5PDjxm4wRKSz3xbJZOjfMdy
	 IjiQXHZ2X7U48ayPyHcVyQheModeiCJbigdn8Q0MCCXISpSZxY7DPY+4+GjKkGlSwv
	 cHyhA9KRhZxuNQ7Z0ttdogOSQOOQ3+eZb7yX2jrtpRL5fLCvKb5GG0LdovFwW7rw2f
	 Zpi3apyfUSqV/c1WXYCfxepNQUxF27/u29KgfZXqwVfMoQo0sPmA3zvfCAyq1dDCjl
	 iiVvLCYw+mLyCkxBxcXLlQ1YqrKe/dIwNdGNA1+pzp4SV7iJsl3hl6wE6Uoa2piN+x
	 W6CDrbtfmghDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188C880CF0;
	Mon, 28 Sep 2026 12:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9363361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AABDF40540
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJwj0R_nDmyv for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E8C0D40537
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790598761;
 b=ohXzXicuCLazSj68pkL4EDOk1fzqy7t8T9kyqE6kRMgI1HPvhcQzXVxpjxD8f1536/0y
 c4fm6byAQbXYWofcB+kK02e8QcPN/Gll+LWJ1nrvGVdlIrWyCIp/zpg9pEuTD/dSios5f
 Aw7TpuTKaQ/1xgfW/WkxoHrZvu5WkHfVikSNLg/LGv2y2hYLis+4CfJSFSquBZsA8qp3S
 etZc3kv3SWvk4uQq543mYaVriemJGRQwQ7T9xdcMg/dlJoxiXaOpQCvuYYm8fijUGYd1z
 e4PnUIgqs6D68Q1Y1xIYZPNy05jZhLmzQhGklb4Z7II8Wg5QGz1FQDkMvQuNqpqdj+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790598761;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UCOf8ZWgyIlFQZrOEtnqVllix8eW0KiKrsvCy4ipVkc=;
 b=aAGlgJya3piJcmSXykwxgRcPnHAux8zHaZWntp4Ro1BGrxgB7gXPh6GnWVevLWI1o/G2
 TtiQRPz3/yIwhjMPhK69IGFGi+okUBmvzEPJFM8fPN2unEqUrblDbu7Zzi+bJzBn6hAmo
 5xpTiAfWcfH0FEwX+RUsm5DwKm54ee7MZIfUenR90gJGW+ovxpUiESxrq6qWig5/ZLQY0
 tNloxqPsd6S3QzP5rB7LzidvUdItoJSboS1rP9VV+X4v61inr5eIepaofkB10Uyi4FZnI
 Q666g6YyEuQVMOqi6blhaKK7JY46Ri5SpvTGu0J+RQsq6WqOilYfwGuvuuwmH+S7x/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C0D40537
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:32:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B679298378; Mon, 28 Sep 2026 12:31:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 14:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb6d16df92736b6681ed22bf243c10878d2061f3
X-Git-Newrev: a731846e46fde7aa5fc575e9b2e784e92f7161d0
X-Patchwork-Hint: ignore
Message-Id: <20260928123129.B679298378@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/omniorb: Fix build with OpenSSL
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a731846e46fde7aa5fc575e9b2e784e92f7161d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/omniorb/0001-openssl4.patch | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/omniorb/0001-openssl4.patch b/package/omniorb/0001-openssl4.patch
new file mode 100644
index 0000000000..984d5dab25
--- /dev/null
+++ b/package/omniorb/0001-openssl4.patch
@@ -0,0 +1,63 @@
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 1 Jun 2026 11:07:35 +0100
+Subject: OpenSSL 4.0.0 returns const pointers from X509 functions
+
+Origin: upstream, https://sourceforge.net/p/omniorb/svn/6818/
+Bug-Debian: https://bugs.debian.org/1138480
+Last-Update: 2026-06-01
+
+Downloaded from Debian:
+https://sources.debian.org/src/omniorb-dfsg/4.3.4%2Bds1-1/debian/patches/openssl-4.patch
+
+Upstream: https://sourceforge.net/p/omniorb/svn/6818/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/omniORB/orbcore/http/httpConnection.cc | 6 +++---
+ src/lib/omniORB/orbcore/ssl/sslConnection.cc   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/omniORB/orbcore/http/httpConnection.cc b/src/lib/omniORB/orbcore/http/httpConnection.cc
+index 1e70f93..9da18cd 100644
+--- a/src/lib/omniORB/orbcore/http/httpConnection.cc
++++ b/src/lib/omniORB/orbcore/http/httpConnection.cc
+@@ -2554,14 +2554,14 @@ httpConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
+diff --git a/src/lib/omniORB/orbcore/ssl/sslConnection.cc b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+index f02f3f0..d29d2b8 100644
+--- a/src/lib/omniORB/orbcore/ssl/sslConnection.cc
++++ b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+@@ -548,14 +548,14 @@ sslConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
