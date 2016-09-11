From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 13:08:38 +0200
Subject: [Buildroot] [PATCH 1/2] apache: add customization of MPM
In-Reply-To: <20160910213014.GH5740@free.fr>
References: <1473535035-130056-1-git-send-email-fabrice.fontaine@orange.com>
 <20160910213014.GH5740@free.fr>
Message-ID: <497b5173-5443-a1c2-d9b9-231b437803b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-09-16 23:30, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2016-09-10 21:17 +0200, Fabrice Fontaine spake thusly:
>> MPM can be selected between event, prefork or worker
>> Set worker as the default one as it was before even if event MPM is
>> better on system supporting thread safe polling
>>
>> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
>> ---
>>  package/apache/Config.in | 40 ++++++++++++++++++++++++++++++++++++++++
>>  package/apache/apache.mk | 14 +++++++++++++-
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/apache/Config.in b/package/apache/Config.in
>> index 0814a17..3b25988 100644
>> --- a/package/apache/Config.in
>> +++ b/package/apache/Config.in
>> @@ -14,6 +14,46 @@ config BR2_PACKAGE_APACHE
>>  
>>  	  http://httpd.apache.org
>>  
>> +if BR2_PACKAGE_APACHE
>> +
>> +config BR2_PACKAGE_APACHE_EVENT
>> +	bool
>> +
>> +config BR2_PACKAGE_APACHE_PREFORK
>> +	bool
>> +
>> +config BR2_PACKAGE_APACHE_WORKER
>> +	bool
> 
> Why do you have those symbols?
> See below...
> 
>> +choice
>> +	prompt "Multi-Processing Module (MPM)"
>> +	default BR2_PACKAGE_APACHE_MPM_WORKER
>> +	help
>> +	  Select the Multi-Processing Module (MPM).
>> +
>> +config BR2_PACKAGE_APACHE_MPM_EVENT
>> +	bool "event"
>> +	select BR2_PACKAGE_APACHE_EVENT
>> +	help
>> +	  A variant of the worker MPM with the goal of consuming threads
>> +	  only for connections with active processing
>> +
>> +config BR2_PACKAGE_APACHE_MPM_PREFORK
>> +	bool "prefork"
>> +	select BR2_PACKAGE_APACHE_PREFORK
>> +	help
>> +	  Implements a non-threaded, pre-forking web server
>> +
>> +config BR2_PACKAGE_APACHE_MPM_WORKER
>> +	bool "worker"
>> +	select BR2_PACKAGE_APACHE_WORKER
>> +	help
>> +	  Implements a hybrid multi-threaded multi-process web server
>> +
>> +endchoice
>> +
>> +endif
>> +
>>  comment "apache needs a toolchain w/ dynamic library, threads"
>>  	depends on BR2_USE_MMU
>>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
>> index e78545a..a3f49a1 100644
>> --- a/package/apache/apache.mk
>> +++ b/package/apache/apache.mk
>> @@ -20,6 +20,18 @@ APACHE_CONF_ENV= \
>>  	ap_cv_void_ptr_lt_long=no \
>>  	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
>>  
>> +ifeq ($(BR2_PACKAGE_APACHE_EVENT),y)
>> +APACHE_MPM = "event"
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_APACHE_PREFORK),y)
>> +APACHE_MPM = "prefork"
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_APACHE_WORKER),y)
>> +APACHE_MPM = "worker"
>> +endif
> 
> You can re-use the symbols from the choice here:
> 
>         ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT),y)
>         APACHE_MPM = event
>         else ifeq ($(BR2_PACKAGE_APACHE_MPM_PREFORK),y)
>         APACHE_MPM = prefork
>         else
>         APACHE_MPM = worker
>         endif

 You could also add the following to Config.in:

config BR2_PACKAGE_APACHE_MPM_TYPE
	string
	default "event" if BR2_PACKAGE_APACHE_MPM_EVENT
	default "prefork" if BR2_PACKAGE_APACHE_MPM_PREFORK
	default "worker" if BR2_PACKAGE_APACHE_MPM_WORKER

and then...

> 
> (No need to test the last case, since the symbols are from a choice: one
> and only one can be enabled at a time.
> 
> Also, no need to quote the value.
> 
> Regards,
> Yann E. MORIN.
> 
> PS. See ya on Monday! ;-)
> 
>>  APACHE_CONF_OPTS = \
>>  	--sysconfdir=/etc/apache2 \
>>  	--with-apr=$(STAGING_DIR)/usr \
>> @@ -31,7 +43,7 @@ APACHE_CONF_OPTS = \
>>  	--enable-mime-magic \
>>  	--without-suexec-bin \
>>  	--enable-mods-shared=all \
>> -	--with-mpm=worker \
>> +	--with-mpm=$(APACHE_MPM) \

	--with-mpm=$(call qstrip,$(BR2_PACKAGE_APACHE_MPM_TYPE)) \


 [Not saying that you _have_ to do it like that, just pointing out a pattern we
use in a few other places.]

 Regards,
 Arnout

>>  	--disable-lua \
>>  	--disable-luajit
>>  
>> -- 
>> 2.5.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
