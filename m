From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2020 16:06:34 +0100
Subject: [Buildroot] [PATCH v2] packagersyslog: enable options when
 libcurl is enabled
In-Reply-To: <20191104211203.52912-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Mon, 4 Nov 2019 15:12:03 -0600")
References: <20191104211203.52912-1-matthew.weber@rockwellcollins.com>
Message-ID: <87a761ni4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Following the bump to 8.1910.0, items requiring libcurl were
 > disabled by default. This patch selectively enables options
 > which depend on libcurl when that package is enabled in the
 > build.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 > [Thomas
 >  - Flipped libcurl conditional and name of this patchset to rsyslog
 > ---
 >  package/rsyslog/rsyslog.mk | 12 +++++++++++-
 >  1 file changed, 11 insertions(+), 1 deletion(-)

 > diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
 > index 5bd6b59ba3..d5a88b19d3 100644
 > --- a/package/rsyslog/rsyslog.mk
 > +++ b/package/rsyslog/rsyslog.mk
 > @@ -17,7 +17,16 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 >  RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 >  	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
 > -# Disable items requiring libcurl
 > +ifeq ($(BR2_PACKAGE_LIBCURL),y)
 > +RSYSLOG_DEPENDENCIES += libcurl
 > +RSYSLOG_CONF_OPTS += --enable-elasticsearch \
 > +	--enable-clickhouse \
 > +	--enable-omhttp \
 > +	--enable-fmhttp \
 > +	--enable-imdocker \
 > +	--enable-omhttpfs \
 > +	--enable-mmkubernetes

 I was about to apply this, but it fails to build here (a config with
 just curl and rsyslog):

checking for CURL... yes
checking for LIBLOGNORM... no
configure: error: Package requirements (lognorm >= 2.0.3) were not met:

Package 'lognorm', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables LIBLOGNORM_CFLAGS
and LIBLOGNORM_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make[1]: *** [package/pkg-generic.mk:250: /home/peko/source/buildroot/output-rsyslog/build/rsyslog-8.1911.0/.stamp_configured] Error 1

Care to take a look?

-- 
Bye, Peter Korsgaard
