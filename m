From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jun 2018 18:11:15 +0200
Subject: [Buildroot] [PATCH 2/5] support/docker: sort the list of
 installed packages
In-Reply-To: <5b147817c2d6_4a712ad8ec78fccc8903e@ultri5.mail>
References: <49308956156142d6dab6b7917fcd8429f155ffa5.1528016895.git.yann.morin.1998@free.fr>
 <5b147817c2d6_4a712ad8ec78fccc8903e@ultri5.mail>
Message-ID: <20180604161115.GD3700@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-06-03 20:21 -0300, Ricardo Martincoski spake thusly:
> Nit: you forgot to use -v2 with format-patch.

Yeah. I renamed the branch locally before re-pushing, and in doing so I
lost the metadata associated with the old one, so the iteration version
got lost...

> On Sun, Jun 03, 2018 at 06:08 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> > index 8c525f7cf1..fe9e643a34 100644
> > --- a/support/docker/Dockerfile
> > +++ b/support/docker/Dockerfile
> > @@ -22,13 +22,29 @@ COPY apt-sources.list /etc/apt/sources.list
> >  RUN dpkg --add-architecture i386 && \
> >      apt-get update -y
> >  RUN apt-get install -y --no-install-recommends \
> > -        build-essential cmake libc6:i386 g++-multilib \
> 
> I missed that when reviewing the first iteration...
> 
> > -        bc ca-certificates file locales rsync \
> > -        cvs bzr git mercurial subversion wget \
> > -        cpio unzip \
> > +        bc \
> > +        build-essential \
> > +        bzr \
> > +        ca-certificates \
> 
> 'cmake' was removed by mistake.

Sag mir wo, das cmake ist; wo ist es geblieben?
Sag mir wo, das cmake ist; was ist geschehen?

> Obviously, since host-cmake will be built when needed, it should not make any
> current or upcoming test case to fail. I actually tested with the current test
> cases (still running while I write this):
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/23112714
> I didn't checked if any current test case is already requiring cmake.
> 
> But removing cmake will make any test case that needs it to take longer to run,
> as the version seems suitable to be used:
> 
> br-user at b976f947b114:~$ cmake --version
> cmake version 3.7.2
> 
> The build of host-cmake is probably already covered by the autobuilders.
> And if we want to have a test case in the test infra for this the best way IMO
> is to write a specific test for it.

Nah, this is definitely an oversight on my side; we want to keep cmake
installed in the distro.

And even if did not (but we do!), this should be a separate patch anyway.

> > +        cpio \
> > +        cvs \
> > +        file \
> > +        g++-multilib \
> > +        git \
> > +        libc6:i386 \
> >          libncurses5-dev \
> > -        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
> > -        python-pip && \
> > +        locales \
> > +        mercurial \
> > +        python-nose2 \
> > +        python-pexpect \
> > +        python-pip \
> > +        qemu-system-arm \
> > +        qemu-system-x86 \
> > +        rsync \
> > +        subversion \
> > +        unzip \
> > +        wget \
> > +        && \
> >      apt-get -y autoremove && \
> >      apt-get -y clean
> >  
> > -- 
> > 2.14.1
> 
> [I am not against using && in a separate line as we discussed in
>  http://lists.busybox.net/pipermail/buildroot/2018-June/222901.html .

Yeah... I haven't found a better solution, except moving the && at the
begining of the next line, in which case we'd have to do it everywhere
else...

>  With cmake added back to the list please add]
>  Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
