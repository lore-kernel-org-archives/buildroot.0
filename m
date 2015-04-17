From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 17:49:21 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <552D6D9B.2000301@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <552D6D9B.2000301@mind.be>
Message-ID: <20150417174921.53314244@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Apr 2015 21:42:19 +0200, Arnout Vandecappelle wrote:

>  Well, actually, source-check is a noconfig target because we don't need to read
> the .config file to be able to run it. Moving it out of noconfig almost doubles
> the runtime, because now both the first level and the second level make have to
> parse all the makefiles.
> 
>  So the real reason to do this is not because it was wrong (just a little weird
> and missing explanation), but because you need it for three patches later.
> 
>  That said, the change itself looks OK, so
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Aaah, yes, good catch. make source-check recursively calls into make by
calling make source. So the make invocation executing 'source-check'
does not need the config file, so a noconfig target is OK. However, the
sub-make invocation that executes the 'source' target does need the
config file.

I think the most correct option here is to squash this change with the
change actually modifying the source-check implementation to use the
package infrastructure, because as you say it's really why we need
source-check to be outside of the noconfig target thing.

Which makes me think that 'external-deps' could also be a noconfig
target, while _external-deps would need to remain a normal target. But
I'm not sure it's really worth the effort and additional "weirdness" of
the code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
