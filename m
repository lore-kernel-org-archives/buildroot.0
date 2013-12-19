From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Dec 2013 18:02:39 +0100
Subject: [Buildroot] More work on a package updates checking tool
In-Reply-To: <CACjG4BJuyTZ=Fbgmt=qiNs+qn1pQt0R6xV+MCw_5CKbc+XFZqg@mail.gmail.com>
References: <CACjG4BJuyTZ=Fbgmt=qiNs+qn1pQt0R6xV+MCw_5CKbc+XFZqg@mail.gmail.com>
Message-ID: <20131219180239.5a5c6771@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear arnaud aujon,

On Thu, 19 Dec 2013 17:21:35 +0100, arnaud aujon wrote:

> I did more work on a tool to check if packages are up-to-date.
> This is still a dev script, so kind of ugly, but the output is really
> better, even if there is still some false detections.
> 
> generated html : http://intelibre.fr/buildroot/out.html
> script : http://intelibre.fr/buildroot/check-updates.py
> everything else : http://intelibre.fr/buildroot/
> 
> Hope you can find some interests in it.

This is *really* cool.

Now, I'd like to see this integrated in Buildroot and in the autobuild
infrastructure. Currently, the autobuild infrastructure executes the
support/scripts/pkg-stats shell script everyday, and the result is
visible at http://autobuild.buildroot.org/stats/.

So, what would be really great is to slightly enhance your script to
also make it display what pkg-stats is showing in terms of informations:

 * Infrastructure used by the package
 * Whether it's target, target+host, or host
 * Number of patches
 * Whether it has license info, and license files info

And next to it, add your "current version", "latest available version",
"provider" and "status" informations.

Once your script does that, we can simply throw away the pkg-stats
shell script, and replace it with your new Python-based pkg-stats
script that does all the version checking, and we can commit it in the
Buildroot tree.

Other things to do / look at :

 * Integrate the template.html contents directly in the script itself,
   using a multiline string:

template = """
<html>
<head>
  <title>Buildroot packages updates</title>
  <link rel="stylesheet" type="text/css" href="style.css"/>
  <script type="text/javascript" src="jquery-2.0.3.min.js"></script> 
  <script type="text/javascript" src="jquery.tablesorter.min.js"></script>
  <script type="text/javascript">
...
"""

   This way, we avoid the dependency on template.html

 * Use URLs to public version of the jquery code and the tablesorter
   plugin, so we are not forced to add these in the Buildroot tree as
   well.

 * Understand why your script analyses "only" 862 packages, while the
   current pkg-stats script finds 1165 packages.

Another bonus point if you add an option to the script (like pkg-stats
-t) that would generate a text-only output that we could mail to the
mailing list every week or so (a bit like the autobuilder results).

Are you interested in doing this? If so, then I'll be more than happy
to deploy your pkg-stats script on autobuild.buildroot.org, as a
replacement to the current one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
