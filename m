From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Dec 2018 19:13:19 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com>
 <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
Message-ID: <20181217181319.GD2951@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

On 2018-12-17 15:07 +0000, Chris Lesiak spake thusly:
> On 12/16/18 7:45 AM, Yann E. MORIN wrote:
> > On 2018-02-16 12:10 -0600, Chris Lesiak spake thusly:
> >> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
[--SNIP--]
> >> diff --git a/package/openssh/sshd_sysusers.conf b/package/openssh/sshd_sysusers.conf
> >> new file mode 100644
> >> index 0000000000..3ea46f65c6
> >> --- /dev/null
> >> +++ b/package/openssh/sshd_sysusers.conf
[--SNIP--]
> >> +u sshd - "Privilege-separated SSH"
> > We've discussed this a bit with Thomas, and there is one thing that we
> > did not like much, is that it is not integrated nicely in the existing
> > users support in Buildroot.
> >
> > Shouldn't we have a generic mechanism, that takes all the FOO_USERS, and
> > turns them into sysusers.d(%) entries? Maybe something like:
> >
> >      define SYSTEMD_SYSUSERS
> >          mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
> >          echo "$(PACKAGES_USERS)" \
> >          |while read user uid group gid passwd home shell groups comment; do
> >              printf "u %s %s %s\n" "${user}" "${uid}" "${comment}"
> >          done >$(TARGET_DIR)/usr/lib/sysusers.d/buildroot.conf
> >          # And similarly for groups...
> >      endef
> >      SYSTEMD_POST_TARGET_FINALIZE_HOOKS = SYSTEMD_SYSUSERS
> >
> > Regards,
> > Yann E. MORIN.
> >
> That looks like a good idea, but I don't know how to handle upstream 
> packages that already create sysusers.d drop-ins.
> 
> Examples that I know of from my own build include:
>  ??? systemd - Creates basic.conf, systemd.conf, and systemd-remote.conf
>  ??? dbus - Creates dbus.conf
> 
> 
> Is there a reason (other than storage cost) to prefer a single 
> buildroot.conf drop-in file instead of one per package?

Well, a file takes an inode, which takes some space, so that's that.
But if one goes with systemd, then the number of inodes is probably
irrelevant.

And with the above, all users of all packages are in the PACKAGES_USERS
variable, but there is no way to track them back to the corresponding
packages.

Currently, the set of users created by FOO_USERS and the set of users
created by sysusers.d files is not consistent. Your proposed patch fixes
it for openssh only, but:

  - the user definition is duplicated: one in the .mk, one in the
    sysusers.d file, so becomes a maintenacne burden (e.g. should we
    need to create anotehr user for it, for example)

  - other packages are left out in the cold.

So, I'd like we find a solution so that the set of users installed in
/etc/paswd and the set of users created by sysusers.d are identical.

I don't have a good suggestion, though... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
