Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF5CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E3840945;
	Sat, 10 Oct 2026 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMn2TKpMwo2X; Sat, 10 Oct 2026 12:04:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3900D40852
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791633897;
	b=o7GikHJRuQt35hIA54Mahy4R1coK7tPWK0VFu5UJzZ/NNwv6jEvVhfXyc6yM3pCHL+sp
	 /Gag8SWmOjagFoIbWWyzoyP2SUHQi7dku8T+09deNZMIMEFCqwiC6EKO9ouH4c/6Fp17Q
	 o4SzgLo+FU6RJzqlUbI1dwgvX1iAHykTinl9bDx6PV63DPdyXjlmn5rFMEUFAu9JJg1fn
	 a946Fll74GqNp7U7vHm50tKg/hBiiYamwrZMoPgI5NhIT94TNDMgtLCnjVFT+/Tiy/Nzm
	 OwP6/mqKcmDPcGZ9Rr9d8BBmLOr1MFSWY2Ox04fqQxRFr4rI1TxgwQK9h5av9NYcqow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791633897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fvhC8qB94fvgjeOaHwLaeFMmueK39MCYbRBhAyLKeD0=;
	b=HGbR/6PxxRUlc5XXx4l6U+4NeAFGTRsAIUJW+J7Cdkqr7ecur9nQHPRdtKQGMMnYWhyb
	 VYVKNeg5BfHLpakmqVS2sh7rQdU6gPCmJWtis7n/sOIB8WOGy2jjfVYNtkmSLo8KfC2Gx
	 s/1+U/meRUcP0NMWGyjipmfyXpE1DYxhuOj7zRlcM00SR8gdrGLkehGQi5sa8DE73XHw1
	 aBqqBDkgKqrQsic3k5+htQN10bvlp8+qb3bBSWhXNy29KxddSCW1eJoISf1stLhfJzitm
	 3BbY3VzzZruJSUJgO6Hf8Uj/jtmBqFp2vkR8YnGprd2JB55jrcmOuP6mcETSsoVTFrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791633897;
	bh=fvhC8qB94fvgjeOaHwLaeFMmueK39MCYbRBhAyLKeD0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GjHtPf5RtvitTDbLbP6NGnPDAE39jLIeXPxi6b+JmnmjdEbHOZCQOhAoRfEqtyPj1
	 cSUyO37RL+STjvBkAOfCPuBUCqiJ0pGRbS1wZwBDtHaJRY5T+vOGvhPwLt34n9PhEB
	 Sa/OFzEU+E40eFQX1gfhJp2jr0CLhg+oi6nnlKhz3Mm9O5PuIaNRI8cY790B7VTsrU
	 QWDKdvWt/q0Gdhm7h7xemKXMOTepDOfI3fTINKsKbp/DNCZuxzKnK6hQGKjy11L9FB
	 JTSH2rXtBBf9lEL6yzGVmaKzKM5z7fAopUCyU595bbOYwQHZOlE8c3IVrv/HCH6xMj
	 RMogG1QY/OrGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3900D40852;
	Sat, 10 Oct 2026 12:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71ADA156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 572F240852
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A6SyNqwogB7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 830704084E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791633894;
 b=BblmChPCiWbwf2G37jDDpR/AXgGREH1XV1uKLAVE01pBwYkoFWz7xJHlaZD33DNdkKZs
 lRFGzQWFDGycG8bX5qZElJsZQek53bMV2p85V1fSMdIpE3lM3g8JoUUImW8zFHtSrNbRL
 DLK8Nqc8Dlh6YOKZPtnSkgkD8Q+jL3WRJA2vS2j7QVjneHpbn+YiiaT7qFMwIqA5sHJAr
 DestjmwIHPVGjNjI3ieg0THMZdSgVOYqVZYODUBT4lhYT8iOUQPPPiSUIPQf5Ln/cXEHT
 FudbDfnNfv8DzvYoaCGDJwW74y4+ndWB/IvIewPDIhDHukT9fZi2fSeWlqj8p0z1hIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791633894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xhSMZ0pASaPhWlvJhHW7ElEJc9Pj4krk0n0XeMf6O+c=;
 b=h0d2vjRbn/d9c7kumW0vAtKIgqvVOJX3ejlRM3DKe/fsCxsyd9RVxl4Q0+3tSmsd4zCh
 o7T1ikBqB5zlVYTzRyRbD5iZbMHKme+tr0gAfxrZWMrVDINi791wvBrEezBAbsbL0j8F0
 sP5L9FQklR3WqTT1QuPnUf3U0yhmkXzKG8GmGadBNhuCGw7mjri/BCGCqZhH/Powhbu23
 DSh8cI+o6+56ujs3ItI8IEsekTM1w6mHuQUk9/WvGQo8+ABhmvaM5tlNkAZOg68lA0MsG
 L6ru8Q7C2i+JoS6Ddgir5DKaB3rrQnhVHZNdrAD4wUM7gagGwpkXaofB/OLq0lblO6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830704084E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E73090C80; Sat, 10 Oct 2026 12:03:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:03:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77faecb13afa7255bb04a6260201fd535e88887c
X-Git-Newrev: 3d672865ce4bb91e1b6fe74640fd77ece2fe17e0
X-Patchwork-Hint: ignore
Message-Id: <20261010120336.5E73090C80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trousers: fix build with OpenSSL
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
Content-Type: multipart/mixed; boundary="===============0011345645818481214=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0011345645818481214==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d672865ce4bb91e1b6fe74640fd77ece2fe17e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Noé Rubinstein <noe.rubinstein@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);

--===============0011345645818481214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0011345645818481214==--
