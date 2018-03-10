From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 22:16:20 +0100
Subject: [Buildroot] [PATCH v3,1/1] libmpdclient: fix install
In-Reply-To: <20180310094608.19499-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Mar 2018 10:46:08 +0100")
References: <20180310094608.19499-1-fontaine.fabrice@gmail.com>
Message-ID: <87ina3bpi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > meson adds the build machine architecture for installation, see:
 > https://github.com/mesonbuild/meson/issues/2535
 > Until this is fixed, fix libmpdclient.pc and copy the libraries and
 > libmpclient.pc to the correct place.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/aec/aec9f3de545a832b66cd00c217fbaa99246e1715
 >  - http://autobuild.buildroot.net/results/07a/07adcba71106a2dca963e4071f4673791b41a603
 >  - http://autobuild.buildroot.net/results/a27/a272a8e521863374901a5e3c0fb9da0b8daa4076

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3:
 >  - Add autobuilder links
 > Changes v1 -> v2:
 >  - Fix install of libmpdclient.pc

 >  package/libmpdclient/libmpdclient.mk | 25 +++++++++++++++++++++++++
 >  1 file changed, 25 insertions(+)

 > diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
 > index 3148fd2873..2b27eff397 100644
 > --- a/package/libmpdclient/libmpdclient.mk
 > +++ b/package/libmpdclient/libmpdclient.mk
 > @@ -35,9 +35,34 @@ define LIBMPDCLIENT_INSTALL_TARGET_CMDS
 >  		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
 >  endef
 
 > +# meson adds the build machine architecture for installation, see:
 > +# https://github.com/mesonbuild/meson/issues/2535
 > +# Until this is fixed, copy the libraries to the correct place
 > +define LIBMPDCLIENT_FIX_LIBRARY_INSTALL_TARGET
 > +	cp -a $(@D)/build/libmpdclient.* $(TARGET_DIR)/usr/lib

What about the version installed in
$(TARGET_DIR)/usr/lib/$(HOST_GNU_NAME)? That is still there taking up
space, right?

Having to do this workaround here is pretty horrible :/ What about the
other packages using meson, don't they have the same issues
(E.G. enlightenment/systemd/mpd-mpc)?

It would be a lot nicer to fix the problem. I have no experience with
mesonbuild, but grepping around the problem seems to come from

is_debianlike() in mesonbuild/mesonlib.py, which looks for
/etc/debian_version on the host(!) so this behaviour depends on the host
OS. changing this to just a 'return False' fixes it for me.

There's other problems though. If it isn't a debianlike system, then it
looks if /usr/lib64 on the host(!) is a directory, and if so uses that
instead of usr/lib :/

Similary, get_library_dirs() has login to look at uname -m and again
look in /usr/lib64 on the host, which breaks horrible for cross
compilation :/

I guess we need to patch out all of this crap until upstream gains real
cross compilation support :/

Any takers?

-- 
Bye, Peter Korsgaard
