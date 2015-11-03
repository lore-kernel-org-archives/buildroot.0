From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:53:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
 configurations
In-Reply-To: <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
Message-ID: <20151103225311.22589f69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Tue, 3 Nov 2015 13:17:05 -0800, Gabe Evans wrote:

> This patch results in dropbear being broken out-of-the-box for systemd
> users. The EnvironmentFile= line sets a requirement that
> /etc/default/dropbear exist (it doesn't, by default).
> 
> I'm not so sure having an environment file by default is a good practice
> for systemd units. The general consensus is that things effecting the
> execution of a service should always be found in the appropriate service
> unit. Environment= would be better anyway since there's only one variable
> ($DROPBEAR_ARGS) being used in this particular case.

Right. I'll revert the patch from Cyril then, unless he suggests a
better solution. I really don't know much about systemd, so I can only
rely on people reviewing patches touching systemd topics. If no-one
does, all I can do is a guess that the change looks somewhat reasonable.

So your report is definitely useful. But if I may suggest, it would be
even more useful if you could review systemd related patches before
they are applied.

> An even better solution would be to move the dropbear.service symlink from
> /etc/systemd/system/multi-user.target.wants/ to
> /usr/lib/systemd/system/multi-user.target.wants/. That would allow users to
> shadow the unit completely with their own customizations or override
> individual options through the use of "drop-in" units. The manual explains
> this in more detail:
> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#id-1.10.3

*All* our packages are creating the symlink
in /etc/systemd/system/multi-user.target.wants/, so changing that
really needs to be discussed with the other people interested in
systemd support in Buildroot. I believe we used to have some symlinks
in /usr, some in /etc, and we settled on /etc with some
${justification}.

Maxime ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
