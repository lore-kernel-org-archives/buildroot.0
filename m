From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 19:15:32 +0200
Subject: [Buildroot] BR variable that points the built kernel
In-Reply-To: <CAFRxoJnZEi83_Zj45gAXMvwxZ5x=Cp1o-iMMhU9jVFHWArzbEw@mail.gmail.com>
References: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
 <20150609140338.49987c19@free-electrons.com>
 <CAFRxoJnECac59y=bjeHYvXP4bDwU7Em9tcGm8kxixq_EjHr0MA@mail.gmail.com>
 <20150609160304.021d6edb@free-electrons.com>
 <CAFRxoJ=O5=UvmRJPu3+qn2zVu6dniym7qTAdvWSWMf9Dpozk0Q@mail.gmail.com>
 <20150610103606.31b56e0b@free-electrons.com>
 <CAFRxoJnZEi83_Zj45gAXMvwxZ5x=Cp1o-iMMhU9jVFHWArzbEw@mail.gmail.com>
Message-ID: <20150610171532.GA3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marco, All,

On 2015-06-10 12:06 +0200, Marco Pastorelli spake thusly:
> Thanks for your help, now it's more clear.
> Just to give more details I'm trying to write a post-build script in order
> to create a log file of the build. One information that is important for me
> is the kernel version, so I wrote the following line:
> 
> LINUX_VERSION=$(cat $(LINUX_DIR)/include/config/kernel.release)
> 
> That's where I run into the error.

That's because you're writting a shell script, not a Makefile. And in
shell script, $(foo) means running the command 'foo', not evaluating the
variable foo.

Besides, as Thomas said, not all variables are exported, and especially
the variables cotaining the packages build directories are not exported.
So, you can't refer to them from a post-build or post-image script.

However, there *is* a way to get them, which is asking Buildroot for
them. I have a similar need, and here's what I do:

    linux_dir_as_shell_variable=$(
        make printvars 2>/dev/null \
        |sed -r -e '/^LINUX_DIR=([^[:space:]]+)[[:space:]]+.*/!d; s//\1/;'
    )

    printf "LINUX_DIR from Buildroot is '%s'\n" "${linux_dir_as_shell_variable}"

And since you are only interested in the Linux version, you can replace
LINUX_DIR with LINUX_VERSION (or even LINUX_VERSION_PROBED).

However, it takes quite some time to run, because it is evaluating *all*
variables for *all* enabled packages, so it works OK if all you need is
only a few variable. If you need more, then you'd need a more complex
solution (or pay the price of calling make for each variable you need).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
