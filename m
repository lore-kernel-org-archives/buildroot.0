From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Mar 2016 23:32:52 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <20160319233342.GI3426@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
 <20160319152307.765e1bad@free-electrons.com> <56ED7967.8050200@mind.be>
 <20160319233342.GI3426@free.fr>
Message-ID: <56F1C814.6080308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 00:33, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-03-19 17:08 +0100, Arnout Vandecappelle spake thusly:
[snip]
>>   However, I do wonder if it makes sense to have a make function for it if
>> there already is a shell script. We don't do that for apply-patches, so why
>> would we do it for this one?
>
> As explained in the ocmmit log:
>      We still keep the make macro, as it is easier to [call],

  I honestly don't see why it is easier to call...

# Save the source tarball
	$$(Q)$$(HARDLINK_OR_COPY) \
		$$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
		$$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))


# Save patches and generate the series file
	$$(Q)while read f; do \
		$$(HARDLINK_OR_COPY) $$$${f} $$($(2)_REDIST_SOURCES_DIR) \
			|| exit 1; \
		printf "%s\n" "$$$${f##*/}">>$$($(2)_REDIST_SOURCES_DIR)/series\
			|| exit 1; \
	done <$$($(2)_DIR)/.applied_patches_list


 > and allows
 >      to $(strip) its arguments in a convenient fashion.

  Why is this needed?

>
> Note: I now use "call" when the commit log used "write". What is easier
> is not to write the macro (well, it is, but that was not the point of
> that sentence), but writing code that calls the macro.
>
> Also, I think it is better to have callers call a make macro, even if
> backe by a shell script. It is more "in-line" with how we do other
> stuff, like the github helper. Our helpers are make macros, it is more
> homogeneous.

  $(call ...) is ugly, there is no way you're going to convince me it's better 
than simply calling a shell script. Oh, and the github helper should go :-)

  Regards,
  Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
