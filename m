Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517A3FD0652
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 08:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B0E406F7;
	Wed, 11 Mar 2026 08:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evX_X7lq9MgV; Wed, 11 Mar 2026 08:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F9D406FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773217126;
	bh=zyK2cG75WUK/cXVieB0sIawwki/91H3N4GEJd+1iDzI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ef3xLgdnGpUDEKO0nRcGb5FAPWn5rwddKzonLO79HZvBhmdY2oUGGuFP1rlr80Zof
	 5afXJcl2BwHbKwvLOVhlZU3fz3p+moGrBrYSQ332GPb7wUUgE9qjEc7bNvfNZO5Bqq
	 xTPX8UVIDR4/qJfsdIKWN4r1RR0EzjU2dleFdxZhocpoViywRvRUFVOxKra8td3YvA
	 8js4zoRKrcqIk+1R+ysCew9txRwLyZH7mv+2Jea5dhPSWa93Gx7mpsoBLso+IjO14R
	 rCkOzyqN3wcc1AsSf5HUgqDKnFZUaQNS+8kHNMjVvuehJ5SqiRIw4EHiwSojB05foM
	 wWJSyTQlXwcBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F9D406FE;
	Wed, 11 Mar 2026 08:18:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E9CD33A
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 08:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3428484367
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 08:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdQvpai-IdFd for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 08:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A62284361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A62284361
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A62284361
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 08:18:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439bc14dcf4so519670f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 01:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773217120; x=1773821920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=julR9mbqjOWdlLmdO6g8rMTjtDVfZ2Hoi+R49Uuii48=;
 b=wobxPffblT6fhnQ5SIJCq/tCwCEzAzSiraK5HprsI4IC0jWWsOw9B9ktlUznnWY+7k
 fkuPNrhhF4LC1YpWE7t6rLlSy9OvQvwfC9OKpsUT09TDSYUU+cTHdAgjkoNVeK+PROGL
 fJxIPKlJJSfgiKivnefblvvOBqEu1FjW/xaTSSk0lBOzmWe/vY4zflLiQI/VrVvHKOzf
 MGJKi+5XUDfg4y1B+eBIX6yZ27AYS/xY0/nfh9/L7xnLiREtooBXKsrQyFrT+lpfab18
 6p/64IG4+YGtZQipbENfjyd5NB/+n2U3uvlIxRuaxcGXYcPorjjR4i+r59MFMWvzn8Dk
 5Pjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTFoRrzK3N4iKzzu4fB4ar2GZwHg8ghjOrMCPF79xuEdLzBSS2qafSyC/uROb9eGMxuqyViMtPsOY=@buildroot.org
X-Gm-Message-State: AOJu0YxwDLG/pOoIneywWqufUfUZWF0pOxbwh4En42tMFk92PpgcXyOG
 7yr+1NbT9CThXQF/ESnpD4TbjcshPvfYCy0DXxaBt4ZgZx43jSBbgAkKmNaklSp3lT8=
X-Gm-Gg: ATEYQzxRiCFW6tvjm90CCk2NOpAInqTAWFwsTDZjkJSry9nSj45aekwPyannUMptOlq
 JxTiUDfKYe4yYoHxur5IU77ADvlzq9jZmxqtAjtTmetEy/f70XbOzorS9fn5Hl8fi+OOD+NcHoD
 hz0Vcd+mh8ac/5KzuGx+xLEclkZ45J4QEuBnjuXDvTLxswBgXxE/LE72gjqC8u3TIeChBcmyvJf
 hlk6VD82qUbG+FzcOjVU85zC6iRJ3z3KBIvSmU/MKGg1mWG3m3oK9eGyZXnm+EJNxPZPJB4dKBY
 xpEG6KdQkH5qa28oSu9+AENLjJ3b0lABkR96iYWw+v24mJGUMFVI4/kq5Z4PsTc4B7dNm7waA3S
 Eemba9U4d0V4O4NU9iAR0p3lLLkvFOaGl3v56SE6rfZsSwP6/hNmjQNLUe5kVolNkXLU0ECcOc7
 X+FT9Sa1lPMklDtV0=
X-Received: by 2002:a05:600c:5298:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-4854b291dc2mr22983475e9.15.1773217119840; 
 Wed, 11 Mar 2026 01:18:39 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854a1a4444sm21385805e9.0.2026.03.11.01.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 01:18:39 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 11 Mar 2026 09:18:38 +0100
Message-ID: <20260311081838.23403-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305115752.1861153-9-martin@strongswan.org>
References: <20260305115752.1861153-9-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773217120; x=1773821920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=julR9mbqjOWdlLmdO6g8rMTjtDVfZ2Hoi+R49Uuii48=;
 b=KvunfRSc6A7CxWcKqUzQnEIUdnylj5MtnLvNk4hU1IlGXQvh3BuvoaBvyMWlQ2KEJR
 r2IQJ5+CpN5wyUkWDkcDsNpYswMxH92iXKXqYxBhMNb3KEmA7AqTtBWQOepSkWPDNEzq
 myt3cS3D2lhYvqtYHIvYxI1oQebGxRlRfyNjQixtCMP9k2opSm94PgtYAUAUzQ/ryc0F
 SmQ8WF18OpbdKTKqLtyvp8AvG3gJbVXutImV5NHqim6OIb7wUvpd5z2bdB5emNUeiau0
 gXif6z8bamZFKZGGdb7va5Vz8WtjjcMF7qUzyzcz92yDeBOSayN7trZEXLaulesXOwiG
 /7fA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KvunfRSc
Subject: Re: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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

Hi Martin,

In reply of:
> BSI TR-03183-2 5.2.5 [1] lists the "Hash value of the source code of the
> component" under "Optional data fields for each component", and as such
> CycloneDX "MAY additionally include the [...] information, if it exists".
> 
> As hash values are available in Buildroot, try to open package .hash files
> and read hash values for the source distribution. Add all found hashes to
> externalReferences source-distribution entries.
> 
> [1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>

This would be a nice addition and would be indeed needed. Thanks for sending.

> ---
>  .../tests/utils/test_generate_cyclonedx.py    | 43 +++++++++++++++++++
>  utils/generate-cyclonedx                      | 37 ++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 9116c0ec844b..0e567cb32be9 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -340,3 +340,46 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  }
>              ],
>          )
> +
> +    def test_external_references_hashes(self):
> +        with tempfile.TemporaryDirectory() as tmpdir:
> +            pkg_dir = Path(tmpdir) / "package" / "foo"
> +            pkg_dir.mkdir(parents=True, exist_ok=True)
> +            (pkg_dir / "foo.hash").write_text(
> +                "# source archive checksums\n"
> +                "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
> +                "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
> +                "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
> +            )
> +
> +            info = self._make_show_info()
> +            info["package-foo"]["package_dir"] = str(pkg_dir)
> +            info["package-foo"]["downloads"] = [
> +                {
> +                    "source": "foo-1.2.tar.gz",
> +                    "uris": ["http|https+https://mirror.example.org/foo"],
> +                },
> +            ]
> +
> +            result = self._run_script(show_info=info)
> +
> +        foo = self._find_component(result, "package-foo")
> +        self.assertEqual(
> +            foo["externalReferences"],
> +            [
> +                {
> +                    "type": "source-distribution",
> +                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> +                    "hashes": [
> +                        {
> +                            "alg": "SHA-256",
> +                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
> +                        },
> +                        {
> +                            "alg": "SHA-1",
> +                            "content": "2222222222222222222222222222222222222222",
> +                        },
> +                    ],
> +                }
> +            ],
> +        )
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index fcf6b64470ad..e0318d07ef88 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -369,6 +369,42 @@ def usable_download_uris(uris: list[str]) -> Iterator[str]:
>                  yield parts[1]
>  
>  
> +def cyclonedx_source_hashes(comp, source):
> +    """Create CycloneDX hashes for a source distribution.
> +
> +    Args:
> +        comp (dict): The component information from the show-info output.
> +        source (str): The source distribution filename to look for in the hash file.
> +    Returns:
> +        dict: Hash information in CycloneDX format, or empty dict
> +    """
> +    mapping = {
> +        "sha1": "SHA-1",
> +        "sha256": "SHA-256",
> +        "sha512": "SHA-512",
> +        "md5": "MD5",
> +    }
> +    pkgname = comp["name"]
> +    if pkgname.startswith("host-"):
> +        pkgname = pkgname[len("host-"):]
> +
> +    hashes = []
> +    path = brpath / comp["package_dir"] / f"{pkgname}.hash"

By using this path you will miss some special cases for the hash files. Example
the package `lua` store its hases under the <version> sub-directory.
You could also store the `.hash` files under the GLOBAL_PATCH_DIR (see
pkgutils.mk & pkg-generic.mk).

You should first expose the hash files from the show info output:

```
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..1e172a44e1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -183,6 +183,13 @@ define _json-info-pkg-details
 	],
 	"redistributable": $(if $(filter NO,$($(1)_REDISTRIBUTE)),false,true),
 	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
+	"hashes": [
+		$(call make-comma-list, \
+			$(foreach hash,$($(1)_HASH_FILES),
+				$(call mk-json-str,$(hash)) \
+			) \
+		)
+	],
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
```

The problem I spotted with this method is for packages without hash files this
code snippet will still report `packages/<name>/<name>.hash` even if the file
doesn't exist.

Then parse the content inside the CycloneDX script like you did.

> +    if path.exists():
> +        with path.open() as f:
> +            for line in f:
> +                line = line.strip()
> +                if not line.startswith("#") and line.endswith(f" {source}"):
> +                    alg, hash = line.split()[0:2]
> +                    hashes.append({
> +                        "alg": mapping[alg],
> +                        "content": hash,
> +                    })
> +    if hashes:
> +        return {"hashes": hashes}
> +    return {}
> +
> +
>  def cyclonedx_external_refs(comp):
>      """Create CycloneDX external references for a component.
>  
> @@ -385,6 +421,7 @@ def cyclonedx_external_refs(comp):
>                          {
>                              "type": "source-distribution",
>                              "url": f"{uri}/{source}",
> +                            **cyclonedx_source_hashes(comp, source),
>                          }
>                      ]
>                  }
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
