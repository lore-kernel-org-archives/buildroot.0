From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 08:14:13 +0200
Subject: [Buildroot] [PATCH 08/11] python-pygame: Make installation of
 examples optional
In-Reply-To: <20140403214830.GH17328@free.fr>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-8-git-send-email-paul@crapouillou.net>
 <20140403214830.GH17328@free.fr>
Message-ID: <533E4DB5.7090808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/14 23:48, Yann E. MORIN wrote:
> Paul, Maarten, All,
> 
> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
>> From: Maarten ter Huurne <maarten@treewalker.org>
>>
>> They take up 1.5 MB in the target file system.
>>
>> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
>> Acked-By: Paul Cercueil <paul@crapouillou.net>
>> ---
>>  package/python-pygame/Config.in        | 6 ++++++
>>  package/python-pygame/python-pygame.mk | 7 +++++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
>> index b9a367d..f72ee31 100644
>> --- a/package/python-pygame/Config.in
>> +++ b/package/python-pygame/Config.in
>> @@ -20,6 +20,12 @@ config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
>>  	  pygame module for loading, saving and transfering images.
>>  	  Will autoselect sdl_image with png and jpeg support.
>>  
>> +config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
>> +	bool "pygame.examples"
>> +	help
>> +	  Include examples.
>> +	  Selecting this option adds about 1.5 MB to the target file system.
>> +
>>  config BR2_PACKAGE_PYTHON_PYGAME_FONT
>>  	bool "pygame.font"
>>  	select BR2_PACKAGE_SDL_TTF
>> diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
>> index d9219b9..77f9f6f 100644
>> --- a/package/python-pygame/python-pygame.mk
>> +++ b/package/python-pygame/python-pygame.mk
>> @@ -92,6 +92,13 @@ define PYTHON_PYGAME_REMOVE_TESTS
>>  	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
>>  endef
>>  
>> +ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
>> +define PYTHON_PYGAME_REMOVE_EXAMPLES
>> +	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/examples
>                                       ^^
> I'm not a fan of usign a wildcard here.
> 
> Can you checks with something like:
>     rm -rf $(TARGET_DIR)/usr/lib/python$$(PYTHON_VERSION_MAJOR)/site-packages/pygame/examples
> 
> (Yes, two '$' signs, which makes the variable expanded later, at call
> time, not at parse time.)

 It's inside a define so it will anyway only be expanded when
PYTHON_PYGAME_REMOVE_EXAMPLES is expanded. In addition, this will be
expanded only inside a rule, which means that the expansion is delayed
until it is executed, not just until the rule is parsed (in the
evaluation of the python-package macro).

 In fact, with a double dollar it will not get expanded at all (I think).

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> +endef
>> +PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
>> +endif
>> +
>>  PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
>>  
>>  $(eval $(python-package))
>> -- 
>> 1.9.0
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
