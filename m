From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:11:47 +0200
Subject: [Buildroot] [PATCH 01/17] perl-cgi: add host
In-Reply-To: <20180811182749.20924-2-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-2-chrismcc@gmail.com>
Message-ID: <20180812141147.5942e27f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Sat, 11 Aug 2018 11:27:33 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/perl-cgi/perl-cgi.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
> index b8115de6ad..476f5f69c3 100644
> --- a/package/perl-cgi/perl-cgi.mk
> +++ b/package/perl-cgi/perl-cgi.mk
> @@ -8,7 +8,9 @@ PERL_CGI_VERSION = 4.38
>  PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
>  PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
>  PERL_CGI_DEPENDENCIES = perl-html-parser
> +HOST_PERL_CGI_DEPENDENCIES = host-perl-html-parser

host-perl-html-parser does not exist, until PATCH 02/17 of this series.
Therefore, the order of the patches in your series is not good, and the
series is not bisectable. If I apply only PATCH 01/17, things are
broken because host-perl-cgi-perl will try to build
host-perl-html-parser, which doesn't exist.

Please be careful when ordering the patches: they should be organized
in the correct order to make sure that everything builds at every point
of the series.

In this specific example, you should have the following order:

 (1) Introduce host-perl-html-tagset

 (2) Introduce host-perl-html-parser, which uses host-perl-html-tagset

 (3) Introduce host-perl-cgi, which uses host-perl-html-parser

Does that make sense ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
