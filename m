From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 24 Jan 2018 23:28:26 +0100
Subject: [Buildroot] Qt4 - Qt5 Config anomaly
Message-ID: <0e4d1d30-bdec-7ba0-5df4-9a719f5ee4f9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I'm looking into this autobuild error:

http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e/

where the qjson build fails because the moc_* files are generated with
an old version of moc.
It turned out that Qt4 and Qt5 are both enabled in this autobuild
config, and Qt4 is being built second, so it overwrites moc and qmake in
the host dir.
I remembered that Qt4 at Qt5 used to be mutually exclusive (by setting
"depends on !BR2_PACKAGE_QT" in package/qt5/Config.in) so I looked
further and it turned that BR2_PACKAGE_QT5 is enabled because
BR2_PACKAGE_PINENTRY_QT5 is enabled and it selects BR2_PACKAGE_QT5.

What is the preferred way to fix this?

a) Add also the "depends !BR2_PACKAGE_QT" guard to the
BR2_PACKAGE_PINENTRY_QT5 config entry?

b) Inverse the dependency and enable BR2_PACKAGE_PINENTRY_QT5 only if
BR2_PACKAGE_QT5 was enabled, rather then letting
BR2_PACKAGE_PINENTRY_QT5 select BR2_PACKAGE_QT5). (and same logic for
BR2_PACKAGE_PINENTRY_QT4)

c) other?


I would vote for option b) as it would be more consistent with the other
Qt based packages' (like qtjson itself) config, but wanted to ask before
sending in a patch.

Thanks, regards
-- 
Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180124/187b6988/attachment.asc>
