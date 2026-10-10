Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48D7CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB604608D9;
	Sat, 10 Oct 2026 13:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seWTYTJC_ujG; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3BE81606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791637264;
	b=QPpTSHbDQSLH14Q307KuyzNcC8VPtIqqKIoLfbJhLzgpMYABusjymmH+SrGZqDnxDh21
	 2KlOvwiR/FeT1sFRRO6MRXuZBd9TV/iPJQD9CQbgM+6269nO4ZYTEmdwtFiG+hhst6zVt
	 F4BhD5NVtgIHukivZLjeWs0P4dUzdj59AsSy9dtCPH1tfhRUxs+eROkTYpSiH4b2IRxSE
	 OwnORlJGAjti1TgTggbwiLlh7n0titKDsRSyr5NneoqK9ixt5VIJOaAkyYcNrCeOqgGfi
	 QaHzvCH8kKaW7tPvUzxEYT/Nd8CgV20t7acFm+zKE/0LdZx3CutkY4GfC7xoSB8c8uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791637264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=TJ2obxqGhicdXOV9SjlRZq/IRrQQ693RSiWh4EhigZE=;
	b=FejXdYU8+bU8V1BuRVDCmyInIPg9d7RSH/mJeCp3nxdXAnmoHTBh+TYun9zVmdqAh1K1
	 Tc/0mGZ9BcamFnPalAkJ3G37YbK+rvQeCNpNyvF6O/4qkwqQjeyLSJgdjMFeINaY7uwwL
	 zKY4LWSn3TlODNFZSpIblwSDNuWWL1vVbEFvNx8/0biTYP6ijhcGSvE8hyTHd7piE+9EJ
	 E/Hxc4Ri4DIgRqe7bZHapnMllwiU/h+mdrGUTPOch7McjAVd8Oy+HoX2xO7LmHuxBYgfW
	 DK9pSgsKKla74dzg7C3hbwGX3R5x6K7e1VIEBPkySJQ6QbCHqJAHftLRiNQ73+t1ObQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791637264;
	bh=TJ2obxqGhicdXOV9SjlRZq/IRrQQ693RSiWh4EhigZE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hl16k+wiYOBziGFFMIdFUFCzPUabz3k9mGQTqzKIlJlqqPMg9U16dm+B0XKdDIoM4
	 D0FH0CbVxIdMIQRg6bjwgboc1QtXrDgaQPIhV2zRG9305YYqg5bZASVcVfQGNDj4Sz
	 nAkrgp70xgxqatzvmjNdkg9XbO9MRq9P8o9HULnNFjI3REHuADN4/9xrFzQ+2MEHKX
	 2rs3kA7hB2X60IAG983kmSrKU6+bK7ywuZLiHy/WanPnxwiRsjXQFIeuyvcjrAB8+y
	 BnfzuAxEGFh0ois+FLNIsIVKLgjU216BGE/ZYF8jUTccsyz6ZEvy+n8/nSfMQEjtJA
	 QHK0enR7SYRlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE81606F8;
	Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE6D1156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D411C40098
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mt8E_6H0_xiq for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 13:01:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A8A0C40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791637261;
 b=DNn6zyeS8kwmJlNR1d5gIUYDlhglThJOUE9qxvcuMNSpZRnR0gWyLseUwgOZq8+9CsZs
 e7aoiIL+uZEs5ko53k+CUyd28m4eI+GWqJkDKmyk86ye6yDpvp9iR21zbN3XpaNfisMwP
 XWcrFjvxYf16DlU3vsVXGMcimdGb4UyKRclDfDiwm2hgZYuIID31di2Q06v1SsFTguEVV
 Yi86dGKzB1mEsq9XAMR7Vqt3hR3HpmT1tz5OohjgXbNIdDMsL4O3PbfDml0V6NIQRu3bs
 m587AT6omeISyFz1NvuN3wSi8Hc878Z9u+CRy3kcp0t7wVOAB1BMB059+F/WW89Mrgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791637261;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=w6dxNsXq/x8/NQMeVnD4Ts8plnSOyC/gXilhcmJ76Zg=;
 b=noqbyfOOqU9XeasLVzoKzzv9mKHO7LOmLegTKKLYlSF6AEAIRqOT18PZOQtIkPXa/5Z/
 kGMAlVcRzG7d+X3xHyev2y86rUVqXT3PE87weeX9fKd0hDNSOpaLCtp38zZY+KRCpwhcR
 V67GsCb6w/AE32c8MM15BbiU2qn4WnCXTCzEWcfdXawI9OrMg91Ofkyx6creM9czeqKfn
 w+pv32SjDB5HED+u8/9gJDcyJwfFSCsdZMdWWRKabbgYFx8EIxankHqJgdaGkNs0fWgZZ
 fcv2qPrtoVdCWb8Jpq8mprpLIUXk2p+BrbBDXTD3J8vXAMFju5Qpm/mJ9TOwWP9a94w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EFjlROlJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8A0C40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 13:00:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso5559765e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791637258; x=1792242058;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w6dxNsXq/x8/NQMeVnD4Ts8plnSOyC/gXilhcmJ76Zg=;
 b=PRgawkcDdRAqRb7SlCJHSDTrla10dMpPbA617xCI5OVuerf41SABDXVirgqVxCufgr
 sSxkpTTO/1kWH5VItYGB4fkmZmjT1hI06xbUwJOc9OXPG2lv8Poj17wzvu6XmYh0nUz+
 wbhZj1dlqSJlfxiHh4QaUpJelwEYxb1YRNwIyNf2wRyDR37cTUPd5ezjftFrI8AI3b9J
 jIe6GCH45gjkKWD8aYG0DKrNYFVQl3/2p4UQw331RJRoUMRI7h/W5raj/PslWdEQAmxb
 uNsfe5xeUZwHZPQFKuDRZfh/L0pw6tvHrzjmhmZWZrXlKnLHNqzNyxLhtjiKpG8oqQWN
 +5cQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIwffuM4nYEnpW6uIZdVUm17XB3GPPRVH3QqtmTLorD4tBGCn1ydeCNWb/wubaaN4gj0Ni1hEgo3M=@buildroot.org
X-Gm-Message-State: AFq9FYLFljyPQaLgdzL5tmI1JZ/acOEU4WP5fC4ZrtstHCyCRsp1C+ib
 Et6jGN4wAflccq3M6r0tpHA7876G2DUYaLzlZSq6fmDCtzD1bEOx1N14bIkLtpbwM5/otzSfAtJ
 rK3/8w2o=
X-Gm-Gg: AYBFou1NZdd/GrdgpxZvdVSUC0vBCZfL6MN7btaEeOGXU6kXnwYkgng048cLsTjDf/j
 jku23bQuv4Go18ltGTLLonH8ZE36W/YGHd6hpB7Uo93YFNO0odnn6Fz2fPnv0mU6novK6/44rnf
 +Qtf179VuzUGPOITFIGBDb9j7vCDLBBIISAFi1mmtVLWwluyZYvH3lgJZv0sqnUEQV1zwo2kJ9j
 MXInOt1o9OoknUWybLw926M5aSDLFDRjWYPQCEjKepmFLGSQKaUbhoj6BWKOKBWa5WWTCau45Ck
 cpNMXnZRufa66OpDt9iVMdOduVCmbB1bYCw2MsV/hCinflBlXLdUenv/r+wfY/HQap89oDfaNFM
 CGk5MPWdAdL/U6YKojnAr1/gZ+kf777U+Cp9mA/IGKB2dI5K/ZqWPdXRPTQaJ8sPZdFzZenaG09
 Hh8q5iKbHIecJVQP/8md+7qGj3yNklj0mHtQSDv/psf8gM+YSvveUoKVmVlt22zvgS28mZg2BcX
 i+vHXiby1sgW1gZS6/9j+XHu7iumvlHbAQJI/15ajIJNLI07Z8zgz+dApvyrgjwdS7XpE4rEPeQ
 Cp+LLXzHb+bQ7ZHU2ChEBPTuHBc6Ken6JjmHs6iSY6ll
X-Received: by 2002:a05:600d:1:b0:4a1:9438:71a8 with SMTP id
 5b1f17b1804b1-4a1943873cfmr29538365e9.26.1791637257335; 
 Sat, 10 Oct 2026 06:00:57 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aba3e5sm8831829f8f.31.2026.10.10.06.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 06:00:56 -0700 (PDT)
Message-ID: <89620126-19cc-4954-bc29-ca6ca5e0b33e@mind.be>
Date: Sat, 10 Oct 2026 15:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260918091142.62239-1-thomas.perale@mind.be>
 <20260918091142.62239-3-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260918091142.62239-3-thomas.perale@mind.be>
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas and all,

On 18/09/26 11:11, Thomas Perale wrote:
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
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/checkpackagelib/lib_mk.py      | 25 +++++++++++++++++++---
>   utils/checkpackagelib/test_lib_mk.py | 32 ++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index c5b85bcda9..33988cab8b 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -120,12 +120,14 @@ class Indent(_CheckFunction):
>   
>   class MissingCVEPatch(_CheckFunction):
>       PATCH_COMMENT = re.compile(r"^#\s*(\S+\.patch)\s*$")
> -    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=")
> +    IGNORE_CVES = re.compile(r"^[A-Z0-9_]+_IGNORE_CVES\s*\+?=\s*(.*)$")
>       CVE_TAG_IN_PATCH = "CVE: "
>   
>       def before(self):
>           self.pending_patches = []
> +        self.pending_cves = []
>           self.package_dir = Path(self.filename).parent
> +        self.line_continuation = False
>   
>       def check_patch_files(self):
>           for patch_lineno, patch_name, patch_text in self.pending_patches:
> @@ -146,6 +148,11 @@ class MissingCVEPatch(_CheckFunction):
>                           .format(self.filename, patch_name),
>                           patch_text]
>   
> +            if set(self.pending_cves) != set(trailers):
> +                return ["{}: patch file '{}' 'CVE:' tag(s) '{}' does not match the ignored identifier(s) '{}'"
> +                        .format(self.filename, patch_name, ", ".join(trailers), ", ".join(self.pending_cves)),
> +                        patch_text]
> +
>       def check_line(self, lineno, text):
>           m = self.PATCH_COMMENT.match(text.rstrip())
>           if m:
> @@ -157,9 +164,21 @@ class MissingCVEPatch(_CheckFunction):
>           if text.lstrip().startswith("#"):
>               return
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
>           self.pending_patches = []
>   
>   
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index ba9dbd6aea..7152b40e2b 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -244,6 +244,38 @@ MissingCVEPatch = [
>        '# 0001-some-fix.patch\n'
>        'FOO_IGNORE_CVES += GHSA-abcd-1234-efgh\n',
>        []),
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
>       ]
>   
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
