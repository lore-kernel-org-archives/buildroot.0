From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 6 Apr 2017 13:47:11 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
Message-ID: <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

> Gesendet: Donnerstag, 06. April 2017 um 12:57 Uhr
> Von: "Arnout Vandecappelle" <arnout@mind.be>
> An: "Buildroot Mailing List" <buildroot@buildroot.org>, "Peter Seiderer" <ps.report@gmx.net>, "Ga?l PORTAY" <gael.portay@savoirfairelinux.com>, "Julien Corjon" <corjon.j@ecagroup.com>
> Betreff: Qt5 build failure (beaglebone_qt5_defconfig)
>
>  Hi Qt5 specialists,
> 
>  For quite some time now (basically since the 5.8.0 bump I think),
> beaglebone_qt5_defconfig has been failing [1]. The error is:
> 
> cd photoviewer/ && ( test -e Makefile ||
> /builds/buildroot.org/buildroot/output/host/usr/bin/qmake -o Makefile
> /builds/buildroot.org/buildroot/output/build/qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
> ) && /usr/bin/make -f Makefile
> Project ERROR: Unknown module(s) in QT: widgets
> 
>  Probably some missing Config.in dependency, or else a missing exclusion of
> demos that require widgets.
> 
>  Can someone take a look?
> 

Untested but maybe the following works:

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 853322c..5e0fbe2 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
        select BR2_PACKAGE_QT5XMLPATTERNS
        select BR2_PACKAGE_QT5BASE
        select BR2_PACKAGE_QT5BASE_GUI
+       select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5BASE_EXAMPLES
        depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
        help
          Qt is a cross-platform application and UI framework for

Regards,
Peter

>  Regards,
>  Arnout
> 
> 
> 
> [1] https://gitlab.com/buildroot.org/buildroot/builds/13476094
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
