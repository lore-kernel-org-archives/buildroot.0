From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Oct 2018 09:45:56 +0200
Subject: [Buildroot] [PATCH 0/3] fs: fix and better handle capabilities
Message-ID: <cover.1540626349.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by Ricardo in #11216, and recently noticed thanks to the
runtime tests he added, handling file capabilities is broken.

Ricardo did a very good job at pinpointing the issue, and that is caused
by the recent-ish split of the filesystem infra with the use of the
intermediate tarball.

It turns out that playing with fakeroot, tar, and capabilities is a lost
game, as fakeroot behaves badly with the special handling tar does with
the security.capability extended attribute.

To fix that, we postpone handling of capabilities later, down into each
filesystem commands, right after extracting the intermediate tarball.

Discussion about this at the developers days lead to the suggestion
that, maybe, we should in fact not use an intermediate tarball, and
instead have each filesystem duplicate the currently common actions.

This is a bigger endeavour, and one that needs more thinking into.
In the meantime, this patchset is a pragmatic approach to solve the
problem.


Regards,
Yann E. MORIN.


The following changes since commit cbf62fc5692cc04a2f721260d5e7f8a2558b4bb1

  mysql: properly order "depends on" vs. bool (2018-10-26 21:28:31 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 99d38f609529976ec574c3a05b6665cf3dd0669d

  fs: fix condition to create static devices (2018-10-27 09:43:55 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      fs: apply permissions late
      fs: be oblivious of pre-existing xattrs
      fs: fix condition to create static devices

 fs/common.mk | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
