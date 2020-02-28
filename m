From: yann.morin at orange.com <yann.morin@orange.com>
Date: Fri, 28 Feb 2020 16:28:44 +0100
Subject: [Buildroot] [PATCH] package/qt5tools: hide qdoc with llvm
 dependencies
In-Reply-To: <5e0c3453-1cd6-a4e4-3058-d1175fa903f5@smile.fr>
References: <25605_1582898461_5E591D1D_25605_345_8_0fa6a8d4-31d0-445b-acea-f425422d14ef@OPEXCAUBMA2.corporate.adroot.infra.ftgroup>
 <5e0c3453-1cd6-a4e4-3058-d1175fa903f5@smile.fr>
Message-ID: <17221_1582903725_5E5931AD_17221_356_11_20200228152844.GH13369@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-02-28 16:16 +0100, Romain Naour spake thusly:
> Le 28/02/2020 ? 15:00, yann.morin at orange.com a ?crit?:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > 
> > Building qdoc requires a llvm and clang for the host.
> > 
> > However, there is a limitation in the llvm and clang packages in
> > Buildroot, which makes it impossible to havea  host variant without
> 
> s/havea/have a/
> 
> > a target variant.
> > 
> > So, propagate the dependencies of the target llvm and clang, to ensure
> > we can only have a host-llvm and -clang packages that are correctly
> host-clang

That was done on purpose, and is called an ellipsis. ;-]

Regards,
Yann E. MORIN.

> > built.
> > 
> > Note that we do propagate all of the dependencies (instead of just the
> > architecture part), to be consistent.
> > 
> > Reported-by: Romain Naour <romain.naour@smile.fr>
> > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Peter Seiderer <ps.report@gmx.net>
> > Cc: Julien Corjon <corjon.j@ecagroup.com>
> > ---
> >  package/qt5/qt5tools/Config.in | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> > index 14178abc29..60106c1ee3 100644
> > --- a/package/qt5/qt5tools/Config.in
> > +++ b/package/qt5/qt5tools/Config.in
> > @@ -19,6 +19,16 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
> >  
> >  config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
> >  	bool "qdoc host tool"
> > +	# Needs llvm-config and libclang for the host, which is not
> > +	# currently supported in Buildroot, unless the target is
> > +	# already supported by llvm.
> > +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # llvm, clang
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
> > +	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
> > +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
> > +	depends on !BR2_STATIC_LIBS # llvm, clang
> > +	depends on BR2_USE_WCHAR # llvm, clang
> >  	help
> >  	  This option enables the qdoc host tool.
> >  
> > 
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> 
> Best regards,
> Romain
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
