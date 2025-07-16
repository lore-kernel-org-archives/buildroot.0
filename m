Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772BC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ADFC61451;
	Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsly303pKUit; Wed, 16 Jul 2025 09:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5E861488
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5E861488;
	Wed, 16 Jul 2025 09:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0100234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9203A4016C
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUwlDoP44Fxh for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B93AD40449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93AD40449
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B93AD40449
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so48977065e9.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 02:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752658453; x=1753263253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+NNBPcr5denQN5qvOkskP8tg0Az0TbS81DVkPdDw7o=;
 b=IzLW1mT0espfAHZvlRdl0fWYPbs9mFSFzRdzS+p8EDkA6NBTARHRUNfmFqm1OWGDmp
 OukyOfmL9AWz4qLcUZkbedFnw8IhqviHSb3tZknq8KZDOTVuyAcaIgtbfwOfu0hRm1L+
 uQkEvpHd5/dLghcnjHil4z1WfOJi3lyx5TATT8Xuso0sY1vzziL3AMAJfucLSC/Ddujb
 qBqWY7vjrkU1DUdQXVx5F8UskJvy+/6XpEC3GxpRaIHRzEycrBOQbGpgmGehTAF+wxLa
 GpDUVXOJ0pdLBryrztf6EH+ckjA3udag7gqpcVJJS/seFHF+9px6VtcIFMVO25VG7RuE
 C+iQ==
X-Gm-Message-State: AOJu0Yx/0ouDStq2A/+/1dwnNJV8rgab9aCC0aaHiZ7v2RweanZ+17JJ
 4/MHZL7qoB20dMWW8Fq29ClbiqY5VstsOJqC5iSpvie+fWc6xJk3xU1fdBPmqK/x5Y68TqBFmUg
 IpBRP
X-Gm-Gg: ASbGncsYU80WqmzFubJHdbhVey4nfGvLbBu2rkqANKhdUzEdSG6yQVoAe9vtcLe1f4t
 9x1Ee19OrtPS6Xs2zq6daFwuiAIg6KFIic/Dc1Q1+qqIemTvxA5dxTnahPqYFyl9+wRn+xGujkT
 pp7c7isYNWNzGXfqIuGd5EPbU7qZNmgWq2QluUdGO0C9i9nyq0adaFJ1Dl3JIlUozPGpfp2fs9L
 mG6dzNSoB/dU8k9+1o5pncmEiGIaKkNU76a5+Ke0Lue9FU+0eJsrZDDUIzvhmJ8/gVDEW7c8C/F
 SFTWQaSCkJhh+CJB+mOvsjK4gK9MwFB1BzwRjgiH0LlAq5xFWvn6wuU81cJBI+2+wurDcRP4AZ2
 7LNWdWvLoW2x5ZVmLxzZNvd2cEJ94skxdJUYUku8URSBqcXy+ptEdBc5KFdtgUBfJzjl3VG3HZr
 8RsddY7mtx2NvO6YZ6NJ4auhEsMwxkEA7b
X-Google-Smtp-Source: AGHT+IHtgJi2U9S9Zrt5oxMp0HvbVDqfytUB3OIIhuSzw2FcOmDESNo8lzxSNEx+em3uKo6XqbSCPA==
X-Received: by 2002:a5d:5d0c:0:b0:3b6:463:d886 with SMTP id
 ffacd0b85a97d-3b60e4ccea6mr1622040f8f.20.1752658453351; 
 Wed, 16 Jul 2025 02:34:13 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802984sm15415205e9.12.2025.07.16.02.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 02:34:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 11:33:45 +0200
Message-ID: <20250716093401.1213358-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752658453; x=1753263253; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3+NNBPcr5denQN5qvOkskP8tg0Az0TbS81DVkPdDw7o=;
 b=WNmCekeRX9LRNkz2oww4HI5Cye1ov8DMOprM6UDoqDAAMY37A50fmL5TnM6GXZ5nw0
 E/7h8hSRFkaqSFDhMjGEROOdiQQ7JdCJnrE/UIdJne3wjDlz3jlodl0DL7wHZA+5M/pC
 4OB5sCIEwDEYox2S7nfoJ+W1+uci4D3nDSdZA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WNmCekeR
Subject: [Buildroot] [PATCH v2 2/5] utils/generate-cyclonedx: update package
 filtering
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Keep only upstream packages, i.e., those for which XX_SITE is set

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 08c591e86b..14f655bca2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -277,8 +277,7 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
-                        help="This option includes virtual packages to the CycloneDX output")
+
     parser.add_argument("--no-host-packages", default=False, action='store_true',
                         help="This option excludes host packages from the CycloneDX output")
 
@@ -290,11 +289,10 @@ def main():
 
     show_info_dict = json.load(args.in_file)
 
-    # Remove rootfs, host (if not included) and virtual packages (if not included)
-    # from the cli arguments
+    # Only keep upstream packages, i.e., those for which XX_SITE is set
+    # Also filter out host packages if --no-host-packages is specified
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and 
-                                  (args.virtual or v["virtual"] is False) and
+                                if (v.get("downloads") and len(v["downloads"]) > 0) and
                                   (not args.no_host_packages or "host" not in v["type"])}
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
@@ -305,7 +303,7 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, True))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
