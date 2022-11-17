Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D12AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 13:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A95F640B23;
	Thu, 17 Nov 2022 13:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A95F640B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wv_Dvc2bwGjD; Thu, 17 Nov 2022 13:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D5A404C1;
	Thu, 17 Nov 2022 13:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D5A404C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D93C1BF580
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 13:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26163404C1
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 13:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26163404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVGA_K6ypFqR for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 13:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA090404B3
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA090404B3
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 13:21:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j16so2709678lfe.12
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 05:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ua5kRrV27I/TkZf0NeQ6ww/X9irrSkM70Y1DpVhMfZI=;
 b=6vG2o9PCbqSUYj4Lm6Eu7jfDE7Oq3MvWBhvzL3sNXdf5rD03It5bDcTj52mpMScvMV
 EJkkSh7c73jNqE03XX0z7womVx7VhLpdhKWtnHduJmmHo4ixHmJNstmx/se1QxTOzXwT
 4NeFDJnFmyS2StWFRQ+2iSYVyU8JO3+okFRDNy++ASNAIY9/YJvk/kWHW2oPq8PqR1Xi
 G1M3ey27ID1q648BeXirrqUMKLrqyJIdQpUF+LVewuZhpxg62LVwEFq+OI97NlU1TluQ
 cLK49/59HlvzCZ2VquZnR76oAA3EGJY/Jgc4fYwqVmp8w2yA8MDUKQbp/af7YDNvKTdW
 G0Mw==
X-Gm-Message-State: ANoB5pklkRVtdbUlgQWzTRSArtnUj8L5xKgsJcI0SW36CDPiVpRH6mSV
 IQwWuybSpk3HkH/EmgLWYVAzlawvqIGKgXkVL4h9KdoS88k=
X-Google-Smtp-Source: AA0mqf6aLK92tAJEdS1OHPV5T4y/yFzbYPvBdRXVzDwK0lb/5e0HzZwHuan7QAyCKpsXLr03KfQ/itYHFfHmkgFVR24=
X-Received: by 2002:ac2:4bcd:0:b0:49f:fd94:f107 with SMTP id
 o13-20020ac24bcd000000b0049ffd94f107mr825302lfq.602.1668691299522; Thu, 17
 Nov 2022 05:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20221019124017.427199-1-dumasv.dev@gmail.com>
 <20221020115512.483686-1-dumasv.dev@gmail.com>
 <9d9a3bbf2cfd4f60b82a47087ef8ecba@AcuMS.aculab.com>
 <15715b05-79a5-d542-2dcb-4c921c090463@theobroma-systems.com>
In-Reply-To: <15715b05-79a5-d542-2dcb-4c921c090463@theobroma-systems.com>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Thu, 17 Nov 2022 13:21:28 +0000
Message-ID: <CADjhFRDsjYAViaAz08x=rHSd00x=3JQRYNmMN3bU9OMEJUDCOA@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ua5kRrV27I/TkZf0NeQ6ww/X9irrSkM70Y1DpVhMfZI=;
 b=LzgGW5cCK6v2JC0IAk8Db9rpO+gxISJsuYfDB1FXhQBwL2H8gubxus6IV8Jtrrfsjc
 oiHlFWbPJtI6aW6GQ64YqVaxB1Tm9bgzYHkQ81leky5AhFG2zVopuCG8O7tr7dz32ZVU
 XwO98A49YH21vVNj5l/NNeeeoRdOJZhvMuY0LXWOLeMseNMdmrBfJHfo9rnD++oKdcRO
 epjFA9dd1+tmgZh0mbMWgE60LRxsX3Pfz8YIYaKptT5QUiV0t554sg895E+0jORtBnLj
 BReg8cA5o7YnfQdiFBXbCgANwJko8I6ceJHRvFt02uhobioe3PEmLUugvEdJOl5BTD7s
 U/zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LzgGW5cC
Subject: Re: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
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
Cc: Victor Dumas <dumasv.dev@gmail.com>, David Laight <David.Laight@aculab.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0193480379740995133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0193480379740995133==
Content-Type: multipart/alternative; boundary="00000000000025dc5c05edaa7825"

--00000000000025dc5c05edaa7825
Content-Type: text/plain; charset="UTF-8"

Rather than doing it via a shell script and xargs -P, consider doing
parallelization in a submake, similar to how we handle parallel glibc
locale generation:
https://github.com/buildroot/buildroot/blob/master/support/misc/gen-glibc-locales.mk
https://github.com/buildroot/buildroot/blob/bc9b716296f37e0e3e47fd34c8991e92b6baeebd/Makefile#L655-L656

This approach will reuse the make job server.

You'd need to assign the results of the find to a variable and then create
a target for each of the files using something like

$(foreach file,$(FILES),$(eval $(call make-fix-rpath-target,$(file))))


On Tue, Nov 15, 2022 at 9:24 AM Quentin Schulz via buildroot <
buildroot@buildroot.org> wrote:

> Hi David,
>
> On 11/15/22 09:47, David Laight wrote:
> > From: Victor Dumas
> >> Sent: 20 October 2022 12:55
> >>
> >> Using "xargs" instead of "while read" loop allows for the patching of
> files to be parallelized
> >> This significantly reduces the amount of time it takes to fix all the
> paths.
> >> On a larger RFS(~300MB) this script was taking 5 minutes, it now only
> takes about 30s on a 12 core
> >> machine
> > ...
> >> +    # Limit the number of cores used
> >> +    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
> >> +    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {}
> bash -c "patch_file
> >> '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
> >
> > Are you sure that all versions of xargs the script needs to
> > run on support -P ?
> >
>
> --max-procs was part of the initial commit of xargs in findutils in
> 1996, c.f.:
>
> https://git.savannah.gnu.org/cgit/findutils.git/commit/?id=c030b5ee33bbec3c93cddc3ca9ebec14c24dbe07
>
> It is also supported in its initial commit in Busybox:
>
> https://git.busybox.net/busybox/commit/?id=92a61c1206572f4a6e55baa24e7cdd4f180d4b64
>
> The only question is about BSD support (since pkgs.org returns that all
> other distros are using find-utils/busybox basically) since they are
> using something else (toybox, heirloom, ...?).
>
> Do we actually have a list of operating systems that are "officially"
> supported?
>
> > Having xargs run 'bash -c "command" ...' and the quoting also looks odd.
> > I presume there is some reason xargs can't just run patrch_file.
> >
>
> IIRC, you can't call a shell function from xargs directly.
>
> Cheers,
> Quentin
>
> >       David
> >
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> > Registration No: 1397386 (Wales)
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> >
> https://urldefense.com/v3/__https://lists.buildroot.org/mailman/listinfo/buildroot__;!!OOPJP91ZZw!mrCuxJUbX9qAxmtZDc6047Tt9_CuDKxXgPQu86pqCMlg_9auvbbJCmj2U4UdX_OnaO0U9ecmUu0-uHnkJjFiEXoSX0FyA8U_YtvT0A$
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000025dc5c05edaa7825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Rather than doing it via a shell script and xargs -P,=
 consider doing parallelization in a submake, similar to how we handle para=
llel glibc locale generation:</div><div></div><div><a href=3D"https://githu=
b.com/buildroot/buildroot/blob/master/support/misc/gen-glibc-locales.mk">ht=
tps://github.com/buildroot/buildroot/blob/master/support/misc/gen-glibc-loc=
ales.mk</a></div><div><a href=3D"https://github.com/buildroot/buildroot/blo=
b/bc9b716296f37e0e3e47fd34c8991e92b6baeebd/Makefile#L655-L656">https://gith=
ub.com/buildroot/buildroot/blob/bc9b716296f37e0e3e47fd34c8991e92b6baeebd/Ma=
kefile#L655-L656</a></div><div><br></div><div>This approach will reuse the =
make job server.</div><div><br></div><div>You&#39;d need to assign the resu=
lts of the find to a variable and then create a target for each of the file=
s using something like<br></div><div><pre class=3D"gmail-lang-bash gmail-s-=
code-block"><code class=3D"gmail-hljs gmail-language-bash">$(foreach file,$=
(FILES),$(<span class=3D"gmail-hljs-built_in">eval</span> $(call make-fix-r=
path-target,$(file))))<br></code></pre></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 15, 2022 at 9:24 A=
M Quentin Schulz via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.or=
g">buildroot@buildroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi David,<br>
<br>
On 11/15/22 09:47, David Laight wrote:<br>
&gt; From: Victor Dumas<br>
&gt;&gt; Sent: 20 October 2022 12:55<br>
&gt;&gt;<br>
&gt;&gt; Using &quot;xargs&quot; instead of &quot;while read&quot; loop all=
ows for the patching of files to be parallelized<br>
&gt;&gt; This significantly reduces the amount of time it takes to fix all =
the paths.<br>
&gt;&gt; On a larger RFS(~300MB) this script was taking 5 minutes, it now o=
nly takes about 30s on a 12 core<br>
&gt;&gt; machine<br>
&gt; ...<br>
&gt;&gt; +=C2=A0 =C2=A0 # Limit the number of cores used<br>
&gt;&gt; +=C2=A0 =C2=A0 procs=3D$(echo -e &quot;$(($(nproc)-2)) \n 1&quot; =
| sort -n | tail -n1)<br>
&gt;&gt; +=C2=A0 =C2=A0 find &quot;${rootdir}&quot; ${find_args[@]} | xargs=
 -0 -r -P ${procs} -I {} bash -c &quot;patch_file<br>
&gt;&gt; &#39;${PATCHELF}&#39; &#39;${rootdir}&#39; &#39;${sanitize_extra_a=
rgs}&#39; $@&quot; _ {}<br>
&gt; <br>
&gt; Are you sure that all versions of xargs the script needs to<br>
&gt; run on support -P ?<br>
&gt; <br>
<br>
--max-procs was part of the initial commit of xargs in findutils in <br>
1996, c.f.:<br>
<a href=3D"https://git.savannah.gnu.org/cgit/findutils.git/commit/?id=3Dc03=
0b5ee33bbec3c93cddc3ca9ebec14c24dbe07" rel=3D"noreferrer" target=3D"_blank"=
>https://git.savannah.gnu.org/cgit/findutils.git/commit/?id=3Dc030b5ee33bbe=
c3c93cddc3ca9ebec14c24dbe07</a><br>
<br>
It is also supported in its initial commit in Busybox:<br>
<a href=3D"https://git.busybox.net/busybox/commit/?id=3D92a61c1206572f4a6e5=
5baa24e7cdd4f180d4b64" rel=3D"noreferrer" target=3D"_blank">https://git.bus=
ybox.net/busybox/commit/?id=3D92a61c1206572f4a6e55baa24e7cdd4f180d4b64</a><=
br>
<br>
The only question is about BSD support (since <a href=3D"http://pkgs.org" r=
el=3D"noreferrer" target=3D"_blank">pkgs.org</a> returns that all <br>
other distros are using find-utils/busybox basically) since they are <br>
using something else (toybox, heirloom, ...?).<br>
<br>
Do we actually have a list of operating systems that are &quot;officially&q=
uot; <br>
supported?<br>
<br>
&gt; Having xargs run &#39;bash -c &quot;command&quot; ...&#39; and the quo=
ting also looks odd.<br>
&gt; I presume there is some reason xargs can&#39;t just run patrch_file.<b=
r>
&gt; <br>
<br>
IIRC, you can&#39;t call a shell function from xargs directly.<br>
<br>
Cheers,<br>
Quentin<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0David<br>
&gt; <br>
&gt; -<br>
&gt; Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, =
MK1 1PT, UK<br>
&gt; Registration No: 1397386 (Wales)<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://urldefense.com/v3/__https://lists.buildroot.org/mai=
lman/listinfo/buildroot__;!!OOPJP91ZZw!mrCuxJUbX9qAxmtZDc6047Tt9_CuDKxXgPQu=
86pqCMlg_9auvbbJCmj2U4UdX_OnaO0U9ecmUu0-uHnkJjFiEXoSX0FyA8U_YtvT0A$" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://lists.bu=
ildroot.org/mailman/listinfo/buildroot__;!!OOPJP91ZZw!mrCuxJUbX9qAxmtZDc604=
7Tt9_CuDKxXgPQu86pqCMlg_9auvbbJCmj2U4UdX_OnaO0U9ecmUu0-uHnkJjFiEXoSX0FyA8U_=
YtvT0A$</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--00000000000025dc5c05edaa7825--

--===============0193480379740995133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0193480379740995133==--
