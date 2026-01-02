Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C72FA374F
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA5F810CA;
	Fri,  2 Jan 2026 15:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNfvaIaxUHLG; Fri,  2 Jan 2026 15:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1085E81089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767366490;
	bh=9UZKS7G4mTwqOU4CadDFE6BpIPUQmMYov+D5Vvtu1YU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lOjdwGTnavlHSNUGrJRVYAfLfDijL0yQu3A7UKv5inCmFUx7Om37YfuoEzbhwBkRx
	 7lmmy+itJ7jiVDG0a54b7vZMHtYdLFFuglWAXG1WYIOVExJQMWxCVH6nnrSrpYFxn7
	 ivR9gy35gxjafOxgRikb56gOtpyXZ2HsC5/QJljWSd9P29nytepWdLaNQy1UttjPef
	 iHZhQbOWqzeUfKTo7k8Scb0nVlRd0JIvWfLibB0uVxYZl6KDMnHVUxOS/rhuRYx0La
	 v/i1TyVJIm4unA4F9dFgZkM+GSZm58wj49hIlbPZdTtxaGQgjgKfCI020bz5bljSVB
	 Kmxvs6QhrvXNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1085E81089;
	Fri,  2 Jan 2026 15:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A11D819D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F7B5404C5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDg-NEDDlmB6 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A4704048B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4704048B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A4704048B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:08:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so6103785f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767366482; x=1767971282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CZYENZO0b3dGP7AoH6AF2Kj1lYu7BmirO0eGc24S56w=;
 b=lsrF+mu00eL2owgiSAzhBBPNYNeWSt0SCybH5C/lJlDZDrlmy/pnMrnTdqE1ndQkk2
 EibP5x4YdQa6KE8hM3MVc+USMiX0wMt7RGFumB5zNcWUkhd1TVS8GLYG0FOn5InTE+uZ
 aInFkZKPAOZuwn2iSORZAShaLvTi9qGarmDzT0ZSO6NTarlPWHaIfN8JXTKSrVWM7wEH
 0vIdChjqIHcpYbgRtjBqycLcJCg9Ejr3y+bjfyqXXaQi1I4qZMwfmRE8yzGvbKfO1zi7
 1E9lIZft9wF9hwunjDUK3D2hMIm30yZRRl8B1mxIOpR7kO6LpkHNNfxYTyox8qo2fS5i
 8f9A==
X-Gm-Message-State: AOJu0YwQs6wQvMQ6wMKMCT9pwsn/I1gtWUov2X4+D3fP0Q62hJMgkKHc
 AKnF3DAhhpPoWKHBDT9rP1LjHazjUgyXvslaDxbnSl9NQoOdcU5W4O3zAS7P19C6LRQmQLJPBZl
 lcYgM
X-Gm-Gg: AY/fxX6DzBueDhnLaEcopwYXb8o+wausot2JCWIgBPC1o7aRldfmqODOPmJsMqIpOBV
 ytC08/1luEfAgMqI0OPp5kkUUYV25j10MlOVSmPQnWEnN0oSfAx5AoTYhD3r3QugnVaDQs+3bog
 88D7OiKe8nxwHtzNGwmrsmvAbgl4pv/Hv57qNQqsVAlXMEGapWUTIgj/TjNSlqP1BskcG+LmmPL
 E3K1Xl1N0MjRoA0Qt1YcmozxyE6Qwa/fhPPL6tAkMvJs5w0n8EywWudyssnl8gTORDXMvt5nn8B
 I8z0Nug9Kg3c8PIvgpzrCC+9AIEvqw0uP48KQ5kkz8enWqMlHe2kf3GCnmnkaksmakDBp6G66XV
 z+pDVleEam0e0VoPhAEDDjD9wHqzgDS6MSzlqzLXFtMsO9uqY6N6BJvDRqvbshDylCrg9hXpfln
 JV3I6YimvjXOT1CGfJE3M/ClbCvgDSpI6pBsd0P0/P7BPVsUSGiwBPVMZk21bc6/HGLHwN5yA+M
 gdYQMiNPweBxEhzmaobw62hgTuK
X-Google-Smtp-Source: AGHT+IF0F62Ugn1fUdzJp9xllcNxnCMAnr0PTqRLWki+k2qnMzHT6odlAbBFalJ87M86kwI7nHVCMQ==
X-Received: by 2002:a5d:5d09:0:b0:431:488:b9bc with SMTP id
 ffacd0b85a97d-4324e4c1574mr49846935f8f.10.1767366481552; 
 Fri, 02 Jan 2026 07:08:01 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm84629079f8f.39.2026.01.02.07.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:08:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri,  2 Jan 2026 16:07:55 +0100
Message-ID: <20260102150757.1480511-3-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767366482; x=1767971282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZYENZO0b3dGP7AoH6AF2Kj1lYu7BmirO0eGc24S56w=;
 b=wNoHy8ICE19NoDpk2c4Q7qG9cCM9yf5gZY9ZhRHLcrITk3v9LisKWqRMjNgJmCHzem
 chPAr4wK0pxSxWU6VcxWlIQyWIVkpjIqB49ama+G8JWF8xmxz7CWNkqmCAWhXBae3LAV
 d7605XV0Mjw1+SEP+4HxrEOAZrF3PIA7yXwVQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wNoHy8IC
Subject: [Buildroot] [PATCH 3/5] utils/generate-cyclonedx: add option to
 filter only target packages
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

- Introduces the `--only-target-packages` argument to control package inclusion.
- Ensures the generated SBOM includes only target components and their associated dependencies.
- Excludes host-only packages from the SBOM output.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 5de6afa39a..23176bc2c2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -410,6 +410,8 @@ def main():
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
+    parser.add_argument("--only-target-packages", default=False, action='store_true',
+                        help="This option includes only packages installed on the target (components and dependencies)")
     parser.add_argument("--project-name", type=str, default="buildroot",
                         help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
@@ -427,7 +429,8 @@ def main():
     # Keep only packages with at least one download source defined
     # (packages with _SITE variable in Buildroot makefile).
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                                if (len(v.get('downloads', [])) > 0)}
+                                if (len(v.get('downloads', [])) > 0 and
+                                    (not args.only_target_packages or v.get('install_target') is True))}
 
     # Show differences between original and filtered dictionary
     print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
