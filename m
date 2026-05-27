Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED31CD6E41
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C3841FA2;
	Wed, 27 May 2026 08:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwQPKnxtfchX; Wed, 27 May 2026 08:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 255D541F99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870265;
	bh=snJneqpL3msVZ5v/ewW2pWcmVprOZV6X9uhuXVifU2Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WGAneWOFaZ1CVNltzlQ+O9yFpFtUtVp4tbknMNgjWRza6pyLUgdx+2gJC/Urqqalo
	 +2NWQY766kgmeucFXDmI5cgtBQQPVmkODBEkCJbiwOt/o9FdD0wQKlakA518VLXCIp
	 MD710q7oPlmH85n8RoFyvzV2pjvUq1IIQjXq3Xq/uz4oHUcnm9YUzvXtMAWwXNOYEM
	 prtFtmDbJx1LWCu2ckndPSk9xnvT/BOU+krEwzSGWJrI37p+zIlrgmmSFb6SpSZHED
	 vqeuH+Dc75254pA0WVOBTZ/St5Zv/Cpho3akRqRZ/lV1H7fjfqw3o6y32izvEXQeSj
	 2afaGwO9hk6Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 255D541F99;
	Wed, 27 May 2026 08:24:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 069A5297
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA6C661360
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um8q0NIl7Dr3 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE0476135A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0476135A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE0476135A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so18276885e9.3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870261; x=1780475061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J9PgPoAflnStF2v2oSjdVDw8yhCRGU95lvHBCD6v3WY=;
 b=jP2Wxtb7Qqlyr0EGbLML+35OWPR9pbX7dB7gd9SllJbADZYB4fOjePtuXIEcfQKx84
 ex3VCJJWmjgTi6ONq5RLLxzE+s2R2nlLaMkxvy9V+cmKpAc+6cukGr9u0porY2i1V+uA
 6J4vLsrlqj83nKZsehqmeqrlNoZ0s2XGmUGNlgroOAcQgeDhAU22+Li6Pix2u9H0eaQg
 aaQtvVUXdYu1r3IIapfXU4C6ySwHo0+oEe7r+JgYMg8CNRiWxMSQ1eDvv24Gq+JLJQga
 8xtX2HhyyVZbpeFCdMT/6jPXpTDL3CkpRykr5N2cVoEbpNGE5lrkscYHvsJx2erVVcS0
 8AyQ==
X-Gm-Message-State: AOJu0YxH0u3DYJbrcw+UHcROe2CYgvkNeZ4YZ+vO3BmN1OE9t0N47Jtu
 GumXWkLVEdA7srz9+UbfWOxWehEFRKN3SdecYj8oEMm3LM+Z5oJ0ZY4Hu5Q67Qk1aDkATdY+Q2q
 Fa+Hn
X-Gm-Gg: Acq92OG6a5OYSip4/pgUEMw4POOp6e3jzuiVZemth8rUKjdoHzMRrG3khKKy3sSxFli
 AL1SEjXYoBz1ROkza0jy0QOpr1Uni2PYZqjERj71kXlgNd/ZspsxwUbkumKyiLIP7D0K3+MYh1e
 4HA/u4hPLqV8C0lx6YZo5JjY8pZg+UJBoVccGcMwshHwwD05wK56ShJvXl4zAjN4YOF1JpUvPX2
 jIMouCqBmed8NYC4lvp1m5GjAzOyxAeOO8rdE8uYq64c0lyy6OqlCV5Ukexu4yei3jq+yLS18ck
 R0SKHn+2CQSpEaOaRTJuhECgyCciMVu1KEEuTx6dyonygRigmOV0ZfxdZKlGBTUswJJxHaXJk3r
 PPMApNeh+9Tff/4Mc/JuY/NO0V4SBKr/TxFZVCYRLo9KXiE4Ej5mYAOxRJt269d75BwlwTVKoai
 I1HrwnV6sCbBWucrkXHFrx2eE/AwUQIgFI4qgYysTQfo9frfU=
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-490424b3927mr406389215e9.9.1779870260835; 
 Wed, 27 May 2026 01:24:20 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:13 +0200
Message-ID: <20260527082418.151980-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870261; x=1780475061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9PgPoAflnStF2v2oSjdVDw8yhCRGU95lvHBCD6v3WY=;
 b=VqgyU03ZPehuqGf9vGs7tJeXWcXIf3CGL4yFMPvYgYUT+Vgaq1sV69GL5Fi2fnK3g9
 +ROZz6JvJj6XoS7UyFiKW1tDpzLzbOx6whOl+1GcWe23qaaX8hP0k6JKzaExoPHA0ygW
 4jrXHPy6+hUmemxJLMri7MsrkHctincC9KTEbnLxvYE5PweLtHdKpNSG2LMnVrhlv9Xm
 xVVmW+NB8H44DISal7bXP5fwdpyRBggiowlX6cbNsczqQMQk4OOevD4SqLF6pIMpxUlX
 2puT4/N9bDyt2vbLMvULmYIUB44llWF+f1B/LRu9fbi+TtcHgpLyVccMfWYbIqe7z1Ni
 5nNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VqgyU03Z
Subject: [Buildroot] [PATCH 2025.02.x 4/9] package/go: security bump to
 version 1.25.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard <peter@korsgaard.com>

Fixes the following vulnerabilities:

- CVE-2025-61728: archive/zip: denial of service when parsing arbitrary ZIP
  archives

  archive/zip used a super-linear file name indexing algorithm that is
  invoked the first time a file in an archive is opened.  This can lead to a
  denial of service when consuming a maliciously constructed ZIP archive.

- CVE-2025-61726: net/http: memory exhaustion in Request.ParseForm

  When parsing a URL-encoded form net/http may allocate an unexpected amount
  of memory when provided a large number of key-value pairs.  This can
  result in a denial of service due to memory exhaustion.

- CVE-2025-68121: crypto/tls: Config.Clone copies automatically generated
  session ticket keys, session resumption does not account for the
  expiration of full certificate chain

  The Config.Clone methods allows cloning a Config which has already been
  passed to a TLS function, allowing it to be mutated and reused.

  If Config.SessionTicketKey has not been set, and
  Config.SetSessionTicketKeys has not been called, crypto/tls will generate
  random session ticket keys and automatically rotate them.  Config.Clone
  would copy these automatically generated keys into the returned Config,
  meaning that the two Configs would share session ticket keys, allowing
  sessions created using one Config could be used to resume sessions with
  the other Config.  This can allow clients to resume sessions even though
  the Config may be configured such that they should not be able to do so.

- CVE-2025-61731: cmd/go: unexpected code execution when invoking toolchain

  The Go toolchain supports multiple VCS which are used retrieving modules
  and embedding build information into binaries.

  On systems with Mercurial installed (hg) downloading modules (e.g.  via go
  get or go mod download) from non-standard sources (e.g.  custom domains)
  can cause unexpected code execution due to how external VCS commands are
  constructed.

  On systems with Git installed, downloading and building modules with
  malicious version strings could allow an attacker to write to arbitrary
  files on the system the user has access to.  This can only be triggered by
  explicitly providing the malicious version strings to the toolchain, and
  does not affect usage of @latest or bare module paths.

  The toolchain now uses safer VCS options to prevent misinterpretation of
  untrusted inputs.  In addition, the toolchain now disallows module version
  strings prefixed with a "-" or "/" character.

- CVE-2025-61730: crypto/tls: handshake messages may be processed at the
  incorrect encryption level

  During the TLS 1.3 handshake if multiple messages are sent in records that
  span encryption level boundaries (for instance the Client Hello and
  Encrypted Extensions messages), the subsequent messages may be processed
  before the encryption level changes.  This can cause some minor
  information disclosure if a network-local attacker can inject messages
  during the handshake.

For details, see the announcement:
https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22137df16bb03900f2801a7b4c2f2cf6c8574760)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 7c689f9144..6134ec5f75 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
-sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
-sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
-sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
-sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
-sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
-sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
+sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
+sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
+sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
+sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
+sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
+sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
+sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c932baf018..91e5fbf347 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.5
+GO_VERSION = 1.25.6
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
