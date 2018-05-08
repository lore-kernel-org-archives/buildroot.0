From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 May 2018 23:37:21 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
 <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
Message-ID: <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Added Matt as

On 07-05-18 17:00, M ZV wrote:
> Hello,?
> ?
> 
> 
>     On Thu, May 3, 2018 at 11:04 PM Yann E. MORIN <yann.morin.1998@free.fr
>     <mailto:yann.morin.1998@free.fr>> wrote:
> 
>         ditch our own bundled version, and switch to making our whois package a
>         hot pacakge, and use that as the provider for mkpasswd.
> 
>         Stefan, would you want to do that? ;-)
> 
> 
>     I'll give it a go, but can only work on this in a few weeks when I get some
>     free cycles...
> 
>     Regards, Stefan
> 
> 
> We're using?mkpasswd specifically for a single task (skeleton-init-common root
> password generation). I'm already tackling building this on Alpine (musl

 Yes, Alpine is a pain :-)

> environment) and facing?
> multiple issues: had to use -lintl for linking (that libintl musl/glibc can of
> worms) and of course, it only makes md5 hashes since all SHA functionalities are
> disabled on non-glibc systems via its header.
> 
> Can we just use a couple of python code using?crypt.crypt(...), since python is
> already a requirement. One less package to maintain is a good news (buildroots
> already brimming with a mind boggling?number of packages).

 Great idea! Indeed, the python script would be rather trivial - mostly
generating salt.

 Probably, when doing that, more of the mkusers script could migrate to python.
But to start with it could be a python "oneliner":

	dd if=/dev/urandom bs=1 count=12 | python -c "
			import sys, crypt, base64
			salt = sys.stdin.read()
			b64salt = base64.b64encode(salt, './')
			b64salt = b64salt.strip('=')
			print(crypt.crypt('${password}',
				'${PASSWD_METHOD}' + b64salt))"


 Normally, I'd say I want to avoid calling python in the normal build path
(because of python overhead, because it's a hard-to-reproduce environment,
because of python2/3 uncertainty, ...). However, that ship has sailed with the
introduction of check-uniq-files.


 Would you like to prepare a patch introducing the python-based approach? It
should be two patches: the first one introducing the python script in mkusers,
the second one removing the mkpasswd package.


 Regards,
 Arnout

> By the way, my first post here, I hope I'm not coming off as a nagging
> pedestrian just adding noise. I highly appreciate the effort you guys are
> putting into this.
> Thank you.
> 
> (My apologies for double posting - it seems, at first, I didn't reply to all)
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
