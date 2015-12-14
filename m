From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Dec 2015 01:08:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] postgresql: add an option to build
 the server
In-Reply-To: <20151213233707.3f62c2a6@free-electrons.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
 <1445575419-8267-1-git-send-email-mathstuf@gmail.com>
 <20151213233707.3f62c2a6@free-electrons.com>
Message-ID: <566E0877.7010006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 23:37, Thomas Petazzoni wrote:
> Ben,
> 
> On Fri, 23 Oct 2015 00:43:39 -0400, Ben Boeckel wrote:
>> > Unfortunately, postgresql upstream doesn't have a configure option for
>> > this. Instead, to get bits of the build, compiling and installing
>> > different subdirectories is the preferred way.
>> > 
>> > The directories come from those used in the FreeBSD port.
>> > 
>> > Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> Sorry for the slow response. I finally had a closer look at this
> tonight. I'm adding in Cc Yann, Arnout and Peter to get their feedback
> on this, which is why I'm going to keep the entire patch below.
> 
> If I understand correctly, the current postgresql package is building
> both the client and server parts unconditionally, and the purpose of
> your patch is to make each of them conditional.
> 
> I am wondering if it is really worth the effort trying to build the
> relevant directories in each case. The build phase of postgresql (in
> the current package, building both client and server) takes 77 seconds
> on my machine, which is not that long.
> 
> Since this logic that consists in filtering which directory needs to be
> built or not is very likely to break/change when upgrading the
> PostgreSQL package version, I would personally be in favor of always
> building the whole thing, and then have a post-install hook that
> removes the useless files.

 I agree that it is fragile. However, it will be needed anyway. With the current
approach, it would still be needed in the _INSTALL_CMDS. Or if you'd take the
approach to remove unnecessary stuff post-build, you'd need a list of things to
remove.

 So given that there is anyway a list of things that has to be maintained, using
that list in the build step as well is OK for me. The only additional complexity
is the fmgroids.h thingy.

> If you really want to save the build time, then I would suggest to work
> with the PostgreSQL upstream developers to get configure options to do
> this.

 That, of course, would be the preferred option.

 Regards,
 Arnout


> 
> Peter, Yann, Arnout, what do you think? See below for the full patch.
> 
> Thanks!


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
