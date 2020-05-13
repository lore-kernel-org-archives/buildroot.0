From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 23:29:52 +0200
Subject: [Buildroot] Adding post image hook
In-Reply-To: <CAFV4z9Y6QvY=Ds2sw6U27fSnrcVeKJ0a9p8-nZhHZS+Mua3fEQ@mail.gmail.com>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
 <20200513221628.42c07184@windsurf.home>
 <CAFV4z9Y6QvY=Ds2sw6U27fSnrcVeKJ0a9p8-nZhHZS+Mua3fEQ@mail.gmail.com>
Message-ID: <20200513212952.GD12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2020-05-13 14:09 -0700, Patrick Mochel spake thusly:
> Hi Thomas,
> On Wed, May 13, 2020 at 1:16 PM Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com> wrote:
>   Or alternatively, you can do just:
>   ? make printvars

This only works for in-tree builds. For out-of-tree builds, you would
want to run (this also works for in-tree builds):

    make -C $(BASE_DIR) printvars

> FWIW, This doesn't generate any output.

Probably you were doing an out-of-tree build?

> As I mentioned in my previous email, you can do e.g.:
> $ make printvars VARS="%" > [2]printvars-plain.mk
> .. which does generate?+/- the desired output of _everything_, but it also results in this in the shell:
>   make: support/dependencies/check-host-.sh: Command not found

Yes, this is a side-effect of not actually runing the commands: some
variables are not set in this context, when they are macros that expect
arguemnts. For example, this very case is caused by:

    support/dependencies/dependencies.mk;

        define suitable-host-package
        $(shell support/dependencies/check-host-$(1).sh $(2))
        endef

So suitable-host-package is a vriable like the others. But it's also a
macro, which is expect to be called with $(call ...). However, in the
context of printvars, it is expanded as a simple variable. In this
context, $(1) and $(2) are empty.

> .. with the result (only as an aside) of this:
> $ wc -l [3]printvars-plain.mk && ls -sh [4]printvars-plain.mk
> 307705 [5]printvars-plain.mk
> 31M [6]printvars-plain.mk
> All things considered, it's not that big of a deal in terms of size, but it does also include all of the expanded macros; e.g. '
> define inner-kconfig-package', of which I'll spare the list the full text and leave it as an exercise to the reader. ;-)?
> Those are all appended to the list of package (and other component) variables; i.e. right after this last package variable:
> ZZIPLIB_VERSION=0.13.69
> .. and this makes parsing the bulk slightly problematic -- there are ~30k lines of generated make functions with interspersed blank
> lines that are irrelevant to package (or other component) variables.
> In the end, this is just FYI. If you have suggestions of how one might improve on this, I'm all ears and might even look into
> rectifying it..

Nowadays, the cannonical way to extract information out of the internals
of Buildroot is geared toward json-formatted output.

If you want information from packages, you should use (and extend if
needed) from your post-scripts:

    make --no-print-directory -C $(BASE_DIR) show-info

Or try in your favourite interactive bourne shell:

    $ make show-info | jq .
    $ make show-info | jq keys

This contains information about packages, indexed by package name, with
version, dependencies, legal info, download URLs, etc, etc, etc...

Other internal stuff is not exposed, and I am not sure if we want to
make it easy/easier to get at... But *if* we were to do that, I'd leave
printvars aside as-is for legacy scripts, and introduce a new show-vars
(or whatever) that outputs json-formatted content. But again, I'm not
sure we'd want to provide that...

Regards,
Yann E. MORIN.

> Cheers,
> Patrick
> 
> Links:
> 1. mailto:thomas.petazzoni at bootlin.com
> 2. http://printvars-plain.mk
> 3. http://printvars-plain.mk
> 4. http://printvars-plain.mk
> 5. http://printvars-plain.mk
> 6. http://printvars-plain.mk

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
