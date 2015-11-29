From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 10:53:06 +0100
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151129092811.0d05dabd@free-electrons.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
 <20151129092811.0d05dabd@free-electrons.com>
Message-ID: <20151129095306.GA3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-29 09:28 +0100, Thomas Petazzoni spake thusly:
> On Sat, 28 Nov 2015 18:42:37 -0200, Sergio Prado wrote:
> > Instead of making each package that needs 'sys/queue.h' select this
> > package, it would be better to select this package automatically when a
> > musl toolchain is used. That way, we won't need to change any package.
> > 
> > It is possible to do that?
> 
> Well, we could probably put this logic in the toolchain virtual
> package, since it is the common point between the internal toolchain
> and external toolchain backends (and we need sys/queue.h in both cases).
> 
> However, I am not sure if I wouldn't prefer packages that need
> sys/queue.h to have an explicit dependency on the package installing
> sys/queue.h. Since such package would itself have no dependency, it
> would be just a matter of adding "select BR2_PACKAGE_SYS_QUEUE" in
> Config.in and adding "sys-queue" in <pkg>_DEPENDENCIES.
> 
> Peter, Arnout, Yann, your opinion?

I think it is best to handle it as a dependency of the toolchain
package. That way, it is transparent to packages.

That musl refuses to carry a sys/queue.h on philosophical reasons (as
they explain in their FAQ) while all the other main C libraries do (even
newlib!) is not ground for making it difficult for packagers to add a
new package.

Adding such a package would be a Buildroot peculiarity, which I would
prefer we avoid.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
