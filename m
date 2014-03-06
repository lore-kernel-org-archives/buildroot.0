From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 07 Mar 2014 00:32:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] imagemagick: disable documentation
In-Reply-To: <5316C2DD.5070507@mind.be>
References: <1393796026-21985-1-git-send-email-romain.naour@openwide.fr>
 <5316C2DD.5070507@mind.be>
Message-ID: <53190585.7020006@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All
Le 05/03/2014 07:23, Arnout Vandecappelle a ?crit :
> ++docdir = $(DOCUMENTATION_PATH)
> ++
> + # Manual pages to install
> ++if INSTALL_DOC
> + man_MANS = \
> + 	$(MAGICK_MANS) \
> + 	$(WAND_MANS) \
> + 	$(MAGICKPP_MANS) \
> + 	$(UTILITIES_MANS)
> +
> +-# Architecture independent data files installed in the package's data directory
> +-docdir = $(DOCUMENTATION_PATH)
> + doc_DATA = \
> + 	LICENSE \
> + 	ChangeLog \
> + 	NEWS.txt
> ++else
> ++man_MANS =
> ++doc_DATA =
>   I believe the else is unnecessary, no?
Yes indeed.
>> ++endif
>> +
>> + if MAINTAINER_MODE
>> + MAINTAINER_TARGETS = \
>> +@@ -236,7 +242,13 @@ pkgdocdir = $(DOCUMENTATION_PATH)
>> + DOCDIRSDOXYGEN = www/api/MagickCore www/api/MagickWand
>> + DOCDIRSMANUAL = images images/patterns www www/api www/source www/Magick++
>> + DOCDIRS= $(DOCDIRSMANUAL) $(DOCDIRSDOXYGEN)
>> ++
>> ++if INSTALL_DOC
>> + HTML_INSTALL_DATA_TARGETS = install-data-html
>> ++else !INSTALL_DOC
>> ++HTML_INSTALL_DATA_TARGETS =
>> ++endif !INSTALL_DOC
>> ++
>> + install-data-html:
>> + 	$(mkinstalldirs) $(DESTDIR)$(pkgdocdir)
>> + 	$(INSTALL_DATA) $(srcdir)/index.html $(DESTDIR)$(pkgdocdir)
>> +diff --git a/configure.ac b/configure.ac
>> +index 445bccf..a2b5d0e 100755
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -3173,6 +3173,14 @@ esac
>> + AC_DEFINE_UNQUOTED(DOCUMENTATION_PATH,"$DEFINE_DOCUMENTATION_PATH",[Directory where ImageMagick documents live.])
>> + AC_SUBST(DOCUMENTATION_PATH)
>> +
>> ++#
>> ++# Enable/Disable documentation
>> ++AC_ARG_ENABLE([docs],
>> ++  [AS_HELP_STRING([--disable-docs],
>> ++    [disable building of documentation])],
>> ++  wantdocs=$enableval, wantdocs=detect)
>   I think the wantdocs=detect is unneeded (there is no autodetection
> possible here...).
Yes
>> ++AM_CONDITIONAL([INSTALL_DOC], [test "$wantdocs" = "xyes"])
>> ++
And here the test is always false...

Thanks Arnout for your review :)

Best regards,
Romain
