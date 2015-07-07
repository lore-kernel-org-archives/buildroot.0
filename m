From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 23:01:22 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: allow programs to be
 disabled by default
In-Reply-To: <CANxTyt49pXMfZpaH9G6esm1esVM5KWimxp7TcgWDKw4kAmTUQw@mail.gmail.com>
References: <1435635368-26928-1-git-send-email-danomimanchego123@gmail.com>
 <20150630225915.6838f4f2@free-electrons.com>
 <CANxTyt49pXMfZpaH9G6esm1esVM5KWimxp7TcgWDKw4kAmTUQw@mail.gmail.com>
Message-ID: <559C3E22.5090008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/30/15 23:35, Danomi Manchego wrote:
> Thomas,
> 
> On Tue, Jun 30, 2015 at 4:59 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Danomi Manchego,
>>
>> On Mon, 29 Jun 2015 23:36:08 -0400, Danomi Manchego wrote:
>>
>>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_DISABLE_BY_DEFAULT),y)
>>> +UTIL_LINUX_CONF_OPTS += --disable-all-programs
>>> +endif
>>
>> I understand the idea, but it's a bit weird to have an option to enable
>> to say that you want to disable everything.
>>
>> Also, we are already passing --disable-all-programs when
>> BR2_PACKAGE_UTIL_LINUX_BINARIES is not enabled. Maybe we should instead
>> pass --disable-all-programs unconditionally. However this would change
>> the visible behavior for users, since programs that used to be built
>> would no longer be built. But it seems the most correct solution
>> nonetheless.
>>
>> Any opinions from other Buildroot developers?
> 
> I use util-linux only as a last resort for when busybox does not have
> what I need - so I'm totally on-board with that idea, as my interest
> is for minimal impact on the target.  The only reason that I didn't do
> that is for precisely what you said - that it would change the current
> behavior.  Also, I supposed that we would still need an option to
> *not* set --disable-all-programs anyway, to support enabling all the
> programs that are currently enabled by default (and don't have
> existing buildroot switches), to be able to get back to the previous
> behavior.  (For those who need it.)

 I think it should be --disable-all-programs by default, and a new
BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES that does --enable-all-programs and that
hides all the individual tool options.

 I'm also not really worried about changing the default, since it will affect
only a single program (see below).

> An alternative might be to add --enable/--disable switches for all the
> apps that are enabled by default.  But that's a lot of new switches,
> and a maintenance hassle on package upgrades, so I was afraid that
> this option might not be well received by the community.  (I'm willing
> to give that a go if that seems like a good idea.)

 Indeed, too much hassle.

 However, unless I'm mistaken, pg is the only one missing at the moment... All
the other configure options seem to be covered, and Makefile.in has a condition
in front of each installed program. So it doesn't look like so much of a hassle
after all.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
