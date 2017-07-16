From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 20:46:07 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
 file.
In-Reply-To: <CAFSsvmptrcijrJEk0=Ghw8EG3vaptir=z6WQ2Evs-xqyZaqo6A@mail.gmail.com>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk>
 <20170715214809.2158c3e2@windsurf>
 <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <CAFSsvmptrcijrJEk0=Ghw8EG3vaptir=z6WQ2Evs-xqyZaqo6A@mail.gmail.com>
Message-ID: <20170716184607.GF30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, Waldemar, All,

On 2017-07-16 13:40 -0400, Adam Duskett spake thusly:
> On Sun, Jul 16, 2017 at 12:43 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> > Peter Korsgaard wrote,
> >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
[--SNIP--]
> >>  > So I'm fine if we decide to say "no". It should hopefully increase the
> >>  > pressure on the upstream projects to move away from a legacy BSD
> >>  > interface, and use the POSIX interface instead.
> >>
> >> Ok, agreed. Adam, sorry but we prefer to keep things as they
> >> are. It should be fairly easy for uClibc-ng users wanting to enable
> >> selinux to notice that they need to change to glibc instead based on the
> >> comment:
> >>
> >> comment "libselinux needs a glibc toolchain w/ threads, dynamic library"
> But that's simply not true.  uClibc-ng compiles it just fine if FTS is
> turned on.

I can see two issues there:

  - fts() is deprecated, obsoleted; it is not POSIX:
        http://pubs.opengroup.org/onlinepubs/9699919799/idx/if.html

  - external toolchain, uClibc-based: since fts is a deprecated
    interface, it is most probably that an external toolchain does not
    have it.

Besides, musl does not provide it, so the SELinux stuff is anyway not
avbailable to everyone.

People interested in having SELinux with non-glibc will have to provide
a patch against SELinux to be dsure they are usable, at least with musl,
which is a C library with good momentum.

[--SNIP--]
> > And what about the people using an architecture which is not supported
> > by glibc? Like Sparc, ARC, Xtensa and Or1k? Or the no-MMU
> > architectures?

*This* is a valid reason to add fts() to our internal uClibc
configuraiton. If anythong, this should be the only argument exposed to
add fts().

> This is also a good point.  Why would we deny uClibc-ng users security?
> Glibc has a large history of CVE's:
> https://www.cvedetails.com/vulnerability-list/vendor_id-72/product_id-767/GNU-Glibc.html
> 
> uClibc is smaller and thus has a smaller attack vector, which is good

But unfortunately, uClibc-ng has far less exposure than glibc, so this
is also a security concern...

> in conjuntion
> with SELinux.
> 
> > We enabled Wordexp recently and I would really love to see this
> > enabled, too. Could you rethink about your decision?

I was initially writing this mail to argue in favour of adding fts(),
and now I am a little bit more suspicious, too. The only killing
argument for me is the one about archs without a glibc port. Those are
left out in the cold, and that's not nice...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
