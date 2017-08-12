From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 18:00:43 +0200
Subject: [Buildroot] [PATCH] util-linux: Revert genrandom(2) logic
In-Reply-To: <1502506894-64344-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1502506894-64344-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <f2b0d935-279c-3d35-efda-71cbfebb2ed8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-17 05:01, Matt Weber wrote:
> New logic was added at configure time and new conditional code
> in lib/randutils.c between versions 2.29.2 and >= 2.30.  The logic
> determines if the glibc or syscall API should be used for
> rand calls.  This has been observed causing issues in a
> configuration of a 4.1 kernel and glibc2.25.  A tool like
> parted when used at boot hangs for ~40x the time and when
> debugged with gdb shows blocking on genrandom, even though
                                      getrandom

> a entropy check from a hardware rng used by rngd is adequate
> before the parted tool is used.
> 
> Bug tracker:
> https://github.com/karelzak/util-linux/issues/496
> 
> Upstream reverted commits
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=b192dd6943e5bb5d2a3773b2c9b06cbd4eb28258
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=cc01c2dca4f62e36505570d5cb15f868aa44bf54
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 To be honest, I don't think we want this in Buildroot. It's rather a feature
patch, and it is absolutely not upstreamable in its current form. Also, you can
easily keep these patches in your BR2_GLOBAL_PATCH_DIR

> --
> 
> I haven't completely root caused this issue but figured I'd
> get it out there while we investigate further.  It was
> disected down to these changes but further investigation
> is limited on my project and we're going to carry this workaround.
> 
> Debug notes:
> We did notice that if we straced the parted tool and let all that
> output hit console it didn't block and take the complete 40sec to
> return.  So our theory was that entropy was created via the uart
> output.  We also noticed similar if we enabled networking that
> the tool would return much faster.  So we wondered if these commits
> are actually using a API that doesn't leverage a hardware rng
> output as ours was setup with a value of ~3000 when we checked
> the entropy quality.

 I believe that the hardware RNG is only used to initialize the entropy pool,
but doesn't actually add to the entropy count. To actually add entropy I think
you need a userspace tool that does the RNDADDENTROPY ioctl on /dev/urandom. But
I thought rngd did exactly that...

 Regards,
 Arnout

> Any thoughts on comparable packages which
> would use a similar approach to using this new API?

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
