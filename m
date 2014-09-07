From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 7 Sep 2014 14:17:21 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140907092158.600154db@free-electrons.com>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <87lhpwmr7m.fsf@dell.be.48ers.dk> <20140907092158.600154db@free-electrons.com>
Message-ID: <CAAXf6LWtNSM5JWfAoz9JEK16qvnEMqPR-BnpV4_kTgBnuXimVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 7, 2014 at 9:21 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 06 Sep 2014 22:25:33 +0200, Peter Korsgaard wrote:
>
>>  > Seems like Nathaniel autobuilder does not have the ncurses development
>>  > libraries installed (also causing build failures in host-mysql, for
>>  > example). What is our policy regarding ncurses? I have it installed in
>>  > my autobuilder because I use it to run "make menuconfig". But it's true
>>  > it's not technically absolutely required to run a Buildroot build.
>>
>>  > Should we add dependency on host-ncurses where appropriate? Or should
>>  > we make ncurses development files on the build machine a mandatory
>>  > dependency? What if the user uses only xconfig or gconfig?
>>
>> Given how many people use menuconfig, I think we should just make
>> ncurses a mandatory dependency. Just about anybody doing embedded Linux
>> development needs them anyway to configure
>> barebox/linux/busybox/uclibc/ctng/..
>>
>> If not, then we would also need to add host-ncurses to our
>> barebox/linux/busybox/uclibc-menuconfig targets.
>
> Well not sure we want to go down this road: it would mean we should add
> host-qt as a dependency of the linux-xconfig target for example. We
> could also decide that the *-menuconfig targets need to have curses-dev
> installed on the build machine, but that the package that we build and
> that need host-curses will depend on host-curses.
>
> But well, menuconfig is indeed widely used, so maybe the easiest
> solution would be to make ncurses-dev a mandatory dependency.
>

An alternative is to use the suitable-host-package mechanism in such
cases: if the host does have ncurses (but the same could be done for
autoconf, automake, flex, bison, and other host packages) then build
it inside buildroot. If it does, then just use them directly.
Since the build of host-ncurses does take some time, it may be
advantageous for the user to install ncurses on the host anyway, to
avoid long build times, so a notice at the end of the build process to
suggest that could be useful.

Best regards,
Thomas
