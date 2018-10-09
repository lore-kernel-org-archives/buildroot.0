From: Denis OSTERLAND <denis.osterland@diehl.com>
Date: Tue, 9 Oct 2018 09:20:09 +0000
Subject: [Buildroot] [PATCH] u-boot: add option to generate env image
 from default env
In-Reply-To: <cd9141ed-23e0-34ec-2cd2-dc926fe7497c@mind.be>
References: <20181002053526.11374-1-Denis.Osterland@diehl.com>
 <16db145d-edf3-787d-bb3c-3a50c340eb1c@mind.be>
 <1539068855.6269.16.camel@diehl.com>
 <cd9141ed-23e0-34ec-2cd2-dc926fe7497c@mind.be>
Message-ID: <1539076809.6269.30.camel@diehl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Dienstag, den 09.10.2018, 10:01 +0200 schrieb Arnout Vandecappelle:
> 
> On 9/10/18 09:07, Denis OSTERLAND wrote:
> > 
> > pro:
> > ?- clear on first look (not required to read help first)
> ?This is a valid point.
> 
> > 
> > ?- easier to extend (add other sources in future)
> ?Hm, there is something to be said for this point as well. It might be possible
> that U-Boot will start shipping internal environment fragments.
> 
> ?However, in that case, I think we would really want to add an additional list
> of internal sources, again without an option to control enabling it.
> 
> > 
> > ?- keeps current behavior (failed to build, if only BR2_TARGET_UBOOT_ENVIMAGE is selected)
> ?This is really not important.
> 
> 
> > 
> > I think it is not very likely that other sources were implemented.
> > Maybe it would be nice to just tick BR2_TARGET_UBOOT_ENVIMAGE and
> > empty default of SOURCE will lead to default env.
> > 
> > What do you think?
> ?That is indeed what I meant.
so... you vote for empty list?

What about this?
? ? ? ? $(if $(BR2_TARGET_UBOOT_ENVIMAGE_DEFAULT), \
????????CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D), \
????????echo "") | cat - $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
????????????????>$(@D)/buildroot-env.txt

Introduce a bool DEFAULT to enable read of compiled in env
and concatenate it with the files from SOURCES list.
> 
> ?Regards,
> ?Arnout
> 
Regards Denis

Diehl Connectivity Solutions GmbH
Gesch?ftsf?hrung: Horst Leonberger
Sitz der Gesellschaft: N?rnberg - Registergericht: Amtsgericht
N?rnberg: HRB 32315
___________________________________________________________________________________________________

Der Inhalt der vorstehenden E-Mail ist nicht rechtlich bindend. Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informationen.
Informieren Sie uns bitte, wenn Sie diese E-Mail faelschlicherweise erhalten haben. Bitte loeschen Sie in diesem Fall die Nachricht.
Jede unerlaubte Form der Reproduktion, Bekanntgabe, Aenderung, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt.
The contents of the above mentioned e-mail is not legally binding. This e-mail contains confidential and/or legally protected information. Please inform us if you have received this e-mail by
mistake and delete it in such a case. Each unauthorized reproduction, disclosure, alteration, distribution and/or publication of this e-mail is strictly prohibited. 
