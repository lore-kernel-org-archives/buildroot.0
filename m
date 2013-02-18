From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 18 Feb 2013 17:45:12 +0200
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <512249D5.5020107@mind.be>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
Message-ID: <51224C88.4020108@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout !

18.2.2013 17:33, Arnout Vandecappelle kirjoitti:
> On 18/02/13 14:49, Stefan Fr?berg wrote:
>> Could someone show me how to make a multi-choice menu with kconfig
>> language with the ability to select
>> several menu entries and then storing those values as a space separated
>> string variable.
>>
>> Let's say I have the following locales:
>>
>> af
>> ak
>> ar
>> as
>> ast
>> etc .... bazillion other locale values
>>
>> and I would like to be able to select as many of those locales I want.
>> Let's say I select locales "ak" and "ast" and then store them in a
>> variable like BR2_PACKAGE_FOO_LOCALES so that it would look like
>>
>> BR2_PACKAGE_FOO_LOCALES = "ak ast"
>>
>> how to do that in the least amount of typing ?
>
>  I don't think that's possible. You have no other option than to make
> a bunch of bool options, and convert them to strings in the .mk file.
>
> Config.in:
> config BR2_PACKAGE_FOO_LOCALE_AF
>     bool "af"
>
> config BR2_PACKAGE_FOO_LOCALE_AK
>     bool "ak"
>
> foo.mk:
> FOO_LOCALE += $(if $(BR2_PACKAGE_FOO_LOCALE_AF),af)
> FOO_LOCALE += $(if $(BR2_PACKAGE_FOO_LOCALE_AK),ak)
>

Damn...

>
>  Obviously you could write a script to generate all this. But I doubt
> we want to have it in the first place. In particular for locales, the
> BR2_ENABLE_LOCALE_WHITELIST fits our needs. And having a list of
> locales as a string isn't too user-unfriendly.
>
>  If this is for the iso-codes package: the locales stuff is already
> covered by the generic options. I don't know what Thomas was going on
> about, because most of the 14MB gets removed again in the finalize
> step...
>

Yes. I was exactly going to use that for iso-codes package.
In gentoo ebuild file for iso-codes they have something like this:

local linguas_bak=${LINGUAS}
local mylinguas=""
    
for norm in iso_15924 iso_3166 iso_3166_2 iso_4217 iso_639 iso_639_3; do
     einfo "Preparing ${norm}"
    
     mylinguas=""
     LINGUAS=${linguas_bak}
     strip-linguas -i "${S}/${norm}"
    
     for loc in ${LINGUAS}; do
         mylinguas="${mylinguas} ${loc}.po"
         done
    
         if [ -n "${mylinguas}" ]; then
             sed -e "s:pofiles =.*:pofiles = ${mylinguas}:" \
             -e "s:mofiles =.*:mofiles = ${mylinguas//.po/.mo}:" \
             -i "${S}/${norm}/Makefile.am" "${S}/${norm}/Makefile.in" \
             || die "sed in ${norm} folder failed"
         fi
done

And that ${LINGUAS} variable in Gentoo is just a space separated list of
locales that user wants to support.

So that buildroot BR2_ENABLE_LOCALE_WHITELIST variable seems to do the
exactly same thing as gentoo's ${LINGUAS} variable ?
Just put the locales you want to keep and everything else is removed at
the final step of finishing rootfs ?

It would be perfect :-)

>  The only thing that perhaps could be made optional is the
> installation of the xml files.
>
>  Regards,
>  Arnout
>

Regards
Stefan
