From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 30 Mar 2019 00:30:01 -0300
Subject: [Buildroot] [PATCH v3 3/4] support/testing: test can use the
 locally generated qemu host tool
References: <20190322095818.19914-3-etienne.carriere@linaro.org>
Message-ID: <5c9ee2b9d0ea5_29f73fa56c112b2c43513@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Arnout

On Fri, Mar 22, 2019 at 06:58 AM, Etienne Carriere wrote:

> This change adds argument --local-emulator to run-tests to use a
> locally built emulator for the runtime test. Target test shall provide
> a config_emulator attribute unless what test is inconsistent.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v2 -> v3:
>   - Add an argument to run-tests to use locally built emulator.
>     Test can still enforce use of locally built emulator from
>     boot method argument local=True|False (still defaults to False).

I am not strongly against it.
But let me ask:
Are you or someone else having trouble with any other test case when using
"old" qemu versions from host?

If the answer is no, maybe we should keep things simple and use a patch very
similar to v2 of this one, just adding the host-qemu to the test case config
fragment and the 'local' argument to Emulator.run.
I say similar to v2 because I think your implementation in v3 with the
'qemu_bin' variable is better than v2.

If the answer is yes, be aware that one could download the docker image that we
use in GitLab CI and run the tests inside it. This image has qemu 2.8.1 that
currently run all tests we have without any problem AFAIK.

IMO, we remove --local-emulator and add local=True and host-qemu to the config
fragment of any tests (currently only the one in the next patch) that needs a
qemu newer than 2.8.1. 


Another approach "to have an generic option to script run-tests to build the
emulator within the test config" (quoting your reply to v2) would be:
Instead of adding a command line argument to run-tests, create a new flag in
the test case class, perhaps named "build_emulator". If that flag is True, the
host-qemu is automatically added to the config fragment by the test infra. The
same flag could be propagated to the Emulator.init so we don't need to pass
'local' to Emulator.run.
If for some reason a flag (boolean) is not enough, for example if the host-qemu
would not always be set with same options (I don't know if that is the case),
the test case that needs the local build of emulator could pass config_emulator
and that would make the test infra to know that it needs to build and use the
locally built emulator. Again, no need to pass 'local' to Emulator.run or the
user to pass a command line argument.
This way the test case tells the test infra that it needs an emulator built
locally instead of the user that starts the test.
Thoughts?

[snip]
> @@ -30,13 +35,21 @@ class Emulator(object):
>      #
>      # options: array of command line options to pass to Qemu
>      #
> -    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
> +    # local: if True, the locally built qemu host tool is used instead of a
> +    # qemu host tool found from the PATH.
> +    #
> +    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None,
> +             local=None):

A better default value is local=False

>          if arch in ["armv7", "armv5"]:
>              qemu_arch = "arm"
>          else:
>              qemu_arch = arch
>  
> -        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> +        qemu_bin = "qemu-system-{}".format(qemu_arch)
> +        if self.local_emulator or local:
> +            qemu_bin = os.path.join(self.builddir, 'host', 'bin', qemu_bin)
> +
> +        qemu_cmd = [qemu_bin,
>                      "-serial", "stdio",
>                      "-display", "none"]


Regards,
Ricardo
