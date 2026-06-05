Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0146CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A017A61106;
	Fri,  5 Jun 2026 12:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIjZh3BmDOWH; Fri,  5 Jun 2026 12:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF25C61103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663835;
	bh=MqVhBRkG475ZF/IWZVKjVSTt0eZHyFKH+9vdbKH/86s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GmJ+xAlTcLoF+QkTWHpoZrOVBSrXat7CeXixVQcWKqLNP5KQfvzJ604rYI76ppr8F
	 df1pydFddyYNaJ8ckVcNbsHdAuSJTPUxKPzKk2lNjq1zARuZpr3pMacK6V0mMl8uBl
	 Ni+c4lxWvQGuYW8uHB76RwA6X2KAb4hCG6X9hHxBBkXiAKvKD9dJdc4kU/thFkSCC+
	 1bOep29+nFLyIn14rmKGCDZbPBIXbBs9c/ovGCXzFmRGaNexuml6wuBfj8RW+KuQ7Z
	 HNhE3b8NKVJt5uKImKs39MNBwNLD9al50lrRgw/1IY9a2Ruwlke07Ctz7Y8uQL4Kp0
	 vHmWECneDeCIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF25C61103;
	Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2245F388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1965D4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FiFBzSu8O97 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04B224037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B224037E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B224037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so1457514f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663826; x=1781268626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oloIlIa3ImOb8aR10WO6g94X12zEHWFfLZJZK4TnZGs=;
 b=hg6QP8UWxUas4HWM2MZLE726k3P5KQ8Dox4P48CBSzT2IzSiMUt6o7uvbPMdNGzjQ/
 pyHupLeCx2YgIr82KwYh4bEvir9DYjHJDWGLZ0q6vul5ECvmOv5jXSKKLLiFYU8BXzCb
 KVFApK7NzscCrJioMB8HEiXg9vMwlAN1d6N2hTSt1iq2hmqogpDiwEppcS+12lGaJlLb
 HmVgVKqr0QQ5s2isWkfFXApZVH8doKuhl2zuEm03PNRSEkMn+AKQkGuRpeeGcLfBuuEf
 xQ8oCehCVuTwGdEPvf502i/APl3EboE/MbujmSE5b4rK9eeb1K9BP2Sfx/RYhKhZ210N
 1tJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9lXHVENlSVksBIDqD0m8EF67/r+1OZ9EDiwuy4nfpFs1GokQKxEDwE+BFMSX18y+hSa2KHhAlMs7w=@buildroot.org
X-Gm-Message-State: AOJu0YweU1PPITPgOS7KbgDLFFF0E6RqzK3kiy/PLu3Ji/U3s9+tEzUC
 10Fhf3jeydo6eIV+wlgpEk0KgiPO1+ebg3TUKJ1dP36BE4oxXbo9K6SZDGU6wT+GjvU=
X-Gm-Gg: Acq92OEvoc+CdRUgPASSUVd4OJioM/XrksV8xfTWh99d4vPjeCSlNdyk41gL3S4eRlq
 owvHcUkeHWhmvBjqf5t0EqptSCthboG6nxMNWiNAl2HcMVxKhdIDM+3gfpqDM7iVQuMF42KduUF
 BqQdsyS1W30wpald0XftWWWnuQeJTiOGswK5X3bHuNl3obnjoF2+gbO4WsF4HElGEitCPI3q6kn
 0tC+CM5XfZ9l5DnNohc2OJGsuoawHkBLydQJhefNtQmd7bWRweTQp3igq5386LZQQ6m6gs0LKRb
 t5eS6AY1x6JxtdVUI4nH8P1up7VcTOJvIWt7F0q1q6/EnJILe889QzXqpbaJaN96Kp2A8qhvk70
 FchAunXhwxJC69ja429RjNuaKFmbc63nNt/1b/RIfL99c8n9haGJlCWn1TKdgf5wOD+Xb7BqryL
 jCBsr48t+niGSw490qfRycxuTojg==
X-Received: by 2002:a5d:40c8:0:b0:45e:f4f7:7cad with SMTP id
 ffacd0b85a97d-460306403d4mr4626500f8f.39.1780663825890; 
 Fri, 05 Jun 2026 05:50:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm25275277f8f.18.2026.06.05.05.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:25 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:25 +0200
Message-ID: <20260605125025.273418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-3-martin@strongswan.org>
References: <20260409081401.2060709-3-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663826; x=1781268626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oloIlIa3ImOb8aR10WO6g94X12zEHWFfLZJZK4TnZGs=;
 b=cRc4TPYYxThmBOw/djNsT0ApjcAD/wgglnBzXde4wvj+/W/9MjiGjDsOMjeFiaD3Pe
 dbUWYIkvZGaOFbX4/6aYQX4yfwLt+4/nifMojKhs+YpZ8XBuzAFSvZT2Xq6MZGoQ6NHg
 HrZEg9HEXXfQx6TfTmYb0tsLECxa5hIpEhphIDjaVpt+OYwepai3N2gV0wB78+4XA6Lp
 21n+lVnD7mlrNH+kJpfc8d3A1pir5binhqTbO44teE/KHVN9mHOwfjbMc0xFbCY9GVZc
 oztnIwOQEbSEkUOmstecA9QVlv6i3utV6C0ALzhEhoHbsiDp8PY/sCNpoZinxkVC0AAO
 NGdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cRc4TPYY
Subject: Re: [Buildroot] [PATCH v4 2/6] utils/generate-cyclonedx: remove
 indirect dependencies from root component
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

In reply of:
> Commit dc4af8bfa979 ("utils/generate-cyclonedx: use direct dependencies")
> removes indirect dependencies from any listed component, as required by
> CycloneDX. The root component, however, still includes indirect dependencies,
> as it just takes the components from the show-info output.
> 
> Fix this by collecting all component dependencies, and then filter the root
> component dependencies to include direct dependencies only.
> 
> Signed-off-by: Martin Willi <martin@strongswan.org>
> Acked-By: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../tests/utils/test_generate_cyclonedx.py    |  3 +++
>  utils/generate-cyclonedx                      | 21 ++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index bfe5eaf054cf..bf1b8e099bf9 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -129,6 +129,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          bar_deps = next(d for d in result["dependencies"] if d["ref"] == "package-bar")
>          self.assertEqual(bar_deps["dependsOn"], ["package-foo"])
>  
> +        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
> +        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
> +
>      def test_virtual(self):
>          result = self._run_script(["--virtual"])
>  
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 35198a47cfdd..f4d5afd847e5 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -385,6 +385,25 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
>      return list(deps)
>  
>  
> +def br2_root_deps(show_info_dict, virtual=False) -> list:
> +    """Retrieve the list of direct dependencies of the root component.
> +
> +    This function returns all components that are not a dependency of any
> +    other component.
> +
> +    Args:
> +        show_info_dict (dict): The JSON output of the show-info command.
> +        virtual (bool): Whether to resolve virtual dependencies to their providers.
> +
> +    Returns:
> +        list: List of direct dependencies of the root component.
> +    """
> +    indirect = set()
> +    for ref in show_info_dict:
> +        indirect.update(br2_parse_deps(ref, show_info_dict, virtual))
> +    return [ref for ref in show_info_dict if ref not in indirect]
> +
> +
>  def main():
>      parser = argparse.ArgumentParser(
>              description='''Create a CycloneDX SBoM for the Buildroot configuration.
> @@ -447,7 +466,7 @@ def main():
>              cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
>          ],
>          "dependencies": [
> -            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
> +            cyclonedx_dependency(args.project_name, br2_root_deps(filtered_show_info_dict, args.virtual)),
>              *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
>                for ref in filtered_show_info_dict],
>          ],
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
