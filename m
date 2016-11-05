From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Nov 2016 11:46:05 +0100
Subject: [Buildroot] [PATCH 0/2] core: revert to using fakeroot instead of
	pseudo
Message-ID: <cover.1478342758.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We very recently switched to using pseudo instead of fakeroot, because
fakeroot has issues (which are hard to fix) with SELinux-enabled hosts.

pseudo was supposed to fix those issues. It does, but brings up his own
in the process.

Notably, it has a few dependencies when fakeroot had none, thus makes
the build yet a little bit longer.

Also, it is not python3 ready, which breaks hard during its build on
systems which have only python3 installed, or where the default python
is python3. 2to3 is by far not enough to do the conversion, though.
Even though some patches have been started, they are not yet upstream.

But more importantly, it is not a drop-in replacement for fakeroot, and
it breaks our use-case. For example, psedu-devices are created as files
on-disk, and a second run breaks makedevs because it can't create the
device node again.

Since we're now getting far ahead in the stabilisation phase, it makes
sense to throw in the towel and revert bacvk to fakeroot, which for now
has less issues than pseudo.

We only revert two patches: the removal of fakeroot, and the use of
pseudo in the fs infra. The other patches adding pseudo can stay, since
all they did add was a new prompt-less host package, which is depended
upon by noone now, so can't be used.

Yet, we keep the pseudo package, becasue we still have hope that the
python3 issues will be fixed before long, so we will be able to switch
back to yusing pseudo in a short while.


Regards,
Yann E. MORIN.


The following changes since commit 07c1ae90c8890e82e62c22beaa4a72f6e081e96c

  board: atmel: genimage: add 1M offset for FAT partition (2016-11-04 15:13:59 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 36f1f34245e00371a238d122d495393e9d383dc8

  Revert "fs: use pseudo instead of fakeroot" (2016-11-04 22:28:05 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      Revert "package/fakeroot: remove"
      Revert "fs: use pseudo instead of fakeroot"

 fs/common.mk                                 |  4 ++--
 package/fakeroot/0001-hide-dlsym-error.patch | 34 ++++++++++++++++++++++++++++
 package/fakeroot/fakeroot.hash               |  4 ++++
 package/fakeroot/fakeroot.mk                 | 20 ++++++++++++++++
 4 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 package/fakeroot/0001-hide-dlsym-error.patch
 create mode 100644 package/fakeroot/fakeroot.hash
 create mode 100644 package/fakeroot/fakeroot.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
