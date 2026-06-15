Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03F0CD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 09:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E523682FB1;
	Mon, 15 Jun 2026 09:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6jKgR4V4bDP; Mon, 15 Jun 2026 09:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C618281A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781516356;
	bh=CLRUjKnoeOAPY2kzdz1DUI7jtunm2XZM7qBZejgk0WI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eswYlPzvji7Mvu53dV0ORjTlhBidr+rJMc5UGw79JTlmBRQGPhMyV1XIJM5BFh5s8
	 gTWc+bw32CXS+rfb+Ox/QzkGdgti/jV47laQSlt23KQ/jE1dbIqQk+zzB3Vwed1TQl
	 gWzo/UbNOz4tzuZPHt/ZpWHppBboRXxg6DpUlbN+tq252en+3cHrFtLt1u3T3rFLwE
	 Qo6fVdG/EylBt8FR+qxaY9vb19ahc1hfO1aveUbgE9XRtDWYgvseE096GP2+srIVHA
	 PNBP/NLlthMscb75XOqJe+5CyuS6T8RDhAX9RyLqkg7a35lwf0PqPUBJJ5ZE0ldBVt
	 8wjWst+N8Eu8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C618281A;
	Mon, 15 Jun 2026 09:39:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ADB0DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 09:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C5D840F88
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 09:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoUmb3DiIHXw for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 09:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout-a2-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BEF440F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BEF440F84
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BEF440F84
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 09:39:14 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id A3EAFEC008B;
 Mon, 15 Jun 2026 05:39:13 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-02.internal (MEProxy); Mon, 15 Jun 2026 05:39:13 -0400
X-ME-Sender: <xms:QcgvaqbpgbxcNBNWqkdF8wAKw5zEgaen2UJd3f__WkQSvC_l9ndTUA>
 <xme:QcgvaoNz0i8Fu_VftPcirRS2NtJb4sG99NeRR24c80BdjLd7c_pnqo2_UGmSWisOX
 LYCA5d8NMVMiedQegmQU0PbHAjs2IjmbTjuxxWJnfMi3c5_eaYhSg>
X-ME-Proxy-Cause: dmFkZTEneBYcuJ+ZCxLLlDoV4Gg+T1xIQpNIN9SbTsekzhvoEQm7ARur0u13GiedoZV+Ul
 +30Y0OdWEb7Y8nCRnH42vFHe6HS2vJfDfSg6JbyC8JWNrsEGI34cumPTznvtxbdcRyzv10
 hJukiNTYJMVQY7dtl8a93pMMq3IN4yZxyvVkyfDoZNSAnXKXstZW0y1NHHYY0ivJLnHSWU
 7JlGHBBbkcoeXBj12khmuoAG4JJ/PtUYpNLYz02FJLj4bLjfl87qth7rCpbBCoOUccXmHw
 +S8XqUMyzPM9yuRwQSk1dCVDZRGNG9lfmcwMCPcoumPxbxy3du8M4xTb6Ez3ttHKdPNzp2
 TF8ktfGhXtToIaIOxLhgdTIs8BJ6wsegoVYo6yC24pRIxPDj0wMQPCBGw1Pu+AMRUUCuZe
 EbSruXe53KBx1Yu7AOLLWHD6byGZSvbY1jlTBzof/9oJO1IiO0LW6EKdda3H9NhtDEahCj
 eeQeczNbRmIxWxqSNLgTvFEggeYkOsu5re0iBt5tvQbFNZyi4twprhFbDv+8Ks8NG58GGn
 Biww4WCxcr4CMikde0OJe+MSZjq8dZhUMq4/ybdPRMK+XwXTSIlVjI7gkSiDro/yu8OsSe
 CM8E7Vacy8PLingz1IHdFy4lJiLalS/2eHuvFOAeoYXLAZZdRBXTuly6WDeg
X-ME-Proxy: <xmx:Qcgvak-_RljwzkOLHOErTozPuX9JiQgag1aJOZno9jJsREmmAgj3iA>
 <xmx:QcgvajsvA2iJ90Z6buQ6-LNA8uaoB8ms5KYLzQpPHnMGzUXkV_3t5A>
 <xmx:QcgvavArGEiW6GKwUocnoNEeIbvEOWnu8RaigfoloTN6IZh_PLLk_Q>
 <xmx:QcgvajVjJOQeuyCZvwINpc9_1MFNyp1LAnefsMyXLtoihQ0OlauCUg>
 <xmx:QcgvaoqbTU5ftGyJeGblbsP1M-ARqsZm1Cpun352mNNYC_VERAv-ylY1>
Feedback-ID: i0df9467b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 5D5ED2CE409B; Mon, 15 Jun 2026 05:39:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-jak3qfBTkR
Date: Mon, 15 Jun 2026 11:38:51 +0200
From: "Michele Comignano" <mcdev@playlinux.net>
To: "Julien Olivain" <ju.o@free.fr>, "Peter Korsgaard" <peter@korsgaard.com>
Cc: buildroot@buildroot.org, "Bernd Kuhls" <bernd@kuhls.net>
Message-Id: <2c8f5ad9-1917-450c-a899-3bcdc130453b@app.fastmail.com>
In-Reply-To: <1d266f71-792d-4785-af20-aa53fc858325@app.fastmail.com>
References: <20260613215558.978962-1-mcdev@playlinux.net>
 <87wlw1l9cx.fsf@dell.be.48ers.dk> <2c64e76850f28ec44af165e020424b0a@free.fr>
 <1d266f71-792d-4785-af20-aa53fc858325@app.fastmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1781516353; x=
 1781602753; bh=giM1wQEjEbDXdmgXfqnC/ZK18AIY6+pV6UHwzSp7v+k=; b=F
 SljcPgpANWNs9H1ObN9lOcI3XbrDN61TVqoYAxyxusrbJzCtLdyWTZ337QB6ExPR
 CBUd7huQHOkIgxAcDR/AsCDA7Z6X7gFqJeOz3VchGi038evnmEwyNtzTfdqRNkY0
 Dcb0SBqVY3EA/pbgW/L03XWAVu1ZfCDo96Y3ZI+mpOS5Hpu/jY07XRL7ZGpeAS7x
 7J1Fnl6lIqhD/TG0Rb/71WL+5ucIcD6Ej7KbsyQKbst6qvBK2y/ixwbDXemsVws7
 Fum/jqQtnL0z95VJHOnSReO+MS2hhAg+cri9Vy9q775KFSd6SpHVBrhk4S6tiCfm
 wT285wYpruKcxdlzEoqYw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1781516353; x=1781602753; bh=giM1wQEjEbDXdmgXfqnC/ZK18AIY6+pV6UH
 wzSp7v+k=; b=VB51i13xs2chqq/pZbKkTI1Hx4omM/2h0lt8Z1dW5zCVLKzuLwz
 2ZfmjuEmcMS7wsjpK3lPnC0O1gkM+ptR2ezP/mPccYYebNQFuE6FbQF0QX3Lp+D0
 RmOr858yWLSYHtqrwAMA9JhB32lo8/8/mGHXezxy7kMZIEwE8KSxS0SdwTmRcPHj
 oFX70yN3wwaquR9JWJGedd37pO3U0b/aioOqoVTXdTslUrazrrYnPWwBAVxW6kip
 dcGeR6ek0DUQoal6C0DG3+Td7T3ZlHfHe3e6ngNlpiDo48FsKQOc1h7PljmmFb0R
 pXuU8rOU8hnZKvTAHUlmcFElSfg1AXGCP3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm1 header.b=FSljcPgp; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VB51i13x
Subject: Re: [Buildroot] [PATCH] package/opus: don't use vcvtaq_s32_f32 on
 32 bit ARM
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
Content-Type: multipart/mixed; boundary="===============4454505731506093483=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4454505731506093483==
Content-Type: multipart/alternative;
 boundary=ecee7fa3df6b9fab7d011d1bf43ea2a7f15f6de4

--ecee7fa3df6b9fab7d011d1bf43ea2a7f15f6de4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Just noticed that I linked the wrong rust arm intrinsics docs.
The right link is https://doc.rust-lang.org/core/arch/aarch64/fn.vcvtaq_s32_f32.html which matches gcc observations (arm 64 only).
As for clang, the example code used another intrinsics, here is one using exactly vcvtaq_s32_f32 https://godbolt.org/z/31f1xnjvz, which also works.

Kind regards,
Michele

Il Lun, 15 Giu 2026, alle ore 11:23, Michele Comignano ha scritto:
> Thanks for all the hints! I tried going a bit deeper.
> 
> Looking at GCC arm_neon.h (https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/arm/arm_neon.h;h=6785dd2578a8ee0fd28b04d30934b764ea5fff3e;hb=HEAD), vcvtaq_s32_f32 is not present, though the arm instrinsics search suggests it is supported for the reference arch combo https://developer.arm.com/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimdisa=[Neon]&f:@navigationhierarchiesarchitectures=[A32]&q=vcvtaq_s32_f32.
> 
> In a way, the ifdef from opus seems to match arm documentation, though GCC is not making it available.
> 
> According to https://gcc.gnu.org/pipermail/gcc-patches/2016-January/439845.html the intrinsics vcvtaq_s32_f32 was added in circa 2016 to arm_neon.h, yet reported as missing in circa 2020 https://gcc.gnu.org/pipermail/gcc-bugs/2020-May/703594.html.
> The latter led to the creation of a GCC issue at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95399 which still sits new.
> 
> Interesting enough, rust (I wanted to check some other compiler) seems to match arm docs, though arm instrisics are deemed as experimental https://doc.rust-lang.org/core/arch/arm/fn.vcvtq_s32_f32.html.
> Clang as well seems to support vcvtaq_s32_f32 https://godbolt.org/z/xsMfSz (link taken from from gcc bug at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95399).
> 
> So the problem seems to be GCC only.
> 
> After all the research, the problem arguably sits in either upstream gcc or opus, but as a matter of fact opus package build through buildroot is currently broken on 32 bit arm neon.
> 
> Do you think my proposed patch could apply as a buildroot-only quick fix?
> 
> Best regards,
> Michele
> 
> 
> Il Dom, 14 Giu 2026, alle ore 18:58, Julien Olivain via buildroot ha scritto:
>> Hi Peter, All,
>> 
>> On 14/06/2026 12:11, Peter Korsgaard wrote:
>> >>>>>> "Michele" == Michele Comignano <mcdev@playlinux.net> writes:
>> > 
>> >  > From: Comick <mcdev@playlinux.net>
>> >  > Upstream issues is waiting for feedback.
>> > 
>> >  > See here for details:
>> >  > https://gitlab.xiph.org/xiph/opus/-/work_items/2397
>> > 
>> > 
>> > Hmm, indeed - There is no vcvtaq_s32_f32 intrinsic in
>> > gcc/config/arm/arm_neon.h but there is in gcc/config/aarch64/arm_neon.h
>> > but I do not understand the finer details - Julien?
>> 
>> Armv8-A Aarch32 is in fact a superset of Armv7-A. This is why there
>> is few 32bit Armv8-A instructions which are not available in original
>> Armv7-A.
>> 
>> See the column "Supported architectures" in the following table:
>> https://arm-software.github.io/acle/neon_intrinsics/advsimd.html#conversions
>> 
>> vcvtaq_s32_f32 is maked "A32/A64", whereas, for example
>> vcvt_s32_f32 is marked "v7/A32/A64".
>> 
>> There is also a search engine for intrinsics available at:
>> https://developer.arm.com/architectures/instruction-sets/intrinsics/
>> 
>> >  > Signed-off-by: Michele Comignano <mcdev@playlinux.net>
>> >  > ---
>> >  >  ...use-vcvtaq_s32_f32-on-32-bit-systems.patch | 26 
>> > +++++++++++++++++++
>> >  >  1 file changed, 26 insertions(+)
>> >  >  create mode 100644 
>> > package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>> > 
>> >  > diff --git 
>> > a/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch 
>> > b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>> >  > new file mode 100644
>> >  > index 0000000000..ddd572921f
>> >  > --- /dev/null
>> >  > +++ 
>> > b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
>> >  > @@ -0,0 +1,26 @@
>> >  > +From 321532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17 00:00:00 
>> > 2001
>> >  > +From: Comick <mcdev@playlinux.net>
>> >  > +Date: Sat, 13 Jun 2026 21:48:00 +0200
>> >  > +Subject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit 
>> > systems
>> >  > +Upstream: N/A https://gitlab.xiph.org/xiph/opus/-/work_items/2397
>> >  > +
>> >  > +---
>> >  > + celt/arm/mathops_arm.h | 2 +-
>> >  > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> >  > +
>> >  > +diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
>> >  > +index b1f9169..c612dae 100644
>> >  > +--- a/celt/arm/mathops_arm.h
>> >  > ++++ b/celt/arm/mathops_arm.h
>> >  > +@@ -37,7 +37,7 @@
>> >  > +
>> >  > + static inline int32x4_t vroundf(float32x4_t x)
>> >  > + {
>> >  > +-#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH 
>> > >= 8)
>> >  > ++#  if defined(__aarch64__)
>> >  > +     return vcvtaq_s32_f32(x);
>> >  > + #  else
>> >  > +     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x), 
>> > vdupq_n_u32(0x80000000));
>> >  > +--
>> >  > +2.54.0
>> >  > +
>> >  > --
>> > 
>> >  > 2.54.0
>> > 
>> >  > _______________________________________________
>> >  > buildroot mailing list
>> >  > buildroot@buildroot.org
>> >  > https://lists.buildroot.org/mailman/listinfo/buildroot
>> > 
>> > 
>> > --
>> > Bye, Peter Korsgaard
>> 
>> Best regards,
>> 
>> Julien.
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

--ecee7fa3df6b9fab7d011d1bf43ea2a7f15f6de4
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Just noticed=
 that I linked the wrong rust arm intrinsics docs.</div><div>The right l=
ink is&nbsp;<a href=3D"https://doc.rust-lang.org/core/arch/aarch64/fn.vc=
vtaq_s32_f32.html">https://doc.rust-lang.org/core/arch/aarch64/fn.vcvtaq=
_s32_f32.html</a>&nbsp;which matches gcc observations (arm 64 only).</di=
v><div>As for clang, the example code used another intrinsics, here is o=
ne using exactly&nbsp;vcvtaq_s32_f32&nbsp;<a href=3D"https://godbolt.org=
/z/31f1xnjvz">https://godbolt.org/z/31f1xnjvz</a>, which also works.</di=
v><div><br></div><div>Kind regards,</div><div>Michele</div><div><br></di=
v><div>Il Lun, 15 Giu 2026, alle ore 11:23, Michele Comignano ha scritto=
:</div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>Thanks for al=
l the hints! I tried going a bit deeper.</div><div><br></div><div>Lookin=
g at GCC arm_neon.h (<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3D=
blob;f=3Dgcc/config/arm/arm_neon.h;h=3D6785dd2578a8ee0fd28b04d30934b764e=
a5fff3e;hb=3DHEAD">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc=
/config/arm/arm_neon.h;h=3D6785dd2578a8ee0fd28b04d30934b764ea5fff3e;hb=3D=
HEAD</a>),&nbsp;vcvtaq_s32_f32 is not present, though the arm instrinsic=
s search suggests it is supported for the reference arch combo&nbsp;<a h=
ref=3D"https://developer.arm.com/architectures/instruction-sets/intrinsi=
cs/#f:@navigationhierarchiessimdisa=3D[Neon]&amp;f:@navigationhierarchie=
sarchitectures=3D[A32]&amp;q=3Dvcvtaq_s32_f32">https://developer.arm.com=
/architectures/instruction-sets/intrinsics/#f:@navigationhierarchiessimd=
isa=3D[Neon]&amp;f:@navigationhierarchiesarchitectures=3D[A32]&amp;q=3Dv=
cvtaq_s32_f32</a>.</div><div><br></div><div>In a way, the ifdef from opu=
s seems to match arm documentation, though GCC is not making it availabl=
e.</div><div><br></div><div>According to&nbsp;<a href=3D"https://gcc.gnu=
.org/pipermail/gcc-patches/2016-January/439845.html">https://gcc.gnu.org=
/pipermail/gcc-patches/2016-January/439845.html</a>&nbsp;the intrinsics&=
nbsp;vcvtaq_s32_f32 was added in circa 2016 to arm_neon.h, yet reported =
as missing in circa 2020&nbsp;<a href=3D"https://gcc.gnu.org/pipermail/g=
cc-bugs/2020-May/703594.html">https://gcc.gnu.org/pipermail/gcc-bugs/202=
0-May/703594.html</a>.</div><div>The latter led to the creation of a GCC=
 issue at&nbsp;<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
95399">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D95399</a>&nbsp;whi=
ch still sits new.</div><div><br></div><div>Interesting enough, rust (I =
wanted to check some other compiler) seems to match arm docs, though arm=
 instrisics are deemed as experimental&nbsp;<a href=3D"https://doc.rust-=
lang.org/core/arch/arm/fn.vcvtq_s32_f32.html">https://doc.rust-lang.org/=
core/arch/arm/fn.vcvtq_s32_f32.html</a>.</div><div>Clang as well seems t=
o support&nbsp;vcvtaq_s32_f32&nbsp;<a href=3D"https://godbolt.org/z/xsMf=
Sz">https://godbolt.org/z/xsMfSz</a>&nbsp;(link taken from from gcc bug =
at <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D95399">http=
s://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D95399</a>).</div><div><br></d=
iv><div>So the problem seems to be GCC only.</div><div><br></div><div>Af=
ter all the research, the problem arguably sits in either upstream gcc o=
r opus, but as a matter of fact opus package build through buildroot is =
currently broken on 32 bit arm neon.</div><div><br></div><div>Do you thi=
nk my proposed patch could apply as a buildroot-only quick fix?</div><di=
v><br></div><div>Best regards,</div><div>Michele</div><div><br></div><di=
v><br></div><div>Il Dom, 14 Giu 2026, alle ore 18:58, Julien Olivain via=
 buildroot ha scritto:</div><blockquote type=3D"cite" id=3D"qt-qt" style=
=3D""><div>Hi Peter, All,</div><div><br></div><div>On 14/06/2026 12:11, =
Peter Korsgaard wrote:</div><div>&gt;&gt;&gt;&gt;&gt;&gt; "Michele" =3D=3D=
 Michele Comignano &lt;<a href=3D"mailto:mcdev@playlinux.net">mcdev@play=
linux.net</a>&gt; writes:</div><div>&gt;&nbsp;</div><div>&gt;&nbsp; &gt;=
 From: Comick &lt;<a href=3D"mailto:mcdev@playlinux.net">mcdev@playlinux=
.net</a>&gt;</div><div>&gt;&nbsp; &gt; Upstream issues is waiting for fe=
edback.</div><div>&gt;&nbsp;</div><div>&gt;&nbsp; &gt; See here for deta=
ils:</div><div>&gt;&nbsp; &gt;&nbsp;<a href=3D"https://gitlab.xiph.org/x=
iph/opus/-/work_items/2397">https://gitlab.xiph.org/xiph/opus/-/work_ite=
ms/2397</a></div><div>&gt;&nbsp;</div><div>&gt;&nbsp;</div><div>&gt; Hmm=
, indeed - There is no vcvtaq_s32_f32 intrinsic in</div><div>&gt; gcc/co=
nfig/arm/arm_neon.h but there is in gcc/config/aarch64/arm_neon.h</div><=
div>&gt; but I do not understand the finer details - Julien?</div><div><=
br></div><div>Armv8-A Aarch32 is in fact a superset of Armv7-A. This is =
why there</div><div>is few 32bit Armv8-A instructions which are not avai=
lable in original</div><div>Armv7-A.</div><div><br></div><div>See the co=
lumn "Supported architectures" in the following table:</div><div><a href=
=3D"https://arm-software.github.io/acle/neon_intrinsics/advsimd.html#con=
versions">https://arm-software.github.io/acle/neon_intrinsics/advsimd.ht=
ml#conversions</a></div><div><br></div><div>vcvtaq_s32_f32 is maked "A32=
/A64", whereas, for example</div><div>vcvt_s32_f32 is marked "v7/A32/A64=
".</div><div><br></div><div>There is also a search engine for intrinsics=
 available at:</div><div><a href=3D"https://developer.arm.com/architectu=
res/instruction-sets/intrinsics/">https://developer.arm.com/architecture=
s/instruction-sets/intrinsics/</a></div><div><br></div><div>&gt;&nbsp; &=
gt; Signed-off-by: Michele Comignano &lt;<a href=3D"mailto:mcdev@playlin=
ux.net">mcdev@playlinux.net</a>&gt;</div><div>&gt;&nbsp; &gt; ---</div><=
div>&gt;&nbsp; &gt;&nbsp; ...use-vcvtaq_s32_f32-on-32-bit-systems.patch =
| 26&nbsp;</div><div>&gt; +++++++++++++++++++</div><div>&gt;&nbsp; &gt;&=
nbsp; 1 file changed, 26 insertions(+)</div><div>&gt;&nbsp; &gt;&nbsp; c=
reate mode 100644&nbsp;</div><div>&gt; package/opus/0001-celt-arm-don-t-=
use-vcvtaq_s32_f32-on-32-bit-systems.patch</div><div>&gt;&nbsp;</div><di=
v>&gt;&nbsp; &gt; diff --git&nbsp;</div><div>&gt; a/package/opus/0001-ce=
lt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch&nbsp;</div><div>=
&gt; b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-sys=
tems.patch</div><div>&gt;&nbsp; &gt; new file mode 100644</div><div>&gt;=
&nbsp; &gt; index 0000000000..ddd572921f</div><div>&gt;&nbsp; &gt; --- /=
dev/null</div><div>&gt;&nbsp; &gt; +++&nbsp;</div><div>&gt; b/package/op=
us/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch</div><=
div>&gt;&nbsp; &gt; @@ -0,0 +1,26 @@</div><div>&gt;&nbsp; &gt; +From 321=
532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17 00:00:00&nbsp;</div><di=
v>&gt; 2001</div><div>&gt;&nbsp; &gt; +From: Comick &lt;<a href=3D"mailt=
o:mcdev@playlinux.net">mcdev@playlinux.net</a>&gt;</div><div>&gt;&nbsp; =
&gt; +Date: Sat, 13 Jun 2026 21:48:00 +0200</div><div>&gt;&nbsp; &gt; +S=
ubject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit&nbsp;</div><=
div>&gt; systems</div><div>&gt;&nbsp; &gt; +Upstream: N/A&nbsp;<a href=3D=
"https://gitlab.xiph.org/xiph/opus/-/work_items/2397">https://gitlab.xip=
h.org/xiph/opus/-/work_items/2397</a></div><div>&gt;&nbsp; &gt; +</div><=
div>&gt;&nbsp; &gt; +---</div><div>&gt;&nbsp; &gt; + celt/arm/mathops_ar=
m.h | 2 +-</div><div>&gt;&nbsp; &gt; + 1 file changed, 1 insertion(+), 1=
 deletion(-)</div><div>&gt;&nbsp; &gt; +</div><div>&gt;&nbsp; &gt; +diff=
 --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h</div><div>&gt;&=
nbsp; &gt; +index b1f9169..c612dae 100644</div><div>&gt;&nbsp; &gt; +---=
 a/celt/arm/mathops_arm.h</div><div>&gt;&nbsp; &gt; ++++ b/celt/arm/math=
ops_arm.h</div><div>&gt;&nbsp; &gt; +@@ -37,7 +37,7 @@</div><div>&gt;&nb=
sp; &gt; +</div><div>&gt;&nbsp; &gt; + static inline int32x4_t vroundf(f=
loat32x4_t x)</div><div>&gt;&nbsp; &gt; + {</div><div>&gt;&nbsp; &gt; +-=
#&nbsp; if defined(__aarch64__) || (defined(__ARM_ARCH) &amp;&amp; __ARM=
_ARCH&nbsp;</div><div>&gt; &gt;=3D 8)</div><div>&gt;&nbsp; &gt; ++#&nbsp=
; if defined(__aarch64__)</div><div>&gt;&nbsp; &gt; +&nbsp;&nbsp;&nbsp;&=
nbsp; return vcvtaq_s32_f32(x);</div><div>&gt;&nbsp; &gt; + #&nbsp; else=
</div><div>&gt;&nbsp; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32x4_t sign =3D=
 vandq_u32(vreinterpretq_u32_f32(x),&nbsp;</div><div>&gt; vdupq_n_u32(0x=
80000000));</div><div>&gt;&nbsp; &gt; +--</div><div>&gt;&nbsp; &gt; +2.5=
4.0</div><div>&gt;&nbsp; &gt; +</div><div>&gt;&nbsp; &gt; --</div><div>&=
gt;&nbsp;</div><div>&gt;&nbsp; &gt; 2.54.0</div><div>&gt;&nbsp;</div><di=
v>&gt;&nbsp; &gt; _______________________________________________</div><=
div>&gt;&nbsp; &gt; buildroot mailing list</div><div>&gt;&nbsp; &gt;&nbs=
p;<a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>=
</div><div>&gt;&nbsp; &gt;&nbsp;<a href=3D"https://lists.buildroot.org/m=
ailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/=
buildroot</a></div><div>&gt;&nbsp;</div><div>&gt;&nbsp;</div><div>&gt; -=
-</div><div>&gt; Bye, Peter Korsgaard</div><div><br></div><div>Best rega=
rds,</div><div><br></div><div>Julien.</div><div>________________________=
_______________________</div><div>buildroot mailing list</div><div><a hr=
ef=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a></div><=
div><a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">h=
ttps://lists.buildroot.org/mailman/listinfo/buildroot</a></div><div><br>=
</div></blockquote><div><br></div><div>_________________________________=
______________</div><div>buildroot mailing list</div><div><a href=3D"mai=
lto:buildroot@buildroot.org">buildroot@buildroot.org</a></div><div><a hr=
ef=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">https://li=
sts.buildroot.org/mailman/listinfo/buildroot</a></div><div><br></div></b=
lockquote><div><br></div></body></html>
--ecee7fa3df6b9fab7d011d1bf43ea2a7f15f6de4--

--===============4454505731506093483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4454505731506093483==--
