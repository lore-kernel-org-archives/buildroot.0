From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 16 Jul 2014 19:42:11 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <53C61864.4080003@mind.be>
References: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
 <53C61864.4080003@mind.be>
Message-ID: <CAB0FRss71Yq479qyc02bZXx+fvtVCXkFwAC0k0JLkeQxFuK7iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-07-16 8:15 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Yann, Francois,
>
> On 15/07/14 01:48, Yann E. MORIN wrote:
>> From: Francois Perrad <fperrad@gmail.com>
>>
>> When TARGET_LDFLAGS contains more than one option, the generated
>> Makefile contains this definition of LDDLFLAGS:
>>         LDDLFLAGS = '--option-1 --option-2'
>>
>> Which when passed to gcc is interpreted as a single option, and gcc
>> (rightfully) barfs on it, like with:
>>         arm-linux-gnueabihf-gcc: error: unrecognized command line
>>         option ?-shared -g?
>>
>> This is because perl-net-ssleay's buildsystem is really completely
>> brain-damaged. Other perl extensions do not behave like that, and
>> instead are doing the only same thing to do: not add single quotes
>> around the definition, and just use what they were provided for
>> lddlflags.
>>
>> So, just do the same for perl-net-ssleay. Since tweaking (yet once
>> more) their buildsystem is too complex, we just use a post-configure
>> hook to fix up the mess, by removing single quotes around the definition
>> of LDDLFLAGS.
>
>  Are you sure that it is only perl-net-ssleay that is broken in this way, and
> not perl-xml-libxml?
>
>  I tried to run (without this patch)
>
> make perl-net-ssleay BR2_TARGET_LDFLAGS=-g
>
> and that worked just fine. So I suspect the problem is in the system's MakeMaker
> package, and not in perl-net-ssleay itself. If that is the case, you should see
> the same problem for perl-xml-libxml (because it also uses the LDDLFLAGS, while
> other packages don't because they don't build any C code).
>
>  I'm not sure what the real solution would be. Perhaps add a host-perl-makemaker
> package and depend on that?
>

Net-SSLeay has a Makefile.PL, but it doesn't use to run the classic
ExtUtils-MakeMaker,
it runs a local copy of Module-Install, see in inc/

Fran?ois

>  Regards,
>  Arnout
>
>
>>
>> Note: if only one option is specified, no single quotes are added,
>> but out hook is a no-op in this case.
>>
>> See also:
>>     http://lists.busybox.net/pipermail/buildroot/2014-July/101782.html
>> and the previous message for even more entertainment. ;-)
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> [me: find the real cause of the issue, tweak the sed expression to not
>>  force -shared and instead just trim the single quotes, enhance commit
>>  log]
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> ---
>>  package/perl-net-ssleay/perl-net-ssleay.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
>> index 4a362fb..6b21eb2 100644
>> --- a/package/perl-net-ssleay/perl-net-ssleay.mk
>> +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
>> @@ -15,4 +15,9 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
>>  # suffers from: don't search for openssl, they pick the host-system one.
>>  PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
>>
>> +define PERL_NET_SSLEAY_FIX_MAKEFILE
>> +     $(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
>> +endef
>> +PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
>> +
>>  $(eval $(perl-package))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
