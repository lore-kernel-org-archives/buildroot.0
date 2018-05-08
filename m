From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 May 2018 23:00:23 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <20180507221244.GC15375@ned>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
 <20180507170256.2ef06b2f@windsurf> <20180507193850.GA15375@ned>
 <20180507214356.3a087000@windsurf> <20180507221244.GC15375@ned>
Message-ID: <c0524a93-eaad-3e61-f8bc-f9b17271d468@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-05-18 00:12, Eric Le Bihan wrote:
> On 18-05-07 21:43:56, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 7 May 2018 21:38:50 +0200, Eric Le Bihan wrote:
>>

[snip]
>>>>> +	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) meson \
>>>>> +		--prefix=/usr \
>>>>> +		--libdir=/usr/lib \
>>>>> +		--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
>>>>> +		--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
>>>>> +		--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
>>>>
>>>> So meson is really not consistent, and some options are "--name=value",
>>>> and some others are "--name value" ?
>>>
>>> No. Both patterns are valid for any option. I'll use "--name=value" for
>>> consistency.
>>
>> It would be great to use --name=value everywhere then, including in the
>> packages using the meson-package infrastructure. This should perhaps be
>> noted in the manual, when describing the <pkg>_CONF_OPTS variable.
> 
> The --name=value pattern is used for options related to Meson behavior
> and general project configuration, whereas the -Dname=value one is used

 No, it's about --name=value or --name value.

> for project feature activation/customization. So <pkg>_CONF_OPTS should
> most of the time contains elements using the latter (except when
> overriding sysconfdir or such locations).
> 
> In case of boolean options, Meson assumes that "-Dbaz" means
> "-Dbaz=true". Should the example in the infrastructure documentation

 We prefer explicit, so -Dbaz=true

> look like this:
> 
> ```
> ifeq ($(BR2_PACKAGE_BAZ),y)
> FOO_CONF_OPTS += -Dbaz=true
> FOO_DEPENDENCIES += baz
> else
> FOO_CONF_OPTS += -Dbaz=false
> endif

 Yes.

> ```
> 
> Or like this:
> 
> ```
> ifeq ($(BR2_PACKAGE_BAZ),y)
> FOO_CONF_OPTS += -Dbaz
> FOO_DEPENDENCIES += baz
> endif

 No. We certainly want the -Dbaz=false option (I guess in meson there is also a
possibility to let an option default to true, right?). So for symmetry it's
better to do -Dbaz=true as well then.

> ```
> 
>>>> DESTDIR=$$(HOST_DIR) is not correct for host installations, since you
>>>> already build for prefix=$(HOST_DIR).
>>>
>>> OK, I'll drop it.
>>
>> OK. Did you test the host variant of the meson-package infrastructure ?
> 
> Good advice! Testing the host variant of a custom library+executable
> project brought out that Meson does not automically sets RPATH [1],
> which makes support/scripts/check-host-rpath unhappy, and that it

 If that is the case, it means you don't properly pass HOST_LDFLAGS, which is A
Bad Thing (tm).

 Indeed, looking at your patch, I see none of the host options are passed. You
certainly need to pass HOST_MAKE_ENV in the environment to make pkg-config is
used correctly. And then you should also make sure that HOSTCC etc. are passed
correctly - remember that it's possible to use a different host compiler by
passing HOSTCC in the environment (and I'm actually using that feature!).

 Regards,
 Arnout

> defaults --libdir to "lib64" instead of "lib" [2]. So I'll fix the host
> variant accordingly.
> 
> [1] http://mesonbuild.com/Reference-manual.html#executable
> [2] http://mesonbuild.com/Reference-manual.html#get_option
> 
> Regards,
> 
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
