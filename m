From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 May 2018 22:22:54 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
 <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
 <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be>
Message-ID: <20180509202254.GA9837@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

M ZV, All,

On 2018-05-08 23:37 +0200, Arnout Vandecappelle spake thusly:
> On 07-05-18 17:00, M ZV wrote:
> > Hello,?
> > We're using?mkpasswd specifically for a single task (skeleton-init-common root
> > password generation). I'm already tackling building this on Alpine (musl
>  Yes, Alpine is a pain :-)

Meh, yes... :-(

However, all the tricks required to actually build with musl are known.
Except we only have code to handle that for target packages.

For host pacakges, it is more tricky to do, though...

> > environment) and facing?
> > multiple issues: had to use -lintl for linking (that libintl musl/glibc can of
> > worms) and of course, it only makes md5 hashes since all SHA functionalities are
> > disabled on non-glibc systems via its header.
> > 
> > Can we just use a couple of python code using?crypt.crypt(...), since python is
> > already a requirement. One less package to maintain is a good news (buildroots
> > already brimming with a mind boggling?number of packages).
> 
>  Great idea! Indeed, the python script would be rather trivial - mostly
> generating salt.

I don't like that we reinvent such tools... Especially when dealing with
security-related tools...

>  Probably, when doing that, more of the mkusers script could migrate to python.
> But to start with it could be a python "oneliner":
> 
> 	dd if=/dev/urandom bs=1 count=12 | python -c "

This is not optimal. Better to do a single read instead of 12: bs=12
count=1

> 			import sys, crypt, base64
> 			salt = sys.stdin.read()

Why such convoluted code to read 12 bytes of random data? Why not use
Python's builtins for that?

    https://docs.python.org/3/library/secrets.html

    import secrets
    blob = secrets.token_bytes(12)

> 			b64salt = base64.b64encode(salt, './')
> 			b64salt = b64salt.strip('=')
> 			print(crypt.crypt('${password}',
> 				'${PASSWD_METHOD}' + b64salt))"
> 
> 
>  Normally, I'd say I want to avoid calling python in the normal build path
> (because of python overhead, because it's a hard-to-reproduce environment,
> because of python2/3 uncertainty, ...). However, that ship has sailed with the
> introduction of check-uniq-files.
> 
> 
>  Would you like to prepare a patch introducing the python-based approach? It
> should be two patches: the first one introducing the python script in mkusers,
> the second one removing the mkpasswd package.

Sorry, I am not too convinced that writing our own tool is good...

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> > By the way, my first post here, I hope I'm not coming off as a nagging
> > pedestrian just adding noise. I highly appreciate the effort you guys are
> > putting into this.
> > Thank you.
> > 
> > (My apologies for double posting - it seems, at first, I didn't reply to all)
> > 
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
