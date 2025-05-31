Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07175C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 09:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B13C060762;
	Sat, 31 May 2025 09:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7wCQiMAW0wm; Sat, 31 May 2025 09:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC50E60763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC50E60763;
	Sat, 31 May 2025 09:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBC7235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B4983264
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMkvcKHrZMxF for <buildroot@buildroot.org>;
 Sat, 31 May 2025 09:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=vkmoni18@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6BCF831F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BCF831F5
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BCF831F5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:36:51 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id
 41be03b00d2f7-af5085f7861so1670015a12.3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 02:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748684211; x=1749289011;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hATZ2fNSUYFTbVg6va+yoVjzTHZQPKq5NNEJrVhGfzU=;
 b=hM0tbla4xpBdHOyx2anPfHU596kvyxp3N0jwlC4Wy0FZ6yrAvZ/cLLJVYUh9j2eN92
 iBxUolcy6xELoXckZ35IvXyAMHejG2mKaJylvptsC5aOXDVlmnhvrPAfmecJZ9IoLLfW
 JTTB0xJqefpqKbjjEDOM9n1WvoB18LO5LCVem0z1zmSPRy03FJjs1eZtM+fE01kyuLBj
 ZNyAny4FSzLFuP3f568ypIbKqiriV7q1BEg7YJngE40Lm3MPF1cDYmcc9tTHWht8++Xb
 qlzO6YIN0ET9+XeS1agSFY0g4owTQ+TbuX2NYACaYUPFe7gQvj8dm2YGU6c0Nqi8VE0l
 INKw==
X-Gm-Message-State: AOJu0YyDVw0yFuyRnQRq/vUlQV6LDUPnKgK4TswNb9oR29g9VJ4oiY+a
 cjSYpwXgAtO8m72FFeN9LUGqXxDovLnncYsKfN8TafZYih2HRNF0Th+p9ZVANmHR18D3FHerHBb
 XvkfaNqSSOo6rKw06BLrinxf26hi5xS5f9DIFir57mc/NC+RYoA==
X-Gm-Gg: ASbGncucf5AlmWXp1kpdHIgrUhkrX881ShZKVawqYwtzdQK8pD1gSYzucThnC7y9BZB
 VDC3SX57eZevJtGhrEtZnk4EFdlmxx9UwALvBGp8NI7ZrkkBGAp0hF47voh69pwOMcFKQ5ebpoR
 mK8jlCDa5vx1fCN5oUB2iDTxTQldF4kvyc1Qfle1yLv/NggQ==
X-Google-Smtp-Source: AGHT+IF3S2kJe5pbnfZ09TXlHyC0yKvun7lrD3jrVudouSRsgEUz5EzlverJLJcYHxsTESNG7gCQXU9Cqe8vXZPumrc=
X-Received: by 2002:a17:90b:3d8c:b0:311:ea13:2e62 with SMTP id
 98e67ed59e1d1-31250440cacmr8071993a91.24.1748684210945; Sat, 31 May 2025
 02:36:50 -0700 (PDT)
MIME-Version: 1.0
From: monish moni <vkmoni18@gmail.com>
Date: Sat, 31 May 2025 15:06:39 +0530
X-Gm-Features: AX0GCFu7Bkd9cUJVj-q7zmkhc4_CSyUCrTC1OVWHCDRmVaKBe8tbbvR7YH1YcyU
Message-ID: <CACmEUZ=i7ZG662hoCOHCEgOg1bxi4iZeV0xaUsM9vhhCgXC0hA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748684211; x=1749289011; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hATZ2fNSUYFTbVg6va+yoVjzTHZQPKq5NNEJrVhGfzU=;
 b=cJ9ZekJ41iG2FpnzLb41HNqVgPjWqRpqw4xTXYlN5dpZ9zXr3THZOSwTGYUBZqhse0
 5FWt938CtNJtr3grGkkDCdP/ICWm9AtNR1bpPwsxH+ANQ4lKbh3yb8vEKMvjiUiVqIQn
 HPPOWGYGF6CQNOMRq/POQWjcDyqLYy6F0ycHgesnBdDQN/G8N7JXiTvteNz+FIvo35lE
 kD8yj8f7U4rO3YRt92x/ADVjxnDod4YZdu0C0IlbFadbtQWm0Rx9d4sDdhx7bVPpQN1+
 qq+b1+JVLBE0gKDFo5omXrXT750mULxJKT4IADkzMm7y6FCJq95Nqbs3F+ZahKep2cRp
 jevQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cJ9ZekJ4
Subject: [Buildroot] [Feature Suggestion] Improve UX when shell hangs from
 `make` autocomplete
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
Content-Type: multipart/mixed; boundary="===============6352181523860734616=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6352181523860734616==
Content-Type: multipart/alternative; boundary="00000000000037c3ae06366b45ef"

--00000000000037c3ae06366b45ef
Content-Type: text/plain; charset="UTF-8"

*Body:*
Hello Buildroot maintainers,

*Problem:*
When working in the Buildroot directory and typing make followed by [Tab] for
autocompletion, the shell (especially Bash or Zsh) may freeze or hang for
several seconds. This happens because the shell attempts to parse the
entire Makefile, which includes thousands of targets, causing performance
issues. Many users are forced to press Ctrl+C to regain control.

*Why this matters:*
This is a common frustration for users exploring Buildroot or working
quickly. It gives the impression that the terminal or tool has crashed,
especially when the user only intended to run something like make menuconfig
.

*Suggestions / Ideas:*

   1.

   *Optional Wrapper Script*
   Provide a simple make-wrapper.sh script that:
   -

      Defaults to make menuconfig if no arguments are provided
      -

      Helps users avoid the autocomplete freeze
      2.

   *Shell Alias for Documentation*
   Suggest a shell alias in .bashrc:

   bash
   make() {
     if [ $# -eq 0 ]; then
       echo "No target given. Defaulting to: make menuconfig"
       command make menuconfig
     else
       command make "$@"
     fi
   }

   3.

   *Document the Issue*
   Include a note in the manual warning about [Tab] autocomplete
   performance in large Makefiles. Suggest optionally disabling make
   completion:

   bash
   complete -r make


*Impact:*
These simple usability enhancements can make Buildroot feel more responsive
and user-friendly, especially for those just getting started.

Best regards,
Monish Kumar
https://github.com/VK-Monish
vkmoni18@gmail.com

--00000000000037c3ae06366b45ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><strong>Body:</strong><br>Hello Buildroot maintainers,<=
/p><p><strong>Problem:</strong><br>When working in the Buildroot directory =
and typing=C2=A0<code>make</code>=C2=A0followed by=C2=A0<code>[Tab]</code>=
=C2=A0for autocompletion, the shell (especially Bash or Zsh) may freeze or =
hang for several seconds. This happens because the shell attempts to parse =
the entire Makefile, which includes thousands of targets, causing performan=
ce issues. Many users are forced to press=C2=A0<code>Ctrl+C</code>=C2=A0to =
regain control.</p><p><strong>Why this matters:</strong><br>This is a commo=
n frustration for users exploring Buildroot or working quickly. It gives th=
e impression that the terminal or tool has crashed, especially when the use=
r only intended to run something like=C2=A0<code>make menuconfig</code>.</p=
><p><strong>Suggestions / Ideas:</strong></p><ol><li style=3D"margin-left:1=
5px"><p><strong>Optional Wrapper Script</strong><br>Provide a simple=C2=A0<=
code>make-wrapper.sh</code>=C2=A0script that:</p><ul><li style=3D"margin-le=
ft:15px"><p>Defaults to=C2=A0<code>make menuconfig</code>=C2=A0if no argume=
nts are provided</p></li><li style=3D"margin-left:15px"><p>Helps users avoi=
d the autocomplete freeze</p></li></ul></li><li style=3D"margin-left:15px">=
<p><strong>Shell Alias for Documentation</strong><br>Suggest a shell alias =
in=C2=A0<code>.bashrc</code>:</p><pre style=3D"text-wrap-mode: wrap;"><div>=
<div>bash</div><div dir=3D"ltr"><code>make() {
  if [ $# -eq 0 ]; then
    echo &quot;No target given. Defaulting to: make menuconfig&quot;
    command make menuconfig
  else
    command make &quot;$@&quot;
  fi
}
</code></div></div></pre></li><li style=3D"margin-left:15px"><p><strong>Doc=
ument the Issue</strong><br>Include a note in the manual warning about=C2=
=A0<code>[Tab]</code>=C2=A0autocomplete performance in large Makefiles. Sug=
gest optionally disabling make completion:</p><pre style=3D"text-wrap-mode:=
 wrap;"><div><div>bash</div><div dir=3D"ltr"><code>complete -r make
</code></div></div></pre></li></ol><p><strong>Impact:</strong><br>These sim=
ple usability enhancements can make Buildroot feel more responsive and user=
-friendly, especially for those just getting started.</p><p>Best regards,<b=
r>Monish Kumar<br><a rel=3D"noopener" href=3D"https://github.com/VK-Monish"=
 target=3D"_blank">https://github.com/VK-Monish</a><br><a rel=3D"noopener">=
vkmoni18@gmail.com</a></p></div>

--00000000000037c3ae06366b45ef--

--===============6352181523860734616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6352181523860734616==--
