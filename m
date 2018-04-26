From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 26 Apr 2018 00:01:51 -0300
Subject: [Buildroot] [PATCH 5/7 v3] download/git: ensure we checkout to
 a clean state
References: <912437d7c2ce182df06651c58edb301ee1830a06.1524426211.git.yann.morin.1998@free.fr>
Message-ID: <5ae1411f954e7_797d2acbf57d0d34599bb@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 22, 2018 at 04:44 PM, Yann E. MORIN wrote:

> Force the checkout to ignore any local changes. This allows recovering

Nit: actually it does not 'ignore' local changes. It overwrites them. Right?
The help says "to throw away local changes".

> from a previous partial checkout (e.g. killed by the user, or by a CI
> job...)

This patch covers *some* cases of partial checkout, but not all.
A partial checkout also can lead to untracked files.

An easy way to check this is to run on a linux tree:
git checkout -f v4.14 
git checkout -f v4.4 # ctrl+c when the checkout is around 50%
git checkout -f v4.5
git status

Without the next patch, that brings 'git clean', when previously there is an
untracked file in the worktree, all git commands succeed, but that file is
included in the tarball and the hash mismatches.

Can we bring 'git clean' to this patch?
Or do we adjust the commit title/message?

> 
> git checkout -f has been supported since the inception of git, so we can
> use it without any second thought.

Regards,
Ricardo
