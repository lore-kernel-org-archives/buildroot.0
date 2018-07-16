From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Jul 2018 18:15:31 +0200
Subject: [Buildroot] [PATCH 4/5] support/docker: add an Arch image
In-Reply-To: <CAFGQKxfOSY5-eaNrYpuegD8X6CF6shbdZzusY1E8fWUvJcFm4w@mail.gmail.com>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
 <b909713a26b89db6eae65efffa7e05a8136fd9df.1531463897.git.yann.morin.1998@free.fr>
 <CAFGQKxd62h=khKBwP7RwM1uVsAQybHJVjuxNHfPfmaq3Re83gw@mail.gmail.com>
 <F34B3E21-3366-44DD-891B-401FF71F20E9@free.fr>
 <20180715090539.GA2516@scaer>
 <CAFGQKxe5qQQm=k+CXipjS8U0eJ3nxFB20xJ0QYSMRDbqb1sOPg@mail.gmail.com>
 <20180715194549.GG2516@scaer>
 <CAFGQKxfOSY5-eaNrYpuegD8X6CF6shbdZzusY1E8fWUvJcFm4w@mail.gmail.com>
Message-ID: <20180716161531.GA5141@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2018-07-16 01:13 +0100, Martin Bark spake thusly:
> On 15 July 2018 at 20:45, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-07-15 20:30 +0100, Martin Bark spake thusly:
> >> On 15 July 2018 at 10:05, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> >> > So, the reasoning is that, since we use a pinned version of the
> >> > repository, running "pacman -Sy --noconfirm" will always yield the same
> >> > state of the distribution.
> >> >
> >> > Now, it happens that we need to add a new package to the image, e.g. for
> >> > local testing. We can thus re-use the intermediate, locally-cached image
> >> > that has the local repository updated.
> >> >
> >> > It kinda speeds up things a bit.
[--SNIP--]
> hey! here's how you can make it reproducible

Wee! :-)

> 1) build the alpine docker image.
> 2) mkdir -p support/docker/alpine_snapshot
> 3) docker run -it --rm -v
> $PWD/support/docker/alpine_snapshot:/snapshot -u root
> buildroot/alpine-3.7:$BR2_DOCKER_VERSION bash
> 4) inside the container run
> 
> mkdir -p /var/cache/apk
> ln -s /var/cache/apk /etc/apk/cache
> apk cache sync
> cp -a /etc/apk/cache/*.apk /snapshot
> exit
> 
> 7) sudo chown -R $(id -u):$(id -g) support/docker/alpine_snapshot
> 6) edit the Dockerfile so it looks like this
> 
> COPY ./alpine_snapshot /snapshot
> RUN apk add /snapshot/*.apk
> 
> 7) build the alpine docker image again.  it will build using the apk
> files from /snapshot directory we just created
> 
> This is not ideal but it's a proof of concept.  To improve you could
> copy the apk to a website, setup it up as a proper signed package
> repository and then edit /etc/apk/repositories to use this snapshot

Wooo... Scary...

OK, I'll give it a try.

Thanks you for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
