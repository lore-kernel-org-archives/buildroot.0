From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 12:31:47 +0200
Subject: [Buildroot] [PATCH 16/20] system: separate sysv and systemd
 parts of the skeleton
In-Reply-To: <75f5daaf-c750-3f24-670e-ab470d845b16@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
 <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be>
 <75f5daaf-c750-3f24-670e-ab470d845b16@mind.be>
Message-ID: <20170723103147.GF26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-07-23 02:13 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 23-07-17 02:08, Arnout Vandecappelle wrote:
> > 
> > On 18-07-17 19:25, Yann E. MORIN wrote:
> >> systems does not like that the content of /var be symlinks to /tmp,
> >   systemd
> > 
> >> especially journald that starts before /tmp is mounted, and thus the
> >> journal files are hidden from view, which causes wuite a bit if fuss...
> >                                                    quite
> >> Instead, move the current /var to a sysv-only skeleton.
> >>
> >> systemd at install time will create the /var content it needs, so we
> >  I guess systemd will also create a tmpfs on /var?
> 
>  Seems the following sentence got dropped:
> 
> What happens when a package installs something in /var?

Since we do not (yet) support a read-only root filesystem for systemd,
and that systemd does _not_ automatically mount anything on /var, we
always have /var that is writable, and thus whatever a package installs
in /var at build time is in /var at runtime.

Now, see the followup patches, that add support for a read-only rootfs
with systemd:

    fs: add pre- and post-command hooks
    system: make systemd work on a read-only rootfs

Even though the code for each is relatively simple, there is a *lot* of
explanations in there about /var handling on a read-only rootfs with
systemd.

But again, so far, we only ever supported systemd on a read-write rootfs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
