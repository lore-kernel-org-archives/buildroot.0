Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3207CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 07:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367F660791;
	Fri, 26 Jun 2026 07:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNLb938yzET2; Fri, 26 Jun 2026 07:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C92607D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782458743;
	bh=kY89Pvg3We2L36QTTzSouRewWm9BDYuEOQkNxS67dfw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CW0GfDCqnzH0VK9GRJhNl2hxcuwQoqF23YiFeMGhhOa9row4yJfTGFngLvB6hZkRF
	 nKMxQWsPMTzigRx3bugn/V65WyzJeeaYRsBbqLsLamj9QmymRUYZYeopmEku8ILyvf
	 Tk50gUejvNSAsafY7MRME1xuzi4a7FzqYAfpE4ens3MXXorQmLr07rde8mQzDr82Yb
	 kUYFkQhmicdfr0JavnCEzVKBdL+ELQgq9nVOpEV+1/uJyrQ9Sw51BIHWpdqq+KxDGJ
	 3JMzzk183txlV7rBC5vdgELPxabYFkvju7K1NhF8yfj+7+7Z/UEIxxt0IrnW4FvBI5
	 hIBmW7la+VmYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C92607D1;
	Fri, 26 Jun 2026 07:25:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF7E369
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03B134062A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mrd5LsF1gdBt for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 07:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF5D040624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5D040624
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF5D040624
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:25:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so5688445e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 00:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782458738; x=1783063538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FD4jg/Pepn+ySWpf/aLph3SDsmA5I6qREP1Uw5yQAW0=;
 b=H7lZ94BLkhkuuLAuX9XxRyJnMC+2R1QUeGOF38HwyWNsuASAHciWq7xzNX16DdKCwM
 zEiGSl63hrRxL1FBc3ulGW/Dgc50pZtPKLy997IIPjgOAWVOKm21mz1UScnd8b9VKKDx
 st/WaUHFxHP54ocbaUfjfqS5krFGapuiud/caQqpYOUUIMhJXcF49nyleQD05IiLvxKs
 c/hVlFDN4d+gldhLdTAgJWAb/mfR4dH8QvxWErVs9tbTad45LmKFn/fYFr7YG2oVPvYH
 2+lhZ3Hk5KL5Fgu+gHs5Y6Fn1EcwxdKm/FSugT0nqdBXNxLn4sVoSmW/7faKEBbEbfrw
 HQmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//veCqNbKFmqcetvJgx8KKoViFiw7l5cH/OaUMGF1TGH7hrTOE49o9snq1S46wrI6g+/DTk/tkTkY=@buildroot.org
X-Gm-Message-State: AOJu0YxUb/v9yHU6IR5X2nJErwT9tnUkKKcdKPwN7NuKNbX6It9ClRi+
 2LI6ZOD6kduL1JJq4vySoX2+4BAm11Aro4Z+eu04s4DubyDsV8gOz9m+/fPr4jUVPR0=
X-Gm-Gg: AfdE7cnmLwsw1XBbMqcVBYLtxv/zSl15XFNWtzl11bOyk0jOP8w/FKwTnHt4skdiWXs
 fXMYJ9KXhFjTQ2NjPIy+/+Hz2XoMDVWOdMmiTvtFA/MDg7KiIyjIDHMABCc7OTxgFZED9ykVM4h
 kQz3cn3KGxAquqUjYbZ+CaGBfU6U5wOFmJE3qHaH3sa6EQNSSVEDIXvdfHdmAFRGa5Pzqm451wq
 16eFbbAMDbFFc83RL6dul9GP2dyN64Drxgc/fC+ywqI+K+MXRO03B4BhGWcxPlpv++XYXTsmWGc
 bO4lKVkDrpAWlqDvwubGMJpVQDrWNfctfdBmo7lYuIDmsePTp3rkTePkXPtr/ppuM7zzbtP7Kbs
 6z4IeRKpcN8P6qK2CaXBRixkyUIv3jTsk2mSZPISnZcD9hTSO+8Lf+gzBHn00egJqc99kfFolj1
 TjkmXUHQJfMiI9j+4=
X-Received: by 2002:a05:600c:3113:b0:492:5068:61fc with SMTP id
 5b1f17b1804b1-49266899d7amr73858865e9.19.1782458738258; 
 Fri, 26 Jun 2026 00:25:38 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ffe204sm57606725e9.7.2026.06.26.00.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 00:25:38 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Fri, 26 Jun 2026 09:25:37 +0200
Message-ID: <20260626072537.8009-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8665ae8f-2f4b-4eb7-bc84-ba684bfa403e@gmx.de>
References: <8665ae8f-2f4b-4eb7-bc84-ba684bfa403e@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782458738; x=1783063538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FD4jg/Pepn+ySWpf/aLph3SDsmA5I6qREP1Uw5yQAW0=;
 b=DsIoc4CtSF1qBMVS2mzXaEdIB/3G1m6RANBf+t7TQDUjk9XEYRb9AnYO/th38R87Gs
 HmZ2BNn4CGcUxWvqygFxTc8pVOIjIa6cogkGGgPfEDnrBoIvDbVaCAYc30uLAe88Ob/W
 YAig3LUlB76YPlD1c0JoplNn0Fk0OwSQbLbZGsRzjCmraMZWqKfPh4iPOktYCZFdYiNS
 vo0AjCigR/KiW0CZ2CYXBvV6Kn+3zgnuUkN+tk7jBZACH6y8lq69ihSKskdB1YHi1HM7
 +lLHtlPmpRwgjog8C6lgUVJp83+3ZflSXBSxsBfTtT1U/IRY/siJk4gIIoN9HVgGiMQZ
 T95A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DsIoc4Ct
Subject: Re: [Buildroot] [RFC PATCH 08/14] package/python-pip: add detail to
 vulnerability
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

Thanks for already taking the time to look at this series.

In reply of:
> Hi Thomas!
> 
> Am 24.06.26 um 16:06 schrieb Thomas Perale via buildroot:
> > The vulnerability is marked as fixed as it work as expected according to
> > the upstream project.
> > > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> >   package/python-pip/python-pip.mk | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> > index d12bea3225..ae9a4225eb 100644
> > --- a/package/python-pip/python-pip.mk
> > +++ b/package/python-pip/python-pip.mk
> > @@ -12,9 +12,10 @@ PYTHON_PIP_LICENSE = MIT
> >   PYTHON_PIP_LICENSE_FILES = LICENSE.txt
> >   PYTHON_PIP_CPE_ID_VENDOR = pypa
> >   PYTHON_PIP_CPE_ID_PRODUCT = pip
> > -# Disputed CVE: things work as designed, and only affects the
> > -# --extra-index-url option. This CVE will never be fixed.
> > +
> >   PYTHON_PIP_IGNORE_CVES += CVE-2018-20225
> > +PYTHON_PIP_CVE-2018-20225_STATUS = fixed
> > +PYTHON_PIP_CVE-2018-20225_DETAIL = Disputed CVE: things work as designed, and only affects the --extra-index-url option. This CVE will never be fixed.
> 
> I don't like using "fixed" for "upstream maintainers don't see this as a problem". Nothing was fixed, the dispute is whether anything needs fixing.
> 

I definitely agree and I don't like it either but I feel that the options
OpenVex and CycloneDX provides are limited for that specific case.

If I understand correctly it's because you need to actually put the upstream
project justification in a category.

For example for the flex example the project disputed the vulnerability by
claiming it doesn't produce a vulnerable code so I used the
"not-affected-vulnerable-code-not-present" category.

Here my logic was that since it's the expected behavior it's not a
vulnerability at all and then could mark it as fixed. But indeed I
over-interpret the "fixed" category.

> Looking at the OpenVEX status labels "not_affected" or "under_investigation" seem to fit better (depending on whether we agree with upstream or not, I guess if we don't adding to IGNORE_CVES would be questionable), but I don't see any way to clearly express "disputed" among those options.

For the "under_investigation", it means this would map to "in_triage" for
CycloneDX and that's what I'm trying to remove with this series to be able to
filter any vulnerabilities that don't provide a "status".

For "not_affected" the spec specify that we need to provide a justification
with it [1]. But I don't see a justification that really suits this specific
case.

To be honest, the more I look at the categories and the one I already assigned
to the packages the more I think other categories could be used as a
justification. It's really confusing.

Best regards,
PERALE Thomas

[1] https://cyclonedx.org/docs/1.7/json/#vulnerabilities_items_analysis_justification
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
