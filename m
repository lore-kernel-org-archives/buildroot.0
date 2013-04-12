From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Apr 2013 19:14:17 +0200
Subject: [Buildroot] [pull request v9] Pull request for branch
	yem-package-create-user
Message-ID: <cover.1365786584.git.yann.morin.1998@free.fr>
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

As a proof of concept, the package tvheadend has been updated to use
a dedicated user to run its daemon as (call me stubborn! ;-] ).


Changes v8 -> v9:
  - rebased on master for Peter

Changes v7 -> v8:
  - rebased on master, fixed conflicts in docs/manual

Changes v6 -> v7:
  - rebased onto the 'next' branch for Peter

Changes v5 -> v6:  (All after suggestions by Arnout)
  - clean up awk invocations
  - ensure users with an explicit uid are created before users with a
    computed uid
  - ditto for groups/gid
  - cleanup group-addign function
  - fix password encoding method
  - cleanup /etc/shadow fields
  - fix typos

Changes v4 -> v5:
  - rebased ontop master after Developer's Day comments and upstreaming

Changes v3 -> v4:
  - use the configured password encryption scheme
  - some tweaks and typo-fixes to the documentation

Changes v2 -> v3:
  - clarify password prefixes (Samuel)
  - move makeuser syntax doc to its own file (Samuel)
  - use awk instead of sed to parse /etc/passwd et al. (Cam, Thomas)
  - sanitise use of grep (Cam)
  - enhancements and fixes to makuser syntax doc (Cam)

Changes v1 -> v2:
  - drop the gshadow patch (Thomas, Peter)
  - tvheadend user is now part of the video secondary group


The following changes since commit 7219dfa275abaf332cb3828be381436147f41f04:

  nitrogen6x: get rid of ext2 rev 1 notice now we can create it directly instead (2013-04-12 15:02:18 +0200)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-package-create-user

Yann E. MORIN (2):
      packages: add ability for packages to create users
      package/tvheadend: use a non-root user to run the daemon

 docs/manual/adding-packages-generic.txt |   16 +-
 docs/manual/appendix.txt                |    1 +
 docs/manual/makeusers-syntax.txt        |   87 +++++++
 fs/common.mk                            |    3 +
 package/pkg-generic.mk                  |    1 +
 package/tvheadend/etc.default.tvheadend |    5 +-
 package/tvheadend/tvheadend.mk          |   10 +-
 support/scripts/mkusers                 |  409 +++++++++++++++++++++++++++++++
 8 files changed, 525 insertions(+), 7 deletions(-)
 create mode 100644 docs/manual/makeusers-syntax.txt
 create mode 100755 support/scripts/mkusers

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
