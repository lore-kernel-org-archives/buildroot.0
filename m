From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Mar 2017 09:11:04 +0100
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
	infrastructure
In-Reply-To: <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LW1nrzAsFe-xVodsC6QLVqS+BW=8VA12GO4d8yJmLfnHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 20, 2017 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds the core of a new testing infrastructure that allows to
> perform runtime testing of Buildroot generated systems. This
> infrastructure uses the Python unittest logic as its foundation.
>
> This core infrastructure commit includes the following aspects:
>
>  - A base test class, called BRTest, defined in
>    support/testing/infra/basetest.py. This base test class inherited
>    from the Python provided unittest.TestCase, and must be subclassed by
>    all Buildroot test cases.
>
>    Its main purpose is to provide the Python unittest setUp() and
>    tearDown() methods. In our case, setUp() takes care of building the
>    Buildroot system described in the test case, and instantiate the
>    Emulator object in case runtime testing is needed. The tearDown()
>    method simply cleans things up (stop the emulator, remove the output
>    directory).
>
>  - A Builder class, defined in support/testing/infra/builder.py, simply
>    responsible for building the Buildroot system in each test case.
>
>  - An Emulator class, defined in support/testing/infra/emulator.py,
>    responsible for running the generated system under Qemu, allowing
>    each test case to run arbitrary commands inside the emulated system.
>
>  - A run-tests script, which is the entry point to start the tests.
>
> Even though I wrote the original version of this small infrastructure, a
> huge amount of rework and improvement has been done by Maxime
> Hadjinlian, and squashed into this patch. So many thanks to Maxime for
> cleaning up and improving my Python code!
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/conf/unittest.cfg |   6 ++
>  support/testing/infra/__init__.py |  89 +++++++++++++++++++++++++
>  support/testing/infra/basetest.py |  66 +++++++++++++++++++
>  support/testing/infra/builder.py  |  49 ++++++++++++++
>  support/testing/infra/emulator.py | 135 ++++++++++++++++++++++++++++++++++++++
>  support/testing/run-tests         |  83 +++++++++++++++++++++++
>  support/testing/tests/__init__.py |   0
>  7 files changed, 428 insertions(+)
>  create mode 100644 support/testing/conf/unittest.cfg
>  create mode 100644 support/testing/infra/__init__.py
>  create mode 100644 support/testing/infra/basetest.py
>  create mode 100644 support/testing/infra/builder.py
>  create mode 100644 support/testing/infra/emulator.py
>  create mode 100755 support/testing/run-tests
>  create mode 100644 support/testing/tests/__init__.py
>
[..]

> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> new file mode 100644
> index 0000000..7c476cb
> --- /dev/null
> +++ b/support/testing/infra/emulator.py
> @@ -0,0 +1,135 @@
> +import socket
> +import subprocess
> +import telnetlib
> +
> +import infra
> +import infra.basetest
> +
> +# TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
> +# with the qemu machine.
> +class Emulator(object):
> +
> +    def __init__(self, builddir, downloaddir, logtofile):
> +        self.qemu = None
> +        self.__tn = None
> +        self.downloaddir = downloaddir
> +        self.log = ""
> +        self.log_file = "{}-run.log".format(builddir)
> +        if logtofile is None:
> +            self.log_file = None
> +
> +    # Start Qemu to boot the system
> +    #
> +    # arch: Qemu architecture to use
> +    #
> +    # kernel: path to the kernel image, or the special string
> +    # 'builtin'. 'builtin' means a pre-built kernel image will be
> +    # downloaded from ARTEFACTS_URL and suitable options are

There is a stale reference to ARTEFACTS_URL here (ARTIFACTS_URL)

[..]

> +    # Wait for the login prompt to appear, and then login as root with
> +    # the provided password, or no password if not specified.
> +    def login(self, password=None):
> +        self.__read_until("buildroot login:", 10)
> +        if "buildroot login:" not in self.log:

If we want people to use this testing infrastructure on their own
defconfigs too, then encoding the hostname in this string is a bit
restrictive. What about searching for 'login:' only ? Do you think it
is too generic?

[..]

/Thomas
