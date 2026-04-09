Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4C9E9DE68
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5A240FDF;
	Thu,  9 Apr 2026 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW6mo0XcZoFG; Thu,  9 Apr 2026 08:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9393540988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724584;
	bh=HAhDxHpAWigc2Y9Z/VZwozAvSTAC7/mBtYTs5sPutA8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aHAWxgGcW1KO48PBD9EEBr54376R5gXOFNHgxDvvsCvnb1w+A759eB0roFbgxtM3f
	 /0N39LAav7ieXI7f73q5IlN8J8dhDbOE9yP/9kcrseCGj7dNDURjgEKY3OfPrPEB6R
	 xcrS5OwMy0PJaZBZ3D5YUa0gycGxY6OpBuQ1VtYZMa6FhPyl2T4fzoKvXisf7vvt8z
	 uK4rw2yGN/ZHoAYOvlMjg7oH5utqKYWNPZJxN/bHK1sEr5pI5axL8aoaNXF2uHVdRJ
	 AvAjWS1iEnCtv5KjN0DC/7fK3mQXOC3FFyaUwwYJYs3p3/QSkI+ezZh1Lp8SGml+kj
	 gJrJKQJC3mkVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9393540988;
	Thu,  9 Apr 2026 08:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5308F237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4138382925
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVSr3YjPpdKT for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D13C58264C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D13C58264C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D13C58264C
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:49:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso6244755e9.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 01:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775724579; x=1776329379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FjDxBUDOxPK5v5YzCOKdzPNbKrUncgT3tWx/mVMcV+A=;
 b=VO+hPah3HosDIkZyatbQ2uUHFZCA528duUnC0Gvtkcmn3ed9y2GIm5WFvCWeh75ssK
 gAZtHWx4K5vJIEvRUzfxd+D7aXaneEjj+wSfIAvozSvoZem73GC1CQvUr6Vz+93W/nR4
 Otwjm15OMc1uu3kq7m7CdNkmjqKnBXUClQ1qRBnwj24PbyCv5t5+wtnWitolW+fdKwUE
 +xwTELKr9daB+6b6MH4RjfcUXqM7uNtxWl9wzQyixqlWq6OAvgNx8Cd11V7PLPpC37Wz
 yzrQheWZFviygIs3kPkjQIol7DbiOxvB5sdtYLqOjPGn09EwQStiA0eIzO5dUYX+30Zj
 vuEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCVBw68NfaJiKST8LixV9CBdkT7/zAJH2eX0Zg8/IWujJ6QSCvlViqD4iAspaHa7lKTURaDig/9Oo=@buildroot.org
X-Gm-Message-State: AOJu0Yw1pyY+YBz3ZmUvbg/pcRvnFI7XPp0358xxpzM2E4GXn2kFoKYT
 JkoleHVnQqInBfLa012P+GGNtVuJ68oipYrVQ9s5ikKyqwkWWTfDHjXKyjINjBV+7eBQTribduY
 HqUtQ8b8=
X-Gm-Gg: AeBDievTKb2hrViwXTRXtuYzN/H9kDbjCUHXtcavnK8eV3XNgCmK4h/fHelragPA2g3
 lHcGBI6tH523C6j29ZzJSv1tXXq6qTtkCMlEstMKW064AOw6Q/dA/pkNszs5CL+w926kpY0nv+5
 quZQ+oP6U7yTyDZQPwTeXxBKpxK4nPMDeepb6OJ1qTsstuX3Ss5J47DmFefj8VibQNlb6XjXxRe
 NkPqWnj6KssdTMkxLsRQBwgq6bCyYtcNxS7DUz4HswX4Rqme9j+/mSdY2W2o632wTdVFuUuScGL
 h9MYTbqUHRhAjJdidzk5jpKGuzDxce8hXuzJaImgcVacfxMx90O1mvaVW9xRA0ovSusU8KBdU6P
 xovAKT2qb5OlQfjNRM8DKYxP8vXfa29qGyoDF23MhVQa8mySTJqQnh/+lX7DsoIYiha0H/1ulzY
 /dMtuuE++2AcOWrBtQulHKhrY9XVY=
X-Received: by 2002:a05:600c:8b28:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-488cd0201d5mr44207495e9.16.1775724579380; 
 Thu, 09 Apr 2026 01:49:39 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d289asm64739862f8f.19.2026.04.09.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 01:49:39 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 10:49:38 +0200
Message-ID: <20260409084938.28685-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409081401.2060709-7-martin@strongswan.org>
References: <20260409081401.2060709-7-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775724579; x=1776329379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjDxBUDOxPK5v5YzCOKdzPNbKrUncgT3tWx/mVMcV+A=;
 b=SD2C1KWlJGUVJ6bxiPq18nWaxlle3z10bfnRp8MxaYNsYzSRfMoKXdD+4gaT4metRh
 7SBgb7P8JxQ8M67PWL27oXT9jpVEZ21T2Y2N1guWZrLrMwU4vE/KrG6lApSZOT48mZG8
 uUp8oH28W1JxLtW+VaPtEkcH6pPXTYcEDcWcI2v9UC0kRI1ejbvCBCsw/bpgbLA7+tMs
 GdvByh5cxWVKx9sNhovapJ3/WBUXTk1uhBedPgwvwhXwtMI85ol5maV/vYJUmFjkpoay
 xJP4Hf2+bYOOUbqhS7U7KWgzUTUTHxVy5X7anxMF76PtRhNk19ZTh2qWkoA3iZ/ojsbb
 E4dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SD2C1KWl
Subject: Re: [Buildroot] [PATCH v4 6/6] utils/generate-cyclonedx: generate
 vcs externalReferences for source repos
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

Acked-By: Thomas Perale <thomas.perale@mind.be>

In reply of:
> Some packages do not have a http/https download URL for a source tarball,
> but are acquired over a version control system like git. If so, add
> externalReferences of type "vcs" for such URLs.
> 
> As most git repositories use a https:// transport that may not indicated the
> repository type, add a "comment" due to the lack of a better mechanism in
> CycloneDX.
> 
> While the hashes are calculated over a tarball created locally, it still may
> be useful, so add them for "vcs" externalReferences as well.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 30 ++++++++++++++++++-
>  utils/generate-cyclonedx                      |  8 +++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 84f94f050760..77690b1b98bc 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -147,6 +147,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
>              {
>                  "source": "foo-1.2.tar.gz",
>                  "uris": [
> +                    "git+git://git.example.org/foo",
> +                    "svn+https://svn.example.org/foo",
>                      "https+https://sources.buildroot.net/foo",
>                      "http|https+https://mirror.example.org/foo",
>                  ],
> @@ -160,10 +162,20 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          self.assertEqual(
>              foo["externalReferences"],
>              [
> +                {
> +                    "type": "vcs",
> +                    "url": "git://git.example.org/foo",
> +                    "comment": "git repository",
> +                },
> +                {
> +                    "type": "vcs",
> +                    "url": "https://svn.example.org/foo",
> +                    "comment": "svn repository",
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> -                },
> +                }
>              ],
>          )
>  
> @@ -183,6 +195,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  {
>                      "source": "foo-1.2.tar.gz",
>                      "uris": [
> +                        "git+git://git.example.org/foo",
>                          "http|https+https://mirror.example.org/foo",
>                      ],
>                  },
> @@ -194,6 +207,21 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          self.assertEqual(
>              foo["externalReferences"],
>              [
> +                {
> +                    "type": "vcs",
> +                    "url": "git://git.example.org/foo",
> +                    "comment": "git repository",
> +                    "hashes": [
> +                        {
> +                            "alg": "SHA-256",
> +                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
> +                        },
> +                        {
> +                            "alg": "SHA-1",
> +                            "content": "2222222222222222222222222222222222222222",
> +                        },
> +                    ]
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 382d91ce55af..4166abd9ff04 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -325,6 +325,7 @@ def cyclonedx_external_refs(comp):
>          dict: External reference information in CycloneDX format, or empty dict
>      """
>      SOURCE_DIST_SCHEMES = {"http", "https"}
> +    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
>  
>      refs = []
>      for download in comp.get("downloads", []):
> @@ -336,6 +337,13 @@ def cyclonedx_external_refs(comp):
>                      "url": f"{uri}/{source}",
>                      **cyclonedx_source_hashes(comp, source),
>                  })
> +            elif set(schemes) & VCS_SCHEMES:
> +                refs.append({
> +                    "type": "vcs",
> +                    "url": uri,
> +                    "comment": f"{schemes[0]} repository",
> +                    **cyclonedx_source_hashes(comp, source),
> +                })
>      if refs:
>          return {"externalReferences": refs}
>      return {}
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
