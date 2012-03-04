From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Mar 2012 01:13:27 +0100
Subject: [Buildroot] [PATCH 2/2] Add test infrastructure
In-Reply-To: <1330818307-22115-3-git-send-email-arnout@mind.be>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
 <1330818307-22115-3-git-send-email-arnout@mind.be>
Message-ID: <201203040113.27598.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 04 March 2012 00:45:07 Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The test infrastructure is a script and a list of tests to be run.
> Additional test configurations can be added later to the test directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  test/runtests.sh |  106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  test/testspecs   |   24 ++++++++++++
>  2 files changed, 130 insertions(+), 0 deletions(-)
>  create mode 100755 test/runtests.sh
>  create mode 100644 test/testspecs
> 
> diff --git a/test/runtests.sh b/test/runtests.sh
> new file mode 100755
> index 0000000..2f547eb
> --- /dev/null
> +++ b/test/runtests.sh
> @@ -0,0 +1,106 @@
> +#! /bin/sh

/bin/sh is expected to be a POSIX shell, so it has an impact on the
syntax you can use. See below for a bashism I spotted.

> +# Run test builds of buildroot
> +# runtest.sh <testspec>...
> +#
> +# testspec:  <baseconfig>[=<type>,...]
> +#   A testspec is a config file name (relative to the buildroot top dir),
> +#   optionally followed by a comma-separated list of config types.
> +#   Config types are: def, rand, allyes, allno, randpackage, allyespackage,
> +#                     allnopackage
> +#   If config types are not given, it is taken from a line containing
> +#   CONFIGTYPES= in the baseconfig.  If that is also not present, def
> +#   and randpackage are tried.
> +#
> +# If no arguments are given, the testspecs are taken from the testspecs
> +# file in the current directory.  If that file doesn't exist, the testspecs
> +# file in the test directory is taken.
> +#
> +# The output goes into the current directory.
> +
> +testdir=$(dirname $0)
> +topdir=$(cd $testdir/..; pwd)

I would highly suggest using ${foo} instead of $foo because it makes
it explicit what the variable name is. Also, enclose variable between
double-quotes, in case a vicious user uses a dir with a space in it.

This comment is valid throughout the script.

> +configdir=$PWD/gen-config
> +brversion=$(make -C $topdir --no-print-directory print-version)
> +
> +echo "Running tests for $brversion"

Nowadays, I favour 'printf' over 'echo'.
'echo' is deprecated, see section "Application Usage":
    http://pubs.opengroup.org/onlinepubs/9699919799/utilities/echo.html

But that's personal opinion... ;-)

> +# Run build for config $1 with type $2
> +function runbuild() {
> +	baseconfig=$1
> +	configtype=$2
> +
> +	echo "Building $baseconfig ${configtype}config"
> +
> +	# Interprete baseconfig relative to topdir
> +	if [ "${baseconfig:0:1}" = / ]; then

You're using /bin/sh, so you can not use bashisms: the syntax ${foo:i:j}
is a bashism.

See the "The Open Group Base Specifications Issue 7", utilities chapter 2,
dealing about "Shell Command Language":
    http://pubs.opengroup.org/onlinepubs/9699919799/toc.htm
    http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html

[--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
