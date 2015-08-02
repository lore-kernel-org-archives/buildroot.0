From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 00:14:06 +0200
Subject: [Buildroot] [PATCH RFC 1/1] package/libpthsem: cannot be sanely
 cross-compiled
In-Reply-To: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
References: <1438285530-320-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150802221406.GL3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan, All,

On 2015-07-30 20:45 +0100, Brendan Heading spake thusly:
> Fixes the following :
> http://autobuild.buildroot.net/results/675df26d7b47e02bad0b22f3e1cb404076a84a91/
> http://autobuild.buildroot.net/results/003c4313676cc79c72a9296159ff63dce177f079/
> http://autobuild.buildroot.net/results/86bd9fd83278a5468856f4abf700df57749d8e09/
> http://autobuild.buildroot.net/results/97205d8fce8d0851208d167fc3fc7ccce40d391a/
> http://autobuild.buildroot.net/results/1764c8f7f84fc5bad950fdb41ecadff571ceb36b/
> http://autobuild.buildroot.net/results/e733cb648398df7efd7ccae6493af3c92713a9bd/
> 
> I'm submitting this as RFC as it seems strange that I've come across this
> only now, but I don't see how libpthsem ever cross compiled in its current
> form.

I've tested the first reported build failure... And it builds fine for
me... :-/

Not to say that the result is correct, just that I can't reproduce the
build failure.

> During the configure stage, libpthsem attempts to compile and run an
> executable to detect capabilities such as which direction the stack grows,
> behaviour of setjmp, etc. Obviously these fail to execute on non-Intel
> architectures, leading to defaults which cause the build to fail even
> on architectures where libpthsem is supposed to work.
> 
> I've tested mipsel, sparcv8 and aarch64 here but I expect it will fail
> for all the other non-Intel architectures too.
> 
> There are flags to force some (but not all) of these settings to certain
> fallbacks. It's not clear, without access to each of these architectures,
> what the correct default fallback settings should be.
> 
> This patch therefore disables libpthsem and its dependents on non-Intel
> architectures.

That's definitiely not acceptable that we have to disable it.

All those tests that can not be determined at build time because they
need to run programs should be forced-guessed,with the appropriate ac_cv
variables.

See for example the atk package, which has quite a bunch of those;
    package/atk/atk.mk

Excerpt;

    ATK_CONF_ENV = \
        ac_cv_func_posix_getpwuid_r=yes \
        glib_cv_stack_grows=no \
        glib_cv_uscore=no \
        ac_cv_func_strtod=yes \
        ac_fsusage_space=yes \
        fu_cv_sys_stat_statfs2_bsize=yes \
        ac_cv_func_closedir_void=no \
        [...]

Which should be done in this case, too.

----

For the records, I've diffed the config.log from the first build failure
with the config.log I git on my machine, and there are a few interesting
differences ('-' is mine, '+' is the autobuild failure):

First, it's not using the same awk implementation:

    -configure:2743: found /usr/bin/gawk
    -configure:2754: result: gawk
    +configure:2757: result: no
    +configure:2727: checking for mawk
    +configure:2743: found /usr/bin/mawk
    +configure:2754: result: mawk

Second, running programs fail with different errors; the error on my
machine is probably the dynamic linker /lib/ld.so whinning that it can
not recognise the exectuable (expected, it's PPC, my machine is x86_64),
while the error on the autobuilder is probably becasue the dynamic
linker does not exist (probably because it is not in the same location):

    -./configure: line 1828: ./conftest: cannot execute binary file: Exec format error
    -configure:12578: $? = 126
    -configure: program exited with status 126
    +./configure: line 1828: ./conftest: No such file or directory
    +configure:12578: $? = 127
    +configure: program exited with status 127

Third, and much more interesting, is the mis-detection of the sjlj to
use:

    -configure:14176: result: yes: ssjlj
    +configure:14176: result: yes: sjljlx
    [--SNIP--]
    -configure:15098: result: decision on mctx implementation...  sjlj/ssjlj/sas
    +configure:15098: result: decision on mctx implementation...  sjlj/sjljlx/none
    [--SNIP--]
    -PTH_MCTX_ID='sjlj/ssjlj/sas'
    +PTH_MCTX_ID='sjlj/sjljlx/none'

Ah, and my system has my login shell set to /bin/bash , not /bin/sh .

Now, if you look closely (not too closely, even!), you'll see that those
errors are all occuring on a single autobuilder, the one from Nathaniel:

    http://autobuild.buildroot.org/?reason=libpthsem-2.0.8

So, I guess something from the environment causes the build failures.

Not to say that we should not fix them, just that probably the proposed
fix is not the correct solution...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
