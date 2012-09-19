From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 23:48:03 +0200
Subject: [Buildroot] [PATCH v5] sconeserver: new package
In-Reply-To: <1348044562-6762-1-git-send-email-spdawson@gmail.com>
References: <1348044562-6762-1-git-send-email-spdawson@gmail.com>
Message-ID: <505A3D93.3040709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 10:49, spdawson at gmail.com wrote:
> +# Sconeserver configure script fails to find the libxml2 headers.
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +	SCONESERVER_CONF_OPT += CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
> +	SCONESERVER_CONF_OPT += LDFLAGS="-L$(STAGING_DIR)/usr/lib/mysql"
> +endif

  I'd suggest using the following pattern:

SCONESERVER_CONF_OPT += CXXFLAGS="$(TARGET_CXXFLAGS) $(SCONESERVER_CXXFLAGS)"
SCONESERVER_CONF_OPT += LDFLAGS="$(TARGET_LDFLAGS) $(SCONESERVER_LDFLAGS)"

ifeq ($(BR2_PACKAGE_LIBXML2),y)
SCONESERVER_CXXFLAGS += -I$(STAGING_DIR)/usr/include/libxml2
endif

(Actually, this pattern should move to TARGET_CFLAGS itself...  Yet another
item on my ideas list :-)


  The mysql flags should move to the rest of the mysql stuff, so you have the
condition only once.


  I tried building the mysql module and it also fails to find mysql.h.  Turns
out that the configure script hard-codes -I/usr/include/mysql instead of using
the sysrooted path.  I'm not sure how to fix it elegantly.  Adding a -I
option to the CXXFLAGS works, but you still get a -I/usr/include/mysql which
may cause problems...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
