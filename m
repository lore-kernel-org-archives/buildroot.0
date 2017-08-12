From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 22:55:00 +0200
Subject: [Buildroot] [PATCH v6 0/3] Qt WebEngine support
In-Reply-To: <20170812154651.riivua2uz4gfsybf@gportay>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811212937.62d819fc@tux.kirchner> <20170811223048.0c445573@windsurf>
 <20170812094839.70a0c4b1@tux.kirchner> <20170812095737.58da25f5@windsurf>
 <20170812150813.ondf3yfcsjcg5443@gportay>
 <8c8fd01f-12eb-f91f-2316-294286a2f5aa@mind.be>
 <20170812154651.riivua2uz4gfsybf@gportay>
Message-ID: <4aeb0bc9-3503-c09f-c9cb-ec0507ae96cd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-17 17:46, Ga?l PORTAY wrote:
> Concerning dbus and fontconfig packages. They are selected through qt5base
> configs (BR2_PACKAGE_QT5BASE_FONTCONFIG and BR2_PACKAGE_QT5BASE_DBUS).
> 
> Do they also be a part of QT5WEBENGINE_DEPENDENCIES? or adding qt5base is safe.

 If it is calling functions from fontconfig and dbus directly, then it's better
to also add fontconfig and dbus both to Config.in and qt5webengine.mk. That way,
if later the dependency on BR2_PACKAGE_QT5BASE_FONTCONFIG becomes optional, the
build doesn't break. But in this case it's not a very strict rule, since such
breakage would be limited to a change in the qt5webengine package itself.

 It's a different story for host-pkgconf. That one is "not really needed"
because qt5base already depends on it. But if qt5base would somehow loose its
dependency on host-pkgconf, then suddenly the "unrelated" qt5webengine package
would break. That's something we really want to avoid.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
