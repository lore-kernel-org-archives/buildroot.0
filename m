Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20AFC19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 11:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A0060613;
	Fri, 28 Feb 2025 11:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrZLEKVmRKTc; Fri, 28 Feb 2025 11:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5030160817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5030160817;
	Fri, 28 Feb 2025 11:04:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DF768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 11:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCEA4081E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 11:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOn1cV7ypGRh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 11:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A46B340812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A46B340812
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A46B340812
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 11:04:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394a823036so19143185e9.0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 03:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740740638; x=1741345438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=umeXRWq0aD+KL+r/POaXJpKgsWtWM0dq6FKh4myeJ1g=;
 b=F1rrLN4SbsnPD/w/KVCn+D2xxWOv7d6nDAUB1iXNFwSFCwx8gZYfwWfZb4Sw5JSReS
 uHZvqE0raxW7MReggMOUlKF+wSVlaYm+tJeDVavYP6h5zg31D99z1aQl5q5LpcYPGNKY
 5Zk2hblY21YM5/ajNT9hOElX8Gv6MN4yi0OckgdG/xwJXc58IGBl0hm3ynTCerIlnAaw
 7Nr1THHQlO+xlnU+4/ElphXMok/VVRg4Uf0P7cXLTDCSllpKPqu6XORGHmMg/oILtSIj
 2i7KYD84zW+qzYRGlLk5PZEM75Z1a/GbxQZf0U5QoTHEf6wst/me955N5DgVZC0uMd+J
 QAGw==
X-Gm-Message-State: AOJu0Yy2XglBVQ9p63+09IXUSInRUa96FDxnN7r4QEsKoZLRbCcf/pJ7
 7Y94XYHPiJYSvVZNbRavm9Nsg6utNRALSnBL+ff0lRfk0klR1YiWqxHk+A==
X-Gm-Gg: ASbGncvafokTJsEGyCQLmYEi8RG11tfSi+7suzZxi7QlFHG37hzwuPHMJh2YB359YP4
 YYDmp9iqf4KGIKNLFJ33nURKxT0VouMK58MVXbjwDWa/KOgFnulGc6zETnttaAvoadCYDI4vhx8
 TvlqVh2rVmgBHHXc/HoIYCK2zWM9FedGQpY92PDq1pk5AwSHPvJWlig9nu24ghDNRaISDpjylv/
 Z5xTkaVe0/d6to+cu/Rzvm/yHGToO1WuPNEVneXMun/GTDszL+8m8kHvRDcs8jR1L5Lyus2wTQo
 KNMKoTSTTp+dUhc4+4rYhVpO0OqCCIY3fstH32vIaaI=
X-Google-Smtp-Source: AGHT+IHRFd4qDaftat9d0rJvvYu8RlKk+lbZUcTE00Gyv9XJDXy8lVsvdWcuLb6LjOHGlGgz1Qt7ww==
X-Received: by 2002:a5d:6d09:0:b0:38f:2a7f:b6cd with SMTP id
 ffacd0b85a97d-390ec7cc305mr2376630f8f.20.1740740637658; 
 Fri, 28 Feb 2025 03:03:57 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7ddesm4928314f8f.57.2025.02.28.03.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 03:03:56 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 12:03:55 +0100
Message-Id: <20250228110355.1017396-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740740638; x=1741345438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=umeXRWq0aD+KL+r/POaXJpKgsWtWM0dq6FKh4myeJ1g=;
 b=a54IZ2qN24A7o+4sRHRaP+HIY2ZZc18H6mMKto6wkhtf0POuXESHFX107VCRRBttED
 XyEXhjPa3xtxzY/TjX16uJJX+qsmHkJnhiPdNqssFs6yeaYQrqKGyn66EXf5+TM0LiWo
 W52k35fueRR3FPuuCeoqt0yFSuS2+0SvAcvBksJM7kiBmRWkR1D3TEdvnm/Zr9x/0UXa
 oqYffjy9IwXMRSdH2YtaNrh0fwhcoA9xKTpA8F9Ntw0BzzAR9VRdDn8TOBrM1B1mGdpo
 iVPCb+FPjY++baIR7Ft01ed4ZlVjVVGpUVy0XDu5KMyglxHVJha+lqzYBj6540ljwyJu
 1erg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a54IZ2qN
Subject: [Buildroot] [PATCH] utils/generate-cyclonedx: fix detecting of tty
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
Cc: Vincent Jardin <vjardin@free.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Check if the script shall read from stdin if data is piped into.
Otherwise read from the input file or if not specified print usage and
exit.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 utils/generate-cyclonedx | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 993d7154ef..365c2b06ea 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -273,13 +273,19 @@ def main():
                 Example usage: make show-info | utils/generate-cyclonedx.py | jq > sbom.json
             '''
         )
-    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"), default=sys.stdin)
-    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"), default=sys.stdout)
+    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
+                        default=(None if sys.stdin.isatty() else sys.stdin))
+    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
+                        default=sys.stdout)
     parser.add_argument("--virtual", default=False, action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
 
     args = parser.parse_args()
 
+    if args.in_file is None:
+        parser.print_help()
+        sys.exit(1)
+
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
