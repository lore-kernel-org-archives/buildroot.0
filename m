From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 00:26:01 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-package-create-user
Message-ID: <cover.1356909238.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here is a series that allows packages to create users.

Packages that install daemons may well want to run those daemons as
non-root users to avoid security issues. Currently, there are two users
of choice to run 'generic' daemons: root or daemon (although there are
a few dedicated users to run a few services: mail, sshd, ftp...).

This series builds upon both the package infrastrucutre to define the
user(s) a package may want to create, and the filesystem infrastructure
to actually generate these users, and chown their ${HOME}s.

Documentation is updated accordingly.

Note: for now, users' passwords are md5-encrypted. Once the pending
change to introduce alternative password-encryption schemes is applied,
we can use that to encode users' passwords, too.

As a proof of concept, the package tvheadend has been updated to use
a dedicated user to run its daemon as (call me stubborn! ;-] ).


The following changes since commit f1d44593a04ff3be981c8a3b01a502f0b18193ee:

  docs/manual: small fixes and enhancements to adding generic packages (2012-12-30 22:39:13 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-package-create-user

Yann E. MORIN (3):
      system/skeleton: add the shadow-group file
      packages: add ability for packages to create users
      package/tvheadend: use a non-root user to run the daemon

 docs/manual/adding-packages-generic.txt |   16 ++-
 docs/manual/makedev-syntax.txt          |   65 ++++++
 fs/common.mk                            |    5 +-
 package/pkg-generic.mk                  |    1 +
 package/tvheadend/etc.default.tvheadend |    5 +-
 package/tvheadend/tvheadend.mk          |   10 +-
 support/scripts/mkusers                 |  341 +++++++++++++++++++++++++++++++
 system/skeleton/etc/gshadow             |   21 ++
 8 files changed, 456 insertions(+), 8 deletions(-)
 create mode 100755 support/scripts/mkusers
 create mode 100644 system/skeleton/etc/gshadow

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
