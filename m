From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 11 Aug 2020 23:26:18 +0200
Subject: [Buildroot] [PATCH v1] package/qt5webengine: examples need
 qt5svg
In-Reply-To: <20200811212852.387f7769@windsurf.home>
References: <20200810203841.26171-1-ps.report@gmx.net>
 <20200811203155.76632009@gmx.net>
 <20200811212852.387f7769@windsurf.home>
Message-ID: <20200811232618.445b47da@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, *,

On Tue, 11 Aug 2020 21:28:52 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> +Yann in Cc for Kconfig expertise.
>
> On Tue, 11 Aug 2020 20:31:55 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > package/qt5/qt5base/Config.in:1:error: recursive dependency detected!
> > package/qt5/qt5base/Config.in:1:	symbol BR2_PACKAGE_QT5BASE is selected by BR2_PACKAGE_QT5SVG
>
> Right, this makes sense.
>
> > package/qt5/qt5svg/Config.in:1:	symbol BR2_PACKAGE_QT5SVG is selected by BR2_PACKAGE_QT5BASE_EXAMPLES
>
> This doesn't make any sense to me:
>
> config BR2_PACKAGE_QT5BASE_EXAMPLES
>         bool "Compile and install examples (with code)"
>         select BR2_PACKAGE_QT5BASE_NETWORK
>         select BR2_PACKAGE_QT5BASE_XML
>         help
>           If unsure, say N.
>
> Neither BR2_PACKAGE_QT5BASE_NETWORK nor BR2_PACKAGE_QT5BASE_XML are
> selecting BR2_PACKAGE_QT5SVG.
>
> Or perhaps it is the line added by your patch:
>
> 	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5BASE_EXAMPLES
>
> which causes this statement ?
>
> > package/qt5/qt5base/Config.in:42:	symbol BR2_PACKAGE_QT5BASE_EXAMPLES depends on BR2_PACKAGE_QT5BASE
>
> This obviously makes sense.

One option to break the recursive dependency is to delete the
redundant 'select BR2_PACKAGE_QT5BASE' from all packages already
depending/selecting BR2_PACKAGE_QT5, see v2 of suggested patch...

Regards,
Peter

>
> > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > subsection "Kconfig recursive dependency limitations"
> >
> > Regards,
> > Peter
> >
>
>
>
