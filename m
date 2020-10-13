From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Oct 2020 19:17:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.9.0
In-Reply-To: <20201006222422.874760-1-james.hilliard1@gmail.com>
References: <20201006222422.874760-1-james.hilliard1@gmail.com>
Message-ID: <20201013171709.GC3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-10-06 16:24 -0600, James Hilliard spake thusly:
> Rebased patches on 3.9.0

Unless the patches do not apply, I find rebasing, when all it does is
fixup the offsets, to add too much noise, so much so that I almost
missed actual changes in a few of the paatches, see below...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...e-the-build-of-pyc-files-conditional.patch | 14 +++++-----
>  ...taddrinfo-configure-test-when-cross-.patch |  8 +++---
>  ...re-to-disable-the-build-of-certain-e.patch | 20 ++++++-------
>  ...y-header-paths-for-cross-compilation.patch | 12 ++++----
>  ...ook-in-usr-lib-termcap-for-libraries.patch |  8 +++---
>  .../0006-Don-t-add-multiarch-paths.patch      |  8 +++---
>  .../0007-Abort-on-failed-module-build.patch   |  8 +++---
>  .../0008-Serial-ioctl-workaround.patch        |  6 ++--
>  ...e-shebang-of-Python-scripts-for-cros.patch |  4 +--
>  ...ig.sh.in-ensure-sed-invocations-only.patch |  4 +--
>  ...locale-and-set-to-default-when-addin.patch | 12 ++++----

This one has an actual change.

>  ...Add-importlib-fix-for-PEP-3147-issue.patch | 12 ++++----
>  ...-disable-installation-of-test-module.patch | 27 ++++++++++--------

This one too.

>  .../0014-Add-an-option-to-disable-pydoc.patch | 28 +++++++++----------
>  ...015-Add-an-option-to-disable-lib2to3.patch | 24 ++++++++--------
>  ...option-to-disable-the-sqlite3-module.patch | 16 +++++------
>  ...d-an-option-to-disable-the-tk-module.patch | 20 ++++++-------
>  ...-option-to-disable-the-curses-module.patch | 26 ++++++++---------
>  .../0019-Add-an-option-to-disable-expat.patch | 20 ++++++-------
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  8 +++---
>  .../0021-Add-an-option-to-disable-NIS.patch   |  8 +++---
>  ...Add-an-option-to-disable-unicodedata.patch |  8 +++---
>  .../0023-Add-an-option-to-disable-IDLE.patch  | 20 ++++++-------
>  ...024-Add-an-option-to-disable-decimal.patch | 14 +++++-----

The third and final one.

[--SNIP--]
> diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> index 1a40b74d21..00db527c8a 100644
> --- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> +++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> @@ -1,4 +1,4 @@
> -From a9affe1f3f98342b682848c9b3f862ee194ff625 Mon Sep 17 00:00:00 2001
> +From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
>  From: Samuel Cabrero <samuelcabrero@gmail.com>
>  Date: Wed, 23 Dec 2015 11:45:48 +0100
>  Subject: [PATCH] Override system locale and set to default when adding gcc
> @@ -20,18 +20,18 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/setup.py b/setup.py
> -index 8fda3b4d47..bb7eb44213 100644
> +index d3f0e663f2..926c16f58f 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -600,7 +600,7 @@ class PyBuildExt(build_ext):
> +@@ -695,7 +695,7 @@ class PyBuildExt(build_ext):
>           tmpfile = os.path.join(self.build_temp, 'ccpaths')
>           if not os.path.exists(self.build_temp):
>               os.makedirs(self.build_temp)
> --        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
> -+        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
> +-        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
> ++        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))

You should add your Signed-off-by on this patch, as you are doing really
more than just fixing the offsets:

    [your-email: adapt to python 3.9]
    Signed-off-by: Your NAME <your-email>

[--SNIP--]
> diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> index 675c2c1abf..6c14d84e47 100644
> --- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> +++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
> @@ -1,4 +1,4 @@
> -From 5ee3e5ad62919c431b1f7b5ff91ddf606582df0e Mon Sep 17 00:00:00 2001
> +From 0337342d413d13f437fd089de91faee70a8bf3f9 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 22 Feb 2017 17:01:18 -0800
>  Subject: [PATCH] Add an option to disable installation of test modules
> @@ -11,15 +11,15 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>  [ Andrey Smirnov: ported to Python 3.6 ]
>  Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Ditto for this one; see also how Andrey noted his own contribution.

[--SNIP--]
> diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
> index 5906f9d385..7e822f3720 100644
> --- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
> +++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
> @@ -1,4 +1,4 @@
> -From c82efeabd2f9b89ff2ecd5261eceeeb3af022ae8 Mon Sep 17 00:00:00 2001
> +From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:51:31 +0100
>  Subject: [PATCH] Add an option to disable decimal
> @@ -17,16 +17,16 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>   2 files changed, 13 insertions(+), 6 deletions(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 8c9706582e..e6255babb6 100644
> +index 7bd4623ccd..e513ef6a20 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3012,13 +3012,20 @@ fi
> +@@ -3106,13 +3106,20 @@ fi
>   AC_SUBST(LIBFFI_INCLUDEDIR)
>   
>   # Check for use of the system libmpdec library
>  -AC_MSG_CHECKING(for --with-system-libmpdec)
>  -AC_ARG_WITH(system_libmpdec,
> --            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library]),
> +-            AS_HELP_STRING([--with-system-libmpdec], [build _decimal module using an installed libmpdec library, see Doc/library/decimal.rst (default is no)]),

Ditto again.

I agree that offset-free patches are better, but in this case, this is
adding too much noise to the commit.

Just do two commits:

 1. just do the bump and just the fixes required for the bump
 2. rebase all the patches

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
