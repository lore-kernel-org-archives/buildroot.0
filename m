From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:32:39 +0100
Subject: [Buildroot] [PATCH 2/3] Makefile: offload .gitlab-ci.yml
 generation
In-Reply-To: <20181028235839.22472-3-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
 <20181028235839.22472-3-ricardo.martincoski@gmail.com>
Message-ID: <20181209213239.44d2f16c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Oct 2018 20:58:38 -0300, Ricardo Martincoski wrote:
> GitLab has severe limitations imposed to triggers.
> Using a variable in a regexp is not allowed:
> |    only:
> |        - /-$CI_JOB_NAME$/
> |        - /-\$CI_JOB_NAME$/
> |        - /-%CI_JOB_NAME%$/
> Using the key 'variables' always lead to an AND with 'refs', so:
> |    only:
> |        refs:
> |            - branches
> |            - tags
> |        variables:
> |            - $CI_JOB_NAME == $CI_COMMIT_REF_NAME
> would make the push of a tag not to trigger all jobs anymore.
> Inheritance is used only for the second level of keys, so:
> |.runtime_test: &runtime_test
> |    only:
> |        - tags
> |tests.package.test_python_txaio.TestPythonPy2Txaio:
> |    <<: *runtime_test
> |    only:
> |        - /-TestPythonPy2Txaio$/
> would override the entire key 'only', making the push of a tag not to
> trigger all jobs anymore.
> 
> So, in order to have a trigger per job and still allow the push of a tag
> to trigger all jobs (all this in a follow up patch), the regexp for each
> job must be hardcoded in the .gitlab-ci.yml and also the inherited
> values for key 'only' must be repeated for every job.
> This is not a big issue, .gitlab-ci.yml is already automatically
> generated from a template and there will be no need to hand-editing it
> when jobs are added or removed.
> 
> Since the logic to generate the yaml file from the template will become
> more complex, move the commands from the main Makefile to a script.
> 
> Using Python or other advanced scripting language for that script would
> be the most versatile solution, but that would bring another dependency
> on the host machine, pyyaml if Python is used. So every developer that
> needs to run 'make .gitlab-ci.yml' and also the docker image used in the
> GitLab pipelines would need to have pyyaml pre-installed.
> Instead of adding the mentioned dependency, keep using a bash script.
> 
> While moving the commands to the script:
>  - mimic the behavior of the previous make target and fail on any
>    command that fails, by using 'set -e';
>  - break the original lines in one command per line, making the diff for
>    any patch to be applied to this file to look nicer;
>  - keep the script as simple as possible, without functions, just a
>    script that executes from the top to bottom;
>  - do not perform validations on the input parameters, any command that
>    fails already makes the script to fail;
>  - do not add an usage message, the script is not intended to be called
>    directly.
> 
> This patch does not change functionality.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

I've applied after changing one thing, see below.

> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> new file mode 100755
> index 0000000000..d824f669b5
> --- /dev/null
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -0,0 +1,20 @@
> +#!/usr/bin/env bash
> +set -e
> +set -o pipefail
> +
> +input="${1}"
> +output="${2}"
> +
> +cp "${input}" "${output}"
> +
> +(
> +    cd configs
> +    LC_ALL=C ls -1 *_defconfig
> +) \
> +    | sed 's/$/: *defconfig/' \
> +    >> "${output}"
> +
> +./support/testing/run-tests -l 2>&1 \
> +    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' \
> +    | LC_ALL=C sort \
> +    >> "${output}"

I think it is more common for this kind of script to output on stdout,
and have the caller redirect to a file. It makes the script slightly
simpler, since you don't have to redirect to ${output}. So I've changed
to use this solution before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
