Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E14C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B698817BD;
	Thu,  6 Mar 2025 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMbaJVY3DC5x; Thu,  6 Mar 2025 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F41B84070
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F41B84070;
	Thu,  6 Mar 2025 20:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C239C71F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE4B9413CA
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ai8WHUvm3VTy for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 20:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A820413C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A820413C6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A820413C6
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 20:31:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3910e101d0fso676952f8f.2
 for <buildroot@buildroot.org>; Thu, 06 Mar 2025 12:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741293115; x=1741897915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/m5mwRqsX8q/9yM2ePNL67eG8alpcjM6B/1Z8sfTkPE=;
 b=kRUSDd+jpFqsNIIjg6GhNK3pzNB2pOdz566oWqt36N7BlktjlrTXToNXqW5g+HrJc4
 gN/ztfvIKrZkaQxN47Vgo5yzZvaWFzvqqhSXIiMHt3xoqJwJGRPRtoDzfETuY3GvnYPo
 VtUbn84fUhS8OH2G6uxL5vAbK/oQ78UjXsZfFNLjo2+SteIMwnxjHaVkFllBpaYNIeHq
 7VCnojcYB90tl/7XH8Htf08OVi6DzivoDVaaMVXMlNqe3K3Bw9krnAK4ZjD2H4Jugm6x
 sy7+Qema9h4KiJnS+vnK48cH0zn8djyi3j2hckN+ZUDo7R2JHxkkFncT5MCiG0sJeG3X
 qDcg==
X-Gm-Message-State: AOJu0Yw5fZwpiJEzLI9wn1tUpsNA4JpLMdzWAz786Uf8S32TLKppT9Vt
 d0GEkPLWQKA9MKcy1ZRtoW9c8PhI+vvuvIW6y4i/AGevdRvic5Ajou5JHC/W
X-Gm-Gg: ASbGncv4ZF6k6JmepZfOLGZZXJOv3G9VrBK2kOOemHCs0h44REqQ+pIWk3V1M72DghD
 EhwZRpiJ+hJWu+aaQxdbAOre6/INIuZb/vABOVLE7xiy+bI4tpt8iGIf2jT8+DpTtae/1dxoOgd
 iChTTaaAP+e4GuRiJN8kgAsQd6Eglafz2z/a7xq3eDJ4CCT9fRv/qegnr3Oc2YofDkd7DQBTSaM
 BfqqJBWVocPlXFA+GMOTWNNCMUeYE5obv/i04XUzXmrX/D14Ijl/lbu3UdGhbUHZottd8yxyb1r
 6sdD+Q57+ouLyzF5x/tgZTjUDwM8xrxc45dWQTpLN4t5BFWI8SqICSDScZhMXOa/j5dkGg==
X-Google-Smtp-Source: AGHT+IFHN4M767mBa6SFs1yOuko+6R1U2yJj1oqtKvdHTThX/v3hXwJfEv8KSU/TpQsqA/ePPfMhcg==
X-Received: by 2002:a05:6000:2185:b0:391:23db:f218 with SMTP id
 ffacd0b85a97d-39132da93fbmr320197f8f.40.1741293114740; 
 Thu, 06 Mar 2025 12:31:54 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:8145:715c:acda:47ee])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfb16sm3044087f8f.29.2025.03.06.12.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 12:31:53 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Thu,  6 Mar 2025 21:31:50 +0100
Message-ID: <20250306203150.1538664-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304205633.397011-2-thomas.devoogdt@barco.com>
References: <20250304205633.397011-2-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741293115; x=1741897915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/m5mwRqsX8q/9yM2ePNL67eG8alpcjM6B/1Z8sfTkPE=;
 b=a+MM5sIDosT1TTl2/x4znQk9DcIBYYUT9h4JYqZPORJj5WrTm8YqN8cl3GYjiTLPhb
 /tdbJuIuPYzWgaSe9C+WGBX7BNeeDCRQlJEG1+foVitv9tGFDViG0BJ/ShGzC7xK3kUp
 MwnpNAXfv9w8VjsSM7G+8NpN+iw2NmEWtwC6ZMbMumrZQwAsm7lk/A/FWGeaHiP3ny1p
 lx/PCxuX0dUnktFhJv9NUsQakUXENL0+pDXf7Y82q6XlErZns4b9xTvpzOvH0IpYM9SE
 U1vEowfxcGlmxBjKuqNaNwYTjxDNYSCWhqx4iBpzD+tdRA3xkN/fuVVuO5bFZN98zx/6
 6mbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a+MM5sID
Subject: [Buildroot] [PATCH v2] utils/generate-cyclonedx: use indent 2 by
 default
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
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default, use an indent of 2, which is the same as what 'jq' uses.
This omits the need for 'jq' in the example usage. Also, add a new
line to the output while at it.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: replacement for https://patchwork.ozlabs.org/project/buildroot/patch/20250304205633.397011-2-thomas.devoogdt@barco.com/
---
 utils/generate-cyclonedx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 6f580cbd613..be27bd65e2b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -5,7 +5,7 @@
 # to CycloneDX format.
 #
 # Example usage:
-# > make show-info | utils/generate-cyclonedx | jq '.'
+# $ make show-info | utils/generate-cyclonedx > sbom.json
 
 
 import argparse
@@ -280,7 +280,7 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx | jq > sbom.json
+                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
             '''
         )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
@@ -326,7 +326,8 @@ def main():
         },
     }
 
-    args.out_file.write(json.dumps(cyclonedx_dict))
+    args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
+    args.out_file.write('\n')
 
 
 if __name__ == "__main__":
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
