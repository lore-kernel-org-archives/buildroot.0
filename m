From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 23:40:07 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <20191029095101.442578-1-mickael.tansorier@smile.fr>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
Message-ID: <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Mickae?l,

 Thank you for this v2. I have a few more suggestions for improvements.

On 29/10/2019 10:51, Micka?l Tansorier wrote:
> `web-legal-info` depend on `legal-info`, because it use output
> of legal info to generate html web page.
> This page contain informations about:
>  - buildroot config
>  - target packages: package name, version, licenses and sources
>  - host packages: package name, version, licenses and sources
> Output is `index.html` in legal-info subdirectory.
> Html page is generate by python script in `support/scripts/web-legal-info`.
> It is called from `Makefile`.
> 
> This script need `legal-info` output path in arguments.
> This script use files:
>   - `buildroot.config`
>   - `manifest.csv`
>   - `host-manifest.csv`
> Html page need file `buildroot.config`, folders `sources` and
> `host-sources`.
> So only packages used to build image from config are listed.
> 
> Limitation: web-legal-info depend of legal-info manifest format, output
> `sources` folder structure and `host-sources` folder structure.
> 
> Signed-off-by: Micka?l Tansorier <mickael.tansorier@smile.fr>

 It is looking pretty good. I just have one major comment: it has to be flake8
compliant.

 Since you'll anyway be making changes, I have a number of additional comments
below. But all of them are optional.

> ---
>  Makefile                       |   7 ++
>  docs/manual/legal-notice.txt   |  14 +++
>  support/scripts/web-legal-info | 189 +++++++++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100755 support/scripts/web-legal-info
> 
> diff --git a/Makefile b/Makefile
> index bab34ab9b5..4553a24564 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -849,6 +849,13 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
>  		mv .legal-info.sha256 legal-info.sha256)
>  	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
>  
> +.PHONY: web-legal-info
> +web-legal-info: legal-info

 I was going to suggest to put this directly into the legal-info target.
However, since we no longer have a dependency on Python, we shouldn't rely on
Python scripts in our "normal" path, so it's OK as is.

> +	@$(call MESSAGE,"Generate Web legal info")
> +	@cd "$(CONFIG_DIR)"; \
> +	$(TOPDIR)/support/scripts/web-legal-info $(LEGAL_INFO_DIR)
> +	@echo "Web legal info produced in $(LEGAL_INFO_DIR)"
> +
>  .PHONY: show-targets
>  show-targets:
>  	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 69753282ec..1e3509c1d2 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -83,6 +83,20 @@ of +make legal-info+ before using it as your own compliance delivery. See
>  the _NO WARRANTY_ clauses (clauses 11 and 12) in the +COPYING+ file at the
>  root of the Buildroot distribution.
>  
> +To produce minimal html web page informations with package, version, license

To produce a minimal web page with information about package, version, license

> +and sources you car run:

and sources you can run:

> +
> +--------------------
> +make web-legal-info
> +--------------------
> +
> +This command depend of +legal-info+ command so it will run each time you run
> ++web-legal-info+. Output +index.html+ can be find under +legal-info+
> +subdirectory.

This command also runs the normal legal-info. It requires Python 2 or 3 to be
installed.

The output is in +legal-info/index.html+ in the output directory.

> +This +index.html+ use file +buildroot.config+, folders +sources+ and
> ++host-sources+.

 I'm not sure what you want to say here. Perhaps you mean that there are hrefs
to those files/directories? In that case, rephrase it as:

It refers to other files in the +legal-info+ directory, so the entire directory
must be packaged for distribution.

> +
> +
>  [[legal-info-buildroot]]
>  === Complying with the Buildroot license
>  
> diff --git a/support/scripts/web-legal-info b/support/scripts/web-legal-info
> new file mode 100755
> index 0000000000..fc0aebd080
> --- /dev/null
> +++ b/support/scripts/web-legal-info
> @@ -0,0 +1,189 @@
> +#!/usr/bin/env python

 Can you check that it also runs on python3? We're converting all our scripts to
support either both python2 and python3, or (if not) python3 only.

> +
> +# Usage:
> +#  ./support/scirpts/web-legal-info <path-to-legal-info>
                ^^^^^^^scripts

> +#
> +# Options:
> +#   -`path-to-legal-info`: This mandatory argument is used to find legal-info
> +#       output files.
> +#
> +# This script cr?ate `index.html` file in `path-to-legal-info` dir, based on
                 ^^^^^^creates

> +# files:
> +#   - `manifest.csv`
> +#   - `host-manifest.csv`
> +#   - `buildroot.config` 

 You have trailing whitespace here.

> +# and folders:
> +#   - `sources`
> +#   - `host-sources`
> +#
> +# Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>

 Small nit: copyright statement should come before the rest.

 I would also like to this opportunity to start using SPDX license identifiers
in our code. So it should start with

# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>


> +
> +
> +import sys
> +import csv
> +import datetime
> +
> +
> +# Get path to legal-info files
> +
> +if len(sys.argv)<2:

 E225 missing whitespace around operator

 Please run flake8 on the code.

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
> +      h1, h2, h3, h4, h5, h6 {

 Could you use consistent indentation please?

 Also, maybe it's cleaner to have this in a separate file. This would make it
possible to have decent syntax highlighting and indentation. But that's really
just nitpicking so not important.

> +      color: #527bbd;
> +      margin-top: 1.2em;
> +      margin-bottom: 0.5em;
> +      line-height: 1.3;
> +    }
> +    h2, h3 {

 AFAICS, you're only using h1 and h2, so it doesn't ake much sense to define
styles for h3-h6. Again, not very important though.

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
> +<title>Redistributable licenses</title>

 Why "Redistributable"?

> +</head>
> +
> +<body>
> +
> +<header>
> +</header>

 Does it make sense to have an empty header?

> +
> +<main>
> +"""
> +
> +html_footer = """
> +</main>
> +
> +<footer>
> +    Last updated : """+datetime.date.today().isoformat()+"""

 Instead of "last updated", it should probably be "Generated on".

> +</footer>
> +
> +</body>
> +</html>
> +"""
> +
> +html_table_begin = """
> +<table>
> +<col width="25%" />
> +<col width="25%" />
> +<col width="25%" />
> +<col width="25%" />
> +<thead>
> +<tr>
> +<th align="left" valign="top">PACKAGE</th>

 Please no all caps. If you really want caps, use the 'font-variant:
small-caps;' style.

 I believe you can also move the alignment hints to the stylesheet (but my
HTML/CSS-fu is quite limited).

> +<th align="left" valign="top">VERSION</th>
> +<th align="left" valign="top">LICENSE</th>
> +<th align="left" valign="top">SOURCES</th>
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
> +# Functions and main

 This comment is useless.

> +
> +def write_title(title,size, htmlfile):
> +    htmlfile.write('<' + size + '>' + title + '</' + size + '>\n')

 If you want to simplify creating HTML structures, this is a more useful function:

def html_tagify(tag, attrs, body):
    opening = tag
    if attrs:
        opening += ' ' + attrs
    return '<{}>{}</{}>'.format(opening, body, tag)

 To be used as:

    htmlfile.write(html_tagify('h2', None, 'Target packages') + '\n')

> +
> +
> +def fill_html_table(csvfile, htmlfile, sources_path):
> +    spamreader = csv.DictReader(csvfile)

 spamreader? :-)

 The variable is not really useful here, you can just do

    for row in csv.DictReader(csvfile):

> +    for row in spamreader:
> +        htmlfile.write('<tr>\n')
> +        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["PACKAGE"] + '</p></td>\n')

 So this could also use the html_tagify:

  html_tagify('td', 'align="left" valign="top"',
              html_tagify('p', 'class="table", row["PACKAGE"])) + '\n'


 Also, a more pythonesque (but maybe not easier to read) way would be to yield
the string here (which makes the function a generator), and in the caller do

    htmlfile.writelines(fill_html_table(csvfile, sources_path))

> +        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["VERSION"] + '</p></td>\n')
> +        htmlfile.write('<td align="left" valign="top"><p class="table">' + row["LICENSE"] + '</p></td>\n')
> +        htmlfile.write('<td align="left" valign="top"><p class="table"> \

 Backslash is not needed here since it's between ().

> +                        <a href="' + sources_path + '/' + row["PACKAGE"] + '-' + row["VERSION"] + '">' + \
> +                            row["PACKAGE"] + '-' + row["VERSION"] + '\
> +                        </a> \

 I don't think it makes much sense to put an extra column just for this link.
You can add the link around the package name, in the first column.

 It would also be useful to add a href to the license files in the license
column entry.

> +                        </p></td>\n')
> +        htmlfile.write('</tr>\n')

 I think it would make sense to define a template multiline string for all of
the above, with {PACKAGE} and {VERSION} etc. placeholders, and then format it with:

   table_row_template.format(row)

 Note that in that case, you probably can't use my html_tagify function.

> +
> +
> +def __main__():
> +    # Open html output file
> +    with open(HTML_FILE_NAME, 'w') as htmlfile:
> +
> +        # Header page
> +        htmlfile.write(html_header)
> +        write_title("Redistributable licenses", "h1", htmlfile)
> +        htmlfile.write('\n')
> +
> +        # Buildroot config
> +        write_title("Buildroot config", "h2", htmlfile)
> +        htmlfile.write('<p><a href="buildroot.config">buildroot.config</a></p>\n')

 I don't think a h2 looks so nice here. Better without header, just:

<p>Buildroot configuration: <a href="buildroot.config">buildroot.config</a></p>


> +        htmlfile.write('\n')
> +    
> +        # Target packages
> +        write_title("Target packages", "h2", htmlfile)
> +        htmlfile.write(html_table_begin)
> +        with open(TARGET_CSV_FILE_NAME, 'rt') as csvfile:

 It would make more sense to push this inside the function.

> +            fill_html_table(csvfile,htmlfile, "sources")
> +        htmlfile.write(html_table_end)
> +        htmlfile.write('\n')
> +    
> +        # Host target
> +        write_title("Host packages", "h2", htmlfile)
> +        htmlfile.write(html_table_begin)
> +        with open(HOST_CSV_FILE_NAME, 'rt') as csvfile:
> +            fill_html_table(csvfile, htmlfile, "host-sources")
> +        htmlfile.write(html_table_end)
> +        htmlfile.write('\n')
> +    
> +        # Footer page
> +        htmlfile.write(html_footer)
> +
> +
> +__main__()

 The usual pattern is:

if __name__ == '__main__':
    __main__()


 However, I don't think it makes sense to make a main function here, because
there are so many global variables.


 Regards,
 Arnout
