From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Dec 2018 20:59:46 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com>
 <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer>
 <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
Message-ID: <20181218195946.GH24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-12-17 23:59 +0100, Arnout Vandecappelle spake thusly:
> On 17/12/2018 19:13, Yann E. MORIN wrote:
> > Chris, All,
> > 
> > On 2018-12-17 15:07 +0000, Chris Lesiak spake thusly:
> >> On 12/16/18 7:45 AM, Yann E. MORIN wrote:
> >>> On 2018-02-16 12:10 -0600, Chris Lesiak spake thusly:
> >>>> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> > [--SNIP--]
> >>>> diff --git a/package/openssh/sshd_sysusers.conf b/package/openssh/sshd_sysusers.conf
> >>>> new file mode 100644
> >>>> index 0000000000..3ea46f65c6
> >>>> --- /dev/null
> >>>> +++ b/package/openssh/sshd_sysusers.conf
> > [--SNIP--]
> >>>> +u sshd - "Privilege-separated SSH"
> >>> We've discussed this a bit with Thomas, and there is one thing that we
> >>> did not like much, is that it is not integrated nicely in the existing
> >>> users support in Buildroot.
> >>>
> >>> Shouldn't we have a generic mechanism, that takes all the FOO_USERS, and
> >>> turns them into sysusers.d(%) entries? Maybe something like:
> >>>
> >>>      define SYSTEMD_SYSUSERS
> >>>          mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
> >>>          echo "$(PACKAGES_USERS)" \
> >>>          |while read user uid group gid passwd home shell groups comment; do
> >>>              printf "u %s %s %s\n" "${user}" "${uid}" "${comment}"
>  Obviously, we also want to add the comment, home and shell to the conf file.

No, because the format of the sysusers.d files do not allow for that,
see the man page.

[--SNIP the reason for it: stateles systems--]
> > And with the above, all users of all packages are in the PACKAGES_USERS
> > variable, but there is no way to track them back to the corresponding
> > packages.
> 
>  Anything is possible, with enough infra work :-)
> 
>  In this case, it could be something like updating the _USERS support in
> pkg-generic.mk to:
> 
> ifneq ($$($(2)_USERS),)
> ifeq ($$(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
> $(2)_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_PKG_SYSUSERS_CONF
> else
> PACKAGES_USERS += $$($(2)_USERS)$$(sep)
> endif
> endif
> 
> with
> 
> define SYSTEMD_INSTALL_PKG_SYSUSERS_CONF
> 	mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
> 	echo "$($(PKG)_USERS)" \
> 	| while read user uid group gid passwd home shell groups comment; do
> 		printf 'u %s %s "%s"\n' "${user}" "${uid}" "${comment}" "$home" "$shell"
>         done >$(TARGET_DIR)/usr/lib/sysusers.d/$($(PKG)_NAME).conf
>         # And similarly for groups...
> endef

Yeah, but is it worth it? Afterall, we only need the users to be created
at runtime. Do we need to track in separate files what packages installed
what user? We do not have that separation in /etc/paswd, mind you! ;-)

>  There's a slight complication though: what if the package does install a
> sysusers.d file? In that case, we don't want to create one from the Buildroot
> infra, but we still want to create a user in the non-systemd case...

That's the tricky part. We would need some target-finalize hook to do
all that job:

  - for each user in PACKAGES_USERS, create a sysusers.d file if there
    is none yet,

  - for each user in sysusers.d, create an entry in /etc/passwd if there
    is none yet.

> > Currently, the set of users created by FOO_USERS and the set of users
> > created by sysusers.d files is not consistent. Your proposed patch fixes
> > it for openssh only, but:
> > 
> >   - the user definition is duplicated: one in the .mk, one in the
> >     sysusers.d file, so becomes a maintenacne burden (e.g. should we
> >     need to create anotehr user for it, for example)
> 
>  Well, no, as I wrote above: it makes no sense to add a user both to passwd and
> to sysusers.d, since the sysusers.d will just go ignored.

And as Thomas and Chris explained: it does make sense, and now you saw
the Light, so all is fine! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
