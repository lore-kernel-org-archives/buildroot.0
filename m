From: Alexander Dahl <post@lespocky.de>
Date: Wed, 7 Apr 2021 10:11:46 +0200
Subject: [Buildroot] fastd CPE/CVE reporting
In-Reply-To: <20210407000438.7835c67d@windsurf.home>
References: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
 <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
 <20210329152803.594a910f@windsurf.home>
 <20210405123600.mutgqbczb7jqehjj@falbala.internal.home.lespocky.de>
 <20210407000438.7835c67d@windsurf.home>
Message-ID: <20210407081145.662twno6ce4n2m6e@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I tried a build based on qemu_x86_64_defconfig this morning like this:

1. `make distclean`
2. `make qemu_x86_64_defconfig`
3. `make menuconfig` and enable BR2_PACKAGE_FASTD
4. `make`

? (see below)

On Wed, Apr 07, 2021 at 12:04:38AM +0200, Thomas Petazzoni wrote:
> Hello Alexander,
> 
> On Mon, 5 Apr 2021 14:36:01 +0200
> Alexander Dahl <post@lespocky.de> wrote:
> 
> > On Mon, Mar 29, 2021 at 03:28:03PM +0200, Thomas Petazzoni wrote:
> > > For this particular fastd CVE issue, what needs to be added is (1) the
> > > proper CPE identifier information in the Buildroot package and (2) get
> > > the NVD database maintainers to fix the CVE entry to indicate which
> > > fastd version has fixed the security vulnerability.  
> > 
> > I hoped to have added the proper CPE identifier with ebe599de08ec
> > ("package/fastd: add FASTD_CPE_ID_VERSION") in master (which was also
> > backported to 2021.02.x). However I got another warning mail today.
> > 
> > I'm not sure I understand (2) correctly. As far as I can see at
> > https://nvd.nist.gov/vuln/detail/CVE-2020-27638 that CVE is marked as
> > fixed for fastd 21.0.
> > 
> > Is there anything I missed to set for the buildroot package?
> 
> I looked into this, and the bug is in the pkg-stats tool. Basically the
> <pkg>_CPE_ID_VERSION field was used for exact matches of the CPE ID
> into the NVD database. However, in this case there is no exact match as
> the CPE ID of the CVE entry is
> cpe:2.3:a:fastd_project:fastd:*:*:*:*:*:*:*:*. And then, when comparing
> against the "Up to (excluding) 21.0" information, we were still using
> <pkg>_VERSION rather than the version field of the CPE ID.

Sorry, I don't understand all the details. O:-)

> My fix for now is:
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index 6e97ea193f..183e7a0d7f 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -223,6 +223,8 @@ class CVE:
>          # if we don't have a cpeid, build one based on name and version
>          if not cpeid:
>              cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
> +        else:
> +            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
>  
>          for cpe in self.each_cpe():
>              if not cpe_matches(cpe['id'], cpeid):
> 
> Which if you apply, and run "make pkg-stats" on a configuration that
> has fastd enabled no longer shows this CVE as affecting the fastd
> package.

I tried this:

5. `make pkg-stats` (result still reports fastd CVE)
6. saved output/pkg-stats.html for later comparison
7. applied your diff and `make pkg-stats` again

This is the diff in the resulting html:

--- pkg-stats.html.old  2021-04-07 09:02:37.489491665 +0200
+++ pkg-stats.html      2021-04-07 10:02:20.819888329 +0200
@@ -387,7 +387,7 @@
   <td class="centered">1.46.2</td>
   <td class="centered correct version-good"><a href="https://release-monitoring.org/project/646"><b>1.46.2</b></a><br/>found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a></td>
   <td class="centered correct">0</td>
-  <td class="centered good_url"><a href=http://e2fsprogs.sourceforge.net>Link</a></td>
+  <td class="centered missing_url invalid_url"><a href=http://e2fsprogs.sourceforge.net>invalid (err)</a></td>
   <td class="centered cve-ok">
     N/A
   </td>
@@ -406,7 +406,7 @@
   <td class="centered">2.3.0</td>
   <td class="centered correct version-good"><a href="https://release-monitoring.org/project/770"><b>2.3.0</b></a><br/>found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a></td>
   <td class="centered correct">0</td>
-  <td class="centered good_url"><a href=http://expat.sourceforge.net>Link</a></td>
+  <td class="centered missing_url invalid_url"><a href=http://expat.sourceforge.net>invalid (err)</a></td>
   <td class="centered cve-ok">
     N/A
   </td>
@@ -444,8 +444,8 @@
   <td class="centered correct version-good"><a href="https://release-monitoring.org/project/17116"><b>21</b></a><br/>found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a></td>
   <td class="centered correct">0</td>
   <td class="centered good_url"><a href=https://github.com/NeoRaider/fastd/wiki>Link</a></td>
-  <td class="centered cve-nok">
-   <a href="https://security-tracker.debian.org/tracker/CVE-2020-27638">CVE-2020-27638<br/>
+  <td class="centered cve-ok">
+    N/A
   </td>
   <td class="left cpe-ok">
   <code>cpe:2.3:a:fastd_project:fastd:21.0:*:*:*:*:*:*:*</code>
@@ -1182,12 +1182,12 @@
 <tr><td>Packages that are up-to-date</td><td>24</td></tr>
 <tr><td>Packages that are not up-to-date</td><td>16</td></tr>
 <tr><td>Packages with no known upstream version</td><td>14</td></tr>
-<tr><td>Packages affected by CVEs</td><td>5</td></tr>
-<tr><td>Total number of CVEs affecting all packages</td><td>92</td></tr>
+<tr><td>Packages affected by CVEs</td><td>4</td></tr>
+<tr><td>Total number of CVEs affecting all packages</td><td>91</td></tr>
 <tr><td>Packages with CPE ID</td><td>23</td></tr>
 <tr><td>Packages without CPE ID</td><td>31</td></tr>
 </table>
-<p><i>Updated on 2021-04-07 06:35:10.183488, git commit d043f5775ac8d74e4970e03eec0cd8fe054e6263</i></p>
+<p><i>Updated on 2021-04-07 07:07:16.009887, git commit d043f5775ac8d74e4970e03eec0cd8fe054e6263</i></p>

 </body>
 <script>

So it looks good to me for fastd now, but I'm not sure about the
changes for e2fsprogs and expat. Is that a side effect of your diff?

> I'll sleep on that and hopefully submit this patch properly in the next
> days.
> 
> Thanks,

Thanks and Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210407/3d281624/attachment.asc>
