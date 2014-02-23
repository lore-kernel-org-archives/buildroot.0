From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 17:29:34 +0100
Subject: [Buildroot] [PATCH 12/13] docs/manual: document the usage of
 <pkg>_OVERRIDE_SRCDIR
In-Reply-To: <1393167879-16637-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223162934.GC32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/advanced.txt                    |  2 +
>  docs/manual/using-buildroot-development.txt | 84 +++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 docs/manual/using-buildroot-development.txt
> 
> diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
> index 764b71a..fb337f5 100644
> --- a/docs/manual/advanced.txt
> +++ b/docs/manual/advanced.txt
> @@ -11,3 +11,5 @@ include::ccache-support.txt[]
>  include::download-location.txt[]
>  
>  include::package-make-target.txt[]
> +
> +include::using-buildroot-development.txt[]
> diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
> new file mode 100644
> index 0000000..3267302
> --- /dev/null
> +++ b/docs/manual/using-buildroot-development.txt
> @@ -0,0 +1,84 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +Using Buildroot during development
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The normal operation of Buildroot is to download a tarball, extract
> +it, configure, compile and install the software component found inside
> +this tarball. The source code is extracted in
> ++output/build/<package>-<name>+, which is a temporary directory:

output/build/<package>-<version>

> +whenever +make clean+ is used, this directory is entirely removed, and
> +re-recreated at the next +make+ invocation. Even when a Git or
> +Subversion repository is used as the input for the package source
> +code, Buildroot creates a tarball out of it, and then behaves as it
> +does normally with tarballs.

normally does

> +This behavior is well-suited when Buildroot is used mainly as an
> +integration tool, to build and integrate all the components of an
> +embedded Linux system. However, if one uses Buildroot during the
> +development of certain components of the system, this behavior is not
> +very convenient: one would instead like to make a small change to the
> +source code of one package, and be able to quickly rebuild the system
> +with Buildroot.
> +
> +Making changes directly in +output/build/<package>-<name>+ is not

output/build/<package>-<version>

> +appropriate solution, because this directory is removed on +make
> +clean+.
> +
> +Therefore, Buildroot provides a specific mechanism for this use case:
> +the +<pkg>_OVERRIDE_SRCDIR+ mechanism. Buildroot reads an _override_
> +file, which allows the user to tell Buildroot the location of the
> +source for certain packages. By default this _override_ file is named
> ++local.mk+ and located in the top directory of the Buildroot source
> +tree,

Wrong, now it is locate in $(CONFIG_DIR), that is, the directory where
we have the .config file, since:
    b1e514d Config: default BR2_PACKAGE_OVERRIDE_FILE to $(CONFIG_DIR)/local.mk

This is Buildroot's top dir when building in-tree, and for out-of-tree
builds, it's in $(O).

[--SNIP--]

Otherwise, LGTM.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
