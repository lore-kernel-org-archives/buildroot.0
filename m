From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 22:43:18 +0100
Subject: [Buildroot] [PATCH] xlib_libX11: fix compilation of makekeys
In-Reply-To: <20121108201326.2676f417@skate>
References: <1352028606-11338-1-git-send-email-arnout@mind.be>
 <20121108201326.2676f417@skate>
Message-ID: <509C2776.2060706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/12 20:13, Thomas Petazzoni wrote:
> Arnout,
>
> On Sun,  4 Nov 2012 12:30:06 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> xlib_libX11 builds a makekeys executable for the host, but uses the
>> targets X11_CFLAGS. This leads to build failures like
>> http://autobuild.buildroot.net/results/411eb3aefea859a7e31986a44acd50b475f174cb/
>>
>> This problem was introduced by the version bump, because then also
>> the AUTORECONF was removed so the existing fix didn't work anymore.
>>
>> As a slightly cleaner solution, just remove X11_CFLAGS from the
>> Makefile.  We know we don't need it, because the X11 stuff is in
>> $(HOST_DIR)/usr/include which is already in HOST_CFLAGS.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>
> Hasn't this broken the xlib-x11 build? See
> http://autobuild.buildroot.org/results/6a5a16f901215acca06cb7a89f7d7fb0bc1741af/build-end.log.
>
> It is including a host header (Xos.h) which itself includes target
> headers. Sounds really wrong.

  Indeed, and this patch fixes that.  It's a different symptom of the same
error: makekeys is a host binary, but it's built with target CFLAGS
(X11_CFLAGS = -I$(STAGING_DIR)/usr/include).  This will barf in surprising
ways.

  (That is, unless you have an autobuilder that runs against a git tree that
has already integrated this patch; if that is the case, then I made a
mistake somewhere.)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
