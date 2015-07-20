From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 20 Jul 2015 10:48:33 +0200
Subject: [Buildroot] [PATCHv2] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <55AC0AD8.7040703@mind.be>
References: <1437311728-31289-1-git-send-email-yann.morin.1998@free.fr>
 <55AC0AD8.7040703@mind.be>
Message-ID: <CAGduivw2ZpiUnn29WvTskPV9KD3YkjNu7+Nm5WCDcWwXgjLR_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-and-tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

On Sun, Jul 19, 2015 at 10:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/19/15 15:15, Yann E. MORIN wrote:
>> When a package has both a target and a host variants, and there is an
>> override-srcdir set for the target variant, the host variant should
>> inherit the target's override-srcdir, unless explicitly set, like we do
>> for all other target-variant properties.
>>
>> However, do not override it if expressly set to empty (i.e. when the
>> user wants to override only the target variant).
>>
>> Also, as we do for the other variables, the target variant never
>> inherits from the host variant.
>>
>> Reported-by: Mike <mikez@OpenPlayer.org>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>>
>> ---
>> Changes v1 -> v2:
>>   - really do not override the host variant if expressly set to empty
>>     (Arnout)
>> ---
>>  package/pkg-generic.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 75dc8b7..6a7d97e 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -340,6 +340,10 @@ else
>>  endif
>>  $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
>>
>> +ifdef $(3)_OVERRIDE_SRCDIR
>> +  $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>> +endif
>> +
>>  $(2)_BASE_NAME       =  $(1)-$$($(2)_VERSION)
>>  $(2)_DL_DIR  =  $$(DL_DIR)/$$($(2)_BASE_NAME)
>>  $(2)_DIR     =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
