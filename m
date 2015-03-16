From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 18:05:53 +0100
Subject: [Buildroot] gdbserver located outside *SYSROOT
In-Reply-To: <1426520722.19530.26.camel@synopsys.com>
References: <1426520722.19530.26.camel@synopsys.com>
Message-ID: <20150316170553.GE4271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2015-03-16 15:45 +0000, Alexey Brodkin spake thusly:
> I just realized that in pre-built ARC GNU tools gdbserver resides
> outside of SYSROOT_DIR/ARCH_SYSROOT_DIR.
> 
> Historically we put gdbserver in top-level "target-bin" folder.
> 
> And I'm wondering how to deal with it to get proper copy of it onto
> target if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is selected.
> 
>  [1] Do we really need to re-consider placement of gdbserver for our
> next release of GNU tools for ARC? Then what could be the best location?

Well, other toolchains usually put gdbserver in the sysroot or the
arch-sysroot, so it looks like a proper location to put it.

crosstool-NG toolchains put it in a specific directory, 'debug-root',
which stands side-by-side with the sysroot (not necessarily the best
move I did with that, but that's supported by Buildroot).

gdbserver, being a target executable, really has no place in the
top-level bin/ directory. It would be good to move it out of there.

>  [2] Will setup of TOOLCHAIN_EXTERNAL_FIXUP_CMDS to cp gdbserver to some
> related location be a good solution of the problem (if so then maybe
> forget about [1] at least until we have multilibbed tools for ARC)?

Yes, using _FIXUP_CMDS is a good solution, and is made exactly for this
kind of situation. Just copy in into sysroot/bin/ and you're done.

Regards,
Yann E. MORIN.

> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
