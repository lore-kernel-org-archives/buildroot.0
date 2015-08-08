From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2015 01:22:42 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <20150808104308.2438494b@free-electrons.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
 <55C4B65A.3010804@green-communications.fr>
 <20150808104308.2438494b@free-electrons.com>
Message-ID: <20150808232242.GC3594@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Sylvain, All,

On 2015-08-08 10:43 +0200, Thomas Petazzoni spake thusly:
> On Fri, 07 Aug 2015 15:44:58 +0200, Sylvain Raybaud wrote:
> > OK I can make a virtual package, that seems to make sense. However,
> > according to section 17.11.6, it seems that I'll have to patch all
> > packages that depend on mysql, because there is some special magic to
> > add in the depender's Config.in, am I right? Is this the way to go?
> 
> We could do something like jpeg (virtual), libjpeg and jpeg-turbo. This
> way, dependers can continue to do a "select BR2_PACKAGE_MYSQL", and
> there is a "choice" in mysql/Config.in to choose between the original
> MySQL or MariaDB. Of course the original MySQL package will have to be
> renamed to some other name than mysql.
> 
> I think the mechanism where the package depending on the virtual
> package do "depends on BR2_PACKAGE_HAS_<foo>" is very good for cases
> like OpenGL and al. where we have potentially an arbitrary/unlimited
> number of providers.
> 
> But for things like libjpeg/jpeg-turbo or mysql/mariadb, where we know
> the choice will be limited to a few alternatives, it probably makes
> sense to have something like libjpeg.
> 
> I've Cc'ed Yann, to get his opinion on the matter.

Well, I never much liked the way the jpeg package has been done.

I do understand that it makes it just work great for users. However,
that was not the way virtual packages were supposed to work; it's
just a (bad) hack (which in fact predates the actual virtual package
infra, IIRC).

And it's a hack that prevents a br2-external from providing its own
jpeg implementation (e.g. one optimised to make use of a specific SoC
hardware, for example).

Now, the mariadb vs. mysql case might not be so problematic. We don't
much expect a myriad of alternate implementations to just pop-up over
the night, and even less hardware-specific implementations. But who
knows? That's probably what we originally thought about the jpeg case,
and now I see at least one reason why we should not have done it that
way... Maybe some vendors have specially-crafted mysql /forks/ tailored
to specific use-cases (but do we care?)...

So, I'd rather that we just handle virtual packages like is done for the
GL case rather than the jpeg case (which I consider broken...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
