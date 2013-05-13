From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 14:22:08 -0300
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
	CFLAGS
In-Reply-To: <20130513191016.15f0a3f4@skate>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <20130513191016.15f0a3f4@skate>
Message-ID: <51912140.8030901@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/2013 02:10 PM, Thomas Petazzoni wrote:

> Do we have packages that pass TARGET_CFLAGS and/or HOST_CFLAGS, and are
> not passing TARGET_CPPFLAGS / HOST_CPPFLAGS ?
> 
> One example: the bsdiff package:
> 
> define BSDIFF_BUILD_CMDS
>         $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
>                 $(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
>         $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
>                 $(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
> endef
> 
> After your patch, the -D_LARGEFILE_BLABLA stuff is no longer passed
> when building this package.
> 
> Another example, the feh package. Another one, input-tools. And I'm
> sure there are more.
> 
> So, I agree with the change, but I think it needs a much thorough
> investigation of which packages are using $(TARGET_CFLAGS) without
> passing $(TARGET_CPPFLAGS).

On the build-side of things there aren't any unexpected build failures
(allyespackageconfig that lead to my latest fixes because of other issues).
This is meant as a first try and i'm sure there will be packages that'll
need to be modified, but we'd rather do this sooner rather than later,
specially if we want to push new autotools where -D* isn't acceptable in
CFLAGS (be it via auto* bump + autoreconf or just plain shipped
configure in packages based on newer autotools).
We could also filter out for "strict" (new auto* packages) too, but
that's a sloppy way downhill.
I just want to keep this patchset apart from the package-fixing one,
since it's likely this won't change much and i'm not a fan of 1/N with N
being a huge number just to add a few patchfixes here/there (with the
fix patches maybe even getting commited before this patchset - it
shouldn't hurt).
Regards.
