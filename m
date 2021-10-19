Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71020C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EECB610A3
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EECB610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eccles.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2726F60C1A;
	Tue, 19 Oct 2021 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-4Dwl_8rj7u; Tue, 19 Oct 2021 21:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAC860616;
	Tue, 19 Oct 2021 21:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D94351BF361
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FF683415
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9U75U1pE399k for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 21:43:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4892783412
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 21:43:00 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id x192so10451038lff.12
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 14:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54rjamfpbMetXWcmeDmOn2kpjyMYcI+OZVx5/ylZFz0=;
 b=2lEn5D4lsSpGJcbF537iXZ1rpaNGpHZWkF4cgRP53BtUY0mcfq3dNxMFzE5nMMF2u1
 C+xBGfj9DCSSrnsalG+jgUANnlLQoq8dkwZuO3xZuyu039ki3OG/UYQjoNDqXfkRGz33
 fWVmnVNNhbvSCsSv/aOHr+6OUugE2oHaHWopFYwfYw/28pImcezqoTkhvpo4+pfxOrA9
 uu7NWmByb5fIWl5hSGjt3RSzJyGfYLQf1760N7Gd7LY4AtrShdSQ6Sq5z4eJMdcBfF/i
 gEIAHtTxkNduDP64NIHziwjo3zCwULrFTaYCJu53nk9tbgdDg5ltMRJrlhO+4F4Yr/Am
 7L1w==
X-Gm-Message-State: AOAM531WfYa8sqwy3Wzn/CFpw5OOECUtE5kCs1W4phk31iYcy1PpuFUm
 +Ruxrsz/1GcRbn1juCTe0LFjvhAWHLBM
X-Google-Smtp-Source: ABdhPJyxHeaOIbLYR7L+0T5HOSihGzGYouI2HpRq+cF+1vpuCdw10wSxqY7sZVnhxgn8i2Y8D4IfOg==
X-Received: by 2002:ac2:5e6a:: with SMTP id a10mr5706598lfr.138.1634679777876; 
 Tue, 19 Oct 2021 14:42:57 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id w17sm26618lfu.251.2021.10.19.14.42.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:42:57 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id z11so10555365lfj.4
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 14:42:57 -0700 (PDT)
X-Received: by 2002:a05:6512:1090:: with SMTP id
 j16mr8261320lfg.434.1634679777406; 
 Tue, 19 Oct 2021 14:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211018203038.32453-1-will@eccles.dev>
 <13c3735c-9fd1-abfd-1b06-1d7ccf2425ff@mind.be>
In-Reply-To: <13c3735c-9fd1-abfd-1b06-1d7ccf2425ff@mind.be>
From: Will Eccles <will@eccles.dev>
Date: Tue, 19 Oct 2021 17:42:21 -0400
X-Gmail-Original-Message-ID: <CA+K4yGmg=EYwLTd4_FXnmTihRbdgCBXPntbph2Ghe-_38NByBg@mail.gmail.com>
Message-ID: <CA+K4yGmg=EYwLTd4_FXnmTihRbdgCBXPntbph2Ghe-_38NByBg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6649013693880355754=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6649013693880355754==
Content-Type: multipart/alternative; boundary="00000000000074332b05cebb8bb6"

--00000000000074332b05cebb8bb6
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

Interestingly, I have tested this in a few different ways and achieved
different results each time. I agree with you that the patch does not make
much sense, but on the system I wrote it on (or rather, the system I
originally tested the fix on, which was otherwise unmodified), it seemed to
fix the problem. The exact steps I followed to test this were:

1. Build the system image (of course)
2. Login as root and test that the uname value was 077 (no config files
were sourced by the shell, as none were installed on the system)
3. Apply this patch to the S50sshd file and reboot (nothing else was
changed that I'm aware of; I was logged in for all of 1 minute to make the
change and reboot)
4. Login as root again and test that the uname value was now 022 (as I
expected it to be)

I have no idea how this patch would fix the issue, and I agree that it
makes no sense, but even in a small test I had done on the host system I
had achieved results which appeared to agree with this patch. On a new
system (built minutes ago), I cannot reproduce the exact same steps I took
above, which is quite puzzling, as nothing has changed (aside from a single
device tree overlay I added, which should have no relevance here at all).

> And when you source the script, the trap doesn't even trigger at the end
of
> the script, so this patch doesn't actually reset the umask.

I wrote the script under the assumption that it was never sourced, so I
didn't even consider this. The file shouldn't ever be sourced as it doesn't
end in .sh anyway.

I am willing to accept that I had some sort of gremlin on the original
system I tested this on. I can't seem to reproduce it on a newly-generated
image while following precisely the same steps I did above. However, this
only raises more questions for me to investigate, as I have no clue what
else could have caused the behavior I saw on the original system. I admit I
didn't really think too hard about why it would work this way, I just sort
of accepted it and moved on. Will investigate further and see if I can
reproduce it again.

Yours,
Will Eccles

On Tue, Oct 19, 2021 at 4:25 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>   Hi Will,
>
> On 18/10/2021 22:30, Will Eccles wrote:
> > S50sshd updates umask to 077, but does not reset it when it exits. This
> > results in the root user's umask being configured incorrectly (assuming
> > a default of 022 or otherwise).
>
>   Can you explain in which context this happens?
>
>   Normally this script is executed by /etc/init.d/rcS, which contains this
> code:
>
>       case "$i" in
>          *.sh)
>              # Source shell script for speed.
>              (
>                  trap - INT QUIT TSTP
>                  set start
>                  . $i
>              )
>              ;;
>          *)
>              # No sh extension, so fork subprocess.
>              $i start
>              ;;
>
>   Since the script doesn't end with .sh, it will fork, so the umask
> doesn't "stick".
>
>   Same when you execute the script interactively: the umask isn't
> inherited by
> the parent shell.
>
>   And when you source the script, the trap doesn't even trigger at the end
> of
> the script, so this patch doesn't actually reset the umask.
>
>
>   So I don't understand how it's possible that this patch fixes your
> problem.
>
>
>   Regards,
>   Arnout
>
>
> > This patch adds a trap to reset umask
> > when the script exits. This is convenient on systems where, for example,
> > configs such as /etc/profile may not be sourced by the root user. It may
> > also prevent issues with other init scripts which may inherit this umask
> > unintentionally, leading to improper permissions elsewhere in the
> > system.
> >
> > Signed-off-by: Will Eccles <will@eccles.dev>
> > ---
> > Backport to: 2021.02.6, 2021.08.1
> > (These are the releases on buildroot.org as of this writing, but as far
> > as I can tell, even releases as far back as 2012 have the same problem.)
> > ---
> >   package/openssh/S50sshd | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> > index 22da41d1ca..94cf4c14e8 100644
> > --- a/package/openssh/S50sshd
> > +++ b/package/openssh/S50sshd
> > @@ -6,6 +6,8 @@
> >   # Make sure the ssh-keygen progam exists
> >   [ -f /usr/bin/ssh-keygen ] || exit 0
> >
> > +# Reset uname at exit
> > +trap "uname $(uname)" EXIT
> >   umask 077
> >
> >   start() {
> >
>

--00000000000074332b05cebb8bb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Arnout,<br><br>Interestingly, I have tested this in a f=
ew different ways and achieved different results each time. I agree with yo=
u that the patch does not make much sense, but on the system I wrote it on =
(or rather, the system I originally tested the fix on, which was otherwise =
unmodified), it seemed to fix the problem. The exact steps I followed to te=
st this were:<br><br>1. Build the system image (of course)<br>2. Login as r=
oot and test that the uname value was 077 (no config files were sourced by =
the shell, as none were installed on the system)<br>3. Apply this patch to =
the S50sshd file and reboot (nothing else was changed that I&#39;m aware of=
; I was logged in for all of 1 minute to make the change and reboot)<br>4. =
Login as root again and test that the uname value was now 022 (as I expecte=
d it to be)<br><br>I have no idea how this patch would fix the issue, and I=
 agree that it makes no sense, but even in a small test I had done on the h=
ost system I had achieved results which appeared to agree with this patch. =
On a new system (built minutes ago), I cannot reproduce the exact same step=
s I took above, which is quite puzzling, as nothing has changed (aside from=
 a single device tree overlay I added, which should have no relevance here =
at all).<br><br>&gt; And when you source the script, the trap doesn&#39;t e=
ven trigger at the end of<br>&gt; the script, so this patch doesn&#39;t act=
ually reset the umask.<br><br>I wrote the script under the assumption that =
it was never sourced, so I didn&#39;t even consider this. The file shouldn&=
#39;t ever be sourced as it doesn&#39;t end in .sh anyway.<br><br>I am will=
ing to accept that I had some sort of gremlin on the original system I test=
ed this on. I can&#39;t seem to reproduce it on a newly-generated image whi=
le following precisely the same steps I did above. However, this only raise=
s more questions for me to investigate, as I have no clue what else could h=
ave caused the behavior I saw on the original system. I admit I didn&#39;t =
really think too hard about why it would work this way, I just sort of acce=
pted it and moved on. Will investigate further and see if I can reproduce i=
t again.<br><br>Yours,<br>Will Eccles</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 19, 2021 at 4:25 PM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i Will,<br>
<br>
On 18/10/2021 22:30, Will Eccles wrote:<br>
&gt; S50sshd updates umask to 077, but does not reset it when it exits. Thi=
s<br>
&gt; results in the root user&#39;s umask being configured incorrectly (ass=
uming<br>
&gt; a default of 022 or otherwise).<br>
<br>
=C2=A0 Can you explain in which context this happens?<br>
<br>
=C2=A0 Normally this script is executed by /etc/init.d/rcS, which contains =
this code:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 case &quot;$i&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*.sh)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Source shell script for s=
peed.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trap - INT QU=
IT TSTP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set start<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. $i<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# No sh extension, so fork =
subprocess.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$i start<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
<br>
=C2=A0 Since the script doesn&#39;t end with .sh, it will fork, so the umas=
k doesn&#39;t &quot;stick&quot;.<br>
<br>
=C2=A0 Same when you execute the script interactively: the umask isn&#39;t =
inherited by <br>
the parent shell.<br>
<br>
=C2=A0 And when you source the script, the trap doesn&#39;t even trigger at=
 the end of <br>
the script, so this patch doesn&#39;t actually reset the umask.<br>
<br>
<br>
=C2=A0 So I don&#39;t understand how it&#39;s possible that this patch fixe=
s your problem.<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; This patch adds a trap to reset umask<br>
&gt; when the script exits. This is convenient on systems where, for exampl=
e,<br>
&gt; configs such as /etc/profile may not be sourced by the root user. It m=
ay<br>
&gt; also prevent issues with other init scripts which may inherit this uma=
sk<br>
&gt; unintentionally, leading to improper permissions elsewhere in the<br>
&gt; system.<br>
&gt; <br>
&gt; Signed-off-by: Will Eccles &lt;<a href=3D"mailto:will@eccles.dev" targ=
et=3D"_blank">will@eccles.dev</a>&gt;<br>
&gt; ---<br>
&gt; Backport to: 2021.02.6, 2021.08.1<br>
&gt; (These are the releases on <a href=3D"http://buildroot.org" rel=3D"nor=
eferrer" target=3D"_blank">buildroot.org</a> as of this writing, but as far=
<br>
&gt; as I can tell, even releases as far back as 2012 have the same problem=
.)<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/openssh/S50sshd | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd<br>
&gt; index 22da41d1ca..94cf4c14e8 100644<br>
&gt; --- a/package/openssh/S50sshd<br>
&gt; +++ b/package/openssh/S50sshd<br>
&gt; @@ -6,6 +6,8 @@<br>
&gt;=C2=A0 =C2=A0# Make sure the ssh-keygen progam exists<br>
&gt;=C2=A0 =C2=A0[ -f /usr/bin/ssh-keygen ] || exit 0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# Reset uname at exit<br>
&gt; +trap &quot;uname $(uname)&quot; EXIT<br>
&gt;=C2=A0 =C2=A0umask 077<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0start() {<br>
&gt; <br>
</blockquote></div>

--00000000000074332b05cebb8bb6--

--===============6649013693880355754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6649013693880355754==--
