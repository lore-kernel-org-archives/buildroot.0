Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A0FC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 08:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B69160C00;
	Tue, 17 Jun 2025 08:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0VO_-Qx9hyM; Tue, 17 Jun 2025 08:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B5760B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B5760B91;
	Tue, 17 Jun 2025 08:57:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1318151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EBB8207A
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yt8bFaDGpT73 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 08:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED32D82075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED32D82075
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED32D82075
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:57:29 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7d3900f90f6so588854585a.1
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 01:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750150648; x=1750755448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EUZdqP2xn3Vg06w2u8uIxz8L1Hv8I2qvbkXH+ZYhGMg=;
 b=EhutLNtFug95jP02nEOTSjNBkZ++FmMqx5i7yv4Drn7d7UuPtETHPfCYECg14KJPez
 KvuisbFOCBWV6R96vAAYbREeSZq7H3zjyaMeow7hX9PEmfIQvyd7i/i/mXDoUng5vpFn
 tldolsdz25vtDOxtXbH70voTxLOPrts+oW4g7r3KAByyahYRaU899wCgcGnpIU5CZWZf
 N/rb2PgLFeIKB0VyDz+8TdLuIwpTDew0dkR3/FHqDWGJcw/pRPTHvyUmQUwbx/Qel0pV
 YVT82ssrx2v+utHp23ZcDctKp4VoWhwwxw+DXd+Ptvv2oPAAn1mmnT4DF752g2RBo2ba
 Bjfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzyT25sZXo9CLJh9U7J++BPbsyCef4FNyJEgzsotHOW7b9YmxI2ouxm7nU14GiclbsKl6eatIrDxI=@buildroot.org
X-Gm-Message-State: AOJu0YyWRRlcEPpiBtNVlHKwMPU1a6fDVRJZPDlILRXity56LRD4tLvU
 +oD5o5cMSs98YXzw1T413LaTCDnrSfwSvEXu4tbb3FeBhDV7SS3rej3P6QA1YEQjHQilRbH57Bg
 kQ8SbRmS1f7EEMG9Upd4B862/HsGmZ9mTVgK2Gc9VTA==
X-Gm-Gg: ASbGnct4q+1ziugGvlpvQtp0swiMjIiDkVK9ManLJo78B5RF+5SdS0AS6C+jS6WvXOV
 MWSxyqDrrvbFYilrFE4cZRIIRdnc9Urn4WC0K3X78AtOjXH4USMH+UTcYErx1t6UBGRs1lvoH4G
 gbWTik9VQU7HLe6lVcHb5/yRzMeLTDOAkhukWQa40X1w==
X-Google-Smtp-Source: AGHT+IHgKkB1H6O8IBvQY16UoxoFQ/IL/gsblZs+ZX1pR1MqYdhb5e9b/ntfjhFq20WeoqLzKm7Gj5R4OoMHao8ya6c=
X-Received: by 2002:a05:6214:2b0e:b0:6fa:f94e:6e69 with SMTP id
 6a1803df08f44-6fb47725f2cmr204439966d6.9.1750150648304; Tue, 17 Jun 2025
 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-7-fabien.lehoussel@smile.fr>
 <7b8c1766-43fb-4331-98c0-61ea8ee215eb@rnout.be>
In-Reply-To: <7b8c1766-43fb-4331-98c0-61ea8ee215eb@rnout.be>
Date: Tue, 17 Jun 2025 10:57:17 +0200
X-Gm-Features: AX0GCFv5jkTVUICw3JiDNryaChfnFqubsax7fQzzhgq_C2qx55AZsgvbP8G05qw
Message-ID: <CADVy0FfVvDVxuHMEdevdsjaVJcknPi2ebjNSzUZ1zQNM2zBu9A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org, 
 Vincent Jardin <vjardin@free.fr>,
 Titouan Christophe <titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750150648; x=1750755448; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EUZdqP2xn3Vg06w2u8uIxz8L1Hv8I2qvbkXH+ZYhGMg=;
 b=QLTVLvU+dvyMZCmHh9Q0oeBT8dYKkY6QUXjSJ5U3kKhNg9C89U4cLuVCX8ytsMEPgq
 YxbsXdOOM7A2rSF4bVIsh0zVZYTGjsaYnfcMAi3fzn6eMyIkHmSvu92URK76JsAD1rat
 GG8Yyz85DEJXkMtMa/SFlJeWwSZrlqZdCokCefE/xaATc43wMk8/+1X58oq1bmoihFLs
 hRksxUyrh0H+pKepX4DjCaQY+1/5QPgUi2c76aaasj3ww9zW4o2k9cWS7/eFUAxH5gQX
 lYs6vHe3iN8mZitHCQWMa8di5wI95wWf5xJF37fk6v7On3qRmNjXr90ZUx8EzHRFRMX4
 5VRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QLTVLvU+
Subject: Re: [Buildroot] [PATCH 7/7] utils/generate-cyclonedx: mark CVEs as
 'resolved' instead of 'in-triage'
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
Content-Type: multipart/mixed; boundary="===============2704949134174289716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2704949134174289716==
Content-Type: multipart/alternative; boundary="000000000000b22c3a0637c0b352"

--000000000000b22c3a0637c0b352
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnout, Fabien,

The reasoning behind in-triage was that we don't actually know if it was
> resolved, resolved with pedigree, false positive, or not affected. In fac=
t,
> "resolved" is the least likely (it means that the vulnerability was
> resolved
> through some other measure than changing the software, e.g. by changing
> some
> other component to make sure the vulnerability becomes unexploitable).


There has been some discussion during the last dev meeting on how to
associate the "IGNORED_CVES" to a patch so we can at least identify the
ones that are "resolved_with_pedigree" without much action taken. I think
adding a tag "CVE: CVE-20XX-XXXX" to the patch content could solve this.
The python script is actually already reading the content of most patch
types so it wouldn't be that difficult to parse this tag.  Other solution
is to parse the content of the '.mk' file as most of the CVE with an
associated patch have a comment above them, but more tricky in my opinion.


> On Fri, Jun 13, 2025 at 9:54=E2=80=AFPM Arnout Vandecappelle <arnout@rnou=
t.be>
wrote:

>
>
> On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> > Changes the status of CVE entries in the generated SBOM from 'in-triage=
'
> > to 'resolved' to accurately reflect that these vulnerabilities have bee=
n
> > addressed through patches applied in Buildroot recipes.
>
>   We discussed this in the FOSDEM developer meeting, with Thomas, Vincent
> and
> myself (all in Cc).
>
>   The reasoning behind in-triage was that we don't actually know if it wa=
s
> resolved, resolved with pedigree, false positive, or not affected. In
> fact,
> "resolved" is the least likely (it means that the vulnerability was
> resolved
> through some other measure than changing the software, e.g. by changing
> some
> other component to make sure the vulnerability becomes unexploitable).
>
>   In addition, we felt that it was better for the downstream to
> re-evaluate if
> the vulnerability is really resolved (or not applicable or whatever). Tha=
t
> is
> perhaps not ambitious enough though.
>
>   Finally, we felt that for any state other than in_triage, the other
> fields (at
> the very least "justification") should also be filled in.
>
>   We concluded that "in_triage" was the best option to start with. The
> detail
> should give a hint for manual review that it really was ignored by
> Buildroot
> upstream. The idea was that you'd be able to use some tool to keep track
> of your
> own analysis, and merge that with re-generated SBoM from CycloneDX. I'm
> not sure
> if that really works - Titouan (in Cc) has been working on something
> similar,
> perhaps he can comment.
>
>   Regards,
>   Arnout
>
> >
> > This provides a more accurate security posture in vulnerability trackin=
g
> > systems and reduces false positives during security scans.
> >
> > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> > ---
> >   utils/generate-cyclonedx | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> > index 30c0d48857..a9998e3fb6 100755
> > --- a/utils/generate-cyclonedx
> > +++ b/utils/generate-cyclonedx
> > @@ -234,8 +234,8 @@ def cyclonedx_vulnerabilities(show_info_dict):
> >               "url": "https://nvd.nist.gov/"
> >           },
> >           "analysis": {
> > -            "state": "in_triage",
> > -            "detail": f"The CVE '{cve}' has been marked as ignored by
> Buildroot"
> > +            "state": "resolved",
> > +            "detail": f"The CVE '{cve}' has been marked as resolved by
> Buildroot (patch applied)"
> >           },
> >           "affects": [
> >               {"ref": bomref} for bomref in components
>
>

--000000000000b22c3a0637c0b352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Arnout, Fabien,<div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The reasoning behind in-triage was t=
hat we don&#39;t actually know if it was<br>resolved, resolved with pedigre=
e, false positive, or not affected. In fact,<br>&quot;resolved&quot; is the=
 least likely (it means that the vulnerability was resolved<br>through some=
 other measure than changing the software, e.g. by changing some<br>other c=
omponent to make sure the vulnerability becomes unexploitable).</blockquote=
><div><br></div><div>There has been some discussion during the last dev mee=
ting on how to associate the &quot;IGNORED_CVES&quot; to a patch so we can =
at least identify the ones that are &quot;resolved_with_pedigree&quot; with=
out much action=C2=A0taken. I think adding a tag &quot;CVE: CVE-20XX-XXXX&q=
uot; to the patch content could solve this. The python script is actually a=
lready reading the content of most patch types so it wouldn&#39;t be that d=
ifficult to parse this tag.=C2=A0=C2=A0Other solution is to parse the conte=
nt of the &#39;.mk&#39; file as most of the CVE with an associated patch ha=
ve a comment above them, but more tricky in my opinion.</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote></div><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 13, 2025 at 9:54=E2=80=AFPM Arnout Vandecappelle &lt=
;<a href=3D"mailto:arnout@rnout.be">arnout@rnout.be</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:<br>
&gt; Changes the status of CVE entries in the generated SBOM from &#39;in-t=
riage&#39;<br>
&gt; to &#39;resolved&#39; to accurately reflect that these vulnerabilities=
 have been<br>
&gt; addressed through patches applied in Buildroot recipes.<br>
<br>
=C2=A0 We discussed this in the FOSDEM developer meeting, with Thomas, Vinc=
ent and <br>
myself (all in Cc).<br>
<br>
=C2=A0 The reasoning behind in-triage was that we don&#39;t actually know i=
f it was <br>
resolved, resolved with pedigree, false positive, or not affected. In fact,=
 <br>
&quot;resolved&quot; is the least likely (it means that the vulnerability w=
as resolved <br>
through some other measure than changing the software, e.g. by changing som=
e <br>
other component to make sure the vulnerability becomes unexploitable).<br>
<br>
=C2=A0 In addition, we felt that it was better for the downstream to re-eva=
luate if <br>
the vulnerability is really resolved (or not applicable or whatever). That =
is <br>
perhaps not ambitious enough though.<br>
<br>
=C2=A0 Finally, we felt that for any state other than in_triage, the other =
fields (at <br>
the very least &quot;justification&quot;) should also be filled in.<br>
<br>
=C2=A0 We concluded that &quot;in_triage&quot; was the best option to start=
 with. The detail <br>
should give a hint for manual review that it really was ignored by Buildroo=
t <br>
upstream. The idea was that you&#39;d be able to use some tool to keep trac=
k of your <br>
own analysis, and merge that with re-generated SBoM from CycloneDX. I&#39;m=
 not sure <br>
if that really works - Titouan (in Cc) has been working on something simila=
r, <br>
perhaps he can comment.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; This provides a more accurate security posture in vulnerability tracki=
ng<br>
&gt; systems and reduces false positives during security scans.<br>
&gt; <br>
&gt; Signed-off-by: Fabien Lehoussel &lt;<a href=3D"mailto:fabien.lehoussel=
@smile.fr" target=3D"_blank">fabien.lehoussel@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0utils/generate-cyclonedx | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
&gt; index 30c0d48857..a9998e3fb6 100755<br>
&gt; --- a/utils/generate-cyclonedx<br>
&gt; +++ b/utils/generate-cyclonedx<br>
&gt; @@ -234,8 +234,8 @@ def cyclonedx_vulnerabilities(show_info_dict):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;url&quot;:=
 &quot;<a href=3D"https://nvd.nist.gov/" rel=3D"noreferrer" target=3D"_blan=
k">https://nvd.nist.gov/</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;analysis&quot;: {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;state&quot;: &quot;in=
_triage&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;detail&quot;: f&quot;=
The CVE &#39;{cve}&#39; has been marked as ignored by Buildroot&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;state&quot;: &quot;re=
solved&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;detail&quot;: f&quot;=
The CVE &#39;{cve}&#39; has been marked as resolved by Buildroot (patch app=
lied)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;affects&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;ref&quot;=
: bomref} for bomref in components<br>
<br>
</blockquote></div></div>

--000000000000b22c3a0637c0b352--

--===============2704949134174289716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2704949134174289716==--
