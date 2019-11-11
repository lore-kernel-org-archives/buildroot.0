From: Christian Stewart <christian@paral.in>
Date: Mon, 11 Nov 2019 12:27:44 -0800
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <20191111162944.5529d1b2@windsurf.home>
References: <20191111083348.3964650-1-christian@paral.in>
 <20191111162944.5529d1b2@windsurf.home>
Message-ID: <CA+h8R2r0w4RkUkotP3CGKg6o42pvDQ92cxYUgZPUP27MQD1asg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

(re-sending this from the correct email address)

Jeremy ROSEN <jeremy.rosen@smile.fr> writes:
> v1 is deprecated on the kernel side because it was... a mess.
> The systemd people are migrating stuff from v1 to v2 as new controllers a=
re
> added to v2, but at this point there is little left that is v1 only thus
> the change of the default value

Thomas Petazzoni writes:

>> systemd.mk would observe this boolean to enable (or not) the hybrid
>> hierarchy, and packages that need it would select this boolean.
>>
>> That being said, is there any drawback in unconditionally using the
>> hybrid hierarchy? James, since you suggested to make it conditional, do
>> you have some arguments/feedback?

I originally planned to submit this patch with a 3-state option for
which mode is desired (legacy, hybrid, merged) and then having Docker
and other packages depend on hybrid or legacy.

However, I realized that this would be quite a lot of work to then trace
down all of the packages that potentially need the hybrid configuration,
and that in the name of "not breaking userspace" it makes sense for
Buildroot to follow the direction in the systemd NEWS and just default
to "hybrid" for now.

If someone wants to do the above work to make the 3-state option, we
could merge that first, with "hybrid" as the default, and later add
dependencies from Docker -> systemd for that option.

> At that point, I think staying in hybrid mode is the safest bet :
> everything in user-space hasn't migrated yet.
> Let Fedora take the fire and force everybody to migrate, and let's revisit
> the subject once (at least) Docker has migrated...

Agreed, we can probably wait until Docker has finished their migration
to begin seriously considering moving off of "hybrid."

Best regards,
Christian

On Mon, Nov 11, 2019 at 7:29 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Mon, 11 Nov 2019 00:33:48 -0800
> Christian Stewart <christian@paral.in> wrote:
>
> > Docker fails to start with "Devices cgroup isn't mounted" as of systemd
> 243.
> > According to the systemd documentation:
> >
> >   systemd now defaults to the "unified" cgroup hierarchy setup during
> >   build-time, i.e. -Ddefault-hierarchy=unified is now the build-time
> default.
> >   Previously, -Ddefault-hierarchy=hybrid was the default. [...]
> Downstream
> >   production distributions might want to continue to use
> >   -Ddefault-hierarchy=hybrid (or even =legacy) for their builds as
> unfortunately
> >   the popular container managers have not caught up with the kernel API
> changes.
> >
> > Changing this option to "hybrid" or "legacy" fixes the Docker startup.
> >
> > Reference: https://github.com/opencontainers/runc/issues/654
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---
> >  package/systemd/systemd.mk | 1 +
> >  1 file changed, 1 insertion(+)
>
> Applied to master, thanks. It would be nice to have some runtime tests
> around Docker, to verify that it is still working properly at runtime,
> so that we can catch this kind of issues.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191111/4c017e02/attachment.html>
