From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 22:31:27 +0200
Subject: [Buildroot] Relocate uClibc toolchain question
In-Reply-To: <CAHXCMMJjd3tt2NLfu=O2uKF1-gHyWBdhEhpsbGCRzxRRrt=ATQ@mail.gmail.com>
References: <CAJbs9BEw+45qVbj_zcy_iFj3dGbHdN772upUXFg=pDiaR7WEsw@mail.gmail.com>
 <CAHXCMMJjd3tt2NLfu=O2uKF1-gHyWBdhEhpsbGCRzxRRrt=ATQ@mail.gmail.com>
Message-ID: <201209102231.27949.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sameul, Rishi, All,

On Monday 10 September 2012 22:14:42 Samuel Martin wrote:
> 2012/9/10 Rishi <rishid+mailman@gmail.com>:
> > I performed a "cp -rf output/host/ /opt/arm_uClibc" and then attempted
> > to use this compiler by passing the --sysroot option as suggested in
> > Documentation.
> > (http://buildroot.uclibc.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot)
> Afaik, Buildroot toolchain are not yet fully relocatable

IIRC, that's right.

> However, both solutions (based on adding output/host/usr/bin to your
> PATH or changing the host directory location) should works.

Right again. In Rishi's case, I'd suggest (s)he sets the host directory
location, and rebuilds from scratch.

> > 1. Any ideas on how to fix this?  Codesourcery toolchain does not have
> > libmpc.so.2, so I was a bit puzzled.
> Afaik, libmpc is not a mandatory for a toolchain (you don't need it
> for building the toolchain itself).

Wrong. gcc needs mpc to do calculations on complex numbers. gcc needs a few
other such libraries (which I call "companion libraries"):
  gmp         GNU Multi-Precision arithmetic library
  mpfr        Multiple-Precision Floating-point with correct Rounding
  mpc         Multiple-Precision on Complex numbers
  ppl         Parma-Polyhedral Library
  cloog/ppl   Chunky LOOp Generator with PPL as backend

And I would guess CS toolchain are statically linked against libmpc, hence
the reason there's no such lib in their toolchain, as they do for the other
companion libraries.

Static linking against the companion libraries is also what crosstool-NG
does.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
