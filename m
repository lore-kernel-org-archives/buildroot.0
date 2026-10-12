Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98725CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 16:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D702404F7;
	Mon, 12 Oct 2026 16:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjxO4lTBv-XB; Mon, 12 Oct 2026 16:31:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3BD664051F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791822665;
	b=pgOCH1siB4G1WDhW+7WvgEZLCaE+dq99CFK2+8436+ALS6on0gBYf4FAotv4AnqNiMtx
	 zSa8S5VWZumr9pdbHqCzsqzJ8dhOGT9mchzUQGKKu17Qw0qbf7PcCSFQBSrJNEG+No75z
	 d6xc4wrp2gSlXsarXV7v/3tGZWMRhGx29rsCI9IGCPx0ox0MLxY/wWtKPRNwGdVrdF3yE
	 X9p00bxenhh5cKwn+TsoOEzx7axviBwuN0qqCopW+Dg+V/kLxM5v1do1XerVVKnIJ1kMU
	 7aXi+RoOe1un9HcW3OKvb5RinZ1Mru53dQInzLbDtcSiXty6QY+DbkdRjGS+bGcymAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791822665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4AOX6JGXu6nn6+tjWZkLOVxzzJqQCBjoP4kIpyMY1mo=;
	b=ayWWC/+h/fMnvag2H7E1oUonamot7OKhOOuITI0D9s+MV30H/PkYzhdkBKMcZ8NkjHPF
	 rYoLaDF/VzEHUAwqrkxr+VCVbwLgm9zwDrr2sdl9SyumNm7kPJDAFal37X2rUE2U+Lamp
	 g9euoC1e0givmapXHtlGlRBLX+YvvlxAkW//IvQ3JtlNmGHrFmO7KqeQz6bPY+6rAkug4
	 /FRPTeIi5yfVrjmnyEhJ45I1K+uibKwfBo/8KGd1Tb6Zmkxy0fGEg/ZW+wuMeV04j6tA8
	 OnyzlnBV1paNIJBZosp4fLFFS41Tg1k9MMLw0UNKMhJEBIHQZ+5s+I1CJu8VtgRbGMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791822665;
	bh=4AOX6JGXu6nn6+tjWZkLOVxzzJqQCBjoP4kIpyMY1mo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JsAy5Vx6uHVgzzmiKplUdB63VtJyFdgoUJJ7dFtQgq1tf6vJHeq763wkzTL2J9FcO
	 WKunmZSjy9S3EqOsh2BT+2uuqUZZ+1ylIhllsgAtMBURVokU5X4P8oIsr3G1U7ct3O
	 nGQoubvKuVD38yDSh9qNyujVI7oSFj6/apJGEfHp9WEsv0voU+x/2tjpJDdCCaiBGv
	 pfhPl09ii5NACcwwiKTdWF/lUz0ErR/AGpGgK6ntY++FxL7Fl6KwSWsSCStTle/EMZ
	 5CUf2H3Aq6m3ULyogo1zOcwJe9sWfpUaFqqRBFR1zclgeApZA2uFocrLLy5Soiw/NT
	 cEyZuhG7akqEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD664051F;
	Mon, 12 Oct 2026 16:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6AC5194
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3EAA80DD6
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24z2n1H5Xu_O for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 16:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EAD0B80DCD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791822663;
 b=bvG5kH3RmzMgrsZbwbL17n2oPg0gScY7b9MDYo3BBLU5v2K8mZ2eFCSZBG+IW1gOGcTJ
 8qLy7bRAzB9aGZRMC/qsJCGBybw5wa9s32Bibx8vwfo5lt7dZhwQ0qRgDtbKFHb70Dp34
 RmYRDesrhmekjcTLvo3Qq0Jjc6ElD4kwYaKKevwZpjZBH0LynyUCeXFjOYppBJ1b7bbA1
 r+RUwHBg/xDqM9lfxsTKWxNKcLpDAGfiBatJ1TvcxlUtTTTgXu1wX5Sn0mZxoaz8lxp9o
 3w7LU1JY6rUnVWsHjOYbOK1TJzhXElau0KQOCuvAp/jwZdTpUpWGMxnmnTD2HZoZPJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791822663;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=9yM5Cq+EeUZ9tUF8iDhPCh/Psv0Pl07keaiyOb9FEAk=;
 b=WfyTdVp00bT7PGd7HEcaq4aKmIkn61cmr7O6C3VfvFO32Au8SzSyIe0vyO+uoKy8Hnut
 AiFxrmb5JebtEW0tNlb71nYjAIjQZMxEjGw2wlTmJyqr1G8I/n99J5iq3AONws9HMjqYY
 YoC4895X0acR6E3FU422r7eG5IyNsYoJ6t/1OjdaO/oQ90IRqX427chAD0Pbo/5tkN1NR
 nSgsMYndHRVlpwP6CDnbWRchfK7METoeX6h7o7gSLrgsN6cgU3zbeVHUOzTDRgjPGFWYN
 m2DxZpZxhZPlOwMfE3oE8euUtwNOFxB7ytdUlAU+HFsQuqpIy250BDxXXGFgo9RsBFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="hU0XCwT/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAD0B80DCD
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:31:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso24411395e9.3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 09:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791822660; x=1792427460;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9yM5Cq+EeUZ9tUF8iDhPCh/Psv0Pl07keaiyOb9FEAk=;
 b=Wygp2iQ9/hCnJVKivm98SSbzDA957k6R+aTZijWYtHVACcVTER4E+lJDg99IYafN8S
 jxMcCh0/T1Vhh5o0nXHS2ZUoFKcbEXc7Hp5ZA9eC99VEY+IWvFVMlNYZselWFghmAmfm
 8qT2xlK9aFGbH63myUfwqpxaxKHarnsd2mjiRICh+j1Y3PlLGic+ovRkDZ54S2Bc+d6A
 GWm5LUyucj3feUztGhXkCftlU8tv3bwh3ojiY5GoP8N1wG7VJ/4Cy0PEZaxAArrvhpNi
 uHN96eybu8Dqx3JC9/OiTIf9zwHocKCsiOjN8wVTEkI2JcguPV5aLGmp6LaLQV16mXGd
 XOPA==
X-Gm-Message-State: AFq9FYLUsxTSjm7EYqwIDxmH3hdEJY6KXo/AaAilx+wyRUFT47M0x8ke
 Wjf/29D9erXuXOe55dLv0eNsGXJaZ7mIJL4AQ6N7T/DFE0jWTl9NDm28V0/sCGYpW+Q=
X-Gm-Gg: AYBFou3+Dyq5lYfiz0Jksqv70JQ9Zz2hlg9JvQqCyep5g1xoaIclkF7+WhQb3aLTE1n
 eR3bUI8fD88ZJGKv2JdvpHyfxv+dcvL6xkWrLiBZl1iSjnqXvhUnXPYTzSIgp3oPHlYxoLK/+Er
 5HdzPMVaaHsJoy2UeD7LHYVAM5sj+4MwZuFuw2/3R5En8eBpF/Qk9gy9jdO3TwiTSD3IlSDp3Z1
 1e/dfRX0/lVcdjZSV44JWCvI1p0+z+e3sOnJ+eRMOzFGuakPVBBjmHYqTYqXysbVnBQQP2/ZITz
 MeFIKTicVBidsmEWpBlEGF508BzEVxhXMor0qfj+4lN+htGNnaybL+0kRWpFOIUApzFA0t3kmUE
 fY0zL0Ze9xLgKY+0iWDNUjdYTzRf7AvgG2qAMxIllSA+6R6F1zxmb48AApgIUjJEcVJIU0FOkds
 4NKHbTDPG/nk81ziSznkW4pAZADTQBfygB5TDWeSdxMP8IZ30mhS5bgBZMfz3jGx7UHe5R1ZjJN
 2va
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id
 5b1f17b1804b1-4a18e44395bmr184072665e9.4.1791822660074; 
 Mon, 12 Oct 2026 09:31:00 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.229.115])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf31b83sm309126995e9.12.2026.10.12.09.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 09:30:59 -0700 (PDT)
Message-ID: <595213e2-ee5a-42f3-916f-5b8ba5a81aec@mind.be>
Date: Mon, 12 Oct 2026 18:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
References: <20261011203230.2072127-3-fiona.klute@gmx.de>
 <20261012154149.20488-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20261012154149.20488-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, Quentin,

I'm adding you both to the conversation since you both provided valuable
feedback about CycloneDX stuff in the past.

We are discussing this series that has been sitting for a while to be able
to correctly reference the externals inside the CycloneDX generation. This
hasn't been applied because we wanted to have an answer from the CycloneDX
spec community on how to deal with this issue [1]. This question remained
not answered.

So here we are trying find an agreement on the implementation to make this
series move forward. You can choose among, the implementation from Fiona,
all the proposal I made in [1] and the one I made in my previous email.

About the proposal of my previous email, I still have to think about
all the possible way to order the "metadata" component but the main
idea is to express the different externals through dependencies.

We are not yet talking about the implementation detail but just the
CycloneDX output.

Best regards,
PERALE Thomas

[1] https://github.com/CycloneDX/specification/issues/807

On 10/12/26 5:41 PM, Thomas Perale wrote:
> Hi Fiona,
>
> I'm thinking again about potential solutions since the issue we brought
> upstream remained silent :-( [1]
>
> Do you have a slack account to give it another try there maybe ? (I don't have
> one sorry)
>
> I think the actual proper solution to this is the following. Given an external
> named "br-external" that has the package "foo" and a "buildroot" config that
> has the "busybox" package enabled:
>
> ```json
> {
>    "bomFormat": "CycloneDX",
>    "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
>    "specVersion": "1.6",
>    "metadata": {
>      "component": {
>        "bom-ref": "project-name",
>        "type": "firmware",
>        "name": "project-name",
>        "version": "project-version",
>        "components: [
>         {
>           "bom-ref": "buildroot",
>           "name": "buildroot",
>           "version": "2026.08-891-ge17cfc9b3b",
>           "type": "firmware"
>         }, {
>           "bom-ref": "buildroot:br-external",
>           "name": "br-external",
>           "version": "...",
>           "type": "firmware"
>         }
>        ]
>      },
>    },
>    "components": [
>      {
>        "type": "library",
>        "bom-ref": "busybox",
>        "name": "busybox",
>        "version": "1.37.0",
>        ...
>      },
>      {
>        "type": "library",
>        "bom-ref": "br-external:foo",
>        "name": "foo",
>        "version": "...",
>        ...
>      },
>    ],
>    "dependencies": [
>      {
>        "ref": "buildroot",
>        "dependsOn": [
>          "busybox"
>          "buildroot:br-external",
>        ]
>      },
>      {
>        "ref": "buildroot:br-external",
>        "dependsOn": [
>          "br-external:foo"
>        ]
>      }
>    ]
> }
> ```
>
> The metadata section declare the project and its core component (buildroot +
> externals), as its already the case with your patch. And then the dependencies
> express what are stored in which externals, as its already the case for buildroot.
>
> I actually think that solution makes a lot of sense, even though it's not
> obvious by just looking at a component to understand where it comes from.
> But as we discussed previously nothing seems to fit that requirement in the
> component definition yet...
>
> Again I wish I could give you a definite answer on how to handle this,
> what do you think about this solution ?
>
> Best Regards,
> PERALE Thomas
>
> [1] https://github.com/CycloneDX/specification/issues/807
>
> In reply of:
>> External tree information may be important for interpreting SBOM
>> information, especially if the SBOM lists packages (components) that
>> do not exist in the listed version of Buildroot itself. External trees
>> mentioned in the show-info data of any package are listed in the
>> metadata.component.components list of the SBOM.
>>
>> For packages from external trees, the bom-ref of the external tree is
>> listed in the BR_EXTERNAL_TREE property.
>>
>> Note that this implies external trees that do not provide packages
>> used in the build (e.g. only defconfigs or overlays) will not be
>> listed.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
