Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E265CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A09605F9;
	Sun, 11 Oct 2026 08:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu0jHFUY6AiR; Sun, 11 Oct 2026 08:47:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1798B60616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791708471;
	b=CxWwqH/wUZVlxTKqS14Qw+cGLU+QitlU039hWfv6UsVMpWiQNfne8UD1xPhN+O1vdiPq
	 nNCYKf5b0sDd4i42a4bvCGGyIVg2rfgRcnIWCj4ADfeCygSJb0bppVR0w7/6/xNs3iJFY
	 BGjN3fMl/kX783XTylCuE1TQobhUCb6ojWNft4srMRfE18kiyHvQh+9FGRfCahbHJrOTy
	 DAH81Q+m3REtAAThxCOxe1yve1tXn5DcGAcIT2gcqohJeGQRPuMyVqNTI2Kq/rLjPsjVJ
	 kYimYE+rTK713/lZotjWySbNYB7GNSyPheHfdlK0eHtjviZSa6lzkumSilEX/KJe3fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791708471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HqOi7iA0RAVQ0mZh6D3JhgWBVxds+rH+NuDLNnQ0fas=;
	b=lqGBJTuJNLwaevf4MWNz7svberk2DrQ8wOd4D/12WIlEWlm5bQfYE6bqesWJm8RbYQFq
	 QvdEyOmFo/SWmHY7AzuRn+9QnbTg6L80bzncgPhQNxVp7TYgw/dggWBR2MwonQLSStzrG
	 RfEj6TZ6bieoTdvdO+ARkZW7xBQyF25Pe6eWCp/Izn4IIWangSuDwsk37GeAuJffEVwyr
	 C7XwBYPRbsnbnqNwKxOKnZO7qTlr/G0D9LwWV+7fHQnTsydKjTPnt+fnUVcrl6y5iNiO3
	 pUsOsv9GThqJAvc03KwOq/Z2MnDrOGK+KO/7pJlLg3PwY27HVR5Qzt4oKqUHz7bnT8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791708471;
	bh=HqOi7iA0RAVQ0mZh6D3JhgWBVxds+rH+NuDLNnQ0fas=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V582xxCBoPiHnNPFrWacRnibK/gZLyNdie3V/rh1bfzP6d/o1H5vKN3cmstTOLD79
	 5tjNguN+QpHRBmoMsvMvdZG6xrNBQCHJb1Xn5+bLODwXs2NUZ+RLtRo08pJ9iVix17
	 aKF39yHd5BLuTDbvF0tHimctQTXu8K1mfcJO3TJs9WTJ2Q5wWnUJ13G6igqBJ5FWJ1
	 tbcgSQcqs3OFgDLiz3noJWrEUjzAEsDQ8p0OMOwSQeG6RWDz00PcBEGGSBWGqNYPfb
	 8EPnHzVQ/uKovBGIQtrZkDkH8QbV2EKqlHpU3M9tCgiW3nf+0n/hhITwFQdYEw+caw
	 qs+b02ASUV8ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1798B60616;
	Sun, 11 Oct 2026 08:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D09235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2967C40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9EQ0Opac-QE for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:47:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EEC1A4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791708468;
 b=ejq/Ge3Ioz0ygld7XjQD3Wnwelpv5/+ODu5UPe2/Cfy4jfymnlWABRWL0AlLyZ8WUmf0
 V6VoT3Ic6JqIgHpp2qL17OWXJ24OfdMZO95VbFnvANMyG8FDOJDhU+R3PhrY5LLp9XxTf
 A6yQCPfx4t5JZO/niC/qhrZWUPX+M8Mw500OvLdda8fnOxw30Z4+vNRoF2//Md6Thq0h2
 Blnf3mKpV7vW8bwGYDdF5Sp9QjuG1YHfOxddQS78xz/4aFy3hTVSzdac1OU0ehkyGEyFl
 Q7nrD78tatn9oD+hkBmJBVTwkspodq1hZel8luDU3lMHeKLXOwsGUxqKNrLBtKpjc+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791708468;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=3fDVMAfVoJAQQDdgIXU1I/I+/R7wOu1TVdXODLZCV9c=;
 b=F35wqFOJ4uNelgfFl4qnvFrHcqxOIPqnbVfKmF+EtdNvA/FTl3RrXNqozNHO51sDlDuG
 dhiHxdZmgWo+SBVI+f6WWDef8FurEBZEd55ZcFGfWugksl0fs4mZzOxHHOeSa5LK6CCOI
 +3He9Zw7XbTaKxZ8wcs8ePj50YquR5ct4pJfU8cGTXhCVplNKj4FEJIMOMYFjGuSlLYk+
 5ahjKG3UVhZzfnwP71Wf0TZnSWx2f5rr5UNrxBm/f/91MJ6nG5SuRuYV6L+eLZzSkemAi
 mvX6mgtJadVpnygbUf9CgqkuVFm0LSjfLiEL8t5fOjY4v8OkDFrkcf7iaEFEJ79eQAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HTu05+5Y; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEC1A4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:47:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso782247f8f.0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791708466; x=1792313266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3fDVMAfVoJAQQDdgIXU1I/I+/R7wOu1TVdXODLZCV9c=;
 b=EvkSNu5v8SeXoZN9wZ7/3IOSFFqW5D1EhcfAzoIsexb4bKFIJN7/AgY8MDAdQIrLtA
 p3Qa1ZGhBzumN4IjqAq51l4wNmOW3cnhI5xt8IWEoGOIgpni+1woMs8bzF83bodN2ceF
 WmltOKJyVCAr4bdW4qV+/6dS8KFwMHDyhU0MeXtonJpc07mHeEhBNAPEUyOYHYbGeJ58
 CEdhXwu/0Ex6k0kH5TPsZLST9yugxGhY4IqXqAwiiUZGZpLiUvwo4aPlrhiVk1YFft3P
 ou6INr8PH5i3sQw20drsUkb6sOtUNvb4/5gZ9f1ZNRjUu6CcPA7Rt5SmY72saRKEjd/L
 bhDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnnqMbDBoKpuu+tRdBIcfLIwaRzpObGRzUQOZuPyqSCLjdu27EjM7wnIgQXv8k0DT5gMXBukKJsFE=@buildroot.org
X-Gm-Message-State: AFq9FYK7Jn1jF31omAKf8Njzt6RH4h/IuZsVjvax/9JaxhxbgYuhGNqM
 KlVdtb4SzX+16FI7M45x4MJHZBE8mNtMpG4oTBvEM81DcAWtoPjF41kjMiSuSKkcy/0apDoZyZj
 7V/XpHhc=
X-Gm-Gg: AYBFou3SR6hg5qk8VsmcdDQPQEI00sVnLG5e15nMveR3KWCKBEIiq8eUwNLsj+W27cm
 vByJfY5zoekZaP2kmq4XuR3mDrjG0jcDBVucewfkzGyExdkEGb4MrubymnHUdqIvBGgn4tDqsQE
 7pzX+79jhQ3sP4sJyAyXltUd9HQer3zw1+/o6yJvxXQ9s3JzOyQkyHiZ23guu90TMkjBeSN79Xp
 XaucmhBn9r1dEYaplemKsFai/m3G4Zj2Qq2BDbQ/STucgAOVV7hA70GMNjHBxhuE915v/KRJOK/
 AOH6P5+CXyojI6shb9D2Q1XZbEv6nWs9W8q0BoKjVYfFkoj+mufSSZkR3+JPRgvPTbiFQBwyMKn
 eMlzAg6kimpCOcYBSNOvNuoDDWzf5nlVUQadLjMtpgCqj9HCBCSBj1/Bi/ZNz2xKyKqWy7CrFod
 hkiTv59rG7fPWztDNu/WMXsnWG1Ioq+io4Hkf+n/SECPz3XkgZoS6xcSnlSVFvq7PWYL49knNht
 tc1XYIGcMxoYHTGaGiYkUtgUSHzjl1ThFQFkghJc4SMAHNjjIhlcE5q
X-Received: by 2002:a05:600c:8b64:b0:49d:174e:2a1e with SMTP id
 5b1f17b1804b1-4a18e498851mr123927485e9.19.1791708465535; 
 Sun, 11 Oct 2026 01:47:45 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm198081775e9.11.2026.10.11.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 01:47:45 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sun, 11 Oct 2026 10:47:44 +0200
Message-ID: <20261011084744.668954-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <85581630-8fb7-471a-8ebf-6dab79d0d7e2@cherry.de>
References: <85581630-8fb7-471a-8ebf-6dab79d0d7e2@cherry.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: support
 custom version
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

Hi Quentin,

Coming back to you a bit late but I want to thank you for the thorough review.

We forgot to address those two comments before applying but I've sent a
follow-up patch [1] to address your comments.

[1] https://lore.kernel.org/all/20261011084334.667976-1-thomas.perale@mind.be/

Best regards,
PERALE Thomas

In reply of:
> Hi Thomas,
> 
> On 6/24/26 12:13 PM, Thomas Perale wrote:
> > Support using minor revision for CycloneDX 1.6 by passing the version
> > from the command line. Currently supported:
> > > - 1.6
> > - 1.6.1 [1]
> > - 1.6.2 (default) [2]
> > > This is used to fetch the latest SPDX license list available upstream.
> > 
> Yeah it's kinda confusing to use the CycloneDX version to fetch something that's very little related to it (SPDX license list). I'm not even sure if it is actually required by the CycloneDX spec to use a specific version of the SPDX license list? Like I wouldn't understand why it needs to be a specific version, it's a list of SPDX-supported license, there's nothing that should break backward/forward-compatibility no?
> 
> > [1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
> > [2] https://github.com/CycloneDX/specification/releases/tag/1.6.2
> > > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> >   utils/generate-cyclonedx | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> > > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> > index 9738db71d6..8d055c3bbd 100755
> > --- a/utils/generate-cyclonedx
> > +++ b/utils/generate-cyclonedx
> > @@ -22,7 +22,7 @@ import sys
> >   import re
> >   >   > -CYCLONEDX_VERSION = "1.6"
> > +DEFAULT_CYCLONEDX_VERSION = "1.6.2"
> >   >   brpath = Path(__file__).parent.parent
> >   > @@ -538,6 +538,9 @@ def main():
> >                           help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> >       parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> >                           help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> > +    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
> > +                        choices=["1.6", "1.6.1", "1.6.2"],
> > +                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
> 
> Simply use %(default)s in lieu of {DEFAULT_CYCLONEDX_VERSION} (and remove the f that makes the string an f-string). c.f. https://docs.python.org/3/library/argparse.html#help
> 
> I could nitpick here and say you should first add support for picking a version, and then another commit to modify the default version.
> 
> >   >       args = parser.parse_args()
> >   > @@ -545,7 +548,7 @@ def main():
> >           parser.print_help()
> >           sys.exit(1)
> >   > -    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
> > +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
> >       show_info_dict = json.load(args.in_file)
> >   >       # Remove rootfs and virtual packages if not explicitly included
> > @@ -553,10 +556,11 @@ def main():
> >       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> >                                  if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
> >   > +    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
> 
> Please add a comment here to explain why we're doing this.
> 
> Looks good to me otherwise.
> 
> Cheers,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
