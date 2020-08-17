From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2020 18:15:32 +0200
Subject: [Buildroot] [PATCH v2] package/apcupsd: add -lstdc++ for ARC7*
 and SPARC
In-Reply-To: <CADvTj4rHF5+nE-Po09w5Gyhu8ttkqJ4P_oGx_8K3UukVMxX-wQ@mail.gmail.com>
References: <20200812171821.2517-1-Evgeniy.Didin@synopsys.com>
 <20200817072505.GM24264@scaer>
 <CADvTj4rHF5+nE-Po09w5Gyhu8ttkqJ4P_oGx_8K3UukVMxX-wQ@mail.gmail.com>
Message-ID: <20200817161532.GO24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-08-17 01:51 -0600, James Hilliard spake thusly:
> On Mon, Aug 17, 2020 at 1:25 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Evgeniy, James, All,
> >
> > On 2020-08-12 20:18 +0300, Evgeniy Didin spake thusly:
> > > For some reason apcupsd is not building for ARC700 and SPARC,
> > > adding "-lstdc++" solves the issue.
> >
> > So, as Thomas already replied, this is not an acceptable explanation.
> >
> > The real question is "why are they forgetting to link with -lstdc++ when
> > linking a C++ program to begin with?"
> Well from my understanding they are intentionally linking with -lsupc++
> instead of -lstdc++, but for some reason -lsupc++ is broken on certain
> platforms for linking apcupsd.
> See: https://gcc.gnu.org/onlinedocs/libstdc++/faq.html#faq.what_is_libsupcxx

Fact is, I don't understand *why* they would write a C++ program and not
link with the g++ compiler.

The rationales exposed bu apcupsd are:

  - that CUPS does not have a dependency on C++, but that is not even true
    nowadays;

  - that they need to be binary-portable across distributions, which is
    somewhat useless for distros as they do build from scratch, and we
    do also build from source and are not caring about portability.

So I'm still unsure why using gcc, but I think that trying (and failing)
to reinvent the linker logic is flawed IMHO.

So, my opinion is still that we should use g++ to do the link of a C++
program.

Besides, we're not going to fix existing toolchains and we need to move
forward.

I'm siding with Thomas here, that adding the explicit linking with
-lstdc++ is not the ebst way to solve it, adn rather that we want to
patch configure to use g++ to link.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
