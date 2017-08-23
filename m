From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Aug 2017 22:57:30 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/spidermonkey185: new package
References: <20170806164452.11938-1-bernd.kuhls@t-online.de>
 <20170823160815.3ea3ae11@windsurf>
Message-ID: <qq617exl1r.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Wed, 23 Aug 2017 16:08:15 +0200 schrieb Thomas Petazzoni:

> I'm still not really thrilled by the idea of adding a package for such a
> large piece of code that Mozilla says is outdated
> (https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/
Releases/1.8.5).
> Is it still just CouchDB that needs this? Do they have some plans of
> using something more maintained ?

besides CouchDB I know no other package needing spidermonkey185. Although 
upstream considers spidermonkey185 outdated many distros still package it:

https://packages.qa.debian.org/m/mozjs.html
https://launchpad.net/ubuntu/+source/mozjs
https://apps.fedoraproject.org/packages/js/
https://www.archlinux.org/packages/community/i686/js185/
https://packages.gentoo.org/packages/dev-lang/spidermonkey

> Most of those patches don't have any useful description. Could you add
> such a description inside the patches ?

The patches were downloaded from Fedora because this patch set was needed 
to build CouchDB 2.1. The patch set provided by Nicolas for spidermonkey, 
which worked with CouchDB 1.6, is not enough for CouchDB 2.1 anymore. I 
can try to add some descriptions, but honestly, I have no idea what most 
of the patches do ;)

> This change is later reverted by patch 0004.
[...]
> This change is later modified again in patch 0013, to go in a different
> direction (use filter instead of filter-out to opt-in supported
> architectures instead of opt-out unsupported architectures).
[...]
> Another change modified later.
[...]
> Ditto.

What about squashing the Fedora patches?

> spidermonkey-185 ? Perhaps use that as the name for the package ?

Ok, or we can use mozjs like Debian does.

> No license file available ?

What about js-1.8.5/js/src/README.html ?

>> +# To detect endianess a host binary is built from jscpucfg.cpp which
>> is +# not cross-compile friendly, so we force endianess.
>> +# HOST_CFLAGS are forced to avoid problems when detecting host gcc +#
>> because configure would pass TARGET_CFLAGS to the host gcc.
>> +SPIDERMONKEY185_CONF_ENV = \
>> +	HOST_CFLAGS="$(HOST_CFLAGS)" \
>> +	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN" \
> 
> So you have to specify the endianness of the target in host flags?

Nicolas added this code but according to js-1.8.5/js/src/Makefile.in we 
could use $(CROSS_COMPILE) instead to avoid jscpucfg. I will have a look.

Regards, Bernd
