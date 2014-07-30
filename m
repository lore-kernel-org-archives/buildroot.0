From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 01:11:54 +0200
Subject: [Buildroot] lua interpreter choice?
In-Reply-To: <CANxTyt6GCC6K1NPyCGf9rHrO6T0o+y7K+PAioWKdRPZysDbhcA@mail.gmail.com>
References: <CANxTyt6-4j70z297t4VsaqKGosnTdWarc5fBVa3vVORmXnWMFQ@mail.gmail.com>
 <CAB0FRst5RNAYTMa_jVxGoRYS-GjO3jdc05CNkuK9kAdLXgKM2Q@mail.gmail.com>
 <CANxTyt6mPjEmSdOtNAxqQ=eyfC74qBiFNmFmyhju0aUtqsrHNQ@mail.gmail.com>
 <20140730234037.19f851da@free-electrons.com>
 <CANxTyt6GCC6K1NPyCGf9rHrO6T0o+y7K+PAioWKdRPZysDbhcA@mail.gmail.com>
Message-ID: <20140730231154.GC3961@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-07-30 18:34 -0400, Danomi Manchego spake thusly:
> On Wed, Jul 30, 2014 at 5:40 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Danomi Manchego,
> >
> > On Wed, 30 Jul 2014 14:51:49 -0400, Danomi Manchego wrote:
> >
> >> > this change in the virtual-package behavior was introduced by
> >> > http://git.buildroot.net/buildroot/commit/?id=91169d3346e543be18139e18bdcc52a2345e0d16
> >> > (infra/pkg-virtual: validate only one provider provides an implementation)
> >> >
> >> > Fran?ois
> >>
> >> But the menuconfig still lets you select both packages, instead of
> >> providing a choice of one or the other (like "jpeg support").  Is this
> >> not undesirable?
> >
> > We discussed this before doing the commit pointed by Fran?ois.
> > Unfortunately, there's no good solution to solve this problem at the
> > kconfig level. The only solution would be to have each package being a
> > provider of a certain virtual package, have the knowledge of *all*
> > providers of that virtual packages to do a "depends
> > on !BR2_PACKAGE_<foo>". While for lua vs. luajit this seems more or
> > less reasonable, as we probably don't expect to have more providers
> > than just lua and luajit, but in the general case, we have things like
> > libgles or egl (for OpenGL support) which have multiple providers, and
> > we don't want to have to edit all of them whenever we add a new
> > provider.
> >
> > Not speaking about packages in BR2_EXTERNAL, which we cannot control.
> >
> > So our decision was to use a build-time check rather than a
> > kconfig-time check.
> >
> > Hope this clarifies the situation,
> 
> Let me apologize in advance if I'm still missing something obvious but

No problem. WE also stumbled on this issue.

> - what distinguishes the lua/luajit case from the libjpeg/jpeg-turbo
> case, or the systemd/eudev case?  Is the virtual-package
> infrastructure + kconfig choice not suitable here?

It all relates to packages in br2-external. See:
    http://nightly.buildroot.org/#outside-br-custom

Let's take an example: libEGL. libEGL is a virtual package that can be
provided by a few pacakges in Buildroot. So we, as the Buildroot
community, have the knowledge of our providers. We could technically
make a choice to select the appropriate provider, yes.

However, libEGL can also be provided by packages in BR2_EXTERNAL. For
example, there are a lot of boards with proprietary, non-public
implementations of libEGL.

ow, since we do not have the knowledge of those packages, we can't add
them to the choice. And we can't have a "dynamic" choice either.

So, for those kind of packages, we can not do better than to do a
build-time test, that the configuration is consistent.

As for lua, now. I can see your point that the two could be used at the
same time on the target. I don't see how we could solve this easily
(well, I have a very slight idea, but it's ugly.)

However, I can think that there are alternative (aka non-public,
proprietary) implementations of Lua, too, that could be used in
BR2_EXTERNAL. So, we can not offer a choice for that either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
