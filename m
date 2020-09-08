From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 22:47:18 +0200
Subject: [Buildroot] [PATCH 00/10] gitlab-ci: handle all conditional
 jobs in the generating script (branch yem/gitlab-ci-cond)
In-Reply-To: <cover.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <c586aee9-0ea1-afb6-4634-b34908f00a57@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> Hello All!
> 
> The grammar in gitlab-CI yaml, to specify conditions under which jobs
> should be spawned or not, is not very nice to handle.
> 
> Take adavantage of the fact that we are now generating the pipeline
> description from a script, to decide in that script exactly what jobs
> should be spawned.
> 
> This is both more usual, to use a classic scripting language (shell for
> now, but could be whatever in the future), and more versatile (we can
> more easilt express conditions than in the limited gitlab-CI YAML).

On one hand, it's a pity to workaround the gitlab-ci Yaml and not take the
opportunity to practice this specific language...
But on the other hand the language is not still stable over the time (see the
only/except keyword deprecation we used until recently).
Also the generate-gitlab-ci-yml after this series doesn't seem too complex :)

Maybe we can complete the manual about defconfigs testing in gitlab.
runtime-tests in gitlab is already described in the manual.

Best regards,
Romain

> 
> Here are examples of resulting pipelines, with child pipelines created
> under the various expected conditions:
> 
> Arbitrary branch, only run the basic tests:
>     git push gitlab
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186557459
> 
> Maintenance branch, run the basic checks, and check the defconfigs:
>     git push gitlab HEAD:toto.no.x
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186556538
> 
> Tag, run all the tests:
>     git tag FOO-YEM
>     git push gitlab FOO-YEM
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186559009
> 
> Build all defconfigs:
>     git push gitlab HEAD:FOO-defconfigs
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186551495
> 
> Build one defconfig:
>     git push gitlab HEAD:FOO-warp7_defconfig
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186530844
> 
> Build all runtime tests:
>     git push gitlab HEAD:FOO-runtime-tests
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186554657
> 
> Build one runtime test:
>     git push gitlab HEAD:FOO-tests.package.test_openssh
>     https://gitlab.com/ymorin/buildroot/-/pipelines/186530918
> 
> Notes:
>   - 'gitlab' is my git remote pointing to gitlab,
>   - some pipelines were canceled to not exhaust my job limit
>   - there were too many jobs in the tag, so it exceed the limits of my
>     free account...
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 97d431c181268716b38cd5a63eb0e8b78b003b3b
> 
>   package/mrp: new package (2020-09-06 16:38:02 +0200)
> 
> 
> are available in the git repository at:
> 
>   https://git.busybox.net/~ymorin/git/buildroot
> 
> for you to fetch changes up to c1ea91abce5dbf7068615b247ff77dd7f8ec8fbb
> 
>   gitlab-ci: only check defconfigs for known branches (2020-09-06 21:59:52 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (10):
>       gitlab-ci: introduce main() in generating script
>       gitlab-ci: share the image version with the child
>       gitlab-ci: handle the defconfig build conditions in script
>       gitlab-ci: defconfig_check is included in defconfig build
>       gitlab-ci: handle the run-time tests conditions in script
>       gitlab-ci: handle single defconfig in script
>       gitlab-ci: handle single runtime test in script
>       gitlab-ci: handle the basic tests in script
>       gitlab-ci: move before-script before script
>       gitlab-ci: only check defconfigs for known branches
> 
>  support/misc/gitlab-ci.yml.in          |  70 +++----------------
>  support/scripts/generate-gitlab-ci-yml | 118 ++++++++++++++++++++++++++++++---
>  2 files changed, 117 insertions(+), 71 deletions(-)
> 
