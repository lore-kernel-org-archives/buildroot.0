From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 00:05:58 +0100
Subject: [Buildroot] [PATCH v2] boot/uboot: fix build for sunxi targets
In-Reply-To: <20170306202525.12879-1-joerg.krause@embedded.rocks>
References: <20170306202525.12879-1-joerg.krause@embedded.rocks>
Message-ID: <20170307000558.77e91273@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 21:25:25 +0100, J?rg Krause wrote:
> Since version 2017.01 U-Boot needs to run the binman tool on the host machine
> for building the 'u-boot-sunxi-with-spl.bin' target. The binman tool is written
> in Python 2 and therefore needs a Python 2 interpreter. The python
> scripts sets the shebang to: `#!/usr/bin/env python`. For modern Linux
> distributions `python` is used for the Python 3 interpreter. In this
> case, building U-Boot for a sunxi-based target fails:
> 
> ```
>   BINMAN  u-boot-sunxi-with-spl.bin
>   File "./tools/binman/binman", line 49
>     print result
>                ^
> SyntaxError: Missing parentheses in call to 'print'
> make[1]: *** [Makefile:1090: u-boot-sunxi-with-spl.bin] Error 1
> ```
> 
> Add a patch to fix the shebang to `#!/usr/bin/env python2` to ensure the
> Python 2 interpreter is used to run the script.
> 
> Upstream status: Pending
> https://lists.denx.de/pipermail/u-boot/2017-March/283164.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Peter Korsgaard <peter@korsgaard.com>

The problem that I see with this is that it only fixes the issue for
2017.01 precisely. Anybody using a custom version of U-Boot will not
get this fix. Maybe we can simply the people using a custom version
that they can anyway integrate your patch.

I was wondering if a post-patch hook doing a sed would not be more
appropriate, but I'm not sure. Let's see what others think.

For example, for the kernel we have this LINUX_TRY_PATCH_TIMECONST hook
that tries to fix a problem with older kernel versions built with too
recent Perl versions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
