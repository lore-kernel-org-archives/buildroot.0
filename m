From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:26:05 +0200
Subject: [Buildroot] [PATCH 09/10] package/rsyslog: ignore CVE-2015-3243
In-Reply-To: <20210421204235.5956-10-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 21 Apr 2021 15:42:34 -0500")
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
 <20210421204235.5956-10-matthew.weber@rockwellcollins.com>
Message-ID: <87eeewhjxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > https://security-tracker.debian.org/tracker/CVE-2015-3243
 >  "Rsyslog uses weak permissions for generating log files."

 > Ignoring this CVE for Buildroot as normally there are not local
 > users and a build could customize the rsyslog.conf to be more
 > restrictive ($FileCreateMode 0640).

 > Example fix from Alpino Linux
 >  https://github.com/libTorrentUser/alpino-linux-aports/commit/3cb5210cdac46fb8805d4028df16f5889f393a09

Here as well, I don't like ignoring the issue just because you COULD
work around it by doing customization outside Buildroot.

How about combining this with a patch to platform/redhat/rsyslog.conf to
set sensible permissions just like it is done for Alpino?

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/rsyslog/rsyslog.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
 > index 1aa81b8eac..6cf53ccb82 100644
 > --- a/package/rsyslog/rsyslog.mk
 > +++ b/package/rsyslog/rsyslog.mk
 > @@ -9,6 +9,10 @@ RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 >  RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 >  RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 >  RSYSLOG_CPE_ID_VENDOR = rsyslog
 > +# rsyslog uses weak permissions for generating log files.
 > +# Ignoring this CVE as Buildroot normally doesn't have local users and a build
 > +# could customize the rsyslog.conf to be more restrictive ($FileCreateMode 0640)
 > +RSYSLOG_IGNORE_CVES += CVE-2015-3243
 >  RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 >  RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 >  RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 > -- 
 > 2.17.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
