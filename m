Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51BCD6E57
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 20:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC43D82083;
	Tue,  2 Jun 2026 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNnal0hrKEUx; Tue,  2 Jun 2026 20:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED50F80E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780431889;
	bh=lm8JwiQRUKlVwczpjy7jwmQXUNSnvh8rTpdwGI/388Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=p7G2dr0VV/icn6k0XkJnhq1j7cUjOqqlz/pcK6iMiqkvLn1cur93hzhNRlhodQbbJ
	 eYjGghcXImT1cwpexEDC7KpsB/1tFZW1M/rq09Q8RQ8nA21guJ/8EbOUsFYSQfAhEX
	 5zwn8ojYKIZrOO0cwiZ/MHMroEaFSNjSHLrFYxoRBCP7OJFlXzC2AxG0HsW0eCQIhb
	 G2eZF2x6Mx2ngQ8MNUs4JIOQfumyyWC7f38qk9EfbR/euzZaluSOoyHBuKxbJAkoBo
	 BPwMXh/vU2M37vbt+PNz3A1XaGE9rumKr8dGk4ZdN5/IGrKs8vSOdbW3iENRXd8TnB
	 bgOyLaeHUCSwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED50F80E2F;
	Tue,  2 Jun 2026 20:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1FD2D3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D361B80DEF
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esTgU6ddPUWJ for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 20:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD9ED80DC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9ED80DC1
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9ED80DC1
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 20:24:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef6565cfdso2163309f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 13:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780431885; x=1781036685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+V7oAWPpqPtL6vv5SdyovBhMl/IX3QeC9D3Rniwsx4=;
 b=l5eShk4JK9cHRdyF3pCyfCz+YbfmMEm9lj67BOF7fZN/BDLNVbWqmfE3ETofIJxnHZ
 SNuTzOL50DrBJOT3kCrcQKDi0vA9qtdzxHTa7XnOLqsOTDkVQsIRn14Oto1tUW1EC7Mf
 Yt0M08/nckr7Wqbmdq3tZpyHP4DEedW9bECJEC2DrmSTfnn/zDR+3kU1fKoYOml2we0I
 lLQk13TShON5pnLfRSmj0RcNiiv0OJMbNi9LkJOj2O4J236Auhm2HFZMRMFcUAC9h8wa
 uVrIVKPgke+Js3ndR1xZRe2ZgExG0D+Djj+AMvoKrHqi6nRYS9e0JNNIwGFXPx22l810
 cX1w==
X-Gm-Message-State: AOJu0YxiTQyQT6TBlVT2Ha+qBlsG5x1CjeKkzHAinTjKkryAespX+23E
 yvQJXHv5W6dA4YMtiRGW6epYe4SDV7zt4akokT/mMGEmsTRZkiEsUYwF60prKQTjwWdWojIRZFY
 EGigu
X-Gm-Gg: Acq92OG20HamK4D4mPlzP3w5WbyH/5FXs0ToSAYaOF29Rjj3vdm2a2LKt3crHAHvbpp
 OBrnP1h/9zvAym/v5XAycqVp4AbT/WYtYDF4Qz/vTd1LjoPdevmAFXXWUOgHw08IaWt8GvrpE9I
 5uf0Vz51AV8Y5iqF9FjoOF49sdAGzUiVgCEweeACHPZV4AmTAJkuIWW0+VkoY2myUcWV6EihLPJ
 I/NA9+okoQdchpxbvlnqS10W2/A1tuumPHKFubUXBff9+ZNmQ2J7A9SO7FwtcpxBUaTkc+KOXFh
 7OKL1QIhxOQaybq4f5homOBNuBeT+UWli+XUNgHQvcTXnQLk58CKQG/Boig6w4FFy+w1tNgWCx7
 jN8LKS2Xs5BstMI/v5Y5w54RtrZIriiAEnKOiSyml3g7yUlLltN4BxvezmSS99+O5oycwsA767w
 6zhayBcgUJv/Qf3hekwi0vNvCb7qDz5l6OXUa5hqbsh5X70/DWQyxQ+3XKzA==
X-Received: by 2002:a05:600c:8b61:b0:490:b1b4:d437 with SMTP id
 5b1f17b1804b1-490b5d3e1d5mr6579555e9.0.1780431884594; 
 Tue, 02 Jun 2026 13:24:44 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b575aaa4sm3389545e9.3.2026.06.02.13.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 13:24:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue,  2 Jun 2026 22:24:43 +0200
Message-ID: <20260602202443.54352-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780431885; x=1781036685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l+V7oAWPpqPtL6vv5SdyovBhMl/IX3QeC9D3Rniwsx4=;
 b=gohMmnc/Qutsl9A4l76yfX69n5AL0nkEXZsnNWNEsag/u+3OboZXoYwjRJKQ0CirOb
 bS9OuxG3AJ+CVZXef2RBFty58T7qXTIBB1BiX/8V0Gy8FjWDWfrKQQOZfsT8HxG/ZTGr
 Jb7RPn+Ks/x6WMNnFI7MzIF0v3WXpUu1dTKGWGDDux3j3hT7DBO/c0cs6X/lW0Q04l9+
 uf7YYb2sBqdTImFtbShGYrdqmWa8tUN2keFXHcAayLnggODJ9mB1dgwdjL0gp+/Hp7uv
 eCIY+OGoeH41EY9LcT1OsFWxF0LDu9G0ADjuIK9+mFrTi4BDMGKAhI/DsGQVmmAMZyLv
 3/Hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gohMmnc/
Subject: [Buildroot] [PATCH] package/unzip: patch CVE-2021-4217
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

The patch is provided thanks to the Ubuntu community.

- CVE-2021-4217:
    A flaw was found in unzip. The vulnerability occurs due to improper
    handling of Unicode strings, which can lead to a null pointer
    dereference. This flaw allows an attacker to input a specially crafted
    zip file, leading to a crash or code execution.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2021-4217
 - https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 - https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...erence-and-use-of-uninitialized-data.patch | 57 +++++++++++++++++++
 package/unzip/unzip.mk                        |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch

diff --git a/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
new file mode 100644
index 0000000000..4f9c4c1858
--- /dev/null
+++ b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
@@ -0,0 +1,57 @@
+From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
+From: Nils Bars <nils.bars@t-online.de>
+Date: Mon, 17 Jan 2022 16:53:16 +0000
+Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
+
+This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
+to read as many bytes as indicated by the extra field length attribute.
+Furthermore, this fixes a null pointer dereference if an archive contains an
+`EF_UNIPATH` extra field but does not have a filename set.
+
+Upstream: https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+CVE: CVE-2021-4217
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ fileio.c  | 5 ++++-
+ process.c | 6 +++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-) 
+ 
+diff --git a/fileio.c b/fileio.c
+index 14460f3..1dc319e 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2310,8 +2310,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
+                       (G.inptr-G.inbuf) + length);
+         } else {
+-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
++            if (bytes_read == 0)
+                 return PK_EOF;
++            if (bytes_read != length)
++                return PK_ERR;
+             /* Looks like here is where extra fields are read */
+             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
+             {
+diff --git a/process.c b/process.c
+index 5f8f6c6..de843a5 100644
+--- a/process.c
++++ b/process.c
+@@ -2067,10 +2067,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
+           G.unipath_checksum = makelong(offset + ef_buf);
+           offset += 4;
+ 
++          if (!G.filename_full) {
++            /* Check if we have a unicode extra section but no filename set */
++            return PK_ERR;
++          }
++
+           /*
+            * Compute 32-bit crc
+            */
+-
+           chksum = crc32(chksum, (uch *)(G.filename_full),
+                          strlen(G.filename_full));
+ 
+-- 
+2.25.1
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5436c7a46c..129b749a9e 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -51,6 +51,9 @@ UNZIP_IGNORE_CVES += CVE-2019-13232
 # 0028-cve-2022-0529-and-cve-2022-0530.patch
 UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
 
+# 0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
+
 # unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
 # necessary, redefining it on the command line causes some warnings.
 UNZIP_TARGET_CFLAGS = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
