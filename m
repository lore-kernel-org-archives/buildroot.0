From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 26 Feb 2009 10:13:08 -0300
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <20090226122205.390e848a@surf>
References: <20090226122205.390e848a@surf>
Message-ID: <d6cda7730902260513k5c80054j615cac3046add343@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Feb 26, 2009 at 8:22 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hi,
>
> With latest SVN, Qtopia4 doesn't build on i386. The problem is that
> 'qmake' is being built with the target compiler instead of the host
> compiler, while qmake is supposed to be executed on the host.
>
> Buildroot's qtopia4.mk Makefile patches the Qmake configuration file to
> set the correct path to the compiler.

Yes, but that's for the target .conf file, which is used by qmake, and
qmake isn't used to build qmake, instead the package comes with a
Makefile for that.
Without it, qmake generated Makefiles will just fail to find the toolchain.

> But Qt's ./configure script looks inside the Qmake configuration to
> know which compiler to use to compile Qmake itself, unless the CC and
> CXX variables are overriden.

I don't remember configure doing that, but then perhaps it changed in
newer versions.

> So I'm not sure what the correct fix for this issue is (maybe setting
> CC and CXX ?), but there's clearly an issue here.

You could configure with -fast first, this generates moc Makefiles
that will call qmake later, than fix the compiler paths after
configure has run.
This would fix the chicken-egg issue.

> Anyone having the same problem ?

I could build on AVR32 and the apps using it runs fine on the target.
It must be i386 specific.

Kind Regards,
    Thiago A. Correa
