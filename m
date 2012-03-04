From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 11:53:39 +0100
Subject: [Buildroot] Kconfig: "selects" vs. "depends on"
In-Reply-To: <20120304071855.3e6c03b5@gmail.com>
References: <20120304071855.3e6c03b5@gmail.com>
Message-ID: <201203041153.40167.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 10:18:55 Ismael Luceno wrote:
> Which should I use?
> 
> Perhaps "selects" for for simple (i.e. non-configurable) dependencies,
> and "depends on" otherwise...?

 Actually you have three choices here: "select", "depends on", and "if" 
(which is functionally equivalent to "depends on").

 I have an opinion on this, but I'm not sure if the others agree (esp. 
ThomasDS :-).

- "select" should always be used, except in the cases below.
- "depends on" should be used in the BR2_PACKAGE_<pkgname> config when
  * the package requires a certain toolchain config (e.g. WCHAR, CXX)
    (in this case there should also be a comment that explains why the
    package is not available);
  * the package only exists for certain architectures (e.g. for boot
    loaders);
  * the package is a part of some superpackage (e.g. X11, python)
    (it's a bit of a judgement call what can be considered a 
    superpackage);
  * it is deprecated.
- "depends on" should be used in a package's additional config options
  when:
  * any of the above apply to the additional option;
  * to enable an extra sub-sub-config option (cfr. PHP -> PHP_EXT_SQLITE
    -> PHP_EXT_SQLITE_UTF8)
  * when the suboption requires certain configs of another package and 
    'select' can't be used reliably (in this case there should also
    be a comment);
  * in rare cases, when the suboption requires certain configs of the
    same package and it would become too complex to resolve all the
    dependencies (in this case there should also be a comment)
- "if" should be used:
  * to enable a package's additional config options only when the package
    is selected;
  * around 'source' statements (cfr. x11r7)

 Note that the current packages sometimes don't follow these rules.

 [Hey, maybe we should add this set of guidelines to the documentation!]

 Now, you're probably asking this for the Qt tools for which you just
posted a patch, and I guess those guidelines don't help you much with
that...  I would say the dependency of qmlviewer on QtDeclarative falls
under the superpackage category.  However, the dependency of qmlviewer
on the SQL module is certainly not a superpackage-type, so it should
preferrably be a select, or a depends on with a comment if the select
is too difficult to get right.  So the way you did it is perfect :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
