From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jan 2020 22:20:16 +0100
Subject: [Buildroot] [PATCHv2] toolchain/external: allow custom
 toolchains to use newer headers
In-Reply-To: <298831776.602613.1578355454140.JavaMail.zimbra@xes-inc.com>
References: <20200106201012.11214-1-yann.morin.1998@free.fr>
 <20200106204111.GG2721@scaer>
 <298831776.602613.1578355454140.JavaMail.zimbra@xes-inc.com>
Message-ID: <20200107212016.GA8086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aaron, Vincent, All,

On 2020-01-06 18:04 -0600, Aaron Sierra spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > On 2020-01-06 21:10 +0100, Yann E. MORIN spake thusly:
> >> From: Vincent Fazio <vfazio@xes-inc.com>
> >> When Buildroot is released, it knows up to a certain kernel header
> >> version, and no later. However, it is possible that an external
> >> toolchain will be used, that uses headers newer than the latest
> >> version Buildroot knows about.
> Vincent and I were looking through your v2 patch and started putting
> together a truth table. I finished it after he left for the day, so be
> aware that he hasn't reviewed it at this point:

Thanks for the feedback and the complete tables. :-)

> = equals latest BR is aware
> < less than latest BR is aware
> > greater than latest BR is aware
> 
> building   | selected | toolchain | OK?
> toolchain? | headers  | headers   |
> -------------------------------------------
> no         | =        |  =        | yes
> no         | =        |  <        | no (user lied about toolchain headers)
> no         | =        |  >        | yes (primary goal of patchset)
> no         | <        |  =        | no (for BR support purposes)
> no         | <        |  <        | yes, if equal (for BR support purposes)
> no         | <        |  >        | no (for BR support purposes)
> no         | >        |  =        | not possible
> no         | >        |  <        | not possible
> no         | >        |  >        | not possible
> yes        | =        |  =        | yes (non-custom are self-consistent)
> 
> These are all custom kernel headers.
> 
> yes        | =        |  <        | no (user lied about toolchain headers)
> yes        | =        |  >        | yes (desirable side-effect of primary goal)
> yes        | <        |  =        | no (for BR support purposes)
> yes        | <        |  <        | yes, if equal (for BR support purposes)
> yes        | <        |  >        | no (for BR support purposes)
> yes        | >        |  =        | not possible
> yes        | >        |  <        | not possible
> yes        | >        |  >        | not possible

Those tables are based on comparing the latest version known to
Buildroot, with the selected version and the actual version.

What we really want to test in Buildroot, is that he selected version is
the same as the actual version. This is the core of the check.

Now we want to relax that check a little, when the latest version is
custom and higher than the actual version and the latest know to
Buildroot.
So the logic is as such:

    if selected version == actual version:
        return OK

    if not latest:
        return KO

    if selected version < actual version:
        return OK

    return KO

> >> +        ret = ((l >= h ) && ("${CHECK}"[0] == 'l')) ? 0 : 1;
> 
> Based on the truth table and descriptive summaries, this test appears to be
> inverted for the case that Vincent and I are most interested in. This version
> is subtly different, but seems easier to maintain to me:

I tested this script as follows, with sysroot set to '' (empty) to use
my distros' headers, which are 5.0.0:

    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  4.9.0 loose; echo $?
    Incorrect selection of kernel headers: expected 4.9.x, got 5.0.x
    0
    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  5.0.0 loose; echo $?
    0
    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  5.1.0 loose; echo $?
    Incorrect selection of kernel headers: expected 5.1.x, got 5.0.x
    1
    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  4.9.0 strict; echo $?
    Incorrect selection of kernel headers: expected 4.9.x, got 5.0.x
    1
    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  5.0.0 strict; echo $?
    0
    $ HOSTCC=gcc ./support/scripts/check-kernel-headers.sh /home/ymorin/dev/buildroot/buildroot  5.1.0 strict; echo $?
    Incorrect selection of kernel headers: expected 5.1.x, got 5.0.x
    1

So as far as I can see, this script has the expected behaviour, with the
first case equivalent to what you expect (custom headers newer than
latest version known to BR).

>    +        if ("${CHECK}"[0] == 's' || (l > h))
>    +                ret = 1;

Actually, I think you got it wrong: 'l' is the actual version, and 'h'
is the version specified by the user, so you want to allow that.

Of course, I may have entirely missed something (which seems to be quite
usual these days...)

> [snip]
> >> diff --git
> >> a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> >> b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> >> index 665765a104..ed0a1b4421 100644
> >> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> >> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> >> @@ -92,6 +92,13 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
> >>  
> >>  endchoice
> >>  
> >> +# This should be selected by a single version, below, to indicate that
> >> +# Buildroot does not know of mor erecent headers than the ones selected.
> 
> I'm sure you meant "more recent" ;)

I've reworked that part in the new commit, and the code has moved
somewhere else, and this comment is no longer needed.

Thanks for the review! :-)

Regards,
Yann E. MORIN.

> Aaron

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
