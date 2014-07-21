From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:15:55 +0200
Subject: [Buildroot] issues without busybox
In-Reply-To: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
Message-ID: <20140721221555.72df12ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles,

On Mon, 21 Jul 2014 12:57:50 -0700, Gilles wrote:

> Buildroot is a fantastic effort for small footprint devices. However,
> in my case - where I'd rather have something a bit more SystemV like
> with MMU, no busybox, a lot of things are broken.
> 
> Just naming a few I recently fixed to get past some issues:
> 
> - init network script S40network which tries to use ifup/ifdown only
> provided in ifupdown package not included.
> - S45connman sript (if used) which relies on start-stop-daemon only
> provided with dpkg.
> 
> I understand that dependencies quickly add up to a nightmare and I
> for one would agree that it should be left up to the user of
> buildroot to figure them out.
> 
> What is the buildroot community feeling about this subject? I
> understand that the main focus is on busybox, is there a group of
> people interested in the non-busybox approach? I would be willing to
> contribute, after all, I have to do this work right now to get me up
> and going. This might benefit other people.

Thanks a lot for reporting those issues. Patches are definitely welcome
to fix this.

I believe one direction we should potentially investigate is to have
one common skeleton for the base stuff, and then separate additional
skeletons for busybox init, sysv init and systemd init.

Regarding the specific issues you're raising here, I'm not exactly sure
how to solve them:

 * For the network, we could make sysvinit depend on ifupdown, but this
   sounds a bit strong. Then it would mean that we should make the init
   script installation conditional. Or maybe installed just by ifupdown
   on one side, and busybox on the other side?

 * Regarding start-stop-daemon, I believe all (most?) our init scripts
   rely on start-stop-daemon. So I'm not sure how to handle that...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
