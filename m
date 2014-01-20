From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Jan 2014 00:58:47 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <52DDAA14.5060307@openwide.fr>
References: <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
 <52DDAA14.5060307@openwide.fr>
Message-ID: <20140120235847.GA10408@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, J?r?my, All,

On 2014-01-20 23:58 +0100, Romain Naour spake thusly:
> I'm able to reproduce the issue here.
> 
> There is no specific setup, I used my current buildroot directory and run:
> 
> make O=.. BR2_EXTERNAL=.. raspberrypi_defconfig
> make: stat: /home/naourr/git/buildroot/configs/../configs/../configs/..
> [snip]
> ../configs/raspberrypi_defconfig ?. Stop
> 
> Or
> 
> make O=../output BR2_EXTERNAL=.. raspberrypi_defconfig
> make: stat: /home/naourr/git/buildroot/configs/../configs/../configs/..
> [snip]
> ../configs/raspberrypi_defconfig ?. Stop

OK, we have a way to reproduce it, now. We can investigate. Good! :-)
 
> But it's ok with :
> 
> make O=../output BR2_EXTERNAL=../external raspberrypi_defconfig  GEN
> ../output/Makefile
> #
> # configuration written to ../output/.config
> #
> 
> I have no solution currently, but I hope this help...
> 
> Yann, what's wrong with relative path for BR2_EXTERNAL or O ?

Because they do not work as you would expect. If you pass relative
paths, they are interpreted relative to the buildroot directory.

In your first two cases, you would expect it would work, but not in the
following case:

    make -C buildroot O=build BR2_EXTERNAL=br2.external foo_defconfig

In this case, you'd expect O and BR2_EXTERNAL to be relative to the
current working directory. But hey are not. They are interpreted
relative to the Buildroot dir. Bummer, that's not what you expect.

So, you should only pass absolute paths to O and BR2_EXTERNAL (IMHO).

See the manual:
    http://nightly.buildroot.org/#outside-br-custom

    ---8<---
    The BR2_EXTERNAL path can be either an absolute or a relative path,
    but if it?s passed as a relative path, it is important to note that
    it is interpreted relatively to the main Buildroot source directory,
    not the Buildroot output directory.
    ---8<---

(Note: what this does not tell, however, is that it is not interpreted
relative to the current working directory either.)

And ditto for O, although nothing is psecified about using relative
paths. :-(

Now, I don't know why it fails as thus in your case... But it's late
here. More on this tomorrow. If someone has a good idea about it... ;-)

But the bottom line is: relative paths are a plague! ;-]

Anyway, I'm all for fixing this problem you see, but the proposed patch
broke another legitimate use-case. So we have to find a better fix, if
possible.

I for one would prefer we just forbid relative paths altogether, but I'm
totaly open on keeping them, as long as:
  - we document it's very picky, and
  - we check for special cases such as the one mentioned above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
