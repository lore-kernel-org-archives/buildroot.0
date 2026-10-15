Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324ABCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1CA40832;
	Thu, 15 Oct 2026 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYGZ7z2-LUgX; Thu, 15 Oct 2026 19:59:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1893B40808
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094344;
	b=jxMBsMzJiyi8MUYmZGcxTfCa+jot7GUkiZ1Gyifge+mNldhBp/oGbL34+/mYyHXN2Xg/
	 4bY7dy/qcA3SrC+aCMtnzmxtJc9nwebUWSskutAijVne9D5G49IbXOaGYNipWBJq7hFhN
	 Q9Y3r5AQM3n+NU6G45IXa8Wt08d1SXtERNXsO87Y2d+BKK38VeNo9cITJlNKeyXDv9xzf
	 6SG5CKU+sclilbEd2/ApVyWcb7RnoREAGMMeLYhAuqRTHgDEZ6qP4Sv5hUMlhgkLnd6Qa
	 RPes/iadd3G6mJCOYYLiU+W+hAUPB6u94wskdZRE9eCvGpKMou/Urmh9iq6KvXbO6fg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=oifhyMvXXYzZGRYwHY5Rj9RevYc2tWPqdOcvogt0ZZo=;
	b=WCF6t7UseE1i9NSy2ouCPMF0vMZ4DUzOK//7HgRLuQDSL/z0eNRn8CpctxtxCLSV2Vbw
	 bMkSURGoIO1I7DYSkGhXCF4L2fHDt7s7k3XGwhlixPM2Ch8uTDYfWCmQSDTMHYEX6GRzH
	 eSo1IYCrDnQGrKw84K3HeNXy+JOBC5dFPB9YzaZvQW/GT6+v9i0piSqaQK4SHbbn71wlv
	 Jm66kvwgNVTDdV+Lwj0Lau2i9LAkvb6U2nHx5BvidanMYqZbLHUUZxDkDl09hGCxDSmgh
	 xvTkZKXUvPvT7K+y9AFyX6T8MkQkdouHBLwGOCdRzv3aGePNi52zADh06arPkQoumLg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094344;
	bh=oifhyMvXXYzZGRYwHY5Rj9RevYc2tWPqdOcvogt0ZZo=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R8MkplQC5I/z4UmgBqQYHK9qBBQVoe6MeDnfwbMTiIHigxanP0cg+RpBJ1EMOxhJo
	 dKw3FYYFWU0fhZTBTDzpiqaWbBSZvTRYRAmQkPKtLCTDtRhe7ztruyDbHHrVO5VGxX
	 MWUE3IoBCcKs4gUL4eZS3HUmyMYkIkOIMeRNnQI6Z6Ka3VWzep0rJvM63rsEl/EPjM
	 L/aCUE9CEZqlpc+HVExB+IeUk6UWSU+zXIEhcN6qdKS4S8l6LECiH3u+1myxsaA82u
	 8MaSq5tcr9caBqSclgGtcLm9/u1LV8AV+BmdK+PaK9D49WhEU4nyHPcjF6evh4vjOw
	 tM7EsBW9io9bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1893B40808;
	Thu, 15 Oct 2026 19:59:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E91105
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37BCE4043A
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGPJLAe7hK5G for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:59:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 37FEC40433
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e2e"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792094341;
 b=VclyCnuhiNVE9qfG/B5uaEyVstnlL9oFICOFsknBcRY/JSQPJ4Imow0pZkFWbtoGfT4H
 cKPOg0tPmmbGrGkjMAX+zVpsJ5gnHILv8kqZGkz8zbIStPkaWq9gPywbZX2UBZP66Af3P
 EJUzBsBia4Px7pX1g4X/Y2xZMh4HByBZrxe9ZkHw26hgWjmCLOI5X2aqVbilJDIgqEHxi
 davNOmCvhODOXAzUPfhhw+KIRaBaVu+ZegLaK6jj4eqZSZ+NfgwlU/pIcakL+FKwaMuBm
 93SHuNg9wJty4lNBSlUvWMogyqkYruZWsNs2CiR7V47jlzqr76pY8fSxTamO7DIsv9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094341;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=440kcODTVaD6vEH9nmN4gLL/81ON4skU9YZWBl88GNk=;
 b=iLg4rvGK0Edq7ekW+XlLyxhXtSKevbjukmFdq9Wt9/SkrFQfyH8OVrwEA8bc+dr8po13
 YBl0imW03pPWhFfbswhugCN3pvwIsKXkoGrxse3BOLgKCw7qHIE41gNXxvhvhQUBP7Bpo
 uMRbL4Xms6aJBxSv01iuAnOiszLDOMr8KbsSoSGPY8+bdHqMbbu5ILQDJhjouI6oFbAWm
 M5uTQGciR8uwt3BtTH7M8o3R3RFHx27Fs2EDE1hFFLjmphtm0mNZqMNs8b7yhjkTTg4Qr
 liCuiPPOfbZBAJo223rAxK8x0bJokaH7P/xVULovyDjuILZ4sQKSbvwsf8OjcHGhQXA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="ZmX1/IIP"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::e2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZmX1/IIP
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37FEC40433
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:59:01 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-7cc0ccc2fddso295331137.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792094340; cv=none;
 d=google.com; s=arc-20260327;
 b=mDzrvQVkpKRxkztFvGVQ3luzHn5RKWlI27bqvWCmuU7XoIDhLdkMaZv4in9yrsCe5u
 c4qy8CIQjzMcA+MAxfo6NDTfs2JSAxG0FsM7+mqldF9mMSkoK8zJVTd2TImPy7hOc/l1
 J4qoyiBFQzI/Ye8T4tYBOc/6NjV5L5HLiRSsZJ+7HqfKewx1hLJUO4kJNSdZbRVBZKcI
 OnGSSZ1Wibk6eqjSWWgf1772XGEzqv7UQGrtv1w96B02WoPbjpVBeRcAyIY2lFj21f2J
 R89UIfrMFHQE4fyxip4Z/JxRIKJqoUW2CrbRIsdlJIBSIfOhEwlJHlWocjqxiSJHJO9T
 Zlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=440kcODTVaD6vEH9nmN4gLL/81ON4skU9YZWBl88GNk=;
 fh=2N1J3nzRgxStE8khaxLNJyRIm6IbXQIrkjJ9IgfzBXw=;
 b=rqD4GfrRvn5REO2eCGSkfBo4wxeeO0rm0i3h06WO/6lzk2pA/5l30EAz+aWdNaBxep
 atpopLMdTGtcemp1QecL34IK/0ov5/yceDjunGT4faI+RJTRTUPTbj+hafmqMcnKsxpJ
 mwRMf+sbvRo+5UhuGmukB4ITm16MB0deouiS7X/wZuI2tuWz3eEgc5EZnSPvcfiMLxzb
 9o2ji6NseLc13NG46Ca9rpw9IGGkAIRAbAgl7rMGBeI5FMcBUrXF5ICB3vpndhIFI3yf
 VSUZd/VFSOBVSn1wTnxC2tg3bKkYknedLpVJQaRbFb5sNqJ1R9aAn4KlYjU8VJL6Yq4F
 z6/Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792094340; x=1792699140; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=440kcODTVaD6vEH9nmN4gLL/81ON4skU9YZWBl88GNk=;
 b=ZmX1/IIPqhTAmXlEzudgRTRZTFub6Bwec/a7GowfGvML0pSbhiwefiN1vTUuZfLnKz
 SS7ZAuWpVF4WCbaLQ3fdALH5okMBbFnyEw4lVdakpLUGce9qrL6yuIU9ObZVseP0hcyw
 mxR3M2NuYZVLSzuoYVi+YAF1dlxhxnpxkhVDrjkn+eKUhaKS/1K8DToE1WVXTy4qvGsX
 c/ahn43nQph3bfduIkhdZtjXk+YpXoWmbhiFkrhza0u35BAWSVwunSe1pW8X5f59Dk4z
 zSZTJBandSEvo5bEpfAQmVND3dXnm9uX6QzS6XLHZ0WVWtFxOpknFZ8bxRLrs8jdLpp2
 q87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792094340; x=1792699140;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=440kcODTVaD6vEH9nmN4gLL/81ON4skU9YZWBl88GNk=;
 b=1KniEWd4njY5/6SYmfaDSv3bF4b94wRZV7LN+oKD4y+n/fsQB5CyoxIKdPYo7RWPGY
 Ieegnba+X/9u2271zHoUWBJQOCUYlNEtda8XWh2HVVsAJBhKN7aJqnB7G7o/5f7Ev3MG
 4Jh5PO+7GJCejmfWQa2JbD+hZARsjFXVqi710T0gHpkE9rY/Bh2JB9shGczg5nW6dHCp
 kykdIEa2v1XtgUQxtV5CgnoqkcIGMAqDfUqLAA/sEJ2DEDKBzun5zAGEL1S+gWICi8M1
 PEtyIAZtV0s3ShDEw3POr5aJ8Yj9l6bkcZrO5oMLaTNqcUxDOxKlxAr6GCxo46CuGGoh
 mS5Q==
X-Gm-Message-State: AFq9FYJ0bkcmRC8vqt6K5YZwrVxi1O0V3u//7B2DIwmzaRvViexkG0wR
 qtociypxGdmp+nvJFcqyLvRzR7h+SJBTVcBC+vKi5uovV9A/AnIRpttJXWAQNdt15DGxhzDCtYG
 IzTefkQ6Pn+iTnJKU3uBKekxZx2g3tdQ=
X-Gm-Gg: AYBFou0UDwFTsy5dF4v79wPSPKHIOSre1usNfDzV6DIpHj8z7/9ImaPktTOpldCkuzM
 9cjrrL1EJWBxOQLlFWWeGvG3StIdU1a0QfL7BnYZ+XrcBsPRFM1ck6IaSqeWtTl8bGNrb65IjT2
 5Xfu68fZLJX2hwArRnJUJwMxMG9w7Y7bHuQKDeU4wVnGvA6wIzrWYHjMjPBBeuwgNNCAAzSbx9G
 rW24BykutttzM2GwcJpLj2O2GbX7Pvi+LJSlA+stHqep0EHZ/cCAWomcXPP/MNiAzGOMiFaYlkx
 ukAVyOxqPq7BCIiBOJmKRqfFaJv/LuPx1FJ4tPx4P4wbCaW2ezqSHsy2JyGB52QlJiLhDrd319f
 3H4336O9YrRgn0pRKWOifeilEC3at6VCNYfRktalaMUkoGQr1Nbd3pply5oyedFdFJ1tU9G3gr0
 qmaI8Aao6PAWRZOyiiuubCjPzUAAyLpemSnxYLbEYfhm4Z
X-Received: by 2002:a05:6102:5344:b0:7b5:1ca4:9df1 with SMTP id
 ada2fe7eead31-7cb365906c8mr5954935137.5.1792094339755; Thu, 15 Oct 2026
 12:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <atEsbxorNgbUC57M@windsurf>
In-Reply-To: <atEsbxorNgbUC57M@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 13:58:47 -0600
X-Gm-Features: AclHuK-P347XlUce5FKHVTBKSBl-ziz4yp2dHMojdUfFK4KGbjaIgwRArPlUtRk
Message-ID: <CADvTj4rd4ovmg07R6ux2b1LyDmkRhq79yJVVmHm74_THX6OPtQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/9] package/python-setuptools: bump to
 version 84.0.0
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
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgMTo1NeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTUsIDIwMjYg
YXQgMDE6MzI6MzVQTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaCB8IDQg
KystLQo+ID4gIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsg
ICB8IDQgKystLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Cj4gVGhhbmtzIGZvciB5b3VyIHdvcmsgb24gdGhpcyB0b3BpYyEgU2hvdWxkbid0
IHRoaXMgcGF0Y2ggY29tZSBsYXN0IGluCj4gdGhlIHNlcmllcz8gSW5kZWVkLCBpZiB5b3UgYnVt
cCBzZXR1cHRvb2xzLCB5b3UgYnJlYWsgdGhlIFUtQm9vdAo+IGJ1aWxkLCBhbmQgdGhlIHdob2xl
IHJlYXNvbiBvZiB0aGUgc2VyaWVzIGlzIHRvIGZpZ3VyZSBvdXQgYSBzb2x1dGlvbgo+IHRvIHRo
aXMgcHJvYmxlbSBiZWZvcmUgYnVtcGluZyBzZXR1cHRvb2xzLCBubz8KClNvIEkgZGlkIGl0IHRo
aXMgd2F5IGludGVudGlvbmFsbHkgYmVjYXVzZSBvbGRlciBzZXR1cHRvb2xzIGJ1bmRsZXMKcGtn
X3Jlc291cmNlcyBhbmQgSSBkaWRuJ3Qgd2FudCB0byBoYXZlIGEgcG90ZW50aWFsIHNpdHVhdGlv
biB3aGVyZQp3ZSBlc3NlbnRpYWxseSBoYXZlIHR3byBkaWZmZXJlbnQgYnVpbGRyb290IHBhY2th
Z2UgaW5zdGFsbGluZyBjb2RlCnRoYXQgaGFzIHRoZSBzYW1lIHBrZ19yZXNvdXJjZXMgbmFtZXNw
YWNlLgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
