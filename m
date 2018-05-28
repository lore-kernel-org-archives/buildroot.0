From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 22:07:55 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <87h8mwbw7r.fsf@dell.be.48ers.dk>
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
 <87h8mwbw7r.fsf@dell.be.48ers.dk>
Message-ID: <20180528200755.GG2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-05-24 23:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > binutils installs its binaries both as bin/<tuple>-<tool> and as
>  > <tuple>/bin/<tool>, and hardlinks are used to reduce disk space
>  > consumption. This causes a problem for host-binutils with our rpath
>  > fixing logic done by "make sdk".
> 
>  > Indeed, the fix-rpath script starts by fixing up the rpath of
>  > bin/<tuple>-<tool>, and sets the RPATH to $ORIGIN/../lib/. Then
>  > fix-rpath moves on to <tuple>/bin/<tool>, and doesn't find the library
>  > the tool depends on, and clears the RPATH. The result is that the
>  > binutils tool are not usable.
> 
>  > Note that this is only visible currently on the ARC architecture,
>  > because on this architecture, binutils is fetched from git, which
>  > causes host-flex to be built, and some binutils tools to use the libfl
>  > shared library. Therefore, the binutils tools don't use just the
>  > standard C library (which is provided by the system) but also libfl
>  > from $(HOST_DIR)/lib, and therefore if the RPATH isn't set correctly,
>  > those tools don't work properly.
> 
>  > In order to address this, this comit adds a post-install hook to
>  > host-binutils that replaces those hard links by symbolic links. It is
>  > worth mentioning that library loading and RPATH usage occurs *after*
>  > resolving the symbolic links, which makes this solution work.
> 
>  > Fixes:
> 
>  >   http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1/
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Committed to 2018.02.x, thanks.

As discussed on IRC, and so you don't forget, this will require further
backporting of fixes for bug #11031 when they are applied to master:
    https://patchwork.ozlabs.org/patch/921680/
    https://patchwork.ozlabs.org/patch/921681/

;-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
