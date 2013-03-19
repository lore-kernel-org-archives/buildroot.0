From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 19 Mar 2013 23:07:27 +0100
Subject: [Buildroot] [PATCH v4 08/21] qt5base: install bundled fonts to
 target
In-Reply-To: <87obefrrq1.fsf@dell.be.48ers.dk>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <87obefrrq1.fsf@dell.be.48ers.dk>
Message-ID: <5148E19F.7030501@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2013 10:43 PM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>   Thomas> From: Floris Bos <bos@je-eigen-domein.nl>
>   Thomas> If not using font-config, Qt 5 offers a set of standard fonts to
>   Thomas> use instead. Install these to target.
>
> Should that then only happen if !BR2_PACKAGE_QT5BASE_FONTCONFIG?

Could add a check to only execute QT5BASE_INSTALL_TARGET_FONTS if 
!BR2_PACKAGE_QT5BASE_FONTCONFIG, if that looks cleaner.

But the standard Qt build script already causes that:

==
mkspecs/features/qpa/genericunixfontdatabase.prf

CONFIG += qpa/basicunixfontdatabase
contains(QT_CONFIG, fontconfig) {
     DEFINES += Q_FONTCONFIGDATABASE
     LIBS += -lfontconfig
} else {
     fonts.path = $$[QT_INSTALL_LIBS]/fonts
     fonts.files = $$QT_SOURCE_TREE/lib/fonts/*
     INSTALLS += fonts
}
==

If fonts are not installed to staging (by INSTALLS += fonts), they are 
not copied to target either.

-- 
Yours sincerely,

Floris Bos
