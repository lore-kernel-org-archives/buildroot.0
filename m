From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 15:22:10 +0100
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <7bb98b03-837a-2494-3de0-b8267a8b7d56@mind.be>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-4-vadim4j@gmail.com>
 <20190327195409.14931f34@windsurf>
 <7bb98b03-837a-2494-3de0-b8267a8b7d56@mind.be>
Message-ID: <20190328152210.2bc05d0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Mar 2019 21:35:51 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  So, I've taken a quick look at all the finalize hooks we have, and there's
> nothing that jumps out as "this you really want to do before the
> overlay/post-build". I'm not sure though how it would interfere with the other
> (non-hook) finalizations we're doing (i.e. removing static libs etc.). Every
> hook would need to be reviewed in detail to be sure it's OK.
> 
>  If such a review is done, I wouldn't mind moving the hooks after the
> overlay/post-build. I've checked the history, and I think the order of things is
> mostly accidental. When post-build script was introduced (commit eed7d8737ad) it
> was put at the end of target-finalize, without specific explanation. However, at
> that time, purgelocales was still done after target-finalize (now it has moved
> to a TARGET_FINALIZE_HOOK so it's done in the beginning). So I think there was
> no real consideration at the time. When the overlay was added, it was put just
> before the post-build script, which makes sense. And around that time,
> everything had moved before the post-build script, so when the
> TARGET_FINALIZE_HOOKS were introduced it made sense to keep that before the
> post-build script as well.

I agree that the order of the steps is definitely not the result of a
lot of thinking, but is mostly accidental.

>  We do have to take into account, however, that this may break existing
> overlays/post-build scripts in surprising ways... So it should definitely be
> mentioned in the release notes!

Indeed, and that makes the change potentially a bit annoying :/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
