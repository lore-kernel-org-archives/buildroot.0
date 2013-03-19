From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2013 21:34:32 +0100
Subject: [Buildroot] [PATCH v2] gdb: convert to the package
	infrastructure
In-Reply-To: <1363720308-12881-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363720308-12881-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201303192134.32575.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 19 March 2013 Thomas Petazzoni wrote:
> This commit converts gdb to the package infrastructure, and therefore
> moves it from toolchain/gdb to package/gdb.
> 
> The target package is now visible in "Package selection for the
> target" => "Debugging, profiling and benchmark". The main option,
> "gdb", forcefully selects the "gdbserver" sub-option by
> default. Another sub-option, "full debugger" allows to install the
> complete gdb on the target. When this option is enabled, then
> "gdbserver" is no longer forcefully selected. This ensures that at
> least gdbserver or the full debugger gets built/installed, so that the
> package is not a no-op.
> 
> The host debugger is still enabled through a configuration option in
> "Toolchain". It is now visible regardless of the toolchain type (it
> used to be hidden for External Toolchains). The configuration options
> relative to the host debugger are now in package/gdb/Config.in.host,
> similar to how we have package/binutils/Config.in.host.
> 
> Since gdb is now a proper package, it is no longer allowed to 'select
> BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
> needed. Instead, it now 'depends on
> BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is select by
> the different toolchain backends when appropriate. The
> 'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
> we no longer need to know when it is allowed to 'select
> BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
> appear right below the thread implementation selection (in the case of
> the Buildroot toolchain backend).

There is a little inconsistency in the available choices:
    Toolchain  --->
        [ ] Copy gdb server to the Target

is still available, even if:
    Package Selection for the target  --->
        Debugging, profiling and benchmark  --->
            [*] gdb
            [*]   gdbserver

I think it does not make sense to both copy the gdbserver from the
toolchain, *and* build our own version.

Given that the cross-gdb and the gdbserver are tightly coupled one to
the other, I think we should have these possibility expressed in the
menuconfig:

  - copy gdbserver from the external toolchain
    --> this assumes that there is a cross-gdb in the toolchain
    --> we should not build our own host cross-gdb
    --> we should not build our gdbserver
    --> we can build the full gdb (on the target)

  - do not copy gdbserver from the toolchain
    --> we can build both our host cross-gdb and our gdbserver
    --> we can build the full gdb (on the target)
    --> if the user uses the cross-gdb from the external toolchain, and
        it breaks, then too bad for him/her.

At the very least, the external gdbserver and our own should be mutually
exclusive.

Also, the host cross-gdb and the gdbserver should be compiled from the
same version, otherwise you may experience breakage. Although the
gdbserver protocol should be stable, experience has proven this is not
always the case.

So I would suggest that, if we build the gdb (on the target) and/or the
gdbserver, then the host cross-gdb version should not be selectable, and
should be deduced from the version used to build the gdb (on the target).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
