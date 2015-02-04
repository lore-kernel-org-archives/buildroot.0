From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Feb 2015 16:40:05 +0100
Subject: [Buildroot] [PATCH 1/1] dropbear: add extra build customization
 options
In-Reply-To: <54D23C3E.20300@je-eigen-domein.nl>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
 <20150203150437.7d27225c@free-electrons.com>
 <54D23C3E.20300@je-eigen-domein.nl>
Message-ID: <20150204164005.71f80cb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed, 04 Feb 2015 16:35:26 +0100, Floris Bos wrote:

> Dropbear's SSH client is called dbclient.
> The extra "ssh" convenience symlink is something non-standard the 
> buildroot package made up.
> One cannot pass a $(DROPBEAR_TARGET_BINS) containing "ssh" to the 
> $(MAKE) call, as upstream dropbear has no clue how to make "ssh"

Ok, but then you can still have two separate variables for the
TARGET_BINS and the PROGRAMS, but not have duplication between the
server+client, and server only cases.

Or even:

DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp

ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
DROPBEAR_TARGET_BINS += dbclient ssh
endif

...
	# Here some comment to explain why we filter out ssh
	$(MAKE) MULTI=1 SCPPROGRESS=1 \
		PROGRAMS=$(filter-out ssh,$(DROPBEAR_TARGET_BINS))
...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
