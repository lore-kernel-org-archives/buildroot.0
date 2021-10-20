Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45170C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 13:58:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E3E26128E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 13:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E3E26128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eccles.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12961606B9;
	Wed, 20 Oct 2021 13:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNRBJXzxEJSp; Wed, 20 Oct 2021 13:58:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEE3607CE;
	Wed, 20 Oct 2021 13:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D51781BF3A6
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 13:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C353383ADA
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 13:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDKMzrFZmQMM for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 13:58:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D36483AD8
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 13:58:11 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id r19so15222776lfe.10
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 06:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsxg6PYVRdVBgPTBr61dAFSx3M/02UZVuRqCMKzgGRU=;
 b=gvY8xdDm8KjA3vackaK5KNf98ffq2oKiBdR4i3A2ySHmto8sUjKd2cJO+54HZ7YxI+
 kj+QnEa812TEwNr3Yq9K6qHoj/6bM5FJFyJddhdH6eyLXDvZOS3WGpTYcRegsUeEwPes
 x+Iw75fsga9q6zrZof+M36tNQx6jDnfr3xOH+zYabC+A+pwgGYg76fdvbN02zbjVvIOE
 bSpwJ+KihmE81JhfROQw/0SH04NXnSRFwBsSzXHXLk+y72Hp4pv4jH4V+loqEXAB4q/U
 R4c4JxxAaGHlpT6/CljsLwq2C5tT20CjiHvS79Fq7dma8htMr1o/+/7ZWpnYWn6onsW1
 kDxg==
X-Gm-Message-State: AOAM530pQEfFKnAqzSzp+QyT6CktpIaVPi94NlE0cgQFs5SD/69S0OJ4
 5/PjryqFnVb3HuCIA5QllciY2h6AOEzW
X-Google-Smtp-Source: ABdhPJz3YocWuyVHCM9ydjTPfL4Eu+AU4ZX5GWX0siAdIqi5BBD2yNXs4Op0tGsVTLPqhik56ZluFQ==
X-Received: by 2002:ac2:4d07:: with SMTP id r7mr12204339lfi.96.1634738289838; 
 Wed, 20 Oct 2021 06:58:09 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id m18sm222464ljb.104.2021.10.20.06.58.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:58:09 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x192so15200771lff.12
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 06:58:09 -0700 (PDT)
X-Received: by 2002:a05:6512:4c7:: with SMTP id
 w7mr13068646lfq.444.1634738289405; 
 Wed, 20 Oct 2021 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211018203038.32453-1-will@eccles.dev>
 <13c3735c-9fd1-abfd-1b06-1d7ccf2425ff@mind.be>
 <CA+K4yGmg=EYwLTd4_FXnmTihRbdgCBXPntbph2Ghe-_38NByBg@mail.gmail.com>
 <02a0cab6-1ed5-a940-d4f3-371dc281bc41@mind.be>
In-Reply-To: <02a0cab6-1ed5-a940-d4f3-371dc281bc41@mind.be>
From: Will Eccles <will@eccles.dev>
Date: Wed, 20 Oct 2021 09:57:25 -0400
X-Gmail-Original-Message-ID: <CA+K4yG=+6ZNhMPhPk5156p51x9yw+vmqRFcL1hgkYOybPwPJug@mail.gmail.com>
Message-ID: <CA+K4yG=+6ZNhMPhPk5156p51x9yw+vmqRFcL1hgkYOybPwPJug@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/openssh: reset umask when init
 script exits
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7763108016062911974=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7763108016062911974==
Content-Type: multipart/alternative; boundary="0000000000000a72af05cec92be0"

--0000000000000a72af05cec92be0
Content-Type: text/plain; charset="UTF-8"

> IIRC, it fork()s but doesn't exec(), instead directly
> jumping to the interpreter.

Huh, that's interesting. Never looked much into busybox utilities before,
save for a few specific ones.

> That doesn't actually explain the behaviour you observed, because it
> should still not propagate the umask to the parent process... And
> it definitely doesn't explain how that behaviour could suddenly
> disappear...

I agree, and I am still looking into this. No results yet. I am ready to
accept that the system I found this on was somehow broken and this was a
fluke. It's just strange to me that I saw success with this before at all,
now that I think about it.

Yours,
Will


On Wed, Oct 20, 2021 at 8:08 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 19/10/2021 23:42, Will Eccles wrote:
> > Hi Arnout,
> >
> > Interestingly, I have tested this in a few different ways and achieved
> different
> > results each time. I agree with you that the patch does not make much
> sense, but
> > on the system I wrote it on (or rather, the system I originally tested
> the fix
> > on, which was otherwise unmodified), it seemed to fix the problem. The
> exact
> > steps I followed to test this were:
> >
> > 1. Build the system image (of course)
> > 2. Login as root and test that the uname value was 077 (no config files
> were
> > sourced by the shell, as none were installed on the system)
> > 3. Apply this patch to the S50sshd file and reboot (nothing else was
> changed
> > that I'm aware of; I was logged in for all of 1 minute to make the
> change and
> > reboot)
> > 4. Login as root again and test that the uname value was now 022 (as I
> expected
> > it to be)
> >
>
>   Hm, this reminds me: I believe that busybox ash does something smart to
> execute shell scripts. IIRC, it fork()s but doesn't exec(), instead
> directly
> jumping to the interpreter.
>
>   That doesn't actually explain the behaviour you observed, because it
> should
> still not propagate the umask to the parent process... And it definitely
> doesn't
> explain how that behaviour could suddenly disappear...
>
>   Regards,
>   Arnout
>
>
> > I have no idea how this patch would fix the issue, and I agree that it
> makes no
> > sense, but even in a small test I had done on the host system I had
> achieved
> > results which appeared to agree with this patch. On a new system (built
> minutes
> > ago), I cannot reproduce the exact same steps I took above, which is
> quite
> > puzzling, as nothing has changed (aside from a single device tree
> overlay I
> > added, which should have no relevance here at all).
> >
> >  > And when you source the script, the trap doesn't even trigger at the
> end of
> >  > the script, so this patch doesn't actually reset the umask.
> >
> > I wrote the script under the assumption that it was never sourced, so I
> didn't
> > even consider this. The file shouldn't ever be sourced as it doesn't end
> in .sh
> > anyway.
> >
> > I am willing to accept that I had some sort of gremlin on the original
> system I
> > tested this on. I can't seem to reproduce it on a newly-generated image
> while
> > following precisely the same steps I did above. However, this only
> raises more
> > questions for me to investigate, as I have no clue what else could have
> caused
> > the behavior I saw on the original system. I admit I didn't really think
> too
> > hard about why it would work this way, I just sort of accepted it and
> moved on.
> > Will investigate further and see if I can reproduce it again.
> >
> > Yours,
> > Will Eccles
> >
> > On Tue, Oct 19, 2021 at 4:25 PM Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>> wrote:
> >
> >        Hi Will,
> >
> >     On 18/10/2021 22:30, Will Eccles wrote:
> >      > S50sshd updates umask to 077, but does not reset it when it
> exits. This
> >      > results in the root user's umask being configured incorrectly
> (assuming
> >      > a default of 022 or otherwise).
> >
> >        Can you explain in which context this happens?
> >
> >        Normally this script is executed by /etc/init.d/rcS, which
> contains this
> >     code:
> >
> >            case "$i" in
> >               *.sh)
> >                   # Source shell script for speed.
> >                   (
> >                       trap - INT QUIT TSTP
> >                       set start
> >                       . $i
> >                   )
> >                   ;;
> >               *)
> >                   # No sh extension, so fork subprocess.
> >                   $i start
> >                   ;;
> >
> >        Since the script doesn't end with .sh, it will fork, so the umask
> doesn't
> >     "stick".
> >
> >        Same when you execute the script interactively: the umask isn't
> inherited by
> >     the parent shell.
> >
> >        And when you source the script, the trap doesn't even trigger at
> the end of
> >     the script, so this patch doesn't actually reset the umask.
> >
> >
> >        So I don't understand how it's possible that this patch fixes
> your problem.
> >
> >
> >        Regards,
> >        Arnout
> >
> >
> >      > This patch adds a trap to reset umask
> >      > when the script exits. This is convenient on systems where, for
> example,
> >      > configs such as /etc/profile may not be sourced by the root user.
> It may
> >      > also prevent issues with other init scripts which may inherit
> this umask
> >      > unintentionally, leading to improper permissions elsewhere in the
> >      > system.
> >      >
> >      > Signed-off-by: Will Eccles <will@eccles.dev <mailto:
> will@eccles.dev>>
> >      > ---
> >      > Backport to: 2021.02.6, 2021.08.1
> >      > (These are the releases on buildroot.org <http://buildroot.org>
> as of
> >     this writing, but as far
> >      > as I can tell, even releases as far back as 2012 have the same
> problem.)
> >      > ---
> >      >   package/openssh/S50sshd | 2 ++
> >      >   1 file changed, 2 insertions(+)
> >      >
> >      > diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> >      > index 22da41d1ca..94cf4c14e8 100644
> >      > --- a/package/openssh/S50sshd
> >      > +++ b/package/openssh/S50sshd
> >      > @@ -6,6 +6,8 @@
> >      >   # Make sure the ssh-keygen progam exists
> >      >   [ -f /usr/bin/ssh-keygen ] || exit 0
> >      >
> >      > +# Reset uname at exit
> >      > +trap "uname $(uname)" EXIT
> >      >   umask 077
> >      >
> >      >   start() {
> >      >
> >
>

--0000000000000a72af05cec92be0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=20
IIRC, it fork()s but doesn&#39;t exec(), instead directly<br><div>&gt; jump=
ing to the interpreter.</div><div><br></div><div>Huh, that&#39;s interestin=
g. Never looked much into busybox utilities before, save for a few specific=
 ones.</div><div><br></div><div>&gt; That doesn&#39;t actually explain the =
behaviour you observed, because it</div><div>&gt; should still not propagat=
e the umask to the parent process... And</div><div>&gt; it definitely doesn=
&#39;t explain how that behaviour could suddenly</div><div>&gt; disappear..=
.</div><div><br></div><div>I agree, and I am still looking into this. No re=
sults yet. I am ready to accept that the system I found this on was somehow=
 broken and this was a fluke. It&#39;s just strange to me that I saw succes=
s with this before at all, now that I think about it.</div><div><br></div><=
div>Yours,</div><div>Will<br></div><div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 8=
:08 AM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mi=
nd.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On 19/10/2021 23:42, Will Eccles wrote:<br>
&gt; Hi Arnout,<br>
&gt; <br>
&gt; Interestingly, I have tested this in a few different ways and achieved=
 different <br>
&gt; results each time. I agree with you that the patch does not make much =
sense, but <br>
&gt; on the system I wrote it on (or rather, the system I originally tested=
 the fix <br>
&gt; on, which was otherwise unmodified), it seemed to fix the problem. The=
 exact <br>
&gt; steps I followed to test this were:<br>
&gt; <br>
&gt; 1. Build the system image (of course)<br>
&gt; 2. Login as root and test that the uname value was 077 (no config file=
s were <br>
&gt; sourced by the shell, as none were installed on the system)<br>
&gt; 3. Apply this patch to the S50sshd file and reboot (nothing else was c=
hanged <br>
&gt; that I&#39;m aware of; I was logged in for all of 1 minute to make the=
 change and <br>
&gt; reboot)<br>
&gt; 4. Login as root again and test that the uname value was now 022 (as I=
 expected <br>
&gt; it to be)<br>
&gt; <br>
<br>
=C2=A0 Hm, this reminds me: I believe that busybox ash does something smart=
 to <br>
execute shell scripts. IIRC, it fork()s but doesn&#39;t exec(), instead dir=
ectly <br>
jumping to the interpreter.<br>
<br>
=C2=A0 That doesn&#39;t actually explain the behaviour you observed, becaus=
e it should <br>
still not propagate the umask to the parent process... And it definitely do=
esn&#39;t <br>
explain how that behaviour could suddenly disappear...<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; I have no idea how this patch would fix the issue, and I agree that it=
 makes no <br>
&gt; sense, but even in a small test I had done on the host system I had ac=
hieved <br>
&gt; results which appeared to agree with this patch. On a new system (buil=
t minutes <br>
&gt; ago), I cannot reproduce the exact same steps I took above, which is q=
uite <br>
&gt; puzzling, as nothing has changed (aside from a single device tree over=
lay I <br>
&gt; added, which should have no relevance here at all).<br>
&gt; <br>
&gt;=C2=A0 &gt; And when you source the script, the trap doesn&#39;t even t=
rigger at the end of<br>
&gt;=C2=A0 &gt; the script, so this patch doesn&#39;t actually reset the um=
ask.<br>
&gt; <br>
&gt; I wrote the script under the assumption that it was never sourced, so =
I didn&#39;t <br>
&gt; even consider this. The file shouldn&#39;t ever be sourced as it doesn=
&#39;t end in .sh <br>
&gt; anyway.<br>
&gt; <br>
&gt; I am willing to accept that I had some sort of gremlin on the original=
 system I <br>
&gt; tested this on. I can&#39;t seem to reproduce it on a newly-generated =
image while <br>
&gt; following precisely the same steps I did above. However, this only rai=
ses more <br>
&gt; questions for me to investigate, as I have no clue what else could hav=
e caused <br>
&gt; the behavior I saw on the original system. I admit I didn&#39;t really=
 think too <br>
&gt; hard about why it would work this way, I just sort of accepted it and =
moved on. <br>
&gt; Will investigate further and see if I can reproduce it again.<br>
&gt; <br>
&gt; Yours,<br>
&gt; Will Eccles<br>
&gt; <br>
&gt; On Tue, Oct 19, 2021 at 4:25 PM Arnout Vandecappelle &lt;<a href=3D"ma=
ilto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Will,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 18/10/2021 22:30, Will Eccles wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; S50sshd updates umask to 077, but does not re=
set it when it exits. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; results in the root user&#39;s umask being co=
nfigured incorrectly (assuming<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; a default of 022 or otherwise).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Can you explain in which context this happe=
ns?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Normally this script is executed by /etc/in=
it.d/rcS, which contains this<br>
&gt;=C2=A0 =C2=A0 =C2=A0code:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$i&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*.sh)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
Source shell script for speed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0trap - INT QUIT TSTP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0set start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0. $i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
No sh extension, so fork subprocess.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$i=
 start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Since the script doesn&#39;t end with .sh, =
it will fork, so the umask doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;stick&quot;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Same when you execute the script interactiv=
ely: the umask isn&#39;t inherited by<br>
&gt;=C2=A0 =C2=A0 =C2=A0the parent shell.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 And when you source the script, the trap do=
esn&#39;t even trigger at the end of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the script, so this patch doesn&#39;t actually rese=
t the umask.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 So I don&#39;t understand how it&#39;s poss=
ible that this patch fixes your problem.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; This patch adds a trap to reset umask<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; when the script exits. This is convenient on =
systems where, for example,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; configs such as /etc/profile may not be sourc=
ed by the root user. It may<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; also prevent issues with other init scripts w=
hich may inherit this umask<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; unintentionally, leading to improper permissi=
ons elsewhere in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; system.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Will Eccles &lt;<a href=3D"mai=
lto:will@eccles.dev" target=3D"_blank">will@eccles.dev</a> &lt;mailto:<a hr=
ef=3D"mailto:will@eccles.dev" target=3D"_blank">will@eccles.dev</a>&gt;&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Backport to: 2021.02.6, 2021.08.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (These are the releases on <a href=3D"http://=
buildroot.org" rel=3D"noreferrer" target=3D"_blank">buildroot.org</a> &lt;<=
a href=3D"http://buildroot.org" rel=3D"noreferrer" target=3D"_blank">http:/=
/buildroot.org</a>&gt; as of<br>
&gt;=C2=A0 =C2=A0 =C2=A0this writing, but as far<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; as I can tell, even releases as far back as 2=
012 have the same problem.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0package/openssh/S50sshd | 2 ++<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/package/openssh/S50sshd b/packag=
e/openssh/S50sshd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 22da41d1ca..94cf4c14e8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/package/openssh/S50sshd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/package/openssh/S50sshd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -6,6 +6,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0# Make sure the ssh-keygen progam=
 exists<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0[ -f /usr/bin/ssh-keygen ] || exi=
t 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Reset uname at exit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +trap &quot;uname $(uname)&quot; EXIT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0umask 077<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0start() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
</blockquote></div>

--0000000000000a72af05cec92be0--

--===============7763108016062911974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7763108016062911974==--
