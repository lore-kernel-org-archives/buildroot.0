Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F1CCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 21:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D85613DB;
	Wed,  5 Nov 2025 21:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0dLEz7gvRcm; Wed,  5 Nov 2025 21:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB75C613A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB75C613A1;
	Wed,  5 Nov 2025 21:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59DEB4C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B785411B3
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OE_0jJhKgbFF for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 21:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53CE14043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53CE14043A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53CE14043A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:12:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477549b3082so2016725e9.0
 for <buildroot@buildroot.org>; Wed, 05 Nov 2025 13:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762377144; x=1762981944;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BlP/ZJQSNPUlykXjWezrKptz+E8yAJ9BjmwA6bf27gc=;
 b=LyrHeGGdFEQkS/D70Q4C4xhliP+C2AEPQM5ZZWIG0zIOnfAXejgTvBc9rI7JC+Jalg
 A2EXshfNxTWl0E1a+lwaFSGaluV5QEqXYNPS7L1qBLNnamGzwlHgdqeJen1T6+mGP7re
 yM6jEjE2pf9M57Y+B50qDHmr7IVYlnpkEnVzeGQAv5GQCmN2Fs6iei1zntsD/hB0NX0O
 1Lfcl/d5DwILlC4gi+29lXvh4CckjGCxXOKzbY13MUFswtJ5yGGzAzzAlqHbaEmpDwjK
 Ox3Z+hncOVni8fgaUBG/WE7GcqrWt290YJ6vDxa3fkgdWrMy66fTc1a/yCwM8WftxEc3
 xppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMFZIh4Oldg341x9JsMR6S4FZxxMp7uZBh/sOUyWjS4xlBRURLGr+8CuRc40FQ8pMkVynBgi1txps=@buildroot.org
X-Gm-Message-State: AOJu0YyXyU1D4c26+yDqZlPnSoew8Iw4tTVPxkDWeZh9j2iwYKf+20+2
 4eJbjVEqpix82Tjf+5FVTGwhiXDmG7E9GZJJ3SiM8dOWDVsEhp7uF8TYz56Xa392Xlo=
X-Gm-Gg: ASbGncsf6p6kMii4oUN9NfvXM54+RyoJ2s/Xval5fIEl9hE+Zp+LEiGMP7tDL8Hj5A5
 Qs0tCFTXR4HAZar4NjHZZcPOFrxjEZeDw7gZN3fs73kD9RnhSWlKY0jbNYpxg8HGCg1rAnnWA4g
 XY5trr9z5fVYV8NDvuon8jUpEahIFnpTDV1ux3M66e+GIr/au0TbQ8/rqCJc/AkqzzrOb8yPCSw
 xrnW1d3GvP3kJAH4tTXyIdWyMEEqEdqeC7tQlRmDXAA5Qiw51H+X1RQCatqtzwpqioB6Zxv9PJf
 w0ZkEUj/pn3d1tvyUGOYGl1noUvWOmWm3HzeDl92v877Me+4gnxgowcR7+Z1Za5TstoVqzJW47n
 ZDg11VmN90yZ0mkl66mnMt92sac+VrbONImpiQ7ohR8uCYORenRKFgQMpSqabpxqe4CaKzomY+E
 SUcpp9TkmEUmX4ygeksM4nywoNwDa/fhq29qCGJUY=
X-Google-Smtp-Source: AGHT+IEE9VIhggxVGAghVs9UO9WrgoNg08OlS2O4MYSWlEveYyEXnWjylTzY/pEEXRFx32zArXgFqQ==
X-Received: by 2002:a05:600c:3e10:b0:475:d952:342e with SMTP id
 5b1f17b1804b1-4775ce21139mr52963075e9.35.1762377143886; 
 Wed, 05 Nov 2025 13:12:23 -0800 (PST)
Received: from [192.168.4.20] (77.109.92.202.static.edpnet.net.
 [77.109.92.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477625e88fasm9096435e9.15.2025.11.05.13.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 13:12:23 -0800 (PST)
Message-ID: <a929ea98-de09-4cf8-8cba-7899284cad45@mind.be>
Date: Wed, 5 Nov 2025 22:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <20250830131036.1295970-1-fiona.klute@gmx.de>
 <c81bf292-22be-4bae-9ab0-8b38481463eb@gmx.de>
Content-Language: en-US
In-Reply-To: <c81bf292-22be-4bae-9ab0-8b38481463eb@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762377144; x=1762981944; darn=buildroot.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlP/ZJQSNPUlykXjWezrKptz+E8yAJ9BjmwA6bf27gc=;
 b=VQeMcBpvp1AuwbLEfjjJODhggCkvvI0+yDiPDMEWy0TUSyHWt7KxHmxxhIvu8kRjJ0
 B6Foe9gO63BE629wXvBc+UZucVo48/usd+vbiZQlAyke6rRh5dY9FvZg1U2ELWToq6An
 Pr6b3LZVHk2APdiUSs79T4HrVUBBKfJ/h998IDz/fTwp8wc+WO6lwxXXuy7qUvoI88hD
 ge8RIQk7vaASAHLNK6AGom7+vLel1guRRiMpGuWtu1XOQcd08QtShSU5yLhIlYmeboqx
 xJSY8BEUkDseMQHS9S4QGCXtp5gkzploFYHohC6FMUsWwRX8DUnm52UH/4QnvKUne35j
 MTTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VQeMcBpv
Subject: Re: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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
Content-Type: multipart/mixed; boundary="===============4055610106781685759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4055610106781685759==
Content-Type: multipart/alternative;
 boundary="------------41EJTFAG10XZa3gua0a5e0zt"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------41EJTFAG10XZa3gua0a5e0zt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Fiona,

Thanks for the ping.

I agree with the place to define the external, if I read the 
specification 
(https://cyclonedx.org/docs/1.6/json/#metadata_component_components).

> A list of software and hardware components included in the parent 
> component. This is not a dependency tree. It provides a way to specify 
> a hierarchical representation of component assemblies, similar to 
> system → subsystem → parts assembly in physical supply chains.
>
It seems to fit the external.

I'm wondering if the right place to reference the external isn't the 
'supplier' ? According to the spec 
(https://cyclonedx.org/docs/1.6/json/#components_items_supplier)

> The organization that supplied the component. The supplier may often 
> be the manufacturer, but may also be a distributor or repackager.
>
The 'repackager' part is what makes me think it might be the place. And 
you just link to the 'external component' reference in the 'bom-ref' 
property.

This is an open question, because I'm facing similar issue to express 
the concept of external (or yocto layer, or openwrt feeds) in CycloneDX. 
I think we could contact directly the people behind CycloneDX to ask the 
question. What do you think ?

Other than that to me this is ok to be merged.

Thomas

On 11/5/25 12:35 PM, Fiona Klute wrote:
> Hi,
>
> gentle ping about this series. Is there anything I can do to get it 
> moving?
>
> Best regards,
> Fiona
>
> Am 30.08.25 um 15:10 schrieb Fiona Klute via buildroot:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Hi everyone,
>>
>> this series adds information about external trees that were used in
>> the build to utils/generate-cyclonedx output. I think having this
>> information is important to accurately interpret SBOM data: External
>> trees may add or modify packages, and in that case the Buildroot
>> version alone will not be enough to precisely identify the packaging
>> that was used. To be able to identify which packages come from
>> external trees, it also adds a new package_dir field to per-package
>> data in make show-info output, which will be an absolute path for
>> packages from external trees.
>>
>> One open question regarding CycloneDX properties: I've added a
>> BR_EXTERNAL_TREE property to packages from external trees with the
>> bom-ref of the external tree, following the pattern of the existing
>> BR_TYPE. However, the CycloneDX specification recommends (but does not
>> require) registering properties with the CycloneDX property taxonomy
>> (see https://github.com/CycloneDX/cyclonedx-property-taxonomy). Is
>> that something we should do for Buildroot?
>>
>> It would mean registering a "buildroot" namespace for CycloneDX and
>> maintaining documentation on supported properties within that
>> namespace. As far as I can see, adding a section to the manual or an
>> independent file to the repository should work. I'd be happy to add a
>> document specifying the current properties (modified for the
>> namespace), but I can't speak for the Buildroot project in registering
>> a namespace, so I'd want maintainer agreement before working on
>> that. Either way it doesn't need to hold up merging, we could always
>> add the namespace later.
>>
>> Best regards,
>> Fiona
>>
>>
>> Changes v3 -> v4:
>> * Former patch 2 has been merged (commit
>>    b10f50399afcdc1cfaed06387b3f51d2dfa27ad0).
>> * Add an "external" mapping with external tree name and version to
>>    show-info output for packages from external trees (new patch 1).
>> * Use that "external" mapping and "package_dir" to derive external
>>    tree information. This removes the need for a separate input file
>>    with external tree info (patch 2, replacing former patches 1 and 3).
>> * @Titouan Christophe: I've dropped your Tested-By due to the major
>>    changes, of course you're welcome to re-test. :-)
>>
>> Changes v2 -> v3 (in patch 1):
>> * Fix merge conflict after reordering of metadata structure in commits
>>    6098cc45d64e9e7928f888b7cdf79533813d19c4 and
>>    9cbbc477626c433fe78614de9474f8446b7e2389
>>
>> Changes v1 -> v2 (all in patch 1):
>> * drop unnecessary default=None for "--external-trees" option
>> * fix help string for "--external-trees" option ("%" needs to be "%%"
>>    so it's not treated as a formatting specifier)
>>
>> Fiona Klute (WIWA) (2):
>>    package/pkg-utils.mk: include external tree info in show-info output
>>    utils/generate-cyclonedx: include external tree information
>>
>>   package/pkg-utils.mk     | 12 ++++++
>>   utils/generate-cyclonedx | 90 ++++++++++++++++++++++++++++++++++++++--
>>   2 files changed, 98 insertions(+), 4 deletions(-)
>>
>
--------------41EJTFAG10XZa3gua0a5e0zt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Fiona,</p>
    <p>Thanks for the ping.</p>
    <p>I agree with the place to define the external, if I read the
      specification
      (<a class="moz-txt-link-freetext" href="https://cyclonedx.org/docs/1.6/json/#metadata_component_components">https://cyclonedx.org/docs/1.6/json/#metadata_component_components</a>).</p>
    <p>
      <blockquote type="cite"><span class="description">
          <p>A list of software and hardware components included in the
            parent component. This is not a dependency tree. It provides
            a way to specify a hierarchical representation of component
            assemblies, similar to system → subsystem → parts assembly
            in physical supply chains.</p>
        </span></blockquote>
      It seems to fit the external.</p>
    <p>I'm wondering if the right place to reference the external isn't
      the 'supplier' ? According to the spec
      (<a class="moz-txt-link-freetext" href="https://cyclonedx.org/docs/1.6/json/#components_items_supplier">https://cyclonedx.org/docs/1.6/json/#components_items_supplier</a>)</p>
    <p>
      <blockquote type="cite"><span class="description">
          <p>The organization that supplied the component. The supplier
            may often be the manufacturer, but may also be a distributor
            or repackager.</p>
        </span></blockquote>
      The 'repackager' part is what makes me think it might be the
      place. And you just link to the 'external component' reference in
      the 'bom-ref' property.</p>
    <p>This is an open question, because I'm facing similar issue to
      express the concept of external (or yocto layer, or openwrt feeds)
      in CycloneDX. I think we could contact directly the people behind
      CycloneDX to ask the question. What do you think ?</p>
    <p>Other than that to me this is ok to be merged.</p>
    <p>Thomas</p>
    <div class="moz-cite-prefix">On 11/5/25 12:35 PM, Fiona Klute wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c81bf292-22be-4bae-9ab0-8b38481463eb@gmx.de">Hi,
      <br>
      <br>
      gentle ping about this series. Is there anything I can do to get
      it moving?
      <br>
      <br>
      Best regards,
      <br>
      Fiona
      <br>
      <br>
      Am 30.08.25 um 15:10 schrieb Fiona Klute via buildroot:
      <br>
      <blockquote type="cite">From: "Fiona Klute (WIWA)"
        <a class="moz-txt-link-rfc2396E" href="mailto:fiona.klute@gmx.de">&lt;fiona.klute@gmx.de&gt;</a>
        <br>
        <br>
        Hi everyone,
        <br>
        <br>
        this series adds information about external trees that were used
        in
        <br>
        the build to utils/generate-cyclonedx output. I think having
        this
        <br>
        information is important to accurately interpret SBOM data:
        External
        <br>
        trees may add or modify packages, and in that case the Buildroot
        <br>
        version alone will not be enough to precisely identify the
        packaging
        <br>
        that was used. To be able to identify which packages come from
        <br>
        external trees, it also adds a new package_dir field to
        per-package
        <br>
        data in make show-info output, which will be an absolute path
        for
        <br>
        packages from external trees.
        <br>
        <br>
        One open question regarding CycloneDX properties: I've added a
        <br>
        BR_EXTERNAL_TREE property to packages from external trees with
        the
        <br>
        bom-ref of the external tree, following the pattern of the
        existing
        <br>
        BR_TYPE. However, the CycloneDX specification recommends (but
        does not
        <br>
        require) registering properties with the CycloneDX property
        taxonomy
        <br>
        (see <a class="moz-txt-link-freetext" href="https://github.com/CycloneDX/cyclonedx-property-taxonomy">https://github.com/CycloneDX/cyclonedx-property-taxonomy</a>).
        Is
        <br>
        that something we should do for Buildroot?
        <br>
        <br>
        It would mean registering a "buildroot" namespace for CycloneDX
        and
        <br>
        maintaining documentation on supported properties within that
        <br>
        namespace. As far as I can see, adding a section to the manual
        or an
        <br>
        independent file to the repository should work. I'd be happy to
        add a
        <br>
        document specifying the current properties (modified for the
        <br>
        namespace), but I can't speak for the Buildroot project in
        registering
        <br>
        a namespace, so I'd want maintainer agreement before working on
        <br>
        that. Either way it doesn't need to hold up merging, we could
        always
        <br>
        add the namespace later.
        <br>
        <br>
        Best regards,
        <br>
        Fiona
        <br>
        <br>
        <br>
        Changes v3 -&gt; v4:
        <br>
        * Former patch 2 has been merged (commit
        <br>
           b10f50399afcdc1cfaed06387b3f51d2dfa27ad0).
        <br>
        * Add an "external" mapping with external tree name and version
        to
        <br>
           show-info output for packages from external trees (new patch
        1).
        <br>
        * Use that "external" mapping and "package_dir" to derive
        external
        <br>
           tree information. This removes the need for a separate input
        file
        <br>
           with external tree info (patch 2, replacing former patches 1
        and 3).
        <br>
        * @Titouan Christophe: I've dropped your Tested-By due to the
        major
        <br>
           changes, of course you're welcome to re-test. :-)
        <br>
        <br>
        Changes v2 -&gt; v3 (in patch 1):
        <br>
        * Fix merge conflict after reordering of metadata structure in
        commits
        <br>
           6098cc45d64e9e7928f888b7cdf79533813d19c4 and
        <br>
           9cbbc477626c433fe78614de9474f8446b7e2389
        <br>
        <br>
        Changes v1 -&gt; v2 (all in patch 1):
        <br>
        * drop unnecessary default=None for "--external-trees" option
        <br>
        * fix help string for "--external-trees" option ("%" needs to be
        "%%"
        <br>
           so it's not treated as a formatting specifier)
        <br>
        <br>
        Fiona Klute (WIWA) (2):
        <br>
           package/pkg-utils.mk: include external tree info in show-info
        output
        <br>
           utils/generate-cyclonedx: include external tree information
        <br>
        <br>
          package/pkg-utils.mk     | 12 ++++++
        <br>
          utils/generate-cyclonedx | 90
        ++++++++++++++++++++++++++++++++++++++--
        <br>
          2 files changed, 98 insertions(+), 4 deletions(-)
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------41EJTFAG10XZa3gua0a5e0zt--

--===============4055610106781685759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4055610106781685759==--
