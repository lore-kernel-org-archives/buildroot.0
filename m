Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227ECA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34BA4084E;
	Sun, 11 Oct 2026 08:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmtKZ2EOzu32; Sun, 11 Oct 2026 08:35:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80EBE4079A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707743;
	b=fb+vv0nwOgTPZmwUfP8YoiAPObwZfOBUXafvadbjvbDxCHMpFku2bnh4Nhml+KGR5gaK
	 bKP9YAs3inkBwU7yibNAMIe4BEDwRfvKm4kRzAbrQSTJ6L65qraPz6dBOiqvxp4Dzr0I4
	 u/lQLJyYyoGxbui/BFvRxURf0/J28nrXptGCcowCebAnwMCQFO33Tcgzi+1sSWT8M4o9T
	 7kwAG9d7kMzcYqYBIw4x1s3y2N1lX2Sv15o7tCXsI/4I2wlq7tAiW0ZgufbMlA8eH1AtH
	 W6wd0jKYCxv+tKHLutRKEMuHbv+vF5BVL7JPpN6jt0J1Yz6ZLORzO274OHxCv67VGcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Bm+2GFP47Pc1bob2Hlx+GGFBhJmvgCyvswJS8kzCLIs=;
	b=DBy/ayprEooUNNnh3kSLLA7hYU7W+ACV4q6uT+4fsebmQk34WdlxTuyG9Rn6r5gTMPNM
	 hGT7qYvkYecvJLLRhgzgBOmKJYbrJ5UGls5EocUqe7C0FOUJRW2pszLPABKW0gXJU9lRA
	 Y8oyzPfkTSpGq1isjM9r6EiIerIO812kdaV7EepwSbyUfnUXF4C/OJI2dGFX0mgqBCbnU
	 LYUZX8hGyf5kwTuSGXdvGvIomNIZ6yarg9yh1TaXJCHRRtEcLZ8sisoD4Izdy+i+omVSF
	 +RIbSGqvazOmcTr+2mu5vwWrC2SOmXKeGRgXKN+RjCHmPjePwceDcrLSViiC6cOyMlg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707743;
	bh=Bm+2GFP47Pc1bob2Hlx+GGFBhJmvgCyvswJS8kzCLIs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WUhp/swo7Z8Gx+4tLexihbtzp3qnEYbeG35Jb/VjCPNreYRq2IDKF2BfkCIS2rYhS
	 QgpNeRAEIUl205fNwwBlNFmhdwLnQ8+ebLPM3vuPu9KaHsaI+HIWXAGt2ZuMiMK8Xx
	 AGdq+bvtpTQeNILEHgpE8xw4Tq8RzYFhQQx5mJ1toILfbZTsg6q3imgo38S2AKtBpt
	 Amo0HnyLhTB16DKQiiV6t/XmkTjaWtGJzaCC+pcRSg9IJq7MZuIBZ8OTuF+N9z62eB
	 zk5xKMErAB38oswTFhZ+aUZn4zi3oxt28HNlAI4t88kL0l8TEvsSDZOqslJbXPSU8P
	 upYoLZLw65mVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EBE4079A;
	Sun, 11 Oct 2026 08:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEDC0235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0E8580EC7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 739Umd3UN9Mc for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D95580EC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707741;
 b=aRQXVckwMi5umKX0w4EJAYxAuQnl34Vni2cfVDGkY9sjCmLhFZXURnjZH2zAXopcic5s
 bSjmYMqBIkq+GJkwJaJFgGHganYjYMICNBtHg6O/fQgBHBIFm035k/33ifVijLOWlAx+W
 4RCfGSOyr5a9BnjeKeOoA0b54aEL58k56dWRQhSmmwHGkNSAHRnTT+V+Lpz5sacUYBbW4
 1KTn5+on5H8mWHcMScCtriEOUKJuM7XMJJBCHNSHrhimtrngyOohR62S2rl33ORkH816o
 7s8QFs38H/5Rxi1CUTgPUPNWJdWu0h8WB0+LJpPNgyyogHoJVKuVY8jQHivZK7aPwBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707741;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=hz2y8FTsD8IyZJvs2R9kms6nqFsbxJAdqR5f604F558=;
 b=FVcCGklsyp7nzav7ii2kN22WEdp0FesIMXO6kkZhrrS7JbAicEG+WaXlWqGusVed7A4+
 3BOsBK9sAkZ2cplIhzp61qyO9afwN6h1jSMriQgj7LIHqjtZeUtCTlVfYX2Jm/7WGheLT
 6dNz5A6R3moOckJY4Oe6f7C6J+VciP+oa+qtW+8SScrnQrKp4BG9p4NTDL/euaRLpPCw5
 M0tqN+0y8jrPJFdsDqkrkdRFvxSDHPNYiXthDNI/CR/7jPAE7jZUcfZzhbg4U0aF6zUqF
 x6zL50Re/WE/twoRSph4bsQVb52d8YLgCW4CSbAiVlHOylfK9Sm47i0DNgru0WVsyWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Y8hn1CTL; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D95580EC6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00B2AB978F6F; Sun, 11 Oct 2026 10:35:36 +0200 (CEST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 10:35:12 +0200
Message-ID: <179170717083.143633.10167585922356281103.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260918091142.62239-3-thomas.perale@mind.be>
References: <20260918091142.62239-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] utils/checkpackagelib: check
 IGNORE_CVES identifiers match patch trailers
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Sep 2026 11:11:42 +0200, Thomas Perale via buildroot wrote:
> The ability to check with `make check-package` the 'IGNORE_CVES'
> variable content reference an existing patches was added in commit [1].
>
> This commit extend it to actually check that the entries that are
> referenced in the 'IGNORE_CVES' variable are matching the trailers in
> the referenced patch.
>
> With this change the following `foo.mk` content:
>
> ```
> FOO_IGNORE_CVES += CVE-2000-1234
> ```
>
> Running `make check-package` will output an error if the content of the
> patch is the following:
>
> ```
> CVE: CVE-2001-1234
> ```
>
> [1] b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>  utils/checkpackagelib/lib_mk.py      | 25 +++++++++++++++++++---
>  utils/checkpackagelib/test_lib_mk.py | 32 ++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index c5b85bcda9..33988cab8b 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -120,12 +120,14 @@ class Indent(_CheckFunction):
>  
>  class MissingCVEPatch(_CheckFunction):
>      PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
> -    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
> +    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=\s*(.*)$")
>      CVE_TAG_IN_PATCH = "CVE: "
>  
>      def before(self):
>          self.pending_patches = []
> +        self.pending_cves = []
>          self.package_dir = Path(self.filename).parent
> +        self.line_continuation = False
>  
>      def check_patch_files(self):
>          for patch_lineno, patch_name, patch_text in self.pending_patches:
> @@ -146,6 +148,11 @@ class MissingCVEPatch(_CheckFunction):
>                          .format(self.filename, patch_name),
>                          patch_text]
>  
> +            if set(self.pending_cves) != set(trailers):
> +                return ["{}: patch file '{}' 'CVE:' tag(s) '{}' does not match the ignored identifier(s) '{}'"
> +                        .format(self.filename, patch_name, ", ".join(trailers), ", ".join(self.pending_cves)),
> +                        patch_text]
> +
>      def check_line(self, lineno, text):
>          m = self.PATCH_COMMENT.match(text.rstrip())
>          if m:
> @@ -157,9 +164,21 @@ class MissingCVEPatch(_CheckFunction):
>          if text.lstrip().startswith("#"):
>              return
>  
> -        if self.IGNORE_CVES.search(text):
> -            return self.check_patch_files()
> +        m = self.IGNORE_CVES.search(text)
> +        if m or self.line_continuation:
> +            value = (m.group(1) if m else text).rstrip()
> +            self.line_continuation = value.endswith("\\")
> +            if self.line_continuation:
> +                value = value[:-1]
> +            self.pending_cves += value.split()
> +            if self.line_continuation:
> +                return
> +            result = self.check_patch_files()
> +            self.pending_cves = []
> +            self.pending_patches = []
> +            return result
>  
> +        self.pending_cves = []
>          self.pending_patches = []
>  
>  
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index ba9dbd6aea..7152b40e2b 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -244,6 +244,38 @@ MissingCVEPatch = [
>       '# 0001-some-fix.patch\n'
>       'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
>       []),
> +    ('CVE tag does not match ignored identifier',
> +     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += CVE-2001-1234\n',
> +     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
> +       'does not match the ignored identifier(s) \'CVE-2001-1234\'',
> +       '# 0001-some-fix.patch\n']]),
> +    ('multiple ignored identifiers, patch matches one',
> +     {'0001-some-fix.patch': 'CVE: CVE-2000-1234'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
> +     [['{}: patch file \'0001-some-fix.patch\' \'CVE:\' tag(s) \'CVE-2000-1234\' '
> +       'does not match the ignored identifier(s) \'CVE-2000-1234, CVE-2001-1234\'',
> +       '# 0001-some-fix.patch\n']]),
> +    ('multiple ignored identifiers, all referenced across patch',
> +     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
> +     []),
> +    ('multiple ignored identifiers, all referenced across multiple patches',
> +     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234',
> +      '0002-other-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234'},
> +     '# 0001-some-fix.patch\n'
> +     '# 0002-other-fix.patch\n'
> +     'FOO_IGNORE_CVES += CVE-2000-1234 CVE-2001-1234\n',
> +     []),
> +    ('ignored identifiers split across continuation lines',
> +     {'0001-some-fix.patch': 'CVE: CVE-2000-1234\nCVE: CVE-2001-1234\n'},
> +     '# 0001-some-fix.patch\n'
> +     'FOO_IGNORE_CVES += CVE-2000-1234 \\\n'
> +     '\tCVE-2001-1234\n',
> +     []),
>      ]
>  
>  
> -- 
> 2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
