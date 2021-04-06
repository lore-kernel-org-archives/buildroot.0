From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Apr 2021 00:04:38 +0200
Subject: [Buildroot] fastd CPE/CVE reporting (Was:
 [autobuild.buildroot.net] Your daily results for 2021-03-21)
In-Reply-To: <20210405123600.mutgqbczb7jqehjj@falbala.internal.home.lespocky.de>
References: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
 <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
 <20210329152803.594a910f@windsurf.home>
 <20210405123600.mutgqbczb7jqehjj@falbala.internal.home.lespocky.de>
Message-ID: <20210407000438.7835c67d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Mon, 5 Apr 2021 14:36:01 +0200
Alexander Dahl <post@lespocky.de> wrote:

> On Mon, Mar 29, 2021 at 03:28:03PM +0200, Thomas Petazzoni wrote:
> > For this particular fastd CVE issue, what needs to be added is (1) the
> > proper CPE identifier information in the Buildroot package and (2) get
> > the NVD database maintainers to fix the CVE entry to indicate which
> > fastd version has fixed the security vulnerability.  
> 
> I hoped to have added the proper CPE identifier with ebe599de08ec
> ("package/fastd: add FASTD_CPE_ID_VERSION") in master (which was also
> backported to 2021.02.x). However I got another warning mail today.
> 
> I'm not sure I understand (2) correctly. As far as I can see at
> https://nvd.nist.gov/vuln/detail/CVE-2020-27638 that CVE is marked as
> fixed for fastd 21.0.
> 
> Is there anything I missed to set for the buildroot package?

I looked into this, and the bug is in the pkg-stats tool. Basically the
<pkg>_CPE_ID_VERSION field was used for exact matches of the CPE ID
into the NVD database. However, in this case there is no exact match as
the CPE ID of the CVE entry is
cpe:2.3:a:fastd_project:fastd:*:*:*:*:*:*:*:*. And then, when comparing
against the "Up to (excluding) 21.0" information, we were still using
<pkg>_VERSION rather than the version field of the CPE ID.

My fix for now is:

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 6e97ea193f..183e7a0d7f 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -223,6 +223,8 @@ class CVE:
         # if we don't have a cpeid, build one based on name and version
         if not cpeid:
             cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
+        else:
+            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
 
         for cpe in self.each_cpe():
             if not cpe_matches(cpe['id'], cpeid):

Which if you apply, and run "make pkg-stats" on a configuration that
has fastd enabled no longer shows this CVE as affecting the fastd
package.

I'll sleep on that and hopefully submit this patch properly in the next
days.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
