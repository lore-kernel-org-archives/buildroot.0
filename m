From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Fri, 31 Oct 2014 00:42:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/shairport-sync: fix avahi
 dependency
In-Reply-To: <54529F2B.8080707@mind.be>
References: <1414659789-16887-1-git-send-email-jkrause@posteo.de>
 <20141030211121.3a97a88b@free-electrons.com> <54529F2B.8080707@mind.be>
Message-ID: <1414712544.9427.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Do, 2014-10-30 at 21:27 +0100, Arnout Vandecappelle wrote:
> On 30/10/14 21:11, Thomas Petazzoni wrote:
> > Dear J?rg Krause,
> > 
> > On Thu, 30 Oct 2014 10:03:08 +0100, J?rg Krause wrote:
> >> Shairport-syncs avahi (zeroconf) support needs libdns_sd which is only build
> >> when BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY is selected.
> >>
> >> Fixes autobuild errors:
> >>   - http://autobuild.buildroot.net/results/a6a/a6ab7641a3cafcdaeffe11f08d5fcacbbb882d8d/
> >>   - http://autobuild.buildroot.net/results/cb4/cb41980f2fb416d627bea0950e1dae727eae0ca6/
> >>   - http://autobuild.buildroot.net/results/009/00929df01474813be576936e80e86374efdbc327/
> >>   - http://autobuild.buildroot.net/results/a40/a40b8cf9aaa4ade4d96524219276cfad2920104c/
> >>   - http://autobuild.buildroot.net/results/03f/03fff2805b3348f2557bbef73a716eadea3add03/
> >>
> >> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> >> ---
> >>  package/shairport-sync/shairport-sync.mk | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> >> index 58343f4..53d7895 100644
> >> --- a/package/shairport-sync/shairport-sync.mk
> >> +++ b/package/shairport-sync/shairport-sync.mk
> >> @@ -17,7 +17,7 @@ SHAIRPORT_SYNC_AUTORECONF = YES
> >>  SHAIRPORT_SYNC_CONF_OPTS = --with-alsa # required
> >>  
> >>  # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns)
> >> -ifeq ($(BR2_PACKAGE_AVAHI),y)
> >> +ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
> >>  SHAIRPORT_SYNC_DEPENDENCIES += avahi
> >>  SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
> >>  else
> > 
> > I'm not sure about this one. Automatic dependencies are OK when they
> > are relatively obvious: it's relatively obvious that if you want Avahi
> > support in package "foo", then you should enable Avahi. However, it's
> > clearly not obvious that if you want Avahi support in Shairport-sync,
> > you should have this libdnssd compatibility option of Avahi enabled.
> > 
> > Therefore, my feeling is that this is the sort of case where we should
> > instead introduce a sub-option of Shairport-sync to enable Avahi
> > support, which would select both BR2_PACKAGE_AVAHI and
> > BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY.
> > 
> > Peter, Arnout, Gustavo, an opinion?
> 
>  I agree with your theory. However, in this particular case, what you really
> want is the DNS-SD support. In case BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY,
> you'll still get DNS-SD support, just not through avahi but instead through the
> bundled tinysvcmdns. So I don't think adding a config option for it is really
> needed.
> 
>  However, it would still be useful to use avahi when avahi is available. So
> instead I'd add to Config.in:
> 
> 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY if BR2_PACKAGE_AVAHI_DAEMON
> 
> (with the appropriate explanatory comment).

shairport-sync uses mDNS to pubish its service. This task is implemented
(among others) in avahi and tinysvcmdns.

To use avahi as the mDNS backend, shairport-sync requires
libavahi-client, and not necessarily libdns_sd as I thought. Both will
work, but libavahi-client is enough.

Before submitting this patch I have run a test with
BR2_PACKAGE_AVAHI_DAEMON enabled, which gaves my the same error about
the missing libavahi-client.

I've checked the sources of avahi and noticed that libavahi-client
depends not only on avahi-daemon, but also on dbus, which was not
selected.

Selecting BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY selects
BR2_PACKAGE_DBUS, that's why it builds successfully.

To get libavahi-client support shairport-sync needs to select
BR2_PACKAGE_AVAHI_DAEMON and BR2_PACKAGE_DBUS which is not quite obvious
if you've not checked avahis configure file.

How about a patch for avahi to add BR2_PACKAGE_LIBAVAHI_CLIENT?

Best regards
J?rg Krause
