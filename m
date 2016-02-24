From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Feb 2016 22:48:32 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <56CE1E61.7000008@zacarias.com.ar>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
 <56CE1E61.7000008@zacarias.com.ar>
Message-ID: <20160224214832.GA3449@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Romain, All,

On 2016-02-24 18:19 -0300, Gustavo Zacarias spake thusly:
> On 22/02/16 05:40, Romain Izard wrote:
> 
> >My issue is that I'm updating an existing system, and the application
> >has expensive scripts that rely on the behaviour of coreutils regarding
> >some options that busybox does not have. As I cannot easily change those
> >scripts, my goal is to try to provide the same services with an updated
> >rootfs. To keep everything (including wifi, bluetooth, glib and a lot
> >more) in less 10 MiB as it did in the past, removing even 300 KiB from
> >coreutils is a step in the right direction. And I though it was a better
> >if is was done in a clean way, instead of the ad-hoc patches I had in
> >the previous generation
> >
> >But if you think buildroot does not need it, I won't insist.
> >
> >Best regards,
> 
> Hi Romain.
> How about adding a more lightweight option to the coreutils package to
> disable the single-binary mode?

Yes, that is a great ides, maybe a choice like:

    choice
        bool "Single-binary mode"
        default BR2_PKG_COREUTILS_SINGLE_SYMLINKS

    config BR2_PKG_COREUTILS_SINGLE_NONE
        bool "none"

    config BR2_PKG_COREUTILS_SINGLE_SYMLINKS
        bool "symlinks"

    config BR2_PKG_COREUTILS_SINGLE_SHEBANGS
        bool "shebangs"

    endchoice

And the corresponding code in the .mk file, of course.

Regards,
Yann E. MORIN.

> That way if all you want is 1-2 binaries you can purge the rest from a
> post-build script to save space, if you want more then single-binary mode
> makes sense to kill code duplication.
> Regards.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
