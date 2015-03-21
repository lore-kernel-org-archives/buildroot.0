From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 15:57:24 +0100
Subject: [Buildroot] [PATCH 1/5] kconfig-package: add support for config
 fragments
In-Reply-To: <20150320231117.GE3979@free.fr>
References: <1424003638-21689-1-git-send-email-bos@je-eigen-domein.nl>
 <20150320231117.GE3979@free.fr>
Message-ID: <550D86D4.7060808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 00:11, Yann E. MORIN wrote:
> Floris, All,
> 
> On 2015-02-15 13:33 +0100, Floris Bos spake thusly:
>> Adds functionality to the kconfig infrastructure to merge additional
>> configuration fragment files to the main configuration file of
>> kconfig packages, using support/kconfig/merge_config.sh
>>
>> Typical use-case is when you want your configuration to be
>> kept in sync with an upstream (def)config file, but do require
>> some minor local modifications.
>>
>> Disables -update-config and -update-defconfig targets when
>> fragment files are set.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>> ---
[snip]
>> @@ -87,6 +89,8 @@ $(1)-savedefconfig: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>>  # Even though we could use 'cp --preserve-timestamps' here, the separate
>>  # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
>>  $(1)-update-config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
>> +	$$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
>> +		$$(error Unable to perform $(1)-update-config when fragment files are set))
> 
> $(error ...) is Makefile syntax, while this is a shell. I'd prefer we
> use a shell construct here, like:
> 
>     $$(if $$($(2)_KCONFIG_FRAGMENT_FILES), \
>         echo "Unable to perform $(1)-update-config when fragment files are set"; exit 1)

 Or perhaps it's better to simply disable the update targets when fragments are set:

# Cannot update (def)config with fragments
ifneq ($$($(2)_KCONFIG_FRAGMENT_FILES),)
$(1)-update-config: ...
...
endif

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
