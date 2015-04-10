From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Apr 2015 23:31:01 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
 package/pkg-autotools.mk
In-Reply-To: <20150410141217.4bd2547c@free-electrons.com>
References: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150410141217.4bd2547c@free-electrons.com>
Message-ID: <55284115.40309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/04/15 14:12, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
> 
> On Fri, 10 Apr 2015 11:33:39 +0200, Bernd Kuhls wrote:
>> Hi,
>>
>> is there a reason an autotools-package should not depend on host-pkgconf?
>>
>> The phrase "host-pkgconf" appears in > 300 packages
>>
>> $ for i in `find -iname *.mk | grep -v pkgconf`; do grep host-pkgconf $i; 
>> done | wc -l
>> 313
>>
>> If 
>>
>> $(2)_DEPENDENCIES += host-pkgconf
>>
>> is added to package/pkg-autotools.mk we could get rid of all those 
>> dependencies in the packages and avoid nasty build errors in the future.
> 
> I think it has been discussed in the past, even though I don't remember
> the conclusion. On my side, since I don't like useless dependencies,
> but I recognize that we often forget to add host-pkgconf in the
> dependencies of a number of autotools packages, I made a proposal last
> year: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/82327.
> 
> It checks before building if the package uses PKG_CHECK_MODULES(), and
> verifies that the package properly depends on host-pkgconf in this case.

 I agree that something like that is the way to go.

 However, I would prefer that this kind of stuff:

- goes into scripts in the support/ directory;

- gets called from the GLOBAL_INSTRUMENTATION_HOOKS;

- is selectable with a config option in the Build options menu (which would be
enabled by the autobuilders).


 My reasoning is that the BR infrastructure is already pretty darn complicated,
so it would be good to separate the core infrastructure from the fringe stuff.
And the config option is of course because I prefer to keep the developer stuff
out of the way of normal users.


 Regards,
 Arnout


> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
