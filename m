From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jan 2011 17:10:27 +0100
Subject: [Buildroot] Problem building avahi
In-Reply-To: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
Message-ID: <20110105171027.1e64ffe6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Wed, 5 Jan 2011 15:20:55 +0100
"Andreas Stahl" <a.stahl@wsa-electronic.de> wrote:

> I cannot build the avahi package on buildroot-2010.11
> my steps:
> - download and extract buildroot-2010.11.tar.bz2
> - cd to the buildroot-2010.11 directory
> - make atngw100_defconfig
> - make

For what it's worth, on my system, this exact set of commands produces
a working build, which includes avahi.

> '/usr/buildroot-2010.11/output/build/avahi-0.6.27/avahi-glib'

This path seems to indicate that you might be running Buildroot as
root. You should not do this.

And in fact I think it's precisely because you're building somewhere
in /usr that things break. In order to workaround libtool oddness, we
have a mechanism in Buildroot that modifies .la files by replacing:

 /usr

by

 $(STAGING_DIR)/usr

But in your case, since your $(STAGING_DIR) starts by /usr, the rule
gets executed over and over and over again, so the path goes like this:

 /usr
 $(STAGING_DIR)/usr
 $(STAGING_DIR)/$(STAGING_DIR)/usr
 $(STAGING_DIR)/$(STAGING_DIR)/$(STAGING_DIR)/usr

etc.

So as a quick fix you can just not build from /usr, and build from
$HOME, as a normal user. Long term, we should improve our sed
expression to not fall into this.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
