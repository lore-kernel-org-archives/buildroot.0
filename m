Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC95C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 08:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5A4607E2;
	Fri, 18 Sep 2026 08:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLQJ3TtFxzCO; Fri, 18 Sep 2026 08:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BCC0060BF7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789721927;
	b=FbTJWrcXt/Ym7wh4vMmu6VUOiPmpNga0C6GJ4gV7cWlhT9EVH/HlC+BIPBaTDpiFLaho
	 V6QY5kwOvXL2pdwnNsmqWuryAwPavHOkVszlAwGG40sOq9tHYZpVf7MFCI5LLV0oeuNPy
	 xFp5Vfo7Fm3sfRd5YPGdQJZlppZgzF2DDNruoyQcCtGxEtc1nbRtN9eiQCmM9Lx2U3kwJ
	 mORZmuPn19ubVaUTh8KZKJSZa17AvlZc+p59beN+RpSqzMbvrM0PqExL9zF5DBp2xWi7O
	 4edj98bsU8xWjqjvDdWABnsI3JY+/zg+svZHtNPY43k3LKivhSfkdOT/yzS9+Y+XNLw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789721927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ttSmxMhM6wH5ug667W+zXHhDahkomearQb+yidjal4k=;
	b=PAaX0Vs6SjyJDsmU/0jrxWKxVuUSXZLouuJYKlDKFECAYZQLbGXV5ofrYRr/JlV4M9Uc
	 31+ghCouw/slozxn5ue+NYnWm8GnGoNDngdt8m6y7lZ33PPUSepCdGLShSrglDBQHfSqq
	 Lf4W6ETU9f/ODSBH96cQy6CWXFeXLNczN/Zm+YLmmWiG1BG8zF4yPNuCbTSUB2TXyTuCW
	 uA+xkwVXrP14hALDXNgVS2MIVbaW7Qg0EJrldvABeEgXMUjRcWDi7R2al6lUMFBh53lny
	 jvFAobGcOj4FHD5iGPB/VO1dGwiRO/uMfcvI1E1ZIQtWiIl1Ac2ZEPU2AhZ/bDL5G+Q==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789721927;
	bh=ttSmxMhM6wH5ug667W+zXHhDahkomearQb+yidjal4k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kf94/05XFVOXYKHFiJ68ftmFsLFIz/rDwBpdWnePdvf31bwGcMTr1ZdKZ9m3cX7MH
	 5TWqvIF8MZsEeIIycb9D0e53zcJfBZcOzGelGo0S6EDoWRWE1ZMarQb2nFN98tHD1g
	 cyTvFPp3jy+ItgWCIdLGOa2T42AnmM3hX8EyLyupx9mN+QSpK0g6bISlPh1T1YJT2e
	 X6OcUYvtidtN0fEjb20RYvA8BI1TRGqCQg0GOGNgGPBFhuTJCr0xRB8kNy2EHVAPs1
	 VVQauDat62fQ2eh9IPJny1qMxO51mYuWYdsZy7FF4BAbPIZ3VPC2T8WAx/Uvki4qvS
	 iz6yee0ug+Cug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC0060BF7;
	Fri, 18 Sep 2026 08:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 095E937A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E333A811B2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtWq0bDl-sxT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 08:58:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BF59381021
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:36::11"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789721922;
 b=eHE+VqQpJ2oje6NhP8++laIzEc9F9nuq0YQuHy2YzDO09JLv9ScKdG5tqbXrRPU5a7o/
 IIfUMRFcMmnLsTovEEicQQ/UbBvV2PGH5xjJhS307jmFDq9sDy22OT4Nx3L5nedhXIyBu
 0AjEbkLe/L0meWtSpNDNiRnv3Qa1btRVoEfeyPjtaND6X4aYugTzSEWePfbpJ/YpmiJF5
 CEiDSYQscYR4CNHmF+BGOk5d+6mcxoH34pVVbjpe81D+438WsPTQKtcqq/TYXnVdTRlWq
 4er4noBd2Gd5PbWwXNcTUxMa7sQTjwB7B0ZDz39G7AjWrjN+8xLzIfwN8aH56V0EK3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789721922;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=6Qg1zdcARrO/TGQqt/Ds5X7apA9TrkNpzho+CydfWp8=;
 b=KpcGtthu6I12YecZMoP14fEpZcjdukXQmCY7QizVATg6cUHF13sbhxh2M0qh2IQaRNGs
 zXD0dO73fcR/O3OlhlBGer9eEJpveETF89BLDEVbbg4xqaI7h2UPYFr1qYOpMrDX0ka5t
 mor59yekx2TvDd0GA7db9BuhsphDAa8ahplDOTOtrkCZy2HeIUeA4Podn1y1GfbPWAeIE
 hZW/S+5ok21O9BzIkzgGWAALiHbQGl3Qc3jBf0TKfnylSVY03UNCFrPbfKlDlyJ5girIv
 ry8TeqRA3Awk3Q9i4p6nFi4ptHHA/xBWW7lUy1+6RSgsXc+p3UE2PO/6Fvh0Nyboygg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fpuHuO6p; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:36::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:36::11; helo=mail-lf2-x11.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fpuHuO6p
Received: from mail-lf2-x11.google.com (mail-lf2-x11.google.com
 [IPv6:2a00:1450:4864:36::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF59381021
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 08:58:41 +0000 (UTC)
Received: by mail-lf2-x11.google.com with SMTP id
 2adb3069b0e04-5b8b402f4e3so503858e87.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 01:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789721919; cv=none;
 d=google.com; s=arc-20260327;
 b=LdEHuKMrAGiSgJbywZarO9eWyHohwaVpudKZIwJiq8G5Y7zFWBJfsPwqM0iv7eDK1k
 BkUfid1T9UQ7/G7/Rup1RWMC+666N1ioMGfz9MHUkP57v/P/QImMtRFLJ/8q89GxNdwA
 NwlA0t6AgT+93XLL1XjZhTy+kAi+2+56LQ2or/wYvpnYE/jnm5y3c5iaJEfYEjfeHvMh
 PsxZ2iWGlSQAZDULBtnr4piUr8wusmSQ6kmAz3QJjT9r1iEW7TcW9tZFXHWZ9IpzCios
 ywhV+hrCXt0eBLpciPx/mZCiwvsfk0vmnqPi63+GY+2SX5l8XlM6/T8Lcg9F0PJF9i5l
 TJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6Qg1zdcARrO/TGQqt/Ds5X7apA9TrkNpzho+CydfWp8=;
 fh=iz366Jwhg1KBtnoUSaB4CTVyEB6+LDXzhM0T2t1AVwA=;
 b=sEjcPNYwaAI5/CDp28gWB3nq+scbcxT52yb2tRf+7kV8YjKBnWUZ6+lpURPy8f0/cH
 x1yIwnfeZhm8xGXmTE+tEcjL/sRt335ShPeOHZmvLMYsCavbywGTEVKlANCv+5OApmVR
 wL9BxZHm90IaDETddkIIhj/biaEDPMsxf8/rkQdmADjrDlegeoo0BO64/3iLl8l4jmRf
 ic3QxGMxuUBjcp+cxzxaMGrEPFSINrGWO5UDZVzg7/yCoa6bfM0iAl0EF3eQVsnc/MSj
 5mipptP5jydfdYNgbeqTDTDvR4fKIl/YwVlpjBxVJR4DeCJFnsFdk/iiAM4brVTP6U9T
 vjuA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789721919; x=1790326719; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6Qg1zdcARrO/TGQqt/Ds5X7apA9TrkNpzho+CydfWp8=;
 b=fpuHuO6pXKLHKNsHNcOp5vxprA7J+cQJsqHEoDDIbM0nkcw//z9o8GBCvC4Qbx4KpZ
 GkjbeZsITjuOocl9qIEVzPDVCVsuh/NUgjh6J6ynB64FjpUzVBeZFH7DrU9jZdpjuHzi
 LMlX82sB5pUn3/Ztu+BFXSCvMTV7zAQO1p5yghttVZYOzosWI1WAEOuj0vetIReUUku3
 Zgsy3+zi7ETbf4nYwdq/YZPwLqFYBMCcF2CGKYImFVpYxP5iUirnoGf7dmcvBK1YkDky
 BzCKCy6BQoujt7UOP/DZ6SlokNF7NO/myTkUvvxO3uD95oyk1TQrjp34v4R8J+6c8WhK
 8ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789721919; x=1790326719;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6Qg1zdcARrO/TGQqt/Ds5X7apA9TrkNpzho+CydfWp8=;
 b=pLOFVa7wZ3C3m6ZMI6ntWp5WGjcBP6ZdKwKxohLMpLngbSsieTyueew4sYfc9YJxo1
 ijB3nZkhevkSyQK1H6sz6jrEbjGP1LjGW2sRpbTdjFKqRftEMw1l0+NJYgYourQKhmea
 RCnEDDILvzHeZpxRSFFEL80J0ZBo0MklWtGcF2NSle8BizuM1gHUTP4BS421zIGYEGkW
 5Fth6+3kthDwsMnfSW6aPryk6wB/x8SlxCaJFbgZEZIc/zSY8GhpDWfFBW2L1MRFsbIX
 aYhLNcuPBjpgsZtLL1YLwSVExZymm61DiB/spNpMs/wecjJRf1AZ2whCOhO0gohjnQ3Y
 pCWQ==
X-Gm-Message-State: AFuF++m94IcyfQLuc2ibBdAzGJAxa4yokJaUUB+HRbbJ1HBaTRw1tjaf
 Anxv/fq+5C4n4DZPYcWReAF7WAy4/mzRZ6LSCdjQz8rNdw2oNg7avYPOJuy8Cm1fWcRPetP7yDS
 rw9yWeVEAAlwGYm/GifemCGUR7uv6Pmo=
X-Gm-Gg: AYBFou2YV3m9LdBOSNACMHIgy6Bf+JKRM024ylkmCALlFJjihCvsFtPx7X4sJjEIyEj
 1oX7KUq4qlVik6TBUOyZXVl2IwVoPOA6Jjp7g/MG/5vFJK+GLdymHKPzQwMua2w5REmu6bwucdv
 jdU0lSZAYdo+/jNl7LJHFZ6zyRtwFkEC0CTOMu0BUeAd87G8yHKG0v+B/c1m+yIK0owSlA/hWRX
 LM6GvmFNkQ9teqDBElYeJKWYR6Z9/5gYMbe8qcQmCYFuDRHcPeFOmyarQB049wQPgOckcJbBAC0
 K2Pul6RPwu3f6r4qRLmmfH/CRO17qhosnDN4l+ISJan+SIQy2iNH3YNq
X-Received: by 2002:a05:6512:65c9:20b0:5b8:c1e3:ec74 with SMTP id
 2adb3069b0e04-5b8c1e3ed13mr298760e87.28.1789721918734; Fri, 18 Sep 2026
 01:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260918073631.665322-1-heiko.thiery@gmail.com>
 <20260918083230.33707-1-thomas.perale@mind.be>
In-Reply-To: <20260918083230.33707-1-thomas.perale@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 18 Sep 2026 10:58:26 +0200
X-Gm-Features: AcwNN1XyVSbe9wl9BHsjiipWCmSg2zr7X3CODr2VZeTMFXspLJe20pja2u77IV8
Message-ID: <CAEyMn7Z65+MpTA7JR6kR06ewcLcV0TGd=-eCjwfwa8N-w61mUA@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Fr., 18. Sept. 2026 um 10:32 Uhr schrieb Thomas Perale
<thomas.perale@mind.be>:
>
> Hi Heiko,
>
> Thanks for the submission !
>
> In reply of:
> > In CycloneDX the serialNumber field is an optional top-level field that
> > uniquely identified a SBOM using a URN RFC 4122 UUID format.
> >
>
> Initially I didn't include this field for reproducibility concerns: generating
> an SBOM from the same configuration wouldn't generate the same output.
>
> Of course this is exactly the goal of this field from the spec point of view
> but I was concerned this could be an issue for Buildroot. So I didn't include
> this field and thought it could be set by the end user if needed like other
> fields such as:

Yes you are right, the spec says: "Every BOM generated SHOULD have a
unique serial number, even if the contents of the BOM have not changed
over time"

So I understand your concerns.

>
> - version
> - metadata
> - ...
>
> One of the idea I thought about to solve this would be for user to be able to
> define a template the `generate-cyclonedx` would take as basis for the
> generation.
>
> ```json
> {
>   "serialNumber": "{uuid.uuid4().urn}",
>   "metadata": {
>     "timestamp": "{datetime.now}"
>     "authors": {
>       "name": "..."
>     }
>   }
> }
> ```

Currently I use a post step to add the serialNumber field:

```
jq --arg sn "urn:uuid:$(cat /proc/sys/kernel/random/uuid)"
'{bomFormat, "$schema": .["$schema"], specVersion, serialNumber: $sn}
+ .' sbom.json
 ```
Having a template sounds also a good idea. With that you would be free
in adding all info in addition without modifying the script.

>
>
> But i don't know if it feasible or nice to deal with from a user point of view.
>
> Is there a tool you are using that enforce setting this field ?

There is no tool, but our company's security office requested this
field for their process.

>
> Also in the commit message I would include the link to the spec:
>
> https://cyclonedx.org/docs/1.6/json/#serialNumber

I can submit a v2 that adds this information.

> PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
