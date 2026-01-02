Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE05FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC7260BD6;
	Fri,  2 Jan 2026 15:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3sCwWKpH4-q; Fri,  2 Jan 2026 15:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599F260BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767369275;
	bh=o2GU13SfLM1TZXlsB13IPYh2IU0d0QWHVipv5gZpp/s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HAFVhqaknX55lkYTHYXeZtnvgqQ+7iv2zV/tVbCvX87m9bAsKptCHdLAHFsu21XM6
	 82ovwmdcsXsEHSl9r5DFfQ6aCrsNUJ+TAAclhOjkkc6BPbEWNkcFLjfwnB4vXfm7xe
	 b6mK9Kd4Q8sqfvmw1ZPCoUxRcXMPvhtynWLw/WBLbvixmlIZjAykD9Rjct/9wn9ja8
	 04wXxt6cI3RumGVfv6aHSIVsZeYiWONEWN8zFeW7XW/yHG0fokqjWhSCoy5UuY+Jqk
	 I0ZSbN4tnYpJMtMI2MxcWlzM7S2rNpyWTq/UntQdUL07di5YmMouhqhX5q7M9xTBpR
	 TE4MN/n4degNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599F260BEB;
	Fri,  2 Jan 2026 15:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6265D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1E740612
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szevwsdnwtLm for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:54:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76C7A405EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76C7A405EC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76C7A405EC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:54:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so78573625e9.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 07:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767369271; x=1767974071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VczciQ3BO2UYGuO0zHxUMKCZecAyuB1BhYFyTovlltA=;
 b=E8/WAaVv13cBb8Im0KiblHqN8JEahunJn06lRWWXyl8AdKv/QR1H1sK6/wXDsUIGcy
 CkkXdqGJYoPcLoC4+jhEc+dXcMuTeC8GebwQ6CUtvo98N/3Loe1F+00uSPdbiz0eOS2j
 LDac4tctsjlrNLQUt9KMVa6mA5bRy+PL7ZBPi6scw5Dc9qArvvdMnYiT6avblWevssWA
 4Yx0O9xRBGiiqpIbl9FpzR0NQYrZN2YwpvlA1UC3LpYk5jDSyYNWjx/LIRaHKl+R3Wb2
 Qu20c66axmOHCOhFCuAPuPwewTXuYGPeBeG2s2XE2ZbffdLFxJ97c+6mTm2kI7fYH4Z8
 aaqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXsdD3ualIHRLDwIiwx8SeZnyuBpvFhbTvvdguRNpPs5q5voBBEF/s7jmMtXVENm+8DwMsx4McoDU=@buildroot.org
X-Gm-Message-State: AOJu0YxJCUm4Kcta/C2snkM0ulma7JmkMRZSNqkf1ZSZwY7m5JLYLWVJ
 g/WhUyS6Fjj0BB/csAW0GkbCWaU3b3jYPooxTaqWXrxsh/91IZE/SQFxfswbI7xU29cnZLHHjiH
 EIQJD9+Y=
X-Gm-Gg: AY/fxX6wMoRA27AAFhrXqZi2bh+WUbaweu/r7BdKYCenbe9N1hJvXgzJjNwPBuo/nT2
 tTrlV4xLdb6fiUv8K8B5Q171sHxWI4e5oP5FGekLy0Cce7Gc0Gam+EHjNhLQwFOBq/AYvaX0AT4
 3BbkfrQEIaGQWEygiPqRsbgWEqrsBNSxh7zpDS39xL8wCAMt50DaIBymJ6CpvRD73BldMOMQdNd
 X2dXq9kZCVaJfkw7TGawsbYWAXAGWQ/mDgi6M37KSm0jP3wAN7gKJbk17wPhEJzmRcW9iJlugqe
 ccN4qGxjgmTlVpm++nB7+qWD1bHn1I8fWmNBKVVvkoohYaNT44KFyXZ6qMY+7ItIyKiZA65ggDK
 V5XMKf2cuLni1Ekw/amgSMwSNpW/tMj2NdXHqJ6B0vNR9kXFYmWyGkYd1u+t2CVXIwB35R5wx43
 0E71e70g9TWTfltW/B7LMBy3atyqKHKubn6Jo=
X-Google-Smtp-Source: AGHT+IFvW7ya/DEnngrWunKW/zc//Ew8+F5+9/2QV0qp9Q/Aya8GwtRHOB5qSsu/EaMwGNfUlL7BUA==
X-Received: by 2002:a05:600c:6299:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-47d1959ae49mr577708375e9.35.1767369271110; 
 Fri, 02 Jan 2026 07:54:31 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19346dfcsm897424545e9.1.2026.01.02.07.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:54:30 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:54:30 +0100
Message-ID: <20260102155430.708782-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102150757.1480511-2-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-2-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767369271; x=1767974071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VczciQ3BO2UYGuO0zHxUMKCZecAyuB1BhYFyTovlltA=;
 b=Af6J0rvKQwCxqUa9jljCOho2j3S02hP2c7sb4hamBySRuc8rkTdZfdcKoUeIYaGB6i
 S051m4F34qHc0WF0vrMhMyJ/CweAGU8iOmeDoFWjxgB0fVKn1AK3zjfyCZoz6MezKT6E
 hEHN6b8Ne1iHq9d6t8dTMBJEfocp0vECx6WqqH6QXRwekfVF6axYnoy/V9Vk9t6kw3f5
 McBs66zz6RAFcroGaoAMbeay+vtvO60YjvrHa5pSd6TQjqb5Pq6G5zFh0bUXIMrkvDr5
 EiHxSUk2eEbEU/p4QSDXjDf4O/qs1Ttc5747WOHwgrSora8YHh0ffSK1QlbkqVCtpywM
 KUaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Af6J0rvK
Subject: Re: [Buildroot] [PATCH 2/5] utils/generate-cyclonedx: add diff
 reporting for package filtering
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
> - Adds new function to compare original vs. filtered package dictionaries
> - Lists removed packages
> - Introduces --print-info flag for verbose output
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>


> ---
>  utils/generate-cyclonedx | 43 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 29c73f3616..5de6afa39a 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -362,6 +362,43 @@ def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
>  
>      return deps
>  
> +def print_dict_diff(original_dict, filtered_dict, verbose=True):
> +    """
> +    Displays the differences between two dictionaries.
> +    Shows only the keys (package names) that are present in the original
> +    but missing from the filtered one.
> +
> +    Args:
> +        original_dict: Original dictionary
> +        filtered_dict: Filtered dictionary
> +        verbose (bool): If True, prints the difference. Default is True.
> +    """
> +    if not verbose:
> +        return
> +
> +    print(f"\n{'='*60}")
> +    print(f"Difference between original and filtered dictionary")
> +    print(f"{'='*60}")
> +
> +    # Removed packages (present in original, absent in filtered)
> +    removed_packages = set(original_dict.keys()) - set(filtered_dict.keys())
> +
> +    # Kept packages
> +    kept_packages = set(original_dict.keys()) & set(filtered_dict.keys())
> +
> +    print(f"Statistics:")
> +    print(f"  - Total original: {len(original_dict)} packages")
> +    print(f"  - Kept: {len(kept_packages)} packages")
> +    print(f"  - Removed: {len(removed_packages)} packages")

This would break the usage of the script. In general the `generate-cyclonedx`
script is meant to be pipe into different scripts or files.

By default the SBOM is 'printed' into the stdout output. While generally the
messages that are not part of the final SBOM are outputted into stderr.

While stderr may not be the best fit if we add 'debugging' messages, I think we
can create another debingging out defined in the arguments like we do for the 
'in' and 'out'. But by default it should probably still be stderr.

Do you want me to send a patch for this ?

> +
> +    if removed_packages:
> +        print(f"\nRemoved packages ({len(removed_packages)}):")
> +        for pkg in sorted(removed_packages):
> +            print(f"  - {pkg}")
> +    else:
> +        print(f"\nNo packages removed")
> +
> +    print(f"{'='*60}")
>  
>  def main():
>      parser = argparse.ArgumentParser(
> @@ -377,7 +414,8 @@ def main():
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                          help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> -
> +    parser.add_argument("--print-info", default=False, action='store_true',
> +                        help="Print dictionary analysis output")
>      args = parser.parse_args()
>  
>      if args.in_file is None:
> @@ -391,6 +429,9 @@ def main():
>      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                  if (len(v.get('downloads', [])) > 0)}
>  
> +    # Show differences between original and filtered dictionary
> +    print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
> +
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
>          "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
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
