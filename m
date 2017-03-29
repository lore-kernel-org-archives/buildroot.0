From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Mar 2017 08:43:32 +0200
Subject: [Buildroot] [PATCH 2/4] core: allow packages to declare a
 permission file
In-Reply-To: <56824752-a1bd-730a-b9f6-465eec832da7@mind.be>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490564623-26806-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <56824752-a1bd-730a-b9f6-465eec832da7@mind.be>
Message-ID: <0ae8c865-9540-2c3c-d2b4-e6a195179b59@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-03-17 00:12, Arnout Vandecappelle wrote:
[snip]
> define BUSYBOX_PERMISSIONS
> 	$(foreach app,$(shell \
> 		for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE"
> $(BUSYBOX_DIR)/include/applets.h \
> 			| sed -e 's/,.*//' -e 's/.*(//'`; \
> 		do \
> 			grep -w $${app} $(BUSYBOX_DIR)/busybox.links; \
> 		done #) ),$(app) f 4755 0  0 - - - - -$(sep))
> endef
> 
>  For that to work, the condition around PACKAGES_PERMISSIONS_TABLES += must be
> removed, but that's fine IMO (just adds a lot of empty lines to the device
> table, but that doesn't hurt). The #) is a bit ugly but I'm sure a better
> solution can be found.
> 
>  With that solution, patches 2 and 3 wouldn't be needed.

 And an even simpler approach would be to always run the installation commands
under fakeroot (with the -i -s options of course) That would simplify a lot of
things. But there are probably problems with that approach as well - e.g.
nothing should install/remove anything in target outside of the install-target step.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
