From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 7 Jul 2011 23:05:49 +0200
Subject: [Buildroot] how buildroot handles sysroot in cross tool chain
In-Reply-To: <CAAa76NRtMHbgOH=j9yNr4wUxMpd_2RR5UHFpfvy8V306BenbJw@mail.gmail.com>
References: <CAAa76NRtMHbgOH=j9yNr4wUxMpd_2RR5UHFpfvy8V306BenbJw@mail.gmail.com>
Message-ID: <201107072305.49923.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raymond, All,

On Thursday 07 July 2011 22:30:11 raymond zhao wrote:
> I have a question in my head for a while: When we build cross tool
> chains, there always is a sysroot path hide in the compiler. The
> problem is, this path is a absolutely path. So, if we move the tool
> chain to other locations, the sysroot path will be broken. How could I
> distribute my tool chain to other developer's work station if I they
> can only access their HOME directory? Since they have different user
> name, their home directory will has different path. I do not want
> every one spend a long time to build the tool chain. Is it even
> possible?

If the sysroot is a sub-dir of the gcc prefix, then gcc will automagically
find the sysroot if the toolchain is moved. If this is so, then we say the
toolchain is relocatable.

If the sysroot is not a sub-dir of the gcc prefix, then it will break if you
move the toolchain.

Buildroot has two ways to build toolchains:
- internal backend (the default)
- crosstool-NG backend

Both backends generate relocatable toolchains. So you should be safe to
move those toolchains around.

Beware however that, if the host systems are different (eg. you build the
toolchain on a recent distro, and you move the toolchain to an old distro,
or the other way around), you may get problems running the toolchain, as
it will depend on the host libraries to run (after all, gcc et al. are
just binaries that are linked to the host libraries!). Most notably, the
libstdc++ is known to be one of the most common issues.

If this is your case, then you may want to build the toolchain entirely
staticaly linked. AFAIK, in buildroot, only the crosstool-NG backend can
generate such a statically linked toolchain.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
