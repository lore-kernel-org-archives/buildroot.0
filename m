From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 16:39:24 +0100
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
In-Reply-To: <20160330173503.2e710605@free-electrons.com>
References: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160330173503.2e710605@free-electrons.com>
Message-ID: <56FBF32C.7070802@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 30/03/16 16:35, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 30 Mar 2016 16:21:22 +0100, Vicente Olivert Riera wrote:
> 
>> @@ -32,7 +27,7 @@ HOST_TCL_CONF_OPTS = \
>>  # I haven't found a good way to force pkgs to not build
>>  # or configure without just removing the entire pkg directory.
>>  define HOST_TCL_REMOVE_PACKAGES
>> -	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9].[0-9] \
>> +	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9][0-9].[0-9] \
>>  		$(@D)/pkgs/tdbc[0-9].[0-9].[0-9] \
>>  		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
>>  		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
> 
> Could we switch to using * instead of this silly [0-9] thing? So:
> 
> 	rm -rf $(@D)/pkgs/sqlite* $(@D)/pkgs/tdbc* ...

No problem.

>> @@ -41,11 +36,10 @@ define HOST_TCL_REMOVE_PACKAGES
>>  endef
>>  HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
>>  define TCL_REMOVE_PACKAGES
>> -	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite[0-9].[0-9].[0-9]) \
>> -		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc[0-9].[0-9].[0-9]) \
>> -		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
>> +	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9][0-9].[0-9] \
>> +		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9]) \
>>  		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
>> -		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
>> +		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9]) \
>>  		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9])
> 
> OK, I think this would need a comment above to explain what's going on,
> it's not trivial to understand why you're removing sqlite and tdbcodbc
> unconditionally, and tdbcpostgresq/tdbcsqlite conditionally.

We remove sqlite unconditionally because we don't want to use the
bundled version.

For tdbcodbc I don't have any particular reason to remove it or keep it.
What do you prefer?

> 
>>  endef
>>  TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
>> @@ -82,6 +76,8 @@ endef
>>  TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
>>  
>>  TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
>> +TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_MYSQL),mysql)
>> +TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
> 
> TCL_DEPENDENCIES = \
> 	$(if ...) \
> 	$(if ...)
> 
> Would be nicer.

That was my first approach and I didn't look nicer to me, so I changed
it :P Anyway, if you prefer that way, I'll do it that way, no problem.

> Maybe this calls for three patches:
> 
>  1/ Switch to * instead of [0-9]
>  2/ Fix the sqlite usage
>  3/ Enable postgresql/mysql usage

I agree. Please answer my question about tdbcodbc and I will write those
three patches.

Regards,

Vincent.

> Thanks!
> 
> Thomas
> 
