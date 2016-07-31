From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Aug 2016 00:35:52 +0200
Subject: [Buildroot] [PATCH 0/2 v2] support/download: make the git helper
	more robust (branch yem/dl-git-robust)
Message-ID: <cover.1470004037.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series is an attempt at making our download git helper be
more robust in the face of unexpected and strange errors.

What prompted the series is a set of totally weird and unexplained
download failures on my autobuilder instance.

Most notably, those two failures are the most prominent ones:

  - http://autobuild.buildroot.net/results/20f/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/
    find is failing to find any file

  - http://autobuild.buildroot.org/results/018/018971ea9227b386fe25d3c264c7e80b843a9f68/
    tar is failing to stat its fd for the -T option

Although those errors are most probably caused by hardware issues (to
still be investigated), we do really need to catch those errors.

We were so far failing to do so, because the way the script was written:
we can't catch failures for left-hand sides of pipes, nor can we catch
failures of process substitutions.

This series fixes those issue.

Additionally, we have code to fetch special refs exposed by various
forges, like Github PRs or Gerrit changes. However, when using a plain
ref (e.g. a tag or a sha1), the checkout would emit a really confusing
warning message.

We also fix that by only fetching the ref if we do not already have the
necessary cset locally.


Changes v1 -> v2:
  - drop the pipe in the find command in the first patch;
  - add the second patch about special refs.


Regards,
Yann E. MORIN.


The following changes since commit 59899f40f1777c3120881947cbd078b42efb05cb

  strace: bump to version 4.13 (2016-07-31 22:22:21 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to de318be75bdcad45f90ddb81d86911b72951e607

  support/download: be more conservative about git special refs (2016-08-01 00:19:05 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/download: make the git wrapper more robust
      support/download: be more conservative about git special refs

 support/download/git | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
