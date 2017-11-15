From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Nov 2017 23:08:54 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: add 1.8.3 version
In-Reply-To: <cc34ba6a-323c-0559-4c11-358cea497f19@mind.be>
References: <20171114193821.25188-1-fontaine.fabrice@gmail.com>
 <20171115134342.60226366@windsurf.lan>
 <CAPi7W81AhUJjdFm5F-7MJmKQ3XVO8FtHFU5NoR+hGrWvBSSSuw@mail.gmail.com>
 <20171115222257.10defebb@windsurf.lan>
 <cc34ba6a-323c-0559-4c11-358cea497f19@mind.be>
Message-ID: <CAPi7W81j7c1uTi_hp-vA1=hbU8djFA+wuaPkxdFPZYpyRaFBwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

2017-11-15 22:32 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 15-11-17 22:22, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Wed, 15 Nov 2017 22:04:10 +0100, Fabrice Fontaine wrote:
> >
> >>>> +choice
> >>>> +     prompt "libupnp version"
> >>>> +     default BR2_PACKAGE_LIBUPNP_1_6
> >>>> +     help
> >>>> +       Select the version of libupnp API you wish to use.
> >>>> +
> >>>> +config BR2_PACKAGE_LIBUPNP_1_6
> >>>> +     bool "libupnp 1.6.x"
> >>>> +
> >>>> +config BR2_PACKAGE_LIBUPNP_1_8
> >>>> +     bool "libupnp 1.8.x"
> >>>> +
> >>>> +endchoice
> >>>
> >>> I believe we should perhaps instead add a separate libupnp18 package,
> >>> all those "depends on" to decide which package should be visible
> >>> depending on the version of libupnp that is currently selected are a
> >>> bit annoying. But don't rewrite your patch right now: wait for other
> >>> Buildroot developers to give their opinion on this matter.
> >>>
> >>> Is it possible to install both libupnp 1.6 and libupnp 1.8 in the same
> >>> system without any conflict ?
> >>>
> >> Unfortunately no, it was possible in 1.8.0 and 1.8.1 but we had to
> rollback
> >> due to the vlc developer who wasn't happy with this change:
> >> https://github.com/mrjimenez/pupnp/commit/
> 07f504c61bd9e4d93eb3d373ffc852
> >> 7cafe0b9af
> >
> > OK, the reasoning makes sense.
> >
> > What is the transition plan ? Will the different Buildroot packages that
> > use the 1.6 version be upgraded to use 1.8 at some point in the
> > reasonably near future ? Or will we have to keep both versions forever ?
>
The transition plan is not very clear, 1.8.x is a major change to libupnp,
parameters can't be retrieved/updated through pointers anymore, the
applications have to use getter/setter functions. Moreover, internal APIs,
such as threadutil is no more public anymore. So, this could be a massive
rework for applications and some of them are not very active anymore.

> >
> > Peter, Arnout, what are your thoughts on how to handle this?
>
Personally, I prefer your suggestion of creating a libupnp18 package if
this is the standard way of handling this in buildroot.

>
>  For libraries that change API, we've almost always created a new package,
> and
> sometimes they are not side-by-side installable. Python3 is a great
> example, but
> also e.g. opencv3.
>
>  So I agree it should be a new package libupnp18 that depends on
> !BR2_PACKAGE_LIBUPNP and where that dependency has to be propagated to
> gerbera.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171115/1dc44a8f/attachment.html>
