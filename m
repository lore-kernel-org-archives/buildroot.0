Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E2109C027
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 14:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA976821B7;
	Wed, 25 Mar 2026 14:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5sapfoCOysl; Wed, 25 Mar 2026 14:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A3D81F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774449808;
	bh=R7C2bMNWMG9VM+/WukQ90fuSsvAkRcxVkoKNPTMZsl4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CA6jt1noRPzZKD09NHLKIwyBQGNwFK8V3ope2hBPtSGcZf7TK8Qtxz9/NQNI7JK0h
	 +x3oXARuIt7/4t+an5cYJSD3J2JnjO9jh9TfYzycGslx4DvAq6qUSqUpYbS/+wZqhD
	 wcq4vArfnoIjXE2Pzvr1KXNaSOGREMqv+wrPWl5W34p8m53DGzrrHLA/Q2GE+iM1tB
	 gumCxYuVqUDDOjquHJp8zuEA1QrS9L9M3istRDuWieYXQliuQeCxdpmX3NBMB1V3wS
	 TP+mII6qOrW7I4YQwpfmQNW6z/QX3GOF9kGo1orZlbJ03WtS1avZp/bb2BmrlhIqzL
	 X6VOc+eXKwlHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A3D81F36;
	Wed, 25 Mar 2026 14:43:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DABF5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E80381F36
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fBS7pPGcPnz for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 14:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4846481D19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4846481D19
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4846481D19
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 14:43:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-486fe655187so64065365e9.2
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 07:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774449803; x=1775054603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zo9h7LpVoD/y/FSI5GEsIQVlBlEi/Flk60MAPkC51T0=;
 b=Da2gnKwsXQBsfe0WmPojjQcQnJtfeTLAUkv8jyosakp8C42c/BTpRonmzTHuGF0Dzr
 FdvyXuRXymq+8HBjX6G5+oNofcE+ZtzuBJw/IgUnL0qk4xXoiwYdqlEyXAjTZNvDkIKo
 7kDwsYNQLV2YrPM9Z3QANfoPSwURuxySkUISAo3vm4gcTyxnLMS2+Gpb1C6Zt1xzvhRn
 wq5F/CCCbYpNyfnd8lAAHozBPiaDDkv2NAAKwGOIP0V9Q+bLXiERL4uCS2Dew+rGqt59
 2De17mvua+3fVUMQDNEESMXHB91L4TZoE1bk/D3CE3D2I2yi6I2ShTCw0JV/f4maSTVk
 xoNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXigYJmAGJfXd5WF3bi/0wUugKa+rEpmaSzfE733naC9vDr6hT0SsXhz4w6bNV7liixL1tnltCrV0=@buildroot.org
X-Gm-Message-State: AOJu0YyLa5Faxdf1RpokyLO47Wb/rPyAAmOgAcfhbo9SuIgFKjzP+S4x
 uET8Hpa/L0HZ4akQG5zE+yWZCxW5aYS4hjLnTnyIm7vH16b7stc1cv957YiT1rPdwqI=
X-Gm-Gg: ATEYQzy9llMxjpUNOxAvq+7I2W2HNpEdZmGKIG6XFueJ8T+BdKsPL8EmJvmRnVhEgSU
 jbgwG1UzV3qhp1v1jMnq8Mjp0JXO2PvA/ewA0ILhekGtSOizYQbv0AKj7Tce/4y9eN6uPwuw9q6
 Hlkcu/rhZsq5towbzMyyhR/RMeU6Gz+8jn4Evg8YWqnqBzrJCV7l17TvcNc0vub6fBrKtGFDcAu
 FmgSb4HNRJqD/bp6Pd9zPhVYVqkwblu7X0QVqZrx7Zz+Fziii93my9ApOcwvZVzgXL513kDIhA3
 aOR37ThC9xujG20Ced2HUl/TQeb6BFnR0rnGWxCooChn+1s5djNbFlL8FzLR2uHlC1pZplTwdJV
 4TWYumu0L64ovdGhfpDrkZKa1H8Dw3ddrcQxLiz6xNdPGYmWN5f+K0CaZgE2EWrKAJoAc/LXyIg
 JlKK+XTbVvRcqeU8CROk1X/InEBzU=
X-Received: by 2002:a05:600c:4685:b0:485:2ce2:4c87 with SMTP id
 5b1f17b1804b1-48715fc3562mr61059485e9.4.1774449802979; 
 Wed, 25 Mar 2026 07:43:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf1c4sm189193f8f.23.2026.03.25.07.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 07:43:22 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed, 25 Mar 2026 15:43:22 +0100
Message-ID: <20260325144322.383432-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325133343.1008245-3-martin@strongswan.org>
References: <20260325133343.1008245-3-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774449803; x=1775054603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zo9h7LpVoD/y/FSI5GEsIQVlBlEi/Flk60MAPkC51T0=;
 b=bhU43Mge0L9gUnvtb7U8spHtuKqe7ZjFo5XRwchSbMFziamKefRMQp/zLwwvqirYcG
 wcOzZx86BL3TX91XCgHZtGECfRvjTu39/VI/6BsBoFbvmFSXatPqRIcJWomrTvzFKe00
 pU8HKadKBFMGI0uYB0RiyjSPnRApFPcCvDM3FnLJuGdQfN5mMq7DlCD4ozqLIFwgykaU
 ZDOXU1Oo/JKj7XPVcD5qOFMW4GG1gzHzpbywj6xuGuL777kYBU72EsaHgeAVI0bgdw49
 Qt/ib6ysfCsChd/oyGiOMnC9XxQ4renfnw1G57+4cJB+3rPD32lbFUcA2RJDcT8cHMQG
 tJZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bhU43Mge
Subject: Re: [Buildroot] [PATCH v3 2/5] utils/generate-cyclonedx: remove
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

Acked-By: Thomas Perale <thomas.perale@mind.be>

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

> ---
>  .../tests/utils/test_generate_cyclonedx.py     |  3 +++
>  utils/generate-cyclonedx                       | 18 +++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 20f67b48a7a8..9b041ffb61fb 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -126,6 +126,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
>          self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
>  
> +        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
> +        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
> +
>      def test_virtual(self):
>          result = self._run_script(["--virtual"])
>  
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 35198a47cfdd..70abd7af7c89 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -385,6 +385,22 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
>      return list(deps)
>  
>  
> +def br2_root_deps(show_info_dict, virtual=False) -> list:
> +    """Retrieve the list of direct dependencies of the root component.
> +

NIT: I would add a simple line of text that explain what the function does in practice.

"This function return all components that are not a dependency of any other component"

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
> @@ -447,7 +463,7 @@ def main():
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
