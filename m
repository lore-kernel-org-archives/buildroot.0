From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 07:07:33 -0300
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <20120312084645.17cea210@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
 <20120312084645.17cea210@skate>
Message-ID: <3abaf8436d672008511fb62b235ffdd1@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-12 04:46, Thomas Petazzoni wrote:

> Hello,
>
> Le Sun, 11 Mar 2012 22:58:50 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> -LIBXML_PARSER_PERL_DEPENDENCIES = expat
>> +LIBXML_PARSER_PERL_VERSION = 2.36
>> +LIBXML_PARSER_PERL_SOURCE =
>> XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
>> +LIBXML_PARSER_PERL_SITE = 
>> http://www.cpan.org/modules/by-module/XML/
>> +LIBXML_PARSER_PERL_DEPENDENCIES = expat host-microperl
>>  define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
>>   (cd $(@D) ; \
>> -   perl Makefile.PL \
>> +   $(HOST_DIR)/usr/bin/perl Makefile.PL \
>
> Unless there is a strong reason to do, I would prefer this change not
> to go in. Buildroot has Perl amongst its mandatory dependencies
> (see support/dependencies/dependencies.sh), so I'd prefer if we used
> the Perl interpreter available on the host machine rather than 
> building
> our own. This will add quite a bit of build time, that apparently we
> can avoid since we have been doing that for quite some time now.
>
> Is there a good reason to switch to our own Perl built for the host?
>
> Best regards,
>
> Thomas

The big issue right now is that the new host-microperl installs a real 
perl in $(HOST_DIR)/usr/bin and PATH precedence makes it win over any 
other perl installed on the system.
So there are two solutions, either rename it to some other thing or 
make it work as a host tool.
The solution i approached was making it work as host with the patches 
i've sent.
Otherwise renaming it would be somewhat simple and we could just kill 
the libxml-parser-perl package since it has no reason to exist being 
host-only.
Most of the packages that require intltool are somewhat big in 
dependencies and build time anyway (pulseaudio, gtk2-engines, 
x11r7/xkeyboard-config, gmpc, midori) with the exception of 
shared-mime-info and avahi.
As for reasons, other than dropping the distro-installed perl 
dependency and, in the future when/if we get CPAN modules we'd have a 
conflict of distro module vs. host (as in host package) module given the 
original purpose of libxml-parser-perl if we wanted to implement 
some/all host-variant modules for some future reason.
Also libxml-parser-perl should be named something closer to the 
upstream name XML::Parser
Regards.
