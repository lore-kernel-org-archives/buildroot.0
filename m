Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF7ACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 09:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 389C580CEE;
	Sun, 11 Oct 2026 09:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leElfZxFYg9L; Sun, 11 Oct 2026 09:42:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D27080D10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791711744;
	b=sjVzZlHtW0FH0Qn/oQOCHpVHjR4FuTNq3w6dTS16VUKLrfv2TaIVzLwm26gKCssJC/vz
	 alseLk+jDQNVWvLI+uMDNATfJlOOAg4PZoeLI+QA12CIXMWBD+B9byvlIYVUxjEXxDRzz
	 dPXOOUCF5zdMxk+6J5avoShqwTJLVPgifBXK2OZKwG+CCxRse7ljxVxlu4TneP3DeBt43
	 zF90uOmjrBNODdORGePozBnXA4jD222fS+dlR61A1Icv8xUAm3mpSOKFvWzE08F4qUH5I
	 XJuoY5thHAK2HjFZail38UaYrGIOlca2IEzTMAd06v3IpDB7wA4yx6SjaagsY+575HQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791711744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GILSVEdCn6zmBiurV8+UkBN2qX+9ZfXj1AdWUt5BB6E=;
	b=akdl4Y5BvAmRR7L5LAo0ipWzIC7Jq+UcG1IAf4nRVR+VWo8Ceg8RK5fuMGDdDiXOgSBE
	 pHMNr8QELkZ7BcTLhnvoKTKos99idHVp2VS0GscTI0BXO1pInmk9j0gPR3BhTLXIHMiBH
	 JVCCMBDmJI8cRiY5iniANP9avavi72rfy7fSoJRFOP5LyVYfEDmGX0hCXptpPg2M45Y8K
	 4P+DRp1JcGUwQ5Mj5iwlqCfxaQ6etWfqfhyQIBCoDYU8cevZLchv3jn16f3CZEwEbDNYX
	 vpdH56cMxin7dR3s0jq49gJqn0u1WSdCCCsjlZ6iFA6+5FaUI/ICXWghsQjMvnarMZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791711744;
	bh=GILSVEdCn6zmBiurV8+UkBN2qX+9ZfXj1AdWUt5BB6E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cvIFL+LnA8qtCL/n+S48rBzrJ4+mJjuGxB5DG9mCLCptMmeAmJ5sScRaylI7sZDqL
	 9J/YHevuLRwHxc6iBDOmwfPJP3veUKIwDLkdWl8+g3CwjrW6Ee7BkR0T0ZeRJo2/2n
	 P59FCZZCWYzb095fjxqv4Zl3Bigwi5PEJwuI0paKN9MLsGWx2QgJIiCZCi7VCs5ZG+
	 iiT4BjG1XwpmjO7wzk6oe2tJeahHARJU5Vy4aRAopm9+gjbyFx2H/9b/II/ktoV1cZ
	 i9eVSpXripFBvQVin3D7tShqkb0bEyoW7/9C2xtICuCwDd7ePZ90FFU5rjbNHCytIF
	 1qXYKoOUg0j9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D27080D10;
	Sun, 11 Oct 2026 09:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AE6A317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51388809B0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_phy_KNFACh for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 09:42:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E38D809A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791711740;
 b=hB49i54Okyqi+Rh8ql6OhOK41MX3zG86trOEvI9amPHTi61hMJ0byHOwdQ4pkA79TVpq
 9Hi3EOiL97ATFy5eB7KSIP1ULT5G7B/CJSRQAQB7s/ex03xixgrTWC1FuwwMNZRqrPgj7
 A8IO4Xk+g8xYELpujwqVlayAQeDPYd0cNm4rLiw+wzYdikEw+DvZflYGCfJ7MHSwRs6YI
 BzBLI2oXBJsPJunmvCHp5RE9gZil4rAFrcIsTQJAGShalYKNYmTZTJB18dLJbUCyrjKMN
 FXf9VbczGaVqfrkvAURvg+PKetK1eNXTn1oVWLLD0gn5DAxRSQYR5maCkBbDTr5otvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791711740;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oQwRaL0p5P+UPy81XpWiKGGF5j5eGej1bOdWoertOPc=;
 b=HYPvN1C+QkTYJVdm2cwullNvX8H+o8BaOT7XH67azITwOLltLN1uFaJpd4yPrG5NEYBv
 rixwhyphn9w7PLm1wbrj6X6wWTEmn4/xCjwj4n/wvfIdCHYYsfPTKWpTXbHjuaEAhTDTS
 VYw+Zd4irzJDT5FpVgDMvJ1BprDPdSJ1i9BRWg1gCbezzXUxM6DNeeB7w86hmTFcXg+AN
 OPOFghYSqF5FRAtEF5gyaTPsv/6k0OpNkzphn7LgwPtRcVYbkZAyJHBVAdr2N0k+yJKBX
 Z+SYKcuj+cepKLtITLy+iTPj6MYuCKA7N2fM6ZDJ5KM2LHL+3dbVLdMqUTOxgNCLrcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Eci9bWj6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E38D809A7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso6890705e9.3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 02:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791711736; x=1792316536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oQwRaL0p5P+UPy81XpWiKGGF5j5eGej1bOdWoertOPc=;
 b=Rlxg9cpXDKyd3qMH3v2FjJfYFsggLe7EsJv1orqbgpXOWIVvGPcGWCup+EteVRySyG
 /z6XMZla6lphyYBzMYWWhm7NuCgWfbhh1Ug/CsFDAXxG6/JJYOjjenqRZaXRFzoygpPy
 Lu2mcumknqYt568nTPqMdKaX4jXa0aDNpukKW6KeJoiLGa+GrOn0coMachN267m+LBej
 nmHlKEki8toS6TM84K4mv6R+fyCZvoA3GxlOS5ZVSmiYWjli4v02q062fLTmPkL3VIne
 76MxXOoIzGnm53SPxzEx9knwU0lRNAum6wUKhxvYFij7dYMpp7widi5Df4KZXb8otboR
 v4Ew==
X-Gm-Message-State: AFq9FYKIYo6o7zYd2/5JFrf+MyFvJIBaAEnDqX1f9zqTYjMWYPgWV3xY
 h0QL7rL9+PEE1hh+Gd2zKX7uiCcPOe/i6Q21w9AUp8hBkpCUpsU8INwzCreDD+rhg0YwCZbNF9X
 YgoWY/hE=
X-Gm-Gg: AYBFou0bbKavE6ko607fcOg1qGe36kpNGC7bsoWMPBp4G5jljD5Rim1/IS39T8LM3Bj
 ByrajGo1x2JDl4WjxBBVrIHCoOJyE/IbJ6gAyH3GAMhjR6Qg2P0DSrJm95Zob8cxOpnDz4vS5Xr
 lNbe1AKlsi4q/D3xbCZ1COUsbvwQ4Cn9orl0ckvd/DVAExt6dVEBNFUpNL1KaFCBMk8b3yd2dQi
 qzWUL0Ye8UuOLPt6SS2HatlzRRquubvZIFmaBATKMUzSssJNOCSijacWqIykl+ETYmHYScqvSL/
 PFeWO81xnGJgWVKu+1SeS9JCkKtEBYs6BpHxMhnBZX/8/qasPb6t4SfftsGZ7RGDpDcAmPYTvkX
 jid4lMaqmV3Teq7r6uDy/wp8XYthIvaFYllMsXc6lzR17IPxS+cHitG3K7rr/iuth7ejIORuauD
 cIh+B8Sbwg3g4+vIniWKCjTl20plJhvpqGxdV8ubR6WmX/T0tBbSQi/lsxZhUiWiGKJci44wh0E
 waOfaSdP869737+xOdO2wefVzJA5Xyd5CizVWC7JL24Fb/RH+o26sZJ
X-Received: by 2002:a05:600c:3e1b:b0:4a0:1fb9:2f51 with SMTP id
 5b1f17b1804b1-4a18e487239mr130341715e9.14.1791711735968; 
 Sun, 11 Oct 2026 02:42:15 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a199e5db12sm67197005e9.2.2026.10.11.02.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 02:42:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 11 Oct 2026 11:42:12 +0200
Message-ID: <20261011094214.682647-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] utils/generate-cyclonedx: avoid f-string
 usage
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

The argparse library documentation [1] suggest the usage of
'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
show the default value of every arguments.

Use this to avoid declaring this value ourself.

[1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 98009cef98..c292ef7840 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-            description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-            '''
-        )
+        description='''Create a CycloneDX SBoM for the Buildroot configuration.
+            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
+        ''',
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter
+    )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
+    parser.add_argument("--virtual", action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
-                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+                        help="Specify the project name to use in the SBOM metadata")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
-                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+                        help="Specify the project version to use in the SBOM metadata")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
                         choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
-                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
+                        help="Set CycloneDX version")
 
     args = parser.parse_args()
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
