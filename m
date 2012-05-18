From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 18 May 2012 14:06:54 +0100
Subject: [Buildroot] [PATCH 1/2] vala: do not append a -dirty suffix to
 the valac version number
In-Reply-To: <87fwaxop2t.fsf@macbook.be.48ers.dk>
References: <1337170229-29684-1-git-send-email-spdawson@gmail.com>
 <87fwaxop2t.fsf@macbook.be.48ers.dk>
Message-ID: <CAHt8ZCNqGagUPjq4ZvfRBKogfbVfKJnRH7mR6rpL7LPYdvdtuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Why is this needed? We don't apply any patches to vala, and I don't see
> any "-dirty" suffix in valac --version:
>
> ./output/host/usr/bin/valac --version
> Vala 0.15.2

It may be because the Buildroot checkout in which you are testing has
no uncommitted changes. The valac build process calls

$ git diff-index --name-only HEAD 2>/dev/null

and appends the -dirty version suffix if anything is returned. In my
case --- with uncommitted changes to my Buildroot Git checkout --- the
-dirty suffix does get applied. Consequently, for me:

$ ./output/host/usr/bin/valac --version
Vala 0.15.2-dirty

In essence, I think the patch is necessary in order to prevent the
valac build process from falling foul of uncommitted changes in the
local Buildroot checkout. Of course, if you've got uncommitted changes
in the repository in which you're testing, then my theory goes out of
the window...

Simon.
