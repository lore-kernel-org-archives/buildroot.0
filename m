Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332E3CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37BE80ED9;
	Sun, 11 Oct 2026 08:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkfLwh1_hWNM; Sun, 11 Oct 2026 08:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF3A980ED3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791708222;
	b=H+aJ8WJRxSkcj3/OdOmULKbMM/RuEfMRWerEb64nCmQ/L0hnA1tzwVCHahUt5fw8If+L
	 6nrOdL5QMCFnPWPn19lE2yD/djIE36CyTm2rEg9bWJHAVOOHf64bx4VwQKjzJRnrfepBO
	 rtCIGniHyBPj0Ycr2G/sRFI7YKV7FXKiDvNOWAnqn1O6+9CniIc8GEKYmbhFITKnvp8N1
	 is7dDkgJhnh0+exMhcTl9vFKqeGUVufsw77MtXO78H+PsGdRzfGpN7W05bFzkcUqcXKB5
	 iA0LUVJLcic+ivkeqmVZdXqlyesg5uqtT4lf0e/7JBDUs23Zut4AMubtjLYSZMAlJjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791708222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NaDErWE/7o5v+IF1NuKOUCV4YFSb0S7DC5RLqxg8k4g=;
	b=InPVkzJBq9MFkagLFHZXgyXLzCzeqXI9ezEWs/W0EVaWDZ6IW7dtigxMYAd4ejF4nGH8
	 cqUKYALAFMHmG7DH/NilLwlxnBQ1V0HA7kliYH5/WIPi7sQMNmm4X2qKtH9aj5c595P4i
	 cEFu1zFmYMiu+RKa927Z9YbN/Sq2VgvJcD5VeuEilegCOgDwm5QJ10x5Kiwd77Itx+kZI
	 PBksSct59Ulfl8dvjN9yqRJsL8RHym0E8+rV1rLZGZDER26V+r8ujNyssxp5qpLvba2G6
	 VPG1cmtmFfMKcYy35MzI5ugy6tmciWT+EWZ6krWKKRpTQXt2X9BiezUSkdtN8TaWiZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791708222;
	bh=NaDErWE/7o5v+IF1NuKOUCV4YFSb0S7DC5RLqxg8k4g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o/3IzEc8jY67TCxoucKHc8IHdzJATSZXEOKQeNGsZQoWXjHKw4t4r8xjIlpfoTsw9
	 ttoHKQsZkqnL80cNcSjgzjNWWfQMzkhzYlxO1WWo4iGNN+ZpbwDtbgPa9wZPgBJX04
	 Osac5jP4oOy9DMBRYigjvwGIRGnqE8ji4DFMjh9pnZ77zFU0Ouk8mUkfK/cpes/i2V
	 U/zjcNm7dUTszOvZIXKRgRfq8MOnv/Rt/7i3ErOf/mVjryASGMX2xP8VR1FjSZ3mhj
	 tOxT2326+9Oz5lg43opHZwSOrlpd/EskwdNfo56KYxEVwQhygn2f+lQ3HUkhimgXNO
	 du7yvDbi7JoPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3A980ED3;
	Sun, 11 Oct 2026 08:43:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD7F9DF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC8A40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1f-5YQxyxUS2 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:43:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7D8114002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791708219;
 b=Xfvb0MECEBDalyxw5poD/gHDgrakjJsvZ01Q7WnRWDAbIrsuaocb9auRbcd1Lk8vSufS
 xVD2Mm/hEVERsMXY/n8SG70Ll+iXEj/jytE27f2hHjawyhDDyfJznW5K9M2vlcRf0j6Sn
 Hy41UaVxBeTbUrReHXXJbHEac9zEheG7jwGmXhPQPfQ1lTGmx96cmkNTGq49fPkFmtgbw
 zZCZ8FGjs7dyRYudwcKU629IMNApR5Prj0mL7/54ezowdyujpTlVVDqEtChNRJdtFGT+F
 Cof3fASY1b7Zh+VPTtVQ85twZ+kcotxAcQ6on8OXh4XNjwfhO2cqXK4y7PQbi2jsfAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791708219;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pQ6GktA2bLpSYojlb9N0DOxX97TCcfMjq4D567xuquc=;
 b=Rqq5yNVO7jm4NZMm4M8cCblm68kWWZBk0s+iarL58ILX8ZFtEP/b6kW5Zrm+F9ezWEGS
 juhWXDrxmsMb6Sx8eydD8dA/7vWsljA0pGxidtzrdBABKUnbVddprK8MuI8Laf0WYNlk0
 vxuiRuBi3WtfLznGZbYVc3QtkA+ISmS5xYHEshyUF8f/AsTCYdmwNO7DMHvFfN08jcSi5
 8m7pE4JH7nA02iY6mJe+cCkoPDQ6X5nVItMIs+BneTrliBp5B9XSdQV2M304eiitdmiG+
 OlGvRu94i8cJvovPZtFrkucctEiHFV7IkRD+arv/ykSJPNt1pakA8CVEfr24cke0nYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MiMwdauf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D8114002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:43:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49e73611928so18961225e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791708217; x=1792313017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pQ6GktA2bLpSYojlb9N0DOxX97TCcfMjq4D567xuquc=;
 b=USnM51cfjzGztheYjdZiX7mxkLHTpfYxSp86eyACeBBkJhh12zexnwGX6kPYHuxUrM
 WADbkQHe5VdX2Eo+goDiYFL7aAPDjUt9z2OjIyJd54fWBwcXkDmhawII8Qah88L/4iUR
 YVD9caQg39xejFrsAlg43q/VMli/2Cp/JieLBtVUTXl5ItckgwGWpGQNhQGKjgVpfQw4
 nhRidc/Ueyq8GrDxdqMCFrTebMn4GoFW3IDw60EXTwEv/wwRiiDt0sveQbR8WNROjRAM
 5NoM+1+OcIvrzMARzwJs4+6LGvowuKNEK9Ghs11YhX4iFTfJZCdhuvHtiK0KG7PsD4QS
 rypA==
X-Gm-Message-State: AFq9FYI8/m2XPBCH/XYlgI2fnAwb0VXH2TlEtR4DUh6zR9hs0fDV7Nrt
 YihvQPcmPqpelWOBLkQJCQ2HW1jyyuCJL+Wx+AR1f3OHBFbJ0ETaqWhLKBcpzcJrUBJ7H04cSrc
 uCkB2Xdc=
X-Gm-Gg: AYBFou0CLB1cGHGsOLXHF8p3TkR/3VX+32uUOaw4Uu5GmCpjrQtzpNyU4u9Jt6mkwmT
 UoFL+5paMJxjHg3iGsSxTy8A/q6pwcbdgxXVFnkbenZIAcOR3HZcOMFEeZw+vXiWClwsfprCR7I
 2X3aTcp6HYW9VtSge6JGWtAjhyqOCbUZfQamE/Ci9pT07C3t7wv3gkyEkwEEg5hm15xhh81Bft9
 z34U1Alwux/oP61EcVMiMvMdMF5WLR6XjaeBA9NEYLgEtLKEVnuLc2ZJMmc1MAXDBCubuSBqDkc
 1QxdaKBkT1gWPlwb49GmBtiHCZkYVUVxHNevqw/k7+kCBMvqeBFiW86wl/fiuP6bNjah9kE+p/f
 N+vPgYVKWW1mp2Rzwiq27jaFUrE1pUrqfNExP4sPd7YsEdOhrgBEqV7zpvFhruzAec8eMYeHljp
 YnWedS+Q3t30F1GFgAERH7IP0GOkIiST+Z4SdyLEqsHfYxhDuHcjXXYU+Iw41/TUoCTazvWnm5Z
 /NcGuWp/qVKtpvXe8EHKmQM//2PzDjFaHdgvb6tckoHQNxS19fBWBv0
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id
 5b1f17b1804b1-4a18e4b1311mr114411535e9.17.1791708216206; 
 Sun, 11 Oct 2026 01:43:36 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm197720645e9.11.2026.10.11.01.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 01:43:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 11 Oct 2026 10:43:34 +0200
Message-ID: <20261011084334.667976-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011084334.667976-1-thomas.perale@mind.be>
References: <20261011084334.667976-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] utils/generate-cyclonedx: add comment to
 explain spec_version
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

The commit [1] introduced the `cdx_spec_version` variable.
The reason for that variable is not immediately clear. Only the license
schema can use patch revision while the spec version should always
exclude the patch revision.

This commit adds a comment clarifying this.

[1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e8dcfa8518..77b813fb49 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -561,6 +561,10 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    # Only keep the first two numbers of the 'cdx-version' argument.
+    # While the patch revision (e.g. 1.6.2) can be used for the license list,
+    # only the first two numbers (e.g. 1.6) are valid in the schema and the
+    # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
