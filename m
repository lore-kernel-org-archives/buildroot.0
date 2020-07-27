From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:18:31 +0200
Subject: [Buildroot] [PATCHv3 4/6] support/scripts: add
 check-dotconfig.py
In-Reply-To: <20200727155127.2703286-4-romain.naour@gmail.com>
References: <20200727155127.2703286-1-romain.naour@gmail.com>
 <20200727155127.2703286-4-romain.naour@gmail.com>
Message-ID: <20200727161831.GE19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-07-27 17:51 +0200, Romain Naour spake thusly:
> For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
> we need to check if the generated configuration file (.config)
> contains all symbols present in the defconfig file.
> 
> If not there is an issue with the defconfig.
> 
> This script will be used in .gitlab-ci.yml.
> 
> Inspired by is_toolchain_usable() function from genrandconfig:
> https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> v2: update with the improved patch suggested by Yann.
>     http://lists.busybox.net/pipermail/buildroot/2020-April/280679.html
> ---
>  support/scripts/check-dotconfig.py | 44 ++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100755 support/scripts/check-dotconfig.py
> 
> diff --git a/support/scripts/check-dotconfig.py b/support/scripts/check-dotconfig.py
> new file mode 100755
> index 0000000000..81c83a8481
> --- /dev/null
> +++ b/support/scripts/check-dotconfig.py
> @@ -0,0 +1,44 @@
> +#!/usr/bin/env python3
> +
> +# This scripts check that all lines present in the defconfig are
> +# still present in the .config
> +
> +import sys
> +
> +
> +def main():
> +    if not (len(sys.argv) == 3):
> +        print("Error: incorrect number of arguments")
> +        print("""Usage: check-dotconfig <configfile> <defconfig>""")
> +        sys.exit(1)
> +
> +    configfile = sys.argv[1]
> +    defconfig = sys.argv[2]
> +
> +    # strip() to get rid of trailing \n
> +    with open(configfile) as configf:
> +        configlines = [l.strip() for l in configf.readlines()]
> +
> +    defconfiglines = []
> +    with open(defconfig) as defconfigf:
> +        for line in defconfigf.readlines():
> +            # strip() to get rid of trailing \n
> +            line = line.strip()

I've used a generator to strip the lines when reading:

    for line in (line.strip() for line in defconfigf.readlines()):

> +            if line.startswith("BR2_"):
> +                defconfiglines.append(line)
> +            elif line.startswith('# BR2_') and line.endswith(' is not set'):
> +                defconfiglines.append(line)
> +
> +    # Check that all the defconfig lines are still present
> +    missing = [defconfigline.strip() for defconfigline in defconfiglines

No need to strip() here, lines are already stripped. I also shortened
the variable from defconfigline to simply line, so that it fits on a
single line. (muahaha!)

> +               if defconfigline not in configlines]
> +
> +    if len(missing):

Testing is a list ie empty is simply done by testing the list;

    if missing:

> +        print("WARN: defconfig {} can't be used:".format(defconfig))
> +        for m in missing:
> +            print("      Missing: {}".format(m))
> +    sys.exit(1 if len(missing) else 0)

I moved the sys.exit(1) inside the conditional, it's s much simpler.

Applied to master with those fixes, thanks!

Regards,
Yann E. MORIN.

> +
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
