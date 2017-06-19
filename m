From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Jun 2017 22:11:50 -0300
Subject: [Buildroot] [PATCH 1/4 v2] tools: add a directory to store some
 useful user-facing tools
References: <388a8da9b48e30391dd6f2cd35be53c2dafc4af0.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <594724d64eae6_575014c74204877b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 18, 2017 at 11:01 AM, Yann E. MORIN wrote:

> Add a tools directory to store useful little scripts, tools, etc...
> Users may add that directory in their PATH if they want to, but this
> is not mandatory.
> 
> Add the first tool: brmake, a small script that redirects the build
> output log to a file, keeping just Buildroot's own messages, with the
> date+time added at the start of the line.
> 
> We need to unbuffer the output of make so that, when the script is
> interrupted (SIGINT, ^C), there is no lingering output not yet digested
> by the logger loop.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

I tested the script and it works very well in general.

- I successfully built the qemu_arm_versatile_defconfig using the script,
pressing CTRL+C a few times and resuming by calling it again.
- Also, by inserting an error to a package I got the expected behaviour: the
error message is in the log file and the script returned the error code.
- Tested using 'GNU bash, version 4.3.48(1)-release (x86_64-pc-linux-gnu)'

BUT if it is called without a .config file, it hangs forever waiting for input,
and the menuconfig is sent to the log file.
Maybe we can bailout if no .config is present.

Also, 2 small nits below.

> +++ b/tools/00-README.txt
> @@ -0,0 +1,9 @@
> +This directory contains various useful scripts and tools for working
> +with Buildroot. You need not add this directory in your PATH to use
> +any of those tools, but you may do so if you want.
> +
> +brmake
> +    a script that can be run instead of make, that prepends the date in
> +    front of each line, redirects all of the build output to a file
> +    ("'br.log' in the current directory), and just ouputs the Buildroot

Maybe this file will be dropped as discussed in
http://patchwork.ozlabs.org/patch/777446/
If not, there is a typo

ouputs -> outputs

> +    messages (those lines starting with >>>) on stdout.
> diff --git a/tools/brmake b/tools/brmake
> new file mode 100755
> index 0000000000..9f7b4bc65f
> --- /dev/null
> +++ b/tools/brmake
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
> +# License: WTFPL, https://spdx.org/licenses/WTFPL.html
> +
> +main() {
> +    local ret start d h m mf fs

fs is unused.

Regards,
Ricardo
