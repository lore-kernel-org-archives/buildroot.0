Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5FBCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68C240A26;
	Fri, 16 Oct 2026 15:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsZrIaeEvpMN; Fri, 16 Oct 2026 15:02:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA4B340A62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162979;
	b=kbBlHMmPXkuIa1S8q+WUsX8O0VbiXknO8c1aPaiu+AbGAQynz8zUOGZ0BEK5W7Ntx6hU
	 CtN2hXfZOVWFOYW/z3OIWiWh2ZgTt9VZcxWYHGyWvM23CoFgbC4oJXRM1qTl0MZQ3zvCT
	 V0xJBe8iX6P7aNOVXcZncENMw52hguFZtz+Qd0XRz33mW9DBBDP+42Iy/n+k8YB4mvUlK
	 wNecaGkmY2zGM7b8hoGnxfeYvfbZfJn3DNH2Mu69KZ4qiVQA/rmmEqDk6HBvJai/zekuJ
	 PwtPZDU3AlBOi8TJ6v8cq5kc3G0FR5cS/BZsf668z4VYC6LrpVksaVzwj/WzLKxQPLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162979;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Do4NcxNTr++Zz6O6+2g6PF6Ilp3VF0iwpsjfr6N4q0k=;
	b=imobBRhqZAbSITkpWXwNta+27a9k7wT/i1hkaMUtkv3824RaYGk3COIq3iAkJyc9N5cL
	 NofRwE1Cg1Jh1F1JZmsSB7Opogb6qjIGyHkyslMGiDT6ueRbNa3KL79UZj9s5GgDGMMAi
	 C+cxR0q625nKSGVShDjEWNe3zxtyvWRBHdLbF19UdhkM5KupSPRwB3XRrU8oZEa2TAsbM
	 57a0zOUEnILZ+OqNqiI7+tOBs8D8cGw5QfGkbS3/omd8BTHidLijI9vfdxZcZmuSEz74S
	 qk9elHmqwPRk9cHL1p/6glQWjWin7ccOE3xb4TwKUAdDcXYfKdY+3AFIDo2b3aRm5pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162979;
	bh=Do4NcxNTr++Zz6O6+2g6PF6Ilp3VF0iwpsjfr6N4q0k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xly/T7qA7I/Jg03nE82fduhNTKp9W3bPpA5zCLSBogKNn4iTjncbyaKl1bQFJpgUG
	 8ZW5NasuXeKd8uGtqSLvFM4jaCubmNzfg5thGfaEj8ZmOPVLooFqPN2Ave3hKbrW9K
	 /Iq+X5a0b5e2Ah5VbNSR9D7vaRGcrMSS/ZddtdxPSShK5tJuWpdyTeIQVabbYCt8bH
	 02L4GpNuS63LcrE5qLKVMeBv6elFgpg74mzELUDLmCQ1eBER/cod7EP/xFFDdAZ8Ss
	 0K5P20DncxfPt2wYBiTndUCu7NlbSLsfqOaWP2KBF6am7/f8g6Qh/GS+prnA2kBMZ0
	 UFC4hSXSs5dlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4B340A62;
	Fri, 16 Oct 2026 15:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA747AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 931674016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_tRANKfq1bG for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7F0D240042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162974;
 b=jAaHRkA1tHrrLElQ9JC9mFifylCnnRwno7InZE8FeGTHdC7KkYWfl1xX6kB6gQh/+Mr1
 /5dsELmosCsvwm8rv4DLwotpqc7neYkU1CrzIcDwULkGHJYKnhmB585aPlppqo3Shrd1O
 acE9nHIFDNF68qSrMFQpZUhzFfMnGhRfdap7/KX9eitPN9IzXjkyW+Og/rimgxtf7V2do
 Dzf7zgp5FZ6h8Ip6miprvD0zpq4zLjwy5gb+CLcv9g/EiB57/ZRqXLHgLXRkm//vkA4Wj
 WfzA2tAh3qs0XFqTRcf1mPsN3B6SGotA5qcZ/1U5yntd/59HpfmG2cNhtBAhUYwJaFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162974;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=fMcOXzhAqG3jGnfFFG4GuB6LgcIxi1GtvLhUJbQeCoA=;
 b=GttH+AhZT8EpeXCWzCRbAWJDohlz/PZwXqb1ksyjDXsX/eBq8gM2I69Mz1Ek3f3nvgtj
 QRdjD1Y22neLzVhAv2k/L1z3j88I1o+GjwUoXmoZlhcIc92EkobkJeDP3A1iX08R8bn1w
 aMCMyjzP2DPDua8Tat+Fy+bziQ3znZWAQd6o/+y09N7Fp5Sx0IlkEXrPNF6LwRBP1H16m
 SQN+zF5qy0k3mFnPyGDoVdoj+11tliELxvX/GxAefbt7Y8Bv+BlJKYzJMdqt+X0wFG7oS
 pkPsOImd8ENV85mcA+28XkRzRC2l3ouTgAk/n4TU5cfHKj8gpAFh7GZAnm2JgThwvfg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TyKfr6aA; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F0D240042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c3ee49054ecso296893166b.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162972; x=1792767772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fMcOXzhAqG3jGnfFFG4GuB6LgcIxi1GtvLhUJbQeCoA=;
 b=JmaQCkJfmcJ4gTX29v/rcURycG+Ff4V77PQHuBTtmuJUAkgCxyTB8H+2n6kKs3jXze
 9apTmrqpUyDd7pWuK30EcgPuYrdO0SNLI+vUOAuB6WC/88oL4AG0tCSjfXKLeYA6fH0p
 zFEugRMPxUTaNfT22BYrNycWeU3BXsJTYfRD+27cJIGdTMeDWpljIsG49tbr6qfsi49P
 nn6Wozc3WabELbFyEeTVvFviPfqlEKWvq//uC7qRoNuIR/mkUvthlwQgRQae5RK9bAYn
 oHxPWX4q+Vb6eeISeibMzgHa4lXAZKF/l06Sq3qXCKvrbdgshzZtO81DdP4bSMwXuHHz
 cEUQ==
X-Gm-Message-State: AFq9FYJh5e0mrmWYnw6cDEMe/zJiUXKroxTqAXwI82Os/wKBW1ysLdgN
 teQMIlGNiSbgyXYho1kdwufFxN/J9BheIdhujaKmhL9CTXiU2LMl3RJKwMONq74hR9udB1l9/W2
 5iHAKLXo=
X-Gm-Gg: AYBFou1gWRFAr3x81MaPNysKJfVRJYjyi2yN+uyu0ls+j8OOkU2LkAZWVgiWgdD6IjW
 xCHg0NGitm7Bjb1O2m+xuQzbG2EQ2iX3fiM+dAbjAvF53vUvvWOK6l9RcaHmNWVswtiRQqVHCqA
 pzQyUiy8JHyxaRby0JkBXB49WczZb9D/snxiSl7JUVOlB6KzkN/O7BLIzZS+NsEwS2yqIuVmHM6
 RM3QDf+l4hIEEaYKKCLcECOI+W1KESM7hJbZPN646cp281q8WP+3WH4kp4Bfqw+e55xNBMAKDOt
 bNp2fizoDbkXslL+6w5+2/ojj8A64qSEOglKckW9dHBNQ25mUUhWrxdHnhV2w04h+jH3la2IIwu
 1IRSg8rFsfkIC7cMm2GGmjk5ZMTz+yASzIU5ObArB3PNjc5zVxc/I8QYdTtWUyfcJvS81HuZjF3
 EzlkmiGeFO/8D6F4I1sA56aDOthOoCAoSVymBVdPgtvQPBGi1laA+2L3IEGD0RJ5JzWLiPX7vTn
 h6yBzHmW0zYexFQOtvqwkXNkEyMnCDMdk0tyFbLzgU8iwyopfGw
X-Received: by 2002:a17:907:9348:b0:c31:be58:5dde with SMTP id
 a640c23a62f3a-c419fef6f7cmr3915766b.40.1792162971876; 
 Fri, 16 Oct 2026 08:02:51 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50d080sm5822070f8f.53.2026.10.16.08.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:51 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:49 +0200
Message-ID: <20261016150250.60751-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-7-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: support for
 v1.7, 1.7.1
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> See changes:
> 
> - https://cyclonedx.org/news/cyclonedx-v1.7-released/
> - https://github.com/CycloneDX/specification/releases/tag/1.7
> - https://github.com/CycloneDX/specification/releases/tag/1.7.1
> 
> Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
> this bump is optional and default remains v1.6.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 8d055c3bbd..672e7ed815 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -539,7 +539,7 @@ def main():
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                          help="Specify the project version to use in the SBOM metadata (default: builroot version)")
>      parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
> -                        choices=["1.6", "1.6.1", "1.6.2"],
> +                        choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
>                          help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
>  
>      args = parser.parse_args()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
