From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 4 Nov 2015 11:46:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
In-Reply-To: <CAHsRNLgvVBBYiaab=Fgu=FDXZpMw9rqwcmVy=aSaXPaOi==L=w@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
 <20151103225311.22589f69@free-electrons.com>
 <CAHsRNLgvVBBYiaab=Fgu=FDXZpMw9rqwcmVy=aSaXPaOi==L=w@mail.gmail.com>
Message-ID: <CAGduivw917k_mi4ELH4YjdvKX8RtDmDY0yk99_pfqZpaAPQHrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gabe, Thomas, all,

On Tue, Nov 3, 2015 at 11:21 PM, Gabe Evans <gabe@hashrabbit.co> wrote:

> Hi Thomas,
>
> On Tue, Nov 3, 2015 at 1:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > So your report is definitely useful. But if I may suggest, it would be
> > even more useful if you could review systemd related patches before
> > they are applied.
>
> This one slipped past me but I'd be more than happy to review patches
> in the future.
>
> >> An even better solution would be to move the dropbear.service symlink
> from
> >> /etc/systemd/system/multi-user.target.wants/ to
> >> /usr/lib/systemd/system/multi-user.target.wants/. That would allow
> users to
> >> shadow the unit completely with their own customizations or override
> >> individual options through the use of "drop-in" units. The manual
> explains
> >> this in more detail:
> >>
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#id-1.10.3
> >
> > *All* our packages are creating the symlink
> > in /etc/systemd/system/multi-user.target.wants/, so changing that
> > really needs to be discussed with the other people interested in
> > systemd support in Buildroot. I believe we used to have some symlinks
> > in /usr, some in /etc, and we settled on /etc with some
> > ${justification}.
>
> It might also be worth clarifying that other Linux distributions
> follow the practice of reserving /etc/systemd for users and
> /usr/lib/systemd for maintainers.
>

We organized the files the way they are after what Debian did. They install
everything in '/usr/lib/systemd/system' and simply create symlinks in
'/etc/systemd/system/....', the way systemctl enable/disable does it (with
regards of the targets). It's also easy to test/tweak or the target without
loosing the original file.

Regarding the user replacing the unit files, we strongly suggest that
people that wants to customize anything to their needs, use a
post-build/post-image scripts.
We don't really provide an image as a 'vendor' would do, that you would
customize after. You build your own image, so you can customize it the way
you want it to at build time.

And if you want to customize only a little, the EnvironmentFile is there to
do that (that's the way I see it at least).

The simpler Environment is tricker to use in Buildroot, to customize the
env for a specific process, you would have to tweak systemd's configuration
file so it would evaluate a file containing all the env variable you would
use. What happens if there's collisions in the name ?
Environment is good on a distro, if you quickly want to hack something.

'EnvironmentFile' is the way to provide users with a way to customize the
process (or using the templates system, but that would requires more effort
to maintain, again since the file is used by both init, it's pretty
straightforward).
But since you don't want a process to stop functioning because it's lacking
options (since they are optionnal, it must work without them), using the
'=-' mechanisms is kind of mandatory for us I would say.

So I kind of like the way things are right now but if you see something
that doesn't sit right with you, let's discuss it :)

>
> This is definitely a big change that should be discussed in more
> detail. I'm still getting familiar with the mailing list so your help
> in starting this conversation would be appreciated. :)
>
> Thanks,
> Gabe
>
> --
> Gabe Evans | Co-Founder & CTO
> hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/77edc9f6/attachment.html>
