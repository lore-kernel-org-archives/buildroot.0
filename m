From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 17:59:08 +0100
Subject: [Buildroot] [PATCH 09/10] support/scripts/{pkg-stats, cve.py,
 cve-checker}: support CPE ID based matching
In-Reply-To: <87d00r97k3.fsf@BL-laptop>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
 <87d00r97k3.fsf@BL-laptop>
Message-ID: <20201105175908.56822567@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 05 Nov 2020 15:55:56 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> > +        # if we don't have a cpeid, build one based on name and version
> > +        if not cpeid:
> > +            cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
> > +
> >          for cpe in self.each_cpe():
> > -            if cpe['product'] != name:
> > +            if not cpe_matches(cpe['id'], cpeid):
> >                  continue  
> 
> Here you compare the full cpeid including the version to the cpeid
> associated to the CVE. But if the CVE is about a range of version (using
> versionStartIncluding for instance), then this test may file was
> actually the package would be affected because the version is inside the
> range of version affected.

So, a package will have a CPE ID like this:

  cpe:2.3:a:vendor:product:1.0.4:*:*:*:*:*:*:*

Then, a CVE will have two cases:

 - Either it has a CPE ID that includes directly a version, like:

   cpe:2.3:a:vendor:product:1.0.3:*:*:*:*:*:*:*

   In this case, the cpe_matches() function will return False, because
   indeed 1.0.3 isn't the same as 1.0.4

 - Or it has a CPE ID that does *NOT* include a version, because the
   version is specified separately through versionStartIncluding and
   similar properties. In this case, the CPE ID of the CVE will look
   like this:

   cpe:2.3:a:vendor:product:*:*:*:*:*:*:*:*

   Notice how the "version" field is "*". The cpe_matches() function
   handles "*" as a wildcard, and will allow it to match any value. So
   "*" matches "1.0.4", which means in this situation, cpe_matches()
   will return True, so the code logic will continue, and test if we're
   in the version range or not.

The code goes like this:

            if not cpe_matches(cpe['id'], cpeid):
                # The CPE doesn't match, so skip
                continue

            if not cpe['v_start'] and not cpe['v_end']:
                # The CPE matches *and* we don't have a version range, so we know the CVE affects us
                return self.CVE_AFFECTS

            if not pkg_version:
                # The version of the package couldn't be parsed, so we're not able to compare it
                # with distutils.version.LooseVersion(), so skip
                continue

            # and then here we handle the version range (code was not changed)

Does this explain how it works ? Let me know if you still see an issue,
because I could also be missing something.

Note: I checked the JSON output of pkg-stats before and after this
commit, and it is identical.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
