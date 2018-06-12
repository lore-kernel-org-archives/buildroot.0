From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jun 2018 21:01:24 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
Message-ID: <20180612210124.18e1f168@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jun 2018 21:07:35 +0300, Stefan Becker wrote:

> I didn't want to write anything to this thread at first, but then I
> saw that what Trent wrote matches 100% what I was thinking when
> looking at the change.
> 
> I'm very disappointed with the attitude displayed by the buildroot
> developers in this thread.

I believe you are also very abrupt with this statement. For example, I
myself asked as a reply to Yann's proposal if there wasn't a backward
compatibility issue.

> Trent has valid points and IMHO has made
> sensible suggestions how to address those. But all I see from the
> project developers is the typical knee-jerk reaction to SW build or SW
> integration issues, i.e. "buildroot is always correct, your system is
> doing it wrong".
> 
> Can we please all take a step backward and agree that there is a whole
> universe outside buildroot with different (integration) requirements?

For the record, I am using Buildroot for toolchains.bootlin.com, which
is running Buildroot in a CI system to produce toolchains, and it uses
"make sdk". So I am also affected by behavior changes in "make sdk".

> For the change under review I would suggest:
> 
> (A) there are existing users of the "sdk" target and this change would
> modify its behaviour in an undesired/surprising fashion.
> 
> (B) instead this change should introduce e.g. the target
> "sdk-tarball", which depends on "sdk" and generates the new tarball
> format. It is then up to the users of "sdk" to decide if they can use
> the new build artifact or not.

As said above, when I first looked at Yann's proposal, I thought there
could be a backward compatibility problem. But in fact, what the new
"make sdk" does is a strict super-set of what the old "make sdk" was
doing. So if you're not happy with the new "make sdk" behavior, this
shouldn't really matter: it still does the exact same thing as before,
it just *additionally* provides a convenience tarball.

However, one could argue that despite the behavior being preserved, it
still changes a few things:

 - More time required due to generating the tarball.

 - More disk space being consumed, especially with the tarball name
   changing pretty frequently due to containing the Git commit id.

> (C) having a build artefact that changes the name in every build is
> bad for automatic build setups.

True.

> So (B) must offer a way for automatic
> build scripts to set the generated tarball name. If the user can use
> the new tarball format in his integration, then he can switch from
> "sdk" to "sdk-tarball" with the existing name (and possibly using
> --strip-components in downstream build scripts).

But where did we say that we would not accept something that allows to
customize the output tarball name ? Where did we say that using a
separate target was not acceptable ?

I think you're really rushing way too fast to a conclusion that we're
not listening. Yes, we are asking questions about the use cases, yes we
are trying to understand such use cases, and see how they fit in the
big picture.

I believe one of the reason we all like and use Buildroot is because of
its simplicity. And simplicity is a very difficult thing to preserve:
the tendency of all projects is to become more and more complicated, to
address more and more special use cases. So it is quite normal that we
question the use cases, try to understand them, and see which part of
those use cases should be solved by Buildroot itself, and which use
cases should be solved by external tooling. There is always going to be
a tension between people wanted to solve more use cases inside
Buildroot and therefore increasing its complexity, and the wish to keep
Buildroot simple.

Let's try to keep the discussion open-minded, please :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
