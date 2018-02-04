From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 12:07:19 +0100
Subject: [Buildroot] [PATCH v2] dash: enable line editting if libedit is
 selected.
In-Reply-To: <1506622076-21776-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Thu, 28 Sep 2017 15:07:56 -0300")
References: <20170928085957.04978e60@windsurf.lan>
 <1506622076-21776-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <871si1ypw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Otherwise, explicitly disable it, so that the configure script does not
 > misdetect a system-installed libedit for example.

 > Also, add a profile snippet enabling line editing, Emacs style.

 > Change-Id: I68c6dbbafa95e266860329cb9c7ff5519fda5bf8
 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/dash/dash.mk | 13 +++++++++++++
 >  1 file changed, 13 insertions(+)

 > diff --git a/package/dash/dash.mk b/package/dash/dash.mk
 > index 72ef722..0098fad 100644
 > --- a/package/dash/dash.mk
 > +++ b/package/dash/dash.mk
 > @@ -10,6 +10,19 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 >  DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 >  DASH_LICENSE_FILES = COPYING
 
 > +# Enable line editing, Emacs style
 > +define DASH_INSTALL_PROFILE
 > +	echo 'set -E' > $(TARGET_DIR)/etc/profile.d/dash.sh
 > +endef
 > +
 > +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 > +DASH_DEPENDENCIES += libedit
 > +DASH_CONF_OPTS += --with-libedit
 > +DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE

Committed after moving DASH_INSTALL_PROFILE inside the conditional,
thanks.

-- 
Bye, Peter Korsgaard
