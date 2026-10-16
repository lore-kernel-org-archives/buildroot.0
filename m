Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5745DCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8D340AC2;
	Fri, 16 Oct 2026 15:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIM2GvSq3Vzv; Fri, 16 Oct 2026 15:03:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1070240AB2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163015;
	b=At+qt9dvBzhe/0T+wa707TMBw70aoSQFWVbmQUFBUaVePz0Mfc7rEaF5di6WtxrurtIS
	 +X6CKDSL2YJehzfn2ZTqqRtJ8R1iXqqMT93/AoABGUrXROd04jgx5sRTP0AIVm1jWytNQ
	 Ut/PKulu/XW8l+XQNDGwYuQBOvCF4tDLii/YfFxnWlw2dnUw7UwmEsQlLiqhXR1TEua5d
	 WlPAJjGOp9UkKkb4Cp5foRRVCAnBDH5xBNnd/br7JgxU6vtWGOkv0LBVkY+YDSM74exv+
	 QS56OmlhvErUjTf2gJ4jIhp/5GAuPyQw9VwIRV9WqbElnenQXJ3Mb8SLFl19M2Fg0iQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=I+gMWmeVKPf9JLCRYhTFBFr30Bi9otlFz1E++CmgjGY=;
	b=gsaJ40GxTO7RS6IqmU6LsGCcX21TSkUdR2gVYzhTyrAlIA1iuZ47A8e1j9jiZfqiRBWY
	 SSI74krbIZV6FyWMq8ZOVHj2B5nfti7QasrVRiTipvNVCVjjNfXPy6mg4uc9SPeg+tFvg
	 zJ/iXTeLzLyKwq5JCTtLn5gAH4+NoObuEJZA/l+vCM9Di74NaX8F2zLVfvvExB7xTcYcZ
	 EJCOWTmYPxKJv2cyM2ZfpAt6oU2l/hC4SHo4YkAzDBIrPtCtqO4vAnUdMwaaWTwD+rkLI
	 4lfj6Hw1GQ/0/hSLDNbLPTkB6ubcwFnaso9wB5fDUPdBCpTTk/zZEFcPTpk6mmDlLRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163015;
	bh=I+gMWmeVKPf9JLCRYhTFBFr30Bi9otlFz1E++CmgjGY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I5cdApBN0UzKXJavOmsRhCu0Y0itsjT21Fw6CCtp2OS7vsMNc44y33AZ2eXHNT1R5
	 nK6t3Ws+2q9bUGZLcdPLhWDmHt0/LXhoo6b9MIdjGUKJkeRasEy5ferHlOcvSKAP3d
	 kiYkN07chuT8TpA1cv7xry5DmwpRX3eOB3LAnkgANKTpjafEsHSE8xSa0a3pQMsnwY
	 njZUqoG+Jp/FR5U6QbWl5JLuWtZxnuWWt7lXPZixcGRo+lma6dFVr4yvPCqrv/fW9e
	 e7PuzTXqV86/j86HJki45AohmkbBTxWuPMZh6hwiyRP2wgV4vaUknkoVUX3a0ZJukp
	 KU6w19jXCla2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1070240AB2;
	Fri, 16 Oct 2026 15:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 988DC7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89EE3815DB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQMbyeKeV4Fe for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D8668150F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163013;
 b=e+pOvnwENUwqX42iX6acCJDCAbSFcBDTh48tRcg6iGahsvrI4xb6HJ+fQDT104qBx5xV
 7QkzdgeI/JPhJIG29uILfoEZ0Jqnxvz5rrCw9J426765QUjj1oLjx6OVXb5nEIJQbCIuM
 hu+cT+nxnEr6g4uosbclucUfiH+8mOR3OPF8RzPgom9RVKLb+KCXB5NodkOsMAZZiKDPk
 5xoNRQ9z8iTjqxKG4/PT4NUQjhFtEXzoMJTlBxV9/wOK8AaTh32USl5OYa5P+adrVZvSv
 TGmsPZopSpcwUjh85o95EtSOENbZRwhySluGZttpfn26pyI7MrVf9684pHnYHudI6vQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163013;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=w/BG3/9GhClluL2vTO56IP2w5ao9DwSE7UzpbhwAL8A=;
 b=XE7ZuzpF2vPdQ5NvcYiNPeBi/U6OGIIT4VlXE8BPW3bNU2UU/Lj7tuLSns5+g8e/lUf6
 5pYRe8iBqiYBoIbSe9wVpOK4WnTQ/TfOT98N1NoDwPEEm1lgnWGg9KgyvbIFKs5klOZwC
 pJD3MgHdNvU+klPBIf3lgJm6GWLtEDr4XFxpbiokvI59Ryw8m2TIQxd4VtuAR1alW1XfO
 2U0l0Tb6cLe3tXxf1dudWd6NaOWam/zRwpc2CKzrmRJTZiaFZT0Jezwtm9urpDYpWqMn4
 h03tuKD+anoFglqT7UbhpLBxo5vU9MHr9h6bFQQhBBekwIpVR5o1rhLHDPBD3o9o/6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TdzFAi98; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D8668150F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1d75f2f11so188435e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163010; x=1792767810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w/BG3/9GhClluL2vTO56IP2w5ao9DwSE7UzpbhwAL8A=;
 b=Tz8GUsVSFevNkmHNpxCuzd3YZy01nAQpUU5RW/HiHQMUiTN97n3tsMheqZ0ekUYjOu
 UAwiV+x86TrcDkVBdcxQEguid5KGuOZei82HWIydKTlOQBIhE9X7eUA5GfjRp56KYacg
 odQW26lU9+ugBJOK29KI7IDyMr7X2dnOS+tHcsTx/HdN4rrfRmaEfRZelecbLKLldISj
 TOnfsgyDMUZ/uUCZySaVP+zCKzWatCizAifKh/xtInzfleuPTYZzmCY1g6di3E3IYoD9
 ytP5PSRRTP1v177aK5zITg71a9BtUYXHmsX8xoJ+zNBC5IYR0iyWesEa95+nwmaGYX9U
 22JQ==
X-Gm-Message-State: AFq9FYJBNjZxfJLcOsGYhZm+gBZ3kFWIPqtxiQrgVWEeAk5Ga2aLPzn2
 9zKEd7HvRaL12IoRx+mwHYp0pjdJss/0esVrKdXqVzG/a04EW96E1Sj83F08V4XieuPC8SdyfDB
 AXyDUVs0=
X-Gm-Gg: AYBFou1nVxuMzBbEEEFddTdu6KCDyrkd8AcdJJhAwqN1aHU9HJrVOynZP7jIkpvoTHJ
 TE3tMA+pLixMxiClFOS8flzHpAioVRYNAlVPFo5kQsFzAZJe2fqUAOeZ31Ydl9zpJsJkkroKnWk
 Vpo8jEPekAj6VDEOiTgDQKH6yJPaeQI3whhSplENPmWNIu5W0P+Ln3eVb6IS2noHWlO2+BxXlO4
 7PWvyUJk/5wQrUkLctcpRcu8F8a3+0Hje36g/ZVgd5hiGpjImAAnJCQ+P8m2GJWnfZtlnedcBBp
 ejwYARWoog9d463eClVp1NkRB320usod3E69UQgqWQz5V3KkNfutb6hoN7LgUEfSjEoUQ7auq/z
 gW1wK+QITrKa69GGqU9pvq+X0QY5xwI6UMXvT/CeR367cXbWV5vbP/axSL1hy2vrC5AtWQdKy6N
 LJflAKVzFb0IC3gQ9Lv+QYHVQNSz6h0oqBPgS74QtudYqT/P16r7K+zXgZ89RzoWOKBmx5NHh5O
 XyhZck1/h93LbMdeyb0CytNMUhDbMUXaAZAtM+6qw==
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id
 5b1f17b1804b1-4a1d75fe793mr1289745e9.15.1792163010220; 
 Fri, 16 Oct 2026 08:03:30 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ae6d2esm65950955e9.6.2026.10.16.08.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:29 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:26 +0200
Message-ID: <20261016150328.65734-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918091142.62239-3-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
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
> Acked-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
