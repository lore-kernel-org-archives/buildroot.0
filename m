From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Jul 2021 14:21:16 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210707134828.7feafbd2@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer> <20210707134828.7feafbd2@bootlin.com>
Message-ID: <f809847a-151a-18d2-ff5d-302b60677e45@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/07/2021 13:48, Herve Codina wrote:
> Hi,
> 
> On Tue, 6 Jul 2021 21:50:48 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>>> +# Make sure python _sysconfigdata*.py files only reference the current
>>> +# per-package directory.
>>> +
>>> +# $1: package name (lower case)
>>> +# $2: staging or host directory of the package
>>> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>>> +define fixup-python-files
>>> +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
>>> +		-name "_sysconfigdata*.py" -print0 | xargs -0 --no-run-if-empty \
>>> +		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
>>> +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
>>> +		-name "_sysconfigdata*.pyc" -delete  
>>
>> Those two find commands are not equivalent to the original ones.
>>
>> Before, we had:
>>     find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]
>>
>> After, we'd have, after replacing $(2):
>>     find $(HOST_DIR) \( -path '$(HOST_DIR)/lib/python*' -o -path '$(HOST_DIR)/usr/lib/python*' \) [...]
>>     find $(STAGING_DIR) \( -path '$(STAGING_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) [...]
>>
>> So this is slightly different... I don't get why you needed to duplicate
>> the calls, calling the macro twice... And even then, it would have still
>> been simpler to pass the two locations as starting points to find:
>>
>>     find $(HOST_DIR)/lib/python* $(HOST_DIR)/usr/lib/python* [...]
>>     find $(STAGING_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]
>>
>> But really, $(HOST_DIR)/usr is just a symlink to . so there is no reason
>> to search it. Also, previously $(STAGING_DIR)/lib/ was not in the search
>> list, but now it is...

[snip]
> 
> These finds are now called for all packages and .../lib/python* can be not
> present. In this case, find fails.

 A simpler way of doing that would be:

	$(if $(wildcard $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*),
		$(Q)find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*


> Using '-path' avoid this failure if files/dirs are not present.
> 
> I wanted to mimic fixup-libtool-files.
> And so performed 2 calls. One for HOST_DIR and the other for STAGING_DIR.
> 
> For HOST_DIR, the previous find searched in $(HOST_DIR)/lib,
> for STAGING_DIR, it searched in $(STAGING_DIR)/usr/lib,
> 
> That's why I wrote the macro with 
> -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*'
> 
> We can simplify the call using:
>   $(Q)find $(2) -path '$(2)/usr/lib/python*' -name ...
> This assumes:
> (1) python stuff will not install anything in $(STAGING_DIR)/lib/python*

 This you can safely assume.

> (2) $(HOST_DIR)/usr will always be a symlink to $(HOST_DIR)/.

 Although for now you can assume this, ideally we would like to have the
possibility to get rid of the usr->. symlink. So if you can avoid relying on it
it would be better.

 Regards,
 Arnout
