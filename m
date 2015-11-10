From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Nov 2015 22:36:26 +0100
Subject: [Buildroot] [pull request] skeleton: fix custom skeleton for use
	with systemd
Message-ID: <cover.1447190450.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

The current situation with systemd and a custom skeleton is a little bit
muddy.

Buildroot does not support a split /usr when systemd is used as the init
system. We also have some tricks and tweaks in a few packages to
accomodate a merged /usr and play nice with systemd.

However, when a custom skeleton is used, the user may provide a skeleton
with a split /usr. In that case, our little tricks and tweaks may no
longer be functional.

Since we defined a policy in Buidroot that we use a merged /usr for use
with systemd, we must ensure that a custom skeleton is set up for a
merged /usr when systemd is used.

The series is pretty trivial, with two initial cleanup patches. The
third patch is the core of the change, and actually implements the test
that the custom skeleton actually uses a merged /usr when required.

Regards,
Yann E. MORIN.


The following changes since commit 185aa5b0f0a630b14885b78fb0033397ce7eb3a1:

  gettext: fix legal info (2015-11-10 11:28:51 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/systemd-merged-usr-fix

for you to fetch changes up to d667c39209bc260f60546ee0b9e7f5a661c4b761:

  package/skeleton: ensure custom skeleton uses merged /usr if needed (2015-11-10 19:58:42 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/skeleton: qstrip path before using it
      package/skeleton: don't handle merged /usr for custom skeleton
      package/skeleton: ensure custom skeleton uses merged /usr if needed

 package/skeleton/skeleton.mk | 46 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
