From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Oct 2017 08:27:23 +0200
Subject: [Buildroot] [RFC PATCH 1/1] testing/infra: add test for code
	style
In-Reply-To: <20171002011757.8245-1-ricardo.martincoski@gmail.com>
References: <20171002011757.8245-1-ricardo.martincoski@gmail.com>
Message-ID: <20171002062723.GD4753@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, all,

On 2017-10-01 22:17 -0300, Ricardo Martincoski spake thusly:
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> NOTICE: this would require to install flake8 to the docker image
> buildroot/base.
> 
> The configs could be fine-tuned by either adding options to the call,
> such as:
>  "--max-line-length=132",
> or pointing to the config file:
>  "--config={}".format(infra.filepath("conf/unittest.cfg")),
> and adding to support/testing/conf/unittest.cfg something like this:
>  [flake8]
>  max-line-length=132
> as pointed out by Yann E. MORIN in the review of
> http://patchwork.ozlabs.org/patch/819800/

Note that if the file is support/testing/setup.cfg, then flake8 will
automatically find it, without the need for passing the --config option.

It can also be named support/testing/.flake8, but I don't like
dot-files, as they are hard to find.

If we wanted to sharea  single file for nose2 and flake8, then we could
move support/testing/conf/unittest.cfg to support/testing/setup.cfg.
But why would we want to share a single file for the two different
tools?

Regards,
Yann E. MORIN.

> Flake8 will also test files pointed by symlinks.
> ---
>  .gitlab-ci.yml                           |  1 +
>  support/testing/infra/test_code_style.py | 27 +++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 support/testing/infra/test_code_style.py
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 0e0773fc74..9e33217bd8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -218,6 +218,7 @@ zynq_microzed_defconfig: *defconfig
>  zynq_zc706_defconfig: *defconfig
>  zynq_zed_defconfig: *defconfig
>  zynq_zybo_defconfig: *defconfig
> +infra.test_code_style.TestInfraCodeStyle: *runtime_test
>  tests.core.test_post_scripts.TestPostScripts: *runtime_test
>  tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
>  tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
> diff --git a/support/testing/infra/test_code_style.py b/support/testing/infra/test_code_style.py
> new file mode 100644
> index 0000000000..6f06ebd145
> --- /dev/null
> +++ b/support/testing/infra/test_code_style.py
> @@ -0,0 +1,27 @@
> +import subprocess
> +
> +import infra
> +import infra.basetest
> +
> +
> +class TestInfraCodeStyle(infra.basetest.BRTest):
> +    config = ""
> +    logfile = None
> +
> +    def setUp(self):
> +        self.show_msg("Starting")
> +        self.logfile = infra.open_log_file(self.builddir, "style",
> +                                           self.logtofile)
> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +
> +    def test_run(self):
> +        cmd = ["flake8",
> +               infra.filepath("run-tests"),
> +               infra.filepath("")]
> +        self.logfile.write("> starting '%s'\n" % " ".join(cmd))
> +        self.logfile.flush()
> +        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
> +        if ret != 0:
> +            raise SystemError("There are code style warnings")
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
