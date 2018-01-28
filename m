From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 28 Jan 2018 23:27:05 +0100
Subject: [Buildroot] Qt4 - Qt5 Config anomaly
In-Reply-To: <0e4d1d30-bdec-7ba0-5df4-9a719f5ee4f9@gmail.com>
References: <0e4d1d30-bdec-7ba0-5df4-9a719f5ee4f9@gmail.com>
Message-ID: <88976205-6a29-964d-a692-bcc09a4ff8d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-01-18 23:28, Zoltan Gyarmati wrote:
> Dear All,
> 
> I'm looking into this autobuild error:
> 
> http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e/
> 
> where the qjson build fails because the moc_* files are generated with
> an old version of moc.
> It turned out that Qt4 and Qt5 are both enabled in this autobuild
> config, and Qt4 is being built second, so it overwrites moc and qmake in
> the host dir.
> I remembered that Qt4 at Qt5 used to be mutually exclusive (by setting
> "depends on !BR2_PACKAGE_QT" in package/qt5/Config.in) so I looked
> further and it turned that BR2_PACKAGE_QT5 is enabled because
> BR2_PACKAGE_PINENTRY_QT5 is enabled and it selects BR2_PACKAGE_QT5.
> 
> What is the preferred way to fix this?
> 
> a) Add also the "depends !BR2_PACKAGE_QT" guard to the
> BR2_PACKAGE_PINENTRY_QT5 config entry?

 That indeed would be the proper thing to do.


> b) Inverse the dependency and enable BR2_PACKAGE_PINENTRY_QT5 only if
> BR2_PACKAGE_QT5 was enabled, rather then letting
> BR2_PACKAGE_PINENTRY_QT5 select BR2_PACKAGE_QT5). (and same logic for
> BR2_PACKAGE_PINENTRY_QT4)

 I guess here select was chosen rather than depends because you need to be able
to choose one of them, so for one of them you want to have a select. Anyway
there are other packages using qt4/5 that use select.


 Regards,
 Arnout

> 
> c) other?
> 
> 
> I would vote for option b) as it would be more consistent with the other
> Qt based packages' (like qtjson itself) config, but wanted to ask before
> sending in a patch.
> 
> Thanks, regards
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
