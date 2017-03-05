From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 14:46:18 +0100
Subject: [Buildroot] [PATCH 2/2] package/wayland: don't build tests
In-Reply-To: <20170305142102.0faed242@free-electrons.com>
References: <cover.1488711390.git.yann.morin.1998@free.fr>
 <59483ee76c501ec78cfbb2250c3fbcf02f6f7a85.1488711390.git.yann.morin.1998@free.fr>
 <20170305142102.0faed242@free-electrons.com>
Message-ID: <20170305134618.GE3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-05 14:21 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sun,  5 Mar 2017 11:56:51 +0100, Yann E. MORIN wrote:
> > wayland is entirely written in C, except for a single test that is
> > written in C++.
> > 
> > Since we are not interested in running the tests on the target, add an
> > option to configure to disable tests altogether.
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/291/291e0f1ea18004190ae5acd9bec147cacc3e4bda/
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> I think this solves our (Buildroot) immediate problem, but is not the
> completely correct fix for upstream. Indeed, if Wayland is trying to
> build some C++ code, it should use AC_PROG_CXX and then only try to
> build the C++ code if it found a C++ compiler.

They do use AC_PROG_CXX:

    https://cgit.freedesktop.org/wayland/wayland/tree/configure.ac#n29

But please note the comment just a few lines below:

    https://cgit.freedesktop.org/wayland/wayland/tree/configure.ac#n33

    # check if we have C++ compiler. This is hacky workaround,
    # for a reason why it is this way see
    # http://lists.gnu.org/archive/html/bug-autoconf/2010-05/msg00001.html
    have_cpp_compiler=yes

    if ! which "$CXX" &>/dev/null; then
        have_cpp_compiler=no
    fi

    AM_CONDITIONAL(ENABLE_CPP_TEST, test "x$have_cpp_compiler" = "xyes")

Alas, this does not work, because CXX is set to 'false' so the which
actually succeeds. One would need to actually call $CXX to see if it is
working.

I'll see to send another patch to this effect.

Yet, I think this --disable-tests is also good to upstream.

Regards,
Yann E. MORIN.

> But well, this --disable-tests thing is definitely good enough for us,
> so I'll apply this.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
