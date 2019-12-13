From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Fri, 13 Dec 2019 07:32:09 +0100
Subject: [Buildroot] [PATCH 2/4] package/xenomai: Pull from git
In-Reply-To: <20191212215201.7761bccd@windsurf>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
 <5404679c83c28260c53e2fc54cdbeafda2929914.1576176280.git.jan.kiszka@siemens.com>
 <20191212215201.7761bccd@windsurf>
Message-ID: <e91bb26d-c637-a0b2-113a-5534e01137ef@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12.12.19 21:52, Thomas Petazzoni wrote:
> Hello Jan,
> 
> On Thu, 12 Dec 2019 19:44:38 +0100
> Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> This allows to pick also git revisions via XENOMAI_VERSION.
> 
> You don't have tarballs for new releases? We generally prefer to use
> tarballs when available.

We do, but pulling those from git is more flexible as it allows to
specify also non-release states.

> 
>>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
>>  ifeq ($(XENOMAI_VERSION),)
>> -XENOMAI_VERSION = 3.0.9
>> +XENOMAI_VERSION = v3.0.9
> 
> The version needs to stay 3.0.9, i.e without the "v" prefix.

If that is a general requirement on <pkg>_VERSION variables, I need to
model pulling git SHAs differently, likely as the kernel recipe does.

> 
>>  else
>>  BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
>>  endif
>>  
>> -XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
>> +XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_VERSION)
> 
> .. which can be done by changing this to:
> 
> XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/v$(XENOMAI_VERSION)

That breaks XENOMAI_VERSION=<branch> or <sha>, see above.

> 
> We want this so that our XENOMAI_VERSION value matches the
> release-monitoring.org entry for Xenomai:
> https://release-monitoring.org/project/18451/. BTW, it seems like they
> don't know about version 3.0.10, as they are checking
> https://xenomai.org/downloads/xenomai/stable/ and there is no tarball
> for 3.0.10. I guess we need to change the Xenomai entry in
> release-monitoring.org to make it use the Git repository.

We have some delay in updating the regular download area. There is also
currently none of our 3.1-rc releases available under testing/.

> 
>> +define XENOMAI_BOOTSTRAP
>> +	(cd $(@D); ./scripts/bootstrap)
>> +endef
>> +
>> +XENOMAI_PRE_CONFIGURE_HOOKS += XENOMAI_BOOTSTRAP
> 
> This is not good, because nothing guarantees you autoconf/automake are
> available. Our preferred way of handling this is to use:
> 
> XENOMAI_AUTORECONF = YES
> 
> which simply calls autoreconf on the project. However, I can imagine
> that Xenomai is a bit special, so if AUTORECONF = YES doesn't work, you
> can keep your PRE_CONFIGURE_HOOKS, but you need to add host-autoconf
> and host-automake to XENOMAI_DEPENDENCIES, and possibly host-libtool if
> libtool is used to build the libraries.

$ cat scripts/bootstrap
#!/bin/sh

autoreconf -fi


Looks unspectacular. Will try AUTORECONF = YES.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
