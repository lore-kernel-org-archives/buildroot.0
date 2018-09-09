From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Sep 2018 20:55:18 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <20180909073616.GC2841@scaer>
 <20180909141037.69b16e95@windsurf.home>
 <CA+_SqVbJqv2On+9UPE4pcoyiK1wfDZp=t1h1yMdfVB-CQGp91g@mail.gmail.com>
 <20180909133341.GJ2841@scaer>
 <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
 <20180909142019.GK2841@scaer>
 <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
Message-ID: <20180909185518.GA2409@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

This is the last email I'll be sending in this thread, because it looks
like the both of us are re-hashing the same arguments again and again...
Yet, let me reply to parts of your email...

On 2018-09-09 17:58 +0100, Angelo Compagnucci spake thusly:
> On Sun, Sep 9, 2018 at 3:20 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > On 2018-09-09 14:44 +0100, Angelo Compagnucci spake thusly:
> > > On Sun, Sep 9, 2018 at 2:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > On 2018-09-09 13:25 +0100, Angelo Compagnucci spake thusly:
[--SNIP--]
> > > My concern here is that you start from a reproducible build, add your
> > > packages right and so maintain your build reproducible, buildroot will
> > > work as before.
> >
> > So you are, like I am, in fact arguing that we should have actual packages
> > for such external modules? ;-)
> 
> I can't see any value on having hundreds of npm packages probably
> outdated at wich you should add hundreds of php composer packages, go
> modules, cargo packages and so on.

Why not? We do have hundreds (~270, which literaly makes that number
'hundreds') of python packages, some (a lot?) of them probably outdated.

Worse, yet: we *do* have thousands of packages, a lot of them outdated.

I don't see why we would single out npm packages at all.

(Besides the fact that I don't like them; I don't like perl either, but
I'm still quite happy to see perl packages.)

> >> > As soon you use a package manager tainting will be
> > > signaled.
> >
> > This is where I disagree.
> >
> > Using such package managers does not imply that the build is tainted.
> > This is a false dichotomy.
> 
> Probably it is but my experience says not,

And in my experience, it can be.

If you are using an internal repository of which you control the
content, then the list of nodejs modules *is* reproducible. This is
not a theoretical situation, by the way; this is a real situation.

Your heursitic is indeed not a heuristic, but a policy. Your policy
states "any external module taints the build". My policy states "use
our internal repository of trusted and known modules, anything else
taints the build".

So, the code currently expreses your policy, and precludes using mine,
which I believe is still superior because I do not even rely on external
data which may disapear at the whim of an external entity; everything I
need is already internal and stable.

> anyway, if you are dealing
> with a complex php software for example you can:
> * call php composer manually on the modules you are sure being
> reproducible in your .mk and live happy

I have no idea what php-composer is. I guess it would download and
install php files, not unlike npm does, and probably looks as ugly as
npm.

> * use the package host-composer distributed with buildroot asking it
> to do a "composer install" living with the fact that it could do
> anything and you build will be tainted.
>
> > > Taint is mean to signal that there is a potential problem, and if you
> > > don't want to slip into it, you can always do the right thing and
> > > package your software and packaging also it's dependencies.
> >
> > And what I am saying is that the heuristic you suggest to decide whether
> > a build should be considered tainted or not is incorrect.
> 
> It's not an heuristic, it's a rule: you ask to a package manager to
> resolve your dependencies, your build _could_ be tainted. You want to
> be sure: you write your own rule.

So, because the build _could_ be tainted, you want to make all builds as
tainted? That's insane...

> If you write a clean mk that does everything right you shouldn't add
> FOO_TAINTS, that's it.
> 
> I can agree with you that some packages could be considered first
> class citizens, the others based on package managers could not be as
> good as first ones. But at least, you give the tools to developers who
> wants to add a non trivial web package or similar to buildroot.

Well, the tainted stuff is basically orthogonal to the package manager
stuff, I think. Even if I despise the package managers, I can see that
people are so keen on using them...

What I am arguing in this thread, is that the tainted status can *not*
be deduced from the configuratioe tainted stuff is basically orthogonal
to the package manager stuff, I think. Even if I despise the package
managers, I can see that people are so keen on using them...

What I am arguing in this thread, is that the tainted status can *not*
be deduced from the configuration. The way you are currently coding the
tainted flag would break for the people that are already doing it right,
and for whom this tainted flag would ultimately prove to be the most
valuable.

Regards,
Yann E. MORIN.

> What I'm saying here is that we don't have such a rule we simply
> cannot add any time soon any software based on package managers.
> 
> Probably there is some other smarter way to do it that I cannot see ...
> 
> I'm open to suggestions!
> 
> >
> > > As soon as you do this, the taint disappear. I thin it could even be a
> > > deterrent to package the software randomly!
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
