From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 21 Sep 2018 07:56:46 -0500
Subject: [Buildroot] [PATCH 01/14] support/scripts/pkg-stats: URL
 checking support
In-Reply-To: <20180920225818.51c10322@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920225818.51c10322@windsurf>
Message-ID: <CANQCQpY3MXQHE06QCi+7K+d6fN08azBUik1N9DukBcOaxMRjaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2018 at 3:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> On Thu, 20 Sep 2018 08:24:46 -0500, Matt Weber wrote:
>
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index b7b00e8..c83545b 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -24,6 +24,8 @@ from collections import defaultdict
> >  import re
> >  import subprocess
> >  import sys
> > +import time
> > +import requests  # URL checking
> >
> >  INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
> >
> > @@ -43,10 +45,30 @@ class Package:
> >          self.patch_count = 0
> >          self.warnings = 0
> >          self.current_version = None
> > +        self.url = None
> >
> >      def pkgvar(self):
> >          return self.name.upper().replace("-", "_")
> >
> > +    def set_url(self):
> > +        """
> > +        Fills in the .url field
> > +        """
> > +        in_help_section = False
> > +        self.url = "No Config"
> > +        for filename in os.listdir(os.path.dirname(self.path)):
> > +            if fnmatch.fnmatch(filename, 'Config.*'):
> > +                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
> > +                for config_line in fp:
> > +                    if config_line.strip() == "help":
> > +                        in_help_section = True
> > +                    if in_help_section and re.match("(.*)https?://", config_line):
> > +                        self.url = ''.join(config_line.split())
> > +                        fp.close()
> > +                        return
> > +                self.url = "Missing Entry"
> > +                fp.close()
> > +
> >      def set_infra(self):
> >          """
> >          Fills in the .infras field
> > @@ -356,7 +378,19 @@ def boolean_str(b):
> >
> >  def dump_html_pkg(f, pkg):
> >      f.write(" <tr>\n")
> > -    f.write("  <td>%s</td>\n" % pkg.path[2:])
> > +    url_status = "Ok"
> > +    if str(pkg.url) == "Missing Entry":
> > +        f.write("  <td>%s<br>    (URL: Missing URL)</td>\n" % pkg.path[2:])
> > +    elif str(pkg.url) == "No Config":
> > +        f.write("  <td>%s<br>    (URL: No Config File)</td>\n" % pkg.path[2:])
> > +    else:
> > +        try:
> > +            url_status_code = requests.head(pkg.url, verify=False).status_code
> > +            if url_status_code > 308:
> > +                url_status = "Error(" + str(url_status_code) + ")"
> > +        except requests.exceptions.RequestException as e:
> > +            url_status = e
> > +        f.write("  <td>%s<br>    (<a href=%s>URL: %s</a>)</td>\n" % (pkg.path[2:], str(pkg.url), url_status))
>
> Could you instead add a new column, like we already have for the
> version, package type, number of patches, etc. and use the existing
> green/orange/red colors to indicate URL present and working (green),
> URL not present (orange) and URL present but not working (red) ?
>

How does this look? (Still some bugs with some of the invalid sites,
the webservers are reporting incorrect codes....)
https://pste.eu/p/JpsH.html

> How long does it take to run the script before/after your addition, on
> all packages ? I'm sure you remember I was working on adding support
> for using release-monitoring.org to this script to keep track of
> upstream versions of packages, but doing it sequentially for the 2000+
> packages we have was way too slow and I had to use several threads to
> speed things up and make it reasonable.
>

Before adding URL checking, it takes ~2mins.  I was able to keep the
runtime at 2mins 20sec by pulling in your code for threading and using
64 threads.

Matt
