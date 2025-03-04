Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E057C282D3
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B46829DB;
	Tue,  4 Mar 2025 20:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XX7Ty9fjqEK0; Tue,  4 Mar 2025 20:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0422982A0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0422982A0E;
	Tue,  4 Mar 2025 20:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A060941
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EA094083A
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUbFDklMXzjN for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 20:56:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40F8F40B3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F8F40B3B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40F8F40B3B
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390f5556579so2519916f8f.1
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 12:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121799; x=1741726599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6nNSz/RE/zC83WM3n4dABMK2iWaJGRGcu1IeaEaSXVI=;
 b=gPxdZdWm6VCuTIx6LDC5USeuKKXaZNqX5HVyReQb6pH4pY/ofTqn1+blVMuxoqS3lC
 WAnYLHQqeHCVK8HTy86uuEjPsWSsXm4nJtb9zIGCUlGsE8R3EyKIvztDfzgnjBMsWoyF
 uVr5TBc365hfsQYTlyuZ2XCkMRG5VjR44RAoXv9nZrnKp/mWD+0+lZ7HnsLEZZk7BIKT
 vXI6dj0zmjki5AL81N+0gLyyoeHiaErDs8kLqr4VMch+semBztuJWYkjSFNWOs0zsv/h
 cwtLG8MSwRIib/hA523SPtt1VguzUDNCypS4kPjIHhyRE3BEeXXKxx8yBc8XSjtqwV90
 3Ziw==
X-Gm-Message-State: AOJu0YwsG3byjPAeCcre/bsXGM5WI/vSla15DBLvVXdyeVch74An8vrD
 b0D23yCOsZuanbI8MPEhUi8B8oML85xoDVaZArRLTGpb+2ve5/nJ+PN5tA==
X-Gm-Gg: ASbGncttZTj9bkCsTK82IKXRYkCSkyDUvY4/wnbq7Vsac4sAhOONzrDb335pg6fxYMk
 fGYZyx2Eav3eEiZWHaViw6KjgbalOVgZ0m5SpJs6gaTjpHZmaGVPiEAB6a+UVon67b2DcX1lDRD
 cyu1oz9WEfucFmjPl6p/0BqKYgl7HV1rfiVa+pn+0hCSAOUzAYAwB9TOi/H3gVJfYv1yqEQvN7t
 k+5b/dV7e8dy8j0u+tlIq9kCvukdoTXUBcQPvTrLH/n95FcnYfMuAARSnUzsUtv6aNgiBqx0aNy
 pJ05IbtLLYixoSkbgGOuRG1pF1jguKZynEMuUm0jtw40v4PW5EdpKaf8Gm8Ad4GbsaWlUFIUlFn
 e
X-Google-Smtp-Source: AGHT+IHh3WPsyJ/p+kn3J0SpEM00Scxjehjq1pcuNCRlBI/EqogGLJm+r2pdtn7rzhlI+D/3TOJ+PA==
X-Received: by 2002:a05:6000:1546:b0:390:df02:47f0 with SMTP id
 ffacd0b85a97d-3911f7bb461mr180357f8f.42.1741121798703; 
 Tue, 04 Mar 2025 12:56:38 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:e875:3c82:3d24:e3d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6d0asm18438075f8f.27.2025.03.04.12.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:38 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue,  4 Mar 2025 21:56:33 +0100
Message-ID: <20250304205633.397011-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205633.397011-1-thomas.devoogdt@barco.com>
References: <20250304205633.397011-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741121799; x=1741726599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nNSz/RE/zC83WM3n4dABMK2iWaJGRGcu1IeaEaSXVI=;
 b=kwQy1dg06+DnfLTZppx7vCWiYoSt5EBqVEq8/6mybtJwMEUm1YFhtTSNDInBaLK0iE
 1w0oGE6eUQz/k8igyQ5Z99sw550c7CT7bbMlxeUP08Oiaa7S1GKwn1jG1vP+Vz3HxClk
 MRm/R7LD5oGM3iOKIofMP5cIedIJJRD7BtHZ4zxVXRAx3MjO0oxCMNn6na8zlYsmU1Md
 wU2NkNgptk0Btpspbt1HdCQEh5Rt2OlGUCDI17ku5XVKhycL9XVeLD5a1yqlVeTmCtXu
 XyynSSVvsga2Ot6zS68vPSNHnCUwwAMp32iPuiE+H6ZLKru3tpQM2qzjxhmcNjQNfYcr
 wR+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kwQy1dg0
Subject: [Buildroot] [PATCH 2/2] utils/generate-cyclonedx: add an option to
 pretty print the output
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

The indent is passed to json.dump, as described in:
https://docs.python.org/3/library/json.html#json.dump

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 utils/generate-cyclonedx | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 39d59173d2e..33e06ea86aa 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -277,6 +277,9 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+    parser.add_argument("--indent", default=None, type=int,
+                        help="If given, then JSON array elements and object members will be pretty-printed with that "
+                             "indent level")
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
 
@@ -316,7 +319,7 @@ def main():
         },
     }
 
-    args.out_file.write(json.dumps(cyclonedx_dict))
+    args.out_file.write(json.dumps(cyclonedx_dict, indent=args.indent))
 
 
 if __name__ == "__main__":
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
