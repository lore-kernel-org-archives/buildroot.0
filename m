From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2020 23:08:39 +0200
Subject: [Buildroot] [PATCH 0/2] gitlab-ci: fix and handle the weekly
 scheduled pipeline (branch yem/gitlab-ci-schedule)
Message-ID: <cover.1600722514.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Our weekly scheduled pipeline no longer builds the defconfigs (it only
checks them for validity), and also no longer builds the runtime tests
either.

This seems to have been caused by the fact that a scheduled pipeline is
(no longer) recognised as a triggerred pipeline by gitlab-CI, and so
does not match our current heurostocs.

This series fixes the priority of pipeline creation conditions, and adds
the scheduled condition, both to the defconfigs and the runtime tests.

note however that the jobs limit if 500 on gitlab.com, and the current
weekly schedule would created ~588 jobs. As a consequence, the pipeline
*will* fail.

But until we find a better solution, let's at least fix the conditions
under which it should fail! :-]

Here is a result of the new scheduled pipeline:
    https://gitlab.com/ymorin/buildroot/-/pipelines/192690611 (parent)
    https://gitlab.com/ymorin/buildroot/-/pipelines/192690931 (child)


Regards,
Yann E. MORIN.


The following changes since commit bb216e3d8ade12442db794cbe5780e53bc082be8

  package/sentry-native: fix double variable assignment (2020-09-21 21:39:36 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to d01c55362b599b6b41c5e914f46644ac4088e243

  support/scripts: handle scheduled pipelines (2020-09-21 22:50:45 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/scripts: prioritize conditions for pipeline creation
      support/scripts: handle scheduled pipelines

 support/scripts/generate-gitlab-ci-yml | 64 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 29 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
