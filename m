Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D3FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A4040810;
	Sun, 20 Sep 2026 12:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEyJuVzi1Ktg; Sun, 20 Sep 2026 12:08:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8BAE940A95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906135;
	b=iw4Pb8PYmdfXs5ReAhMC42hhFdmRWDit65liQyi09Pb8CuoOkNOBFCTe62NLDl4O/iHQ
	 v4a4FsSfrFU44GyYaKDT1L2OuhM1G1m4Axp3SnpHvUfMNgF1s8jVtH5F+7ppqJnZq6rYz
	 4NiFT0yso0pBPZ0PgWS4VW8hoE3GuTGVnQ7WPIDLf2Y/a1V2OAYhGzuApGHUANV7mpP7V
	 f2jXFym8+90xSCtPopyGrbg77f3UkN2e41vjK73AqgjcRqqDqlZnfHdwVoNL6IQjEGjBi
	 emfP22n+iQYMDixFup7SusJccpCRjLyZ9vwST0QoqR5RPkDt6Y1m5ApppAVVe2IfnWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fIiEmyyWLdS1qtAgFlcpZg4RZRlBPy4Y7K/TTj75aWk=;
	b=lQ4R7Jsx/iiCUQ5EX8le07UX1omAA3a6zdrHhi1qrX98VzbZsUNcTQYplV1VAoRkh9oV
	 nPYHZN8JJOlE+lp5gAQ6PDBeMh1vL7cFzdkLqnc6AFaNy06Dd4fQ11776pdK48Viu2O42
	 8mRgQmrS6XgRiPOvYU0q9ulWwAeswy/9hjcugqvRtGcluz36nU6oDHkXw9b779FBTlHQw
	 TV11QiRSxCEietW3Zg8JZRiQxSGYxYpfxaPOrbTrYJruvDlENdn1wyzle/xmxMDuG0ils
	 +7JMYSNOLJwR8kfx7cu/CIaYMBzx926BSPMu+8OK5w/EjJs3pDt4R36xZGqNn98Jsuw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906135;
	bh=fIiEmyyWLdS1qtAgFlcpZg4RZRlBPy4Y7K/TTj75aWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nq5kvRl03MzHzS9337OC+wUaGMfEMSwwh4R81apQz1bY0B80LJGCxU+ejRYTmgIUC
	 uB4ht0oDY9sgjQrV26O1KRtK5Ikbf8eoYlI7wC0dTnOV7vX8I8wZtXq/StXHeMKgg8
	 fDTNEf/L1MGqLJwkEyiNKj1JJfaax3UBkzR+aPSSuBF59E1N2gRtULYBYioves9Nlq
	 Rjx4j3yy8YnKjuMqNtNTPlchZXsePwpxsO4MS4hd6JXZkWhbz0ftLZ6mQ0pb7z0ytQ
	 pR6IN732dsufBJO6t//Y7UK9wx6dQwTg7Kog6wR8h0tJhWGBiK/w/P3qVejYzTW00p
	 sIPUjW/4NGPPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAE940A95;
	Sun, 20 Sep 2026 12:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F063FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E66CE80F5D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPlYAv43kLLD for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 40AB780E37
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906132;
 b=iRaVVhxLjg5wcWDuP44cot8f+VI/Pp+H8Eow/Y8N/ozZP3TT6YHb09uH8LcTO8nwCFab
 RivMFSVi9D529PM1n/dlOrwZazAw8DsNPalGa0jsLWh7ENeg8pt77TTnzDI4xFx0Z73Xl
 aYWRhvFfUK7ekXkhOihX2CnVMZPboOSaqW10xIQFeY+uzezg6fySHAiHd45V3ibd4lGoQ
 6Ar5hblyh4U8jAojZ+VmnKW5zJ9Wpk/FbYIrUFJaoir/N6aYi+9uyYeJUnl9XcLksAUa9
 QrpGwcmp2AsH/Vwf7dmly5vl4vDIo1C5/FT+BS9pE2m24LBLZsgRljUxFvAr5wkZUEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ps8oXmFHjiEVLYV9zY5g3wjE6+T7BBfu62yi+NFvN+o=;
 b=ZEwm7ZXPzCRaY2y1mjNKUfTMF3K1Ja3S7DNgsEI56Eht+eHmrq7kFL4E1mnXRQtNVQm6
 IpYnPPn+5eUuF2I/b8n6noKqMf9mX8Jm4/QHJfqcDNdbF5oxgAkv6OI71A0N5k9VbxpoR
 WlvEkWiv/AwzqKBTauMnac7pmE23kfDUf0efY9dF/zvlpjUMoUhpu2RN6XBibMpcQTTrG
 t6mTv4XI7jA4+Gypnkl5tZ83jNckt0u5No2uNWXjOwQtt/NJmq1HwJO6zQxLimfMwT0y4
 o1+QAwX+8MdNX0rPrGBFb6K8kTa11k2ZVRPPod4ssQLZ+agtLWwa35VVOqAzUTMaSEA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40AB780E37
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E88FB8D9F0; Sun, 20 Sep 2026 12:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:08:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a224bc363f70831f5d73b560a6466a3a5a789a0
X-Git-Newrev: d1bc4bddb4e021e5912f1d8263a5e71a4941df61
X-Patchwork-Hint: ignore
Message-Id: <20260920120743.E88FB8D9F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/capnproto: fix build with OpenSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1bc4bddb4e021e5912f1d8263a5e71a4941df61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...piler-errors-when-building-against-OpenSS.patch | 38 ++++++++++++++++++++++
 ...compatibility-with-older-OpenSSL-versions.patch | 29 +++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch b/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
new file mode 100644
index 0000000000..ced6164827
--- /dev/null
+++ b/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
@@ -0,0 +1,38 @@
+From 33960e1a762667f890701775e184cbd06ee1bb66 Mon Sep 17 00:00:00 2001
+From: tony mancill <tmancill@debian.org>
+Date: Wed, 27 May 2026 06:13:20 -0700
+Subject: [PATCH] Address compiler errors when building against OpenSSL 4.0
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1137594
+
+Upstream: https://github.com/capnproto/capnproto/commit/33960e1a762667f890701775e184cbd06ee1bb66
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c++/src/kj/compat/tls.c++ | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/c++/src/kj/compat/tls.c++ b/c++/src/kj/compat/tls.c++
+index 6affeb1f..87e308aa 100644
+--- a/c++/src/kj/compat/tls.c++
++++ b/c++/src/kj/compat/tls.c++
+@@ -1125,13 +1125,13 @@ kj::String TlsPeerIdentity::getCommonName() {
+     KJ_FAIL_REQUIRE("client did not provide a certificate") { return nullptr; }
+   }
+ 
+-  X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
++  const X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
+ 
+   int index = X509_NAME_get_index_by_NID(subj, NID_commonName, -1);
+   KJ_ASSERT(index != -1, "certificate has no common name?");
+-  X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
++  const X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
+   KJ_ASSERT(entry != nullptr);
+-  ASN1_STRING* data = X509_NAME_ENTRY_get_data(entry);
++  const ASN1_STRING* data = X509_NAME_ENTRY_get_data(entry);
+   KJ_ASSERT(data != nullptr);
+ 
+   unsigned char* out = nullptr;
+-- 
+2.47.3
+
diff --git a/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch b/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch
new file mode 100644
index 0000000000..2f9cdab245
--- /dev/null
+++ b/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch
@@ -0,0 +1,29 @@
+From 84dbf3c307dd98b5b7461d314a3b7e42318e374b Mon Sep 17 00:00:00 2001
+From: tony mancill <tmancill@debian.org>
+Date: Thu, 28 May 2026 21:32:58 -0700
+Subject: [PATCH] Maintain compatibility with older OpenSSL versions
+
+Upstream: https://github.com/capnproto/capnproto/commit/84dbf3c307dd98b5b7461d314a3b7e42318e374b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c++/src/kj/compat/tls.c++ | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/c++/src/kj/compat/tls.c++ b/c++/src/kj/compat/tls.c++
+index 87e308aa..f7026d98 100644
+--- a/c++/src/kj/compat/tls.c++
++++ b/c++/src/kj/compat/tls.c++
+@@ -1127,7 +1127,8 @@ kj::String TlsPeerIdentity::getCommonName() {
+ 
+   const X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
+ 
+-  int index = X509_NAME_get_index_by_NID(subj, NID_commonName, -1);
++  // Cast away const for compatibility with older OpenSSL versions
++  int index = X509_NAME_get_index_by_NID(const_cast<X509_NAME*>(subj), NID_commonName, -1);
+   KJ_ASSERT(index != -1, "certificate has no common name?");
+   const X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
+   KJ_ASSERT(entry != nullptr);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
