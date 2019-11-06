From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Nov 2019 23:36:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: make adding 'sudo'
 group+rule optional
In-Reply-To: <20191105224229.20488-1-stephan@asklandd.dk>
References: <20191105224229.20488-1-stephan@asklandd.dk>
Message-ID: <20191106233658.305cd426@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stephan,

Thanks for your patch!

On Tue,  5 Nov 2019 23:42:29 +0100
Stephan Henningsen <stephan@asklandd.dk> wrote:

> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> I have concerns about the change that was made to my original patch;
> Instead of having the 'sudo' group and sudoers rule enabled by the user
> manually and thereby giving her concent, a change was made to apply the
> option silently.
> 
> While I do understand that making this all default will make the user
> experience a bit smoother, I fear that this won't be the case for
> everyone.
> 
> My motivations for making it an option to begin with (and for this
> follow-up patch) are the following:
> 
> 1) Not everyone may be interested in the added rule to /etc/sudoers; it
> may even conflict with a custom rule. For example if a custom rule was
> added that does not prompt for user password, then the newly added rule,
> which does prompt for user password, maybe break automated cronjobs that
> rely on sudo for elevated priviledges without a password prompt.
> 
> 2) Adding this group and rule is only one of many use-cases of the sudo
> package; some people may prefer adding custom rules that only allow
> certain well-known users (e.g. alice, bob) or certain system groups
> (e.g. wheel, daemon) to become root.  These users may have to manually
> revert the changes now done to their /etc/sudoers.
> 
> 3) If only a little, this addition adds to the size of the system's
> attack surface, potentially inadvertently allowing users to become root.
> 
> 4) Not everyone may be interested in the added non-standard system group
> 'sudo'; they may even have to manually revert the changes now done to
> their /etc/groups to trim it.
> 
> 5) We're chaning default behavior of a security-critical package that may
> affect systems that have run in production of years.
> 
> Most of this is just speculation, of course.  But the fact remains that
> the default behavior of a package that deals with elevating user
> priviledges has been changed, and for no real reason at all.  "If it ain't
> broke, don't fix it" certain seems fitting, I think.

We can't provide options for every bit of system configuration. Having
a sudo group, configured by default so that the users in this group can
use sudo, seems like a sensible default. Buildroot has traditionally
had a policy of: let's have sensible/basic defaults for the configuration of
most packages, and leave it up to the user to further customize such defaults.

Here, it is pretty trivial to override the sudoers file with its own
version in a rootfs-overlay, and also trivial to remove the sudo group
from /etc/group in a post-build script if really needed.

So overall, I agree with the change Yann did to simply make the sudo
group and sudoers unconditional.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
