Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C0C55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98374072C;
	Tue,  4 Aug 2026 20:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2QjkXg_1e_E; Tue,  4 Aug 2026 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E50B405E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785876053;
	bh=kESYjhXltzvijlHqKZpiSOkK/vQG9acti0sn+RWuXq8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WjWfjryjZ20rkbjsen5NCtdRs1jPFQa0+D9EtfrcuT0cnLITyYNJhh88RMLFHAGyS
	 oHYggxwWLxRG76gdcJPZ4ninKVPunkJiafrPfkXL6Sqocxv7wBzMVbo/FEv8Kc3gt3
	 M+wfQ0J5EhHU9qxuSD5/pDakCLBjKr5oKfVkvcA7Wb54T0/ehFGGhV41/bcjHy54JX
	 S0/NAtzUy8SmWTigGQpzNeHBQ1mFyWOfExCIGZgm3+CcFeJ59K6Av99diwc6yCIX9G
	 7qSbztrXOcFF6IzEuhOYPOkTnrlPcYZw41f79zGyBDHoVBub44ed6ShV2uCHkARQ1S
	 ZYFwluPxcbmsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E50B405E1;
	Tue,  4 Aug 2026 20:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A255270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4007980BB6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sldi3Kql5MHX for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1C2080B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C2080B9C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1C2080B9C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:40:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1x1tY42f9e-00rNeC; Tue, 04
 Aug 2026 22:40:46 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Tue,  4 Aug 2026 22:40:28 +0200
Message-ID: <20260804204029.2558491-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KCYTIVCG3IwmcDUIlMn5WF2T1XhoyNHN8MCKHpm0HIpGSW/vx8U
 /B+rv7K+E15YiZIFk+i+vlrLQnNSJwTpPcm3R40IfhgQURNfOYpIv30aPu8neV9qals5jEK
 mhM4lLhbPvaWEwx4DftfczMIATIkF8Iy8CKmSpIpxGDwZHAxAbvsGescewBP3Ep5JwEE+cS
 D1MWXGrVd/d/1MOtCz5FQ==
UI-OutboundReport: notjunk:1;M01:P0:j9Q9AvC6FMo=;tx3UaM5wZAN61BzZFrZuuu0en3V
 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
 3mf3oPKfo6UEBS3b81DBoWrNeCCb7bG9mt/iE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785876046; x=1786480846; i=fiona.klute@gmx.de;
 bh=wifpOygUsGSb4r57WIJ9348Z/8/3cSbZEWWWHxdqDp4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XOJqX5KmjTbNoRxZ4mCrxgkmXMHuEpUo/vWmji0rW2G/ZI4Hphdbpf53RKL6lmf4
 TwE+G7859ez/jrAl7F4TpECp5hTgHNKmB7V14nMXn/9IYyMZ94q5LrfVMO5rlNR3t
 YUkhml2zRlVqdfXZhr6u0njPFOqSJeW64L6Xu8055sBU6ehjmly/tLGGxzhC6jYRp
 WVEJrC7s8grkJmY1mDG3bRMDD/XC2ijzv5ntVc45Su32bYK6Zf1KHKXAjoXKzG3GE
 o56ceff/TlIVyEHmmybhkBlMQJu0+qg4WihQJ+F9cATVs2ckjFrNopsH6zrFCL+S4
 la4+C12KARLbwe6HnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=XOJqX5Km
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to version
 2.88.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There have been a number of security fixes of mixed severity in
libglib2 since 2.86.0, sorted by release:

2.87.1
* CVE-2025-13601: Incorrect calculation of buffer size in
  g_escape_uri_string()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3827
* CVE-2025-14087: Buffer underflow on Glib through glib/gvariant via
  bytestring_parse() or string_parse() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3834
* CVE-2025-14512: GIO: Integer overflow in file attribute escaping
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3845

2.87.3
* CVE-2026-1484: Integer Overflow -> Buffer Underflow on Glib through
  glib/gbase64.c via g_base64_encode_close() leads to OOB Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3870
* CVE-2026-1485: Buffer underflow on Glib through
  gio/gcontenttype-fdo.c via parse_header() lead to OOB Read/Write
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3871
* CVE-2026-1489: Integer Overflow on Glib through glib/guniprop.c via
  output_marks() lead to OOB Write in glib/gutf8.c:g_unichar_to_utf8()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3872

2.88.1
* CVE-2026-58010: Buffer Over-read on GLib through
  glib/gvariant-serialiser.c:1253 via gvs_tuple_is_normal()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3915
* CVE-2026-58011: OOB Read on GLib through
  glib/gdatetime.c:g_date_time_get_ymd via invalid `GDateTime`
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3917
* CVE-2026-58012: Buffer Over-read on GLib's g_regex_replace() through
  glib/gregex.c:string_append() via g_utf8_next_char()
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3918
* CVE-2026-58013: Buffer Over-read on GLib through glib/giochannel.c
  via "g_io_channel_read_line_backend"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3925
* CVE-2026-58014: Off-by-one Error on GLib through glib/gkeyfile.c via
  "g_key_file_get_locale_string_list"
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3930
* CVE-2026-58015: Path Traversal on GLib DBus through
  glib/gio/gdbusauthmechanismsha1.c via keyring_lookup_entry,
  mechanism_client_data_receive (COOKIE_SHA1 Client Authentication)
  leads to Arbitrary File Read (sort of)
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3931

2.88.3
* CVE-2026-15588: GDBusServer pre-authentication DoS via unbounded
  SASL line buffering
  https://gitlab.gnome.org/GNOME/glib/-/work_items/3985

Full upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libglib2/libglib2.hash | 2 +-
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 09cd8e9979..c06fce8742 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
 # https://download.gnome.org/sources/glib/2.86/glib-2.86.5.sha256sum
-sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
+sha256  ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b  glib-2.88.3.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ae4b653a15..bfe4920291 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION_MAJOR = 2.88
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
