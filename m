From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 07:26:12 +0100
Subject: [Buildroot] [pkg-perl infra V6 4/9] host-perl-xml-parser:
 rename and refactor with perl infrastructure
In-Reply-To: <1392034997-12394-5-git-send-email-francois.perrad@gadz.org>
References: <1392034997-12394-1-git-send-email-francois.perrad@gadz.org>
 <1392034997-12394-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <52F9C284.6020601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 13:23, Francois Perrad wrote:
> Even though libxml-parser-perl had a Config.in file with an option to
> enable it on the target, this option was hidden by a dependency on
> BR2_HOST_ONLY. So in practice, it was not possible to enable
> libxml-parser-perl on the target. This allows us to rename
> libxml-parser-perl to perl-xml-parser to follow the new naming
> convention of Perl packages, without having to introduce
> Config.in.legacy material.

 Excellent commit message!

> 
> In addition to this rename, the package is converted to use the newly
> introduced Perl package infrastructure.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
> new file mode 100644
> index 0000000..40ded41
> --- /dev/null
> +++ b/package/perl-xml-parser/perl-xml-parser.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# perl-xml-parser
> +#
> +################################################################################
> +
> +PERL_XML_PARSER_VERSION = 2.41
> +PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
> +PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR/
> +PERL_XML_PARSER_DEPENDENCIES = expat
> +PERL_XML_PARSER_LICENSE = perl_5

 Thomas noted earlier that "perl_5" is not in our list of well-known
licenses. There are two options:

- extend the list of known licenses in the documentation with this perl_5
string;

- in the scancpan script, substitute perl_5 with "Artistic or GPLv1+".

 I prefer the latter.


 Regards,
 Arnout

> +
> +HOST_LIBXML_PARSER_PERL_CONF_OPT = \
> +	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
> +	EXPATINCPATH=$(HOST_DIR)/usr/include
> +
> +$(eval $(host-perl-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
