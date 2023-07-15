Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB636EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 03:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39FE740022;
	Sat, 15 Jul 2023 03:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39FE740022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udALRFcc6r4i; Sat, 15 Jul 2023 03:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BB8400D1;
	Sat, 15 Jul 2023 03:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29BB8400D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0897D1BF38C
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 03:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4FD682C8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 03:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FD682C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsjgDGXWJgOt for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 03:02:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C9F582C84
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C9F582C84
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 03:02:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso38796671fa.3
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 20:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689390156; x=1691982156;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59HBW/Rv1AjK69VICHszonC5o1FmcFvgnpWZPyJdqr4=;
 b=O1DycDMdMvGiNKnQ+Uh7p9TIv3Aie4N5G6JQJQc3tcEiECV6hlUrbjmSnj7t+9eKUB
 /LuuGVNapS8rW2k+HFz2Od0ncNmcAy8+n0QRMRY7G5NbHkOGszNme0JpUqgKIBqIwqOM
 pUqg1Mt95TdD6zU7WvnucGb6DhX/DIdScyFqVBQBWydVWDWM46/5jLuZXeHaLlBCMWpQ
 ShWNA37PHC5jw4wwV40gi+9dFZd8D1Pnb0Zo3wvIhxJA93E+kROtSFhyMmvL9H+pcFyB
 OqPjYD9BaeBQ9/7OI+Nm5yhnUhnZXjVZKsbTfaeabNMnHafZqiZHTiYwXZN6fdVaKi/p
 qwnw==
X-Gm-Message-State: ABy/qLaukh8ivDWAFCOOge0f+Jt3PYnJaR/cmjQhC8BLvIRh2yFY8Ru+
 qsdrmE8EkULxV3bfWyMW3bMhMLtG7ZzEqHO+u41QnH44S3Aylg==
X-Google-Smtp-Source: APBJJlEoO8jPXwfrDdZ+LhtbKhlpQYMBhghaUlAZoFpSk6phGP6C6DfNJ47FS2ASes7GKVrD3TDDg6cltZdyQGs1ysI=
X-Received: by 2002:a05:6512:4007:b0:4f8:6c1f:b1ab with SMTP id
 br7-20020a056512400700b004f86c1fb1abmr6430145lfb.27.1689390155187; Fri, 14
 Jul 2023 20:02:35 -0700 (PDT)
MIME-Version: 1.0
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2023 20:02:23 -0700
Message-ID: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 Arnout Vandecappelle <arnout@mind.be>, Luca Ceresoli <luca@lucaceresoli.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689390156; x=1691982156;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=59HBW/Rv1AjK69VICHszonC5o1FmcFvgnpWZPyJdqr4=;
 b=YxWVeKrAXPEysfDxwqx2dxlJvfK/S93yzMEBTMadb7PhcU4/PQoiQs4rHGiZO2XdFa
 r5LwF2g94GC3kg5pqEVE04uT3S2QJ0tfHgiKgsiwyDZNm25kRCwYl6b4qhlQqhsgdec4
 rxjCMZAjvK6CHWDiI58J7Ed9Cgwvz289igBxD6KSiB819xckZ8ICLv9sdVr6EkCbc+KQ
 dM26V5j4OCW7Vcz+e8ScwIQTGmrYTSrk1iQ0VCwhQH7+czuV+N3pRAHiumrzNQlor6mJ
 4rXJy/dDDH4wncQEYw19fyW9mlkGUrqpWkKwhT60vvtuH9LojerqQae5G8ocXUwF9TeN
 DBRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YxWVeKrA
Subject: [Buildroot] Flutter-engine package help wanted.
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
Content-Type: multipart/mixed; boundary="===============1763350791948154207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1763350791948154207==
Content-Type: multipart/alternative; boundary="000000000000164a4206007dccc6"

--000000000000164a4206007dccc6
Content-Type: text/plain; charset="UTF-8"

Hello! I have a task to port Flutter to Buildroot and to make the packages
suitable for the master branch.

I have talked with Yann in IRC about the problems facing the first package,
flutter-engine [https://github.com/flutter/engine]. However, after another
full
day of hacking away at the package, it's time to talk about a significant
problem I must overcome.

Here is a summary of the issue I am facing and the main reason for the
email:

Flutter is developed and maintained by Google.
Of course, it stands to reason that Flutter does not use a conventional
configure/build system. Oh no, it couldn't be that easy. Instead, Flutter
uses
gclient and gn from the chromium depot_tools repository, which contains all
sorts of exciting utilities. One of which is gclient.

What is gclient? From:
https://www.chromium.org/developers/how-tos/depottools

gclient is a Python script to manage a workspace of modular dependencies
that
are each checked out independently from different subversion or git
repositories. Features include:

  - Dependencies can be specified on a per-OS basis.
  - Dependencies can be specified relative to their parent dependency.
  - Variables can be used to abstract concepts.
  - Hooks can be specified to be run after a checkout.
  - .gclient and DEPS are Python scripts. You can hack in easily or add
     additional configuration data.

.gclient file: It's the primary file. It is, in fact, a Python script. It
specifies the following variables:

  - solutions: an array of dictionaries specifying the projects that will be
               fetched.
  - hooks: additional hooks to be run when this meta checkout is synced.
  - target_os: an optional array of (target) operating systems to fetch
               OS-specific dependencies for.
  - cache_dir: Primarily for bots, multiple working sets use a single git
               cache.


Why is this a significant issue?

The release tarballs from https://github.com/flutter/engine are in no state
to
compile! No, they are only for the use of gclient to download and build a
source directory structure suitable to build the Flutter engine! If you
download, extract and attempt to run
./tools/gn --no-goma --no-prebuilt-dart-sdk,
you receive the error message:
No such file or directory: 'flutter/flutter/third_party/gn/gn.'

But wait! Wasn't the gn binary just called? No, that's a wrapper in the
Flutter
source tree that formats arguments to call the real gn binary. The real gn
is
not provided in the tarball but is downloaded via gclient
(among many other repositories.)

The above leads to the question: What do we do about this? We can't use the
existing download infrastructure to download the tarball from Git Hub, as
that
isn't meant for us. The gclient download works if called out directly via a
pre_download hook; however, this leads to other issues in recreating a
consistent tarball because gclient writes the date to various files all
around
the directory, thus changing the shasum every time I attempt to generate a
tarball. I can sed the dates in a flutter-engine-gen-tarball script I've
made,
which solves the problem; however, there is one last hurdle to overcome:
When I
compress the directory created by gclient, any .git folder in a subdirectory
also changes when running mk_tar_gz from the script. The .git directories,
of
course, can be removed, and that DOES create a reproducible tarball, but the
build system relies on the .git directories to fill in a bunch of
information
before configuring, causing failures.

I won't ask the best course of action because anything we decide will be
pretty
ugly, thanks to Google and its decisions. Instead, I will ask, what is the
least-bad solution that can be upstreamed to the master branch?

If you want to play around with any of this, you can clone
git@gitlab.com:aduskett/buildroot-flutter.git and build the
flutter_defconfig.

Thanks!
Adam

--000000000000164a4206007dccc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello! I have a task to port Flutter to Buildroot and to m=
ake the packages<br>suitable for the master branch.<br><br>I have talked wi=
th Yann in IRC about the problems facing the first package,<br>flutter-engi=
ne [<a href=3D"https://github.com/flutter/engine">https://github.com/flutte=
r/engine</a>]. However, after another full<br>day of hacking away at the pa=
ckage, it&#39;s time to talk about a significant<br>problem I must overcome=
.<br><br>Here is a summary of the issue I am facing and the main reason for=
 the email:<br><br>Flutter is developed and maintained by Google.<br>Of cou=
rse, it stands to reason that Flutter does not use a conventional<br>config=
ure/build system. Oh no, it couldn&#39;t be that easy. Instead, Flutter use=
s<br>gclient and gn from the chromium depot_tools repository, which contain=
s all<br>sorts of exciting utilities. One of which is gclient.<br><br>What =
is gclient? From: <a href=3D"https://www.chromium.org/developers/how-tos/de=
pottools">https://www.chromium.org/developers/how-tos/depottools</a><br><br=
>gclient is a Python script to manage a workspace of modular dependencies t=
hat<br>are each checked out independently from different subversion or git<=
br>repositories. Features include:<br><br>=C2=A0 - Dependencies can be spec=
ified on a per-OS basis.<br>=C2=A0 - Dependencies can be specified relative=
 to their parent dependency.<br>=C2=A0 - Variables can be used to abstract =
concepts.<br>=C2=A0 - Hooks can be specified to be run after a checkout.<br=
>=C2=A0 - .gclient and DEPS are Python scripts. You can hack in easily or a=
dd<br>=C2=A0 =C2=A0 =C2=A0additional configuration data.<br><br>.gclient fi=
le: It&#39;s the primary file. It is, in fact, a Python script. It<br>speci=
fies the following variables:<br><br>=C2=A0 - solutions: an array of dictio=
naries specifying the projects that will be<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fetched.<br>=C2=A0 - hooks: additional hooks to =
be run when this meta checkout is synced.<br>=C2=A0 - target_os: an optiona=
l array of (target) operating systems to fetch<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OS-specific dependencies for.<br>=C2=A0 - ca=
che_dir: Primarily for bots, multiple working sets use a single git<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache.<br><br><br>Why i=
s this a significant issue?<br><br>The release tarballs from <a href=3D"htt=
ps://github.com/flutter/engine">https://github.com/flutter/engine</a> are i=
n no state to<br>compile! No, they are only for the use of gclient to downl=
oad and build a<br>source directory structure suitable to build the Flutter=
 engine! If you<br>download, extract and attempt to run<br>./tools/gn --no-=
goma --no-prebuilt-dart-sdk,<br>you receive the error message:<br>No such f=
ile or directory: &#39;flutter/flutter/third_party/gn/gn.&#39;<br><br>But w=
ait! Wasn&#39;t the gn binary just called? No, that&#39;s a wrapper in the =
Flutter<br>source tree that formats arguments to call the real gn binary. T=
he real gn is<br>not provided in the tarball but is downloaded via gclient<=
br>(among many other repositories.)<br><br>The above leads to the question:=
 What do we do about this? We can&#39;t use the<br>existing download infras=
tructure to download the tarball from Git Hub, as that<br>isn&#39;t meant f=
or us. The gclient download works if called out directly via a<br>pre_downl=
oad hook; however, this leads to other issues in recreating a<br>consistent=
 tarball because gclient writes the date to various files all around<br>the=
 directory, thus changing the shasum every time I attempt to generate a<br>=
tarball. I can sed the dates in a flutter-engine-gen-tarball script I&#39;v=
e made,<br>which solves the problem; however, there is one last hurdle to o=
vercome: When I<br>compress the directory created by gclient, any .git fold=
er in a subdirectory<br>also changes when running mk_tar_gz from the script=
. The .git directories, of<br>course, can be removed, and that DOES create =
a reproducible tarball, but the<br>build system relies on the .git director=
ies to fill in a bunch of information<br>before configuring, causing failur=
es.<br><br>I won&#39;t ask the best course of action because anything we de=
cide will be pretty<br>ugly, thanks to Google and its decisions. Instead, I=
 will ask, what is the<br>least-bad solution that can be upstreamed to the =
master branch?<br><br>If you want to play around with any of this, you can =
clone<br>git@gitlab.com:aduskett/buildroot-flutter.git and build the flutte=
r_defconfig.<br><br>Thanks!<br>Adam</div>

--000000000000164a4206007dccc6--

--===============1763350791948154207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1763350791948154207==--
