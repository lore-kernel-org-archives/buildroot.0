From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 22:03:36 +0100
Subject: [Buildroot] [PATCH 4/6] package/pseudo: expose the host binary
 in a variable
In-Reply-To: <20161108173618.GD3554@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <36c6de6cdc72a8340da56bf9d44bdab064a9fd61.1478553802.git.yann.morin.1998@free.fr>
 <d165cfb4-643c-e43f-e3a9-79ce7086917a@mind.be>
 <20161108173618.GD3554@free.fr>
Message-ID: <442f56a1-a67c-808f-453d-15a169e5839a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 18:36, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-11-08 00:01 +0100, Arnout Vandecappelle spake thusly:
>> On 07-11-16 22:23, Yann E. MORIN wrote:
>>> Running pseudo is more involved than running fakeroot. In the transition
>>> from using fakeroot, we just did not account for the extra requirements.
>>>
>>> First, we explicitly tell pseudo where it is, otherwise it tries to
>>> guess. Its guess is correct, but it prints a warning, which is not nice.
>>>
>>> Second, we tell it where to find the passwd and group files in case it
>>> has to emulate access to them. We currently do not use that feature, but
>>> better safe than sorry.
>>>
>>> Third, pseudo spawns a background daemon, and talks to it (when fakeroot
>>> would emulate the state all in the current process' state, pseudo uses
>>> the daemon to coordinate the state across multiple processes). We are
>>> not much interested in the daemon lingering around, so we just tell it
>>> to termintate as soon as the last clients quits (this can take up to one
>>> second).
>>>
>>> Fourth and last, pseudo always stores its internal database when
>>> exiting, and reloads it when spawned. The database is by default stored
>>> in a sub-directory of the prefix it was installed in, but this is
>>> impractical for us, in case the host-dir is outside the config dir
>>> $(BASE_DIR). We want the database to be specific to the one config dir
>>
>>  $(HOST_DIR), even if outside of $(BASE_DIR), must also be specific to one
>> config dir. Remember that $(STAGING_DIR) resides under $(HOST_DIR). So this
>> argument is not really valid. However, I do fully agree that
>> $(HOST_DIR)/usr/var/pseudo is *not* the best place for it, and that your
>> proposed location is better.
> 
> OK, I'll rephrase accordingly.
> 
>>> we are building. So, we store the database in a (hidden) sub-dir of the
>>> build dir, thus ensuring it is never shared with another build.
>>
>>  I would like to add the following:
>>
>> We pass these options as environment variables in the pseudo invocation,
>> nicely wrapped in the HOST_PSEUDO variable. An alternative would be to
>> create a pseudo wrapper script, but that is less attractive for the
>> following reasons.
>>
>> - We don't expect users to need to call pseudo from post-build/image
>>   scripts, because we already support BR2_ROOTFS_POST_FAKEROOT_SCRIPT.
> 
> Wrong for post-image, as I already explained.
> 
>> - Creating a script is a bit more complicated, e.g. with relocatable
>>   host directory in mind.
> 
> So, a pseudo wrapper is iundeed better, because new post-image scrips
> could directly use pseudo instead of fakeroot, and the fakeroot wrapper
> could be a symlink to the pseudo wrapper now.

 In that case, why don't we call the wrapper 'fakeroot' and leave the pseudo
binary alone? In the assumption that people who call the pseudo binary directly
would know what they are doing so they'll add the right options, and people who
don't know what they're doing will call the fakeroot wrapper.

 Hm, no, on second thought, I don't particularly like that either. But I also
don't like "overwriting" pseudo with a wrapper. So then I propose to call the
wrapper 'pseudo-wrapper' and symlink fakeroot to it.


> 
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
>>> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
>>> Cc: Erico Nunes <nunes.erico@gmail.com>
>>> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>> ... but I like my bikeshed to be coloured differently...
> 
> :-)
> 
>>> ---
>>>  package/pseudo/pseudo.mk | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
>>> index 98c7de5..2a3e31f 100644
>>> --- a/package/pseudo/pseudo.mk
>>> +++ b/package/pseudo/pseudo.mk
>>> @@ -23,6 +23,13 @@ HOST_PSEUDO_CONF_OPTS = \
>>>  	--libdir=$(HOST_DIR)/usr/lib \
>>>  	--with-sqlite=$(HOST_DIR)/usr
>>>  
>>> +HOST_PSEUDO = \
>>
>>  We use $(MAKE), $(TAR), $(QT_QMAKE), $(QT5_QMAKE), $(BR2_CMAKE), $(LUA_RUN),
>> $(PERL_RUN). Nowhere do we use $(HOST_FOO) to define a command. I admit that all
>> of these are not completely consistent, but I think the _RUN pattern fits best
>> for this situation, so how about PSEUDO_RUN?
> 
> And we have PKG_CONFIG_HOST_BINARY... ;-)
> 
> I don't much care about hte name, but the _RUN scheme is not really
> appealing to me. Consistency is nice, though, but we can't really say
> that _RUN is consistent, sionce we only have to uses now, and so many
> different variants...
> 
> Let's see what the powers-that-be prefer! ;-)

 Well, if it's a wrapper script after all, then there is no need for a variable.
We don't have one for python either.

> 
>>> +	PSEUDO_PREFIX=$(HOST_DIR)/usr \
>>> +	PSEUDO_PASSWD=$(TARGET_DIR) \
>>> +	PSEUDO_OPTS=-t0 \
>>> +	PSEUDO_LOCALSTATEDIR=$(BUILD_DIR)/.pseudodb \
>>
>>  I don't really like hidden files/directories in BUILD_DIR. I was thinking more
>> along the lines of $(BASE_DIR)/target-pseudodb. But I'm OK with your proposal as
>> well.
> 
> Well, I don;t really like to expose to the user our internals. The DB is
> internal state of Buildroot. A dot-directory is nice for that...

 Good point.


 Regards,
 Arnout

>>> +	$(HOST_DIR)/usr/bin/pseudo
>>
>>  Perhaps it's better to provide the options on the command line, as far as
>> possible. So
>> 	PSEUDO_PASSWD=$(TARGET_DIR) \
>> 	PSEUDO_LOCALSTATEDIR=$(BUILD_DIR)/.pseudodb \
>> 	$(HOST_DIR)/usr/bin/pseudo -t0 -P $(HOST_DIR)/usr
> 
> And we need not provide them at all if we provide a wrapper...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
