Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A378CC79FB9
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5268F40651;
	Wed,  9 Sep 2026 12:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzRKij4Ujt97; Wed,  9 Sep 2026 12:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FAE14057C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957584;
	b=A2o2tDiFYh/MQh+X62j9jS69KErnctZHHLqedN5dNA+cP5KuZDyYZDMdYXyDOACBWPbT
	 +b/a87aUZVSJI6cjwbNDJKxi7ucHbWKyZ7yTyry9OvFvgsTRzB4YBKARjZ5l9eVskHgh6
	 DX1TNHbCF1ebyrGySGjiPY4iS/m8NmO5Bwi/nLL6/9GvvERW/e94joS06VzFf9FafhaUi
	 9AzAl7NIF4aHt8zI0xGKj0YSJDJEnBRYUO0Z9lsjIqeSnPBuAVKb2J7ZFhtcAU2x8uoAY
	 hoePVzHxowfuZRk6g5vA+bm/eSr/p4lIlMEAYQdGcBO0Y9xvtZS7zyoD7Fedg0Hxkng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lGoN4N5FCo82DbjC/Y1dRIGAHcBD9m+61iy7oulYnuw=;
	b=Lsa0BeRy0xhUwBEX8JzpOLwnu4zF4r5i3Ok0tdiPGFLN3pIYjvj+Ta4V/ARuX1cGYJKT
	 X9i+3KzktNUxw80Gx3Rszh9tHvtCb0UKZVJx07ueLIshygAAiL6uMnmAOznQBFZSrOwzs
	 IW0LL2khczY64CINbjggj7+tohXUeSp9EJFVyx+zpUPUAsYRqrXESZWjdihmQI/LDCN4T
	 g1cqfUKVJI7bwK8ZzOoP0e9/Dy75MJ1JOarbWvRXnbD2JnuBXBo17tgYjnMInr/93WuJ1
	 z/mWPHpaJ2+/76OYmFCQ6ZWT0GJ9/0waU+tGbqK4Tnn1AQM2UctWImVY9yJw8NHL3Uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=none header.from=thewebers.ws;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuxfQsis;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957584;
	bh=lGoN4N5FCo82DbjC/Y1dRIGAHcBD9m+61iy7oulYnuw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apqe4v2/phFcL4H2//r9GcH49AEoTC4TRK5uqB6ZA+tlVwM+g4JQNSm+WqgGeEXZp
	 p+yFZNRdxPOLNXv+QtfB2JZ5Q6t2jRQn/ouDX1p5NAF3dZjpEN79/ErAqFTLJRkTRX
	 CttyLLP37zu5nW9MwaxA4QJHJt7arfjlXCJra0B6uXLyl54T7qdPLoA11eeIC2KJbx
	 pAIIlo77IQ1Drq0bEwED0wR2T3lZgG6/cy+f4x67ZolETHm3zE0OzY8/QV0XBBnrFG
	 UeEDyCCpSTtHC3k7DugxTcGV3YfTokmHYUAm3fz66EivPbWofK8X9d3Ab+KlZRUOiQ
	 cV3J12J81HD1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FAE14057C;
	Wed,  9 Sep 2026 12:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C31DB4CC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9977404DC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3VprO5yf_oe for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A415940595
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957582;
 b=L84ajYWiZrqbYaWi7DIgfK2fz3fZ5hWk7Rxki+1dIHlH47fbFHWjLfgcOvJjPc0oxw/J
 yA2Hm4LWit0yaM+/q005YpfyIjtyc2+d/8+FR+FiMeTZTryGcG0/nXKOCBKNVNS0aNInM
 C2E6z13VmGJvL5mbbvo+ecYlpcAhsVWJKI2yYD2VIQoDZg8G6Y1mENAwTIStqGBxaLvkx
 djMNfK/gwN8+0f8rrmI2S9i+W3M6eA/oUUnBSbOLPU6l+JJQnG0pm3/XrW89pgQOM4A/L
 fq7q+RSXqGUceTfS2+2mXKBaFLeIunslSeUPqlpqdC7zT2tXbmpUKMoF9E5mPaZv2jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957582;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yaZ5DKWBbiIrekA3ZLn3zHrkXq2I7M3FxXU3TZndDKs=;
 b=O+ZcBkQrX6vFL5SEq9WeKrJxPaDAUGugoXbDUt2LAUz9HA1xbuK7/foELBl16whD5ght
 PRB9W0ex+26NOlE4tZ7pSLhnU5L+CIQutF8/AiDEWtJeaIueszLyI4LWT+Try2sqzHBIj
 ZuXUnJZDtM61SbKC258bIGRAkQ2ABnKi4FwUP5SPSMFCfrmXNF0NXeJMEMX67C05nf+sZ
 C6WY7IlvM6T/CsrSgKfLh+ZqiJfIGiZ5z2vv/k5QZugB0e+E4XRdmEbBv2yFXJ1zgkzLc
 N2725wWOX3WxYdOzkwZqPmWYIX8GXNsipDgEg1Hrw7CGS3X69Chb7tBkonDooDhDKwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fuxfQsis; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fuxfQsis
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A415940595
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:42 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-4be497b8367so1170367b6e.2
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788957581; x=1789562381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yaZ5DKWBbiIrekA3ZLn3zHrkXq2I7M3FxXU3TZndDKs=;
 b=fuxfQsisWEsAKTlSu2sTIkyMVrnpjd7WaZxiJ8DsFr9RqzspMYHw6gmV2079h8MFBh
 Uw4aphFKg/sfkVVpOLWpkUtb+ftFwpW4hJjLvbDNcuoJt5vhpCJ+8xBo9j0gp+XL2hMe
 4FDPD6kx6ei2J+0ZHgS1nZuwi7VQH7xCygC0oJjALtpzq27MhIYbAC6wxK8Ez0JdUx0V
 0657s2oBqsRF9sk5lYXURjQ1TGig2dcpLRFZYBQqM1pgwoDBZuThQ9k5GNgyut6Zc/nR
 hj9pqpPgXudYvZPx8fCBOSHOaqjhN1HjJKUFM6K9bJIOGVFrk3sS1TTDYNuq9tS8MHoo
 fn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957581; x=1789562381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yaZ5DKWBbiIrekA3ZLn3zHrkXq2I7M3FxXU3TZndDKs=;
 b=YWJmj6sdLA4e+WEamhYgmcmWl7LxLB8SADGdbOFMlPNRWxZK3vxM4deDNh+1TrYKH7
 Rjkad77MeGowZQgCcedh8R4eCSXEW4MY3F0vFHPjiXRAkhJEw4r5S5neuhZ4GYfB0SYS
 Hjp1RaHkg2orX1K67D/GP2yejiLJD1WIx+35wVgCM+YB5gkRA/K7gzNE9/BMc7xvxrHi
 5Gq65P1HMWc48t/VDYB6h/rpdXPDh04hE0L4nsl3eUXS3U3Gq+2zftAXC42zOuAOMXpK
 io1zJC5+KtZwTWS4jkL+HGWn22tQtoGto0m3hllB/arLkdCXMBrli3O7hqcEQrTYMlb3
 QqyA==
X-Gm-Message-State: AFuF++lO5fTSl7nLj1eEXH1U32w5H9fXhey5w6xNfRx5vabTCj1WnmR/
 NFnc2J7y1fRgk8e6CiHG6AG2qbiev++f7Njw3s8NubJAGa3NKV6VY58yBH23ow==
X-Gm-Gg: AYBFou34JFEl/WB7+enY0wyfLevsu8QOZgs22x0HkFyPBQUUyGhGZfhYBbIKOpLyEtg
 +ggZ8iipAHyznEh0mwlFqmY86SOXu67d5eJJ4q+gG0JJelPl6p9zUWMbDuTDlpf5L6khvlGGb4C
 Bk9ScESLK2loHN7ITQh6wuqIbQn77wsX8s6Ck1Xy4kDV32iWNZoHBwEXlEtTbYyOJsExroDWlzh
 QQoDEJjkNv7F03DeN8MY+aHcOX6eRjWHxbh0l/f9dfZ01A/3QkmY3MYs1Lj5/YE2Wz2Au5XSRxA
 eDtIEf7JraWV01lGZN9Ph7Ao6xlGF3go80c5/6jCsODXJAybmif+iphR5Iz0ay62R1nEuyLceVX
 fvvgTXL6f50Z1HFTZtzhy6QXCv4uhf/twoYKrIgbhoHxC72ukQHTY1PkPnj6IALLkThSSe2M21t
 eQ96TH+kinBdGrlun158hCm5GBWiuzkXvACGVUlyOb59DYYz66QxkNufXUoLVIssf8lKK+64fPX
 6HC24AevgeylLS2L+usH/RUScGKwvccxMgAMaIDCA+9oUI/EwA=
X-Received: by 2002:a05:6808:159f:b0:4b3:18c8:d387 with SMTP id
 5614622812f47-4b960ead82amr27059645b6e.12.1788957581025; 
 Wed, 09 Sep 2026 05:39:41 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b971c8ed6asm16218585b6e.17.2026.09.09.05.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:39:40 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr,
 Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:39:24 -0500
Message-Id: <20260909123925.29971-3-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260909123925.29971-1-matt@thewebers.ws>
References: <20260909123925.29971-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] support/scripts/check-host-bins: skip RPATH
 check for missing libraries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

An ELF with only non-toolchain dependencies absent from HOST_DIR cannot use an
RPATH to find them. Report those missing dependencies, but skip the misleading
RPATH diagnostic.

Assisted-by: GitHub Copilot [VS Code]
Signed-off-by: Matthew Weber <matt@thewebers.ws>
---
Depends on v3 of the check-host-bins series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=520240

The test script is available at:
https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164

While exercising v3's missing-library check, an ELF with only external
non-toolchain dependencies was reported as both missing a library and missing
an RPATH. Since no relevant library exists in HOST_DIR, the latter diagnostic
is misleading.

Test 3h places /bin/ls in a synthetic HOST_DIR without its non-toolchain
dependencies. It verifies that check-host-bins reports the missing library
but does not also report an RPATH error when there is no HOST_DIR library to
locate.

Test 3l builds a binary with its non-toolchain dependency installed in the
synthetic HOST_DIR/lib but an invalid RPATH. It verifies that this valid
RPATH-check case still reports the RPATH diagnostic and not a missing-library
error.

 support/scripts/check-host-bins | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
index 5233f6cd1d..7e9b51cd4c 100755
--- a/support/scripts/check-host-bins
+++ b/support/scripts/check-host-bins
@@ -30,6 +30,7 @@ main() {
             # shellcheck disable=SC2086 # we need the word splitting
             printf '  - %s\n' ${missing_libs}
         fi
+        any_lib_in_hostdir "${file}" "${hostdir}" || continue
         check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
         if [ ${rpath_hdr} -eq 0 ]; then
             rpath_hdr=1
@@ -111,6 +112,18 @@ get_libs() {
             )
 }
 
+any_lib_in_hostdir() {
+    local file="${1}"
+    local hostdir="${2}"
+    local lib
+
+    while IFS= read -r lib; do
+        [ -e "${hostdir}/lib/${lib}" ] && return 0
+    done < <( get_libs "${file}" )
+
+    return 1
+}
+
 # This function checks whether at least one of the RPATH of the given
 # ELF executable (first argument) properly points to the host library
 # directory (second argument), either through an absolute RPATH or a
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
