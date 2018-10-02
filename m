From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 2 Oct 2018 18:03:42 -0500
Subject: [Buildroot] [PATCH] fs/common: ROOTFS_USERS_TABLES has priority
In-Reply-To: <20181002192624.GB2189@scaer>
References: <1538059007-36692-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20181002192624.GB2189@scaer>
Message-ID: <CAFt09wNf3omb9iynTEC-hjFo1Q=Lwks9ZCfWDHKDk9hBbC6msw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Tue, Oct 2, 2018 at 2:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matt, All,
>
> On 2018-09-27 09:36 -0500, Matt Weber spake thusly:
> > This patch moves the PACKAGES_USERS to be appended to the USERS_TABLES
> > before ROOTFS_USERS_TABLES.  This allows the ROOTFS_USERS_TABLES to
> > update the existing users created by packages with different settings
> > like home directory, pid, gid, etc.
>
> So, I do understand the rationale behind this, and I was almost ready to
> ack the patch, when I thought of a potential trap this could open under
> the unsuspectign user's feet.
>
> So, let's consider a hypotetical package that:
>
>   - defines a user, say 'foo', with home set to e.g. /run/foo
>
>   - installs a daemon to run under user 'foo'
>
>   - installs a config file that contains (e.g.) chroot_dir=/run/foo
>
> Then your custom users table overrides the home dir to (e.g.) /home/foo.
>
> You better be prepared to also override the config file with your own,
> and so on (e.g. maybe the startup script too...)
>
> I don't think it is too bad, though, so I'm OK with the change.
>
> I would however suggest a rephrasing of the commit log, something along
> the lines of:
>
>     fs/common: allow custom user table to override package-defined users
>
>     Currently, when a custom user table and a package define the same user,
>     the settings from the package takes precedence over the ones from the
>     custom user table.
>
>     Hwever, it makes sense to allow the settings from the custom user table
>     take precedence. For example, it woould allow redirecting the user's
>     home directory to an alternate location (e.g. away from tmp and into a
>     partition that is persistent).
>
>     The support/scripts/mkusers script will only retain settings from the
>     latest definition it finds.
>
>     Thus, by passing the custom user table after the package defined users,
>     it is possible to override the packageprovided user definitions.
>
> With that commit log updated:
>

v2 - https://patchwork.ozlabs.org/patch/978067/

Matt
