From: Michael Walle <michael@walle.cc>
Date: Tue, 11 Feb 2020 00:02:00 +0100
Subject: [Buildroot] [RFC PATCH] package/sdbusplus: fix the build
In-Reply-To: <20200210205703.GY23769@scaer>
References: <20200210191131.2520-1-michael@walle.cc>
 <20200210205703.GY23769@scaer>
Message-ID: <DF17D0B6-9BAF-4C53-A3FF-CAAEB69DD11E@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10. Februar 2020 21:57:03 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
>Michael, All,
>
>On 2020-02-10 20:11 +0100, Michael Walle spake thusly:
>> Commit d255b67972b4b7f27572581fe0c8c8aa03d850c8 fixed the handling of
>> the a package local m4/ directory which might be missing. But this
>only
>> works if it is the very first argument. But for this package this is
>not
>> possible because we already occupy this with the extra include
>directory
>> for autoconf-archive. Bring back the hook to create the m4/ directory
>to
>> fix this.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> 
>> IMHO keeping this hook if the package has an include directory in its
>> _AUTORECONF_OPTS variable is the least bad thing to do.
>> 
>> Unfortunately, I've only been able to test this briefly with the host
>> build.
>> 
>>  package/sdbusplus/sdbusplus.mk | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/package/sdbusplus/sdbusplus.mk
>b/package/sdbusplus/sdbusplus.mk
>> index 9d3d1e8cf4..b771576a1d 100644
>> --- a/package/sdbusplus/sdbusplus.mk
>> +++ b/package/sdbusplus/sdbusplus.mk
>> @@ -22,5 +22,14 @@ SDBUSPLUS_INSTALL_STAGING = YES
>>  SDBUSPLUS_LICENSE = Apache-2.0
>>  SDBUSPLUS_LICENSE_FILES = LICENSE
>>  
>> +# Autoreconf is missing the m4/ directory, which might actually be
>missing
>> +# iff it was the first argument, but unfortunately we are overriding
>the
>> +# first include directory above. Thus we need that hook here.
>> +define SDBUSPLUS_CREATE_M4
>> +       mkdir -p $(@D)/m4
>> +endef
>> +SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
>> +HOST_SDBUSPLUS_POST_PATCH_HOOKS += SDBUSPLUS_CREATE_M4
>
>I have to say that I am not happy that we so fast resort to
>reintroducing
>such hooks, when the goal of the initial patch from you was that we
>should not have to meddle with the include directive to begin with...

Haha ;) well lets say I would be all over for a more generic solution, you can ask Heiko; I can be a pain in the ass. But.. I don't know if it's worth the hassle to have that for just one package; or for packages which use an include path argument. Actually, I've learn from you (or you all) to be more pragmatic :p Therefore it was a RFC patch. 

I've already pointed out my alternative approach in the other thread. But that worked also just for that specific use case of having another include directory for ac macros.

So we'd have to have an own variable where a package could specify an include path besides the _AUTORECONF_OPTS, something like _AUTORECONF_INCLUDES. But again, this could be a thing if there were more users for it.



>I would favour trying to fix it in a cleaner way, either my previous
>patchset (or something similar) to conditionally add the correct list
>of directories, or to mege back autoconf-archive back into the main
>include directory and see what package break and fix those instead.

yes but then what if a package wants to use other include paths. Well, we could filter out the include arguments and put it in the ACLOCAL_PATH. But IMHO this is too much magic. 

-michael

>However, we currently have a single package that depends on
>autoconf-archive, so I would not put too much effort in it either...
>
>Thomas, Arnout, Peter: thoghts?
>
>Regards,
>Yann E. MORIN.
>
>>  $(eval $(autotools-package))
>>  $(eval $(host-autotools-package))
>> -- 
>> 2.20.1
>> 
