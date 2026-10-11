Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0126ACA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 09:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A802E80AD0;
	Sun, 11 Oct 2026 09:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUHSFKmTO9z9; Sun, 11 Oct 2026 09:42:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE888809B0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791711742;
	b=piSKh9mJXXe+U1XFp9RLE4EiUTYf+X3Qqewqk2Ess5LVIUF/vFLqPKJaaqkEAPr0rXqL
	 jminmOa+Di+zWYOaAis1t/+CH9vOMyU5bc+uQ6TsJQN5mAwymtCY32QkRk88Y1Pq44+mN
	 FdxPufoUGQpOMCT4N6v50HtBxiimkpFIhr2HyHycqVjpjY1e6tL7/R5704NeXG6roaQuD
	 goVuKplvJ+HzNA0lFqBgoevfnP7aqcHOC+CBnUHGLj00/AxM/EQlf4m+82m3GW+9WszNG
	 Ulb+VurOhxZDv8aduVBSEJP90VjaU34KuoRNGLCQ1NqkuQvy/IyjWuctrDofJA742Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791711742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dS3YO42A40/2iw3OutD5v61y/TOi1T7ExOY7fptVQ48=;
	b=sA6u0Cp6KGIt5FrGCadkeewv+C2sFna8YW9WKMbd2WS76qJ5ArrCoffpVKtylYBQNhDr
	 Lj/UV/pSqCufcmqcsJ2mPrit7vryEFCptBwZtT7cVdrckqYxuqTuWERf1LNUucZx6/yeH
	 mEztnMwER0itra4rpi9Mp8o7FlJTf6dLE7OPXuDFy4xn/lv5MTLi+Pf/a8CAG61JCcqBp
	 glVHoQQekrPYuK9nzzwXhxYELuXHCRttyyfq6QPrUuu7wxcgx8wRRczEe9kaNrlf6timj
	 jiEdHQ3Itl0SmFqUrWJnq9WVuoJOnvtggq9DGw8HQsBG7E6uIgQuHOFCRTHxWTeU+qA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791711742;
	bh=dS3YO42A40/2iw3OutD5v61y/TOi1T7ExOY7fptVQ48=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IYVffMAiNfD0XxO7VCefivJc0s/6Fu+tT3cFamSeKTCukPtmQxYSa9TA/se9+kgp9
	 zfv5vzMBYayzuQfTyCTNig3iCpa54d+CkIsega0ClHDIMfppseSwEmjIaGT8/u2b3o
	 FoJTp/Q2H3Aq4xnxrZfwEDrXOJgnlqb4KaH5BvbXGHrHW8ZiLVTZIefNvIb70OMhFU
	 QLkN+571l6WmXaKSvvH9cGa+akwDOffpcdJzQfZLhW1ZDZn24IDaR6LcPZ//l6oHoR
	 gFo9pofiVRdEfFn++RdqIt0GX2NXzsCvM1EggYkrGMM8ox7kJhGs9Pv32BjMM6KdqX
	 EEk14xzEXxl5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE888809B0;
	Sun, 11 Oct 2026 09:42:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 269FD9DF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9F440042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vS0qDxYv7Nm3 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 09:42:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BCE3B4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791711740;
 b=J7b5dt5MVRBZ9qKxufu/rkD4Rw5YxQglw0ev/fYvLCovNz3c+mGxtII1F8aPfd8yWY5X
 5lEygn51H/jG6MDihMfmW/k2NIkYSlzU0fwhu40T2pE6flVtbkRNe/TW7Hk8SUUMVX/Ju
 6t3+PVcUirMv5k/UUSizcL+hB5JzQf4pIiFIu9SNdPBeaMBKqdx6PmDI7NYgxV2JRqp1S
 yDUnB7UXLrkQLdJ+V88yC3HDhpA+qEwXpsvT6xgRIMhx6dMQI9gz/HYjWywI2Z5FTQ2YU
 5fPzmcSvY9s4VcpaczmrufppFSfcI27wst5vMASkS/EDEAybA9Tivrce2p3hjLkxa3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791711740;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yyI0RviEmDlCjHJKDBWnhkxMWka4FzH7+0psgaezFbY=;
 b=plZrIQnqf6fhBlwrlcJj4rC4+Y2crXP7ScuUHpHBR4S1aJSCxxxbDUFYKa1puc4J7dKp
 uHexPJl4NIZsLyUDkN6l6k94wK0eit6uJofq6LOcZrYj/rzD/ErYC8GjT/WdoSasrjqHB
 3buJH6P9MavePMf0hxBwuA7b/2/dHoumWmkoyW3vt5WdU6uTUYHUvnYuUPJC7B2vz8ZsM
 LE2OJDf+WH7GQbZ/svyXGHRvqeAwfCbbsvvRO5FYICktzAWjDrbdfhE7jE6H6eELmRlKE
 2KSV8UZNR9YIeuHno6DUnTB/ZrpvYoaDbDb9+sDxU9a3cGDwQOWkSnhiHKvixijYzFQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Oy+I9DKn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE3B4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so6390075e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 02:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791711737; x=1792316537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yyI0RviEmDlCjHJKDBWnhkxMWka4FzH7+0psgaezFbY=;
 b=hfe2AQ7dD3wuZuS3BhW9TGFHt/uYUstmwdtQK6U6qpujQ3U2BDZYsiJPZdSaVeJQAN
 5Rw5hcHls+U86vAKpZdWtbfriIq917kfnv1ICZ+IsRCQpYanL8QcRRclvGudLK/aLiyB
 fnrrOvsZpvhurJ5C5hi1ZTQWjFpU87i/iL2MdQnxtcMF7GeumuIzeozxwmdSoEpBw28g
 huLyz4A+AQBnu8p3CdOJWWlEN0U27KlOp3d45YxdMt4krU1mYF9QcElQ9jtpIMibXmN+
 JZ5FNiQoetvZ10pFf+Ork9Yj8bfyCkI3kObKGEWVwoCNG4P9/04+qcShkmeWOHI8dF8P
 2zUw==
X-Gm-Message-State: AFq9FYLUHlzr16oV7PWJzmL+HQBhTpXsfYm/+Gc6G7Yb2u6Ep/imLz2h
 /6B3DwsvM52hb6/o+8sKaHKTkeqHOizUqYmCczghi9dypwtlFRY4Pp+pSz1jHUbZHtcCeKbPVP4
 Rhplgx98=
X-Gm-Gg: AYBFou3mWS/Sxx0xmap4r5NpGMVEgfCAH3gxfw2vb1r8Tc6rvNGr6PL3dp2eShl3q4x
 6SvMXgdhguU+D52k7VVDo8BrRC6nZU/yDflEfWbBFSJBEpFKrZcTLbQC2oBeaEQs+wbo/jOMLjR
 OraaJNyjfbiGeIdmBZ5+ij/dHh0doAgymdeVhFfFK37BMYzpEvg0PIqUTDYrgZJm5zkb8offpGb
 QHv9eaZExnbaqKcry7YzawZrgAj+SiXVCl5Dxplo2il41Q1d+i1iG/bstvHBUcVkLYBF8Yu4qmP
 EUrcIEL9MDeME95zGvYWuF+77Hm3B9n1V6IBKeqmbMwZS6xnE8GIp5DPLQJ0PcG4Fu/QOse3/z3
 dXh+kA5PImFeRc9Fgxvpfw8/ZgKoeGEKRFcBbmzT0h4h3iFQ5nOQ5Cx5vo0kQd3n+alavKGriI/
 mUIhpvUL5mO2CAFRCM5O3kk5WFHqUMjH9RPzcB0wwXrccGRMTvMuD5M5oCnykOzJcTkU5VTT4ZW
 82kD+37A72JG5nFGwa9tOMgIvhyXhlO4O1WvCGomvwhd1IFhUwm6uDT
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id
 5b1f17b1804b1-4a18e49d640mr122180965e9.8.1791711736969; 
 Sun, 11 Oct 2026 02:42:16 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a199e5db12sm67197005e9.2.2026.10.11.02.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 02:42:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 11 Oct 2026 11:42:13 +0200
Message-ID: <20261011094214.682647-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011094214.682647-1-thomas.perale@mind.be>
References: <20261011094214.682647-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] utils/generate-cyclonedx: improve help
 text
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

The argparse has a set of arguments you can pass to the ArgumentParser
object to improve the looks of the help message.

The example usage used to be defined in the "description" but a "usage"
field exists [1].

Also link to the documentation in the epilog [2].

[1] https://docs.python.org/3/library/argparse.html#usage
[2] https://docs.python.org/3/library/argparse.html#epilog

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index c292ef7840..9d3baa23f1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,9 +529,9 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-        description='''Create a CycloneDX SBoM for the Buildroot configuration.
-            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-        ''',
+        description="Create a CycloneDX SBoM for the Buildroot configuration.",
+        usage="make show-info | utils/%(prog)s > sbom.json",
+        epilog="For more information see https://buildroot.org/downloads/manual/manual.html#_generating_cyclonedx_sbom",
         formatter_class=argparse.ArgumentDefaultsHelpFormatter
     )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
