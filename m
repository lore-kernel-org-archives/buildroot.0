From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:01:38 +0200
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
In-Reply-To: <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
References: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
 <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
Message-ID: <20161024230138.398810a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Oct 2016 01:20:56 +0200, Arnout Vandecappelle wrote:

> > Changing the symlink to "../../tmp" rather than "/tmp" references the
> > target's /tmp directory rather than the build machine's /tmp directory.  
> 
>  The problem is that /var/lib itself may be a symlink to somewhere else. Some
> people need to have /var/lib in a writeable partition while /var itself is on
> the readonly rootfs. When /var/lib is a symlink, the ../.. will be interpreted
> relative to the target of that symlink, which may be a different number of
> levels down from root.
> 
>  Also, since /tmp always exists on the build machine, symlinking to /tmp just works.

Note that the skeleton already installs /var/lib/misc -> ../../tmp

However, since this is part of the skeleton, one can assume that those
folks who replace /var/lib with a symlink will adapt the skeleton
accordingly (by using their own custom skeleton).

However, there's one thing I'm not entirely happy with with the
current /var/lib -> /tmp symlink. It means that the Buildroot build
will potentially install random stuff in /tmp. This doesn't seem really
nice.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
