Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888C1CEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492C040917;
	Tue,  6 Jan 2026 22:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnR25OGyo3CR; Tue,  6 Jan 2026 22:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636BF40918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737712;
	bh=R4D4licCijNDkN2Xu+2QiSRbvFjXI9wKAFOA9cOXucE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k04Z1cSC5Mgz/I+xSpQ3ssRMASQ/uuUGKLblv/ZFZXKV/vLzP2yvNUIE2ApghW7H0
	 Pi3uwlqwGpI+8NntoUCP66O4jwCXj2XPjlRvX9hEyc228oQIXDL2hkiAwq6XCrN4wP
	 O5KamxgAzmqj1cxJwb/cAY8JAbQXIXDWmJ0k5wmFVXvqwl0zybVB7Vde0F41vABEwN
	 vWaRl03/M50XHjP2afWns5AttS6UHmuPvPKrglr6zerUo7emRYUU/g/uejxi1bHSLc
	 ucybF5aSVAQgvBoSmJXpDTaOWrmS3pLQWdoTftEihfOyrnnBaK/10wuhXm9zEzg/7m
	 9WJIstCzPLkow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636BF40918;
	Tue,  6 Jan 2026 22:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6216249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC5B181E4B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8jJls__QV2N for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F181481E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F181481E49
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F181481E49
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:15:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so9463535e9.3
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 14:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767737707; x=1768342507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dqsNezEWSQRT++El0da5U2/uRA+wwq4JjLbQ6hzYTK8=;
 b=sy2gqOQQuPvspmIgJj6gZUN8sLT82HVnRe8RqQix7Rw9M9gYcGohTuHgYhL9bzWGdO
 BYuoE0oR4wJOfvOPqGUnRj+Mf8k07dRBvq8fDAxd5oUudmexjPiy8BvdLQa8v76s7y3o
 9GQ+zRGeGqXsog6vfZDaDr8ungKakXCDUcKYN/JvgYVnkdONXUSdDhJVpdk5yYXDeJkc
 6MxANnCvNK2ftZQbQdhtUuH3DHhFnR0buYesW9Uj3Hm2iVfYgfsMqIfOETS5jn5FFMo6
 LGFoHZA2Ym2dXc9barG8WMs/Di20UaUcCnZ5ITil9ro4/EH38HxS8rWwNnn9l0qEQcCZ
 e3VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU80fRUwpue6Psq1UeFPE1irOU7XtU1cUjgm6vnUtiKCgjVt2S04V9xQhbXPD3bAft4XbPN9NfWtb0=@buildroot.org
X-Gm-Message-State: AOJu0YwtJPbzXWElXe06Z0oQ9vf9r7geneA5+x+lZ58pt2eVoyg9YhPH
 6xrfQ0027ehgXIjPT2cuHoFHL6KFUA+/1WvDqi1RXdVWz3KJTQdBGbP799PDeLKv5c/jkkS70ep
 BQQ9nzBA=
X-Gm-Gg: AY/fxX41Tn2YRU1eLhbJhDBXzRwOFKlJ4Kzs3pjA3uQwpxmMIDbisIZdKlqklU8saip
 8x9NOmFYjULuSRjp7W3t15HQvCIIWTBLg6kPhoLNENHlRg3YU+Q06LVXcM301LLvfTqjPJ3VMDy
 oQnDT9N+TTl/BRNBdIrhC3gQlEe6zuKw6thKcU4lpwq0k+2NonBy9zWhoJs6qvAAQ1t79t/i7bf
 oHPb8Om8Hyu9TBNqehFQxqSpJRodTn8QpoI05HIT7BzDu5Xyaq9/mMYc2tkqbnLQIl2c5fhK4/6
 aDoCzhaCMX2x+pqaNqdqCHL+wpjWcdOWIKI71J9FmHaXcZX8A/fUQWAVfQYRDyDKFwhk5xOgP1f
 QEEH95n/D4L9ytSKSGmyIHKfEeIj98Fu8d71+yWjNNCvZYDUfftwDKpwyn1W3WtoN5QNLsjIm7R
 S5FHHFxLoLOhooCn7Y5Z+JOa3v/It4a05D9iEguB9eKa8fDQ==
X-Google-Smtp-Source: AGHT+IGkNuopLCz36yuVBYFQ1fEhWhlMjxN/psmhAvIN6zcqnrJfG8HR4UB/iItwK7pxgCrsczByBg==
X-Received: by 2002:a05:600c:a08:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-47d84b4900bmr3466795e9.30.1767737706780; 
 Tue, 06 Jan 2026 14:15:06 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f9de53bsm30193125e9.2.2026.01.06.14.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 14:15:06 -0800 (PST)
To: Anton Bengtsson <anton.bengtsson@plejd.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue,  6 Jan 2026 23:15:06 +0100
Message-ID: <20260106221506.40473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
References: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767737707; x=1768342507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqsNezEWSQRT++El0da5U2/uRA+wwq4JjLbQ6hzYTK8=;
 b=f/3OiPVLkhfW65D3WzeH1v66aKAwmviuAKmHi9y0fdj15tHuPZ9rafDNlLIXQAlele
 hXtqLMZ0XamI2jXjrtOtdbzTGWhG8E0WO+12QUR3Nj+Ir7GtxK7BpVjEDhNwjzoXSzB/
 MCk/ErzxTzDfbdPhO/f3q+d+7E9OWRIvXntOfN0LW3zDVpaql98aRwprl6j/klbnNomj
 pqYRQpVQ31Tn5jHhdEvARTUGnF5jYsJCS5XT5ra4IR+pN2R6Ko7F64yCUviHNV1ZOiwE
 +mlJavFbBZl4CnrWP2/r9PPIagOI/eKQTrrAKUO2DPBT72Hr8rgWAEThlSwgmspWuViy
 RP0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f/3OiPVL
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/cve: replace
 distutils with looseversion
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

Hi Anton,

In reply of:
> The package 'distutils' was removed in Python 3.12[1] and looseversion[2]
> appears to be a good drop-in replacement for distutils.version.LooseVersion.
> 
> Also added inline script requirements suitable for uv, similar to the one
> added for utils/check-package in 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8.
> 
> [1] https://docs.python.org/3/library/distutils.html
> [2] https://pypi.org/project/looseversion
> 
> Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
> 

On my system I'm running python 3.13 which deprecated `distutils`. I didn't ran
into any error running the `cve.py` until now. The reason for this looks to be
that the `distutils` library is provided by setuptools on my system.

```
>>> import distutils
>>> print(distutils.__file__)
/usr/lib/python3.13/site-packages/setuptools/_distutils/__init__.py
```

Is there any reason to not use setuptools because I think there is an higher
chance that a user have setuptools installed rather than `looseversion` (I
didn't had it installed for instance).

Other than that I tested your changes by comparing the output of two SBOMs
(before and after applying your changes) that were passed to `cve-check`
analysis.

Both had the same vulnerability set so to me this indeed shows that
looseversion is a proper replacement.

Reviewed-By: Thomas Perale <thomas.perale@mind.be>

Best Regards,
PERALE Thomas

> ---
> Changes v1 -> v2:
>   - Added inline scripts requirements for uv                (suggested by Arnout)
>   - Added python3-looseversion to support/docker/Dockerfile (suggested by Arnout)
> 
> Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
> ---
>  support/scripts/cve.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index ba41762fa0..524f08f48f 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -16,14 +16,20 @@
>  # You should have received a copy of the GNU General Public License
>  # along with this program; if not, write to the Free Software
>  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +#
> +# /// script
> +# dependencies = [
> +#     "looseversion==1.3.0",
> +# ]
> +# ///
>  
>  import datetime
>  import os
> -import distutils.version
>  import json
>  import subprocess
>  import sys
>  import operator
> +from looseversion import LooseVersion
>  
>  sys.path.append('utils/')
>  
> @@ -190,7 +196,7 @@ class CVE:
>          by this CVE.
>          """
>  
> -        pkg_version = distutils.version.LooseVersion(version)
> +        pkg_version = LooseVersion(version)
>          if not hasattr(pkg_version, "version"):
>              print("Cannot parse package '%s' version '%s'" % (name, version))
>              pkg_version = None
> @@ -202,7 +208,7 @@ class CVE:
>          # version, as they might be different due to
>          # <pkg>_CPE_ID_VERSION
>          else:
> -            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
> +            pkg_version = LooseVersion(cpe_version(cpeid))
>  
>          for cpe in self.each_cpe():
>              if not cpe_matches(cpe['id'], cpeid):
> @@ -214,7 +220,7 @@ class CVE:
>  
>              if cpe['v_start']:
>                  try:
> -                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
> +                    cve_affected_version = LooseVersion(cpe['v_start'])
>                      inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
>                  except TypeError:
>                      return self.CVE_UNKNOWN
> @@ -226,7 +232,7 @@ class CVE:
>  
>              if cpe['v_end']:
>                  try:
> -                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
> +                    cve_affected_version = LooseVersion(cpe['v_end'])
>                      inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
>                  except TypeError:
>                      return self.CVE_UNKNOWN
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
