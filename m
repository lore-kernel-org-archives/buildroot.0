Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6736CCA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 15:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A94440655;
	Mon, 12 Oct 2026 15:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sob-XW9JMTmn; Mon, 12 Oct 2026 15:41:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 160004062E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791819716;
	b=rAcmUEHeNQk6NEdAyax3r+WpiSbvnhe3yuwHTbXJUMoxMHWkliJdLYGOZrtE8BwzP14I
	 vOc6VclBMW/b09mIqT5Q6A2mI8K6Mxp8cklhfVGgiuo0ESQIavzA4tXcqe2lU7jHe3kEj
	 uMjapd7lFRgx0NUO5JUYAhuXHjwoMwjoGd3CaLM2CcI/SMrKO/bx29soUlroOoW0xEE0p
	 eYeppU2306U+mhIzRMI59XAbCQhL7T+t2CXxqIAm6HLDtXaMJT+xtUGHq4Q5UWW23Ztpk
	 wjupsw7HDfgJ++qhyaUQlC0Vuhyes1KpLeKRP/e4TGzSTTkHcDATffms7tz4ylqKapw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791819716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2h5lbtjX/xxylLyB35C6/NN4M40/AJN4r3RgHoj32Hg=;
	b=TSbAT2BQiPnGKP7BBp0w/CWWBScmzh3IZEgyDfoiD4PGkan0r3os/cnfoM8zZ4Z7a0np
	 Org3dHauvd1Jb38vFHS7lOojIYX3l76k7OCX6e1yfvk3FmaPMwfd1J86bHGUzEIA4SDT+
	 12nHYwYxRtkU20o5hdU1+uGB+oyZ4jmCKEAfD/T+vnDsMq1vVUh3f8InKlcGTbiDaDPzD
	 cZIkcP0TQ0HAjDq9mDXTrliYXGqT3S1FUXd0SFZnwGywwEIkYUc16qKO/L0P8Bf5g9FWM
	 WBuY/BPBFqUkR+723h9ghAZiWLxL0Ob1EtAlSrE6WhPO2Z/CJAkiZhwJFTZxiP6aFkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791819716;
	bh=2h5lbtjX/xxylLyB35C6/NN4M40/AJN4r3RgHoj32Hg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rU2gbCnI85mYxTj02n7o0z5H/MHEHcpLLswaG+Rixl4Nyek+XKO9rEP+xSCnZ44eh
	 kmJBSq3G21C521Anni0q3xvV9B83PcAuFQjodeHXbVP52TU/FPLWLXr+IHuVu6t+zQ
	 pHiUIbyMoWJ5zgO6S0VmtxM/TJkU3auU8FaN49rr6fV2skJaodIoMvu9dU0lFtd+Gd
	 8SxCIO3U6n7rqptozfpLNQcqG1iEgRV8JIHZfueZNAFejJG9ZHgOCnafTEGCWyckY+
	 wD8a7bKjjq4A8ejZQP7+8U6BD7etzlUSTkT+R+7/vyLWIxvJbPSPwJem2L6bNg+kBn
	 yh7GHjdRzfb0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160004062E;
	Mon, 12 Oct 2026 15:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B406E380
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 15:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9910940200
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 15:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ59ke63nAQh for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 15:41:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 612F54010F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791819713;
 b=Je6XWFXrRoDaTI2DAmFxkFCBbGE92usgUGR2pQ2eT3OhZHPEt0bLNGORWtxhdhbvwgXv
 IYRwjhyqdCgayLN1SmM3x75PtsZFfosID5C59iAWvubZDZ1JMQKuZxKf+Xc5RtjNYvLbo
 ndC0nmYkRZC1Dou5Y5msZhqEohWvIyioGxGPHL/Wc/riIIBOZrE1s9j1fDyR21O+a9PyB
 cHX+O7ua5bP1w6bzSEJEV/9thK7qJdIex55m0LVqeE2bcoNzrFzWlfHzkPFqAnqIywhhw
 QxlySQal0b8NU/MN8El7sMy08qi/GgU7sdsd2Sri3JNqTqG49bQgT36knkBRVDPgEhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791819713;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=xWlWO0KcdXwii0UDtqMrvJBKEeJTFqHunDDCojHpe5c=;
 b=jHp7/BrSt9+z3+zcjk0qn+19lpYQ4jRUhqGjdQKrTNa5wJDMZkSAWvdDNhxokKt+iT97
 hdNNX+7XikBGHAOPplM70U+pj4ns9qhxdKq0wDOQK7vjVGV8JOwZ3HhLePQf8Y0VnclQs
 C36E0D0lmGiDz9tv5Eop/ATsLx5C1SfePm6Ap/xiRFU7mfUY6+3fpifDQD89sFMQ0ZMv/
 qn6yVpHyK4ESQvGr7eQC3BdcyEV/4I/j5IygpfFx55RMBNHU/HHl4cRG98xLGwUHtPmau
 FF78G4sfBbYLK3/ulb4Qx2DUcKpN7SGnopKkBR0ihsFSAONc6qmosbcdfprzAXCQKTA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bVHfaCz2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 612F54010F
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 15:41:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso23879005e9.3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 08:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791819710; x=1792424510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xWlWO0KcdXwii0UDtqMrvJBKEeJTFqHunDDCojHpe5c=;
 b=refxgrw8yL6sbv3nQDKG5JUqQ+r77lLunLLPqUj+mJsVVNkWOoH/LOtUmwTKo2VlqH
 4ipWQg2cXmBNoT2dEGQIpuuPbk/gHYFolm5uIH+NPW793nEO72drg+HxaHkCR7o6acP8
 +YTV4SBNfO3dljXyyf0M3YfMaUZ3bmKr8AjHTknufL1gXTPyPtPpCd+cGrveQ26Djceg
 K+GTwSnuiPYTxx8ZPPlo1ujJUTzNwnApdRmqCnzD/i5i7pcRrZpp3S5Ai3TCquEiXkpj
 25kA9wZw/NHdfSN+uxIAiykSQXXd/vIvk6YP/iqzCH36rxAInnTSFcANW3KfJKS0tREr
 PJ5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxudumiw6MT3L+XKK99f6lIwpMYK1TCkTfbp5n/LjEXVv8yqur7bGuBZbx8wLMzSnQi/L+CpBLXCXQ=@buildroot.org
X-Gm-Message-State: AFq9FYJATpekV6q6t2gVJ2ghQWELvSM/GlYfobYRlceZ/d8yU1euy2a9
 slFg2W+JDk7fJblUZoD9UeexTIjiAV/Zp3gEhgGOqvi6+sT23d55odvg2NHu4ke0Lw3FqJZ+U4R
 B3EOi
X-Gm-Gg: AYBFou3b9vrBoYrkbRROV7LGRipqDefs3EyBrWtJU49OR1r7dHnnrqAKvx/cOVsUOCj
 +HWWysVUWLfC5r7eXwpb3lb1SBiGcAmpZXn4+rzTtLdaqebCLBYKHI08hCQ9qDcFPN/1JLJJ73j
 QT3CsqMd/vmKqv3vQTYt1gxi2Od4bF1J3GOlLzzB5i7Ty85Xw94In8iJ0rWTYsSI6mKdibaJcRu
 3G1tZofeAQsZXbgzo/3causfgWfddIlAUxbVlK2s2SvTRm9tObGljeRrznvvfDhEvfdCBErK2II
 e75R7sAevoW56wIgoc3bq2NAyrfYVxuJ4sJvMuB0fqeBjV4MeK7sEDmB7FA9Z9dS4CiF5evppFE
 M2V63XsZqNZAOCMb89OuxocJ4Uh9krHQNPVOTG1nzz3UCLdMXYIKDOhh4YQRX6xjlGvT9PGUyRG
 v2lzSr1Gg2UvCA2ZXfK8u6YV0w04uO8CcH964EB6jM2PQqFMtGMhKnJbTNEeRd3HY=
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-4a18e49886amr214801015e9.10.1791819710287; 
 Mon, 12 Oct 2026 08:41:50 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf15691sm290011805e9.6.2026.10.12.08.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:41:49 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon, 12 Oct 2026 17:41:49 +0200
Message-ID: <20261012154149.20488-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011203230.2072127-3-fiona.klute@gmx.de>
References: <20261011203230.2072127-3-fiona.klute@gmx.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

I'm thinking again about potential solutions since the issue we brought
upstream remained silent :-( [1]

Do you have a slack account to give it another try there maybe ? (I don't have
one sorry)

I think the actual proper solution to this is the following. Given an external
named "br-external" that has the package "foo" and a "buildroot" config that
has the "busybox" package enabled:

```json
{
  "bomFormat": "CycloneDX",
  "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "specVersion": "1.6",
  "metadata": {
    "component": {
      "bom-ref": "project-name",
      "type": "firmware",
      "name": "project-name",
      "version": "project-version",
      "components: [
       {
         "bom-ref": "buildroot",
         "name": "buildroot",
         "version": "2026.08-891-ge17cfc9b3b",
         "type": "firmware"
       }, {
         "bom-ref": "buildroot:br-external",
         "name": "br-external",
         "version": "...",
         "type": "firmware"
       }
      ]
    },
  },
  "components": [
    {
      "type": "library",
      "bom-ref": "busybox",
      "name": "busybox",
      "version": "1.37.0",
      ...
    },
    {
      "type": "library",
      "bom-ref": "br-external:foo",
      "name": "foo",
      "version": "...",
      ...
    },
  ],
  "dependencies": [
    {
      "ref": "buildroot",
      "dependsOn": [
        "busybox"
        "buildroot:br-external",
      ]
    },
    {
      "ref": "buildroot:br-external",
      "dependsOn": [
        "br-external:foo"
      ]
    }
  ]
}
```

The metadata section declare the project and its core component (buildroot +
externals), as its already the case with your patch. And then the dependencies
express what are stored in which externals, as its already the case for buildroot.

I actually think that solution makes a lot of sense, even though it's not
obvious by just looking at a component to understand where it comes from.
But as we discussed previously nothing seems to fit that requirement in the
component definition yet...

Again I wish I could give you a definite answer on how to handle this,
what do you think about this solution ?

Best Regards,
PERALE Thomas

[1] https://github.com/CycloneDX/specification/issues/807

In reply of:
> External tree information may be important for interpreting SBOM
> information, especially if the SBOM lists packages (components) that
> do not exist in the listed version of Buildroot itself. External trees
> mentioned in the show-info data of any package are listed in the
> metadata.component.components list of the SBOM.
> 
> For packages from external trees, the bom-ref of the external tree is
> listed in the BR_EXTERNAL_TREE property.
> 
> Note that this implies external trees that do not provide packages
> used in the build (e.g. only defconfigs or overlays) will not be
> listed.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
