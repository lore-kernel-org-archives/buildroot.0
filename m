From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2018 23:59:04 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <20181217181319.GD2951@scaer>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com> <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer>
Message-ID: <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/12/2018 19:13, Yann E. MORIN wrote:
> Chris, All,
> 
> On 2018-12-17 15:07 +0000, Chris Lesiak spake thusly:
>> On 12/16/18 7:45 AM, Yann E. MORIN wrote:
>>> On 2018-02-16 12:10 -0600, Chris Lesiak spake thusly:
>>>> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> [--SNIP--]
>>>> diff --git a/package/openssh/sshd_sysusers.conf b/package/openssh/sshd_sysusers.conf
>>>> new file mode 100644
>>>> index 0000000000..3ea46f65c6
>>>> --- /dev/null
>>>> +++ b/package/openssh/sshd_sysusers.conf
> [--SNIP--]
>>>> +u sshd - "Privilege-separated SSH"
>>> We've discussed this a bit with Thomas, and there is one thing that we
>>> did not like much, is that it is not integrated nicely in the existing
>>> users support in Buildroot.
>>>
>>> Shouldn't we have a generic mechanism, that takes all the FOO_USERS, and
>>> turns them into sysusers.d(%) entries? Maybe something like:
>>>
>>>      define SYSTEMD_SYSUSERS
>>>          mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
>>>          echo "$(PACKAGES_USERS)" \
>>>          |while read user uid group gid passwd home shell groups comment; do
>>>              printf "u %s %s %s\n" "${user}" "${uid}" "${comment}"

 Obviously, we also want to add the comment, home and shell to the conf file.

>>>          done >$(TARGET_DIR)/usr/lib/sysusers.d/buildroot.conf
>>>          # And similarly for groups...
>>>      endef
>>>      SYSTEMD_POST_TARGET_FINALIZE_HOOKS = SYSTEMD_SYSUSERS
>>>
>>> Regards,
>>> Yann E. MORIN.
>>>
>> That looks like a good idea, but I don't know how to handle upstream 
>> packages that already create sysusers.d drop-ins.
>>
>> Examples that I know of from my own build include:
>>  ??? systemd - Creates basic.conf, systemd.conf, and systemd-remote.conf
>>  ??? dbus - Creates dbus.conf
>>
>>
>> Is there a reason (other than storage cost) to prefer a single 
>> buildroot.conf drop-in file instead of one per package?
> 
> Well, a file takes an inode, which takes some space, so that's that.
> But if one goes with systemd, then the number of inodes is probably
> irrelevant.

 If we're making a single buildroot.conf file, what exactly does the sysusers.d
approach bring over traditional passwd? The unly reason of existence of this
feature (AFAICS) is to allow packages to create users by simply creating a file
instead of editing passwd.

 Which brings me to my question to Chris: what was the purpose of this patch to
begin with? Since OPENSSH_USERS is already set, the sshd user will already exist
in /etc/passwd, so the sysusers.d directive will be ignored... Either that, or
our mkusers script doesn't work correctly.

 The only reason why you'd want this is to support the creation of installable
packages with Buildroot (which we officially don't support, but several people
actually do that). I think this is a good reason, but it should be mentioned in
the commit message.


> And with the above, all users of all packages are in the PACKAGES_USERS
> variable, but there is no way to track them back to the corresponding
> packages.

 Anything is possible, with enough infra work :-)

 In this case, it could be something like updating the _USERS support in
pkg-generic.mk to:

ifneq ($$($(2)_USERS),)
ifeq ($$(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
$(2)_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_PKG_SYSUSERS_CONF
else
PACKAGES_USERS += $$($(2)_USERS)$$(sep)
endif
endif

with

define SYSTEMD_INSTALL_PKG_SYSUSERS_CONF
	mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
	echo "$($(PKG)_USERS)" \
	| while read user uid group gid passwd home shell groups comment; do
		printf 'u %s %s "%s"\n' "${user}" "${uid}" "${comment}" "$home" "$shell"
        done >$(TARGET_DIR)/usr/lib/sysusers.d/$($(PKG)_NAME).conf
        # And similarly for groups...
endef


 There's a slight complication though: what if the package does install a
sysusers.d file? In that case, we don't want to create one from the Buildroot
infra, but we still want to create a user in the non-systemd case...


> 
> Currently, the set of users created by FOO_USERS and the set of users
> created by sysusers.d files is not consistent. Your proposed patch fixes
> it for openssh only, but:
> 
>   - the user definition is duplicated: one in the .mk, one in the
>     sysusers.d file, so becomes a maintenacne burden (e.g. should we
>     need to create anotehr user for it, for example)

 Well, no, as I wrote above: it makes no sense to add a user both to passwd and
to sysusers.d, since the sysusers.d will just go ignored.


>   - other packages are left out in the cold.

 Absolutely, there is no point at all to do this just for sshd.

 Regards,
 Arnout

> 
> So, I'd like we find a solution so that the set of users installed in
> /etc/paswd and the set of users created by sysusers.d are identical.
> 
> I don't have a good suggestion, though... :-/
> 
> Regards,
> Yann E. MORIN.
> 
