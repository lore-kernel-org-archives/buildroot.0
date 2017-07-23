From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 02:08:57 +0200
Subject: [Buildroot] [PATCH 16/20] system: separate sysv and systemd
 parts of the skeleton
In-Reply-To: <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> systems does not like that the content of /var be symlinks to /tmp,
  systemd

> especially journald that starts before /tmp is mounted, and thus the
> journal files are hidden from view, which causes wuite a bit if fuss...
                                                   quite
> 
> Instead, move the current /var to a sysv-only skeleton.
> 
> systemd at install time will create the /var content it needs, so we

 I guess systemd will also create a tmpfs on /var?

> just create an empty /var for systemd. Yet, systemd really requires a
> bunch of extra directories to exist, so we also create those.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

 Commit message needs to be improved (see also below), but with that
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> Note: /home and /srv will be created at runtime if missing, but it is
> better to create them right now, to simplify supporting systemd on a
> RO filesystem in the (near) future.
> ---
>  package/skeleton-systemd/skeleton-systemd.mk              | 7 +++++++
>  package/skeleton-sysv/skeleton-sysv.mk                    | 4 ++++
>  {system => package/skeleton-sysv}/skeleton/dev/log        | 0
>  {system => package/skeleton-sysv}/skeleton/dev/pts/.empty | 0
>  {system => package/skeleton-sysv}/skeleton/dev/shm/.empty | 0

 I guess indeed the /dev stuff is not needed for systemd because there is anyway
a devtmpfs mounted over it. Which makes me wonder: shouldn't these be moved to
the device-table? Only the static devices case needs these to be present... Of
course, such a change is not for this patch, but I'd say that we can just leave
this /dev stuff in the common part - systemd has no less use of it than sysv.

>  {system => package/skeleton-sysv}/skeleton/etc/fstab      | 0

 Why? systemd does use fstab, so it seems weird not to have an fstab in the
systemd case. Well, I guess our skeleton fstab doesn't contain anything relevant
for systemd because all of that is handled already by tmpfiles.
But the commit log should at least explain this.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
