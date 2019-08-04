From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Aug 2019 17:51:58 +0200
Subject: [Buildroot] [RFC v2 1/1] utils/show-progress: add tool to show
 build progress at runtime
In-Reply-To: <20190718073243.10767-1-vadim4j@gmail.com>
References: <20190718073243.10767-1-vadim4j@gmail.com>
Message-ID: <20190804155158.GA30044@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-07-18 10:32 +0300, Vadim Kochan spake thusly:
> This might be useful to watch the amount of built and selected
> packages and some progress about it. So added python script which
> prints progress and build stats. The sample of output is:
> 
> Press Ctrl-C to exit ...
> 
> Building: output/qemu_x86_64
>  ##################################------------------------------ [ 42.42% 14/33]

With this defconfig:
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    # BR2_TARGET_ROOTFS_TAR is not set

and building out-of-tree, the script never reaches 100%:

    $ ../buildroot/utils/show-progress
    Press Ctrl-C to exit ...

    Building: .
     #########################################################################------- [ 91.67% 11/12]

Even though the build did finish...

> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[--SNIP--]
> diff --git a/utils/show-progress b/utils/show-progress
> new file mode 100755
> index 0000000000..ee1e1da289
> --- /dev/null
> +++ b/utils/show-progress
> @@ -0,0 +1,91 @@
> +#!/usr/bin/env python

This is actually a python3 script, and is not a valid pyhon2 one.

> +# Copyright (C) 2019 Vadim Kochan <vadim4j@gmail.com>

There is no reason nowadays to add copyright notices. The copyright is
defacto by the Bern convention. Furthermore, in an opensource project,
this notice is wrong as ssoon as other contributors do substantial
modification to the file.

And the git log is a much better way to extract authroship of a file.

[--SNIP--]
> +def progress(ready, total):
> +    perc = ready / total
> +    fill = round(perc * 80)
> +    print('\r', '#' * fill + '-' * (80 - fill), '[{:>7.2%} {}/{} ]'.format(perc, ready, total), end='')

I've locally changed it to:

    print('\r', '#' * fill + '-' * (80 - fill), '[{:>7.2%} {: >2d}/{}]'.format(perc, ready, total), end='')

> +    print("Press Ctrl-C to exit ...\n")
> +    print("Building: " + build_dir)

This print '.' as the build directory when doing an out-of-tree build
(see above). I've locally changed it to:

    print("Building: " + os.path.realpath(build_dir))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
