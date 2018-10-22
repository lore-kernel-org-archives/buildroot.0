From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 22 Oct 2018 18:31:11 +0000
Subject: [Buildroot] [PATCH] systemd: Allow building with no init system
In-Reply-To: <9ddf2016-0a94-d873-311a-e1565386801e@mind.be>
References: <20180917182900.15902-1-tpiepho@impinj.com>
 <9ddf2016-0a94-d873-311a-e1565386801e@mind.be>
Message-ID: <1540233070.30311.32.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-10-21 at 18:28 +0100, Arnout Vandecappelle wrote:
> On 17/09/2018 19:29, Trent Piepho wrote:
> > It's possible to build systemd, and use the systemd libraries, on a
> > target with no init system.
> > 
> > While installing systemd when trying to use SysV init will result in
> > systemd clobbering the SysV system and vice versa, it may well work when
> > no init system has been selected.  For instance, when building an SDK
> > the sytemd headers and libraries might be necessary but there is no
> > reason to have an init system selected.  Someone creating a custom init
> > system might also want some of the systemd libraries.
> 
>  I understand your reasoning and I tend to agree to some extent.
> 
>  However, for the use cases you mention, you can actually just enable
> BR2_INIT_SYSTEMD. If you really don't want /sbin/init in your target, just
> remove it post-build.

You get /usr/sbin/init either way.  What I was trying to do was to stop
building target dbus plus dependencies for an SDK.  But this doesn't
really do that so it doesn't accomplish all that much on it's own.

>  To *properly* support a libsystemd-only configuration, a lot more should
> change. Basically, nothing should be installed in target except for
> libsystemd.so (and the header files which will be removed in finalize). Also,
> there is a possible conflict with eudev that needs to be resolved. Possibly
> other things would need to be cleaned up as well.

I figured that either one is creating an SDK, in which case it doesn't
matter what is in target as long as the stage has the libraries, or one
is creating a custom hybrid init, in which case they'll have to figure
out the above and lot of other things too.

You've got a point about nothing installed on target, that happens to
apply very much to an SDK.  Why even run the target_install steps when
building an SDK? Why not skip the build of any target package without a
INSTALL_STAGING component?
