From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2019 00:31:59 +0200
Subject: [Buildroot] [PATCH 6/7] support/scripts/qemu-boot: gitlab tests
 for Qemu
In-Reply-To: <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-7-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <df02769a-fa12-c908-1222-bf3817a83473@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jugurtha,

 Thank you for this. It is certainly useful! I have a few comments though.

On 29/04/2019 18:32, Jugurtha BELKALEM wrote:
> Enables to check various qemu architectures build states.
> These scripts were inspired from toolchain builder :
> https://github.com/bootlin/toolchains-builder/blob/master/build.sh
> to test qemu's build process.
> This allows to troubleshoot different issues that may be
> associated with defective qemu builds by lanching a qemu machine,
> sending root password, waiting for login shell and then perform
> a shutdown.
> 
> The script expect.sh relies on expect package to automate
> the tests.
> We should mention that python-pexpect can be tweeked for the same
> job but seems like it does hide the automation process as well
> as any errors that may be encountered.
> 
> The script qemu-boot-defconfig_config.sh is required for
> architectures that need special configuration before
> starting compilation (like setting the correct tty).
> 
> On the other side, qemu-boot-checker.sh is used to read
> the qemu command used to launch a qemu machine (by reading
> board/qemu/qemu_architecture/readme.txt) as well as setting
> the path to the qemu host and calling expect.sh.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  support/scripts/expect.sh                     | 22 +++++++++++++++++
>  support/scripts/qemu-boot-checker.sh          | 35 +++++++++++++++++++++++++++
>  support/scripts/qemu-boot-defconfig_config.sh | 11 +++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100755 support/scripts/expect.sh
>  create mode 100755 support/scripts/qemu-boot-checker.sh
>  create mode 100755 support/scripts/qemu-boot-defconfig_config.sh
> 
> diff --git a/support/scripts/expect.sh b/support/scripts/expect.sh
> new file mode 100755
> index 0000000..6d65752
> --- /dev/null
> +++ b/support/scripts/expect.sh
> @@ -0,0 +1,22 @@
> +#!/usr/bin/expect
> +#
> +
> +set timeout 400
> +
> +log_file /tmp/expect_session.log
> +
> +eval spawn $env(QEMU_COMMAND)
> +
> +expect {
> +    eof {puts "Connection problem, exiting."; exit 1}
> +    timeout {puts "System did not boot in time, exiting."; exit 1}
> +    "buildroot login:"
> +}
> +send "root\r"
> +expect {
> +    eof {puts "Connection problem, exiting."; exit 1}
> +    timeout {puts "No shell, exiting."; exit 1}

 Here, the timeout should be *much* smaller than 400. Like, 2-3 seconds is more
appropriate.

> +    "# "
> +}
> +send "poweroff\r"
> +expect "System halted"

 Can we also have an expectation that the spawned command exits here?

> diff --git a/support/scripts/qemu-boot-checker.sh b/support/scripts/qemu-boot-checker.sh
> new file mode 100755
> index 0000000..f036516
> --- /dev/null
> +++ b/support/scripts/qemu-boot-checker.sh
> @@ -0,0 +1,35 @@
> +#!/bin/bash
> +
> +if [[ $1 = qemu* ]]; then
> +  device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g')

 We don't really have consistent indentation in shell scripts, but it's either 4
spaces or one tab. I prefer one tab myself.

> +  if [ $device_name == "x86-64" ]; then
> +    device_name="x86_64"

 We should find a better way of handling this. E.g., renaming the directory to
x86-64 :-)

> +  elif [ $device_name == "xtensa-lx60" ] || [ $device_name == "xtensa-lx60-nommu" ]; then
> +    echo "xtensa cannot be tested"

 If that is the case, why do we even have these qemu defconfigs? Max?


> +    exit 0
> +  elif [ $device_name == "m68k-q800" ] || [ $device_name == "ork1k" ]; then
                                                                ^^^^^or1k
> +    archQemuNoSupport
 In that case, no qemu can be built, so I think it's better to just check for
the presence of the qemu binary.

> +  fi
> +
> +  test_qemu_cmd="$(grep qemu-system $2/board/qemu/${device_name}/readme.txt)"
> +  qemu_command="$(echo "${test_qemu_cmd}"|tr -d '\n')"

 Instead of screenscraping this from the readme, I'd much prefer to rewrite it
so it can be called directly. E.g. for each defconfig have a launch command.

 It might even make sense to have the launch command in
package/qemu/Config.in.host so it is part of the defconfig, and then have some
way (e.g. utils/launch-qemu.sh) to launch it.

 But for now, I'd already be happy with board/qemu/*/launch.sh.


> +
> +  export QEMU_COMMAND="${qemu_command}"
> +
> +  export PATH="$2/output/host/bin:$PATH"
> +  echo $PATH
> +
> +  function archQemuNoSupport {

 These functions should be declared before the main functionality of the script.

> +    echo "cannot boot under qemu, support out of tree!"
> +    exit 0
> +  }
> +
> +  function boot_test {
> +    if ! expect expect.sh ; then
> +      echo "  booting test system ... FAILED"
> +      return 1
> +    fi
> +    echo "  booting test system ... SUCCESS"
> +  }
> +  boot_test

 IMO it doesn't make much sense to define a function and then immediately call
it. So you could just do:

	printf "  booting test system ... "
	if ! expect expect.sh ; then
		echo "FAILED"
		exit 1
	fi
	echo "SUCCESS"


 Also, the output of the spawned qemu should be logged somewhere, and that log
file should be a gitlab-ci artifact.

> +fi
> diff --git a/support/scripts/qemu-boot-defconfig_config.sh b/support/scripts/qemu-boot-defconfig_config.sh
> new file mode 100755
> index 0000000..526eee1
> --- /dev/null
> +++ b/support/scripts/qemu-boot-defconfig_config.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash
> +
> +if [[ $1 = qemu* ]]; then
> +  device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g') 
> +  if [ $device_name == "x86-64" ]; then
> +    device_name="x86_64"
> +    sed -i "s/tty1/ttyS0/" $2/configs/$1
> +  elif [ $device_name == "x86" ]; then
> +    sed -i "s/tty1/ttyS0/" $2/configs/$1

 This sucks. I think we can just remove BR2_TARGET_GENERIC_GETTY_PORT from these
defconfigs and rely on the console (and make sure the console is set correctly
in the append argument of qemu).

 Regards,
 Arnout


> +  fi
> +fi
> 
