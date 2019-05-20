From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 May 2019 21:07:26 +0200
Subject: [Buildroot] [PATCH] core: make it possible to check flake8 like
 we check package
In-Reply-To: <20190520200346.453c08b1@gmx.net>
References: <20190519164417.20124-1-yann.morin.1998@free.fr>
 <20190520193416.0e9f8217@gmx.net> <20190520200346.453c08b1@gmx.net>
Message-ID: <20190520190726.GA2229@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-05-20 20:03 +0200, Peter Seiderer spake thusly:
> On Mon, 20 May 2019 19:34:16 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> > Did a local run with 'make check-flake8', produced 7636 warnings ;-) , you can add my
> Most warnings where from the download/dl directory,

Aha! ;-)

> without only 96
> warnings in support and utils are left:
> 
> support/testing/infra/__init__.py:91:29: W605 invalid escape sequence '\['

Yes, like me you are running a pretty recent distribution, that has
pycodestyle 2.4.0 (or more recent), which introduced a new warning,
W605.

I started fixing it locally, but I am not totally sure:

 1- if we really need to fix it: the warning is about python3, while
    quite a few reported errors apply to python2 code.

 2- how we should fix it. The obvious solution seems to prefix all such
    strings with a leading 'r', like so:  r"the\.pattern\sstrings".
    However, doing so will change the behaviour, for example, of
    check-package, which starts reportign new issues with our mk files
    (more on that in a later mail...)

However, this very patch is indeed about _calling_ flake8 from the
Makefile instead of only from a gitlab pipeline.

Thanks for the testing! :-)

Regards,
Yann E. MORIN.

> support/testing/infra/__init__.py:91:67: W605 invalid escape sequence '\]'
> support/testing/tests/core/test_timezone.py:7:9: E117 over-indented
> utils/check-package:48:40: W605 invalid escape sequence '\.'
> utils/check-package:48:42: W605 invalid escape sequence '\S'
> 
> [...]
> 
> utils/checkpackagelib/lib_config.py:65:48: W605 invalid escape sequence '\S'
> utils/checkpackagelib/lib_mk.py:22:28: W605 invalid escape sequence '\s'
> 
> [...]
> 
> utils/checkpackagelib/lib_mk.py:78:50: W605 invalid escape sequence '\+'
> utils/checkpackagelib/lib_mk.py:78:57: W605 invalid escape sequence '\s'
> utils/checkpackagelib/lib_mk.py:78:60: W605 invalid escape sequence '\$'
> utils/checkpackagelib/lib_mk.py:78:62: W605 invalid escape sequence '\('
> utils/checkpackagelib/lib_mk.py:78:67: W605 invalid escape sequence '\)'
> 
> [...]
> 
> utils/checkpackagelib/lib_patch.py:13:32: W605 invalid escape sequence '\d'
> utils/checkpackagelib/lib_patch.py:23:42: W605 invalid escape sequence '\s'
> utils/checkpackagelib/lib_patch.py:23:45: W605 invalid escape sequence '\['
> utils/checkpackagelib/lib_patch.py:23:52: W605 invalid escape sequence '\s'
> utils/checkpackagelib/lib_patch.py:23:55: W605 invalid escape sequence '\d'
> utils/checkpackagelib/lib_patch.py:23:59: W605 invalid escape sequence '\d'
> utils/checkpackagelib/lib_patch.py:23:62: W605 invalid escape sequence '\]'
> utils/checkpackagelib/lib.py:56:1: E302 expected 2 blank lines, found 1
> utils/getdeveloperlib.py:12:36: W605 invalid escape sequence '\+'
> utils/getdeveloperlib.py:12:38: W605 invalid escape sequence '\$'
> utils/getdeveloperlib.py:12:40: W605 invalid escape sequence '\('
> utils/getdeveloperlib.py:12:47: W605 invalid escape sequence '\$'
> utils/getdeveloperlib.py:12:49: W605 invalid escape sequence '\('
> utils/getdeveloperlib.py:12:74: W605 invalid escape sequence '\)'
> utils/getdeveloperlib.py:12:76: W605 invalid escape sequence '\)'
> utils/getdeveloperlib.py:35:33: W605 invalid escape sequence '\$'
> utils/getdeveloperlib.py:35:35: W605 invalid escape sequence '\('
> utils/getdeveloperlib.py:35:42: W605 invalid escape sequence '\$'
> utils/getdeveloperlib.py:35:44: W605 invalid escape sequence '\('
> utils/getdeveloperlib.py:35:69: W605 invalid escape sequence '\)'
> utils/getdeveloperlib.py:35:71: W605 invalid escape sequence '\)'
> utils/getdeveloperlib.py:128:32: W605 invalid escape sequence '\s'
> utils/getdeveloperlib.py:142:41: W605 invalid escape sequence '\.'
> utils/getdeveloperlib.py:142:45: W605 invalid escape sequence '\.'
> utils/scanpypi:99:22: W605 invalid escape sequence '\w'
> utils/scanpypi:340:37: W605 invalid escape sequence '\w'
> utils/scanpypi:454:60: W605 invalid escape sequence '\('
> utils/scanpypi:454:64: W605 invalid escape sequence '\)'
> 
> Regards,
> Peter
> 
> >
> > Tested-by: Peter Seiderer <ps.report@gmx.net>
> >
> > Regards,
> > Peter
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
