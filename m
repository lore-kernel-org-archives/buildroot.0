From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 4 Nov 2015 10:34:29 -0800
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
In-Reply-To: <CAGduivw917k_mi4ELH4YjdvKX8RtDmDY0yk99_pfqZpaAPQHrw@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
 <20151103225311.22589f69@free-electrons.com>
 <CAHsRNLgvVBBYiaab=Fgu=FDXZpMw9rqwcmVy=aSaXPaOi==L=w@mail.gmail.com>
 <CAGduivw917k_mi4ELH4YjdvKX8RtDmDY0yk99_pfqZpaAPQHrw@mail.gmail.com>
Message-ID: <CAHsRNLiaVrfipQPi2EbkF2z+YmdVP7jg45bmrdeXvWzbssbupA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, Thomas, all,

On Wed, Nov 4, 2015 at 2:46 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> We organized the files the way they are after what Debian did. They install
> everything in '/usr/lib/systemd/system' and simply create symlinks in
> '/etc/systemd/system/....', the way systemctl enable/disable does it (with
> regards of the targets). It's also easy to test/tweak or the target without
> loosing the original file.
>
> Regarding the user replacing the unit files, we strongly suggest that people
> that wants to customize anything to their needs, use a post-build/post-image
> scripts.
> We don't really provide an image as a 'vendor' would do, that you would
> customize after. You build your own image, so you can customize it the way
> you want it to at build time.

My reasoning for linking services to targets in
'/usr/lib/systemd/system' is more for endusers than it is for
developers using Buildroot. Also, being able to link to
'../something.service' instead of
'../../../../usr/lib/systemd/system/something.service' leaves less
room for error. In the long run it offers more flexibility to users
who may not have the access or ability to make modifications to the
build system. Even though the project isn't much of a 'vendor' the
developers using it are in most cases.

> And if you want to customize only a little, the EnvironmentFile is there to
> do that (that's the way I see it at least).
>
> The simpler Environment is tricker to use in Buildroot, to customize the env
> for a specific process, you would have to tweak systemd's configuration file
> so it would evaluate a file containing all the env variable you would use.
> What happens if there's collisions in the name ?
> Environment is good on a distro, if you quickly want to hack something.
>
> 'EnvironmentFile' is the way to provide users with a way to customize the
> process (or using the templates system, but that would requires more effort
> to maintain, again since the file is used by both init, it's pretty
> straightforward).
> But since you don't want a process to stop functioning because it's lacking
> options (since they are optionnal, it must work without them), using the
> '=-' mechanisms is kind of mandatory for us I would say.

I completely agree with you here. My original suggestion of using
'Environment=' doesn't work as effectively as 'EnvironmentFile=-' if
the only way to change a unit is to modify or replace the original
file.

> So I kind of like the way things are right now but if you see something that
> doesn't sit right with you, let's discuss it :)

My only other concern would be making sure other packages follow the
pattern of having an optional environment file in a common location
and use common arguments. In this particular case, additional
arguments are specified as '$DROPBEAR_ARGS' meanwhile, the other
proposed patch for rng-tools names this variable '$DAEMON_ARGS'.

That aside, I'm okay with this solution given your reasoning. :)

Thanks,
Gabe

-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
