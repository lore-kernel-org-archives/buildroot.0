Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A76EC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D612400D0;
	Sun, 10 Dec 2023 19:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D612400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxHnk875M8Lh; Sun, 10 Dec 2023 19:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06BC40116;
	Sun, 10 Dec 2023 19:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06BC40116
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5D11BF368
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FFAD40116
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FFAD40116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wU4SPrPCCApI for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 19:18:39 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C94400D0
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C94400D0
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b6f2dd5633so228616039f.2
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 11:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702235918; x=1702840718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZJ4Ig4DVUZBWJTka6KorGhlq8JZ7WBvoFzIydsfNHw=;
 b=nZVH9kbohoahfeG9pkdAIMHp0XmwAMwhoMsvXAdPl8nH2vqfyHXqfeYH6Tu9U+qpqB
 Pg1ksbNWY59gE49N6eSs+O8/cShKuqBzmtuvoehXe50OxTa+h5BaAPKIj5TuPyZ/qy3M
 aRf80DE7Hos2FLvO2eW5nhvuWxoWxIzDzMc41vykDEIRNd8CRZbVRWEUJGzigGuxGdsX
 fmpmU5mX2gOM31slfOHTigFXS6UwasNKGR2Y2UoPHNcSRVUGvGNx9iTmzKKCUNzgt34V
 3s5lNY+2R7T/TTcVdo5ddl+aHTVyg6J+wVRDvAnEHYV75pCq/ISVXwZq/T1J0Hl6ETto
 x9pA==
X-Gm-Message-State: AOJu0YxueLRia7/mtjWG2dkqiCcKA0P0qdjNNveVSp5B/+luAxZA79oW
 aGLEwFd5NRkbhIdgMWB68aHl2m1B1Da/iYBCU0o=
X-Google-Smtp-Source: AGHT+IHvN3aY6F/qGdbazKBFoao1RdyBuEzmP8aYZxcWajy0vNHOcadSxwL3HfRj4J7RZhc1yrLRkQTpN0ZrL+75778=
X-Received: by 2002:a92:ca09:0:b0:35d:5995:79a3 with SMTP id
 j9-20020a92ca09000000b0035d599579a3mr6686094ils.61.1702235917762; Sun, 10 Dec
 2023 11:18:37 -0800 (PST)
MIME-Version: 1.0
References: <CAPL9kM2QC4aXUyMe2HX5MQNR0U=8jDK_=0Eopjq_nGUL3ScVGw@mail.gmail.com>
 <3ac4d88c-4e69-4a64-b2ca-ceff46d3c7dd@mind.be>
 <CAPL9kM0muzNiYenVmopFcb_Cp4d84-xRWysq0_1XWPgKNELx_w@mail.gmail.com>
In-Reply-To: <CAPL9kM0muzNiYenVmopFcb_Cp4d84-xRWysq0_1XWPgKNELx_w@mail.gmail.com>
From: John Langholz <jlangholzj@gmail.com>
Date: Sun, 10 Dec 2023 14:18:26 -0500
Message-ID: <CAPL9kM3A-OW_sLA2k1k9b=69Y=PsesCGM-ySCwo2888w1pNMog@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702235918; x=1702840718; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eZJ4Ig4DVUZBWJTka6KorGhlq8JZ7WBvoFzIydsfNHw=;
 b=RSEmUiOLoWz4PcXOXqQav8VVsIHNcheJ6opkdRRoxPrkLUz1ZEuGaFdeoXb3PxXORU
 8yjcK8pwAWLFmsgt9UpIBn5zjBnTYT3rq/80hNG1Z+EwlMwxjcNUdvGYjN4hALBfCyhS
 7/9lz0dcRPQTxMqZRzujp8kEVpeimqykNK5zD4XiyqZGKZpRMcwy7EIKTdPLURejmC7J
 jq1QLIxuqNqS7F/Pe8N52E0jBnf2jcY5mquYY8xGTmeW5mwrGT2V164ZSffCus5E0WMb
 YBsxbX698orqbEAmUulQq+ZfBUG+AttpdHlmxZOk+k7fPJIhp/x/8sfIMbbhL9eiNqc5
 2KPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RSEmUiOL
Subject: Re: [Buildroot] python and tkinter
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
Content-Type: multipart/mixed; boundary="===============1795592690551816394=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1795592690551816394==
Content-Type: multipart/alternative; boundary="00000000000033c4e8060c2caf9d"

--00000000000033c4e8060c2caf9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm happy to report this did, in fact, solve the issue. Appreciate the
help! I'm able to import the libraries as expected now as well as other
tkinter related libraries. I ran my test python script with just a "hello
world" in a window (as is customary) and everything worked as expected.

When I get the chance, I'm going to give my hand at modifying the Config.in
file for python as well as the python.mk file to have "tk" show up as an
option in the "core python3 modules" menu. Shouldn't take much but i'll
have to verify on my end it plays nice with everything and builds as
expected.

--=20
Thanks,

-Jungle_Jim

On Sat, Dec 9, 2023 at 6:55=E2=80=AFPM John Langholz <jlangholzj@gmail.com>=
 wrote:

> Arnout, I appreciate the insights.
>
> I'll admit that I didn't fully understand the various idiosyncrasies with
> the "disable/enable-tk" options in the python.mk file. Looking through
> the file I did notice that the other python packages configurable in the
> make menu (like SQLite, SSL, etc.) had the ifeq statements to add them as=
 a
> dependency. I understood that tkinter was installed with python but I was
> curious why there wasn't a similar option for tk. Seeing all of this now,=
 I
> understand changing the options to "enable-tk" was really only half of th=
e
> equation.
>
> I've been continuing to look around in my free time to try and (really)
> understand how buildroot is working. I actually just got to reading about
> how the various dependencies are built, so your reply is serendipitous. I
> think the "simple" miss I had suspected is the missing dependency. If I
> understand your response correctly, tk is still being installed and built
> but without the dependency 1) the shared object isn't created and 2) pyth=
on
> also really doesn't know what to do with it anyway since it's (tk) not
> being built first. That would explain everything I'm seeing on my end.
>
> I'll add a line in the python.mk file for "PYTHON_DEPENDENCIES +=3D tk" a=
nd
> try a build and see what happens and report back.
> --
> Thanks,
>
> -Jungle_Jim
>
> On Sat, Dec 9, 2023 at 5:58=E2=80=AFPM Arnout Vandecappelle <arnout@mind.=
be>
> wrote:
>
>>
>>
>> On 02/12/2023 19:41, John Langholz wrote:
>> > I've been working on making an image for a raspberry pi (specifically,
>> a CM4)
>> > and have hit a bit of a roadblock with python and tkinter. I've been
>> able to
>> > include some additional external modules and verified they work in a
>> python
>> > shell but I've been having issues getting tkinter to work
>> appropriately. When
>> > I'm in a python shell and try "import tkinter" it throws a traceback
>> error:
>> >
>> > |Traceback (most recent call last): File =E2=80=9C<stdin>=E2=80=9D, li=
ne 1, in <module>
>> File
>> > =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in <=
module>
>> > ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99 |
>>
>>   tkinter.py is always installed, but it simply tries to import the
>> _tkinter.so
>> shared object file. Since we pass --disable-tk in the configuration of
>> python3,
>> this shared object file doesn't exist.
>>
>> >
>> > I understand what the error itself means (that it can't find the
>> tkinter module)
>> > but I'd like to figure out why this isn't getting included in the
>> build. From my
>> > understanding, by default the option for tkinter was disabled in the
>> > |/packages/python3/python.mk <http://python.mk>| file. I changed all
>> the
>> > |--disable tk| statements to |--enable tk|. I additionally ensured the
>> tcl and
>> > tk target packages (under "Language interpreter" and "graphical
>> interface",
>> > respectively) were included.
>>
>>   You'll also need to add a dependency to python.mk, to make sure tk is
>> built
>> before python.
>>
>>   However, if no option was added to enable tkinter, then perhaps that's
>> because
>> nobody has gotten it to work up till now...
>>
>> >
>> > I verified in the flashed image that under |/usr/..../python3.11/|
>> there is a
>> > tkinter folder that has an |__init__.py| script as expected (which
>> based on the
>> > callback error it's finding). The existence of the
>> > |/usr/..../python3.11/tkinter| folder leads me to believe that tkinter
>> is being
>> > added/built with python but there's something else with the
>> configuration that's
>> > not correct.
>>
>>   Well, the current --disable-tk option is a bit of a hack: it still
>> installs
>> the tkinter folder but the shared object file is missing.
>>
>>   I think this will be "solved" when we go to python 3.12, in that there
>> will
>> not be a tkinter folder at all. But that doesn't help you of course :-)
>>
>>
>> > Searching the archives and around the internet, I found a few other
>> mentions of
>> > a similar issue that were resolved with various patches. I created a
>> global
>> > patch folder one level up (outside) of my buildroot dir and configured
>> the
>> > global patch directory in the makemenu. I tried including the patches
>> in a
>> > "/python3/" directory within the global patch dir but I've not had
>> positive
>> > results with those either.
>> >
>> > This is all a long way of saying that I feel I'm missing something
>> *simple* here
>> > but for the life of me I can't figure out what. Any suggestions?
>>
>>   It is probably not simple to build tkinter... Although... I just tried
>> a build
>> with --enable-tk and with tk added to PYTHON3_DEPENDENCIES, and I do get
>> a
>> /usr/lib/python3.11/lib-dynload/_tkinter.cpython-311-x86_64-linux-gnu.so
>> - I
>> have not tried importing it, but I don't see why it shouldn't work...
>>
>>   Regards,
>>   Arnout
>>
>>

--00000000000033c4e8060c2caf9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I&#39;m happy to report this did, in=
 fact, solve the issue. Appreciate the help! I&#39;m able to import the lib=
raries as expected now as well as other tkinter related libraries. I ran my=
 test python script with just a &quot;hello world&quot; in a window (as is =
customary) and everything worked as expected.</div><div><br></div><div>When=
 I get the chance, I&#39;m going to give my hand at modifying the Config.in=
 file for python as well as the <a href=3D"http://python.mk">python.mk</a> =
file to have &quot;tk&quot; show up as an option in the &quot;core python3 =
modules&quot; menu. Shouldn&#39;t take much but i&#39;ll have to verify on =
my end it plays nice with everything and builds as expected.</div><div><br>=
<span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Thanks,<div><br></div><div>-Jungle_Ji=
m</div></div></div>

</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, Dec 9, 2023 at 6:55=E2=80=AFPM John Langholz &lt;<a href=3D"m=
ailto:jlangholzj@gmail.com">jlangholzj@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Arnou=
t, I appreciate the insights. <br></div><div><br></div><div>I&#39;ll admit =
that I didn&#39;t fully understand the various idiosyncrasies with the &quo=
t;disable/enable-tk&quot; options in the <a href=3D"http://python.mk" targe=
t=3D"_blank">python.mk</a> file. Looking through the file I did notice that=
 the other python packages configurable in the make menu (like SQLite, SSL,=
 etc.) had the ifeq statements to add them as a dependency. I understood th=
at tkinter was installed with python but I was curious why there wasn&#39;t=
 a similar option for tk. Seeing all of this now, I understand changing the=
 options to &quot;enable-tk&quot; was really only half of the equation.<br>=
</div><div><br></div><div>I&#39;ve been continuing to look around in my fre=
e time to try and (really) understand how buildroot is working. I actually =
just got to reading about how the various dependencies are built, so your r=
eply is serendipitous. I think the &quot;simple&quot; miss I had suspected =
is the missing dependency. If I understand your response correctly, tk is s=
till being installed and built but without the dependency 1) the shared obj=
ect isn&#39;t created and 2) python also really doesn&#39;t know what to do=
 with it anyway since it&#39;s (tk) not being built first. That would expla=
in everything I&#39;m seeing on my end.<br></div><div><br></div><div>I&#39;=
ll add a line in the <a href=3D"http://python.mk" target=3D"_blank">python.=
mk</a> file for &quot;PYTHON_DEPENDENCIES +=3D tk&quot; and try a build and=
 see what happens and report back.<br></div><div></div><div>
<span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Thanks,<div><br></div><div>-Jungle_Ji=
m</div></div></div>

</div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, Dec 9, 2023 at 5:58=E2=80=AFPM Arnout Vandecappelle &lt;=
<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 02/12/2023 19:41, John Langholz wrote:<br>
&gt; I&#39;ve been working on making an image for a raspberry pi (specifica=
lly, a CM4) <br>
&gt; and have hit a bit of a roadblock with python and tkinter. I&#39;ve be=
en able to <br>
&gt; include some additional external modules and verified they work in a p=
ython <br>
&gt; shell but I&#39;ve been having issues getting tkinter to work appropri=
ately. When <br>
&gt; I&#39;m in a python shell and try &quot;import tkinter&quot; it throws=
 a traceback error:<br>
&gt; <br>
&gt; |Traceback (most recent call last): File =E2=80=9C&lt;stdin&gt;=E2=80=
=9D, line 1, in &lt;module&gt; File <br>
&gt; =E2=80=9C/usr/lib/python311/tkinter/__init__.py=E2=80=9D, line 38 in &=
lt;module&gt; <br>
&gt; ModuleNotFoundError: No module named =E2=80=98_tkinter=E2=80=99 |<br>
<br>
=C2=A0 tkinter.py is always installed, but it simply tries to import the _t=
kinter.so <br>
shared object file. Since we pass --disable-tk in the configuration of pyth=
on3, <br>
this shared object file doesn&#39;t exist.<br>
<br>
&gt; <br>
&gt; I understand what the error itself means (that it can&#39;t find the t=
kinter module) <br>
&gt; but I&#39;d like to figure out why this isn&#39;t getting included in =
the build. From my <br>
&gt; understanding, by default the option for tkinter was disabled in the <=
br>
&gt; |/packages/python3/<a href=3D"http://python.mk" rel=3D"noreferrer" tar=
get=3D"_blank">python.mk</a> &lt;<a href=3D"http://python.mk" rel=3D"norefe=
rrer" target=3D"_blank">http://python.mk</a>&gt;| file. I changed all the <=
br>
&gt; |--disable tk| statements to |--enable tk|. I additionally ensured the=
 tcl and <br>
&gt; tk target packages (under &quot;Language interpreter&quot; and &quot;g=
raphical interface&quot;, <br>
&gt; respectively) were included.<br>
<br>
=C2=A0 You&#39;ll also need to add a dependency to <a href=3D"http://python=
.mk" rel=3D"noreferrer" target=3D"_blank">python.mk</a>, to make sure tk is=
 built <br>
before python.<br>
<br>
=C2=A0 However, if no option was added to enable tkinter, then perhaps that=
&#39;s because <br>
nobody has gotten it to work up till now...<br>
<br>
&gt; <br>
&gt; I verified in the flashed image that under |/usr/..../python3.11/| the=
re is a <br>
&gt; tkinter folder that has an |__init__.py| script as expected (which bas=
ed on the <br>
&gt; callback error it&#39;s finding). The existence of the <br>
&gt; |/usr/..../python3.11/tkinter| folder leads me to believe that tkinter=
 is being <br>
&gt; added/built with python but there&#39;s something else with the config=
uration that&#39;s <br>
&gt; not correct.<br>
<br>
=C2=A0 Well, the current --disable-tk option is a bit of a hack: it still i=
nstalls <br>
the tkinter folder but the shared object file is missing.<br>
<br>
=C2=A0 I think this will be &quot;solved&quot; when we go to python 3.12, i=
n that there will <br>
not be a tkinter folder at all. But that doesn&#39;t help you of course :-)=
<br>
<br>
<br>
&gt; Searching the archives and around the internet, I found a few other me=
ntions of <br>
&gt; a similar issue that were resolved with various patches. I created a g=
lobal <br>
&gt; patch folder one level up (outside) of my buildroot dir and configured=
 the <br>
&gt; global patch directory in the makemenu. I tried including the patches =
in a <br>
&gt; &quot;/python3/&quot; directory within the global patch dir but I&#39;=
ve not had positive <br>
&gt; results with those either.<br>
&gt; <br>
&gt; This is all a long way of saying that I feel I&#39;m missing something=
 *simple* here <br>
&gt; but for the life of me I can&#39;t figure out what. Any suggestions?<b=
r>
<br>
=C2=A0 It is probably not simple to build tkinter... Although... I just tri=
ed a build <br>
with --enable-tk and with tk added to PYTHON3_DEPENDENCIES, and I do get a =
<br>
/usr/lib/python3.11/lib-dynload/_<a href=3D"http://tkinter.cpython-311-x86_=
64-linux-gnu.so" rel=3D"noreferrer" target=3D"_blank">tkinter.cpython-311-x=
86_64-linux-gnu.so</a> - I <br>
have not tried importing it, but I don&#39;t see why it shouldn&#39;t work.=
..<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000033c4e8060c2caf9d--

--===============1795592690551816394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1795592690551816394==--
