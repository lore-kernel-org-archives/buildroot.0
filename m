From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 23:29:14 +0100
Subject: [Buildroot] FW: [PATCH] external toolchain: use relative path
 to external toolchain.
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006BF60@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF60@ezex10.ezchip.com>
Message-ID: <20140304222914.GH11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-02-23 08:29 +0000, Noam Camus spake thusly:
> Now configuration may include relative path to external toolchain.

What is the use-case for providing a relative path?

Do not forget that relative paths are always relative to the top dir of
the Buildroot source tree, not the current directory.

For example, if you build out-of-tree, then the relative paths are still
relative to Buildroot's tree, not $(O), which can have some strange
consequences:

    # ls -lF
    buildroot/
    ext-toolchain/
    $ mkdir -p my/own/output/dir
    $ cd my/own/output/dir
    $ make -C ../../../../buildroot O=$(pwd) my_defconfig all

So, you would have to set BR2_TOOLCHAIN_EXTERNAL_PATH=../ext-toolchain,
which is not straightforward, as most users would expect to set a path
relative to the current working directory. [0]

But, if you want to use relative paths, you can do use $(TOPDIR) or
$(CONFIG_DIR) as a prefix.

So, I'm not really sure we want that.

[0] This is not Buildroot's fault, but a standard behaviour of make,
that prevents us from knowing the directory make was run from in the
first place. This information is lost, and can not be retrieved from
inside a Makefile.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
