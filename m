From: Konrad Eisele <konrad@gaisler.com>
Date: Fri, 18 Nov 2011 10:30:47 +0100
Subject: [Buildroot] [PATCH 0/2] intro
In-Reply-To: <201111172336.18958.arnout@mind.be>
References: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
 <201111172336.18958.arnout@mind.be>
Message-ID: <4EC625C7.9030408@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just sent a new patch
[PATCH 1/1] kconfig: Add a configuration subtree command to kconfig
that splits the execute and subtree patch. The "subsource" tag is
activated by "-s" option to mconfig,qconfig, nconfig and gconfig now.


Arnout Vandecappelle wrote:
>  Hoi,
> 
>  I'm not very enthousiastic about either of these two features.

subtrees are for convenience only. Still everything can be done the
way it is now.

> 
> On Thursday 17 November 2011 14:18:07 Konrad Eisele wrote:
>> The aim of patch-1 is to make it possible to have configuration subtrees.
>> This makes it possible to have a structure like this:
>>
>> buildroot-kconfigs
>> + linux-kconfigs
>> + busybox-kconfigs
>> + uclibc-kconfigs
>> + crosstools-kconfigs
>>
>> Where all configuration appear in one xconfig screen. Currently I have focues on
>> qconfig only, I think however adding support for gconfig and mconfig is possible
>> easily. The subtree feature is enabled with the -s option to qconfig: "qconfig -s <kconf>"
> 
> - The subtree that has to be included depends on your buildroot configuration. 
> So you have to include all possible linux, busybox, uclibc, ... configs and
> protect them with IFs.  I can hardly imagine that Kconfig can deal with such 
> huge configurations.
I have added rudiment support so that you can specify
subsource "kconfig.in" "path" "$(var)/config" ...
where "$(var) is substituted by the symbol-value of "var". I did it only
for the ".config" entry of "subsource" but it acn be done
for "kconfig.in" element as well, i.e. you could
subsource "linux-$(lversion)/arch/$(arch)/kconfig.in" "path" "$(var)/config" ...
The function to use is resolve_vars() in support/kconfig/util.c of the patch.

> 
> - I don't like the size explosion of the buildroot tree that we would see
> if all these configs are included.

You could define a subtree that point to the kconfig root of the package _after_
download and install. Then you can add a check weather a subtree exists by
adding support/kconfig/zconf.y:

/* subsource $2:"sub-kconfig" $3:"sub-chdir" $4:"sub-.config" $5:"Title" $6:"subdomainprefix" $7:"confprefix" */
subsource_stmt: T_SUBSOURCE prompt prompt prompt prompt T_WORD word_opt T_EOL
{
	if (dosubsource) {
+                FILE *f = zconf_fopen($2);
+                if (f) {
+                fclose(f);
		printd(DEBUG_PARSE, "%s:%d:subsource %s\n", zconf_curname(), zconf_lineno(), $2);
		zconf_nextconf($2, $3, $4, $5, $6, $7);
+                }
	}
}


If the subtree doesnt exists the statement is ignored...


> 
> - The packages which have kconfigs are the ones that are most likely to need 
> board-specific modifications, which may define additional config options.  This
> means that copying the config tree into buildroot isn't going to cut it.
> 
> - Running configs for these things is a bit of an expert step.  In particular
> because the configs have to be post-processed by buildroot and because
> you have to save them explicitly afterwards in a place different from the 
> output directory.  I think that part should be smoothed out first.  Until
> then, I consider it a good thing that the normal user runs 'make xconfig' 
> while the expert user runs 'make {,linux-,busybox-}menuconfig'.
Can still be done.
> 
> - I don't know what it will look like visually because the patch failed to
> compile for me (current_conf_level is undefined), but I wonder if there is a
> significant advantage compared to just menus.  At least in menuconfig
> it wouldn't really make a difference.


please try the patch I sent a hour ago to the list.
[PATCH 1/1] kconfig: Add a configuration subtree command to kconfig
It also includes the bison, flex, gperf outputs. it is diffed against
master of one hour ago...

> 
> 
>> The other feature that patch-1 adds is a config-entry type "execute: It is
>> like a string, however when doubleclicking (trying to edit) in qconfig
>> (only in qconfig currently) then the string is executed using "system(<str>)".
>> The goal is to be able to execute "make" from inside the gui, without having
>> to exit.
> 
>  Here I simply don't see the benefit.  Whatever needs to be executed there
> can just be done with the normal make after the config finishes.  If people
> want to push a button to run make, give them Eclipse with a buildroot
> plugin :-)

Still, you have to exit. Running it with a press on a button is more intuitive...
-- Konrad

> 
> 
>  Regards,
>  Arnout
> 
> 
