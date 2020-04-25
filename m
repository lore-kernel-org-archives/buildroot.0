From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2020 23:59:11 +0200
Subject: [Buildroot] [PATCH v3] core/legal-info: Generate web page with
 minimal legal info
In-Reply-To: <20191030161748.473671-1-mickael.tansorier@smile.fr>
References: <20191030161748.473671-1-mickael.tansorier@smile.fr>
Message-ID: <20200425215911.GU5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micka?l, All,

On 2019-10-30 17:17 +0100, Micka?l Tansorier spake thusly:
> Html page is generate by python script in `support/scripts/web-legal-info`.
> This script is called from Makefile at end of `legal-info` command.
> Output is `index.html` in legal-info subdirectory.
> This page contain informations about:
>  - buildroot config
>  - target packages: package name, version, licenses and sources
>  - host packages: package name, version, licenses and sources
> 
> This script need `legal-info` output path in arguments and it need files:
>   - `manifest.csv`
>   - `host-manifest.csv`
> `index.html` refers to other files in the legal-info directory:
>   - `buildroot.config`
>   - `sources/`
>   - `host-sources/`
>   - `licenses/`
>   - `host-licenses/`
> So only packages used to build image from config are listed.
> 
> Limitation: `web-legal-info` script depend of `legal-info` manifest format, output
> `*sources` folder structure and `*licenses` folder structure.
> 
> Signed-off-by: Micka?l Tansorier <mickael.tansorier@smile.fr>

So, I haven't even looked at the diff, but I don't think we would like
to have such a thing.

My main concern is that there are very few, if at all, people that would
have a need for that HTML page.

Most companies will have to have this integrated into their CMS, so that
it is properly branded and all. This is especially true for bigg
companies, but not only.

The bare minimum is to just expose the content of legal-info/ for
browing.

And generating that HTML page is anyway not enough: you would have to
have one for each version of the firmware that is deployed in the field,
so that means you'd need an another webpage to point to each fo your
versions, so still a process to integrate that in your websie (and now
your probably seeing the advantages of a CMS anyway).

So, sorry, but I am by far not convinced...

Overall, it is my position that Buildroot should export raw materials
(i.e. raw legal-info, raw show-info, etc...) and that users be
responsible for formatting that to their liking/needs.

One thing we may want to do, though, is change the existing manifest
from the CSV antiques it is, to JSON, since this is a bit easier to
parse (and even inject in javascript to generate beatiful web stuff).

Regards,
Yann E. MORIN.
> ---
> Changes v2 -> v3:
>   - flak8 complient
>   - `web-legal-info` script call in `legal-info` command
>   - Fix typo
>   - Add SPDX licenses and remove Copyright
>   - Remove unecessary css and html part
>   - Change python function for tag
>   - Make python script more pythonesque
>   - Update manual
> ---
>  Makefile                       |   4 +
>  docs/manual/legal-notice.txt   |   4 +
>  support/scripts/web-legal-info | 187 +++++++++++++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
>  create mode 100755 support/scripts/web-legal-info
> 
> diff --git a/Makefile b/Makefile
> index bab34ab9b5..d434ec4dc1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -848,6 +848,10 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
>  			>.legal-info.sha256; \
>  		mv .legal-info.sha256 legal-info.sha256)
>  	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
> +	@$(call MESSAGE,"Generate Web legal info")
> +	@cd "$(CONFIG_DIR)"; \
> +		$(TOPDIR)/support/scripts/web-legal-info $(LEGAL_INFO_DIR)
> +	@echo "Web legal info produced in $(LEGAL_INFO_DIR)"
>  
>  .PHONY: show-targets
>  show-targets:
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 69753282ec..f79c5a7955 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -57,6 +57,9 @@ There you will find:
>    subdirectories for target and host packages respectively.
>    If the license file(s) are not defined in Buildroot, the file is not produced
>    and a warning in the +README+ indicates this.
> +* A +index.html+ web page with minimal legal information. It refers to other
> +  files in the +legal-info+ directory (+buildroot.config+, +sources/+,
> +  +host-sources/+), so the entire directory must be packaged for distribution.
>  
>  Please note that the aim of the +legal-info+ feature of Buildroot is to
>  produce all the material that is somehow relevant for legal compliance with the
> @@ -83,6 +86,7 @@ of +make legal-info+ before using it as your own compliance delivery. See
>  the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
>  root of the Buildroot distribution.
>  
> +
>  [[legal-info-buildroot]]
>  === Complying with the Buildroot license
>  
> diff --git a/support/scripts/web-legal-info b/support/scripts/web-legal-info
> new file mode 100755
> index 0000000000..0c73dab85e
> --- /dev/null
> +++ b/support/scripts/web-legal-info
> @@ -0,0 +1,187 @@
> +#!/usr/bin/env python
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Usage:
> +#  ./support/scripts/web-legal-info <path-to-legal-info>
> +#
> +# Options:
> +#   -`path-to-legal-info`: This mandatory argument is used to find legal-info
> +#       output files.
> +#
> +# This script creates `index.html` file in `path-to-legal-info` dir, based on
> +# files:
> +#   - `manifest.csv`
> +#   - `host-manifest.csv`
> +#   - `buildroot.config`
> +# and folders:
> +#   - `sources`
> +#   - `host-sources`
> +#
> +
> +import sys
> +import csv
> +import datetime
> +
> +
> +# Get path to legal-info files
> +
> +if len(sys.argv) < 2:
> +    print("Error: This script need path to legal-info argument")
> +    sys.exit(2)
> +
> +LEGAL_INFO_DIR = str(sys.argv[1])
> +
> +HTML_FILE_NAME = LEGAL_INFO_DIR + "/index.html"
> +TARGET_CSV_FILE_NAME = LEGAL_INFO_DIR + "/manifest.csv"
> +HOST_CSV_FILE_NAME = LEGAL_INFO_DIR + "/host-manifest.csv"
> +
> +
> +# HTML templates
> +
> +html_header = """
> +<!DOCTYPE html>
> +<html>
> +
> +<head>
> +<style type="text/css">
> +    body{
> +      margin: 1em 5% 1em 5%;
> +    }
> +    h1, h2 {
> +      color: #527bbd;
> +      margin-top: 1.2em;
> +      margin-bottom: 0.5em;
> +      line-height: 1.3;
> +    }
> +    h2 {
> +      padding-top: 0.5em;
> +      border-bottom: 2px solid silver;
> +    }
> +    h1 {
> +      text-align: center;
> +    }
> +    table {
> +      width: 100%;
> +      border-collapse: collapse;
> +      border: 3px solid #527bbd;
> +      frame="border";
> +    }
> +    thead {
> +      font-weight: bold;
> +      color: #527bbd;
> +    }
> +    th {
> +      font-variant-caps: small-caps;
> +      border: 1px solid #527bbd;
> +      padding: 4px;
> +    }
> +    td {
> +      border: 1px solid #527bbd;
> +      padding: 4px;
> +    }
> +    footer {
> +      font-size: small;
> +      border-top: 2px solid silver;
> +      padding-top: 0.5em;
> +      margin-top: 4.0em;
> +    }
> +</style>
> +<title>Licenses Legal Info</title>
> +</head>
> +
> +<body>
> +
> +<main>
> +"""
> +
> +html_footer = """
> +</main>
> +
> +<footer>
> +    Generated on : """+datetime.date.today().isoformat()+"""
> +</footer>
> +
> +</body>
> +</html>
> +"""
> +
> +html_table_begin = """
> +<table>
> +<col width="33%" />
> +<col width="33%" />
> +<col width="33%" />
> +<thead>
> +<tr>
> +<th align="left" valign="top">Package</th>
> +<th align="left" valign="top">Version</th>
> +<th align="left" valign="top">Licenses</th>
> +</tr>
> +</thead>
> +<tbody>
> +"""
> +
> +html_table_end = """
> +</tbody>
> +</table>
> +"""
> +
> +
> +def html_tagify(tag, attrs, body):
> +    opening = tag
> +    if attrs:
> +        opening += ' ' + attrs
> +    return '<{}>{}</{}>'.format(opening, body, tag)
> +
> +
> +def get_html_table(csv_file_name, prefix_folder):
> +    ret = []
> +    with open(csv_file_name, 'rt') as csvfile:
> +        for row in csv.DictReader(csvfile):
> +            ret.append('<tr>\n')
> +            ret.append(html_tagify('td', None, html_tagify(
> +                'p', None, html_tagify(
> +                    'a', 'href="' + prefix_folder + 'sources/' +
> +                    row["PACKAGE"] + '-' + row["VERSION"] + '"',
> +                    row["PACKAGE"]))) + '\n')
> +            ret.append(html_tagify('td', None, html_tagify(
> +                'p', None, row["VERSION"])) + '\n')
> +            ret.append(html_tagify('td', None, html_tagify(
> +                'p', None, html_tagify(
> +                    'a', 'href="' + prefix_folder + 'licenses/' +
> +                    row["PACKAGE"] + '-' + row["VERSION"] + '"',
> +                    row["LICENSE"]))) + '\n')
> +            ret.append('</tr>\n')
> +    return ret
> +
> +
> +# Open html output file
> +with open(HTML_FILE_NAME, 'w') as htmlfile:
> +
> +    # Header page
> +    htmlfile.write(html_header)
> +    htmlfile.write(html_tagify('h1', None, 'Licenses Legal Info') + '\n')
> +
> +    # Buildroot config
> +    htmlfile.write(html_tagify('h2', None, 'Buildroot config') + '\n')
> +    htmlfile.write(
> +        '<p>Buildroot configuration file:\
> +        <a href="buildroot.config">buildroot.config</a></p>\n')
> +    htmlfile.write('\n')
> +
> +    # Target packages
> +    htmlfile.write(html_tagify('h2', None, 'Target packages') + '\n')
> +    htmlfile.write(html_table_begin)
> +    htmlfile.writelines(get_html_table(TARGET_CSV_FILE_NAME, ""))
> +    htmlfile.write(html_table_end)
> +    htmlfile.write('\n')
> +
> +    # Host target
> +    htmlfile.write(html_tagify('h2', None, 'Host packages') + '\n')
> +    htmlfile.write(html_table_begin)
> +    htmlfile.writelines(get_html_table(HOST_CSV_FILE_NAME, "host-"))
> +    htmlfile.write(html_table_end)
> +    htmlfile.write('\n')
> +
> +    # Footer page
> +    htmlfile.write(html_footer)
> -- 
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
