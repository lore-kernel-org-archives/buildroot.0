From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jun 2015 18:46:33 +0200
Subject: [Buildroot] [PATCH 0/5 v2] core/pkg-kconfig: fix saving back the
	configuration (branch yem/pr8156)
Message-ID: <cover.1434213146.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is an attempt at fixing the pkg-kconfig infrastructure as
reported in PR8156:
    https://bugs.busybox.net/show_bug.cgi?id=8156

The basic underlying idea of PR8156 is to kick-start the configuration
of a kconfig-based package (say, Linux), using a (def)config bundled in
that package, then tweak that configuration to suit ones needs, and
eventually save it back to a custom (def)config for later re-use.

That is currently broken. It has in fact never worked, but is a
completely valid and useful use-case.

Note also that PR8156 is based on 2015.02, and the pkg-kconfig infra has
changed quite a bit since then, now that it supports kconfig fragments.
So, the exact bug reported in PR8156 is no longer completely accurate to
the current behaviour we can observe.


The underlying problem is that saving the configuration currently has a
dependency chain going all the way down to the base kconfig file.
Because make behaves differently for missing files with no prerequisite,
trying to save the configuration like explained in PR8156 would try to
reconfigure the kernel, which should fail, because of a then-missing
input file (the newly-set kconfig base). This is what is reported in
PR8156.

However, merge-config has a bug, in that it does not error out when one
of its input files is missing, generating garbage in .config , but
otherwise not failing. So, the bug in PR8156 is no longer visible in
current master, and there is no failure, liek make erroring our; the
command ends with a zero exit-code, as if no error had occured.


Fixing those two problems needs to change two things:

  - kconfig base and fragments must be manually checked, see patches 1
    and 2;

  - the dependency chain from *-update-(def)config must be broken to no
    longer go all the way down to the base and fragment kconfig files,
    see patches 3 to 5.


Pfeww, that one was not trivial... ;-)


Changes v1 -> v2:
  - split first two patches  (Thomas)
  - update the comments  (Thomas, me)
  - check for files earlier  (me)
  - rename the newly-introduced macro  (me)


Regards,
Yann E. MORIN.


The following changes since commit 0db1c13559660fce92759bdb1cd225614ba5d8d1:

  bc: patch makeinfo logic (2015-06-13 14:53:01 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pr8156

for you to fetch changes up to 57ba4232a5bc85841bf8076ee3cd65d4bdfbead2:

  core/pkg-kconfig: allow saving config to a non-existing custom config file (2015-06-13 18:29:53 +0200)

----------------------------------------------------------------
Yann E. MORIN (5):
      core/pkg-kconfig: extract package before using kconfig fragments
      core/pkg-kconfig: ensure kconfig base and fragment files exist
      core/pkg-kconfig: move the kconfig fixups to a macro
      core/pkg-kconfig: run the kconfig fixups after exiting configurators
      core/pkg-kconfig: allow saving config to a non-existing custom config file

 package/pkg-kconfig.mk | 71 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
