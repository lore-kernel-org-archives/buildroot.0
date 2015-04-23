From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 22:14:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
In-Reply-To: <871078529.576418.1429788227635.JavaMail.zimbra@datacom.ind.br>
References: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
 <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
 <20150422224620.7abefdb2@free-electrons.com>
 <871078529.576418.1429788227635.JavaMail.zimbra@datacom.ind.br>
Message-ID: <553952BF.1040402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 13:23, Carlos Santos wrote:
>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: buildroot at buildroot.org
>> Sent: Wednesday, April 22, 2015 5:46:20 PM
>> Subject: Re: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
> 
>> Dear Carlos Santos,
>>
>> On Wed, 22 Apr 2015 17:29:28 -0300, Carlos Santos wrote:
>>
>>> -$(eval $(cmake-package))
>>> +$(eval $(autotools-package))
>>
>> I still don't understand. Fabio quoted the README of gtest, which says:
>>
>> """
>> The Autotools build script (configure + make) is no longer officially
>> supportted.  You are encouraged to migrate to your own build system or
>> use CMake.
>> """
>>
>> So why moving from using the supported CMake to the no-longer supported
>> autotools build system would be an improvement?
>>
>> This really needs more explanations.
> 
> I agree that using autotools is not the ideal approach but so I don't have a solution to generate the gtest-config script using CMake. I will spend some additional time on this today and submit and alternate patch if possible.

 I think it's fairly simple:

# gtest-config is only generated when gtest is built with autotools,
# so generate it manually here.
define GTEST_INSTALL_CONFIG
	sed 's/@PACKAGE_TARNAME@/gtest/;\
		s/@PACKAGE_VERSION@/$(GTEST_VERSION)/;\
		s/..../' \
		$(@D)/scripts/gtest-config.in \
		> $(STAGING_DIR)/usr/bin/gtest-config
endef
GTEST_POST_STAGING_INSTALL_HOOKS += GTEST_INSTALL_CONFIG

 Not tested, of course :-)

 In particular, I'm not sure if gtest-config gives the correct feedback when
gtest has been installed with cmake.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
