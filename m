From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jan 2019 08:33:21 +0100
Subject: [Buildroot] [PATCH v1] libinput: drop C++ dependency
In-Reply-To: <20190111230158.5283-1-ps.report@gmx.net>
References: <20190111230158.5283-1-ps.report@gmx.net>
Message-ID: <20190112073321.GE2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-01-12 00:01 +0100, Peter Seiderer spake thusly:
> The meson C++ dependency is only used for a build-time header
> include test, so drop both.
[--SNIP--]
> [1] http://autobuild.buildroot.net/results/bf4d3d360f635c3524a52b84a72d558770596ed0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note:
>   - alternative solution would be to add a c++ dependency for libinput
>   - patch could be improved to optional C++ dependency/compile (but did
>     not know how to express this in meson)
[--SNIP--]
> +@@ -641,12 +641,6 @@ executable('test-build-linker',
> + 	   include_directories : [includes_src, includes_include],
> + 	   dependencies : [ dep_libinput, dep_libinput_util ],
> + 	   install : false)
> +-# test including from C++
> +-executable('test-build-cxx',
> +-	   'test/build-cxx.cc',
> +-	   dependencies : [dep_udev],
> +-	   include_directories : [includes_src, includes_include],
> +-	   install : false)

You may want to test something like that:

    if add_languages('cpp')
        executable('test-build-cxx',
            blablabla)
    endif

If that works, then I think I'd prefer we use this patch, because it is
upstreamable, which you should try to do btw.

Regards,
Yann E. MORIN.

> + # This is the test suite runner, we allow disabling that one because of
> + # dependencies
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
