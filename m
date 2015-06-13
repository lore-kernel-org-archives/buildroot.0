From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jun 2015 18:25:13 +0200
Subject: [Buildroot] [PATCH 3/4] core/pkg-kconfig: run the kconfig
 fixups after exiting configurators
In-Reply-To: <20150612233618.56f1e4dd@free-electrons.com>
References: <cover.1433591404.git.yann.morin.1998@free.fr>	<c011926dc0817e5b5685bc5519ae5cbd57b21888.1433591404.git.yann.morin.1998@free.fr>
 <20150612233618.56f1e4dd@free-electrons.com>
Message-ID: <557C5969.7020703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/15 23:36, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sat,  6 Jun 2015 13:54:25 +0200, Yann E. MORIN wrote:

[snip]

>> +# Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
>> +# fake it for the configurators (otherwise it is set to just '.', i.e.
>> +# the current directory where make is run, which happens to be in
>> +# $(TOPDIR), because the target of the rule is not an actual file, so
>> +# does not have any path component).
>> +#
>> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
>>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>>  	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>>  		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
>>  	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
>>  	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
>> +	$$(call $(1)_FIXUP_KCONFIG)
> 
> I find a bit sad that we don't manage to use make dependencies to
> schedule the kconfig-fixup -> configurator -> kconfig-fixup thing
> logic, and that we have to manually recall $(1)_FIXUP_CONFIG. I've put
> a bit of thought into it, but I indeed don't see a simple way of
> achieving that in a different way that the one you're proposing. The
> hack on @D is particularly tricky.

How about:

$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/%

$$($(2)_DIR)/%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
        $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
                $$($(2)_KCONFIG_OPTS) $$*
	...

Note that there's no need to actually create $$($(2)_DIR)/%, so it should
probably be declared PHONY too:

.PHONY: $$(addprefix $$($(2)_DIR)/,$$($(2)_KCONFIG_EDITORS))


 Of course, you will still need to call FIXUP_CONFIG twice, but really in make
there is no way to do things twice except by repeating them - make tries very
hard to do things only once.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
