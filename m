From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2016 18:29:08 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
Message-ID: <20160109172908.GA3444@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

Reviving this old one that is still pending in Patchwork...

On 2015-03-01 18:17 +0100, Karoly Kasza spake thusly:
> This change makes it possible to use exactly the same sources for both
> headers during toolchain building and for kernel building itself, even
> if custom kernel is selected.
> 
> That way users can be sure that ABI mismatch won't happen between toolchain
> and kernel.

So, I'll try to summarise what we have for now:

  - select kernel headers version and select kernel version (separately)

  - select kernel headers version, also used as kernel version.

What you want to add with this patch is:

  - select kernel version, also used as kernel headers version.

In fact, I think that the second case we already have (headers version
implies kernel version) is a bit weird. Surely, I would have expected
something reversed, like "kernel version implies headers version", which
this patch is trying to provide.

So, it just occured to me, that the second case we already have for now
is not really what we need because it does not rally make sense. What we
need as it makes more sense is the reverse of what we currently have.

So, I've had a little look, and I think we may have a solution to this
version string mess.

In Kconfig, one can default a string option to either a constant, or to
another variable, like:

    config FOO
        string "foo"

    config BAR
        string
        default FOO

In this case, BAR will have the same value as set for FOO. It also works
if FOO has no prompt and only gets its value from (conditional) defaults,
like:

    choice
        bool "Version?"
    config A1
        bool "A1"
    config A2
        bool "A2"
    endchoice
    
    config VERSION
        string
        default "A1" if A1
        default "A2" if A2
    
    config VER
        string
        default VERSION

So, at first sight, we could still have the option handled from kconfig,
whereby the kernel headers version would be set like so from the kernel
version.

In the end, to summarise:
  1) we remove the current "headers version implies kernel version"
     possibility (beware to handle legacy)
  2) we add the "kernel version implies headers version" possibility,
     setting the headers version from kconfig.

Thomas, what's your opinion?

Karoly, are you still interested in this feature? If so, are you willing
to look at the above proposal of mine, and see if you can get something
usefull out of it? ;-)

Thanks!

In the meantime, I'm marking this patch as "changes requested" in our
patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
