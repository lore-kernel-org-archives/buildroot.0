Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ACCC5DF7A
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA21607B2;
	Mon, 17 Aug 2026 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPEb_9YnYOJ6; Mon, 17 Aug 2026 15:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F026060791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786981009;
	bh=mL93Z6MsHDywUL4Lh6fH+/J9jw7ldewgE75sXvBXGPM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eO5ag5KlSokJlXeXgiqKR6MwjRK0+1hBfq2LBI30kj8ze7da8QGyIGVV8H3lyQG6M
	 sB/v7FO1yY1VrX4H3D3lI2RGcTaP5Yun3/i6nUx1SuOEMEZIHIOVSoFzxDJODl7x07
	 W9JoI2crsK4i0XRDB7NcY3CPF3lh8V0BdASSTmVWGxFNGQ/SzTZdk+ppY0u4laICx5
	 vTUJhKqYlBim+VmmPGaPtu0xWaSh/Dfhjx3EiasesbjS8qznYPMzHRNNy2rTlWo/Du
	 4+v36bFinMQhe4yF/UTaqwqDJi1LpIN3/wJGiBH8tX9wjbemvh6aVfpFcGX1Jk+MUW
	 JyT1V5/90F/ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F026060791;
	Mon, 17 Aug 2026 15:36:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4F26337
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A681580EBE
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNU6EJs4lJgV for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 15:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88B1480ECB
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B1480ECB
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KViw+rlS
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88B1480ECB
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:36:46 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=KViw+rlSaHH7CH7lL1xBfTV2f9EYQSntSTZ1UCuqk4PPAhbzU/inW+zsJntxXaOaS4hAiB02MSXDkXTDc7qFbSFhhzN4fFhOkvgOsa2g8Tep/1QP6DwBYj6tekM8gaFkFpM+4pTcwnJKOgl1XCLX3chooaRedLLG4fUytGD9w/otPFvzPvE6GSTVaQx81iTJk1qQKHvwRjCICX9b2R3aDx3gP7Svg6Ma+YVMbx/hoz4qHu4SWbpbWwD0RDc7efoT+QZic64VCQ1fMl90Gg92Y/HR7l0cXXBNglhn1NnNi/Wate73MU9D9xZTAAGS8RM90PEnuH5SatotiCjr6pcoKQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Q6etDS2ZJaHn5qlgI1wLNC1dydDis9ANolLX0rSr2j4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -622138219; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Aug 2026 15:36:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wvzOE-000000035gA-2c9d;
 Mon, 17 Aug 2026 17:36:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 17:36:39 +0200
Message-ID: <20260817153641.736799-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.26.6
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

 - x/mod/sumdb/tlog: fix transparency log tile verification bypass

   A malicious GOPROXY was previously capable of forging up to two sumdb
   tiles that allow for a requested module to bypass the GOSUMDB check and
   persist attacker-controlled module content to a local Go module cache.

   This attack allows for a malicious GOPROXY to serve malicious module
   content that cannot be detected by evaluating the transparency log.

   All tiles are now correctly verified against their parents.

   In order to determine if you have been affected:

   rm -r go.sum go.work.sum vendor/ && go mod tidy

   Thanks to Filippo Valsorda (Geomys) for reporting this issue.

   This is CVE-2026-56865 and Go issue https://go.dev/issue/80744.

 - x/mod/sumdb: ignore unrelated, unauthenticated hashes in Lookup

   A malicious GOSUMDB was capable of serving arbitrary module content not
   contained within the transparency log.

   This attack allows for a coordinating GOPROXY and GOSUMDB to serve a
   client malicious module content that cannot be detected by evaluating
   the transparency log.

   In order to determine if you have been affected:

   rm -r go.sum go.work.sum vendor/ && go mod tidy

   Thanks to mundur for reporting this issue.

   This is CVE-2026-56864 and Go issue https://go.dev/issue/80745.

 - encoding/xml: add recursion depth guard during decode

   Previously, DecodeElement would reset the depth counter causing it to
   never fire; this could lead to stack exhaustion.

   This is CVE-2026-56859 and Go issue https://go.dev/issue/80481.

 - net/http: apply ReadHeaderTimeout when doing unencrypted HTTP/2 check

   When a server is configured to support unencrypted HTTP/2, it reads a few
   bytes from each new connection to see if they contain the HTTP/2 client
   preface.  Previously, this was being done with no timeout applied.
   ReadHeaderTimeout is now applied for this.

   This is CVE-2026-56853 and Go issue https://go.dev/issue/80205.

 - net/url: avoid quadratic complexity in resolvePath

   Previously, resolving relative paths containing parent directory (..)
   segments performed string conversions and buffer rewrites on each step,
   resulting in quadratic time complexity and high memory allocation
   overhead.

   Now, path resolution operates on a byte buffer using index-based
   backtracking for ..  segments, eliminating the quadratic time complexity
   and significantly reducing memory allocations.

   This is CVE-2026-56860 and Go issue https://go.dev/issue/80494.

 - golang.org/x/net/dns/dnsmessage: panic when parsing invalid SVCB record

   Parsing an invalid SVCB or HTTPS RR can panic when the size of a
   parameter value overflows the message buffer.

   Thanks to Mundur (https://github.com/M0nd0R) for reporting this issue.

   This is CVE-2026-46600 and Go issue https://go.dev/issue/79795.

 - crypto/tls: limit handshake messages we are willing to accept post-handshake

   Previously, we always counted handshake messages, such as KeyUpdate, as
   state-advancing, regardless of whether a handshake has been completed or
   not.  As a result, a malicious client can keep sending KeyUpdate messages
   to force the server to keep performing key derivation operations
   indefinitely.

   Thanks to Qi Deng of Aurascape.ai for reporting this issue.

   This is CVE-2026-56862 and Go issue https://go.dev/issue/80528.

 - html/template: fix Javascript regexp context tracking

   Previously, pathological inputs could close an unescaped / early,
   allowing for attack-controlled data to inject arbitrary content,
   potentially leading to XSS.

   Thanks to Ali Sherif for reporting this issue.

   This is CVE-2026-56858 and Go issue https://go.dev/issue/80435.

 - x/net/idna: failure to reject ASCII-only Punycode-encoded labels

   The ToASCII and ToUnicode functions incorrectly accepted Punycode-encoded
   labels that decode to an ASCII-only label.  For example,
   ToUnicode("xn--example-.com") incorrectly returned the name "example.com"
   rather than an error.

   The idna package implements the processing algorithm from UTS 46.  Older
   versions of UTS 46 included a specification bug which permitted multiple
   ASCII labels to decode to the same Unicode label.  UTS 46 revision 33
   fixed the specification bug.  The idna package now implements the updated
   specification.

   This behavior can lead to privilege escalation in programs using the idna
   package.  For example, a program which performs privilege checks on the
   ASCII hostname may reject "example.com" but permit "xn--example-.com".
   If that program subsequently converts the ASCII hostname to Unicode, it
   will inadvertently permits access to the Unicode name "example.com".

   Thanks to KC1zs4 (https://github.com/KC1zs4) for reporting this issue.

   This is CVE-2026-39821 and Go issue https://go.dev/issue/78760.

 - encoding/asn1: enforce maximum recursion depth

   Enforce a recursion limit in Unmarshal to prevent stack exhaustion when
   parsing deeply-nested, recursive structures.

   Thanks to Marwan Atia (marwansamir688@gmail.com) for reporting this issue.

   This is CVE-2026-33818 and Go issue https://go.dev/issue/80405.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6c9c20be69..1c43cabf7b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
-sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
-sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
-sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
-sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
-sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
-sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
+sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1  go1.26.6.src.tar.gz
+sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4  go1.26.6.linux-386.tar.gz
+sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89  go1.26.6.linux-amd64.tar.gz
+sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e  go1.26.6.linux-arm64.tar.gz
+sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea  go1.26.6.linux-armv6l.tar.gz
+sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388  go1.26.6.linux-ppc64le.tar.gz
+sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde  go1.26.6.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a64d7538f8..326027a49c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.5
+GO_VERSION = 1.26.6
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
