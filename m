From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 23:05:26 +0200
Subject: [Buildroot] Advice needed: Problem with clashing make variables
 in pkg-generic.mk when building perl-xml-sax package.
In-Reply-To: <DB5PR0701MB1992E58350C8DE5036F4DA61E0460@DB5PR0701MB1992.eurprd07.prod.outlook.com>
References: <DB5PR0701MB1992E58350C8DE5036F4DA61E0460@DB5PR0701MB1992.eurprd07.prod.outlook.com>
Message-ID: <5106c5c9-62e9-494c-76d8-2bbee56a34e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 16:41, Barbarien, Joeri (Nokia - BE/Antwerp) wrote:
> Hello all,
> 
> When building perl-xml-sax (and its dependency perl-xml-sax-base) I noticed something strange in output/build/packages-file-list.txt:
[snip]
> The files that are listed for perl-xml-sax-0.99 are actually those built by perl-xml-sax-base
> 
> This is due to a clash of make variables in package/pkg-generic.mk:
> 
> $(2)_BASE_NAME  = $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
> $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> $(2)_DL_DIR =  $$(DL_DIR)
> $(2)_DIR  =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
> 
> Due to the unfortunate naming of the packages,
> 
> $($(2)_BASE_NAME) for perl-xml-sax clashes with as $($(2)_NAME) for perl-xml-sax-base, leading to this wrong behavior.

 Wow, good catch! Incredible that this works at all...

> 
> I made a quick fix by renaming the _BASE_NAME suffix to _BR_BASE_NAME but perhaps a more comprehensive / cleaner solution is preferred.
> 
> Could you please advise on how this should be "properly" fixed? Some fast ideas:
> 
> 1) Make sure common part of suffixes is in the front, e.g. _NAME, _NAME_BASE, _NAME_BASE_RAW

 I guess that this reduces the risk, but there is still a possibility of
conflicts, no?

> 2) Use lowercase for internal suffixes so they cannot clash with by construction uppercase $(PKG)

 That would work. Or the reverse, that $(PKG) is lower case. But that is a
*huge* change to Buildroot, with changes to every package. It is not going to
happen. Note that for the complete solution, it is not only for internal
suffixes, but also for some that are set outside the infrastructure. E.g. the
_OVERRIDE_SRCDIR of package foo conflicts with the _SRCDIR of package foo-override.

> 3) A check on allowed package names ensuring clashes cannot happen

 That would be really good, but complicated because there are a lot of variables
to check. And when new variables are introduced, we have to remember to add them
to the list. Also it doesn't solve the problem with perl-xml-sax, we'd still
have to e.g. rename the perl-xml-sax-base package.

 I think that your first idea is probably the best one.

 I've done a quick check: there are 142 variables with 2 underscores used in all
the package infras (only the ones with two underscores run this risk). You can
get these with

grep -h -o ')\(_[A-Z0-9]*\)\{2,10\}' package/pkg*.mk | sort -u

 I got the following to find conflicts, but I'm not sure it is complete:

for i in $(grep -h -o ')\(_[A-Z0-9]*\)\{2,10\}' package/pkg*.mk | \
           sed s/.*_// | \
           sort -u); do \
  grep -q ")_$i\>" package/pkg*.mk && echo "$i"; \
done

 That comes up with the following potential conflicts:

_DEPENDENCIES with _FINAL_DEPENDENCIES, _FINAL_ALL_DEPENDENCIES,
_FINAL_PATCH_DEPENDENCIES

_DIR with _DEPS_DIR, _DL_DIR, _REBAR_DEPS_DIR, _REDIST_SOURCES_DIR

_ENV with _AUTORECONF_ENV, _BASE_ENV, _CONFIGURATOR_MAKE_ENV, _CONF_ENV,
_MAKE_ENV, and _REBAR_ENV. Impressive that we didn't hit this one yet :-)

_MAKE with _KCONFIG_MAKE

_NAME with _BASE_NAME and _RAW_BASE_NAME

_PATCH with _TARGET_PATH and _LIBTOOL_PATCH

_REBAR with _USE_BUNDLED_REBAR

_SITE with _ACTUAL_SOURCE_SITE

_SOURCE with _TARGET_ACTUAL_SOURCE and _TARGET_SOURCE

_SRCDIR with _OVERRIDE_SRCDIR

_TYPE with _SETUP_TYPE

_VERSION with _DL_VERSION

_WAF with _NEEDS_EXTERNAL_WAF


 Quite an impressive list...


 I really don't know how we're going to tackle this... Does anyone have an
innovative idea?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
