From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 12 May 2010 23:19:35 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <4BEAE23A.2000906@carallon.com>
References: <4BEAE23A.2000906@carallon.com>
Message-ID: <201005122319.35163.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Wednesday 12 May 2010 19:15:38 Will Wagner wrote:
> I am starting work on a new target and thought I'd take a look at using 
> a crosstool-NG external toolchain and I have a couple of questions about 
> what is supposed to be supported.

> When configuring buildroot I set all my options the same as the 
> toolchain, except for thread support where nptl was not an option. Does 
> it matter that they don't match up?

I'm not sure I understand the question... :-/
Buildroot _shall_ be configured to match the external toolchain features.

It is not possible to extract the external toolchain configuration prior
to displaying the config menu, as the path to the toolchain is entered in
that menu.

So one has to tell buildroot what is or is not supported by the external
toolchain. These options are then checked for by the buildroot makefiles,
and if they do not match, the build stops.

> Should you even be able to set
> thread library when using an external toolchain?

An external toolchain can be built to not support threading. It's an option
in crosstool-NG, at least. Maybe other means to build toolchain also offer
this possibility.

So yes, we also have to select threading model in buildroot, and it has to
match the external toolchain capabilities.

> When using crosstools who should build gdb? If buildroot builds it I 
> have to make sure my toolchain is not read only? Can I just let 
> crosstools build gdb for the host and only get buildroot to make gdb-server?

The same entity shall build both the cross gdb and the gdbserver, as those
two are tightly coupled, because of the protocol to exchange information
between them.

So either you get buildroot to build both, or crosstool-NG. You can't mix.

Definitely, gdb is on the border line, because it's a valuable tool to have
in a toolchain, but it's not really part of the toolchain either, that's why
it's possible to build a cross gdb and a gdbserver with crostool-NG. But
there is currently no way to have buildroot copy the gdbserver from the
debug-root to the staging/target dires of buildroot. I'm working to tightly
integrate crosstool-NG as a backend to generate the toolchains, and once
that's done, it will be possible to (although not at the first inclusion
of this work in BR tree).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
